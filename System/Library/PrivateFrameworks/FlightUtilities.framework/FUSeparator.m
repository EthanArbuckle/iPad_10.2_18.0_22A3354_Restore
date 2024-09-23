@implementation FUSeparator

- (FUSeparator)initWithCoder:(id)a3
{
  FUSeparator *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FUSeparator;
  v3 = -[FUSeparator initWithCoder:](&v6, sel_initWithCoder_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB4B88], "bestAppearanceForView:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FUSeparator updateProminenceForAppearance:](v3, "updateProminenceForAppearance:", v4);

  }
  return v3;
}

- (void)updateProminenceForAppearance:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "isVibrant"))
    v4 = 2;
  else
    v4 = 3;
  -[TLKProminenceView setProminence:](self, "setProminence:", v4);
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[FUSeparator updateProminenceForAppearance:](self, "updateProminenceForAppearance:", v4);
  v5.receiver = self;
  v5.super_class = (Class)FUSeparator;
  -[TLKProminenceView tlk_updateForAppearance:](&v5, sel_tlk_updateForAppearance_, v4);

}

- (double)onePixelSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[FUSeparator window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "scale");
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v5 = v7;

  }
  if (v5 <= 0.0)
    v8 = 1.0;
  else
    v8 = 1.0 / v5;

  return v8;
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[FUSeparator constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "firstAttribute") == 8)
        {
          -[FUSeparator onePixelSize](self, "onePixelSize");
          objc_msgSend(v8, "setConstant:");
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)FUSeparator;
  -[FUSeparator updateConstraints](&v9, sel_updateConstraints);
}

@end
