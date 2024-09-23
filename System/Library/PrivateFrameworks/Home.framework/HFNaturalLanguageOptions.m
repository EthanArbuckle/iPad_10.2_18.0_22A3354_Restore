@implementation HFNaturalLanguageOptions

- (HFNaturalLanguageOptions)init
{
  HFNaturalLanguageOptions *v2;
  uint64_t v3;
  NSMutableDictionary *extraOptions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFNaturalLanguageOptions;
  v2 = -[HFNaturalLanguageOptions init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    extraOptions = v2->_extraOptions;
    v2->_extraOptions = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[HFNaturalLanguageOptions home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHome:", v5);

  -[HFNaturalLanguageOptions extraOptions](self, "extraOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableDictionary)extraOptions
{
  return self->_extraOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraOptions, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
