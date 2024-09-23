@implementation PDFDetectedForm

- (PDFDetectedForm)initWithPage:(id)a3 displayBox:(int64_t)a4
{
  id v6;
  PDFDetectedForm *v7;
  PDFDetectedForm *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PDFDetectedForm *v17;
  PDFDetectedFormRow *begin;
  PDFDetectedFormRow *end;
  PDFDetectedFormRow *v20;
  PDFDetectedFormRow *v21;
  unint64_t v22;
  id *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  PDFDetectedForm *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *__p;
  void *v34;
  uint64_t v35;
  void *v36;
  _BYTE *v37;
  _QWORD v38[2];
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PDFDetectedForm;
  v7 = -[PDFDetectedForm init](&v39, sel_init);
  if (!v7)
  {
LABEL_18:
    v8 = v7;
    goto LABEL_19;
  }
  v8 = (PDFDetectedForm *)objc_msgSend(v6, "createDisplayListForFormDetection");
  v38[1] = v8;
  if (v8)
  {
    v7->_displayBox = a4;
    objc_msgSend(v6, "boundsForBox:", a4);
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "boundsForBox:", 0);
    v14 = v13;
    v16 = v15;
    v38[0] = 0;
    -[PDFDetectedForm _collectGlyphEntriesInDisplayList:medianGlyphHeight:](v7, "_collectGlyphEntriesInDisplayList:medianGlyphHeight:", v8, v38);
    v25 = MEMORY[0x24BDAC760];
    v26 = 3321888768;
    v27 = __43__PDFDetectedForm_initWithPage_displayBox___block_invoke;
    v28 = &unk_24C25BF70;
    v30 = v10 - v14;
    v31 = v12 - v16;
    v17 = v7;
    v29 = v17;
    v32 = v38[0];
    v34 = 0;
    v35 = 0;
    __p = 0;
    std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(&__p, v36, (uint64_t)v37, (v37 - (_BYTE *)v36) >> 3);
    CGDisplayListEnumerateEntriesWithOptions();
    begin = v17->_rows.__begin_;
    end = v17->_rows.__end_;
    if (begin == end)
      goto LABEL_12;
    do
    {
      PDFDetectedFormRow::mergeFields(begin);
      begin = (PDFDetectedFormRow *)((char *)begin + 32);
    }
    while (begin != end);
    v20 = v17->_rows.__begin_;
    v21 = v17->_rows.__end_;
    if (v21 == v20)
    {
LABEL_12:
      v22 = 0;
    }
    else
    {
      v22 = 0;
      do
      {
        v23 = (id *)*((_QWORD *)v21 - 3);
        if (v23 != *((id **)v21 - 2))
        {
          do
            objc_msgSend(*v23++, "setIndex:", v22++, v25, v26, v27, v28, v29, *(_QWORD *)&v30, *(_QWORD *)&v31, v32);
          while (v23 != *((id **)v21 - 2));
          v20 = v17->_rows.__begin_;
        }
        v21 = (PDFDetectedFormRow *)((char *)v21 - 32);
      }
      while (v21 != v20);
    }
    v17->_fieldCount = v22;
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }

    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    CFRelease(v8);
    goto LABEL_18;
  }
LABEL_19:

  return v8;
}

void __43__PDFDetectedForm_initWithPage_displayBox___block_invoke(uint64_t a1)
{
  uint64_t Path;
  const CGPath *v3;
  CGSize v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v9;
  uint64_t v10;
  CGFloat MidY;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  BOOL v22;
  CGGlyph glyphs;
  __int16 v24;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGRect v28;
  __int128 v29;
  CGRect recta;
  __int128 v31;
  CGAffineTransformComponents v32;
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v33 = *MEMORY[0x24BDAC8D0];
  CGDisplayListEntryGetBoundingBox();
  if (!CGRectIsEmpty(v34))
  {
    if (CGDisplayListEntryGetType() == 2)
    {
      Path = CGDisplayListEntryPathGetPath();
      if (Path)
      {
        v3 = (const CGPath *)Path;
        v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
        v28.origin = (CGPoint)*MEMORY[0x24BDBF070];
        v28.size = v4;
        if (CGPathIsLine() && v32.scale.height == v32.rotation)
        {
          v28.origin = (CGPoint)v32.scale;
          v28.size = (CGSize)COERCE_UNSIGNED_INT64(v32.horizontalShear - v32.scale.width);
        }
        else if (CGPathIsRect(v3, &recta))
        {
          v28 = recta;
        }
        if (!CGRectIsNull(v28))
        {
          v35 = CGRectOffset(v28, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
          x = v35.origin.x;
          y = v35.origin.y;
          width = v35.size.width;
          height = v35.size.height;
          v28 = v35;
          v9 = objc_msgSend(*(id *)(a1 + 32), "_classifyRect:");
          v10 = v9;
          if (v9)
          {
            if (v9 != 1)
              goto LABEL_22;
            v36.origin.x = x;
            v36.origin.y = y;
            v36.size.width = width;
            v36.size.height = height;
            MidY = CGRectGetMidY(v36);
            v28.origin.y = MidY;
            v28.size.height = 0.0;
            v12 = *(double *)(a1 + 56);
            v13 = (void *)objc_opt_new();
            v14 = *(_QWORD *)(a1 + 64);
            v15 = *(_QWORD *)(a1 + 72);
            if (v14 != v15)
            {
              v16 = ceil(v12);
              do
              {
                CGDisplayListEntryGetBoundingBox();
                v42.origin.x = x;
                v42.origin.y = MidY;
                v42.size.width = width;
                v42.size.height = v16;
                v38 = CGRectIntersection(v37, v42);
                v17 = v38.origin.x;
                v18 = v38.origin.y;
                v19 = v38.size.width;
                v20 = v38.size.height;
                if (!CGRectIsNull(v38))
                {
                  v39.origin.x = v17;
                  v39.origin.y = v18;
                  v39.size.width = v19;
                  v39.size.height = v20;
                  v40 = CGRectIntegral(v39);
                  objc_msgSend(v13, "addIndexesInRange:", (unint64_t)v40.origin.x, (unint64_t)v40.size.width);
                }
                v14 += 8;
              }
              while (v14 != v15);
            }
            v41.size.height = 0.0;
            v41.origin.x = x;
            v41.origin.y = MidY;
            v41.size.width = width;
            v21 = CGRectGetWidth(v41);
            v22 = v21 - (double)(unint64_t)objc_msgSend(v13, "count") >= 20.0;

            if (v22)
LABEL_22:
              objc_msgSend(*(id *)(a1 + 32), "_insertFieldRect:ofKind:", &v28, v10);
          }
        }
      }
    }
    else if (CGDisplayListEntryGetType() == 1)
    {
      v31 = 0u;
      memset(&recta, 0, sizeof(recta));
      CGDisplayListEntryGlyphsGetCTM();
      v29 = 0u;
      memset(&v28, 0, sizeof(v28));
      CGDisplayListEntryGlyphsGetFTM();
      memset(&v32, 0, sizeof(v32));
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformConcat(&transform, &t1, &t2);
      CGAffineTransformDecompose(&v32, &transform);
      if (fabs(v32.rotation) <= 2.22044605e-14)
      {
        if (CGDisplayListEntryGlyphsGetFont())
        {
          v24 = 95;
          glyphs = 0;
          CGFontGetGlyphsForUnichars();
        }
      }
    }
  }
}

- (id)detectedFormFieldNearestPoint:(CGPoint)a3
{
  PDFDetectedFormRow *end;
  PDFDetectedFormRow *begin;
  double x;
  unint64_t v6;
  double *v7;
  unint64_t v8;
  double *v9;
  double *v10;
  double v11;
  id *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  if (begin == end)
    goto LABEL_20;
  x = a3.x;
  v6 = (end - begin) >> 5;
  v7 = (double *)self->_rows.__begin_;
  do
  {
    v8 = v6 >> 1;
    v9 = &v7[4 * (v6 >> 1)];
    v11 = *v9;
    v10 = v9 + 4;
    v6 += ~(v6 >> 1);
    if (v11 < a3.y)
      v7 = v10;
    else
      v6 = v8;
  }
  while (v6);
  if (v7 == (double *)end)
  {
    begin = (PDFDetectedFormRow *)((char *)end - 32);
  }
  else if (v7 != (double *)begin)
  {
    begin = (PDFDetectedFormRow *)v7;
    if (vabdd_f64(a3.y, *v7) >= vabdd_f64(a3.y, *(v7 - 4)))
      begin = (PDFDetectedFormRow *)(v7 - 4);
  }
  if (*((_QWORD *)begin + 2) == *((_QWORD *)begin + 1)
    || vabdd_f64(a3.y, *(double *)begin) > 20.0
    || (v12 = PDFDetectedFormRow::fieldNearestXCoordinate(begin, a3.x), *((id **)begin + 2) == v12))
  {
LABEL_20:
    v18 = 0;
  }
  else
  {
    v13 = *v12;
    objc_msgSend(v13, "minX");
    if (x >= v14 && (objc_msgSend(v13, "maxX"), x < v15)
      || (objc_msgSend(v13, "minX"), vabdd_f64(x, v16) <= 20.0)
      || (objc_msgSend(v13, "maxX"), vabdd_f64(x, v17) <= 20.0))
    {
      v18 = v13;
    }
    else
    {
      v18 = 0;
    }

  }
  return v18;
}

- (unint64_t)count
{
  return self->_fieldCount;
}

- (id)detectedFormFieldAtIndex:(unint64_t)a3
{
  PDFDetectedFormRow *end;
  PDFDetectedFormRow *begin;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  if (end == begin)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = a3 - v5;
    if (a3 >= v5)
      break;
    v5 += (uint64_t)(*((_QWORD *)end - 2) - *((_QWORD *)end - 3)) >> 3;
LABEL_6:
    end = (PDFDetectedFormRow *)((char *)end - 32);
    if (end == begin)
      return 0;
  }
  v7 = *((_QWORD *)end - 3);
  v5 += (*((_QWORD *)end - 2) - v7) >> 3;
  if (v5 <= a3)
    goto LABEL_6;
  return *(id *)(v7 + 8 * v6);
}

- (void)_insertFieldRect:(const CGRect *)a3 ofKind:(int64_t)a4
{
  double MidY;
  PDFDetectedFormRow *end;
  PDFDetectedFormRow *begin;
  uint64_t *p_rows;
  unint64_t v11;
  unint64_t v12;
  double *v13;
  PDFDetectedFormRow *v14;
  double v15;
  PDFDetectedFormField *v16;
  double v17;
  _QWORD v18[3];
  void **v19;

  MidY = CGRectGetMidY(*a3);
  begin = self->_rows.__begin_;
  end = self->_rows.__end_;
  p_rows = (uint64_t *)&self->_rows;
  if (end == begin)
  {
    begin = end;
  }
  else
  {
    v11 = (end - begin) >> 5;
    do
    {
      v12 = v11 >> 1;
      v13 = (double *)((char *)begin + 32 * (v11 >> 1));
      v15 = *v13;
      v14 = (PDFDetectedFormRow *)(v13 + 4);
      v11 += ~(v11 >> 1);
      if (v15 < MidY)
        begin = v14;
      else
        v11 = v12;
    }
    while (v11);
  }
  if (end == begin || *(double *)begin != MidY)
  {
    v17 = MidY;
    memset(v18, 0, sizeof(v18));
    begin = (PDFDetectedFormRow *)std::vector<PDFDetectedFormRow>::insert(p_rows, (uint64_t)begin, (uint64_t)&v17);
    v19 = (void **)v18;
    std::vector<PDFDetectedFormField * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v19);
  }
  v16 = -[PDFDetectedFormField initWithRect:andKind:]([PDFDetectedFormField alloc], "initWithRect:andKind:", a4, a3->origin.x, a3->origin.y, a3->size.width, a3->size.height);
  PDFDetectedFormRow::insertField(begin, v16);

}

- (vector<const)_collectGlyphEntriesInDisplayList:(PDFDetectedForm *)self medianGlyphHeight:(SEL)a3
{
  unint64_t NumberOfEntriesOfType;
  unint64_t v8;
  uint64_t *v9;
  vector<const CGDisplayListEntry *, std::allocator<const CGDisplayListEntry *>> *result;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __n128 (*v14)(__n128 *, __n128 *);
  void (*v15)(uint64_t);
  void *v16;
  void *__p;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _QWORD *(*v23)(_QWORD *, _QWORD *);
  void (*v24)(uint64_t);
  void *v25;
  _QWORD **v26;
  _QWORD *v27[2];
  double *v28;

  v20 = 0;
  v21 = &v20;
  v22 = 0x4812000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v27[0] = 0;
  v27[1] = 0;
  v25 = &unk_209DCC48F;
  v26 = v27;
  v11 = 0;
  v12 = &v11;
  v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__48;
  v15 = __Block_byref_object_dispose__49;
  v16 = &unk_209DCC48F;
  __p = 0;
  v18 = 0;
  v19 = 0;
  NumberOfEntriesOfType = CGDisplayListGetNumberOfEntriesOfType();
  std::vector<CGDisplayListEntry const*>::reserve(&__p, NumberOfEntriesOfType);
  CGDisplayListEnumerateEntriesWithOptions();
  v8 = v21[8];
  if (v8)
  {
    v28 = (double *)v21[6];
    std::__advance[abi:ne180100]<std::__tree_const_iterator<double,std::__tree_node<double,void *> *,long>>((_QWORD **)&v28, v8 >> 1);
    *a5 = v28[4];
  }
  v9 = v12;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<CGDisplayListEntry const*>::__init_with_size[abi:ne180100]<CGDisplayListEntry const**,CGDisplayListEntry const**>(retstr, (const void *)v9[6], v9[7], (v9[7] - v9[6]) >> 3);
  _Block_object_dispose(&v11, 8);
  if (__p)
  {
    v18 = __p;
    operator delete(__p);
  }
  _Block_object_dispose(&v20, 8);
  std::__tree<double>::destroy((uint64_t)&v26, v27[0]);
  return result;
}

void __71__PDFDetectedForm__collectGlyphEntriesInDisplayList_medianGlyphHeight___block_invoke(uint64_t a1, uint64_t a2)
{
  CGFont *Font;
  double v5;
  double v6;
  double width;
  double height;
  double UnitsPerEm;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  CGAffineTransformComponents v25;
  CGAffineTransform v26;
  CGAffineTransformComponents v27;
  CGAffineTransform transform;
  CGAffineTransformComponents v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;
  CGAffineTransformComponents v33;
  float64x2_t scale;
  float64x2_t v35;
  CGVector translation;
  CGRect v37;
  CGRect FontBBox;

  if (CGDisplayListEntryGetType() == 1)
  {
    CGDisplayListEntryGetBoundingBox();
    if (!CGRectIsEmpty(v37))
    {
      v35 = 0u;
      translation = (CGVector)0;
      scale = 0u;
      CGDisplayListEntryGlyphsGetCTM();
      memset(&v33, 0, sizeof(v33));
      CGDisplayListEntryGlyphsGetFTM();
      memset(&v32, 0, sizeof(v32));
      memset(&t1, 0, sizeof(t1));
      memset(&t2, 0, sizeof(t2));
      CGAffineTransformConcat(&v32, &t1, &t2);
      Font = (CGFont *)CGDisplayListEntryGlyphsGetFont();
      CGDisplayListEntryGlyphsGetScale();
      v6 = v5;
      FontBBox = CGFontGetFontBBox(Font);
      width = FontBBox.size.width;
      height = FontBBox.size.height;
      UnitsPerEm = (double)CGFontGetUnitsPerEm(Font);
      transform = v32;
      memset(&v29, 0, sizeof(v29));
      CGAffineTransformDecompose(&v29, &transform);
      if (fabs(v29.rotation) > 2.22044605e-14)
      {
        *(float64x2_t *)&v26.a = scale;
        *(float64x2_t *)&v26.c = v35;
        *(CGVector *)&v26.tx = translation;
        CGAffineTransformDecompose(&v27, &v26);
        v29 = v27;
        CGAffineTransformMakeScale((CGAffineTransform *)&v27, fabs(v27.scale.width), fabs(v27.scale.height));
        scale = (float64x2_t)v27.scale;
        v35 = *(float64x2_t *)&v27.horizontalShear;
        translation = v27.translation;
        v25 = v33;
        CGAffineTransformDecompose(&v27, (CGAffineTransform *)&v25);
        v29 = v27;
        CGAffineTransformMakeScale((CGAffineTransform *)&v27, fabs(v27.scale.width), fabs(v27.scale.height));
        v33 = v27;
      }
      CGAffineTransformMakeScale((CGAffineTransform *)&v27, v6 / UnitsPerEm * v33.scale.width, v6 / UnitsPerEm * v33.rotation);
      v32 = (CGAffineTransform)v27;
      v27.scale = (CGSize)vmlaq_n_f64(vmulq_n_f64(v35, height * v27.rotation + v27.scale.height * width), scale, height * v27.horizontalShear + v27.scale.width * width);
      std::__tree<double>::__emplace_unique_key_args<double,double const&>((uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), &v27.scale.height, (uint64_t *)&v27.scale.height);
      v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v11 = (_QWORD *)v10[7];
      v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        v14 = v10[6];
        v15 = ((uint64_t)v11 - v14) >> 3;
        if ((unint64_t)(v15 + 1) >> 61)
          std::vector<PDFDetectedFormField * {__strong}>::__throw_length_error[abi:ne180100]();
        v16 = v12 - v14;
        v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1))
          v17 = v15 + 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PDFDetectedFormField * {__strong}>>((uint64_t)(v10 + 8), v18);
        else
          v19 = 0;
        v20 = &v19[8 * v15];
        v21 = &v19[8 * v18];
        *(_QWORD *)v20 = a2;
        v13 = v20 + 8;
        v23 = (char *)v10[6];
        v22 = (char *)v10[7];
        if (v22 != v23)
        {
          do
          {
            v24 = *((_QWORD *)v22 - 1);
            v22 -= 8;
            *((_QWORD *)v20 - 1) = v24;
            v20 -= 8;
          }
          while (v22 != v23);
          v22 = (char *)v10[6];
        }
        v10[6] = v20;
        v10[7] = v13;
        v10[8] = v21;
        if (v22)
          operator delete(v22);
      }
      else
      {
        *v11 = a2;
        v13 = v11 + 1;
      }
      v10[7] = v13;
    }
  }
}

- (int64_t)_classifyRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v10;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = CGRectGetWidth(a3);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = CGRectGetHeight(v14);
  if (v8 <= 2.0 && v7 >= 20.0)
    return 1;
  v10 = v7 / v8;
  if (v8 >= 16.0 && v10 > 3.0)
    return 2;
  if (v10 > 1.0 || v10 < 0.75 || v8 > 24.0 || v8 < 16.0)
    return 0;
  else
    return 2;
}

- (int64_t)displayBox
{
  return self->_displayBox;
}

- (void).cxx_destruct
{
  vector<PDFDetectedFormRow, std::allocator<PDFDetectedFormRow>> *p_rows;

  p_rows = &self->_rows;
  std::vector<PDFDetectedFormRow>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_rows);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
