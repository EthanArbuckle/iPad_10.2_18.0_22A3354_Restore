@implementation CAShapeLayerAnimated

- (id)actionForKey:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("path")))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setFromValue:", -[CAShapeLayerAnimated path](self, "path"));
    objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration");
    objc_msgSend(v5, "setDuration:");
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimingFunction:", v4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAShapeLayerAnimated;
    -[CAShapeLayerAnimated actionForKey:](&v7, sel_actionForKey_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
