@implementation CNPostalAddressFormats

+ (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedLocalizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForPostalAddressString:returningNilIfNotFound:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)sharedLocalizer
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CNPostalAddressFormats_sharedLocalizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLocalizer_cn_once_token_2 != -1)
    dispatch_once(&sharedLocalizer_cn_once_token_2, block);
  return (id)sharedLocalizer_cn_once_object_2;
}

void __41__CNPostalAddressFormats_sharedLocalizer__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "makeLocalizer");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sharedLocalizer_cn_once_object_2;
  sharedLocalizer_cn_once_object_2 = v1;

}

+ (id)makeLocalizer
{
  void *v2;

  +[CNEnvironmentBase currentEnvironment](CNEnvironment, "currentEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isGreenTeaDevice");

  return (id)objc_opt_new();
}

+ (id)addressFormats
{
  return &unk_1E29EFF20;
}

+ (id)_unitTestableLocalizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "makeLocalizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForPostalAddressString:returningNilIfNotFound:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
