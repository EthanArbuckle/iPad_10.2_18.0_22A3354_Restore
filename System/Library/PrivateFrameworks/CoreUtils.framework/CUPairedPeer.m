@implementation CUPairedPeer

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDateModified:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setAltIRK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setAcl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierStr, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_altIRK, 0);
  objc_storeStrong((id *)&self->_acl, 0);
}

- (CUPairedPeer)initWithCoder:(id)a3
{
  id v4;
  CUPairedPeer *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  CUPairedPeer *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CUPairedPeer;
  v5 = -[CUPairedPeer init](&v24, sel_init);
  if (v5)
  {
    v6 = v4;
    v7 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v6, CFSTR("acl"), v7, (void **)&v5->_acl);

    v8 = v6;
    v9 = objc_opt_class();
    NSDecodeObjectIfPresent(v8, CFSTR("altIRK"), v9, (void **)&v5->_altIRK);

    v10 = v8;
    v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, CFSTR("ident"), v11, (void **)&v5->_identifier);

    v12 = v10;
    v13 = objc_opt_class();
    NSDecodeObjectIfPresent(v12, CFSTR("idStr"), v13, (void **)&v5->_identifierStr);

    v14 = v12;
    v15 = objc_opt_class();
    NSDecodeStandardContainerIfPresent(v14, CFSTR("info"), v15, (void **)&v5->_info);

    v16 = v14;
    v17 = objc_opt_class();
    NSDecodeObjectIfPresent(v16, CFSTR("model"), v17, (void **)&v5->_model);

    v18 = v16;
    v19 = objc_opt_class();
    NSDecodeObjectIfPresent(v18, CFSTR("name"), v19, (void **)&v5->_name);

    v20 = v18;
    v21 = objc_opt_class();
    NSDecodeObjectIfPresent(v20, CFSTR("pk"), v21, (void **)&v5->_publicKey);

    objc_storeStrong((id *)&v5->_label, v5->_name);
    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *acl;
  NSData *altIRK;
  NSUUID *identifier;
  NSString *identifierStr;
  NSDictionary *info;
  NSString *model;
  NSString *name;
  NSData *publicKey;
  id v13;

  v4 = a3;
  acl = self->_acl;
  v13 = v4;
  if (acl)
  {
    objc_msgSend(v4, "encodeObject:forKey:", acl, CFSTR("acl"));
    v4 = v13;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    objc_msgSend(v13, "encodeObject:forKey:", altIRK, CFSTR("altIRK"));
    v4 = v13;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v13, "encodeObject:forKey:", identifier, CFSTR("ident"));
    v4 = v13;
  }
  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    objc_msgSend(v13, "encodeObject:forKey:", identifierStr, CFSTR("idStr"));
    v4 = v13;
  }
  info = self->_info;
  if (info)
  {
    objc_msgSend(v13, "encodeObject:forKey:", info, CFSTR("info"));
    v4 = v13;
  }
  if (self->_label && !self->_name)
  {
    objc_msgSend(v13, "encodeObject:forKey:");
    v4 = v13;
  }
  model = self->_model;
  if (model)
  {
    objc_msgSend(v13, "encodeObject:forKey:", model, CFSTR("model"));
    v4 = v13;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v13, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v13;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    objc_msgSend(v13, "encodeObject:forKey:", publicKey, CFSTR("pk"));
    v4 = v13;
  }

}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSString *identifierStr;
  CFMutableStringRef *v18;
  NSUUID *identifier;
  __CFString *v20;
  NSString *name;
  __CFString *v22;
  NSString *model;
  __CFString *v24;
  NSData *publicKey;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __CFString *v40;
  NSData *altIRK;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  uint64_t v52;
  CFMutableStringRef v53;
  CFMutableStringRef v54;
  CFMutableStringRef v55;
  CFMutableStringRef v56;
  CFMutableStringRef v57;
  CFMutableStringRef v58;
  CFMutableStringRef v59;
  CFMutableStringRef v60;
  CFMutableStringRef v61;

  v61 = 0;
  NSAppendPrintF(&v61, (uint64_t)"CUPairedPeer", v2, v3, v4, v5, v6, v7, v52);
  v9 = v61;
  v16 = v9;
  identifierStr = self->_identifierStr;
  if (identifierStr)
  {
    v60 = v9;
    v18 = &v60;
    NSAppendPrintF(&v60, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifierStr);
  }
  else
  {
    identifier = self->_identifier;
    if (!identifier)
      goto LABEL_6;
    v59 = v9;
    v18 = &v59;
    NSAppendPrintF(&v59, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
  }
  v20 = *v18;

  v16 = v20;
LABEL_6:
  name = self->_name;
  if (name)
  {
    v58 = v16;
    NSAppendPrintF(&v58, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v22 = v58;

    v16 = v22;
  }
  model = self->_model;
  if (model)
  {
    v57 = v16;
    NSAppendPrintF(&v57, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)model);
    v24 = v57;

    v16 = v24;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v56 = v16;
    NSAppendPrintF(&v56, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    v26 = v56;

    v16 = v26;
  }
  if (-[NSDictionary count](self->_acl, "count"))
  {
    v55 = v16;
    v33 = -[NSDictionary count](self->_acl, "count");
    NSAppendPrintF(&v55, (uint64_t)", ACLs %ld", v34, v35, v36, v37, v38, v39, v33);
    v40 = v55;

    v16 = v40;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    v54 = v16;
    NSAppendPrintF(&v54, (uint64_t)", IRK %{mask}", v27, v28, v29, v30, v31, v32, (uint64_t)altIRK);
    v42 = v54;

    v16 = v42;
  }
  if (-[NSDictionary count](self->_info, "count"))
  {
    v53 = v16;
    v43 = -[NSDictionary count](self->_info, "count");
    NSAppendPrintF(&v53, (uint64_t)", Info %ld", v44, v45, v46, v47, v48, v49, v43);
    v50 = v53;

    v16 = v50;
  }
  return v16;
}

- (id)detailedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSUUID *identifier;
  __CFString *v18;
  NSString *name;
  __CFString *v20;
  NSString *model;
  __CFString *v22;
  NSData *publicKey;
  __CFString *v24;
  NSData *altIRK;
  __CFString *v26;
  __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  uint64_t v43;
  uint64_t v44;
  NSDictionary *info;
  CFMutableStringRef v46;
  CFMutableStringRef v47;
  CFMutableStringRef v48;
  CFMutableStringRef v49;
  CFMutableStringRef v50;
  CFMutableStringRef v51;
  CFMutableStringRef v52;
  CFMutableStringRef v53;
  CFMutableStringRef v54;

  v54 = 0;
  NSAppendPrintF(&v54, (uint64_t)"CUPairedPeer", v2, v3, v4, v5, v6, v7, v43);
  v9 = v54;
  v16 = v9;
  identifier = self->_identifier;
  if (identifier)
  {
    v53 = v9;
    NSAppendPrintF(&v53, (uint64_t)", ID %@", v10, v11, v12, v13, v14, v15, (uint64_t)identifier);
    v18 = v53;

    v16 = v18;
  }
  name = self->_name;
  if (name)
  {
    v52 = v16;
    NSAppendPrintF(&v52, (uint64_t)", Name '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)name);
    v20 = v52;

    v16 = v20;
  }
  model = self->_model;
  if (model)
  {
    v51 = v16;
    NSAppendPrintF(&v51, (uint64_t)", Model '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)model);
    v22 = v51;

    v16 = v22;
  }
  publicKey = self->_publicKey;
  if (publicKey)
  {
    v50 = v16;
    NSAppendPrintF(&v50, (uint64_t)", PK <%.4@>", v10, v11, v12, v13, v14, v15, (uint64_t)publicKey);
    v24 = v50;

    v16 = v24;
  }
  altIRK = self->_altIRK;
  if (altIRK)
  {
    v49 = v16;
    NSAppendPrintF(&v49, (uint64_t)", IRK %{mask}", v10, v11, v12, v13, v14, v15, (uint64_t)altIRK);
    v26 = v49;

    v16 = v26;
  }
  v48 = v16;
  NSAppendPrintF(&v48, (uint64_t)"\n", v10, v11, v12, v13, v14, v15, v44);
  v27 = v48;

  if (-[NSDictionary count](self->_acl, "count"))
  {
    v47 = v27;
    NSAppendPrintF(&v47, (uint64_t)"    ACL: %##@\n", v28, v29, v30, v31, v32, v33, (uint64_t)self->_acl);
    v34 = v47;

    v27 = v34;
  }
  if (-[NSDictionary count](self->_info, "count"))
  {
    info = self->_info;
    v46 = v27;
    NSAppendPrintF(&v46, (uint64_t)"    Info: %##@\n", v35, v36, v37, v38, v39, v40, (uint64_t)info);
    v41 = v46;

    v27 = v41;
  }
  return v27;
}

- (NSDictionary)groupInfo
{
  NSDictionary *info;
  CFTypeID TypeID;

  info = self->_info;
  TypeID = CFDictionaryGetTypeID();
  return (NSDictionary *)CFDictionaryGetTypedValue((const __CFDictionary *)info, CFSTR("groupInfo"), TypeID, 0);
}

- (NSDictionary)acl
{
  return self->_acl;
}

- (NSData)altIRK
{
  return self->_altIRK;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSString)identifierStr
{
  return self->_identifierStr;
}

- (void)setIdentifierStr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
