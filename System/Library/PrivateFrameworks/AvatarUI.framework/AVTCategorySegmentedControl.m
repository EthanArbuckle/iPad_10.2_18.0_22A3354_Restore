@implementation AVTCategorySegmentedControl

- (AVTCategorySegmentedControl)initWithItems:(id)a3
{
  AVTCategorySegmentedControl *v3;
  AVTCategorySegmentedControl *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVTCategorySegmentedControl;
  v3 = -[AVTCategorySegmentedControl initWithItems:](&v20, sel_initWithItems_, a3);
  v4 = v3;
  if (v3)
  {
    -[AVTCategorySegmentedControl setSelectedSegmentIndex:](v3, "setSelectedSegmentIndex:", 0);
    v5 = objc_alloc_init(MEMORY[0x1E0CEA638]);
    -[AVTCategorySegmentedControl setBackgroundImage:forState:barMetrics:](v4, "setBackgroundImage:forState:barMetrics:", v5, 0, 0);

    v6 = objc_alloc_init(MEMORY[0x1E0CEA638]);
    -[AVTCategorySegmentedControl setBackgroundImage:forState:barMetrics:](v4, "setBackgroundImage:forState:barMetrics:", v6, 1, 0);

    v7 = objc_alloc_init(MEMORY[0x1E0CEA638]);
    -[AVTCategorySegmentedControl setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:](v4, "setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:", v7, 0, 0, 0);

    v25 = *MEMORY[0x1E0CEA098];
    v8 = v25;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v26 = *MEMORY[0x1E0CEA0A0];
    v10 = v26;
    +[AVTUIColorRepository attributeTitleTextColor](AVTUIColorRepository, "attributeTitleTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v25, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCategorySegmentedControl setTitleTextAttributes:forState:](v4, "setTitleTextAttributes:forState:", v12, 0);

    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    v24[0] = v13;
    +[AVTUIColorRepository attributeTitleTextColor](AVTUIColorRepository, "attributeTitleTextColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCategorySegmentedControl setTitleTextAttributes:forState:](v4, "setTitleTextAttributes:forState:", v15, 4);

    v21[0] = v8;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 18.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    v22[0] = v16;
    +[AVTUIColorRepository attributeTitleTextColor](AVTUIColorRepository, "attributeTitleTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCategorySegmentedControl setTitleTextAttributes:forState:](v4, "setTitleTextAttributes:forState:", v18, 1);

  }
  return v4;
}

@end
