@implementation AABridgedMescalSigner

- (AABridgedMescalSigner)init
{
  AABridgedMescalSigner *v2;
  uint64_t v3;
  AMSBag *bag;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AABridgedMescalSigner;
  v2 = -[AABridgedMescalSigner init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((Class)getAMSBagClass[0](), "bagForProfile:profileVersion:", CFSTR("appstored"), CFSTR("1"));
    v3 = objc_claimAutoreleasedReturnValue();
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v3;

    v5 = objc_alloc_init((Class)getAMSMutableBagKeySetClass[0]());
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("sign-sap-setup-cert"), 5);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("sign-sap-setup"), 5);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("trustedDomains"), 0);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("signed-actions"), 6);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("metrics"), 6);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("sign-sap-request"), 6);
    objc_msgSend(v5, "addBagKey:valueType:", CFSTR("sign-sap-response"), 6);
    objc_msgSend((Class)getAMSMutableBagKeySetClass[0](), "registerBagKeySet:forProfile:profileVersion:", v5, CFSTR("appstored"), CFSTR("1"));

  }
  return v2;
}

- (id)signatureWithData:(id)a3 error:(id *)a4
{
  Class (__cdecl *v6)();
  id v7;
  Class v8;
  void *v9;
  void *v10;

  v6 = (Class (__cdecl *)())getAMSMescalClass;
  v7 = a3;
  v8 = v6();
  -[AABridgedMescalSigner bag](self, "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class signatureFromData:type:bag:error:](v8, "signatureFromData:type:bag:error:", v7, 1, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
}

@end
