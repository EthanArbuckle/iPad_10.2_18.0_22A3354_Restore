@implementation MFMessageLoadingContextToEMSecurityInformationTransformer

+ (id)securityInformationFromMFMessageLoadingContextEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "loadedBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelPart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copySigners");
  objc_msgSend(v6, "ef_map:", &__block_literal_global_50);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "messageFlags");

  v10 = objc_alloc(MEMORY[0x1E0D1E348]);
  objc_msgSend(v3, "loadedBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEncryptedDescendantPart");
  objc_msgSend(v3, "loadedBody");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topLevelPart");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SMIMEError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithSigners:isEncrypted:hasEncryptedDescendantPart:smimeError:", v7, (v9 >> 3) & 1, v12, v15);

  return v16;
}

id __113__MFMessageLoadingContextToEMSecurityInformationTransformer_securityInformationFromMFMessageLoadingContextEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  +[MFMessageSignerEMMessageSignerTransformer messageSignerFromMFMessageSigner:](MFMessageSignerEMMessageSignerTransformer, "messageSignerFromMFMessageSigner:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
