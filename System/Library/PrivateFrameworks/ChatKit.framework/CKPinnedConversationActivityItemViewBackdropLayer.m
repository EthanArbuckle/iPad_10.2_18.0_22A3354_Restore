@implementation CKPinnedConversationActivityItemViewBackdropLayer

- (CKPinnedConversationActivityItemViewBackdropLayer)init
{
  CKPinnedConversationActivityItemViewBackdropLayer *v2;
  CKPinnedConversationActivityItemViewBackdropLayer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CKPinnedConversationActivityItemViewBackdropLayer;
  v2 = -[CKPinnedConversationActivityItemViewBackdropLayer init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKPinnedConversationActivityItemViewBackdropLayer _updateBackgroundColor](v2, "_updateBackgroundColor");
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKeyPath:", CFSTR("default"), *MEMORY[0x1E0CD2D88]);
    objc_msgSend(v4, "setValue:forKeyPath:", &unk_1E28719D0, *MEMORY[0x1E0CD2D90]);
    v5 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2D58]);
    objc_msgSend(v4, "setValue:forKeyPath:", v5, *MEMORY[0x1E0CD2D70]);
    v6 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v4, "setValue:forKeyPath:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CD2D28]);
    objc_msgSend(v4, "setValue:forKeyPath:", v6, *MEMORY[0x1E0CD2D68]);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:forKeyPath:", &unk_1E28719E0, *MEMORY[0x1E0CD2CB8]);
    v11[0] = v4;
    v11[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPinnedConversationActivityItemViewBackdropLayer setFilters:](v3, "setFilters:", v8);

  }
  return v3;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  if (self->_userInterfaceStyle != a3)
  {
    self->_userInterfaceStyle = a3;
    -[CKPinnedConversationActivityItemViewBackdropLayer _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

- (void)_updateBackgroundColor
{
  unint64_t userInterfaceStyle;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  userInterfaceStyle = self->_userInterfaceStyle;
  if (userInterfaceStyle < 2)
  {
    v4 = (void *)MEMORY[0x1E0CEA478];
    v5 = 0.9;
    v6 = 1.0;
LABEL_6:
    objc_msgSend(v4, "colorWithWhite:alpha:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (userInterfaceStyle == 2)
  {
    v4 = (void *)MEMORY[0x1E0CEA478];
    v6 = 0.278431373;
    v5 = 0.75;
    goto LABEL_6;
  }
  v7 = 0;
LABEL_7:
  v8 = objc_retainAutorelease(v7);
  -[CKPinnedConversationActivityItemViewBackdropLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

@end
