@implementation SUUIAttributedStringView

- (SUUIAttributedStringView)initWithFrame:(CGRect)a3
{
  SUUIAttributedStringView *v3;
  SUUIAttributedStringView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIAttributedStringView;
  v3 = -[SUUIAttributedStringView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SUUIAttributedStringView setContentMode:](v3, "setContentMode:", 3);
  return v4;
}

- (void)viewWasRecycled
{
  SUUIAttributedStringLayout *layout;
  NSLayoutManager *layoutManager;
  NSArray *requiredBadges;
  UIColor *textColor;
  NSTextContainer *textContainer;
  NSTextStorage *textStorage;
  UIColor *treatmentColor;

  layout = self->_layout;
  self->_layout = 0;

  layoutManager = self->_layoutManager;
  self->_layoutManager = 0;

  requiredBadges = self->_requiredBadges;
  self->_requiredBadges = 0;

  textColor = self->_textColor;
  self->_textColor = 0;

  textContainer = self->_textContainer;
  self->_textContainer = 0;

  textStorage = self->_textStorage;
  self->_textStorage = 0;

  treatmentColor = self->_treatmentColor;
  self->_treatmentColor = 0;

}

+ (CGSize)sizeWithLayout:(id)a3 treatment:(int64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  v5 = a3;
  objc_msgSend(v5, "boundingSize");
  v8 = v6;
  v9 = v7;
  if (a4 == 1)
  {
    v8 = v6 + 14.0;
    v10 = v7 + 6.0;
    v11 = v5;
    objc_msgSend(v11, "attributedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB360], 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "baselineOffset");
    v15 = v14;
    objc_msgSend(v13, "capHeight");
    v17 = v15 - v16;
    objc_msgSend(v13, "_bodyLeading");
    v19 = v17 - v18 * (double)(objc_msgSend(v11, "numberOfLines") - 1);
    objc_msgSend(v11, "topInset");
    v21 = v20;

    v22 = v21 + v19;
    v23 = ceilf(v22);

    v9 = v10 - v23;
  }

  v24 = v8;
  v25 = v9;
  result.height = v25;
  result.width = v24;
  return result;
}

- (double)baselineOffset
{
  double result;

  -[SUUIAttributedStringLayout baselineOffset](self->_layout, "baselineOffset");
  return result;
}

- (double)firstBaselineOffset
{
  double result;

  -[SUUIAttributedStringLayout firstBaselineOffset](self->_layout, "firstBaselineOffset");
  return result;
}

- (void)setBadgePlacement:(int64_t)a3
{
  if (self->_badgePlacement != a3)
  {
    self->_badgePlacement = a3;
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFirstLineTopInset:(int64_t)a3
{
  if (self->_firstLineTopInset != a3)
  {
    self->_firstLineTopInset = a3;
    -[SUUIAttributedStringView _reloadTopInset](self, "_reloadTopInset");
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLayout:(id)a3
{
  SUUIAttributedStringLayout *v5;
  NSTextStorage *textStorage;
  void *v7;
  SUUIAttributedStringLayout *v8;

  v5 = (SUUIAttributedStringLayout *)a3;
  if (self->_layout != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_layout, a3);
    textStorage = self->_textStorage;
    if (textStorage)
    {
      if (v8)
      {
        -[SUUIAttributedStringLayout attributedString](v8, "attributedString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSTextStorage setAttributedString:](textStorage, "setAttributedString:", v7);

      }
      else
      {
        -[NSTextStorage deleteCharactersInRange:](textStorage, "deleteCharactersInRange:", 0, -[NSTextStorage length](textStorage, "length"));
      }
    }
    -[SUUIAttributedStringView _reloadTopInset](self, "_reloadTopInset");
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v8;
  }

}

- (void)setRequiredBadges:(id)a3
{
  NSArray *v4;
  NSArray *requiredBadges;

  if (self->_requiredBadges != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    requiredBadges = self->_requiredBadges;
    self->_requiredBadges = v4;

    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setStringTreatment:(int64_t)a3
{
  if (self->_stringTreatment != a3)
  {
    self->_stringTreatment = a3;
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
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
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (void)setTextColorFollowsTintColor:(BOOL)a3
{
  if (self->_textColorFollowsTintColor != a3)
  {
    self->_textColorFollowsTintColor = a3;
    if (!self->_textColor)
      -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTreatmentColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_treatmentColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_treatmentColor, a3);
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (BOOL)usesTallCharacterSet
{
  return -[SUUIAttributedStringLayout usesTallCharacterSet](self->_layout, "usesTallCharacterSet");
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  -[SUUIAttributedStringLayout attributedString](self->_layout, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v5 > 0x13)
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView description](&v11, sel_description);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "substringToIndex:", 20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: \"%@...\"), v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView description](&v12, sel_description);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@: \"%@\"), v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", self);
  if (-[SUUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange))
  {
    -[SUUIAttributedStringView _setTrackingTouch:](self, "_setTrackingTouch:", 1);
    -[SUUIAttributedStringView _setTouchInside:](self, "_setTouchInside:", 1);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, v7);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5;
  objc_super v6;

  if (self->_trackingTouch)
  {
    objc_msgSend(a3, "anyObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", self);
    -[SUUIAttributedStringView _setTouchInside:](self, "_setTouchInside:", -[SUUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange));

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView touchesMoved:withEvent:](&v6, sel_touchesMoved_withEvent_, a3, a4);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  int v6;
  id v7;
  id v8;
  objc_super v9;

  if (self->_trackingTouch)
  {
    objc_msgSend(a3, "anyObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", self);
    if (-[SUUIAttributedStringView _touchInsideLinkText:linkTextRange:](self, "_touchInsideLinkText:linkTextRange:", &self->_trackingRange))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);
      v6 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_257225EE8);

      if (v6)
      {
        v7 = objc_loadWeakRetained((id *)&self->_linkDelegate);
        objc_msgSend(v7, "linkTapped:range:", self, self->_trackingRange.location, self->_trackingRange.length);

      }
    }
    -[SUUIAttributedStringView _setTrackingTouch:](self, "_setTrackingTouch:", 0);
    -[SUUIAttributedStringView _setTouchInside:](self, "_setTouchInside:", 0);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, a3, a4);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  if (self->_trackingTouch)
  {
    -[SUUIAttributedStringView _setTrackingTouch:](self, "_setTrackingTouch:", 0, a4);
    -[SUUIAttributedStringView _setTouchInside:](self, "_setTouchInside:", 0);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIAttributedStringView;
    -[SUUIAttributedStringView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int ShouldReverseLayoutDirection;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  double v29;
  UIColor *treatmentColor;
  void *v31;
  SUUIAttributedStringLayout *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  float v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t i;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double MaxX;
  float v69;
  UIColor *v70;
  UIColor *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  NSTextContainer *textContainer;
  void *v78;
  void *v79;
  CGContext *CurrentContext;
  double v81;
  CGFloat v82;
  double v83;
  double v84;
  double v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  id v90;
  CGColor *v91;
  CGFloat v92;
  void *v93;
  uint64_t v94;
  void *v95;
  double v96;
  double MaxY;
  double v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  int v104;
  void *v105;
  id v106;
  double v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  NSArray *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  double v129;
  uint64_t v130;
  uint64_t j;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  float v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t k;
  void *v153;
  double v154;
  double v155;
  double v156;
  double v157;
  void *v158;
  void *v159;
  float v160;
  double v161;
  CGFloat v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  UIColor *v171;
  uint64_t v172;
  CGFloat rect;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _QWORD v187[2];
  uint64_t v188;
  uint64_t v189;
  _QWORD v190[5];
  id v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _BYTE v196[128];
  _BYTE v197[128];
  void *v198;
  _BYTE v199[128];
  uint64_t v200;
  CGSize v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;

  v200 = *MEMORY[0x24BDAC8D0];
  -[SUUIAttributedStringView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  ShouldReverseLayoutDirection = storeShouldReverseLayoutDirection();
  v13 = *MEMORY[0x24BDBF090];
  v14 = v7 + self->_calculatedTopInset;
  -[SUUIAttributedStringLayout topInset](self->_layout, "topInset");
  v176 = v14 + v15;
  -[SUUIAttributedStringLayout edgeInsetsForShadow](self->_layout, "edgeInsetsForShadow");
  if (v19 != *(double *)(MEMORY[0x24BEBE158] + 8)
    || v16 != *MEMORY[0x24BEBE158]
    || v18 != *(double *)(MEMORY[0x24BEBE158] + 24)
    || v17 != *(double *)(MEMORY[0x24BEBE158] + 16))
  {
    -[SUUIAttributedStringLayout edgeInsetsForShadow](self->_layout, "edgeInsetsForShadow");
    v176 = v176 + v23;
    -[SUUIAttributedStringLayout edgeInsetsForShadow](self->_layout, "edgeInsetsForShadow");
    v13 = v13 + v24;
  }
  -[SUUIAttributedStringLayout boundingSize](self->_layout, "boundingSize");
  v27 = self->_badgePlacement == 1;
  if (v11 < v26 || self->_badgePlacement == 1)
    v26 = v11;
  v175 = v26;
  if (v9 < v25)
    v27 = 1;
  if (v27)
    v29 = v9;
  else
    v29 = v25;
  if (self->_stringTreatment == 1)
  {
    treatmentColor = self->_treatmentColor;
    if (treatmentColor)
    {
      -[UIColor set](treatmentColor, "set");
      objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, 6.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "fill");

      v32 = self->_layout;
      -[SUUIAttributedStringLayout attributedString](v32, "attributedString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB360], 0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIAttributedStringLayout baselineOffset](v32, "baselineOffset");
      v35 = v29;
      v37 = v36;
      objc_msgSend(v34, "capHeight");
      v39 = v37 - v38;
      objc_msgSend(v34, "_bodyLeading");
      v41 = v39 - v40 * (double)(-[SUUIAttributedStringLayout numberOfLines](v32, "numberOfLines") - 1);
      -[SUUIAttributedStringLayout topInset](v32, "topInset");
      v43 = v42;

      v44 = v43 + v41;
      v45 = ceilf(v44);

      -[SUUIAttributedStringLayout topInset](self->_layout, "topInset");
      v47 = v46 + (v11 - (v175 - v45)) * 0.5 - v45 * 0.5;
      v29 = v35;
      *(float *)&v47 = v47;
      v176 = floorf(*(float *)&v47);
      v13 = 7.0;
    }
  }
  -[SUUIAttributedStringLayout attributedString](self->_layout, "attributedString");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    v50 = -[NSArray count](self->_requiredBadges, "count");
    v172 = v50;
    v174 = v9;
    if (v50 < 1)
    {
      v52 = *MEMORY[0x24BDBF148];
      v57 = *(double *)(MEMORY[0x24BDBF148] + 8);
    }
    else
    {
      v51 = v5;
      v52 = (float)((float)(v50 - 1) * 4.0);
      v194 = 0u;
      v195 = 0u;
      v192 = 0u;
      v193 = 0u;
      v53 = self->_requiredBadges;
      v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v192, v199, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v193;
        v57 = 0.0;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v193 != v56)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * i), "badgeSize");
            if (v57 < v60)
              v57 = v60;
            v52 = v52 + v59;
          }
          v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v192, v199, 16);
        }
        while (v55);
      }
      else
      {
        v57 = 0.0;
      }

      if (!self->_badgePlacement)
      {
        -[SUUIAttributedStringLayout firstBaselineOffset](self->_layout, "firstBaselineOffset");
        v62 = v9;
        v64 = v63;
        if (v29 >= v62 - v52 + -4.0 - v13)
          v29 = v62 - v52 + -4.0 - v13;
        if (ShouldReverseLayoutDirection)
        {
          v65 = v51;
          v66 = v7;
          v67 = v11;
          MaxX = CGRectGetMaxX(*(CGRect *)(&v62 - 2));
          v202.origin.x = v13;
          v202.origin.y = v176;
          v202.size.width = v29;
          v202.size.height = v175;
          v177 = MaxX - CGRectGetWidth(v202);
          v203.origin.x = v13;
          v203.origin.y = v176;
          v203.size.width = v29;
          v61 = v175;
          v203.size.height = v175;
          v13 = v177 - CGRectGetMinX(v203);
        }
        else
        {
          v61 = v175;
        }
        if (v57 > v64)
        {
          v69 = v57 - v64 + 3.0;
          v176 = v176 + ceilf(v69);
        }
        v9 = v174;
        goto LABEL_49;
      }
    }
    v61 = v175;
LABEL_49:
    if (self->_textColorFollowsTintColor)
    {
      -[SUUIAttributedStringView tintColor](self, "tintColor");
      v70 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = self->_textColor;
    }
    v71 = v70;
    if (v70)
    {
      v72 = (void *)objc_msgSend(v49, "mutableCopy");
      objc_msgSend(v72, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v71, 0, objc_msgSend(v72, "length"));

      v49 = v72;
    }
    if (self->_containsLinks)
    {
      v73 = (void *)objc_msgSend(v49, "mutableCopy");
      v74 = objc_msgSend(v49, "length");
      v190[0] = MEMORY[0x24BDAC760];
      v190[1] = 3221225472;
      v190[2] = __37__SUUIAttributedStringView_drawRect___block_invoke;
      v190[3] = &unk_2511F54A8;
      v190[4] = self;
      v75 = v73;
      v191 = v75;
      objc_msgSend(v49, "enumerateAttributesInRange:options:usingBlock:", 0, v74, 0, v190);
      v76 = v75;

      self->_textBounds.origin.x = v13;
      self->_textBounds.origin.y = v176;
      self->_textBounds.size.width = v29 + 10.0;
      self->_textBounds.size.height = v61;
      textContainer = self->_textContainer;
      if (textContainer)
        -[NSTextContainer setContainerSize:](textContainer, "setContainerSize:");

    }
    else
    {
      v76 = v49;
    }
    -[SUUIAttributedStringLayout shadow](self->_layout, "shadow");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      v79 = (void *)objc_msgSend(v76, "mutableCopy");
      objc_msgSend(v79, "removeAttribute:range:", *MEMORY[0x24BEBB3C8], 0, objc_msgSend(v79, "length"));

      CurrentContext = UIGraphicsGetCurrentContext();
      objc_msgSend(v78, "shadowOffset");
      v82 = v81;
      v83 = v13;
      v84 = v29;
      v86 = v85;
      objc_msgSend(v78, "shadowBlurRadius");
      v87 = v61;
      v89 = v88;
      objc_msgSend(v78, "shadowColor");
      v90 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v91 = (CGColor *)objc_msgSend(v90, "CGColor");
      v201.width = v82;
      v201.height = v86;
      v29 = v84;
      v13 = v83;
      v9 = v174;
      v92 = v89;
      v61 = v87;
      CGContextSetShadowWithColor(CurrentContext, v201, v92, v91);

      v76 = v79;
    }
    if (self->_badgePlacement == 1)
    {
      v93 = (void *)objc_msgSend(v76, "mutableCopy");
      v188 = 0;
      v189 = objc_msgSend(v76, "length");
      v94 = objc_msgSend(v93, "length") - 1;
      objc_msgSend(v93, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB360], v94, &v188);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v168 = v95;
      if (v95)
        objc_msgSend(v95, "descender");
      else
        v96 = 0.0;
      v178 = v96;
      v99 = *MEMORY[0x24BEBB3A8];
      objc_msgSend(v93, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB3A8], 0, &v188);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = v76;
      v171 = v71;
      v169 = v78;
      v167 = v100;
      v165 = v13;
      if (v100 && (v101 = v100, objc_msgSend(v100, "lineBreakMode")))
      {
        v102 = objc_msgSend(v101, "lineBreakMode");
        v103 = (void *)objc_msgSend(v101, "mutableCopy");
        objc_msgSend(v103, "setLineBreakMode:", 0);
        objc_msgSend(v93, "addAttribute:value:range:", v99, v103, v188, v189);

        v104 = 1;
      }
      else
      {
        v104 = 0;
        v102 = 4;
      }
      v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB508]), "initWithAttributedString:", v93);
      v106 = objc_alloc_init(MEMORY[0x24BEBB488]);
      v166 = v105;
      objc_msgSend(v105, "addLayoutManager:", v106);
      rect = v29;
      v107 = v61;
      v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", v29, v61);
      objc_msgSend(v108, "setLineFragmentPadding:", 0.0);
      if (v104)
        objc_msgSend(v108, "setLineBreakMode:", v102);
      objc_msgSend(v106, "addTextContainer:", v108);
      v109 = objc_msgSend(v106, "glyphRangeForTextContainer:", v108);
      v111 = v110;
      v187[0] = v109;
      v187[1] = v110;
      objc_msgSend(v106, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v94, v187);
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v119 = v118;
      objc_msgSend(v106, "locationForGlyphAtIndex:", v94);
      v121 = v120;
      v204.origin.x = v113;
      v163 = v117;
      v164 = v115;
      v204.origin.y = v115;
      v204.size.width = v117;
      v204.size.height = v119;
      MaxY = CGRectGetMaxY(v204);
      v205.origin.x = v165;
      v205.origin.y = v176;
      v205.size.width = rect;
      v61 = v107;
      v13 = v165;
      v205.size.height = v61;
      if (v52 > CGRectGetMaxX(v205) - v121)
      {
        v206.origin.x = v165;
        v206.size.height = v175;
        v206.origin.y = v176;
        v206.size.width = rect;
        v162 = CGRectGetMaxX(v206) - (v52 + 4.0);
        v207.origin.x = v113;
        v207.size.width = v163;
        v207.origin.y = v164;
        v207.size.height = v119;
        v122 = v178 + CGRectGetMaxY(v207) - v57;
        v208.origin.x = v165;
        v208.origin.y = v176;
        v61 = v175;
        v208.size.width = rect;
        v208.size.height = v175;
        objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRect:", v162, v122, CGRectGetMaxX(v208) - v162, v57);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = v123;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v198, 1);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "setExclusionPaths:", v124);

        v121 = v162 + -4.0;
      }
      v98 = v121;
      objc_msgSend(v106, "drawGlyphsForGlyphRange:atPoint:", v109, v111, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

      v29 = rect;
      v9 = v174;
      v76 = v170;
      v71 = v171;
      v78 = v169;
    }
    else
    {
      v98 = *MEMORY[0x24BDBEFB0];
      MaxY = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      -[SUUIAttributedStringLayout stringDrawingContext](self->_layout, "stringDrawingContext");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "drawWithRect:options:context:", 33, v93, v13, v176, v29, v61);
      v178 = 0.0;
    }

    if (v172 >= 1)
    {
      if (self->_badgePlacement == 1)
      {
        v185 = 0u;
        v186 = 0u;
        v183 = 0u;
        v184 = 0u;
        v125 = self->_requiredBadges;
        v126 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v183, v197, 16);
        if (v126)
        {
          v127 = v126;
          v128 = v76;
          v129 = v98 + 4.0;
          v130 = *(_QWORD *)v184;
          do
          {
            for (j = 0; j != v127; ++j)
            {
              if (*(_QWORD *)v184 != v130)
                objc_enumerationMutation(v125);
              v132 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * j);
              objc_msgSend(v132, "badgeSize");
              v134 = v133;
              v136 = v135;
              objc_msgSend(v132, "image");
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              if (v137)
              {
                v138 = v129;
                v139 = roundf(v138);
                objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "scale");
                *(float *)&v141 = v178 + MaxY - v136 + 1.0 / v141;
                v142 = roundf(*(float *)&v141);

                objc_msgSend(v137, "drawInRect:", v139, v142, v134, v136);
              }
              v129 = v129 + v134 + 4.0;

            }
            v127 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v183, v197, 16);
          }
          while (v127);
          v76 = v128;
        }
      }
      else
      {
        -[SUUIAttributedStringLayout firstBaselineOffset](self->_layout, "firstBaselineOffset");
        v144 = v143;
        if ((ShouldReverseLayoutDirection & 1) != 0)
        {
          v209.origin.x = v13;
          v209.origin.y = v176;
          v209.size.width = v29;
          v209.size.height = v61;
          v145 = fmax(CGRectGetMinX(v209) + -4.0 - v52, 0.0);
        }
        else
        {
          v145 = v9 - v52;
          v210.origin.x = v13;
          v210.origin.y = v176;
          v210.size.width = v29;
          v210.size.height = v61;
          v146 = CGRectGetMaxX(v210) + 4.0;
          if (v9 - v52 >= v146)
            v145 = v146;
        }
        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v125 = self->_requiredBadges;
        v147 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
        if (v147)
        {
          v148 = v147;
          v149 = v78;
          v150 = v76;
          v151 = *(_QWORD *)v180;
          do
          {
            for (k = 0; k != v148; ++k)
            {
              if (*(_QWORD *)v180 != v151)
                objc_enumerationMutation(v125);
              v153 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * k);
              objc_msgSend(v153, "badgeSize");
              v155 = v154;
              v157 = v156;
              objc_msgSend(v153, "image");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              v159 = v158;
              if (v158)
              {
                v160 = v176 + v144 - v157;
                objc_msgSend(v158, "drawInRect:", v145, roundf(v160), v155, v157);
              }
              v161 = v155 + 4.0;
              if (ShouldReverseLayoutDirection)
                v161 = -(v52 + -4.0);
              v145 = v145 + v161;

            }
            v148 = -[NSArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
          }
          while (v148);
          v76 = v150;
          v78 = v149;
        }
      }

    }
  }
}

void __37__SUUIAttributedStringView_drawRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKey:", CFSTR("SUUILinkAttributeName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((v8 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v8 + 464))
      || !*(_BYTE *)(v8 + 488)
      || ((v9 = (uint64_t *)(v8 + 472), v11 = *v9, v10 = v9[1], a3 == v11) ? (v12 = a4 == v10) : (v12 = 0), !v12))
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("SUUILinkColorAttributeName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "tintColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x24BEBB368], v13, a3, a4);

    }
  }

}

- (void)_setupTapLocatorContainer
{
  NSTextContainer *v3;
  NSTextContainer *textContainer;
  NSLayoutManager *v5;
  NSLayoutManager *layoutManager;
  NSTextStorage *v7;
  NSTextStorage *textStorage;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  if (!self->_textContainer)
  {
    v3 = (NSTextContainer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBB4C0]), "initWithSize:", self->_textBounds.size.width, self->_textBounds.size.height);
    textContainer = self->_textContainer;
    self->_textContainer = v3;

    v5 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x24BEBB488]);
    layoutManager = self->_layoutManager;
    self->_layoutManager = v5;

    -[NSLayoutManager addTextContainer:](self->_layoutManager, "addTextContainer:", self->_textContainer);
    v7 = (NSTextStorage *)objc_alloc_init(MEMORY[0x24BEBB508]);
    textStorage = self->_textStorage;
    self->_textStorage = v7;

    -[NSTextStorage addLayoutManager:](self->_textStorage, "addLayoutManager:", self->_layoutManager);
    v9 = objc_alloc(MEMORY[0x24BDD1688]);
    -[SUUIAttributedStringLayout attributedString](self->_layout, "attributedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "initWithAttributedString:", v10);

    v11 = objc_alloc_init(MEMORY[0x24BEBB490]);
    v12 = objc_msgSend(v13, "length");
    objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x24BEBB3A8], v11, 0, v12);
    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v13);

  }
}

- (BOOL)_touchInsideLinkText:(CGPoint)a3 linkTextRange:(_NSRange *)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  BOOL v13;
  CGPoint v15;
  CGRect v16;

  if (!self->_containsLinks)
    return 0;
  y = a3.y;
  x = a3.x;
  -[SUUIAttributedStringView bounds](self, "bounds");
  v15.x = x;
  v15.y = y;
  if (!CGRectContainsPoint(v16, v15))
    return 0;
  -[SUUIAttributedStringLayout attributedString](self->_layout, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  if (v9 < 1)
  {
    v13 = 0;
  }
  else
  {
    v10 = v9;
    -[SUUIAttributedStringView _setupTapLocatorContainer](self, "_setupTapLocatorContainer");
    -[NSLayoutManager enumerateLineFragmentsForGlyphRange:usingBlock:](self->_layoutManager, "enumerateLineFragmentsForGlyphRange:usingBlock:", 0, v10, &__block_literal_global_3);
    v11 = self->_textBounds.origin.y;
    if (v11 == 0.0)
      v11 = -0.0;
    objc_msgSend(v8, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("SUUILinkAttributeName"), -[NSLayoutManager characterIndexForGlyphAtIndex:](self->_layoutManager, "characterIndexForGlyphAtIndex:", -[NSLayoutManager glyphIndexForPoint:inTextContainer:](self->_layoutManager, "glyphIndexForPoint:inTextContainer:", self->_textContainer, x, y + v11)), a4, 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
  }

  return v13;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  SUUIAttributedStringLayout *layout;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SUUIAttributedStringLayout *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t i;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;
  CGSize result;

  v42 = *MEMORY[0x24BDAC8D0];
  layout = self->_layout;
  if (layout)
  {
    -[SUUIAttributedStringLayout boundingSize](layout, "boundingSize", a3.width, a3.height);
    v7 = v6;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  v8 = v5 + self->_calculatedTopInset;
  if (self->_stringTreatment == 1)
  {
    v7 = v7 + 14.0;
    v9 = v8 + 6.0;
    v10 = self->_layout;
    -[SUUIAttributedStringLayout attributedString](v10, "attributedString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB360], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIAttributedStringLayout baselineOffset](v10, "baselineOffset");
    v14 = v13;
    objc_msgSend(v12, "capHeight");
    v16 = v14 - v15;
    objc_msgSend(v12, "_bodyLeading");
    v18 = v16 - v17 * (double)(-[SUUIAttributedStringLayout numberOfLines](v10, "numberOfLines") - 1);
    -[SUUIAttributedStringLayout topInset](v10, "topInset");
    v20 = v19;

    v21 = v20 + v18;
    v22 = ceilf(v21);

    v8 = v9 - v22;
  }
  v23 = -[NSArray count](self->_requiredBadges, "count");
  if (v23 >= 1)
  {
    v24 = v23;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v25 = self->_requiredBadges;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      v29 = 0.0;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "badgeSize", (_QWORD)v37);
          v7 = v7 + v32;
          if (v29 < v31)
            v29 = v31;
        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v27);
    }
    else
    {
      v29 = 0.0;
    }

    v7 = v7 + (float)((float)v24 * 4.0);
    if (self->_badgePlacement != 1)
    {
      -[SUUIAttributedStringLayout firstBaselineOffset](self->_layout, "firstBaselineOffset");
      if (v29 > v33)
      {
        v34 = v29 - v33 + 3.0;
        v8 = v8 + ceilf(v34);
      }
    }
  }
  v35 = v7;
  v36 = v8;
  result.height = v36;
  result.width = v35;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIAttributedStringView;
  -[SUUIAttributedStringView tintColorDidChange](&v3, sel_tintColorDidChange);
  if (self->_textColorFollowsTintColor)
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_reloadTopInset
{
  SUUIAttributedStringLayout *layout;
  SUUIAttributedStringLayout *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;

  self->_calculatedTopInset = 0.0;
  layout = self->_layout;
  if (layout)
  {
    if (self->_firstLineTopInset)
    {
      v4 = layout;
      -[SUUIAttributedStringLayout attributedString](v4, "attributedString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB360], 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUUIAttributedStringLayout baselineOffset](v4, "baselineOffset");
      v8 = v7;
      objc_msgSend(v6, "capHeight");
      v10 = v8 - v9;
      objc_msgSend(v6, "_bodyLeading");
      v12 = v10 - v11 * (double)(-[SUUIAttributedStringLayout numberOfLines](v4, "numberOfLines") - 1);
      -[SUUIAttributedStringLayout topInset](v4, "topInset");
      v14 = v13;

      v15 = v14 + v12;
      v16 = ceilf(v15);

      self->_calculatedTopInset = (double)self->_firstLineTopInset - v16;
    }
  }
}

- (void)_setTrackingTouch:(BOOL)a3
{
  if (self->_trackingTouch != a3)
  {
    self->_trackingTouch = a3;
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_setTouchInside:(BOOL)a3
{
  if (self->_touchInside != a3)
  {
    self->_touchInside = a3;
    -[SUUIAttributedStringView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)containsLinks
{
  return self->_containsLinks;
}

- (void)setContainsLinks:(BOOL)a3
{
  self->_containsLinks = a3;
}

- (SUUIAttributedStringLayout)layout
{
  return self->_layout;
}

- (SUUILinkHandler)linkDelegate
{
  return (SUUILinkHandler *)objc_loadWeakRetained((id *)&self->_linkDelegate);
}

- (void)setLinkDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_linkDelegate, a3);
}

- (NSArray)requiredBadges
{
  return self->_requiredBadges;
}

- (int64_t)stringTreatment
{
  return self->_stringTreatment;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)treatmentColor
{
  return self->_treatmentColor;
}

- (int64_t)firstLineTopInset
{
  return self->_firstLineTopInset;
}

- (int64_t)badgePlacement
{
  return self->_badgePlacement;
}

- (BOOL)textColorFollowsTintColor
{
  return self->_textColorFollowsTintColor;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkDelegate);
  objc_storeStrong((id *)&self->_treatmentColor, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_requiredBadges, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
