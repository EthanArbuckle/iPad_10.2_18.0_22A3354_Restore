@implementation HFNaturalLightColor

- (HFNaturalLightColor)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HFNaturalLightColor;
  return -[HFNaturalLightColor init](&v3, sel_init);
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_301 != -1)
    dispatch_once(&_MergedGlobals_301, &__block_literal_global_2_28);
  return (NAIdentity *)(id)qword_1ED379B58;
}

void __34__HFNaturalLightColor_na_identity__block_invoke_2()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "build");
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)qword_1ED379B58;
  qword_1ED379B58 = v1;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)HFNaturalLightColor;
  -[HFNaturalLightColor description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ Natural Light Color"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
