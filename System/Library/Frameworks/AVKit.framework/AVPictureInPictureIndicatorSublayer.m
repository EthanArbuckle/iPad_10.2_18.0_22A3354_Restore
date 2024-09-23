@implementation AVPictureInPictureIndicatorSublayer

- (AVPictureInPictureIndicatorSublayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5
{
  _BOOL4 v5;
  AVPictureInPictureIndicatorSublayer *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  CGFloat Width;
  size_t Height;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSAttributedString *attributedText;
  double v23;
  uint64_t v24;
  CALayer *imageLayer;
  CALayer *v26;
  uint64_t v27;
  CATextLayer *textLayer;
  CATextLayer *v29;
  id v30;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v5 = a5;
  v34[2] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)AVPictureInPictureIndicatorSublayer;
  v8 = -[AVPictureInPictureIndicatorSublayer init](&v32, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorBackgroundColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");

    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    v8->_lineHeight = v13;
    if (v5)
      v14 = v10;
    else
      v14 = 0;
    -[AVPictureInPictureIndicatorSublayer setBackgroundColor:](v8, "setBackgroundColor:", v14);
    Width = (double)CGImageGetWidth(a4);
    Height = CGImageGetHeight(a4);
    v8->_imageSize.width = Width;
    v8->_imageSize.height = (double)Height;
    AVLocalizedString(CFSTR("PICTURE_IN_PICTURE_INDICATOR_LAYER_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = *MEMORY[0x1E0DC1140];
    v33[0] = *MEMORY[0x1E0DC1138];
    v33[1] = v19;
    v34[0] = v12;
    v34[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v18, "initWithString:attributes:", v17, v20);
    attributedText = v8->_attributedText;
    v8->_attributedText = (NSAttributedString *)v21;

    objc_msgSend(v12, "ascender");
    v8->_baselineOffset = v23;
    CTFontGetLanguageAwareOutsets();
    v8->_languageAwareOutsets.top = 0.0;
    v8->_languageAwareOutsets.left = 0.0;
    v8->_languageAwareOutsets.bottom = 0.0;
    v8->_languageAwareOutsets.right = 0.0;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v24 = objc_claimAutoreleasedReturnValue();
    imageLayer = v8->_imageLayer;
    v8->_imageLayer = (CALayer *)v24;

    -[CALayer setContents:](v8->_imageLayer, "setContents:", a4);
    -[CALayer setContentsGravity:](v8->_imageLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F88]);
    -[CALayer setContentsScale:](v8->_imageLayer, "setContentsScale:", a3);
    v26 = v8->_imageLayer;
    -[AVPictureInPictureIndicatorSublayer bounds](v8, "bounds");
    -[CALayer setBounds:](v26, "setBounds:");
    -[AVPictureInPictureIndicatorSublayer addSublayer:](v8, "addSublayer:", v8->_imageLayer);
    objc_msgSend(MEMORY[0x1E0CD28A0], "layer");
    v27 = objc_claimAutoreleasedReturnValue();
    textLayer = v8->_textLayer;
    v8->_textLayer = (CATextLayer *)v27;

    -[CATextLayer setFont:](v8->_textLayer, "setFont:", v12);
    -[CATextLayer setFontSize:](v8->_textLayer, "setFontSize:", 13.0);
    v29 = v8->_textLayer;
    v30 = objc_retainAutorelease(v11);
    -[CATextLayer setForegroundColor:](v29, "setForegroundColor:", objc_msgSend(v30, "CGColor"));
    -[CATextLayer setAlignmentMode:](v8->_textLayer, "setAlignmentMode:", *MEMORY[0x1E0CD28F0]);
    -[CATextLayer setContentsScale:](v8->_textLayer, "setContentsScale:", a3);
    -[CATextLayer setString:](v8->_textLayer, "setString:", v8->_attributedText);
    -[CATextLayer setTruncationMode:](v8->_textLayer, "setTruncationMode:", *MEMORY[0x1E0CD3198]);
    -[CATextLayer setWrapped:](v8->_textLayer, "setWrapped:", 1);
    -[AVPictureInPictureIndicatorSublayer addSublayer:](v8, "addSublayer:", v8->_textLayer);

  }
  return v8;
}

- (AVPictureInPictureIndicatorSublayer)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _AVMethodProem(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithTraitCollection:opaque:]."), v5, v7);

  return -[AVPictureInPictureIndicatorSublayer initWithDisplayScale:placeholderImage:opaque:](self, "initWithDisplayScale:placeholderImage:opaque:", 0, 0, 1.0);
}

- (void)setCustomText:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  NSAttributedString *v11;
  NSAttributedString *attributedText;
  NSString *v13;
  NSString *customText;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  if ((-[__CFString isEqualToString:](v4, "isEqualToString:", self->_customText) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "AV_indicatorForegroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0CB3498]);
    if (v4)
      v8 = v4;
    else
      v8 = &stru_1E5BB5F88;
    v9 = *MEMORY[0x1E0DC1140];
    v15[0] = *MEMORY[0x1E0DC1138];
    v15[1] = v9;
    v16[0] = v6;
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSAttributedString *)objc_msgSend(v7, "initWithString:attributes:", v8, v10);
    attributedText = self->_attributedText;
    self->_attributedText = v11;

    v13 = (NSString *)-[__CFString copy](v4, "copy");
    customText = self->_customText;
    self->_customText = v13;

    -[CATextLayer setString:](self->_textLayer, "setString:", v4);
    -[AVPictureInPictureIndicatorSublayer setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSublayers
{
  uint64_t v3;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double x;
  double y;
  double width;
  double height;
  double v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v14.receiver = self;
  v14.super_class = (Class)AVPictureInPictureIndicatorSublayer;
  -[AVPictureInPictureIndicatorSublayer layoutSublayers](&v14, sel_layoutSublayers);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVPictureInPictureIndicatorSublayer bounds](self, "bounds");
  v7 = v5 + -16.0 > 32.0 && v6 + -16.0 > 32.0;
  v8 = 8.0;
  if (v7)
    v8 = 16.0;
  v15 = CGRectInset(*(CGRect *)&v3, v8, v8);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  if (-[AVPictureInPictureIndicatorSublayer canRenderAttributedTextWithoutTruncationInsideRect:](self, "canRenderAttributedTextWithoutTruncationInsideRect:"))
  {
    -[AVPictureInPictureIndicatorSublayer layoutSublayersWithTextAndImageUsingInsetBounds:](self, "layoutSublayersWithTextAndImageUsingInsetBounds:", x, y, width, height);
  }
  else
  {
    -[CALayer setHidden:](self->_imageLayer, "setHidden:", 0);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v16 = AVMakeRectWithAspectRatioInsideRect(self->_imageSize, v19);
    -[CALayer setBounds:](self->_imageLayer, "setBounds:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v13 = round(CGRectGetMidX(v17));
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    -[CALayer setPosition:](self->_imageLayer, "setPosition:", v13, round(CGRectGetMidY(v18)));
    -[CATextLayer setHidden:](self->_textLayer, "setHidden:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)layoutSublayersWithTextAndImageUsingInsetBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CATextLayer *textLayer;
  _BOOL8 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double lineHeight;
  double v20;
  double left;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize *p_imageSize;
  double MidY;
  double v31;
  double v32;
  CALayer *imageLayer;
  CGFloat v34;
  _BOOL8 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  CALayer *v53;
  double v54;
  double v55;
  double v56;
  CATextLayer *v57;
  double v58;
  double v59;
  double v60;
  double baselineOffset;
  CGFloat v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  double MidX;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat rect;
  CGFloat rect_8;
  double rect_16;
  CGFloat rect_24;
  CGFloat v84;
  double v85;
  CGFloat v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[AVPictureInPictureIndicatorSublayer bounds](self, "bounds");
  v70 = v9;
  v72 = v8;
  v66 = v11;
  v68 = v10;
  textLayer = self->_textLayer;
  v87.origin.x = x;
  v87.origin.y = y;
  v87.size.width = width;
  v87.size.height = height;
  if (CGRectGetWidth(v87) <= 0.0)
  {
    v13 = 1;
  }
  else
  {
    v88.origin.x = x;
    v88.origin.y = y;
    v88.size.width = width;
    v88.size.height = height;
    v13 = CGRectGetHeight(v88) <= 0.0;
  }
  -[CATextLayer setHidden:](textLayer, "setHidden:", v13);
  -[AVPictureInPictureIndicatorSublayer textBoundingRectWhenDrawnInRect:](self, "textBoundingRectWhenDrawnInRect:", x, y, width, height);
  rect = x;
  rect_8 = y;
  v14 = v89.origin.x;
  v15 = v89.origin.y;
  v16 = v89.size.width;
  v65 = height;
  v17 = v89.size.height;
  v18 = CGRectGetHeight(v89);
  lineHeight = self->_lineHeight;
  if (lineHeight < 13.0)
    lineHeight = 13.0;
  v20 = v18 / lineHeight;
  left = self->_languageAwareOutsets.left;
  v22 = v14 - left;
  v23 = v15 - self->_languageAwareOutsets.top * v20;
  v84 = width;
  v85 = v16 - (-self->_languageAwareOutsets.right - left);
  v24 = v17 - (-(self->_languageAwareOutsets.top * v20) - v20 * self->_languageAwareOutsets.bottom);
  -[AVPictureInPictureIndicatorSublayer textBoundingRectWhenDrawnInRect:](self, "textBoundingRectWhenDrawnInRect:", v22, v23);
  v79 = v25;
  rect_24 = v26;
  v78 = v27;
  v86 = v28;
  p_imageSize = &self->_imageSize;
  v62 = self->_imageSize.width;
  v75 = self->_imageSize.height;
  v90.origin.x = v72;
  v90.origin.y = v70;
  v90.size.width = v68;
  v90.size.height = v66;
  MidX = CGRectGetMidX(v90);
  v91.origin.x = v72;
  v91.origin.y = v70;
  v91.size.width = v68;
  v91.size.height = v66;
  MidY = CGRectGetMidY(v91);
  v76 = v23;
  v77 = v22;
  v92.origin.x = v22;
  v92.origin.y = v23;
  v92.size.width = v85;
  v92.size.height = v24;
  v64 = MidY + CGRectGetMidY(v92);
  v93.origin.x = v79;
  v93.origin.y = rect_24;
  v93.size.width = v78;
  v93.size.height = v86;
  v63 = CGRectGetMidY(v93);
  v94.origin.x = v72;
  v94.origin.y = v70;
  v94.size.width = v68;
  v94.size.height = v66;
  rect_16 = CGRectGetMidX(v94);
  v95.origin.x = v72;
  v95.origin.y = v70;
  v95.size.width = v68;
  v95.size.height = v66;
  v73 = CGRectGetMidY(v95);
  v69 = self->_imageSize.height;
  v71 = self->_imageSize.width;
  baselineOffset = self->_baselineOffset;
  v96.origin.x = rect;
  v96.origin.y = rect_8;
  v96.size.width = width;
  v96.size.height = v65;
  v31 = CGRectGetHeight(v96);
  v97.origin.x = v79;
  v97.origin.y = rect_24;
  v97.size.width = v78;
  v97.size.height = v86;
  v67 = round(24.0 - baselineOffset);
  v32 = v31 - CGRectGetHeight(v97) - v67;
  imageLayer = self->_imageLayer;
  if (v32 >= 48.0)
  {
    v98.origin.x = rect;
    v98.origin.y = rect_8;
    v98.size.width = width;
    v34 = v65;
    v98.size.height = v65;
    v35 = CGRectGetWidth(v98) < v71 / v69 * 48.0;
  }
  else
  {
    v34 = v65;
    v35 = 1;
  }
  v36 = v64 - v63;
  -[CALayer setHidden:](imageLayer, "setHidden:", v35);
  v37 = v75;
  if (-[CALayer isHidden](self->_imageLayer, "isHidden") || self->_imageSize.width * self->_imageSize.height <= 0.0)
  {
    v50 = v62;
    v52 = v73;
  }
  else
  {
    v38 = round(32.0 - baselineOffset);
    v99.origin.x = rect;
    v99.origin.y = rect_8;
    v99.size.width = v84;
    v99.size.height = v34;
    v39 = CGRectGetWidth(v99);
    v40 = p_imageSize->width;
    v41 = self->_imageSize.height;
    if (v39 >= p_imageSize->width)
      v39 = p_imageSize->width;
    if (v32 >= v41)
      v42 = self->_imageSize.height;
    else
      v42 = v32;
    v43 = v39 / v40;
    v44 = v42 / v41;
    if (v43 >= v44)
      v43 = v44;
    v45 = fmin(v43, 1.0);
    v46 = v40 * v45;
    v37 = v41 * v45;
    v100.origin.x = 0.0;
    v100.origin.y = 0.0;
    v100.size.width = v46;
    v100.size.height = v37;
    v47 = v32 - CGRectGetHeight(v100);
    if (v67 >= v47)
      v47 = v67;
    if (v47 >= v38)
      v48 = v38;
    else
      v48 = v47;
    v101.origin.x = v79;
    v101.origin.y = rect_24;
    v101.size.width = v78;
    v101.size.height = v86;
    v49 = CGRectGetHeight(v101) + v48;
    v102.origin.x = 0.0;
    v102.origin.y = 0.0;
    v102.size.width = v46;
    v102.size.height = v37;
    rect_16 = rect_16 + v45 * 3.0;
    v50 = v46;
    v51 = (CGRectGetHeight(v102) + v49) * 0.5;
    v103.origin.x = 0.0;
    v103.origin.y = 0.0;
    v103.size.width = v46;
    v103.size.height = v37;
    v52 = v73 - (v51 - CGRectGetMidY(v103));
    v104.origin.x = v79;
    v104.origin.y = rect_24;
    v104.size.width = v78;
    v104.size.height = v86;
    v36 = v36 + v51 - CGRectGetMidY(v104);
  }
  -[CALayer setPosition:](self->_imageLayer, "setPosition:", round(rect_16), round(v52));
  -[CATextLayer setPosition:](self->_textLayer, "setPosition:", round(MidX), round(v36));
  v53 = self->_imageLayer;
  v105.origin.x = 0.0;
  v105.origin.y = 0.0;
  v105.size.width = v50;
  v105.size.height = v37;
  v54 = round(CGRectGetMinX(v105));
  v106.origin.x = 0.0;
  v106.origin.y = 0.0;
  v106.size.width = v50;
  v106.size.height = v37;
  v55 = round(CGRectGetMinY(v106));
  v107.origin.x = 0.0;
  v107.origin.y = 0.0;
  v107.size.width = v50;
  v107.size.height = v37;
  v56 = round(CGRectGetWidth(v107));
  v108.origin.x = 0.0;
  v108.origin.y = 0.0;
  v108.size.width = v50;
  v108.size.height = v37;
  -[CALayer setBounds:](v53, "setBounds:", v54, v55, v56, round(CGRectGetHeight(v108)));
  v57 = self->_textLayer;
  v109.origin.x = v77;
  v109.origin.y = v76;
  v109.size.width = v85;
  v109.size.height = v24;
  v58 = round(CGRectGetMinX(v109));
  v110.origin.x = v77;
  v110.origin.y = v76;
  v110.size.width = v85;
  v110.size.height = v24;
  v59 = round(CGRectGetMinY(v110));
  v111.origin.x = v77;
  v111.origin.y = v76;
  v111.size.width = v85;
  v111.size.height = v24;
  v60 = round(CGRectGetWidth(v111));
  v112.origin.x = v77;
  v112.origin.y = v76;
  v112.size.width = v85;
  v112.size.height = v24;
  -[CATextLayer setBounds:](v57, "setBounds:", v58, v59, v60, round(CGRectGetHeight(v112)));
}

- (CGRect)textBoundingRectWhenDrawnInRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedText, "boundingRectWithSize:options:context:", 1, 0, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)canRenderAttributedTextWithoutTruncationInsideRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat v5;
  CGFloat v6;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  -[NSAttributedString boundingRectWithSize:options:context:](self->_attributedText, "boundingRectWithSize:options:context:", 1, 0, CGRectGetWidth(a3), 1000.0);
  v9.size.width = v5;
  v9.size.height = v6;
  v8.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v8.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v8.size.width = width;
  v8.size.height = height;
  v9.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v9.origin.y = v8.origin.y;
  return CGRectContainsRect(v8, v9);
}

- (NSString)customText
{
  return self->_customText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customText, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
