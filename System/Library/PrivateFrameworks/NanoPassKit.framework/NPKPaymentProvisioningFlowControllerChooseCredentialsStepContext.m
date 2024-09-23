@implementation NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (NSArray)credentials
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext flowIdentifiers](self, "flowIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext flowIdentifierToCredential](self, "flowIdentifierToCredential");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext flowIdentifiers](self, "flowIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext flowIdentifierToCredential](self, "flowIdentifierToCredential");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext allowsManualEntry](self, "allowsManualEntry");
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext product](self, "product");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ ordered flow identifiers %@ credentials %@ allows manual entry %d product %@>"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *flowIdentifierToCredential;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *flowIdentifiers;
  uint64_t v16;
  NSArray *credentials;
  uint64_t v18;
  PKPaymentSetupProduct *product;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("flowIdentifierToCredential"));
    v9 = objc_claimAutoreleasedReturnValue();
    flowIdentifierToCredential = v5->_flowIdentifierToCredential;
    v5->_flowIdentifierToCredential = (NSDictionary *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("flowIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    flowIdentifiers = v5->_flowIdentifiers;
    v5->_flowIdentifiers = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentials"));
    v16 = objc_claimAutoreleasedReturnValue();
    credentials = v5->_credentials;
    v5->_credentials = (NSArray *)v16;

    v5->_allowsManualEntry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsManualEntry"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("product"));
    v18 = objc_claimAutoreleasedReturnValue();
    product = v5->_product;
    v5->_product = (PKPaymentSetupProduct *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_flowIdentifierToCredential, CFSTR("flowIdentifierToCredential"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_flowIdentifiers, CFSTR("flowIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentials, CFSTR("credentials"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_allowsManualEntry, CFSTR("allowsManualEntry"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_product, CFSTR("product"));

}

- (NSDictionary)flowIdentifierToCredential
{
  return self->_flowIdentifierToCredential;
}

- (void)setFlowIdentifierToCredential:(id)a3
{
  objc_storeStrong((id *)&self->_flowIdentifierToCredential, a3);
}

- (NSArray)flowIdentifiers
{
  return self->_flowIdentifiers;
}

- (void)setFlowIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_flowIdentifiers, a3);
}

- (void)setCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  self->_allowsManualEntry = a3;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
  objc_storeStrong((id *)&self->_product, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_flowIdentifiers, 0);
  objc_storeStrong((id *)&self->_flowIdentifierToCredential, 0);
}

@end
