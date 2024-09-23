@implementation GLTKeyDiversification

+ (id)diversifyPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 withDocumentIdentifier:(id)a5 error:(id *)a6
{
  void *v6;
  GLTDiversifiedKeyAndTPS *v7;
  uint64_t v8;
  void *v9;
  GLTDiversifiedKeyAndTPS *v10;

  +[GLTKeyDiversificationSwift diversifyWithPublicKey:trackingPreventionSalt:docId:error:](_TtC17MessageProtection26GLTKeyDiversificationSwift, "diversifyWithPublicKey:trackingPreventionSalt:docId:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [GLTDiversifiedKeyAndTPS alloc];
    v8 = objc_msgSend(v6, "diversifiedKey");
    objc_msgSend(v6, "trackingPreventionSalt");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GLTDiversifiedKeyAndTPS initWithKey:trackingPreventionSalt:](v7, "initWithKey:trackingPreventionSalt:", v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)diversifyPublicKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "diversifyPublicKey:trackingPreventionSalt:withDocumentIdentifier:error:", a3, 0, a4, a5);
}

+ (__SecKey)diversifyPrivateKey:(__SecKey *)a3 withDocumentIdentifier:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6
{
  return +[GLTKeyDiversificationSwift diversifyWithPrivateKey:docId:trackingPreventionSalt:error:](_TtC17MessageProtection26GLTKeyDiversificationSwift, "diversifyWithPrivateKey:docId:trackingPreventionSalt:error:", a3, a4, a5, a6);
}

@end
