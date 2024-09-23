@implementation MOSuggestionAssetReflectionPrompt

- (MOSuggestionAssetReflectionPrompt)initWithReflectionPrompts:(id)a3 icon:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  MOSuggestionAssetReflectionPrompt *v11;
  MOSuggestionAssetReflectionPrompt *v12;
  uint64_t v13;
  NSString *reflectionPrompt;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MOSuggestionAssetReflectionPrompt;
  v11 = -[MOSuggestionAssetReflectionPrompt init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_reflectionPrompts, a3);
    objc_storeStrong((id *)&v12->_reflectionVisual, a4);
    v12->_reflectionType = a5;
    objc_msgSend(v9, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    reflectionPrompt = v12->_reflectionPrompt;
    v12->_reflectionPrompt = (NSString *)v13;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *reflectionPrompts;
  id v5;
  id v6;

  reflectionPrompts = self->_reflectionPrompts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", reflectionPrompts, CFSTR("kCoderKeyReflectionAssetPrompts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reflectionPrompt, CFSTR("kCoderKeyReflectionAssetPrompt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reflectionVisual, CFSTR("kCoderKeyReflectionAssetImage"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_reflectionType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("kCoderKeyReflectionAssetType"));

}

- (MOSuggestionAssetReflectionPrompt)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetReflectionPrompt *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *reflectionPrompts;
  uint64_t v11;
  NSString *reflectionPrompt;
  uint64_t v13;
  UIImage *reflectionVisual;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOSuggestionAssetReflectionPrompt;
  v5 = -[MOSuggestionAssetReflectionPrompt init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCoderKeyReflectionAssetPrompts"));
    v9 = objc_claimAutoreleasedReturnValue();
    reflectionPrompts = v5->_reflectionPrompts;
    v5->_reflectionPrompts = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyReflectionAssetPrompt"));
    v11 = objc_claimAutoreleasedReturnValue();
    reflectionPrompt = v5->_reflectionPrompt;
    v5->_reflectionPrompt = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyReflectionAssetImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    reflectionVisual = v5->_reflectionVisual;
    v5->_reflectionVisual = (UIImage *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCoderKeyReflectionAssetType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_reflectionType = (int)objc_msgSend(v15, "intValue");

  }
  return v5;
}

- (NSString)reflectionPrompt
{
  return self->_reflectionPrompt;
}

- (NSArray)reflectionPrompts
{
  return self->_reflectionPrompts;
}

- (UIImage)reflectionVisual
{
  return self->_reflectionVisual;
}

- (unint64_t)reflectionType
{
  return self->_reflectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reflectionVisual, 0);
  objc_storeStrong((id *)&self->_reflectionPrompts, 0);
  objc_storeStrong((id *)&self->_reflectionPrompt, 0);
}

@end
