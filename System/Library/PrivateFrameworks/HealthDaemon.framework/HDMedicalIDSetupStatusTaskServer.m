@implementation HDMedicalIDSetupStatusTaskServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  char v9;

  v5 = a3;
  v6 = *MEMORY[0x1E0CB5398];
  if (objc_msgSend(v5, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB5398], a4))
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  v9 = objc_msgSend(v5, "hasRequiredArrayEntitlement:containing:error:", v6, *MEMORY[0x1E0CB4DA8], a4) | v8;

  return v9 & 1;
}

- (void)remote_medicalIDSetUpStatusWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;

  v4 = (void (**)(id, uint64_t))a3;
  if (self)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "medicalIDDataManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[HDStandardTaskServer profile](self, "profile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "medicalIDDataManager");
      self = (HDMedicalIDSetupStatusTaskServer *)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v9;
      if (v9)
        v10 = objc_retainAutorelease(v9);

      self = 0;
      v7 = v8;
    }

  }
  else
  {
    v8 = 0;
  }
  v11 = v8;
  v12 = v11;
  if (self)
  {
    v15 = v11;
    v13 = -[HDMedicalIDSetupStatusTaskServer medicalIDSetupStatusWithError:](self, "medicalIDSetupStatusWithError:", &v15);
    v14 = v15;

    v12 = v14;
  }
  else
  {
    v13 = 0;
  }
  v4[2](v4, v13);

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "setupStatusTaskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "setupStatusServerInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "setupStatusClientInterface");
}

@end
