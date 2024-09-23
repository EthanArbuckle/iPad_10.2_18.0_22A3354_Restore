@implementation CCUICAPackageDescription

- (CCUICAPackageDescription)initWithPackageName:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  CCUICAPackageDescription *v8;
  uint64_t v9;
  NSURL *packageURL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCUICAPackageDescription;
  v8 = -[CCUICAPackageDescription init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("ca"));
    v9 = objc_claimAutoreleasedReturnValue();
    packageURL = v8->_packageURL;
    v8->_packageURL = (NSURL *)v9;

    v8->_honorsUIViewAnimationState = 1;
  }

  return v8;
}

+ (id)descriptionForPackageNamed:(id)a3 inBundle:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageName:inBundle:", v7, v6);

  return v8;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return self->_flipsForRightToLeftLayoutDirection;
}

- (void)setFlipsForRightToLeftLayoutDirection:(BOOL)a3
{
  self->_flipsForRightToLeftLayoutDirection = a3;
}

- (BOOL)honorsUIViewAnimationState
{
  return self->_honorsUIViewAnimationState;
}

- (void)setHonorsUIViewAnimationState:(BOOL)a3
{
  self->_honorsUIViewAnimationState = a3;
}

- (NSDictionary)stateUpdateHandlers
{
  return self->_stateUpdateHandlers;
}

- (void)setStateUpdateHandlers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)packageURL
{
  return self->_packageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageURL, 0);
  objc_storeStrong((id *)&self->_stateUpdateHandlers, 0);
}

@end
