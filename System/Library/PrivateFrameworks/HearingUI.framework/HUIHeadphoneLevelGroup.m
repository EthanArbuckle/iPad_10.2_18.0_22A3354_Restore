@implementation HUIHeadphoneLevelGroup

- (HUIHeadphoneLevelGroup)init
{
  HUIHeadphoneLevelGroup *v2;
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *levels;
  uint64_t v8;
  NSMutableArray *inactiveLevels;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)HUIHeadphoneLevelGroup;
  v2 = -[HUIHeadphoneLevelGroup init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateConstraints, *MEMORY[0x24BEBE088], 0);

    v2->_isRTL = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[HUIHeadphoneLevelGroup semanticContentAttribute](v2, "semanticContentAttribute")) == 1;
    v4 = -[HUIHeadphoneLevelGroup isRTL](v2, "isRTL");
    v5 = 12;
    if (v4)
      v5 = 5;
    v2->_pipFlagIndex = v5;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    levels = v2->_levels;
    v2->_levels = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    inactiveLevels = v2->_inactiveLevels;
    v2->_inactiveLevels = (NSMutableArray *)v8;

    v10 = *MEMORY[0x24BDE5BD0];
    v11 = 18;
    do
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("Pill"));
      objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCompositingFilter:", v14);

      objc_msgSend(v12, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.15);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v15, "setBackgroundColor:", objc_msgSend(v16, "CGColor"));

      -[HUIHeadphoneLevelGroup addSubview:](v2, "addSubview:", v12);
      -[NSMutableArray addObject:](v2->_inactiveLevels, "addObject:", v12);
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HUIHeadphoneLevelGroup addSubview:](v2, "addSubview:", v17);
      -[NSMutableArray addObject:](v2->_levels, "addObject:", v17);

      --v11;
    }
    while (v11);
    v18 = (void *)MEMORY[0x24BDD1628];
    -[HUIHeadphoneLevelGroup heightAnchor](v2, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToConstant:", 34.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v21);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUIHeadphoneLevelGroup;
  -[HUIHeadphoneLevelGroup dealloc](&v4, sel_dealloc);
}

- (void)layoutSubviews
{
  int v3;
  double v4;
  __int128 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x24BDAC8D0];
  v3 = Layout;
  -[HUIHeadphoneLevelGroup frame](self, "frame");
  if (v4 == 316.0)
  {
    qword_255105EF8 = 0x3FF0000000000000;
    v5 = &xmmword_21A98E6D0;
LABEL_11:
    v10 = v5[1];
    Layout = *v5;
    *(_OWORD *)&qword_255105ED8 = v10;
    xmmword_255105EE8 = v5[2];
    goto LABEL_12;
  }
  -[HUIHeadphoneLevelGroup frame](self, "frame");
  if (v6 == 290.0)
  {
    qword_255105EF8 = 0x3FF0000000000000;
    v5 = &xmmword_21A98E660;
    goto LABEL_11;
  }
  -[HUIHeadphoneLevelGroup frame](self, "frame");
  if (v7 == 306.0)
  {
    qword_255105EF8 = 0x3FF0000000000000;
    v5 = &xmmword_21A98E698;
    goto LABEL_11;
  }
  -[HUIHeadphoneLevelGroup frame](self, "frame");
  if (v8 == 281.0)
  {
    qword_255105EF8 = 0x3FF0000000000000;
    v5 = &xmmword_21A98E628;
    goto LABEL_11;
  }
  -[HUIHeadphoneLevelGroup frame](self, "frame");
  if (v9 == 248.0)
  {
LABEL_10:
    qword_255105EF8 = 0x3FF0000000000000;
    v5 = &layouts;
    goto LABEL_11;
  }
  if (!v3)
  {
    HCLogSoundMeter();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[HUIHeadphoneLevelGroup frame](self, "frame");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v17 = v14;
      _os_log_impl(&dword_21A95E000, v13, OS_LOG_TYPE_INFO, "Unknown headphone level width (%f). Falling back to 320", buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_12:
  v15.receiver = self;
  v15.super_class = (Class)HUIHeadphoneLevelGroup;
  -[HUIHeadphoneLevelGroup layoutSubviews](&v15, sel_layoutSubviews);
  HCLogSoundMeter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v17[0] = v3;
    LOWORD(v17[1]) = 1024;
    *(_DWORD *)((char *)&v17[1] + 2) = Layout;
    _os_log_impl(&dword_21A95E000, v11, OS_LOG_TYPE_INFO, "Layout headphone level group for size %i -> %i", buf, 0xEu);
  }

  -[HUIHeadphoneLevelGroup layoutLevels](self, "layoutLevels");
  if (v3 != (_DWORD)Layout)
  {
    -[HUIHeadphoneLevelGroup superview](self, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

  }
}

- (void)layoutLevels
{
  CGFloat v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];
  CGRect v10;

  -[HUIHeadphoneLevelGroup bounds](self, "bounds");
  v3 = (CGRectGetWidth(v10) + *((double *)&Layout + 1) * -18.0 + *(double *)&qword_255105EE0 * -17.0) * 0.5;
  v4 = -[HUIHeadphoneLevelGroup pipFlagIndex](self, "pipFlagIndex");
  -[HUIHeadphoneLevelGroup inactiveLevels](self, "inactiveLevels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke;
  v9[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v9[4] = v4;
  *(CGFloat *)&v9[5] = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  -[HUIHeadphoneLevelGroup levels](self, "levels");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke_2;
  v8[3] = &__block_descriptor_48_e23_v32__0__UIView_8Q16_B24l;
  v8[4] = v4;
  *(CGFloat *)&v8[5] = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  objc_msgSend(v8, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", *((double *)&xmmword_255105EE8 + 1));

  v7 = *(double *)&xmmword_255105EE8;
  if (*(_QWORD *)(a1 + 32) == a3)
    v7 = *(double *)&xmmword_255105EE8 * 0.5;
  objc_msgSend(v8, "setFrame:", *(double *)(a1 + 40) + (double)a3 * *((double *)&Layout + 1) + (double)a3 * *(double *)&qword_255105EE0, v7);

}

void __38__HUIHeadphoneLevelGroup_layoutLevels__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", *((double *)&xmmword_255105EE8 + 1));

  v6 = *(double *)&xmmword_255105EE8;
  if (*(_QWORD *)(a1 + 32) == a3)
    v6 = *(double *)&xmmword_255105EE8 * 0.5;
  objc_msgSend(v7, "setFrame:", *(double *)(a1 + 40) + (double)a3 * *((double *)&Layout + 1) + (double)a3 * *(double *)&qword_255105EE0, v6);

}

- (void)updateWithExposure:(double)a3 withThreshold:(unint64_t)a4
{
  float v6;
  float v7;
  void *v8;
  _QWORD v9[6];
  float v10;

  if (a3 <= 20.0)
  {
    v7 = a3 / 20.0;
  }
  else
  {
    v6 = (a3 + -20.0) / 90.0;
    v7 = (float)(v6 * 17.0) + 1.0;
  }
  -[HUIHeadphoneLevelGroup levels](self, "levels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__HUIHeadphoneLevelGroup_updateWithExposure_withThreshold___block_invoke;
  v9[3] = &unk_24DD61BD0;
  v10 = v7;
  v9[4] = self;
  v9[5] = a4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __59__HUIHeadphoneLevelGroup_updateWithExposure_withThreshold___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  int v5;
  unint64_t v6;
  float v7;
  float v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "isRTL");
  v6 = 17 - a3;
  if (!v5)
    v6 = a3;
  v7 = *(float *)(a1 + 48) - (float)v6;
  if (v7 < 0.0)
    v7 = 0.0;
  v8 = fminf(v7, 1.0);
  objc_msgSend(v10, "setAlpha:", v8);
  if (v8 > 0.0)
  {
    colorForThreshold(*(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
}

- (NSMutableArray)inactiveLevels
{
  return self->_inactiveLevels;
}

- (void)setInactiveLevels:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveLevels, a3);
}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
  objc_storeStrong((id *)&self->_levels, a3);
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (unint64_t)pipFlagIndex
{
  return self->_pipFlagIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levels, 0);
  objc_storeStrong((id *)&self->_inactiveLevels, 0);
}

@end
