@implementation CKKSExternalTLKShare

- (CKKSExternalTLKShare)initWithView:(id)a3 tlkUUID:(id)a4 receiverPeerID:(id)a5 senderPeerID:(id)a6 wrappedTLK:(id)a7 signature:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKKSExternalTLKShare *v18;
  CKKSExternalTLKShare *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CKKSExternalTLKShare;
  v18 = -[CKKSExternalTLKShare init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_view, a3);
    objc_storeStrong((id *)&v19->_tlkUUID, a4);
    objc_storeStrong((id *)&v19->_receiverPeerID, a5);
    objc_storeStrong((id *)&v19->_senderPeerID, a6);
    objc_storeStrong((id *)&v19->_wrappedTLK, a7);
    objc_storeStrong((id *)&v19->_signature, a8);
  }

  return v19;
}

- (id)stringifyPeerID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "base64EncodedStringWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("spid-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CKKSExternalTLKShare(%@): recv:%@ send:%@@>"), v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CKKSExternalTLKShare)initWithCoder:(id)a3
{
  id v4;
  CKKSExternalTLKShare *v5;
  uint64_t v6;
  NSString *view;
  uint64_t v8;
  NSString *tlkUUID;
  uint64_t v10;
  NSData *receiverPeerID;
  uint64_t v12;
  NSData *senderPeerID;
  uint64_t v14;
  NSData *wrappedTLK;
  uint64_t v16;
  NSData *signature;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKKSExternalTLKShare;
  v5 = -[CKKSExternalTLKShare init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("view"));
    v6 = objc_claimAutoreleasedReturnValue();
    view = v5->_view;
    v5->_view = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tlkUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    tlkUUID = v5->_tlkUUID;
    v5->_tlkUUID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("receiverPeerID"));
    v10 = objc_claimAutoreleasedReturnValue();
    receiverPeerID = v5->_receiverPeerID;
    v5->_receiverPeerID = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderPeerID"));
    v12 = objc_claimAutoreleasedReturnValue();
    senderPeerID = v5->_senderPeerID;
    v5->_senderPeerID = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedTLK"));
    v14 = objc_claimAutoreleasedReturnValue();
    wrappedTLK = v5->_wrappedTLK;
    v5->_wrappedTLK = (NSData *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v16 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[CKKSExternalTLKShare view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("view"));

  -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("tlkUUID"));

  -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("receiverPeerID"));

  -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("senderPeerID"));

  -[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("wrappedTLK"));

  -[CKKSExternalTLKShare signature](self, "signature");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("signature"));

}

- (id)jsonDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("view");
  -[CKKSExternalTLKShare view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("tlkUUID");
  -[CKKSExternalTLKShare tlkUUID](self, "tlkUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("receiverPeerID");
  -[CKKSExternalTLKShare receiverPeerID](self, "receiverPeerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("senderPeerID");
  -[CKKSExternalTLKShare senderPeerID](self, "senderPeerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKKSExternalTLKShare stringifyPeerID:](self, "stringifyPeerID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  v15[4] = CFSTR("wrappedTLK");
  -[CKKSExternalTLKShare wrappedTLK](self, "wrappedTLK");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v9;
  v15[5] = CFSTR("signature");
  -[CKKSExternalTLKShare signature](self, "signature");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)view
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)tlkUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)receiverPeerID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)senderPeerID
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)wrappedTLK
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)signature
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_wrappedTLK, 0);
  objc_storeStrong((id *)&self->_senderPeerID, 0);
  objc_storeStrong((id *)&self->_receiverPeerID, 0);
  objc_storeStrong((id *)&self->_tlkUUID, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

+ (id)unstringifyPeerID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("spid-")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("spid-"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;
  if (v4)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v4, 0);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)parseFromJSONDict:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CKKSExternalTLKShare *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id *v26;
  _QWORD *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tlkUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("receiverPeerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unstringifyPeerID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("senderPeerID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unstringifyPeerID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wrappedTLK"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithBase64EncodedString:options:", v14, 0);

  v16 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("signature"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithBase64EncodedString:options:", v17, 0);
  if (!v7 || !v8 || !v10 || !v12 || !v15 || !v18)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v7)
    {
      if (v8)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(v20, "addObject:", CFSTR("view"));
      if (v8)
      {
LABEL_10:
        if (v10)
          goto LABEL_11;
        goto LABEL_20;
      }
    }
    objc_msgSend(v21, "addObject:", CFSTR("tlkUUID"));
    if (v10)
    {
LABEL_11:
      if (v12)
        goto LABEL_12;
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(v21, "addObject:", CFSTR("receiverPeerID"));
    if (v12)
    {
LABEL_12:
      if (v15)
        goto LABEL_13;
      goto LABEL_22;
    }
LABEL_21:
    objc_msgSend(v21, "addObject:", CFSTR("senderPeerID"));
    if (v15)
    {
LABEL_13:
      if (v18)
        goto LABEL_14;
      goto LABEL_23;
    }
LABEL_22:
    objc_msgSend(v21, "addObject:", CFSTR("wrapppedTLK"));
    if (v18)
    {
LABEL_14:
      if (!a4)
      {
LABEL_16:

        v19 = 0;
        goto LABEL_17;
      }
LABEL_15:
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v26 = a4;
      v23 = *MEMORY[0x1E0CB2F90];
      v28[0] = *MEMORY[0x1E0CB2D50];
      v28[1] = CFSTR("missingkeys");
      v29[0] = CFSTR("Missing some required field");
      v29[1] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2, v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -50, v24);
      *v27 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
LABEL_23:
    objc_msgSend(v21, "addObject:", CFSTR("signature"));
    if (!a4)
      goto LABEL_16;
    goto LABEL_15;
  }
  v19 = -[CKKSExternalTLKShare initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:]([CKKSExternalTLKShare alloc], "initWithView:tlkUUID:receiverPeerID:senderPeerID:wrappedTLK:signature:", v7, v8, v10, v12, v15, v18);
LABEL_17:

  return v19;
}

@end
