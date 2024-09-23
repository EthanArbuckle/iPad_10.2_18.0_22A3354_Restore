@implementation _HKOxygenSaturationOverrideTapGestureRecognizer

- (_HKOxygenSaturationOverrideTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _HKOxygenSaturationOverrideTapGestureRecognizer *v4;
  _HKOxygenSaturationOverrideTapGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_HKOxygenSaturationOverrideTapGestureRecognizer;
  v4 = -[_HKOxygenSaturationOverrideTapGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[_HKOxygenSaturationOverrideTapGestureRecognizer setNumberOfTapsRequired:](v4, "setNumberOfTapsRequired:", 3);
    -[_HKOxygenSaturationOverrideTapGestureRecognizer setDelegate:](v5, "setDelegate:", v5);
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v5, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass() ^ 1;

  }
  return v10 & 1;
}

@end
