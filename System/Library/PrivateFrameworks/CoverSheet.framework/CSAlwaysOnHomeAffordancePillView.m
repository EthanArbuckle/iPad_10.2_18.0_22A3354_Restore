@implementation CSAlwaysOnHomeAffordancePillView

- (CSAlwaysOnHomeAffordancePillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  CSAlwaysOnHomeAffordancePillView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSAlwaysOnHomeAffordancePillView;
  v4 = -[MTPillView initWithFrame:settings:](&v13, sel_initWithFrame_settings_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.25);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSAlwaysOnHomeAffordancePillView setBackgroundColor:](v4, "setBackgroundColor:", v6);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKey:", &unk_1E8E879C0, *MEMORY[0x1E0CD2D90]);
    v8 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v7, "setValue:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D70]);
    objc_msgSend(v7, "setValue:forKey:", v8, *MEMORY[0x1E0CD2D58]);
    -[CSAlwaysOnHomeAffordancePillView layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v10);

    -[CSAlwaysOnHomeAffordancePillView layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setScale:", 0.125);

  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
