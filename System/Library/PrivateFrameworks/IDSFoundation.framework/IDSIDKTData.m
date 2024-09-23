@implementation IDSIDKTData

- (IDSIDKTData)initWithVerifierResult:(id)a3 requestID:(id)a4
{
  id v7;
  id v8;
  IDSIDKTData *v9;
  IDSIDKTData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSIDKTData;
  v9 = -[IDSIDKTData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_verifierResult, a3);
    objc_storeStrong((id *)&v10->_verificationRequestID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_verificationRequestID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("IDSIDKTDataVerificationRequestID"));

  objc_msgSend_verifierResult(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("IDSIDKTDataVerifierResult"));

}

- (IDSIDKTData)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  IDSIDKTData *v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  objc_msgSend_decodeObjectForKey_(v4, v5, (uint64_t)CFSTR("IDSIDKTDataVerificationRequestID"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v10 = (void *)qword_1EE40AF68;
  v23 = qword_1EE40AF68;
  if (!qword_1EE40AF68)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_19BA2B2D4;
    v19[3] = &unk_1E3C209E0;
    v19[4] = &v20;
    sub_19BA2B2D4((uint64_t)v19, v7, v8, COERCE_DOUBLE(3221225472));
    v10 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v20, 8);
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, (uint64_t)v11, v13, CFSTR("IDSIDKTDataVerifierResult"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (IDSIDKTData *)objc_msgSend_initWithVerifierResult_requestID_(self, v15, (uint64_t)v14, v16, v9);

  return v17;
}

- (id)debugDescription
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_verifierResult(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_verificationRequestID(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("Verifier Result: %@, Request ID: %@"), v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  KTVerifierResult *v3;
  IDSIDKTData *v5;
  IDSIDKTData *v6;
  KTVerifierResult *verifierResult;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  const char *v14;
  uint64_t v15;
  char isEqual;
  double v17;
  uint64_t v18;
  BOOL v19;
  NSUUID *verificationRequestID;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  NSUUID *v27;
  NSUUID *v28;

  v5 = (IDSIDKTData *)a3;
  if (self == v5)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      verifierResult = self->_verifierResult;
      objc_msgSend_verifierResult(v6, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(verifierResult, v12, (uint64_t)v11, v13);
      if ((isEqual & 1) != 0
        || (v3 = self->_verifierResult,
            objc_msgSend_verifierResult(v6, v14, v15, v17),
            v18 = objc_claimAutoreleasedReturnValue(),
            v3 == (KTVerifierResult *)v18))
      {
        verificationRequestID = self->_verificationRequestID;
        objc_msgSend_verificationRequestID(v6, v14, v15, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(verificationRequestID, v22, (uint64_t)v21, v23) & 1) != 0)
        {
          v19 = 1;
        }
        else
        {
          v27 = self->_verificationRequestID;
          objc_msgSend_verificationRequestID(v6, v24, v25, v26);
          v28 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          v19 = v27 == v28;

        }
        if ((isEqual & 1) != 0)
          goto LABEL_13;
      }
      else
      {
        v19 = 0;
        v3 = (KTVerifierResult *)v18;
      }

LABEL_13:
      goto LABEL_14;
    }
    v19 = 0;
  }
LABEL_14:

  return v19;
}

- (NSUUID)verificationRequestID
{
  return self->_verificationRequestID;
}

- (KTVerifierResult)verifierResult
{
  return self->_verifierResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifierResult, 0);
  objc_storeStrong((id *)&self->_verificationRequestID, 0);
}

@end
