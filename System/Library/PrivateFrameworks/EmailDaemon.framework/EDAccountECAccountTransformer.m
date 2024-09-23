@implementation EDAccountECAccountTransformer

- (id)transformAccount:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCFBCE8))
  {
    -[EDAccountECAccountTransformer transformReceivingAccount:](self, "transformReceivingAccount:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCFBDC0))
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[EDAccountECAccountTransformer transformDeliveryAccount:](self, "transformDeliveryAccount:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

void __59__EDAccountECAccountTransformer_transformReceivingAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUsername:", v3);

  objc_msgSend(*(id *)(a1 + 32), "statisticsKind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStatisticsKind:", v4);

  objc_msgSend(v10, "setSourceIsManaged:", objc_msgSend(*(id *)(a1 + 32), "sourceIsManaged"));
  objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEmailAddresses:", v5);

  objc_msgSend(v10, "setShouldArchiveByDefault:", objc_msgSend(*(id *)(a1 + 32), "shouldArchiveByDefault"));
  objc_msgSend(v10, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "primaryiCloudAccount"));
  objc_msgSend(v10, "setIsLocalAccount:", objc_msgSend(*(id *)(a1 + 32), "isLocalAccount"));
  objc_msgSend(*(id *)(a1 + 32), "deliveryAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "deliveryAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transformDeliveryAccount:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDeliveryAccount:", v9);

  }
}

void __58__EDAccountECAccountTransformer_transformDeliveryAccount___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v3);

  objc_msgSend(v4, "setMaximumMessageBytes:", objc_msgSend(*(id *)(a1 + 32), "maximumMessageBytes"));
  objc_msgSend(v4, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "primaryiCloudAccount"));

}

- (id)transformDeliveryAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1E2A8]);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithRepresentedObjectID:", v5);

  objc_msgSend(v3, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostname");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D1E168]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__EDAccountECAccountTransformer_transformDeliveryAccount___block_invoke;
  v13[3] = &unk_1E949AD18;
  v10 = v3;
  v14 = v10;
  v11 = (void *)objc_msgSend(v9, "initWithObjectID:name:hostname:builder:", v6, v7, v8, v13);

  return v11;
}

- (id)transformReceivingAccount:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  EDAccountECAccountTransformer *v19;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D1E2A8]);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithRepresentedObjectID:", v6);

  objc_msgSend(v4, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostname");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E94A4508;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  v13 = objc_alloc(MEMORY[0x1E0D1E2D0]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__EDAccountECAccountTransformer_transformReceivingAccount___block_invoke;
  v17[3] = &unk_1E949ACF0;
  v14 = v4;
  v18 = v14;
  v19 = self;
  v15 = (void *)objc_msgSend(v13, "initWithObjectID:name:hostname:builder:", v7, v8, v12, v17);

  return v15;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFCF0520))
  {
    -[EDAccountECAccountTransformer transformAccount:](self, "transformAccount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
