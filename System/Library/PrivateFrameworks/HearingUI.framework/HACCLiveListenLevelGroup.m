@implementation HACCLiveListenLevelGroup

- (HACCLiveListenLevelGroup)initWithFrame:(CGRect)a3
{
  HACCLiveListenLevelGroup *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HACCLiveListenLevelGroup;
  v3 = -[HACCLiveListenLevelGroup initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 5;
    do
    {
      v6 = objc_alloc_init(MEMORY[0x24BDE5758]);
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.25);
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v6, "setFillColor:", objc_msgSend(v7, "CGColor"));

      -[HACCLiveListenLevelGroup layer](v3, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSublayer:", v6);

      objc_msgSend(v4, "addObject:", v6);
      --v5;
    }
    while (v5);
    -[HACCLiveListenLevelGroup setLevels:](v3, "setLevels:", v4);

  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HACCLiveListenLevelGroup;
  -[HACCLiveListenLevelGroup layoutSubviews](&v13, sel_layoutSubviews);
  -[HACCLiveListenLevelGroup bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HACCLiveListenLevelGroup levels](self, "levels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__HACCLiveListenLevelGroup_layoutSubviews__block_invoke;
  v12[3] = &unk_24DD612D0;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __42__HACCLiveListenLevelGroup_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v5 = (void *)MEMORY[0x24BEBDB00];
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  v8 = objc_msgSend(v5, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute"));
  v9 = (void *)MEMORY[0x24BEBD420];
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = (double)a3;
  if (v8 == 1)
  {
    v15 = CGRectGetMinX(*(CGRect *)&v10) + 10.0 + v14 * 7.0;
    v16 = 4.0;
  }
  else
  {
    v15 = CGRectGetMaxX(*(CGRect *)&v10) + -10.0 + v14 * -7.0;
    v16 = -4.0;
  }
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:", v15 + v14 * v16, CGRectGetMidY(*(CGRect *)(a1 + 40)) + -3.5, 7.0, 7.0, 20.0);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "setPath:", objc_msgSend(v17, "CGPath"));

}

- (void)updateLevel:(double)a3
{
  id v4;
  _QWORD v5[5];

  -[HACCLiveListenLevelGroup levels](self, "levels");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__HACCLiveListenLevelGroup_updateLevel___block_invoke;
  v5[3] = &__block_descriptor_40_e29_v32__0__CAShapeLayer_8Q16_B24l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __40__HACCLiveListenLevelGroup_updateLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  double v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BEBD4B8];
  if (6 - a3 >= (unint64_t)(int)(*(double *)(a1 + 32) * 5.0))
    v4 = 0.25;
  else
    v4 = 1.0;
  v5 = a2;
  objc_msgSend(v3, "colorWithWhite:alpha:", 1.0, v4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setFillColor:", objc_msgSend(v6, "CGColor"));

}

- (NSMutableArray)levels
{
  return self->_levels;
}

- (void)setLevels:(id)a3
{
  objc_storeStrong((id *)&self->_levels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levels, 0);
}

@end
