@implementation SUUIProductPageHeaderLabel

- (void)setText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_text != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_text, a3);
    -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_textColor, a3);
    -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setContentRating:(id)a3
{
  NSString *v5;
  UIImage *v6;
  UIImage *contentRatingImage;
  NSString *v8;

  v5 = (NSString *)a3;
  if (self->_contentRating != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_contentRating, a3);
    -[SUUIProductPageHeaderLabel _imageForContentRating:](self, "_imageForContentRating:", self->_contentRating);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v6;

    -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v8;
  }

}

- (void)setSecondaryContentRatingImages:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_secondaryContentRatingImages != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secondaryContentRatingImages, a3);
    -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setRatingColor:(id)a3
{
  UIColor *v5;
  UIImage *v6;
  UIImage *contentRatingImage;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_ratingColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_ratingColor, a3);
    -[SUUIProductPageHeaderLabel _imageForContentRating:](self, "_imageForContentRating:", self->_contentRating);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    contentRatingImage = self->_contentRatingImage;
    self->_contentRatingImage = v6;

    -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v8;
  }

}

- (double)secondaryImageWidth
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[NSArray count](self->_secondaryContentRatingImages, "count"))
    return 0.0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_secondaryContentRatingImages;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "size", (_QWORD)v11);
        v7 = v7 + v9 + 5.0;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double *v8;
  __CTFramesetter *v9;
  CGPath *Mutable;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  CGPoint *v14;
  const __CTFrame *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const __CTLine *ValueAtIndex;
  double v22;
  CGPath *v23;
  const __CTFrame *v24;
  CFIndex v25;
  const __CTFrame *v26;
  double v27;
  double v28;
  CGContext *CurrentContext;
  __int128 v30;
  uint64_t v31;
  CFIndex v32;
  double *p_x;
  double *v34;
  const __CTLine *v35;
  CFIndex location;
  CFRange VisibleStringRange;
  void *v38;
  id v39;
  void *v40;
  const __CFAttributedString *v41;
  CTLineRef v42;
  const __CFAttributedString *v43;
  const __CTLine *v44;
  const __CTLine *v45;
  id v46;
  void *v47;
  const __CFAttributedString *v48;
  const __CTLine *v49;
  UIImage *contentRatingImage;
  double v51;
  double v52;
  double v53;
  const __CTLine *v54;
  const __CTLine *TruncatedLine;
  CGFloat v56;
  double v57;
  float v58;
  UIImage *v59;
  double v60;
  double v61;
  double width;
  void *v63;
  unint64_t v64;
  void *v65;
  float v66;
  double v67;
  CGFloat v68;
  double v69;
  float v70;
  void *v71;
  double v72;
  uint64_t v73;
  const __CTLine *v74;
  UIImage *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  __CTFramesetter *v79;
  const __CFArray *v80;
  CGPoint *v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  const __CTFrame *cf;
  const __CTLine *v87;
  void *v88;
  double *v89;
  double *v90;
  const __CFAttributedString *v91;
  const __CTLine *v92;
  uint64_t v93;
  CGContext *c;
  const __CTLine *v95;
  CGAffineTransform v96;
  CFRange v97;
  CFRange v98;
  CFRange v99;
  CFRange v100;
  CGRect v101;
  CGRect BoundsWithOptions;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  -[SUUIProductPageHeaderLabel bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v8 = (double *)MEMORY[0x24BDBEFB0];
  v9 = -[SUUIProductPageHeaderLabel _newTextFramesetter](self, "_newTextFramesetter");
  Mutable = CGPathCreateMutable();
  v101.origin.x = 0.0;
  v101.origin.y = 0.0;
  v85 = v5;
  v101.size.width = v5;
  v101.size.height = v7;
  CGPathAddRect(Mutable, 0, v101);
  v97.location = 0;
  v97.length = 0;
  Frame = CTFramesetterCreateFrame(v9, v97, Mutable, 0);
  CFRelease(Mutable);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  v14 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  cf = Frame;
  v15 = Frame;
  v16 = Count;
  v98.location = 0;
  v98.length = 0;
  CTFrameGetLineOrigins(v15, v98, v14);
  -[SUUIProductPageHeaderLabel secondaryImageWidth](self, "secondaryImageWidth");
  v18 = v17;
  -[UIImage size](self->_contentRatingImage, "size");
  if (Count == 1)
  {
    if (self->_contentRatingImage
      && (v20 = v18 + v19 + 5.0,
          ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0),
          BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0),
          v22 = v5 - v20,
          BoundsWithOptions.size.width > v22))
    {
      CFRelease(cf);
      free(v14);
      v23 = CGPathCreateMutable();
      v103.origin.x = 0.0;
      v103.origin.y = 0.0;
      v103.size.width = v22;
      v103.size.height = v7;
      CGPathAddRect(v23, 0, v103);
      v99.location = 0;
      v99.length = 0;
      v24 = CTFramesetterCreateFrame(v9, v99, v23, 0);
      CFRelease(v23);
      Lines = CTFrameGetLines(v24);
      v25 = CFArrayGetCount(Lines);
      v14 = (CGPoint *)malloc_type_malloc(16 * v25, 0x1000040451B5BE8uLL);
      cf = v24;
      v26 = v24;
      v16 = v25;
      v100.location = 0;
      v100.length = 0;
      CTFrameGetLineOrigins(v26, v100, v14);
    }
    else
    {
      v16 = 1;
    }
  }
  v27 = *v8;
  v28 = v8[1];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, 0.0, v7);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v30 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v96.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v96.c = v30;
  *(_OWORD *)&v96.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  c = CurrentContext;
  CGContextSetTextMatrix(CurrentContext, &v96);
  v31 = v16 - 1;
  v79 = v9;
  v82 = v28;
  v83 = v27;
  if (v16 < 1)
  {
    v88 = 0;
  }
  else
  {
    v32 = 0;
    p_x = &v14[v31].x;
    v34 = p_x + 1;
    v81 = v14;
    v80 = Lines;
    v93 = v16 - 1;
    v90 = p_x + 1;
    v88 = 0;
    v89 = p_x;
    v84 = v16;
    do
    {
      v35 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v32);
      v95 = v35;
      if (v32 == v31)
      {
        location = CTLineGetStringRange(v35).location;
        VisibleStringRange = CTFrameGetVisibleStringRange(cf);
        if (VisibleStringRange.location + VisibleStringRange.length >= -[NSString length](self->_text, "length"))
        {
          v44 = 0;
        }
        else
        {
          -[NSString substringFromIndex:](self->_text, "substringFromIndex:", location);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_alloc(MEMORY[0x24BDD1458]);
          -[SUUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (const __CFAttributedString *)objc_msgSend(v39, "initWithString:attributes:", v38, v40);

          v42 = CTLineCreateWithAttributedString(v41);
          v43 = v41;
          v44 = v42;
          CFRelease(v43);

        }
        v46 = objc_alloc(MEMORY[0x24BDD1458]);
        -[SUUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (const __CFAttributedString *)objc_msgSend(v46, "initWithString:attributes:", CFSTR("…"), v47);

        v91 = v48;
        v49 = CTLineCreateWithAttributedString(v48);
        contentRatingImage = self->_contentRatingImage;
        if (contentRatingImage)
        {
          -[UIImage size](contentRatingImage, "size");
          v52 = v51 + 5.0;
        }
        else
        {
          v52 = 0.0;
        }
        v53 = v85 - v52 - v18;
        if (v44)
          v54 = v44;
        else
          v54 = v95;
        v92 = v49;
        TruncatedLine = CTLineCreateTruncatedLine(v54, v53, kCTLineTruncationEnd, v49);
        v45 = TruncatedLine;
        if (self->_contentRatingImage)
        {
          v104 = CTLineGetBoundsWithOptions(TruncatedLine, 0);
          *(float *)&v104.origin.x = *p_x + v104.size.width + 5.0;
          v83 = roundf(*(float *)&v104.origin.x);
          v56 = v7 - *v34;
          -[UIImage size](self->_contentRatingImage, "size");
          v58 = v56 - v57 + 0.0;
          v82 = roundf(v58);
        }
        if (-[NSArray count](self->_secondaryContentRatingImages, "count"))
        {
          v59 = self->_contentRatingImage;
          v87 = v44;
          if (v59)
          {
            -[UIImage size](v59, "size");
            v61 = v60 + 5.0 + 5.0;
          }
          else
          {
            v61 = 5.0;
          }
          v105 = CTLineGetBoundsWithOptions(v45, 0);
          width = v105.size.width;
          v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_secondaryContentRatingImages, "count"));
          if (-[NSArray count](self->_secondaryContentRatingImages, "count"))
          {
            v64 = 0;
            do
            {
              -[NSArray objectAtIndex:](self->_secondaryContentRatingImages, "objectAtIndex:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v61 + width + *v89;
              v67 = roundf(v66);
              v68 = v7 - *v90;
              objc_msgSend(v65, "size");
              v70 = v68 - v69 + -1.0;
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v67, roundf(v70));
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "addObject:", v71);
              objc_msgSend(v65, "size");
              v61 = v61 + v72 + 5.0;

              ++v64;
            }
            while (-[NSArray count](self->_secondaryContentRatingImages, "count") > v64);
          }
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v63);
          v73 = objc_claimAutoreleasedReturnValue();

          v88 = (void *)v73;
          v14 = v81;
          Lines = v80;
          v16 = v84;
          v44 = v87;
        }
        else
        {
          v16 = v84;
        }
        CFRelease(v92);
        CFRelease(v91);
        if (v44)
          CFRelease(v44);
        p_x = v89;
        v34 = v90;
      }
      else
      {
        v45 = 0;
      }
      CGContextSetTextPosition(c, v14[v32].x, v14[v32].y);
      if (v45)
        v74 = v45;
      else
        v74 = v95;
      CTLineDraw(v74, c);
      if (v45)
        CFRelease(v45);
      ++v32;
      v31 = v93;
    }
    while (v32 != v16);
  }
  CGContextRestoreGState(c);
  v75 = self->_contentRatingImage;
  if (v75)
    -[UIImage drawAtPoint:](v75, "drawAtPoint:", v83, v82);
  if (-[NSArray count](self->_secondaryContentRatingImages, "count")
    && -[NSArray count](self->_secondaryContentRatingImages, "count"))
  {
    v76 = 0;
    do
    {
      -[NSArray objectAtIndex:](self->_secondaryContentRatingImages, "objectAtIndex:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "objectAtIndex:", v76);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "CGPointValue");
      objc_msgSend(v77, "drawAtPoint:");

      ++v76;
    }
    while (-[NSArray count](self->_secondaryContentRatingImages, "count") > v76);
  }
  free(v14);
  CFRelease(cf);
  CFRelease(v79);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  double width;
  __CTFramesetter *v6;
  CGSize v7;
  double v8;
  CGPath *Mutable;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  double v13;
  double v14;
  double v15;
  double v16;
  const __CTLine *ValueAtIndex;
  double v18;
  CGPath *v19;
  const __CTLine *v20;
  float v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  CGPoint v27;
  CFRange v28;
  CFRange v29;
  CFRange v30;
  CFRange v31;
  CFRange v32;
  CGSize v33;
  CGSize v34;
  CGSize result;
  CGRect v36;
  CGRect BoundsWithOptions;
  CGRect v38;
  CGRect v39;

  height = a3.height;
  width = a3.width;
  v6 = -[SUUIProductPageHeaderLabel _newTextFramesetter](self, "_newTextFramesetter");
  v28.location = 0;
  v28.length = 0;
  v33.width = width;
  v33.height = height;
  v7 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v28, 0, v33, 0);
  v8 = v7.height;
  Mutable = CGPathCreateMutable();
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v7.width;
  v36.size.height = v7.height;
  CGPathAddRect(Mutable, 0, v36);
  v29.location = 0;
  v29.length = 0;
  Frame = CTFramesetterCreateFrame(v6, v29, Mutable, 0);
  CFRelease(Mutable);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  -[SUUIProductPageHeaderLabel secondaryImageWidth](self, "secondaryImageWidth");
  v14 = v13;
  -[UIImage size](self->_contentRatingImage, "size");
  if (Count == 1)
  {
    v16 = v14 + v15 + 5.0;
    if (v16 > 0.0)
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 0);
      BoundsWithOptions = CTLineGetBoundsWithOptions(ValueAtIndex, 0);
      v18 = width - v16;
      if (BoundsWithOptions.size.width <= v18)
        goto LABEL_7;
      CFRelease(Frame);
      v30.location = 0;
      v30.length = 0;
      v34.width = v18;
      v34.height = height;
      v8 = CTFramesetterSuggestFrameSizeWithConstraints(v6, v30, 0, v34, 0).height;
      v19 = CGPathCreateMutable();
      v38.origin.x = 0.0;
      v38.origin.y = 0.0;
      v38.size.width = v18;
      v38.size.height = height;
      CGPathAddRect(v19, 0, v38);
      v31.location = 0;
      v31.length = 0;
      Frame = CTFramesetterCreateFrame(v6, v31, v19, 0);
      CFRelease(v19);
      Lines = CTFrameGetLines(Frame);
      Count = CFArrayGetCount(Lines);
    }
  }
  if (Count >= 3)
  {
    v27.x = 0.0;
    v27.y = 0.0;
    v32.location = 1;
    v32.length = 1;
    CTFrameGetLineOrigins(Frame, v32, &v27);
    v20 = (const __CTLine *)CFArrayGetValueAtIndex(Lines, 1);
    v39 = CTLineGetBoundsWithOptions(v20, 0);
    v8 = v8 - v27.y - v39.origin.y;
  }
LABEL_7:
  v21 = v8;
  v22 = roundf(v21);
  v23 = width;
  v24 = roundf(v23);
  CFRelease(Frame);
  CFRelease(v6);
  v25 = v24;
  v26 = v22;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIProductPageHeaderLabel;
  -[SUUIProductPageHeaderLabel layoutSubviews](&v3, sel_layoutSubviews);
  -[SUUIProductPageHeaderLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (id)_imageForContentRating:(id)a3
{
  return SUUIBadgeImageFromText(a3, self->_ratingColor, 1);
}

- (__CTFramesetter)_newTextFramesetter
{
  id v3;
  NSString *text;
  void *v5;
  const __CFAttributedString *v6;
  __CTFramesetter *v7;

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  text = self->_text;
  -[SUUIProductPageHeaderLabel _textAttributes](self, "_textAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFAttributedString *)objc_msgSend(v3, "initWithString:attributes:", text, v5);

  v7 = CTFramesetterCreateWithAttributedString(v6);
  CFRelease(v6);
  return v7;
}

- (id)_textAttributes
{
  double v3;
  void *v4;
  UIColor *textColor;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = *MEMORY[0x24BEBB360];
  v3 = 22.0;
  if (!self->_isPad)
    v3 = 17.0;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BEBB368];
  textColor = self->_textColor;
  v6 = textColor;
  if (!textColor)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!textColor)

  return v7;
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSString)contentRating
{
  return self->_contentRating;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (NSArray)secondaryContentRatingImages
{
  return self->_secondaryContentRatingImages;
}

- (UIColor)ratingColor
{
  return self->_ratingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingColor, 0);
  objc_storeStrong((id *)&self->_secondaryContentRatingImages, 0);
  objc_storeStrong((id *)&self->_contentRatingImage, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
