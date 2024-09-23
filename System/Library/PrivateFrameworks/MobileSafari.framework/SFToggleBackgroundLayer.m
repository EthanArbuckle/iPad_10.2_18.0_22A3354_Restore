@implementation SFToggleBackgroundLayer

- (id)implicitAnimationForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFToggleBackgroundLayer;
  -[SFToggleBackgroundLayer implicitAnimationForKeyPath:](&v12, sel_implicitAnimationForKeyPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("path")))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[SFToggleBackgroundLayer presentationLayer](self, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v9);

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v10);

    objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
