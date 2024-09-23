@implementation CCSModulePresentationOptions

+ (id)defaultOptions
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBlurBackground:animatePresentation:animateDismissal:", 1, 1, 1);
}

- (CCSModulePresentationOptions)initWithBlurBackground:(BOOL)a3 animatePresentation:(BOOL)a4 animateDismissal:(BOOL)a5
{
  CCSModulePresentationOptions *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CCSModulePresentationOptions;
  result = -[CCSModulePresentationOptions init](&v9, sel_init);
  if (result)
  {
    result->_blurBackground = a3;
    result->_animatePresentation = a4;
    result->_animateDismissal = a5;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", self->_blurBackground);
  v5 = (id)objc_msgSend(v3, "appendBool:", self->_animatePresentation);
  v6 = (id)objc_msgSend(v3, "appendBool:", self->_animateDismissal);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  _BOOL4 v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[CCSModulePresentationOptions blurBackground](self, "blurBackground");
    v7 = v6 ^ objc_msgSend(v5, "blurBackground");
    v8 = -[CCSModulePresentationOptions animatePresentation](self, "animatePresentation");
    v9 = v7 | v8 ^ objc_msgSend(v5, "animatePresentation");
    v10 = -[CCSModulePresentationOptions animateDismissal](self, "animateDismissal");
    LOBYTE(v8) = objc_msgSend(v5, "animateDismissal");

    v11 = (v9 | v10 ^ v8) ^ 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_blurBackground, CFSTR("blurBackground"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_animatePresentation, CFSTR("animatePresentation"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_animateDismissal, CFSTR("animateDismissal"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions blurBackground](self, "blurBackground"), CFSTR("blurBackground"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions animatePresentation](self, "animatePresentation"), CFSTR("animatePresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[CCSModulePresentationOptions animateDismissal](self, "animateDismissal"), CFSTR("animateDismissal"));

}

- (CCSModulePresentationOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blurBackground"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("animatePresentation"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("animateDismissal"));

  return -[CCSModulePresentationOptions initWithBlurBackground:animatePresentation:animateDismissal:](self, "initWithBlurBackground:animatePresentation:animateDismissal:", v5, v6, v7);
}

- (BOOL)animatePresentation
{
  return self->_animatePresentation;
}

- (BOOL)animateDismissal
{
  return self->_animateDismissal;
}

- (BOOL)blurBackground
{
  return self->_blurBackground;
}

@end
