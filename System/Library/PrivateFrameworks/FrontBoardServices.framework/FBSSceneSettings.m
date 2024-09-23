@implementation FBSSceneSettings

- (FBSDisplayIdentity)displayIdentity
{
  void *v2;
  void *v3;

  -[FBSSceneSettings displayConfiguration](self, "displayConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBSDisplayIdentity *)v3;
}

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)_mutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreOcclusionReasons, 0);
}

- (FBSSceneSettings)initWithSettings:(id)a3
{
  id v4;
  FBSSceneSettings *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *ignoreOcclusionReasons;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBSSceneSettings;
  v5 = -[FBSSettings initWithSettings:](&v12, sel_initWithSettings_, v4);
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v4, "ignoreOcclusionReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
      v9 = objc_msgSend(v7, "mutableCopy");
    else
      v9 = objc_msgSend(v7, "copy");
    ignoreOcclusionReasons = v5->_ignoreOcclusionReasons;
    v5->_ignoreOcclusionReasons = (NSSet *)v9;

  }
  return v5;
}

- (id)ignoreOcclusionReasons
{
  return self->_ignoreOcclusionReasons;
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  int IsLandscape;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[FBSSceneSettings frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[FBSSceneSettings interfaceOrientation](self, "interfaceOrientation");
  IsLandscape = BSInterfaceOrientationIsLandscape();
  if (IsLandscape)
    v8 = v6;
  else
    v8 = v4;
  if (IsLandscape)
    v9 = v4;
  else
    v9 = v6;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (id)settings
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSettings:", 0);
}

- (BOOL)isBackgrounded
{
  return -[FBSSceneSettings isForeground](self, "isForeground") ^ 1;
}

- (BOOL)isIgnoringOcclusions
{
  return -[NSSet count](self->_ignoreOcclusionReasons, "count") != 0;
}

+ (Class)_diffClass
{
  return (Class)objc_opt_class();
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)-[objc_class settingsExtensions](a3, "settingsExtensions");
}

- (BOOL)_isEmptyForCoding:(BOOL)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FBSSceneSettings;
  v5 = -[FBSSettings _isEmptyForCoding:](&v7, sel__isEmptyForCoding_);
  if (v5 && !a3)
    LOBYTE(v5) = -[NSSet count](self->_ignoreOcclusionReasons, "count") == 0;
  return v5;
}

- (BOOL)_hasAdditionalDescription
{
  void *v2;
  BOOL v3;

  -[NSSet allObjects](self->_ignoreOcclusionReasons, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_appendToDescriptionBuilder:(id)a3
{
  NSSet *ignoreOcclusionReasons;
  id v4;
  id v5;

  ignoreOcclusionReasons = self->_ignoreOcclusionReasons;
  v4 = a3;
  -[NSSet allObjects](ignoreOcclusionReasons, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("ignoreOcclusionReasons"), 1);

}

- (BOOL)_isEqualToSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = (void *)*((_QWORD *)v4 + 9);
  else
    v6 = 0;
  v7 = v6;
  if ((-[NSSet count](self->_ignoreOcclusionReasons, "count") || objc_msgSend(v7, "count"))
    && !BSEqualObjects())
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FBSSceneSettings;
    v8 = -[FBSSettings _isEqualToSettings:](&v10, sel__isEqualToSettings_, v5);
  }

  return v8;
}

@end
