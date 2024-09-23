@implementation CRChallengeObject

- (CRChallengeObject)initWithComponentType:(id)a3 challenge:(id)a4 keyIndex:(id)a5 properties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CRChallengeObject *v15;
  CRChallengeObject *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRChallengeObject;
  v15 = -[CRChallengeObject init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->componentType, a3);
    objc_storeStrong((id *)&v16->nonce, a4);
    objc_storeStrong((id *)&v16->keyIndex, a5);
    objc_storeStrong((id *)&v16->properties, a6);
  }

  return v16;
}

- (CRChallengeObject)init
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
  id v9;

  componentType = self->componentType;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)componentType, (uint64_t)CFSTR("componentType"));
  objc_msgSend_encodeObject_forKey_(v9, v6, (uint64_t)self->nonce, (uint64_t)CFSTR("nonce"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->keyIndex, (uint64_t)CFSTR("keyIndex"));
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->properties, (uint64_t)CFSTR("properties"));

}

- (CRChallengeObject)initWithCoder:(id)a3
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
  CRChallengeObject *v23;
  const char *v24;
  CRChallengeObject *v25;

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
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v17, (uint64_t)v14, (uint64_t)CFSTR("nonce"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v19, (uint64_t)v14, (uint64_t)CFSTR("keyIndex"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v21, (uint64_t)v14, (uint64_t)CFSTR("properties"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = [CRChallengeObject alloc];
  v25 = (CRChallengeObject *)objc_msgSend_initWithComponentType_challenge_keyIndex_properties_(v23, v24, (uint64_t)v16, (uint64_t)v18, v20, v22);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)componentType
{
  return self->componentType;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->componentType, a3);
}

- (NSData)nonce
{
  return self->nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->nonce, a3);
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
  objc_storeStrong((id *)&self->nonce, 0);
  objc_storeStrong((id *)&self->componentType, 0);
}

@end
