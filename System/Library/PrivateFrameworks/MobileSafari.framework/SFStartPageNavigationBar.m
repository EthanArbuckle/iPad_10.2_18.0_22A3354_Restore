@implementation SFStartPageNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFStartPageNavigationBar;
  -[SFStartPageNavigationBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[SFStartPageNavigationBar topItem](self, "topItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "standardAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || (isKindOfClass & 1) != 0)
    v10 = v5;
  else
    v10 = 0;

  return v10;
}

@end
