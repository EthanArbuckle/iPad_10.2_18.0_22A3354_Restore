@implementation ICBaseLayoutManager

+ (NSDictionary)defaultLinkTextAttributes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_setNonNilObject:forKey:", v3, *MEMORY[0x1E0DC1140]);

  objc_msgSend(v2, "ic_setNonNilObject:forKey:", &unk_1E5C71C88, *MEMORY[0x1E0DC1248]);
  v4 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v4;
}

- (id)textController
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[ICBaseLayoutManager textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ICBaseLayoutManager textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)textContainer
{
  void *v2;
  void *v3;

  -[ICBaseLayoutManager textContainers](self, "textContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)drawListStylesForCharacterRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  uint64_t v10;
  _QWORD v11[7];

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  -[ICBaseLayoutManager textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D63928];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__ICBaseLayoutManager_drawListStylesForCharacterRange_atPoint___block_invoke;
  v11[3] = &unk_1E5C1E450;
  v11[4] = self;
  *(CGFloat *)&v11[5] = x;
  *(CGFloat *)&v11[6] = y;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v10, location, length, 0, v11);

}

void __63__ICBaseLayoutManager_drawListStylesForCharacterRange_atPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    v11 = v7;
    v9 = objc_msgSend(v7, "isList");
    v8 = v11;
    if (v9)
    {
      v10 = objc_msgSend(v11, "style");
      v8 = v11;
      if (v10 != 103)
      {
        objc_msgSend(*(id *)(a1 + 32), "drawBulletsForListRange:paragraphStyle:atPoint:", a3, a4, v11, *(double *)(a1 + 40), *(double *)(a1 + 48));
        v8 = v11;
      }
    }
  }

}

- (void)drawBulletsForListRange:(_NSRange)a3 paragraphStyle:(id)a4 atPoint:(CGPoint)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat x;
  double y;
  CGFloat width;
  CGContext *CurrentContext;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFAttributedString *v33;
  void *v34;
  void *v35;
  const __CTLine *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double height;
  double TypographicBounds;
  double v43;
  double v44;
  int v45;
  double v46;
  uint64_t v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  CGFloat v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSUInteger v60;
  CGFloat rect;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  CGAffineTransform v67;
  CGRect v68;
  CGRect v69;
  CGRect ImageBounds;

  length = a3.length;
  location = a3.location;
  v66 = a4;
  if (drawBulletsForListRange_paragraphStyle_atPoint__onceToken != -1)
    dispatch_once(&drawBulletsForListRange_paragraphStyle_atPoint__onceToken, &__block_literal_global_11);
  v60 = location + length;
  if (location < location + length)
  {
    v59 = *MEMORY[0x1E0DC1138];
    v58 = *MEMORY[0x1E0DC1140];
    *(double *)&v57 = 9.2;
    do
    {
      -[ICBaseLayoutManager textStorage](self, "textStorage", v57);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "paragraphRangeForRange:", location, 0);
      v12 = v11;

      v64 = v12;
      v65 = v10;
      -[ICBaseLayoutManager lineFragmentUsedRectForGlyphAtIndex:effectiveRange:](self, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", -[ICBaseLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v10, v12, 0), 0);
      v14 = v13;
      v16 = v15;
      v18 = a5.x + v17;
      v20 = a5.y + v19;
      -[ICBaseLayoutManager textContainer](self, "textContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lineFragmentPadding");
      v23 = v22;
      v68.origin.x = v18;
      v68.origin.y = v20;
      v68.size.width = v14;
      v68.size.height = v16;
      v69 = CGRectInset(v68, v23, 0.0);
      x = v69.origin.x;
      y = v69.origin.y;
      width = v69.size.width;
      rect = v69.size.height;

      CurrentContext = UIGraphicsGetCurrentContext();
      -[ICBaseLayoutManager textStorage](self, "textStorage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attribute:atIndex:effectiveRange:", v59, location, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      +[ICTTTextStorage bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:](ICTTTextStorage, "bulletTextAttributesWithTextFont:paragraphStyle:zoomFactor:", v29, v66, 1.0);
      v30 = objc_claimAutoreleasedReturnValue();
      -[ICBaseLayoutManager textStorage](self, "textStorage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "listBulletInAttributedString:atIndex:", v31, location);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = (void *)v30;
      v33 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v32, v30);
      objc_msgSend((id)drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache, "objectForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34 || (v36 = (const __CTLine *)CFRetain((CFTypeRef)objc_msgSend(v34, "ref"))) == 0)
      {
        v36 = CTLineCreateWithAttributedString(v33);
        v37 = (void *)drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache;
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D641B8]), "initWithCFTypeRef:", v36);
        objc_msgSend(v37, "setObject:forKey:", v38, v33);

      }
      v39 = 0.0;
      CGContextSetTextPosition(CurrentContext, 0.0, 0.0);
      ImageBounds = CTLineGetImageBounds(v36, CurrentContext);
      v40 = ImageBounds.origin.y;
      height = ImageBounds.size.height;
      TypographicBounds = CTLineGetTypographicBounds(v36, 0, 0, 0);
      -[ICBaseLayoutManager bulletYOffsetForCharacterAtIndex:](self, "bulletYOffsetForCharacterAtIndex:", location);
      v44 = y + v43;
      v45 = objc_msgSend(v66, "style");
      if ((v45 - 100) >= 2)
      {
        if (v45 == 102)
          v39 = *(double *)&v57;
      }
      else
      {
        v39 = (36.0 - TypographicBounds) * 0.5 + 1.0;
        objc_msgSend(v29, "capHeight");
        v44 = v44 - ((v46 - height) * 0.5 - v40);
      }
      v47 = objc_msgSend(v66, "layoutWritingDirection");
      v48 = x;
      v49 = y;
      v50 = width;
      v51 = rect;
      if (v47)
        v52 = v39 + CGRectGetMaxX(*(CGRect *)&v48);
      else
        v52 = CGRectGetMinX(*(CGRect *)&v48) - v39 - TypographicBounds;
      -[ICBaseLayoutManager textStorage](self, "textStorage");
      v53 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v53, "attribute:atIndex:effectiveRange:", v58, location, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v53) = objc_msgSend(v54, "isEqual:", v55);

      if ((v53 & 1) == 0)
      {
        CGContextSetGrayFillColor(CurrentContext, 0.0, 1.0);
        objc_msgSend(v54, "alphaComponent");
        CGContextSetAlpha(CurrentContext, v56);
        CGAffineTransformMakeScale(&v67, 1.0, -1.0);
        CGContextSetTextMatrix(CurrentContext, &v67);
        CGContextSetTextPosition(CurrentContext, v52, v44);
        CTLineDraw(v36, CurrentContext);
        CGContextFillPath(CurrentContext);
        CGContextSetAlpha(CurrentContext, 1.0);
      }
      CFRelease(v36);
      location = v65 + v64;

    }
    while (v65 + v64 < v60);
  }

}

void __70__ICBaseLayoutManager_drawBulletsForListRange_paragraphStyle_atPoint___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0D641C0]);
  v1 = (void *)drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache;
  drawBulletsForListRange_paragraphStyle_atPoint__bulletCTLineCache = (uint64_t)v0;

}

- (double)bulletYOffsetForCharacterAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v19 = 0;
  v20 = 0;
  v18 = 0;
  -[ICBaseLayoutManager textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getLineStart:end:contentsEnd:forRange:", &v20, &v19, &v18, a3, 0);

  if (v18 == v20)
  {
    -[ICBaseLayoutManager textStorage](self, "textStorage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ascender");
    v10 = v9;
LABEL_6:

    return v10;
  }
  -[ICBaseLayoutManager locationForGlyphAtIndex:](self, "locationForGlyphAtIndex:", -[ICBaseLayoutManager glyphIndexForCharacterAtIndex:](self, "glyphIndexForCharacterAtIndex:", a3));
  v10 = v11;
  -[ICBaseLayoutManager textStorage](self, "textStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "characterAtIndex:", a3);

  if (v14 == 65532)
  {
    -[ICBaseLayoutManager textStorage](self, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "descender");
      v10 = v10 + v16;
    }
    goto LABEL_6;
  }
  return v10;
}

- (UITextView)textView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
}

@end
