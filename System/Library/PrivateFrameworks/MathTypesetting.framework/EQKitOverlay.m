@implementation EQKitOverlay

- (EQKitOverlay)initWithLayout:(id)a3 scale:(double)a4
{
  EQKitOverlay *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EQKitOverlay;
  v6 = -[EQKitOverlay init](&v12, sel_init);
  if (v6)
  {
    v6->_overlayBoxes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6->_box = (EQKitBox *)objc_msgSend(a3, "box");
    objc_msgSend(a3, "erasableBounds");
    v6->_erasableBounds.origin.y = v7;
    v6->_erasableBounds.size.width = v8;
    v6->_erasableBounds.size.height = v9;
    v6->_scale = a4;
    v6->_erasableBounds.origin.x = v10;
  }
  return v6;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  NSMutableArray *overlayBoxes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  y = a4.y;
  x = a4.x;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  overlayBoxes = self->_overlayBoxes;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBoxes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(overlayBoxes);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "renderIntoContext:offset:", a3, x, y);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](overlayBoxes, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)addOverlayBox:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  EQKitPaddedBox *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = [EQKitPaddedBox alloc];
  objc_msgSend(a3, "height");
  v10 = v9;
  objc_msgSend(a3, "width");
  v12 = v11;
  objc_msgSend(a3, "depth");
  -[NSMutableArray addObject:](self->_overlayBoxes, "addObject:", -[EQKitPaddedBox initWithBox:height:width:depth:lspace:voffset:](v8, "initWithBox:height:width:depth:lspace:voffset:", a3, v10, v12, v13, x, y));
}

- (void)addErasableBounds
{
  CGPath *Mutable;
  CGColorSpace *v4;
  CGColor *v5;
  EQKitPathBox *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  Mutable = CGPathCreateMutable();
  CGPathAddRect(Mutable, 0, self->_erasableBounds);
  v8 = xmmword_241212070;
  v9 = unk_241212080;
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
  v5 = CGColorCreate(v4, (const CGFloat *)&v8);
  CGColorSpaceRelease(v4);
  v6 = [EQKitPathBox alloc];
  v7 = -[EQKitPathBox initWithCGPath:height:cgColor:drawingMode:lineWidth:](v6, "initWithCGPath:height:cgColor:drawingMode:lineWidth:", Mutable, v5, 2, 0.0, 1.0 / self->_scale, v8, v9);
  -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", v7, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  CGColorRelease(v5);
  CGPathRelease(Mutable);
}

- (void)addOpticalAlignWithMinimumDistance:(double)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[EQKitOverlay pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:](self, "pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:", self->_box, self->_box, a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = (double *)MEMORY[0x24BDBEFB0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), *v8, v8[1]);
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (id)pLineBoxFrom:(CGPoint)a3 to:(CGPoint)a4 withWithRGBA:(double *)a5 scale:(double)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id result;
  CGPath *v13;
  CGColorSpace *v14;
  CGColor *v15;
  EQKitPathBox *v16;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  result = CGPathCreateMutable();
  if (result)
  {
    v13 = (CGPath *)result;
    CGPathMoveToPoint((CGMutablePathRef)result, 0, v11, v10);
    CGPathAddLineToPoint(v13, 0, x, y);
    v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
    v15 = CGColorCreate(v14, a5);
    CGColorSpaceRelease(v14);
    v16 = -[EQKitPathBox initWithCGPath:height:cgColor:drawingMode:lineWidth:]([EQKitPathBox alloc], "initWithCGPath:height:cgColor:drawingMode:lineWidth:", v13, v15, 2, 0.0, 1.0 / a6);
    CGColorRelease(v15);
    CGPathRelease(v13);
    return v16;
  }
  return result;
}

- (id)pOpticalAlignOverlayBoxesForBox:(id)a3 topLevelBox:(id)a4 minDistance:(double)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  double *v16;
  uint64_t i;
  void *v18;
  int isDistanceSmallerThanThreshold;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  void *__p;
  double *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  void **v33;
  uint64_t v34;
  char v35[8];
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44[3];
  int v45;
  uint64_t v46[3];
  int v47;
  _BYTE v48[32];
  _OWORD v49[2];
  _OWORD v50[2];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  EQKitPath::QuantizationConfig::QuantizationConfig((EQKitPath::QuantizationConfig *)v48);
  v9 = objc_opt_class();
  v10 = (void *)EQKitUtilDynamicCast(v9, (uint64_t)a3);
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(v46, 0, sizeof(v46));
  v47 = 0;
  memset(v44, 0, sizeof(v44));
  v45 = 2;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = (void *)objc_msgSend(v10, "childBoxes");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v41;
    v16 = (double *)MEMORY[0x24BDBEFB0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v37 = 0u;
        if (a4)
          objc_msgSend(a4, "transformFromDescendant:", v18);
        if ((v14 & 1) != 0)
        {
          std::vector<EQKit::OpticalKern::Spec::Entry>::resize(v46, 0);
          if (!objc_msgSend(v18, "appendOpticalAlignToSpec:offset:", v46, *(double *)&v39 + v16[1] * *(double *)&v38 + *(double *)&v37 * *v16, *((double *)&v39 + 1) + v16[1] * *((double *)&v38 + 1) + *((double *)&v37 + 1) * *v16))
          {
            v14 = 1;
            goto LABEL_24;
          }
          EQKit::OpticalKern::Edge::Composite::Composite(v35, v46, v48, 0);
          EQKit::OpticalKern::Edge::Composite::Composite(&v33, v44, v48, 0);
          v31 = *(_OWORD *)v16;
          v32 = v31;
          __p = 0;
          v29 = 0;
          v30 = 0;
          v27 = 0;
          isDistanceSmallerThanThreshold = EQKit::OpticalKern::Edge::Composite::isDistanceSmallerThanThreshold((int *)&v33, (uint64_t)v35, (double *)&v27, (double *)&v31, &__p, a5);
          NSLog(CFSTR("move offset = %f"), v27);
          v20 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)v35, self->_scale);
          if (v20)
            objc_msgSend(v11, "addObject:", v20);
          v21 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)&v33, self->_scale);
          if (v21)
            objc_msgSend(v11, "addObject:", v21);
          if (isDistanceSmallerThanThreshold)
          {
            v50[0] = xmmword_241212090;
            v50[1] = unk_2412120A0;
            v49[0] = xmmword_2412120B0;
            v49[1] = unk_2412120C0;
            v23 = (double *)__p;
            v22 = v29;
            while (v23 != v22)
            {
              objc_msgSend(v11, "addObject:", -[EQKitOverlay pLineBoxFrom:to:withWithRGBA:scale:](self, "pLineBoxFrom:to:withWithRGBA:scale:", v50, *v23, v23[1], v23[2], v23[3], self->_scale));
              v22 = v29;
              v23 += 4;
            }
            objc_msgSend(v11, "addObject:", -[EQKitOverlay pLineBoxFrom:to:withWithRGBA:scale:](self, "pLineBoxFrom:to:withWithRGBA:scale:", v49, v31, *(double *)&v32, *((double *)&v32 + 1), self->_scale * 0.5));
          }
          if (__p)
          {
            v29 = (double *)__p;
            operator delete(__p);
          }
          *(_QWORD *)&v31 = &v34;
          std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
          v33 = (void **)&v36;
          std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100](&v33);
        }
        std::vector<EQKit::OpticalKern::Spec::Entry>::resize(v44, 0);
        v14 = objc_msgSend(v18, "appendOpticalAlignToSpec:offset:", v44, *(double *)&v39 + v16[1] * *(double *)&v38 + *(double *)&v37 * *v16, *((double *)&v39 + 1) + v16[1] * *((double *)&v38 + 1) + *((double *)&v37 + 1) * *v16);
LABEL_24:
        v24 = objc_opt_class();
        v25 = EQKitUtilDynamicCast(v24, (uint64_t)v18);
        if (v25)
          objc_msgSend(v11, "addObjectsFromArray:", -[EQKitOverlay pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:](self, "pOpticalAlignOverlayBoxesForBox:topLevelBox:minDistance:", v25, a4, a5));
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v13);
  }
  *(_QWORD *)&v37 = v44;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  *(_QWORD *)&v37 = v46;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  return v11;
}

- (void)addOpticalAlignForEdge:(unsigned int)a3 config:(id)a4
{
  double *v6;
  void *v7;
  char v8;
  uint64_t v9;
  char v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *__p;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  _QWORD v34[3];
  unsigned int v35;
  void **v36;

  memset(v34, 0, sizeof(v34));
  v35 = a3;
  v6 = (double *)MEMORY[0x24BDBEFB0];
  -[EQKitBox appendOpticalAlignToSpec:offset:](self->_box, "appendOpticalAlignToSpec:offset:", v34, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  if (objc_msgSend(a4, "length"))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", a4);
    __p = 0;
    v30 = 0;
    v31 = 0;
    while ((objc_msgSend(v7, "isAtEnd") & 1) == 0)
    {
      v27 = 0;
      v8 = objc_msgSend(v7, "scanInteger:", &v27);
      v9 = v27;
      v10 = v27 >= 0 ? v8 : 0;
      if ((v10 & 1) == 0)
        break;
      v11 = v30;
      if ((unint64_t)v30 >= v31)
      {
        v13 = __p;
        v14 = ((char *)v30 - (_BYTE *)__p) >> 3;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        v16 = v31 - (_QWORD)__p;
        if ((uint64_t)(v31 - (_QWORD)__p) >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v31, v17);
          v13 = __p;
          v11 = v30;
        }
        else
        {
          v18 = 0;
        }
        v19 = (uint64_t *)&v18[8 * v14];
        *v19 = v9;
        v12 = v19 + 1;
        while (v11 != v13)
        {
          v20 = *--v11;
          *--v19 = v20;
        }
        __p = v19;
        v30 = v12;
        v31 = (unint64_t)&v18[8 * v17];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *v30 = v27;
        v12 = v11 + 1;
      }
      v30 = v12;
    }
    if (objc_msgSend(v7, "isAtEnd"))
    {
      v21 = v34[0];
      v22 = (_QWORD *)operator new();
      *v22 = 0;
      v22[1] = 0;
      v22[2] = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v22, __p, (uint64_t)v30, ((char *)v30 - (_BYTE *)__p) >> 3);
      std::shared_ptr<std::vector<unsigned long> const>::shared_ptr[abi:ne180100]<std::vector<unsigned long>,void>(&v32, (uint64_t)v22);
      std::shared_ptr<EQKit::OpticalKern::Edge::Path const>::operator=[abi:ne180100]<EQKit::OpticalKern::Edge::Path,void>((_QWORD *)(v21 + 56), &v32);
      v23 = v33;
      if (v33)
      {
        p_shared_owners = (unint64_t *)&v33->__shared_owners_;
        do
          v25 = __ldaxr(p_shared_owners);
        while (__stlxr(v25 - 1, p_shared_owners));
        if (!v25)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
    }
    if (__p)
    {
      v30 = __p;
      operator delete(__p);
    }
  }
  EQKitPath::QuantizationConfig::QuantizationConfig((EQKitPath::QuantizationConfig *)&__p);
  EQKitPath::QuantizationConfig::setThresholdCurveControlPointDistance((uint64_t)&__p, -1.0);
  EQKit::OpticalKern::Edge::Composite::Composite(&v27, v34, &__p, 0);
  v26 = _pathBoxForCompositeEdge((const EQKit::OpticalKern::Edge::Composite *)&v27, self->_scale);
  if (v26)
    -[EQKitOverlay addOverlayBox:offset:](self, "addOverlayBox:offset:", v26, *v6, v6[1]);
  v36 = (void **)&v28;
  std::vector<std::shared_ptr<EQKit::OpticalKern::Edge::Segment const>>::__destroy_vector::operator()[abi:ne180100](&v36);
  __p = v34;
  std::vector<EQKit::OpticalKern::Spec::Entry>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
}

- (NSMutableArray)overlayBoxes
{
  return self->_overlayBoxes;
}

- (EQKitBox)box
{
  return self->_box;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_erasableBounds.origin.x;
  y = self->_erasableBounds.origin.y;
  width = self->_erasableBounds.size.width;
  height = self->_erasableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end
