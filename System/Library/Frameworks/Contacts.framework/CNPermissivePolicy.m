@implementation CNPermissivePolicy

+ (id)sharedPermissivePolicy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CNPermissivePolicy_sharedPermissivePolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPermissivePolicy_cn_once_token_0 != -1)
    dispatch_once(&sharedPermissivePolicy_cn_once_token_0, block);
  return (id)sharedPermissivePolicy_cn_once_object_0;
}

void __44__CNPermissivePolicy_sharedPermissivePolicy__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedPermissivePolicy_cn_once_object_0;
  sharedPermissivePolicy_cn_once_object_0 = (uint64_t)v1;

}

- (BOOL)isReadonly
{
  return 0;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "isMultiValue"))
      v6 = -1;
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  return 0;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (id)unsupportedKeyPathsForContactProperty:(id)a3
{
  return 0;
}

- (BOOL)shouldAddContact:(id)a3
{
  return 1;
}

- (BOOL)shouldRemoveContact:(id)a3
{
  return 1;
}

- (BOOL)shouldSetValue:(id)a3 ofProperty:(id)a4 onContact:(id)a5 replacementValue:(id *)a6
{
  return 1;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPermissivePolicy)initWithCoder:(id)a3
{
  CNPermissivePolicy *v4;

  objc_msgSend((id)objc_opt_class(), "sharedPermissivePolicy");
  v4 = (CNPermissivePolicy *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
