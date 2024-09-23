@implementation DACarKeySharingMessage

- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalData:(id)a4 privateData:(id)a5
{
  id v9;
  id v10;
  id v11;
  DACarKeySharingMessage *v12;
  DACarKeySharingMessage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeySharingMessage;
  v12 = -[DACarKeySharingMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_genericData, a3);
    objc_storeStrong((id *)&v13->_additionalData, a4);
    objc_storeStrong((id *)&v13->_privateData, a5);
  }

  return v13;
}

- (DACarKeySharingMessage)initWithGenericCrossPlatformSharingData:(id)a3 additionalDataDictionary:(id)a4
{
  id v7;
  id v8;
  DACarKeySharingMessage *v9;
  DACarKeySharingMessage *v10;
  DACarKeyAdditionalCrossPlatformSharingData *v11;
  DACarKeyAdditionalCrossPlatformSharingData *additionalData;
  DACarKeyPrivateCrossPlatformSharingData *privateData;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DACarKeySharingMessage;
  v9 = -[DACarKeySharingMessage init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_genericData, a3);
    if (v8)
    {
      v11 = -[DACarKeyAdditionalCrossPlatformSharingData initWithDictionary:]([DACarKeyAdditionalCrossPlatformSharingData alloc], "initWithDictionary:", v8);
      additionalData = v10->_additionalData;
      v10->_additionalData = v11;
    }
    else
    {
      additionalData = v10->_additionalData;
      v10->_additionalData = 0;
    }

    privateData = v10->_privateData;
    v10->_privateData = 0;

  }
  return v10;
}

- (DACarKeySharingMessage)initWithGenericDataDictionary:(id)a3 additionalDataDictionary:(id)a4
{
  id v6;
  id v7;
  DACarKeySharingMessage *v8;
  DACarKeySharingMessage *v9;
  DACarKeyGenericCrossPlatformSharingData *v10;
  DACarKeyGenericCrossPlatformSharingData *genericData;
  DACarKeyAdditionalCrossPlatformSharingData *v12;
  DACarKeyAdditionalCrossPlatformSharingData *additionalData;
  DACarKeyPrivateCrossPlatformSharingData *privateData;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DACarKeySharingMessage;
  v8 = -[DACarKeySharingMessage init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = -[DACarKeyGenericCrossPlatformSharingData initWithDictionary:]([DACarKeyGenericCrossPlatformSharingData alloc], "initWithDictionary:", v6);
      genericData = v9->_genericData;
      v9->_genericData = v10;
    }
    else
    {
      genericData = v8->_genericData;
      v8->_genericData = 0;
    }

    if (v7)
    {
      v12 = -[DACarKeyAdditionalCrossPlatformSharingData initWithDictionary:]([DACarKeyAdditionalCrossPlatformSharingData alloc], "initWithDictionary:", v7);
      additionalData = v9->_additionalData;
      v9->_additionalData = v12;
    }
    else
    {
      additionalData = v9->_additionalData;
      v9->_additionalData = 0;
    }

    privateData = v9->_privateData;
    v9->_privateData = 0;

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  DACarKeySharingMessage *v5;
  DACarKeyGenericCrossPlatformSharingData *v6;
  DACarKeyGenericCrossPlatformSharingData *genericData;
  DACarKeyAdditionalCrossPlatformSharingData *v8;
  DACarKeyAdditionalCrossPlatformSharingData *additionalData;
  DACarKeyPrivateCrossPlatformSharingData *v10;
  DACarKeyPrivateCrossPlatformSharingData *privateData;

  v5 = -[DACarKeySharingMessage init](+[DACarKeySharingMessage allocWithZone:](DACarKeySharingMessage, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = -[DACarKeyGenericCrossPlatformSharingData copyWithZone:](self->_genericData, "copyWithZone:", a3);
    genericData = v5->_genericData;
    v5->_genericData = v6;

    v8 = -[DACarKeyAdditionalCrossPlatformSharingData copyWithZone:](self->_additionalData, "copyWithZone:", a3);
    additionalData = v5->_additionalData;
    v5->_additionalData = v8;

    v10 = -[DACarKeyPrivateCrossPlatformSharingData copyWithZone:](self->_privateData, "copyWithZone:", a3);
    privateData = v5->_privateData;
    v5->_privateData = v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DACarKeySharingMessage genericData](self, "genericData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("genericData"));

  -[DACarKeySharingMessage additionalData](self, "additionalData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("additionalData"));

  -[DACarKeySharingMessage privateData](self, "privateData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("privateData"));

}

- (DACarKeySharingMessage)initWithCoder:(id)a3
{
  id v4;
  DACarKeySharingMessage *v5;
  uint64_t v6;
  DACarKeyGenericCrossPlatformSharingData *genericData;
  uint64_t v8;
  DACarKeyAdditionalCrossPlatformSharingData *additionalData;
  uint64_t v10;
  DACarKeyPrivateCrossPlatformSharingData *privateData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeySharingMessage;
  v5 = -[DACarKeySharingMessage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genericData"));
    v6 = objc_claimAutoreleasedReturnValue();
    genericData = v5->_genericData;
    v5->_genericData = (DACarKeyGenericCrossPlatformSharingData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("additionalData"));
    v8 = objc_claimAutoreleasedReturnValue();
    additionalData = v5->_additionalData;
    v5->_additionalData = (DACarKeyAdditionalCrossPlatformSharingData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateData"));
    v10 = objc_claimAutoreleasedReturnValue();
    privateData = v5->_privateData;
    v5->_privateData = (DACarKeyPrivateCrossPlatformSharingData *)v10;

  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = decodeWithData_error__pred_329;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&decodeWithData_error__pred_329, &__block_literal_global_331);
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", decodeWithData_error__allowedClasses_330, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __47__DACarKeySharingMessage_decodeWithData_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)decodeWithData_error__allowedClasses_330;
  decodeWithData_error__allowedClasses_330 = v0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Generic Sharing Data       : %@\n"), self->_genericData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Additional Sharing Data    : %@\n"), self->_additionalData);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Private Sharing Data       : %@\n"), self->_privateData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  return v3;
}

- (DACarKeyGenericCrossPlatformSharingData)genericData
{
  return self->_genericData;
}

- (DACarKeyAdditionalCrossPlatformSharingData)additionalData
{
  return self->_additionalData;
}

- (DACarKeyPrivateCrossPlatformSharingData)privateData
{
  return self->_privateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateData, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_genericData, 0);
}

@end
