@implementation GCDevicePhysicalInputElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  id v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&off_254DE1AE8;
  v2 = objc_msgSendSuper2(&v13, sel_makeParameters);
  objc_msgSend(a1, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v3, v4, 8);

  objc_msgSend(a1, "aliases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v5, v6, 16);

  objc_msgSend(a1, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _GCFConvertStringToLocalizedString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v8, v9, 24);

  objc_msgSend(a1, "symbol");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_setProperty_nonatomic_copy(v2, v10, v11, 32);

  return v2;
}

@end
