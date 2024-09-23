@implementation IDSQueryKeyTransparencyContext

- (IDSQueryKeyTransparencyContext)initWithVerifierResult:(id)a3 ticket:(id)a4 accountKey:(id)a5 queryResponseTime:(id)a6 ktOptIn:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IDSQueryKeyTransparencyContext *v17;
  IDSQueryKeyTransparencyContext *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSQueryKeyTransparencyContext;
  v17 = -[IDSQueryKeyTransparencyContext init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_verifierResult, a3);
    objc_storeStrong((id *)&v18->_ticket, a4);
    objc_storeStrong((id *)&v18->_accountKey, a5);
    objc_storeStrong((id *)&v18->_queryResponseTime, a6);
    v18->_ktOptIn = a7;
  }

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_verifierResult(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ticket(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountKey(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queryResponseTime(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend_ktOptIn(self, v22, v23, v24);
  objc_msgSend_numberWithUnsignedInteger_(v21, v26, v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v29, (uint64_t)CFSTR("<%@: %p verifierResult: %@, ticket: %@, accountKey: %@, queryResponseTime: %@>, ktOptInStatus: %@"), v30, v4, self, v8, v12, v16, v20, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char isEqualToQueryKeyTransparencyContext;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isEqualToQueryKeyTransparencyContext = objc_msgSend_isEqualToQueryKeyTransparencyContext_(self, v5, (uint64_t)v4, v6);
  else
    isEqualToQueryKeyTransparencyContext = 0;

  return isEqualToQueryKeyTransparencyContext;
}

- (BOOL)isEqualToQueryKeyTransparencyContext:(id)a3
{
  void *v3;
  void *v4;
  IDSQueryKeyTransparencyContext *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  IDSQueryKeyTransparencyContext *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  double v23;
  BOOL v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  const char *v32;
  uint64_t v33;
  double v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  double v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  void *v55;
  const char *v56;
  double v57;
  const char *v58;
  uint64_t v59;
  char isEqualToDate;
  double v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  double v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  char isEqualToData;

  v6 = (IDSQueryKeyTransparencyContext *)a3;
  v10 = v6;
  if (self == v6)
  {
    v24 = 1;
  }
  else
  {
    if (v6)
    {
      objc_msgSend_ticket(self, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ticket(v10, v12, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v17)
      {
        objc_msgSend_ticket(self, v15, v16, v18);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ticket(v10, v19, v20, v21);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v3, v22, (uint64_t)v4, v23))
        {
          v24 = 0;
          goto LABEL_24;
        }
      }
      objc_msgSend_verifierResult(self, v15, v16, v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_verifierResult(v10, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31))
      {

        v24 = 0;
        goto LABEL_23;
      }
      objc_msgSend_accountKey(self, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_accountKey(v10, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v35, v40, (uint64_t)v39, v41);
      if ((isEqualToData & 1) == 0)
      {
        v81 = v3;
        objc_msgSend_accountKey(self, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_accountKey(v10, v46, v47, v48);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v45;
        if (!objc_msgSend_isEqual_(v45, v49, (uint64_t)v77, v50))
        {
          v24 = 0;
          v3 = v81;
          goto LABEL_21;
        }
        v3 = v81;
      }
      v80 = v39;
      v82 = v35;
      objc_msgSend_queryResponseTime(self, v42, v43, v44);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_queryResponseTime(v10, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v51;
      isEqualToDate = objc_msgSend_isEqualToDate_(v51, v56, (uint64_t)v55, v57);
      if ((isEqualToDate & 1) != 0)
        goto LABEL_14;
      objc_msgSend_queryResponseTime(self, v58, v59, v61);
      v74 = v4;
      v62 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_queryResponseTime(v10, v63, v64, v65);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)v62;
      v66 = (void *)v62;
      v4 = v74;
      if (objc_msgSend_isEqual_(v66, v67, (uint64_t)v75, v68))
      {
LABEL_14:
        v69 = objc_msgSend_ktOptIn(self, v58, v59, v61);
        v24 = v69 == objc_msgSend_ktOptIn(v10, v70, v71, v72);
        if ((isEqualToDate & 1) != 0)
        {
LABEL_20:

          v39 = v80;
          v35 = v82;
          if ((isEqualToData & 1) != 0)
          {
LABEL_22:

LABEL_23:
            if (v11 == v17)
            {
LABEL_25:

              goto LABEL_26;
            }
LABEL_24:

            goto LABEL_25;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v24 = 0;
      }

      goto LABEL_20;
    }
    v24 = 0;
  }
LABEL_26:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  unint64_t v37;

  objc_msgSend_ticket(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_hash(v5, v6, v7, v8);
  objc_msgSend_verifierResult(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  objc_msgSend_accountKey(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_hash(v21, v22, v23, v24);
  objc_msgSend_queryResponseTime(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  v37 = v33 ^ objc_msgSend_ktOptIn(self, v34, v35, v36);

  return v37;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSQueryKeyTransparencyContext)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  const char *v32;
  double v33;
  IDSQueryKeyTransparencyContext *ResponseTime_ktOptIn;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, CFSTR("Ticket"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v11 = (void *)qword_1EE40AF70;
  v40 = qword_1EE40AF70;
  if (!qword_1EE40AF70)
  {
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = sub_19BA7561C;
    v36[3] = &unk_1E3C209E0;
    v36[4] = &v37;
    sub_19BA7561C((uint64_t)v36, v8, v9, COERCE_DOUBLE(3221225472));
    v11 = (void *)v38[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v37, 8);
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, (uint64_t)v12, v14, CFSTR("VerifierResult"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, CFSTR("AccountKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, v22, CFSTR("QueryResponseTime"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, v26, CFSTR("OptInStatus"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_unsignedIntegerValue(v27, v28, v29, v30);

  ResponseTime_ktOptIn = (IDSQueryKeyTransparencyContext *)objc_msgSend_initWithVerifierResult_ticket_accountKey_queryResponseTime_ktOptIn_(self, v32, (uint64_t)v15, v33, v10, v19, v23, v31);
  return ResponseTime_ktOptIn;
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
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  id v38;

  v4 = a3;
  objc_msgSend_ticket(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("Ticket"));

  objc_msgSend_verifierResult(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, v16, CFSTR("VerifierResult"));

  objc_msgSend_accountKey(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, v22, CFSTR("AccountKey"));

  objc_msgSend_queryResponseTime(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v27, (uint64_t)v26, v28, CFSTR("QueryResponseTime"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  v33 = objc_msgSend_ktOptIn(self, v30, v31, v32);
  objc_msgSend_numberWithUnsignedInteger_(v29, v34, v33, v35);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v38, v37, CFSTR("OptInStatus"));

}

- (NSUUID)ticket
{
  return self->_ticket;
}

- (KTVerifierResult)verifierResult
{
  return self->_verifierResult;
}

- (NSData)accountKey
{
  return self->_accountKey;
}

- (NSDate)queryResponseTime
{
  return self->_queryResponseTime;
}

- (unint64_t)ktOptIn
{
  return self->_ktOptIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResponseTime, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);
  objc_storeStrong((id *)&self->_verifierResult, 0);
  objc_storeStrong((id *)&self->_ticket, 0);
}

@end
