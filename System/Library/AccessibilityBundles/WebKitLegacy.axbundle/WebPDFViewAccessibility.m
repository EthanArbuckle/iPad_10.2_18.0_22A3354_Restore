@implementation WebPDFViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebPDFView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityPages
{
  WebPDFViewAccessibility *v2;
  _QWORD *v3;
  void *v4;
  CGPDFDocument *v5;
  size_t NumberOfPages;
  size_t v7;
  size_t v8;
  CGPDFPage *Page;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t Length;
  _BOOL4 v14;
  double v15;
  _WORD *v16;
  unint64_t *v17;
  CGRect *v18;
  CGFloat x;
  CGFloat y;
  int v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  CGRect *v28;
  unint64_t v29;
  BOOL v30;
  unint64_t *v31;
  CGRect *v32;
  double v33;
  double v34;
  _WORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  int CharacterAtIndex;
  __int16 v50;
  double v51;
  double v52;
  double v53;
  _BOOL4 v54;
  CGRect *v55;
  int v56;
  unsigned int v57;
  int v58;
  unsigned int Script;
  int v60;
  unsigned int v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  size_t v68;
  void *v69;
  WebPDFViewAccessibility *v70;
  CGPDFDocument *v71;
  double v72;
  size_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  int v78;
  char v79;
  uint64_t v80;
  CGFloat height;
  CGFloat width;
  char *v83;
  unint64_t *ptr;
  CGRect *v85;
  unint64_t *v86;
  _WORD *v87;
  uint64_t v88;
  CGAffineTransform v89;
  double v90;
  uint64_t v91;
  CGRect BoxRect;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v2 = self;
  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[WebPDFViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_99;
  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
  -[WebPDFViewAccessibility _accessibilitySetRetainedValue:forKey:](v2, "_accessibilitySetRetainedValue:forKey:", v4, *v3);
  v5 = (CGPDFDocument *)-[WebPDFViewAccessibility doc](v2, "doc");
  NumberOfPages = CGPDFDocumentGetNumberOfPages(v5);
  if (!NumberOfPages)
    goto LABEL_99;
  v7 = NumberOfPages;
  v8 = 1;
  v69 = v4;
  v70 = v2;
  v71 = v5;
  v68 = NumberOfPages;
  do
  {
    Page = CGPDFDocumentGetPage(v5, v8);
    v10 = CGPDFPageCopyTextString();
    if (!v10)
      goto LABEL_98;
    v11 = v10;
    v12 = v4;
    Length = CGPDFTextStringGetLength();
    v14 = -[WebPDFViewAccessibility hasSpaces:](v2, "hasSpaces:", v11);
    v15 = 0.0900000036;
    if (v14)
      v15 = 1.0;
    v72 = v15;
    v16 = malloc_type_calloc(1uLL, 4 * Length, 0x1000040BDFB0063uLL);
    v17 = (unint64_t *)malloc_type_calloc(1uLL, 16 * Length, 0x100004000313F17uLL);
    v18 = (CGRect *)malloc_type_calloc(1uLL, Length << 6, 0x1000040E0EAB150uLL);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    height = BoxRect.size.height;
    width = BoxRect.size.width;
    v21 = CGPDFPageGetRotationAngle(Page) % 360;
    if (v21 >= 0)
      v22 = v21;
    else
      v22 = v21 + 360;
    v88 = 0;
    v23 = CGPDFTextStringGetLength();
    v86 = v17;
    v87 = v16;
    v85 = v18;
    gXFormRange = 0;
    qword_255EA95F8 = 0;
    v73 = v8;
    v74 = v22;
    if (v22)
      v24 = v22 == 180;
    else
      v24 = 1;
    v25 = !v24;
    v78 = v25;
    gBoundsRange = 0;
    qword_255EA9608 = 0;
    v80 = v23;
    v26 = 0;
    if (v23 < 1)
    {
      v63 = v18;
      v4 = v12;
LABEL_95:
      v5 = v71;
      goto LABEL_97;
    }
    v27 = 0;
    v28 = v18;
    v79 = 0;
    v29 = 2 * Length;
    v30 = 1;
    v76 = x;
    v77 = 0.0;
    v31 = v17;
    v83 = (char *)v28;
    ptr = v17;
    v32 = v28;
    v33 = 0.0;
    v34 = 0.0;
    v35 = v16;
    v75 = y;
    do
    {
      if (v26 + 5 > v29)
      {
        v16 = malloc_type_realloc(v16, 4 * v29, 0x1000040BDFB0063uLL);
        v36 = (char *)malloc_type_realloc(ptr, 16 * v29, 0x100004000313F17uLL);
        v35 = &v16[v26];
        v83 = (char *)malloc_type_realloc(v83, v29 << 6, 0x1000040E0EAB150uLL);
        ptr = (unint64_t *)v36;
        v31 = (unint64_t *)&v36[8 * v26];
        v86 = v31;
        v87 = v35;
        v32 = (CGRect *)&v83[32 * v26];
        v85 = v32;
        v29 *= 2;
      }
      if (gBoundsRange > v27 || !v27 || qword_255EA9608 + gBoundsRange <= v27)
      {
        CGPDFTextStringGetBBoxForIndex();
        gBounds_1 = v37;
        gBounds_2 = v38;
        gBounds_3 = v39;
      }
      v90 = 0.0;
      v91 = 0;
      if (gXFormRange > v27 || !v27 || qword_255EA95F8 + gXFormRange <= v27)
      {
        CGPDFTextStringGetTransformForIndex();
        *(CGAffineTransform *)gXForm = v89;
        gXFormIsIdentity = CGAffineTransformIsIdentity(&v89);
      }
      CGPDFTextStringGetPositionForIndex();
      v42 = v40;
      v43 = *(double *)&gBounds_3;
      v44 = v41 + *(double *)&gBounds_1;
      if (v90 == 0.0)
        v45 = *(double *)&gBounds_2;
      else
        v45 = v90;
      if (!gXFormIsIdentity)
      {
        v89 = *(CGAffineTransform *)gXForm;
        v46 = v41 + *(double *)&gBounds_1;
        v47 = v45;
        v48 = gBounds_3;
        v93 = CGRectApplyAffineTransform(*(CGRect *)&v40, &v89);
        v42 = v93.origin.x;
        v44 = v93.origin.y;
        v45 = v93.size.width;
        v43 = v93.size.height;
      }
      v94.origin.x = v42;
      v94.origin.y = v44;
      v94.size.width = v45;
      v94.size.height = v43;
      v95.origin.x = x;
      v95.origin.y = y;
      v95.size.height = height;
      v95.size.width = width;
      if (CGRectIntersectsRect(v94, v95))
      {
        CharacterAtIndex = CGPDFTextStringGetCharacterAtIndex();
        if (!CharacterAtIndex)
        {
          v55 = v32;
          v51 = v34;
          v53 = v77;
          goto LABEL_87;
        }
        v50 = CharacterAtIndex;
        if (v78)
          v51 = v42;
        else
          v51 = v44;
        if ((v79 & 1) == 0)
        {
          if (v78)
            v53 = v44;
          else
            v53 = v42;
LABEL_75:
          *v35++ = v50;
          v87 = v35;
          *v31++ = v27;
          v86 = v31;
          v32->origin.x = v42;
          v32->origin.y = v44;
          v32->size.width = v45;
          v32->size.height = v43;
          v55 = v32 + 1;
          v85 = v32 + 1;
          v62 = v88;
          v26 = ++v88;
          v79 = 1;
          if (!v30 && v62 >= 1)
          {
            v30 = 0;
            v79 = 1;
            if (v74 > 179)
            {
              if (v74 == 180)
              {
                v30 = 0;
                v32[-1].size.width = v32[-1].size.width + v32[-1].origin.x - (v45 + v42);
                v32[-1].origin.x = v45 + v42;
                goto LABEL_86;
              }
              if (v74 == 270)
              {
                v30 = 0;
                v32[-1].size.height = v32[-1].size.height + v32[-1].origin.y - v44 - v43;
                v32[-1].origin.y = v43 + v44;
                goto LABEL_86;
              }
            }
            else
            {
              if (!v74)
              {
                v30 = 0;
                v32[-1].size.width = v32[-1].size.width + v42 - (v32[-1].origin.x + v32[-1].size.width);
                goto LABEL_86;
              }
              if (v74 == 90)
              {
                v30 = 0;
                v32[-1].size.height = v32[-1].size.height + v44 - (v32[-1].origin.y + v32[-1].size.height);
LABEL_86:
                v79 = 1;
              }
            }
          }
LABEL_87:
          if (v78)
            v33 = v43;
          else
            v33 = v45;
          v77 = v33 + v53;
          v32 = v55;
          v34 = v51;
          y = v75;
          x = v76;
          goto LABEL_91;
        }
        if (v78)
          v52 = v45;
        else
          v52 = v43;
        if (v78)
          v53 = v44;
        else
          v53 = v42;
        v54 = v51 > v34 + v52 || v51 < v34 + v52 * -0.25 || v33 + v53 < v77;
        if (v35 <= v16)
        {
          NSLog(CFSTR("We shouldn't be here (in runThroughPageText)"));
        }
        else
        {
          if (v54)
          {
            if (*(v35 - 1) != 32)
              insertChar(32, &v87, &v86, &v85, &v88, v74, -1);
            insertChar(10, &v87, &v86, &v85, &v88, v74, -1);
            v56 = 1;
            goto LABEL_74;
          }
          if (v53 > v77 + v33 * v72 && *(v35 - 1) != 32)
          {
            v57 = 0;
            LODWORD(v89.a) = 0;
            v58 = (unsigned __int16)*(v35 - 1);
            if ((v58 - 12352) >= 0xC0 && (unsigned __int16)(v58 + 155) >= 0x3Bu)
            {
              Script = uscript_getScript();
              if (Script > 0x16)
                v57 = 1;
              else
                v57 = (0x2DFFFFu >> Script) & 1;
            }
            if ((LODWORD(v89.a) = 0, v60 = CGPDFTextStringGetCharacterAtIndex(), (v60 - 12352) >= 0xC0)
              && (unsigned __int16)(v60 + 155) >= 0x3Bu
              && ((v61 = uscript_getScript(), v61 > 0x16) || ((1 << v61) & 0x520000) == 0)
              || v57)
            {
              insertChar(32, &v87, &v86, &v85, &v88, v74, -2);
              v56 = 1;
LABEL_73:
              v51 = v34;
LABEL_74:
              v30 = v56 != 0;
              v31 = v86;
              v35 = v87;
              v32 = v85;
              goto LABEL_75;
            }
          }
        }
        v56 = 0;
        goto LABEL_73;
      }
LABEL_91:
      ++v27;
    }
    while (v80 != v27);
    v7 = v68;
    v4 = v69;
    if (v26 >= 1)
    {
      v16 = malloc_type_realloc(v16, 2 * v26, 0x1000040BDFB0063uLL);
      v17 = (unint64_t *)malloc_type_realloc(ptr, 8 * v26, 0x100004000313F17uLL);
      v63 = malloc_type_realloc(v83, 32 * v26, 0x1000040E0EAB150uLL);
      v2 = v70;
      goto LABEL_95;
    }
    v2 = v70;
    v5 = v71;
    v63 = v83;
    v17 = ptr;
LABEL_97:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v16, v26);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    free(v16);
    free(v17);
    free(v63);
    CGPDFTextStringRelease();
    v65 = (void *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityPDFElement), "initWithAccessibilityContainer:", v2);
    v8 = v73;
    objc_msgSend(v65, "setPage:", v73 - 1);
    objc_msgSend(v65, "setPageCount:", v7);
    objc_msgSend(v65, "setAccessibilityLabel:", v64);
    objc_msgSend(v4, "addObject:", v65);

LABEL_98:
    ++v8;
  }
  while (v8 <= v7);
LABEL_99:
  v66 = v4;

  return v66;
}

- (id)accessibilityContainer
{
  WebPDFViewAccessibility *v2;
  WebPDFViewAccessibility *v3;
  WebPDFViewAccessibility *v4;
  void *v5;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    while ((-[WebPDFViewAccessibility isMemberOfClass:](v3, "isMemberOfClass:", NSClassFromString(CFSTR("WebView"))) & 1) == 0)
    {
      -[WebPDFViewAccessibility superview](v3, "superview");
      v4 = (WebPDFViewAccessibility *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (!v4)
        return v4;
    }
    -[WebPDFViewAccessibility accessibilityContainer](v3, "accessibilityContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v5;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CGPoint v13;
  CGRect v14;

  -[WebPDFViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", 0, a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = -[WebPDFViewAccessibility accessibilityElementCount](self, "accessibilityElementCount");
  if (v8 < 1)
  {
LABEL_5:
    v11 = 0;
  }
  else
  {
    v9 = v8;
    v10 = 0;
    while (1)
    {
      -[WebPDFViewAccessibility accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      v13.x = v5;
      v13.y = v7;
      if (CGRectContainsPoint(v14, v13))
        break;

      if (v9 == ++v10)
        goto LABEL_5;
    }
  }
  return v11;
}

- (int64_t)accessibilityElementCount
{
  void *v2;
  int64_t v3;

  -[WebPDFViewAccessibility _accessibilityPages](self, "_accessibilityPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WebPDFViewAccessibility _accessibilityPages](self, "_accessibilityPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[WebPDFViewAccessibility _accessibilityPages](self, "_accessibilityPages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (BOOL)hasSpaces:(CGPDFTextString *)a3
{
  unint64_t Length;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int CharacterAtIndex;
  uint64_t v9;

  Length = CGPDFTextStringGetLength();
  if (Length >= 0x200)
    v4 = 512;
  else
    v4 = Length;
  if (v4)
  {
    v5 = 0;
    v6 = -1;
    v7 = 1;
    do
    {
      CharacterAtIndex = CGPDFTextStringGetCharacterAtIndex();
      v9 = v5;
      if (CharacterAtIndex == 32)
      {
        v9 = v6;
        if ((v6 & 0x8000000000000000) == 0)
          break;
      }
      v7 = ++v5 < v4;
      v6 = v9;
    }
    while (v4 != v5);
  }
  else
  {
    return 0;
  }
  return v7;
}

@end
