@implementation CRChallengeResponse

- (CRChallengeResponse)initWithComponentType:(id)a3 identifier:(id)a4 signedResponse:(id)a5 keyIndex:(id)a6 properties:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CRChallengeResponse *v17;
  CRChallengeResponse *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CRChallengeResponse;
  v17 = -[CRChallengeResponse init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->componentType, a3);
    objc_storeStrong((id *)&v18->identifier, a4);
    objc_storeStrong((id *)&v18->signedResponse, a5);
    objc_storeStrong((id *)&v18->keyIndex, a6);
    objc_storeStrong((id *)&v18->properties, a7);
  }

  return v18;
}

- (CRChallengeResponse)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Please use initWithComponentType"));

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *componentType;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  id v10;

  componentType = self->componentType;
  v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v5, (uint64_t)componentType, (uint64_t)CFSTR("componentType"));
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->identifier, (uint64_t)CFSTR("identifier"));
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->signedResponse, (uint64_t)CFSTR("signedResponse"));
  objc_msgSend_encodeObject_forKey_(v10, v8, (uint64_t)self->keyIndex, (uint64_t)CFSTR("keyIndex"));
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)self->properties, (uint64_t)CFSTR("properties"));

}

- (CRChallengeResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  CRChallengeResponse *v25;
  const char *v26;
  CRChallengeResponse *v27;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v12, v6, v13, v7, v8, v9, v10, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v15, (uint64_t)v14, (uint64_t)CFSTR("componentType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, (uint64_t)CFSTR("identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, (uint64_t)CFSTR("signedResponse"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v21, (uint64_t)v14, (uint64_t)CFSTR("keyIndex"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v23, (uint64_t)v14, (uint64_t)CFSTR("properties"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [CRChallengeResponse alloc];
  v27 = (CRChallengeResponse *)objc_msgSend_initWithComponentType_identifier_signedResponse_keyIndex_properties_(v25, v26, (uint64_t)v16, (uint64_t)v18, v20, v22, v24);

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_componentType(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signedResponse(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyIndex(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(self, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v23, (uint64_t)CFSTR("[CRChallengeResponse: Type:%@: ID:%@: Response:%@: Index:%@: properties:%@:]"), v24, v6, v10, v14, v18, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSString)componentType
{
  return self->componentType;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->componentType, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->identifier, a3);
}

- (NSData)signedResponse
{
  return self->signedResponse;
}

- (void)setSignedResponse:(id)a3
{
  objc_storeStrong((id *)&self->signedResponse, a3);
}

- (NSNumber)keyIndex
{
  return self->keyIndex;
}

- (void)setKeyIndex:(id)a3
{
  objc_storeStrong((id *)&self->keyIndex, a3);
}

- (NSDictionary)properties
{
  return self->properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->properties, 0);
  objc_storeStrong((id *)&self->keyIndex, 0);
  objc_storeStrong((id *)&self->signedResponse, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end
