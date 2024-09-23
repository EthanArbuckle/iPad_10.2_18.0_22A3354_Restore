@implementation WDClinicalGatewayProxy

- (WDClinicalGatewayProxy)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (WDClinicalGatewayProxy)initWithGatewayID:(id)a3 batchID:(id)a4
{
  id v6;
  id v7;
  WDClinicalGatewayProxy *v8;
  uint64_t v9;
  NSString *gatewayID;
  uint64_t v11;
  NSString *batchID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDClinicalGatewayProxy;
  v8 = -[WDClinicalGatewayProxy init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    gatewayID = v8->_gatewayID;
    v8->_gatewayID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    batchID = v8->_batchID;
    v8->_batchID = (NSString *)v11;

  }
  return v8;
}

- (NSString)gatewayID
{
  return self->_gatewayID;
}

- (NSString)batchID
{
  return self->_batchID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchID, 0);
  objc_storeStrong((id *)&self->_gatewayID, 0);
}

@end
