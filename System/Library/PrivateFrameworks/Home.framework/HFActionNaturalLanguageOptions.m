@implementation HFActionNaturalLanguageOptions

- (HFActionNaturalLanguageOptions)initWithHome:(id)a3 formattingContext:(int64_t)a4
{
  id v7;
  HFActionNaturalLanguageOptions *v8;
  HFActionNaturalLanguageOptions *v9;
  uint64_t v10;
  NSSet *objectsInContext;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFActionNaturalLanguageOptions;
  v8 = -[HFSubstringNaturalLanguageOptions initWithFormattingContext:formattingStyle:](&v13, sel_initWithFormattingContext_formattingStyle_, a4, 3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    objectsInContext = v9->_objectsInContext;
    v9->_objectsInContext = (NSSet *)v10;

    v9->_useMediaContainersNotInContext = 0;
    v9->_ignoreOptionalCharacteristics = 0;
    v9->_accessoryCountType = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HFActionNaturalLanguageOptions;
  v4 = -[HFSubstringNaturalLanguageOptions copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[HFActionNaturalLanguageOptions home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHome:", v5);

  objc_msgSend(v4, "setFormattingStyle:", -[HFSubstringNaturalLanguageOptions formattingStyle](self, "formattingStyle"));
  -[HFActionNaturalLanguageOptions objectsInContext](self, "objectsInContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setObjectsInContext:", v7);

  objc_msgSend(v4, "setUseMediaContainersNotInContext:", -[HFActionNaturalLanguageOptions useMediaContainersNotInContext](self, "useMediaContainersNotInContext"));
  objc_msgSend(v4, "setIgnoreOptionalCharacteristics:", -[HFActionNaturalLanguageOptions ignoreOptionalCharacteristics](self, "ignoreOptionalCharacteristics"));
  return v4;
}

- (void)setObjectsInContext:(id)a3
{
  char v4;
  void *v5;
  NSSet *v6;
  NSSet *objectsInContext;
  id v8;

  v8 = a3;
  v4 = -[NSSet isEqual:](self->_objectsInContext, "isEqual:", v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    if (v8)
    {
      v6 = (NSSet *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    objectsInContext = self->_objectsInContext;
    self->_objectsInContext = v6;

    v5 = v8;
  }

}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NSSet)objectsInContext
{
  return self->_objectsInContext;
}

- (BOOL)useMediaContainersNotInContext
{
  return self->_useMediaContainersNotInContext;
}

- (void)setUseMediaContainersNotInContext:(BOOL)a3
{
  self->_useMediaContainersNotInContext = a3;
}

- (BOOL)ignoreOptionalCharacteristics
{
  return self->_ignoreOptionalCharacteristics;
}

- (void)setIgnoreOptionalCharacteristics:(BOOL)a3
{
  self->_ignoreOptionalCharacteristics = a3;
}

- (unint64_t)accessoryCountType
{
  return self->_accessoryCountType;
}

- (void)setAccessoryCountType:(unint64_t)a3
{
  self->_accessoryCountType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsInContext, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
