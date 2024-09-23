@implementation CKEntryViewBlurrableButtonContainer

- (CKEntryViewBlurrableButtonContainer)init
{
  CKEntryViewBlurrableButtonContainer *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CKEntryViewBlurrableButtonContainer;
  v2 = -[CKEntryViewBlurrableButtonContainer init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKeyPath:", &unk_1E2870900, *MEMORY[0x1E0CD2D90]);
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKEntryViewBlurrableButtonContainer layer](v2, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFilters:", v4);

  }
  return v2;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKEntryViewBlurrableButtonContainer;
    v5 = -[CKEntryViewBlurrableButtonContainer _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CKEntryViewBlurrableButtonContainer *v5;
  CKEntryViewBlurrableButtonContainer *v6;
  CKEntryViewBlurrableButtonContainer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKEntryViewBlurrableButtonContainer;
  -[CKEntryViewBlurrableButtonContainer hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKEntryViewBlurrableButtonContainer *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  id v5;

  if (vabdd_f64(a3, self->_blurRadius) > 2.22044605e-16)
  {
    self->_blurRadius = a3;
    -[CKEntryViewBlurrableButtonContainer layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKeyPath:", v4, CFSTR("filters.gaussianBlur.inputRadius"));

  }
}

- (double)blurRadius
{
  return self->_blurRadius;
}

@end
