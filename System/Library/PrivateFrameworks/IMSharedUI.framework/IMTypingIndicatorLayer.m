@implementation IMTypingIndicatorLayer

- (IMTypingIndicatorLayer)init
{
  IMTypingIndicatorLayer *v2;
  const char *v3;
  uint64_t v4;
  IMTypingIndicatorLayer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMTypingIndicatorLayer;
  v2 = -[IMTypingIndicatorLayer init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend__setup(v2, v3, v4);
  return v5;
}

- (id)initHighlighted:(BOOL)a3
{
  IMTypingIndicatorLayer *v4;
  const char *v5;
  uint64_t v6;
  IMTypingIndicatorLayer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMTypingIndicatorLayer;
  v4 = -[IMTypingIndicatorLayer init](&v9, sel_init);
  v7 = v4;
  if (v4)
  {
    v4->_highlighted = a3;
    objc_msgSend__setup(v4, v5, v6);
  }
  return v7;
}

- (double)convertedCurrentMediaTime
{
  double result;

  CACurrentMediaTime();
  MEMORY[0x24BEDD108](self, sel_convertTime_fromLayer_, 0);
  return result;
}

- (void)setBubbleColor:(id)a3
{
  UIColor *v5;
  const char *v6;
  uint64_t v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  if (self->_bubbleColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_bubbleColor, a3);
    objc_msgSend__updateBubbleColors(self, v6, v7);
    v5 = v8;
  }

}

- (void)setBubbleOpacity:(double)a3
{
  uint64_t v3;

  if (self->_bubbleOpacity != a3)
  {
    self->_bubbleOpacity = a3;
    objc_msgSend__updateBubbleOpacity(self, a2, v3);
  }
}

- (id)resolvedColor:(id)a3 forTraitCollection:(id)a4
{
  id v5;
  const char *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a3;
  v7 = v5;
  if (a4)
  {
    objc_msgSend_resolvedColorWithTraitCollection_(v5, v6, (uint64_t)a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection **p_traitCollection;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  UIColor *v11;
  UIColor *thinkingDotColor;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  UIColor *v17;
  UIColor *bubbleColor;
  const char *v19;
  uint64_t v20;
  CALayer *thinkingDot;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  UITraitCollection *v29;

  v5 = (UITraitCollection *)a3;
  p_traitCollection = &self->_traitCollection;
  if (self->_traitCollection != v5)
  {
    v29 = v5;
    objc_storeStrong((id *)&self->_traitCollection, a3);
    objc_msgSend_defaultThinkingDotColor(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolvedColor_forTraitCollection_(self, v10, (uint64_t)v9, *p_traitCollection);
    v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
    thinkingDotColor = self->_thinkingDotColor;
    self->_thinkingDotColor = v11;

    objc_msgSend_defaultBubbleColor(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resolvedColor_forTraitCollection_(self, v16, (uint64_t)v15, *p_traitCollection);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    bubbleColor = self->_bubbleColor;
    self->_bubbleColor = v17;

    objc_msgSend__updateBubbleColors(self, v19, v20);
    thinkingDot = self->_thinkingDot;
    objc_msgSend_thinkingDotColor(self, v22, v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = objc_msgSend_CGColor(v24, v25, v26);
    objc_msgSend_setBackgroundColor_(thinkingDot, v28, v27);

    v5 = v29;
  }

}

- (void)setIconImage:(id)a3
{
  char *v5;
  char *iconImage;
  char isEqual;
  const char *v8;
  uint64_t v9;
  char *v10;

  v5 = (char *)a3;
  iconImage = (char *)self->_iconImage;
  if (iconImage != v5)
  {
    v10 = v5;
    isEqual = objc_msgSend_isEqual_(iconImage, v5, (uint64_t)v5);
    v5 = v10;
    if ((isEqual & 1) == 0)
    {
      objc_storeStrong(&self->_iconImage, a3);
      objc_msgSend__updateForImage(self, v8, v9);
      v5 = v10;
    }
  }

}

- (void)_setup
{
  uint64_t v2;
  const char *v4;
  UIColor *v5;
  UIColor *thinkingDotColor;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  UIColor *v11;
  UIColor *bubbleColor;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  CALayer *v32;
  CALayer *bubbleContainer;
  CALayer *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  CALayer *v41;
  CALayer *smallBubble;
  void *v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  CALayer *v63;
  CALayer *mediumBubble;
  void *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  CALayer *v85;
  CALayer *largeBubble;
  void *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  CALayer *v107;
  CALayer *thinkingDotContainer;
  CALayer *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  id v128;

  objc_msgSend_defaultThinkingDotColor(self, a2, v2);
  v128 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedColor_forTraitCollection_(self, v4, (uint64_t)v128, self->_traitCollection);
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  thinkingDotColor = self->_thinkingDotColor;
  self->_thinkingDotColor = v5;

  objc_msgSend_defaultBubbleColor(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedColor_forTraitCollection_(self, v10, (uint64_t)v9, self->_traitCollection);
  v11 = (UIColor *)objc_claimAutoreleasedReturnValue();
  bubbleColor = self->_bubbleColor;
  self->_bubbleColor = v11;

  objc_msgSend_defaultThinkingDotOpacity(self, v13, v14);
  self->_thinkingDotOpacity = v15;
  objc_msgSend_defaultBubbleOpacity(self, v16, v17);
  self->_bubbleOpacity = v18;
  objc_msgSend_frame(self, v19, v20);
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_opt_class();
  objc_msgSend_defaultSize(v25, v26, v27);
  objc_msgSend_setFrame_(self, v28, v29, v22, v24, v30, v31);
  v32 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  bubbleContainer = self->_bubbleContainer;
  self->_bubbleContainer = v32;

  v34 = self->_bubbleContainer;
  objc_msgSend_bounds(self, v35, v36);
  objc_msgSend_setFrame_(v34, v37, v38);
  objc_msgSend_setAllowsGroupOpacity_(self->_bubbleContainer, v39, 1);
  objc_msgSend_addSublayer_(self, v40, (uint64_t)self->_bubbleContainer);
  v41 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  smallBubble = self->_smallBubble;
  self->_smallBubble = v41;

  v43 = (void *)objc_opt_class();
  objc_msgSend_smallBubbleFrame(v43, v44, v45);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  objc_msgSend_setCornerRadius_(self->_smallBubble, v54, v55, v50 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_smallBubble, v56, v57, 0.318, 0.318);
  objc_msgSend_setPosition_(self->_smallBubble, v58, v59, v47, v49);
  objc_msgSend_setBounds_(self->_smallBubble, v60, v61, 0.0, 0.0, v51, v53);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v62, (uint64_t)self->_smallBubble);
  v63 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  mediumBubble = self->_mediumBubble;
  self->_mediumBubble = v63;

  v65 = (void *)objc_opt_class();
  objc_msgSend_mediumBubbleFrame(v65, v66, v67);
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  objc_msgSend_setCornerRadius_(self->_mediumBubble, v76, v77, v74 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_mediumBubble, v78, v79, 0.326, 0.37);
  objc_msgSend_setPosition_(self->_mediumBubble, v80, v81, v69, v71);
  objc_msgSend_setBounds_(self->_mediumBubble, v82, v83, 0.0, 0.0, v73, v75);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v84, (uint64_t)self->_mediumBubble);
  v85 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  largeBubble = self->_largeBubble;
  self->_largeBubble = v85;

  v87 = (void *)objc_opt_class();
  objc_msgSend_largeBubbleFrame(v87, v88, v89);
  v91 = v90;
  v93 = v92;
  v95 = v94;
  v97 = v96;
  objc_msgSend_setCornerRadius_(self->_largeBubble, v98, v99, v96 * 0.5);
  objc_msgSend_setAnchorPoint_(self->_largeBubble, v100, v101, 0.185, 0.28);
  objc_msgSend_setPosition_(self->_largeBubble, v102, v103, v91, v93);
  objc_msgSend_setBounds_(self->_largeBubble, v104, v105, 0.0, 0.0, v95, v97);
  objc_msgSend_addSublayer_(self->_bubbleContainer, v106, (uint64_t)self->_largeBubble);
  v107 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  thinkingDotContainer = self->_thinkingDotContainer;
  self->_thinkingDotContainer = v107;

  v109 = self->_thinkingDotContainer;
  objc_msgSend_largeBubble(self, v110, v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_anchorPoint(v112, v113, v114);
  objc_msgSend_setAnchorPoint_(v109, v115, v116);

  objc_msgSend_setPosition_(self->_thinkingDotContainer, v117, v118, v91, v93);
  objc_msgSend_setBounds_(self->_thinkingDotContainer, v119, v120, 0.0, 0.0, v95, v97);
  objc_msgSend_addSublayer_(self, v121, (uint64_t)self->_thinkingDotContainer);
  objc_msgSend__updateBubbleColors(self, v122, v123);
  objc_msgSend__updateBubbleOpacity(self, v124, v125);
  objc_msgSend__updateForImage(self, v126, v127);

}

- (void)_updateForImage
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double MaxX;
  double v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v31;
  CGRect v32;

  objc_msgSend_largeBubble(self, a2, v2);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_frame(v31, v4, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_opt_class();
  objc_msgSend_largeBubbleFrame(v12, v13, v14);
  v18 = v17;
  if (self->_iconImage)
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend_iconImageFrame(v19, v20, v21);
    MaxX = CGRectGetMaxX(v32);
  }
  else
  {
    MaxX = 0.0;
  }
  v23 = v18 + MaxX;
  objc_msgSend_largeBubble(self, v15, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v24, v25, v26, v7, v9, v23, v11);

  objc_msgSend__buildIconImage(self, v27, v28);
  objc_msgSend__buildThinkingDots(self, v29, v30);

}

- (void)_buildIconImage
{
  uint64_t v2;
  void *v4;
  const char *v5;
  id iconImage;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t (*v31)(id, uint64_t, _QWORD);
  uint64_t v32;
  const char *v33;
  const void *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  id v44;

  objc_msgSend_iconImageLayer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  iconImage = self->_iconImage;
  if (iconImage)
  {
    if (v4)
    {
      v44 = v4;
      objc_msgSend_setContents_(v4, v5, (uint64_t)iconImage);
    }
    else
    {
      objc_msgSend_layer(MEMORY[0x24BDE56D0], v5, (uint64_t)iconImage);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_opt_class();
      objc_msgSend_iconImageFrame(v8, v9, v10);
      v12 = v11;
      objc_msgSend_setFrame_(v44, v13, v14);
      v15 = self->_iconImage;
      objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_scale(v18, v19, v20);
      v22 = v21;

      if (v22 == 1.0)
      {
        v25 = 73;
      }
      else
      {
        objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_scale(v26, v27, v28);
        v30 = v29;

        if (v30 == 2.0)
          v25 = 74;
        else
          v25 = 75;
      }
      v31 = (uint64_t (*)(id, uint64_t, _QWORD))MEMORY[0x212BA5EF4]("LICreateIconForImage", CFSTR("MobileIcons"));
      v32 = v31(v15, v25, 0);
      if (v32)
      {
        v34 = (const void *)v32;
        objc_msgSend_setContents_(v44, v33, v32);
        CFAutorelease(v34);
      }
      else
      {
        objc_msgSend_setMasksToBounds_(v44, v33, 1);
        objc_msgSend_setCornerCurve_(v44, v36, *MEMORY[0x24BDE58E8]);
        objc_msgSend_setCornerRadius_(v44, v37, v38, v12 * 0.5);
        objc_msgSend_setContents_(v44, v39, (uint64_t)self->_iconImage);
      }
      objc_msgSend_setIconImageLayer_(self, v35, (uint64_t)v44);
      objc_msgSend_largeBubble(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addSublayer_(v42, v43, (uint64_t)v44);

    }
  }
  else
  {
    v44 = v4;
    objc_msgSend_removeFromSuperlayer(v4, v5, 0);
    objc_msgSend_setIconImageLayer_(self, v7, 0);
  }

}

- (void)_buildThinkingDots
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  CALayer *thinkingDot;
  CAReplicatorLayer *thinkingDots;
  const char *v14;
  uint64_t v15;
  CALayer *v16;
  CALayer *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  CALayer *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  const char *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  CALayer *v70;
  double v71;
  const char *v72;
  uint64_t v73;
  CAReplicatorLayer *v74;
  CAReplicatorLayer *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  double MaxX;
  void *v90;
  const char *v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  CAReplicatorLayer *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  CGFloat v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  CATransform3D v109;
  _QWORD v110[3];
  CGRect v111;

  v110[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_begin(MEMORY[0x24BDE57D8], a2, v2);
  objc_msgSend_setAnimationDuration_(MEMORY[0x24BDE57D8], v4, v5, 0.0);
  objc_msgSend_removeAllAnimations(self->_thinkingDot, v6, v7);
  objc_msgSend_removeFromSuperlayer(self->_thinkingDots, v8, v9);
  objc_msgSend_removeFromSuperlayer(self->_thinkingDot, v10, v11);
  thinkingDot = self->_thinkingDot;
  self->_thinkingDot = 0;

  thinkingDots = self->_thinkingDots;
  self->_thinkingDots = 0;

  objc_msgSend_layer(MEMORY[0x24BDE56D0], v14, v15);
  v16 = (CALayer *)objc_claimAutoreleasedReturnValue();
  v17 = self->_thinkingDot;
  self->_thinkingDot = v16;

  v18 = (void *)objc_opt_class();
  objc_msgSend_thinkingDotDiameter(v18, v19, v20);
  v22 = v21;
  objc_msgSend_setFrame_(self->_thinkingDot, v23, v24, 0.0, 0.0, v22, v22);
  objc_msgSend_setCornerRadius_(self->_thinkingDot, v25, v26, v22 * 0.5);
  v27 = self->_thinkingDot;
  objc_msgSend_thinkingDotColor(self, v28, v29);
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v33 = objc_msgSend_CGColor(v30, v31, v32);
  objc_msgSend_setBackgroundColor_(v27, v34, v33);

  v35 = (void *)objc_opt_class();
  if (objc_msgSend_supportsTypingIndicatorAnimation(v35, v36, v37))
  {
    objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v38, (uint64_t)CFSTR("opacity"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v110[0] = &unk_24C755828;
    v41 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_thinkingDotOpacity(self, v42, v43);
    objc_msgSend_numberWithDouble_(v41, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v110[1] = v46;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v47, (uint64_t)v110, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValues_(v40, v49, (uint64_t)v48);

    objc_msgSend_setKeyTimes_(v40, v50, (uint64_t)&unk_24C755968);
    objc_msgSend_setCalculationMode_(v40, v51, *MEMORY[0x24BDE5848]);
    objc_msgSend_setDuration_(v40, v52, v53, 0.5);
    LODWORD(v54) = 1061271823;
    LODWORD(v55) = 1014679044;
    LODWORD(v56) = 1058306785;
    LODWORD(v57) = 1.0;
    objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v58, v59, v54, v55, v56, v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTimingFunction_(v40, v61, (uint64_t)v60);

    LODWORD(v62) = 2139095040;
    objc_msgSend_setRepeatCount_(v40, v63, v64, v62);
    objc_msgSend_setAutoreverses_(v40, v65, 1);
    objc_msgSend_setFillMode_(v40, v66, *MEMORY[0x24BDE5970]);
    objc_msgSend_addAnimation_forKey_(self->_thinkingDot, v67, (uint64_t)v40, CFSTR("Opacity"));

  }
  else
  {
    v70 = self->_thinkingDot;
    objc_msgSend_thinkingDotOpacity(self, v38, v39);
    *(float *)&v71 = v71;
    objc_msgSend_setOpacity_(v70, v72, v73, v71);
  }
  objc_msgSend_layer(MEMORY[0x24BDE5748], v68, v69);
  v74 = (CAReplicatorLayer *)objc_claimAutoreleasedReturnValue();
  v75 = self->_thinkingDots;
  self->_thinkingDots = v74;

  v76 = (void *)objc_opt_class();
  objc_msgSend_thinkingDotsOffset(v76, v77, v78);
  v80 = v79;
  v82 = v81;
  objc_msgSend_iconImage(self, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
  {
    v86 = (void *)objc_opt_class();
    objc_msgSend_iconImageFrame(v86, v87, v88);
    MaxX = CGRectGetMaxX(v111);
    v90 = (void *)objc_opt_class();
    objc_msgSend_iconImageTrailingSpace(v90, v91, v92);
    v80 = MaxX + v93;
  }

  objc_msgSend_setFrame_(self->_thinkingDots, v94, v95, v80, v82, 0.0, 0.0);
  objc_msgSend_setInstanceCount_(self->_thinkingDots, v96, 3);
  v97 = self->_thinkingDots;
  v98 = (void *)objc_opt_class();
  objc_msgSend_thinkingDotSpace(v98, v99, v100);
  CATransform3DMakeTranslation(&v109, v101, 0.0, 0.0);
  objc_msgSend_setInstanceTransform_(v97, v102, (uint64_t)&v109);
  objc_msgSend_setInstanceDelay_(self->_thinkingDots, v103, v104, 0.25);
  objc_msgSend_addSublayer_(self->_thinkingDots, v105, (uint64_t)self->_thinkingDot);
  objc_msgSend_addSublayer_(self->_thinkingDotContainer, v106, (uint64_t)self->_thinkingDots);
  objc_msgSend_commit(MEMORY[0x24BDE57D8], v107, v108);
}

- (void)_updateBubbleColors
{
  uint64_t v2;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  id v19;

  objc_msgSend_bubbleColor(self, a2, v2);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend_CGColor(v4, v5, v6);

  objc_msgSend_largeBubble(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v10, v11, v7);

  objc_msgSend_mediumBubble(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v14, v15, v7);

  objc_msgSend_smallBubble(self, v16, v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBackgroundColor_(v19, v18, v7);

}

- (void)_updateBubbleOpacity
{
  uint64_t v2;
  void *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  double v17;
  const char *v18;
  uint64_t v19;
  CALayer *bubbleContainer;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;

  objc_msgSend_largeBubble(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1.0;
  objc_msgSend_setOpacity_(v4, v6, v7, v5);

  objc_msgSend_mediumBubble(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1.0;
  objc_msgSend_setOpacity_(v10, v12, v13, v11);

  objc_msgSend_smallBubble(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1.0;
  objc_msgSend_setOpacity_(v16, v18, v19, v17);

  bubbleContainer = self->_bubbleContainer;
  objc_msgSend_bubbleOpacity(self, v21, v22);
  *(float *)&v23 = v23;
  objc_msgSend_setOpacity_(bubbleContainer, v24, v25, v23);
}

- (id)_smallBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  const char *v26;
  void *v27;
  float v28;
  double v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  double v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  double v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  const char *v61;
  void *v62;
  float v63;
  double v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  double v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  double v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  double v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  const char *v94;
  const char *v95;
  void *v96;
  double v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  const char *v110;
  uint64_t v111;
  double v112;
  double v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  void *v123;
  _QWORD v125[4];
  _QWORD v126[3];
  _QWORD v127[4];

  y = a4.y;
  x = a4.x;
  v127[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], a2, (uint64_t)CFSTR("hidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v7, v10, (uint64_t)v9);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v7, v13, (uint64_t)v12);

  objc_msgSend_setDuration_(v7, v14, v15, 0.0);
  v16 = *MEMORY[0x24BDE5978];
  objc_msgSend_setFillMode_(v7, v17, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v7, v18, 1);
  v19 = (void *)objc_opt_class();
  objc_msgSend_smallBubbleGrowOffset(v19, v20, v21);
  v23 = v22;
  v25 = v24;
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v26, (uint64_t)CFSTR("position.x"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = x;
  *(float *)&v29 = v28;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v30, v31, v29);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v32;
  v33 = x + v23;
  *(float *)&v33 = x + v23;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v34, v35, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v36;
  *(float *)&v37 = x;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v38, v39, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v40;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v41, (uint64_t)v127, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v27, v43, (uint64_t)v42);

  v44 = *MEMORY[0x24BDE5838];
  objc_msgSend_setCalculationMode_(v27, v45, *MEMORY[0x24BDE5838]);
  objc_msgSend_setDuration_(v27, v46, v47, 0.4);
  LODWORD(v48) = 0.25;
  LODWORD(v49) = 0.25;
  LODWORD(v50) = 1.0;
  LODWORD(v51) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v52, v53, v48, v51, v49, v50);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v27, v55, (uint64_t)v54);

  *(float *)&a3 = a3;
  LODWORD(v56) = LODWORD(a3);
  objc_msgSend_setSpeed_(v27, v57, v58, v56);
  objc_msgSend_setFillMode_(v27, v59, v16);
  objc_msgSend_setRemovedOnCompletion_(v27, v60, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v61, (uint64_t)CFSTR("position.y"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = y;
  *(float *)&v64 = v63;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v65, v66, v64);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v67;
  v68 = y + v25;
  *(float *)&v68 = y + v25;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v69, v70, v68);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v71;
  *(float *)&v72 = y;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v73, v74, v72);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v75;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v76, (uint64_t)v126, 3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v62, v78, (uint64_t)v77);

  objc_msgSend_setCalculationMode_(v62, v79, v44);
  objc_msgSend_setDuration_(v62, v80, v81, 0.4);
  LODWORD(v82) = 1051315048;
  LODWORD(v83) = 1057991709;
  LODWORD(v84) = 1064582806;
  LODWORD(v85) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v86, v87, v82, v85, v83, v84);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v62, v89, (uint64_t)v88);

  LODWORD(v90) = LODWORD(a3);
  objc_msgSend_setSpeed_(v62, v91, v92, v90);
  objc_msgSend_setFillMode_(v62, v93, v16);
  objc_msgSend_setRemovedOnCompletion_(v62, v94, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v95, (uint64_t)CFSTR("transform.scale.xy"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v97) = 0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v98, v99, v97);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v96, v101, (uint64_t)v100);

  LODWORD(v102) = 1.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v103, v104, v102);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v96, v106, (uint64_t)v105);

  objc_msgSend_setDuration_(v96, v107, v108, 0.25);
  LODWORD(v109) = LODWORD(a3);
  objc_msgSend_setSpeed_(v96, v110, v111, v109);
  LODWORD(v112) = 0.25;
  LODWORD(v113) = 0.25;
  LODWORD(v114) = 1.0;
  LODWORD(v115) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v116, v117, v112, v115, v113, v114);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v96, v119, (uint64_t)v118);

  objc_msgSend_setFillMode_(v96, v120, v16);
  objc_msgSend_setRemovedOnCompletion_(v96, v121, 1);
  v125[0] = v7;
  v125[1] = v27;
  v125[2] = v62;
  v125[3] = v96;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v122, (uint64_t)v125, 4);
  v123 = (void *)objc_claimAutoreleasedReturnValue();

  return v123;
}

- (id)_smallBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;

  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], a2, (uint64_t)CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_24C755980);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x24BDE5838]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_24C755998);
  objc_msgSend_setDuration_(v7, v11, v12, 0.7);
  objc_msgSend_convertedCurrentMediaTime(self, v13, v14);
  objc_msgSend_setBeginTime_(v7, v16, v17, v15 + a4);
  *(float *)&v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  objc_msgSend_functionWithName_(MEMORY[0x24BDE56F0], v21, *MEMORY[0x24BDE5D20]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (id)_mediumBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  const char *v27;
  void *v28;
  float v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  const char *v68;
  void *v69;
  float v70;
  double v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  void *v108;
  double v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  double v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  double v126;
  const char *v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  double v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  void *v140;
  IMTypingIndicatorLayer *v142;
  _QWORD v143[4];
  _QWORD v144[3];
  _QWORD v145[5];

  y = a4.y;
  x = a4.x;
  v145[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], a2, (uint64_t)CFSTR("hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v8, v11, (uint64_t)v10);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v8, v14, (uint64_t)v13);

  objc_msgSend_setDuration_(v8, v15, v16, 0.25);
  v17 = *MEMORY[0x24BDE5978];
  objc_msgSend_setFillMode_(v8, v18, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v8, v19, 1);
  v142 = self;
  v20 = (void *)objc_opt_class();
  objc_msgSend_mediumBubbleGrowOffset(v20, v21, v22);
  v24 = v23;
  v26 = v25;
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v27, (uint64_t)CFSTR("position.x"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = x;
  *(float *)&v30 = v29;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v31, v32, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v33;
  v34 = x + v24;
  *(float *)&v34 = x + v24;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v35, v36, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v37;
  *(float *)&v38 = x;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v39, v40, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v41;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v42, (uint64_t)v145, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v28, v44, (uint64_t)v43);

  v45 = *MEMORY[0x24BDE5838];
  objc_msgSend_setCalculationMode_(v28, v46, *MEMORY[0x24BDE5838]);
  objc_msgSend_convertedCurrentMediaTime(self, v47, v48);
  objc_msgSend_setBeginTime_(v28, v50, v51, v49 + 0.065);
  objc_msgSend_setDuration_(v28, v52, v53, 0.4);
  LODWORD(v54) = 0.25;
  LODWORD(v55) = 0.25;
  LODWORD(v56) = 1.0;
  LODWORD(v57) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v58, v59, v54, v57, v55, v56);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v28, v61, (uint64_t)v60);

  *(float *)&a3 = a3;
  LODWORD(v62) = LODWORD(a3);
  objc_msgSend_setSpeed_(v28, v63, v64, v62);
  v65 = v17;
  objc_msgSend_setFillMode_(v28, v66, v17);
  objc_msgSend_setRemovedOnCompletion_(v28, v67, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v68, (uint64_t)CFSTR("position.y"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = y;
  *(float *)&v71 = v70;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v72, v73, v71);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v74;
  v75 = y + v26;
  *(float *)&v75 = y + v26;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v76, v77, v75);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v78;
  *(float *)&v79 = y;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v80, v81, v79);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v82;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v83, (uint64_t)v144, 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v69, v85, (uint64_t)v84);

  objc_msgSend_setCalculationMode_(v69, v86, v45);
  objc_msgSend_convertedCurrentMediaTime(v142, v87, v88);
  objc_msgSend_setBeginTime_(v69, v90, v91, v89 + 0.065);
  objc_msgSend_setDuration_(v69, v92, v93, 0.4);
  LODWORD(v94) = 1051315048;
  LODWORD(v95) = 1057991709;
  LODWORD(v96) = 1064582806;
  LODWORD(v97) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v98, v99, v94, v97, v95, v96);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v69, v101, (uint64_t)v100);

  LODWORD(v102) = LODWORD(a3);
  objc_msgSend_setSpeed_(v69, v103, v104, v102);
  objc_msgSend_setFillMode_(v69, v105, v65);
  objc_msgSend_setRemovedOnCompletion_(v69, v106, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v107, (uint64_t)CFSTR("transform.scale.xy"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v109) = 0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v110, v111, v109);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v108, v113, (uint64_t)v112);

  LODWORD(v114) = 1.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v115, v116, v114);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v108, v118, (uint64_t)v117);

  objc_msgSend_convertedCurrentMediaTime(v142, v119, v120);
  objc_msgSend_setBeginTime_(v108, v122, v123, v121 + 0.065);
  objc_msgSend_setDuration_(v108, v124, v125, 0.25);
  LODWORD(v126) = LODWORD(a3);
  objc_msgSend_setSpeed_(v108, v127, v128, v126);
  LODWORD(v129) = 0.25;
  LODWORD(v130) = 0.25;
  LODWORD(v131) = 1.0;
  LODWORD(v132) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v133, v134, v129, v132, v130, v131);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v108, v136, (uint64_t)v135);

  objc_msgSend_setFillMode_(v108, v137, v65);
  objc_msgSend_setRemovedOnCompletion_(v108, v138, 1);
  v143[0] = v8;
  v143[1] = v28;
  v143[2] = v69;
  v143[3] = v108;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v139, (uint64_t)v143, 4);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  return v140;
}

- (id)_mediumBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;

  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], a2, (uint64_t)CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_24C7559B0);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x24BDE5838]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_24C7559C8);
  objc_msgSend_convertedCurrentMediaTime(self, v11, v12);
  objc_msgSend_setBeginTime_(v7, v14, v15, v13 + a4);
  objc_msgSend_setDuration_(v7, v16, v17, 0.9);
  *(float *)&v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  objc_msgSend_functionWithName_(MEMORY[0x24BDE56F0], v21, *MEMORY[0x24BDE5D20]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (id)_largeBubbleGrowAnimationsWithSpeed:(double)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  const char *v27;
  void *v28;
  float v29;
  double v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  double v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  double v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  double v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  const char *v68;
  void *v69;
  float v70;
  double v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  const char *v86;
  const char *v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  double v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  double v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  const char *v106;
  const char *v107;
  void *v108;
  double v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  double v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  const char *v119;
  uint64_t v120;
  double v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  double v126;
  const char *v127;
  uint64_t v128;
  double v129;
  double v130;
  double v131;
  double v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  const char *v138;
  const char *v139;
  void *v140;
  IMTypingIndicatorLayer *v142;
  _QWORD v143[4];
  _QWORD v144[3];
  _QWORD v145[5];

  y = a4.y;
  x = a4.x;
  v145[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], a2, (uint64_t)CFSTR("hidden"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v8, v11, (uint64_t)v10);

  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v8, v14, (uint64_t)v13);

  objc_msgSend_setDuration_(v8, v15, v16, 0.25);
  v17 = *MEMORY[0x24BDE5978];
  objc_msgSend_setFillMode_(v8, v18, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v8, v19, 1);
  v142 = self;
  v20 = (void *)objc_opt_class();
  objc_msgSend_largeBubbleGrowOffset(v20, v21, v22);
  v24 = v23;
  v26 = v25;
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v27, (uint64_t)CFSTR("position.x"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = x;
  *(float *)&v30 = v29;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v31, v32, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v33;
  v34 = x + v24;
  *(float *)&v34 = x + v24;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v35, v36, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v37;
  *(float *)&v38 = x;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v39, v40, v38);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v145[2] = v41;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v42, (uint64_t)v145, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v28, v44, (uint64_t)v43);

  v45 = *MEMORY[0x24BDE5838];
  objc_msgSend_setCalculationMode_(v28, v46, *MEMORY[0x24BDE5838]);
  objc_msgSend_convertedCurrentMediaTime(self, v47, v48);
  objc_msgSend_setBeginTime_(v28, v50, v51, v49 + 0.12);
  objc_msgSend_setDuration_(v28, v52, v53, 0.4);
  LODWORD(v54) = 0.25;
  LODWORD(v55) = 0.25;
  LODWORD(v56) = 1.0;
  LODWORD(v57) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v58, v59, v54, v57, v55, v56);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v28, v61, (uint64_t)v60);

  *(float *)&a3 = a3;
  LODWORD(v62) = LODWORD(a3);
  objc_msgSend_setSpeed_(v28, v63, v64, v62);
  v65 = v17;
  objc_msgSend_setFillMode_(v28, v66, v17);
  objc_msgSend_setRemovedOnCompletion_(v28, v67, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v68, (uint64_t)CFSTR("position.y"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = y;
  *(float *)&v71 = v70;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v72, v73, v71);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v74;
  v75 = y + v26;
  *(float *)&v75 = y + v26;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v76, v77, v75);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v78;
  *(float *)&v79 = y;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v80, v81, v79);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v82;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v83, (uint64_t)v144, 3);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v69, v85, (uint64_t)v84);

  objc_msgSend_setCalculationMode_(v69, v86, v45);
  objc_msgSend_convertedCurrentMediaTime(v142, v87, v88);
  objc_msgSend_setBeginTime_(v69, v90, v91, v89 + 0.12);
  objc_msgSend_setDuration_(v69, v92, v93, 0.4);
  LODWORD(v94) = 1045836616;
  LODWORD(v95) = 1048849804;
  LODWORD(v96) = 1057991709;
  LODWORD(v97) = 1064582806;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v98, v99, v94, v95, v96, v97);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v69, v101, (uint64_t)v100);

  LODWORD(v102) = LODWORD(a3);
  objc_msgSend_setSpeed_(v69, v103, v104, v102);
  objc_msgSend_setFillMode_(v69, v105, v65);
  objc_msgSend_setRemovedOnCompletion_(v69, v106, 1);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v107, (uint64_t)CFSTR("transform.scale.xy"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v109) = 0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v110, v111, v109);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v108, v113, (uint64_t)v112);

  LODWORD(v114) = 1.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v115, v116, v114);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v108, v118, (uint64_t)v117);

  objc_msgSend_convertedCurrentMediaTime(v142, v119, v120);
  objc_msgSend_setBeginTime_(v108, v122, v123, v121 + 0.12);
  objc_msgSend_setDuration_(v108, v124, v125, 0.25);
  LODWORD(v126) = LODWORD(a3);
  objc_msgSend_setSpeed_(v108, v127, v128, v126);
  LODWORD(v129) = 0.25;
  LODWORD(v130) = 0.25;
  LODWORD(v131) = 1.0;
  LODWORD(v132) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v133, v134, v129, v132, v130, v131);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v108, v136, (uint64_t)v135);

  objc_msgSend_setFillMode_(v108, v137, v65);
  objc_msgSend_setRemovedOnCompletion_(v108, v138, 1);
  v143[0] = v8;
  v143[1] = v28;
  v143[2] = v69;
  v143[3] = v108;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v139, (uint64_t)v143, 4);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  return v140;
}

- (id)_largeBubblePulseAnimationWithSpeed:(double)a3 delay:(double)a4
{
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  double v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  const char *v29;

  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], a2, (uint64_t)CFSTR("transform.scale.xy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v7, v8, (uint64_t)&unk_24C7559E0);
  objc_msgSend_setCalculationMode_(v7, v9, *MEMORY[0x24BDE5838]);
  objc_msgSend_setTensionValues_(v7, v10, (uint64_t)&unk_24C7559F8);
  objc_msgSend_convertedCurrentMediaTime(self, v11, v12);
  objc_msgSend_setBeginTime_(v7, v14, v15, v13 + a4);
  objc_msgSend_setDuration_(v7, v16, v17, 1.9);
  *(float *)&v18 = a3;
  objc_msgSend_setSpeed_(v7, v19, v20, v18);
  objc_msgSend_functionWithName_(MEMORY[0x24BDE56F0], v21, *MEMORY[0x24BDE5D20]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v7, v23, (uint64_t)v22);

  LODWORD(v24) = 2139095040;
  objc_msgSend_setRepeatCount_(v7, v25, v26, v24);
  objc_msgSend_setAutoreverses_(v7, v27, 1);
  objc_msgSend_setFillMode_(v7, v28, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v7, v29, 0);
  return v7;
}

- (void)startGrowAnimationWithCompletionBlock:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  double v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, const char *, uint64_t);
  void *v69;
  IMTypingIndicatorLayer *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_begin(MEMORY[0x24BDE57D8], v5, v6);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v7 = (void *)objc_opt_class();
  objc_msgSend_smallBubbleFrame(v7, v8, v9);
  objc_msgSend__smallBubbleGrowAnimationsWithSpeed_offset_(self, v10, v11, 1.0, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v84, v91, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v85;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v85 != v19)
          objc_enumerationMutation(v14);
        objc_msgSend_addAnimation_forKey_(self->_smallBubble, v17, *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v20++), 0);
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v84, v91, 16);
    }
    while (v18);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v21 = (void *)objc_opt_class();
  objc_msgSend_mediumBubbleFrame(v21, v22, v23);
  objc_msgSend__mediumBubbleGrowAnimationsWithSpeed_offset_(self, v24, v25, 1.0, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v80, v90, 16);
  if (v30)
  {
    v32 = v30;
    v33 = *(_QWORD *)v81;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v81 != v33)
          objc_enumerationMutation(v28);
        objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v31, *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v34++), 0);
      }
      while (v32 != v34);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v80, v90, 16);
    }
    while (v32);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend_position(self->_largeBubble, v35, v36);
  objc_msgSend__largeBubbleGrowAnimationsWithSpeed_offset_(self, v37, v38, 1.0, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v76, v89, 16);
  if (v43)
  {
    v45 = v43;
    v46 = *(_QWORD *)v77;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v77 != v46)
          objc_enumerationMutation(v41);
        objc_msgSend_addAnimation_forKey_(self->_largeBubble, v44, *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v47++), 0);
      }
      while (v45 != v47);
      v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v76, v89, 16);
    }
    while (v45);
  }

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend_position(self->_largeBubble, v48, v49);
  objc_msgSend__largeBubbleGrowAnimationsWithSpeed_offset_(self, v50, v51, 1.0, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v72, v88, 16);
  if (v56)
  {
    v58 = v56;
    v59 = *(_QWORD *)v73;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v73 != v59)
          objc_enumerationMutation(v54);
        objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v57, *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v60++), 0);
      }
      while (v58 != v60);
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v72, v88, 16);
    }
    while (v58);
  }

  v61 = (void *)MEMORY[0x24BDE57D8];
  v66 = MEMORY[0x24BDAC760];
  v67 = 3221225472;
  v68 = sub_20D654C40;
  v69 = &unk_24C7510B8;
  v70 = self;
  v71 = v4;
  v62 = v4;
  objc_msgSend_setCompletionBlock_(v61, v63, (uint64_t)&v66);
  objc_msgSend_commit(MEMORY[0x24BDE57D8], v64, v65, v66, v67, v68, v69, v70);

}

- (void)startGrowAnimation
{
  MEMORY[0x24BEDD108](self, sel_startGrowAnimationWithCompletionBlock_, 0);
}

- (void)startPulseAnimation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  CALayer *smallBubble;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CALayer *mediumBubble;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  CALayer *largeBubble;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  CALayer *thinkingDotContainer;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  v3 = (void *)objc_opt_class();
  if (objc_msgSend_supportsTypingIndicatorAnimation(v3, v4, v5))
  {
    objc_msgSend_stopPulseAnimation(self, v6, v7);
    objc_msgSend_begin(MEMORY[0x24BDE57D8], v8, v9);
    smallBubble = self->_smallBubble;
    objc_msgSend__smallBubblePulseAnimationWithSpeed_delay_(self, v11, v12, 1.0, 0.25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAnimation_forKey_(smallBubble, v14, (uint64_t)v13, CFSTR("kCKAnimationKeyPulse"));

    mediumBubble = self->_mediumBubble;
    objc_msgSend__mediumBubblePulseAnimationWithSpeed_delay_(self, v16, v17, 1.0, 0.314999998);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAnimation_forKey_(mediumBubble, v19, (uint64_t)v18, CFSTR("kCKAnimationKeyPulse"));

    largeBubble = self->_largeBubble;
    objc_msgSend__largeBubblePulseAnimationWithSpeed_delay_(self, v21, v22, 1.0, 0.370000005);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAnimation_forKey_(largeBubble, v24, (uint64_t)v23, CFSTR("kCKAnimationKeyPulse"));

    thinkingDotContainer = self->_thinkingDotContainer;
    objc_msgSend__largeBubblePulseAnimationWithSpeed_delay_(self, v26, v27, 1.0, 0.370000005);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addAnimation_forKey_(thinkingDotContainer, v29, (uint64_t)v28, CFSTR("kCKAnimationKeyPulse"));

    objc_msgSend__buildThinkingDots(self, v30, v31);
    objc_msgSend_commit(MEMORY[0x24BDE57D8], v32, v33);
  }
}

- (void)stopPulseAnimation
{
  uint64_t v2;
  double v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;

  objc_msgSend_thinkingDotOpacity(self, a2, v2);
  *(float *)&v4 = v4;
  objc_msgSend_setOpacity_(self->_thinkingDot, v5, v6, v4);
  objc_msgSend_removeAllAnimations(self->_thinkingDot, v7, v8);
  objc_msgSend_removeAnimationForKey_(self->_smallBubble, v9, (uint64_t)CFSTR("kCKAnimationKeyPulse"));
  objc_msgSend_removeAnimationForKey_(self->_mediumBubble, v10, (uint64_t)CFSTR("kCKAnimationKeyPulse"));
  objc_msgSend_removeAnimationForKey_(self->_largeBubble, v11, (uint64_t)CFSTR("kCKAnimationKeyPulse"));
  objc_msgSend_removeAnimationForKey_(self->_thinkingDotContainer, v12, (uint64_t)CFSTR("kCKAnimationKeyPulse"));
}

- (void)startShrinkAnimationWithCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  double v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  double v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  double v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  void *v93;
  float v94;
  double v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  double v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  double v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  void *v108;
  const char *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  double v117;
  double v118;
  double v119;
  double v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  double v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  id v138;
  uint64_t v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[3];
  _QWORD v143[5];

  v143[3] = *MEMORY[0x24BDAC8D0];
  v138 = a3;
  objc_msgSend_stopPulseAnimation(self, v4, v5);
  objc_msgSend_begin(MEMORY[0x24BDE57D8], v6, v7);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE5648], v8, (uint64_t)CFSTR("transform.scale.xy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 1.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v11, v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromValue_(v9, v14, (uint64_t)v13);

  LODWORD(v15) = 0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v16, v17, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setToValue_(v9, v19, (uint64_t)v18);

  objc_msgSend_convertedCurrentMediaTime(self, v20, v21);
  objc_msgSend_setBeginTime_(v9, v22, v23);
  objc_msgSend_setDuration_(v9, v24, v25, 0.25);
  LODWORD(v26) = 1.0;
  objc_msgSend_setSpeed_(v9, v27, v28, v26);
  LODWORD(v29) = 0.25;
  LODWORD(v30) = 0.25;
  LODWORD(v31) = 1.0;
  LODWORD(v32) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v33, v34, v29, v32, v30, v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v9, v36, (uint64_t)v35);

  v139 = *MEMORY[0x24BDE5978];
  objc_msgSend_setFillMode_(v9, v37, *MEMORY[0x24BDE5978]);
  objc_msgSend_setRemovedOnCompletion_(v9, v38, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v39, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v40, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v41, (uint64_t)v9, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v42, (uint64_t)v9, 0);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v43, (uint64_t)CFSTR("position.x"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_opt_class();
  objc_msgSend_largeBubbleFrame(v45, v46, v47);
  v49 = v48;
  v51 = v50;
  v52 = v48;
  *(float *)&v48 = v52;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v53, v54, v48);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v55;
  v56 = v49 + 5.0;
  *(float *)&v56 = v49 + 5.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v57, v58, v56);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v59;
  *(float *)&v60 = v52;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v61, v62, v60);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2] = v63;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v64, (uint64_t)v143, 3);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v44, v66, (uint64_t)v65);

  v67 = *MEMORY[0x24BDE5838];
  objc_msgSend_setCalculationMode_(v44, v68, *MEMORY[0x24BDE5838]);
  objc_msgSend_convertedCurrentMediaTime(self, v69, v70);
  objc_msgSend_setBeginTime_(v44, v71, v72);
  objc_msgSend_setDuration_(v44, v73, v74, 0.25);
  LODWORD(v75) = 0.25;
  LODWORD(v76) = 0.25;
  LODWORD(v77) = 1.0;
  LODWORD(v78) = 1036831949;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v79, v80, v75, v78, v76, v77);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v44, v82, (uint64_t)v81);

  LODWORD(v83) = 1.0;
  objc_msgSend_setSpeed_(v44, v84, v85, v83);
  objc_msgSend_setFillMode_(v44, v86, v139);
  objc_msgSend_setRemovedOnCompletion_(v44, v87, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v88, (uint64_t)v44, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v89, (uint64_t)v44, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v90, (uint64_t)v44, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v91, (uint64_t)v44, 0);
  objc_msgSend_animationWithKeyPath_(MEMORY[0x24BDE56C0], v92, (uint64_t)CFSTR("position.y"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v51;
  *(float *)&v95 = v94;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v96, v97, v95);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v98;
  v99 = v51 + -6.0;
  *(float *)&v99 = v51 + -6.0;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v100, v101, v99);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v102;
  *(float *)&v103 = v51;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v104, v105, v103);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v106;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v107, (uint64_t)v142, 3);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValues_(v93, v109, (uint64_t)v108);

  objc_msgSend_setCalculationMode_(v93, v110, v67);
  objc_msgSend_convertedCurrentMediaTime(self, v111, v112);
  objc_msgSend_setBeginTime_(v93, v113, v114);
  objc_msgSend_setDuration_(v93, v115, v116, 0.25);
  LODWORD(v117) = 1045836616;
  LODWORD(v118) = 1048849804;
  LODWORD(v119) = 1057991709;
  LODWORD(v120) = 1064582806;
  objc_msgSend_functionWithControlPoints__::(MEMORY[0x24BDE56F0], v121, v122, v117, v118, v119, v120);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimingFunction_(v93, v124, (uint64_t)v123);

  LODWORD(v125) = 1.0;
  objc_msgSend_setSpeed_(v93, v126, v127, v125);
  objc_msgSend_setFillMode_(v93, v128, v139);
  objc_msgSend_setRemovedOnCompletion_(v93, v129, 1);
  objc_msgSend_addAnimation_forKey_(self->_smallBubble, v130, (uint64_t)v93, 0);
  objc_msgSend_addAnimation_forKey_(self->_mediumBubble, v131, (uint64_t)v93, 0);
  objc_msgSend_addAnimation_forKey_(self->_largeBubble, v132, (uint64_t)v93, 0);
  objc_msgSend_addAnimation_forKey_(self->_thinkingDotContainer, v133, (uint64_t)v93, 0);
  if (v138)
  {
    v136 = (void *)MEMORY[0x24BDE57D8];
    v140[0] = MEMORY[0x24BDAC760];
    v140[1] = 3221225472;
    v140[2] = sub_20D65540C;
    v140[3] = &unk_24C7510E0;
    v141 = v138;
    objc_msgSend_setCompletionBlock_(v136, v137, (uint64_t)v140);

  }
  objc_msgSend_commit(MEMORY[0x24BDE57D8], v134, v135);

}

- (void)stopAnimation
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_stopPulseAnimation(self, a2, v2);
  objc_msgSend_removeAllAnimations(self->_smallBubble, v4, v5);
  objc_msgSend_removeAllAnimations(self->_mediumBubble, v6, v7);
  objc_msgSend_removeAllAnimations(self->_largeBubble, v8, v9);
  objc_msgSend_removeAllAnimations(self->_thinkingDotContainer, v10, v11);
}

- (BOOL)hasDarkBackground
{
  return self->_hasDarkBackground;
}

- (void)setHasDarkBackground:(BOOL)a3
{
  self->_hasDarkBackground = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (id)iconImage
{
  return self->_iconImage;
}

- (UIColor)bubbleColor
{
  return self->_bubbleColor;
}

- (UIColor)thinkingDotColor
{
  return self->_thinkingDotColor;
}

- (void)setThinkingDotColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)bubbleOpacity
{
  return self->_bubbleOpacity;
}

- (double)thinkingDotOpacity
{
  return self->_thinkingDotOpacity;
}

- (void)setThinkingDotOpacity:(double)a3
{
  self->_thinkingDotOpacity = a3;
}

- (UIColor)customBubbleColor
{
  return self->_customBubbleColor;
}

- (void)setCustomBubbleColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CALayer)bubbleContainer
{
  return self->_bubbleContainer;
}

- (void)setBubbleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleContainer, a3);
}

- (CALayer)smallBubble
{
  return self->_smallBubble;
}

- (void)setSmallBubble:(id)a3
{
  objc_storeStrong((id *)&self->_smallBubble, a3);
}

- (CALayer)mediumBubble
{
  return self->_mediumBubble;
}

- (void)setMediumBubble:(id)a3
{
  objc_storeStrong((id *)&self->_mediumBubble, a3);
}

- (CALayer)largeBubble
{
  return self->_largeBubble;
}

- (void)setLargeBubble:(id)a3
{
  objc_storeStrong((id *)&self->_largeBubble, a3);
}

- (CALayer)thinkingDotContainer
{
  return self->_thinkingDotContainer;
}

- (void)setThinkingDotContainer:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDotContainer, a3);
}

- (CALayer)thinkingDot
{
  return self->_thinkingDot;
}

- (void)setThinkingDot:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDot, a3);
}

- (CAReplicatorLayer)thinkingDots
{
  return self->_thinkingDots;
}

- (void)setThinkingDots:(id)a3
{
  objc_storeStrong((id *)&self->_thinkingDots, a3);
}

- (CALayer)iconImageLayer
{
  return self->_iconImageLayer;
}

- (void)setIconImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageLayer, 0);
  objc_storeStrong((id *)&self->_thinkingDots, 0);
  objc_storeStrong((id *)&self->_thinkingDot, 0);
  objc_storeStrong((id *)&self->_thinkingDotContainer, 0);
  objc_storeStrong((id *)&self->_largeBubble, 0);
  objc_storeStrong((id *)&self->_mediumBubble, 0);
  objc_storeStrong((id *)&self->_smallBubble, 0);
  objc_storeStrong((id *)&self->_bubbleContainer, 0);
  objc_storeStrong((id *)&self->_customBubbleColor, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_thinkingDotColor, 0);
  objc_storeStrong((id *)&self->_bubbleColor, 0);
  objc_storeStrong(&self->_iconImage, 0);
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 78.5;
  v3 = 35.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)defaultBubbleColor
{
  return (UIColor *)MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_colorWithDynamicProvider_, &unk_24C750FC8);
}

- (UIColor)defaultThinkingDotColor
{
  return (UIColor *)((uint64_t (*)(_QWORD, char *))MEMORY[0x24BEDD108])(MEMORY[0x24BDF6950], sel_labelColor);
}

- (double)defaultThinkingDotOpacity
{
  return 0.449999988;
}

- (double)defaultBubbleOpacity
{
  return 1.0;
}

+ (BOOL)supportsTypingIndicatorAnimation
{
  return 1;
}

+ (CGRect)smallBubbleFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 35.0;
  v3 = 2.0;
  v4 = 5.5;
  v5 = 5.5;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v2;
  result.origin.x = v3;
  return result;
}

+ (CGPoint)smallBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 5.5;
  v3 = -2.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGRect)mediumBubbleFrame
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend_smallBubbleFrame(a1, a2, v2);
  v4 = v3 + 7.0;
  v6 = v5 + -7.5;
  v7 = 11.5;
  v8 = 11.5;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

+ (CGPoint)mediumBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 5.0;
  v3 = 3.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGRect)largeBubbleFrame
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend_smallBubbleFrame(a1, a2, v2);
  v4 = v3 + 16.0;
  v6 = v5 + -25.5;
  v7 = 57.5;
  v8 = 35.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

+ (CGPoint)largeBubbleGrowOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 5.0;
  v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (CGRect)iconImageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 11.0;
  v3 = 7.5;
  v4 = 27.0;
  v5 = 20.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (double)iconImageTrailingSpace
{
  return 8.0;
}

+ (CGPoint)thinkingDotsOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = 12.0;
  v3 = 13.5;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (double)thinkingDotDiameter
{
  return 8.5;
}

+ (double)thinkingDotSpace
{
  return 12.5;
}

@end
