@implementation CGRenderer

- (CGRenderer)init
{
  CGRenderer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CGRenderer;
  result = -[CGRenderer init](&v3, sel_init);
  if (result)
  {
    result->direction = 1;
    result->separation = (CGSize)xmmword_192494BD0;
    result->drawEdgesFirst = 1;
  }
  return result;
}

- (void)dealloc
{
  CGContext *context;
  objc_super v4;

  context = self->context;
  if (context)
    CGContextRelease(context);
  v4.receiver = self;
  v4.super_class = (Class)CGRenderer;
  -[CGRenderer dealloc](&v4, sel_dealloc);
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  return 0;
}

- (CGColor)_colorForNodeColor:(int)a3
{
  if (-[CGRenderer _colorForNodeColor:]::onceToken != -1)
    dispatch_once(&-[CGRenderer _colorForNodeColor:]::onceToken, &__block_literal_global_33);
  if (a3 >= 0x10)
    -[CGRenderer _colorForNodeColor:].cold.1();
  return *(CGColor **)off_1E2EC3E60[a3];
}

CGColorRef __33__CGRenderer__colorForNodeColor___block_invoke()
{
  CGColorRef result;

  -[CGRenderer _colorForNodeColor:]::gray = (uint64_t)CGColorCreateWithHex(0xCCCCCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::dark = (uint64_t)CGColorCreateWithHex(0x999999FFuLL);
  -[CGRenderer _colorForNodeColor:]::light = (uint64_t)CGColorCreateWithHex(0xD3D3D3FFuLL);
  -[CGRenderer _colorForNodeColor:]::red = (uint64_t)CGColorCreateWithHex(0xFFCCCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::redAlt = (uint64_t)CGColorCreateWithHex(0xFFDDDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::green = (uint64_t)CGColorCreateWithHex(0xCCFFCCFFuLL);
  -[CGRenderer _colorForNodeColor:]::greenAlt = (uint64_t)CGColorCreateWithHex(0xDDFFDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::yellow = (uint64_t)CGColorCreateWithHex(0xFFFFAAFFuLL);
  -[CGRenderer _colorForNodeColor:]::yellowAlt = (uint64_t)CGColorCreateWithHex(0xFFFFDDFFuLL);
  -[CGRenderer _colorForNodeColor:]::blue = (uint64_t)CGColorCreateWithHex(0xCCCCFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::blueAlt = (uint64_t)CGColorCreateWithHex(0xDDDDFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::magenta = (uint64_t)CGColorCreateWithHex(0xFFAAFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::magentaAlt = (uint64_t)CGColorCreateWithHex(0xFFDDFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::cyan = (uint64_t)CGColorCreateWithHex(0xCCFFFFFFuLL);
  -[CGRenderer _colorForNodeColor:]::cyanAlt = (uint64_t)CGColorCreateWithHex(0xDDFFFFFFuLL);
  result = CGColorCreateWithHex(0xFF88CCFFuLL);
  -[CGRenderer _colorForNodeColor:]::hotPink = (uint64_t)result;
  return result;
}

- (void)_drawNodeContent:(id)x2_0
{
  int v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPathRef v11;
  CGPath *Mutable;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v20;
  CGFloat v21;
  double MaxX;
  double MinY;
  double MaxY;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGPath *v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGFloat MidY;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  const __CFAttributedString *v46;
  CGContext *context;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  _OWORD *v53;
  uint64_t i;
  CGImage *v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  __int128 v62;
  uint64_t v63;
  double v64;
  double v65;
  CGPattern *v66;
  CGColorSpace *Pattern;
  CGColor *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double x;
  double v76;
  double y;
  double v78;
  CGFloat width;
  double v80;
  CGFloat height;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t j;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  double v89;
  double v90;
  CGContext *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t k;
  CGContext *v96;
  id obj;
  double MinX;
  CGFloat v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  CGFloat components;
  CGAffineTransform matrix;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _BYTE v115[128];
  _BYTE v116[128];
  CGPatternCallbacks callbacks;
  _BYTE v118[128];
  uint64_t v119;
  CGSize v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v119 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(x2_0, "shape");
  v6 = objc_msgSend(x2_0, "color");
  objc_msgSend(x2_0, "contentCornerSize");
  v8 = v7;
  v10 = v9;
  CGContextSetFillColorWithColor(self->context, -[CGRenderer _colorForNodeColor:](self, "_colorForNodeColor:", v6));
  switch(v5)
  {
    case 0:
      objc_msgSend(x2_0, "contentFrame");
      v11 = CGPathCreateWithRect(v121, 0);
      goto LABEL_4;
    case 1:
      objc_msgSend(x2_0, "contentFrame");
      v17 = v13;
      v18 = v14;
      if (v15 * 0.5 < v8 || v16 * 0.5 < v10)
        goto LABEL_11;
      v20 = v15;
      v21 = v16;
      MinX = CGRectGetMinX(*(CGRect *)&v13);
      v123.origin.x = v17;
      v123.origin.y = v18;
      v123.size.width = v20;
      v123.size.height = v21;
      MaxX = CGRectGetMaxX(v123);
      v124.origin.x = v17;
      v124.origin.y = v18;
      v124.size.width = v20;
      v124.size.height = v21;
      MinY = CGRectGetMinY(v124);
      v125.origin.x = v17;
      v125.origin.y = v18;
      v125.size.width = v20;
      v125.size.height = v21;
      MaxY = CGRectGetMaxY(v125);
      v25 = v8 + MinX;
      v26 = MaxX - v8;
      v27 = v10 + MinY;
      v28 = MaxY - v10;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, MinX, v28);
      CGPathAddLineToPoint(Mutable, 0, v25, MaxY);
      CGPathAddLineToPoint(Mutable, 0, v26, MaxY);
      CGPathAddLineToPoint(Mutable, 0, MaxX, v28);
      CGPathAddLineToPoint(Mutable, 0, MaxX, v27);
      CGPathAddLineToPoint(Mutable, 0, v26, MinY);
      CGPathAddLineToPoint(Mutable, 0, v25, MinY);
      v29 = Mutable;
      v30 = MinX;
      v31 = v27;
      goto LABEL_13;
    case 2:
      objc_msgSend(x2_0, "contentFrame");
      v11 = CGPathCreateWithRoundedRect(v122, v8, v10, 0);
LABEL_4:
      Mutable = v11;
      goto LABEL_14;
    case 3:
      objc_msgSend(x2_0, "contentFrame");
      v36 = v32;
      if (v34 * 0.5 >= v8)
      {
        v37 = v33;
        v38 = v34;
        v39 = v35;
        v40 = CGRectGetMinX(*(CGRect *)&v32);
        v126.origin.x = v36;
        v126.origin.y = v37;
        v126.size.width = v38;
        v126.size.height = v39;
        v41 = CGRectGetMaxX(v126);
        v127.origin.x = v36;
        v127.origin.y = v37;
        v127.size.width = v38;
        v127.size.height = v39;
        v99 = CGRectGetMinY(v127);
        v128.origin.x = v36;
        v128.origin.y = v37;
        v128.size.width = v38;
        v128.size.height = v39;
        MidY = CGRectGetMidY(v128);
        v129.origin.x = v36;
        v129.origin.y = v37;
        v129.size.width = v38;
        v129.size.height = v39;
        v43 = CGRectGetMaxY(v129);
        v44 = v8 + v40;
        v45 = v41 - v8;
        Mutable = CGPathCreateMutable();
        CGPathMoveToPoint(Mutable, 0, v40, MidY);
        CGPathAddLineToPoint(Mutable, 0, v44, v43);
        CGPathAddLineToPoint(Mutable, 0, v45, v43);
        CGPathAddLineToPoint(Mutable, 0, v41, MidY);
        CGPathAddLineToPoint(Mutable, 0, v45, v99);
        v29 = Mutable;
        v30 = v44;
        v31 = v99;
LABEL_13:
        CGPathAddLineToPoint(v29, 0, v30, v31);
        CGPathCloseSubpath(Mutable);
      }
      else
      {
LABEL_11:
        Mutable = 0;
      }
LABEL_14:
      CGContextAddPath(self->context, Mutable);
      CGContextDrawPath(self->context, kCGPathFillStroke);
      CGPathRelease(Mutable);
      v46 = CFAttributedStringCreate(0, (CFStringRef)objc_msgSend(x2_0, "label"), +[CIGVNode textAttributesForLabel](CIGVNode, "textAttributesForLabel"));
      context = self->context;
      objc_msgSend(x2_0, "labelFrame");
      CGContextDrawAttributedString(context, v46, v130);
      CFRelease(v46);
      if (objc_msgSend(x2_0, "images"))
      {
        if (CFArrayGetCount((CFArrayRef)objc_msgSend(x2_0, "images")))
        {
          v48 = (void *)objc_msgSend(x2_0, "images");
          objc_msgSend(x2_0, "imagesFrame");
          v50 = v49;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v114 = 0u;
          obj = v48;
          v51 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v111, v118, 16);
          if (v51)
          {
            v52 = v51;
            v100 = *(_QWORD *)v112;
            v53 = (_OWORD *)MEMORY[0x1E0C9BAA8];
            do
            {
              for (i = 0; i != v52; ++i)
              {
                if (*(_QWORD *)v112 != v100)
                  objc_enumerationMutation(obj);
                v55 = *(CGImage **)(*((_QWORD *)&v111 + 1) + 8 * i);
                v56 = 0.5 * (double)CGImageGetWidth(v55);
                v57 = 0.5 * (double)CGImageGetHeight(v55);
                objc_msgSend(x2_0, "imagesFrame");
                v59 = (v58 - v57) * 0.5;
                objc_msgSend(x2_0, "imagesFrame");
                v61 = v60 + v59;
                *(_OWORD *)&callbacks.version = xmmword_1E2EC3E48;
                callbacks.releaseInfo = 0;
                v62 = v53[1];
                *(_OWORD *)&matrix.a = *v53;
                *(_OWORD *)&matrix.c = v62;
                *(_OWORD *)&matrix.tx = v53[2];
                v63 = 0;
                *(_QWORD *)&v62 = 0;
                v64 = 16.0;
                v65 = 16.0;
                v66 = CGPatternCreate(0, *(CGRect *)((char *)&v62 - 8), &matrix, 16.0, 16.0, kCGPatternTilingNoDistortion, 1, &callbacks);
                Pattern = CGColorSpaceCreatePattern(0);
                components = 1.0;
                v68 = CGColorCreateWithPattern(Pattern, v66, &components);
                CGColorSpaceRelease(Pattern);
                CGPatternRelease(v66);
                v120.width = v50;
                v120.height = v61;
                CGContextSetPatternPhase(self->context, v120);
                CGContextSetFillColorWithColor(self->context, v68);
                CGColorRelease(v68);
                v131.origin.x = v50;
                v131.origin.y = v61;
                v131.size.width = v56;
                v131.size.height = v57;
                CGContextFillRect(self->context, v131);
                v132.origin.x = v50;
                v132.origin.y = v61;
                v132.size.width = v56;
                v132.size.height = v57;
                CGContextDrawImage(self->context, v132, v55);
                v50 = v50 + v56 + 5.0;
              }
              v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v118, 16);
            }
            while (v52);
          }
        }
      }
      if (objc_msgSend(x2_0, "rois") && CFArrayGetCount((CFArrayRef)objc_msgSend(x2_0, "rois")))
      {
        objc_msgSend(x2_0, "roisFrame");
        v70 = v69;
        v72 = v71;
        v73 = (void *)objc_msgSend(x2_0, "rois");
        objc_msgSend(x2_0, "extent");
        x = v74;
        y = v76;
        width = v78;
        height = v80;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        v82 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
        if (v82)
        {
          v83 = v82;
          v84 = *(_QWORD *)v106;
          do
          {
            for (j = 0; j != v83; ++j)
            {
              if (*(_QWORD *)v106 != v84)
                objc_enumerationMutation(v73);
              v141.origin.x = rectFromValue(*(void **)(*((_QWORD *)&v105 + 1) + 8 * j));
              v141.origin.y = v86;
              v141.size.width = v87;
              v141.size.height = v88;
              v133.origin.x = x;
              v133.origin.y = y;
              v133.size.width = width;
              v133.size.height = height;
              v134 = CGRectUnion(v133, v141);
              x = v134.origin.x;
              y = v134.origin.y;
              width = v134.size.width;
              height = v134.size.height;
            }
            v83 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
          }
          while (v83);
        }
        v89 = v70 - x;
        v90 = v72 - y;
        CGContextSetStrokeColor(self->context, -[CGRenderer _drawNodeContent:]::black);
        objc_msgSend(x2_0, "extent");
        if (!CGRectIsNull(v135))
        {
          objc_msgSend(x2_0, "extent");
          if (!CGRectIsInfinite(v136))
          {
            *(_OWORD *)&callbacks.version = xmmword_192494BF0;
            CGContextSetLineDash(self->context, 0.0, (const CGFloat *)&callbacks.version, 2uLL);
            v91 = self->context;
            objc_msgSend(x2_0, "extent");
            v138 = CGRectOffset(v137, v89, v90);
            CGContextStrokeRect(v91, v138);
            CGContextSetLineDash(self->context, 0.0, 0, 0);
          }
        }
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        v92 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
        if (v92)
        {
          v93 = v92;
          v94 = *(_QWORD *)v102;
          do
          {
            for (k = 0; k != v93; ++k)
            {
              if (*(_QWORD *)v102 != v94)
                objc_enumerationMutation(v73);
              v139.origin.x = rectFromValue(*(void **)(*((_QWORD *)&v101 + 1) + 8 * k));
              v96 = self->context;
              v140 = CGRectOffset(v139, v89, v90);
              CGContextStrokeRect(v96, v140);
            }
            v93 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
          }
          while (v93);
        }
      }
      return;
    default:
      -[CGRenderer _drawNodeContent:].cold.1();
  }
}

- (void)_drawNodeBadge:(id)x2_0
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  const CGPath *v16;
  const __CFAttributedString *v17;
  CGContext *context;
  CGRect v19;
  CGRect v20;

  v5 = objc_msgSend(x2_0, "color");
  objc_msgSend(x2_0, "badgeFrame");
  v9 = v8;
  v11 = v10;
  v12 = v6;
  v13 = v7;
  if (v6 >= v7)
    v14 = v7;
  else
    v14 = v6;
  v15 = v14 * 0.5;
  CGContextSetFillColorWithColor(self->context, -[CGRenderer _colorForNodeColor:](self, "_colorForNodeColor:", v5));
  v19.origin.x = v9;
  v19.origin.y = v11;
  v19.size.width = v12;
  v19.size.height = v13;
  v16 = CGPathCreateWithRoundedRect(v19, v15, v15, 0);
  CGContextAddPath(self->context, v16);
  CGContextDrawPath(self->context, kCGPathFillStroke);
  CGPathRelease(v16);
  v17 = CFAttributedStringCreate(0, (CFStringRef)objc_msgSend(x2_0, "title"), +[CIGVNode textAttributesForTitle](CIGVNode, "textAttributesForTitle"));
  context = self->context;
  objc_msgSend(x2_0, "titleFrame");
  CGContextDrawAttributedString(context, v17, v20);
  CFRelease(v17);
}

- (void)drawNode:(id)a3
{
  -[CGRenderer _drawNodeContent:](self, "_drawNodeContent:");
  if (objc_msgSend(a3, "title"))
    -[CGRenderer _drawNodeBadge:](self, "_drawNodeBadge:", a3);
}

- (void)_drawPolyline:(id)a3
{
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  unint64_t v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  long double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  long double v22;
  CGFloat v23;
  long double v24;
  CGFloat v25;
  CGFloat v26;
  long double v27;
  long double v28;
  long double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;

  v5 = objc_msgSend(a3, "count");
  v6 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  v8 = v7;
  CGContextMoveToPoint(self->context, v6, v7);
  if ((unint64_t)(objc_msgSend(a3, "count") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = 1;
    do
    {
      v6 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v9));
      v8 = v10;
      CGContextAddLineToPoint(self->context, v6, v10);
      ++v9;
    }
    while (v9 < objc_msgSend(a3, "count") - 1);
  }
  v11 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5 - 1));
  v12 = v6 - v11;
  v13 = v11;
  v32 = v14;
  v33 = v11;
  v15 = v8 - v14;
  v16 = v14;
  v17 = hypot(v6 - v11, v8 - v14);
  v18 = v13 + v12 / v17 * 8.0;
  v19 = v16 + v15 / v17 * 8.0;
  CGContextAddLineToPoint(self->context, v18, v19);
  CGContextStrokePath(self->context);
  v20 = v18 - v6;
  v21 = v19 - v8;
  v22 = -(v19 - v8 - (v18 - v6) * 6.123234e-17);
  v23 = (v19 - v8) * 6.123234e-17;
  v24 = hypot(v22, v20 + v23);
  v25 = v18 + v22 / v24 + v22 / v24;
  v26 = v19 + (v20 + v23) / v24 + (v20 + v23) / v24;
  v27 = v21 + v20 * 6.123234e-17;
  v28 = v23 - v20;
  v29 = hypot(v27, v28);
  v30 = v18 + v27 / v29 + v27 / v29;
  v31 = v19 + v28 / v29 + v28 / v29;
  CGContextMoveToPoint(self->context, v33, v32);
  CGContextAddLineToPoint(self->context, v25, v26);
  CGContextAddLineToPoint(self->context, v30, v31);
  CGContextFillPath(self->context);
}

- (void)_drawCubicSpline:(id)a3
{
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  long double v27;
  double v28;
  unsigned int v29;
  uint64_t v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGPoint v53;
  CGPoint v54;
  CGPoint v55;
  CGPoint v56;
  CGPoint v57;
  CGPoint v58;
  CGPoint v59;
  CGPoint v60;
  CGPoint v61;
  CGPoint v62;
  CGPoint v63;
  CGPoint v64;
  CGPoint v65;
  CGPoint v66;
  CGPoint v67;
  CGPoint v68;
  CGPoint v69;

  v5 = objc_msgSend(a3, "count");
  v6 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  CGContextMoveToPoint(self->context, v6, v7);
  v8 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0));
  v10 = v9;
  v11 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 1));
  v13 = v12;
  if (v5 == 2)
  {
    v14 = hypot(0.0, 1.0);
    v15 = -1.0;
    if (v10 <= v13)
      v16 = 1.0;
    else
      v16 = -1.0;
    v17 = 0.0 / v14;
    v18 = 1.0 / v14;
    v19 = v11 + v17 * v16;
    v20 = v13 + v18 * v16;
    if (v10 > v13)
      v15 = 1.0;
    v21 = v17 * v15;
    v22 = v18 * v15;
    v55.x = v8 + v21;
    v55.y = v10 + v22;
    v59.x = v8;
    v59.y = v10;
    v63.x = v11;
    v63.y = v13;
    CGCubicSplineGetControlPoints(v55, v59, v63, *(CGPoint *)&v19, &v54, &v53);
    CGContextAddCurveToPoint(self->context, v54.x, v54.y, v53.x, v53.y, v11, v13);
  }
  else
  {
    v23 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 2));
    v25 = v24;
    if (v10 <= v13)
      v26 = -1.0;
    else
      v26 = 1.0;
    v27 = hypot(0.0, 1.0);
    v28 = 1.0 / v27;
    v52 = 0.0 / v27;
    v56.x = v8 + v26 * (0.0 / v27);
    v56.y = v10 + v26 * v28;
    v60.x = v8;
    v60.y = v10;
    v64.x = v11;
    v64.y = v13;
    v67.x = v23;
    v67.y = v25;
    CGCubicSplineGetControlPoints(v56, v60, v64, v67, &v54, &v53);
    CGContextAddCurveToPoint(self->context, v54.x, v54.y, v53.x, v53.y, v11, v13);
    if ((unint64_t)(v5 - 1) >= 3)
    {
      v29 = 3;
      v30 = 2;
      do
      {
        v31 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v29 - 3));
        v33 = v32;
        v34 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v29 - 2));
        v36 = v35;
        v37 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v30));
        v39 = v38;
        v30 = v29;
        v68.x = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v29));
        v68.y = v40;
        v57.x = v31;
        v57.y = v33;
        v61.x = v34;
        v61.y = v36;
        v65.x = v37;
        v65.y = v39;
        CGCubicSplineGetControlPoints(v57, v61, v65, v68, &v54, &v53);
        CGContextAddCurveToPoint(self->context, v54.x, v54.y, v53.x, v53.y, v37, v39);
      }
      while (v5 - 1 > (unint64_t)v29++);
    }
    v42 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5 - 3));
    v44 = v43;
    v45 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5 - 2));
    v47 = v46;
    v49 = pointFromValue((void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5 - 1));
    v50 = v48;
    v51 = -1.0;
    if (v47 <= v48)
      v51 = 1.0;
    v69.x = v49 + v52 * v51;
    v69.y = v48 + v28 * v51;
    v58.x = v42;
    v58.y = v44;
    v62.x = v45;
    v62.y = v47;
    v66.x = v49;
    v66.y = v50;
    CGCubicSplineGetControlPoints(v58, v62, v66, v69, &v54, &v53);
    CGContextAddCurveToPoint(self->context, v54.x, v54.y, v53.x, v53.y, v49, v50);
    CGContextStrokePath(self->context);
  }
}

- (void)hyperlinkEdge:(id)a3 from:(CGPoint)a4 to:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  CGPoint v15;
  CGPoint v16;
  CGRect v17;
  CGRect v18;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v11 = objc_msgSend(a3, "from");
  v12 = objc_msgSend(a3, "to");
  v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p to %p"), v11, v12);
  v15.x = x;
  v15.y = y;
  CGPDFContextAddDestinationAtPoint(self->context, v13, v15);
  v17.origin.x = v8 + -10.0;
  v17.origin.y = v7 + -10.0;
  v17.size.width = 20.0;
  v17.size.height = 20.0;
  CGPDFContextSetDestinationForRect(self->context, v13, v17);
  v14 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p to %p"), v12, v11);
  v16.x = v8;
  v16.y = v7;
  CGPDFContextAddDestinationAtPoint(self->context, v14, v16);
  v18.origin.x = x + -10.0;
  v18.origin.y = y + -10.0;
  v18.size.width = 20.0;
  v18.size.height = 20.0;
  CGPDFContextSetDestinationForRect(self->context, v14, v18);
}

- (void)drawEdge:(id)a3 withPath:(id)a4
{
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  unsigned __int8 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v33 = (id)objc_msgSend(a4, "mutableCopy");
  v6 = pointFromValue((void *)objc_msgSend(v33, "objectAtIndexedSubscript:", 1));
  v31 = v7;
  objc_msgSend((id)objc_msgSend(a3, "from"), "frame");
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;
  MidX = CGRectGetMidX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MidY = CGRectGetMidY(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v14 = CGRectGetWidth(v36) * 0.5;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v15 = fmin(fmin(v14 / vabdd_f64(v6, MidX), 1.0), CGRectGetHeight(v37) * 0.5 / vabdd_f64(v31, MidY));
  v30 = MidY + (v31 - MidY) * v15;
  v32 = MidX + (v6 - MidX) * v15;
  v28 = pointFromValue((void *)objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v33, "count") - 2));
  v29 = v16;
  objc_msgSend((id)objc_msgSend(a3, "to"), "frame");
  v17 = v38.origin.x;
  v18 = v38.origin.y;
  v19 = v38.size.width;
  v20 = v38.size.height;
  v21 = CGRectGetMidX(v38);
  v39.origin.x = v17;
  v39.origin.y = v18;
  v39.size.width = v19;
  v39.size.height = v20;
  v22 = CGRectGetMidY(v39);
  v40.origin.x = v17;
  v40.origin.y = v18;
  v40.size.width = v19;
  v40.size.height = v20;
  v23 = CGRectGetWidth(v40) * 0.5;
  v41.origin.x = v17;
  v41.origin.y = v18;
  v41.size.width = v19;
  v41.size.height = v20;
  v24 = fmin(fmin(v23 / vabdd_f64(v28, v21), 1.0), CGRectGetHeight(v41) * 0.5 / vabdd_f64(v29, v22));
  v25 = v21 + (v28 - v21) * v24;
  v26 = v22 + (v29 - v22) * v24;
  objc_msgSend(v33, "setObject:atIndexedSubscript:", valueWithPoint(v25, v26), objc_msgSend(v33, "count") - 1);
  -[CGRenderer hyperlinkEdge:from:to:](self, "hyperlinkEdge:from:to:", a3, v32, v30, v25, v26);
  {
    -[CGRenderer drawEdge:withPath:]::deviceGray = (uint64_t)CGColorSpaceCreateDeviceGray();
  }
  CGContextSetStrokeColorSpace(self->context, (CGColorSpaceRef)-[CGRenderer drawEdge:withPath:]::deviceGray);
  CGContextSetStrokeColor(self->context, -[CGRenderer drawEdge:withPath:]::black);
  CGContextSetFillColorSpace(self->context, (CGColorSpaceRef)-[CGRenderer drawEdge:withPath:]::deviceGray);
  CGContextSetFillColor(self->context, -[CGRenderer drawEdge:withPath:]::black);
  CGContextSetLineWidth(self->context, 1.0);
  if (self->drawWithSplines)
    -[CGRenderer _drawCubicSpline:](self, "_drawCubicSpline:", v33);
  else
    -[CGRenderer _drawPolyline:](self, "_drawPolyline:", v33);

}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->direction = a3;
}

- (CGSize)separation
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->separation, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->separation, &v3, 16, 1, 0);
}

- (BOOL)drawEdgesFirst
{
  return self->drawEdgesFirst;
}

- (void)setDrawEdgesFirst:(BOOL)a3
{
  self->drawEdgesFirst = a3;
}

- (BOOL)drawWithSplines
{
  return self->drawWithSplines;
}

- (void)setDrawWithSplines:(BOOL)a3
{
  self->drawWithSplines = a3;
}

- (void)_colorForNodeColor:.cold.1()
{
  __assert_rtn("-[CGRenderer _colorForNodeColor:]", "CIGVRenderer.mm", 412, "0 && \"unreachable\");
}

- (void)_drawNodeContent:.cold.1()
{
  __assert_rtn("-[CGRenderer _drawNodeContent:]", "CIGVRenderer.mm", 474, "0 && \"unreachable\");
}

@end
