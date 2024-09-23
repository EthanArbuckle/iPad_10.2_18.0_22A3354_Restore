@implementation CWFBackgroundScanNetwork

- (id)JSONCompatibleKeyValueMap
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_BSSID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("bssid"), v15);

  objc_msgSend_channel(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("channel"), v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  v33 = objc_msgSend_entry(self, v29, v30, v31, v32);
  objc_msgSend_numberWithBool_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, (uint64_t)CFSTR("entry"), v39);

  v40 = (void *)MEMORY[0x1E0CB37E8];
  v45 = objc_msgSend_exit(self, v41, v42, v43, v44);
  objc_msgSend_numberWithBool_(v40, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v50, (uint64_t)v49, (uint64_t)CFSTR("exit"), v51);

  sub_1B06475A8(v3, 0, 1u);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v52, (uint64_t)v55, v53, v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_BSSID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_channel(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_entry(self, v18, v19, v20, v21);
  v27 = objc_msgSend_exit(self, v23, v24, v25, v26);
  objc_msgSend_stringWithFormat_(v6, v28, (uint64_t)CFSTR("bssid=%@, ch=%@, entry=%d, exit=%d"), v29, v30, v12, v17, v22, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (BOOL)isEqualToBackgroundScanNetwork:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSString *BSSID;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  CWFChannel *channel;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CWFChannel *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CWFChannel *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int entry;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int exit;
  BOOL v50;
  void *v52;

  v7 = a3;
  BSSID = self->_BSSID;
  objc_msgSend_BSSID(v7, v9, v10, v11, v12);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (BSSID != v17)
  {
    if (!self->_BSSID || (objc_msgSend_BSSID(v7, v13, v14, v15, v16), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v28 = 0;
      goto LABEL_23;
    }
    v3 = (void *)v18;
    v23 = self->_BSSID;
    objc_msgSend_BSSID(v7, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
    {
      v28 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v52 = v24;
  }
  channel = self->_channel;
  objc_msgSend_channel(v7, v13, v14, v15, v16);
  v34 = (CWFChannel *)objc_claimAutoreleasedReturnValue();
  if (channel != v34)
  {
    if (!self->_channel)
      goto LABEL_20;
    objc_msgSend_channel(v7, v30, v31, v32, v33);
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
      goto LABEL_18;
    v4 = (void *)v35;
    v40 = self->_channel;
    objc_msgSend_channel(v7, v36, v37, v38, v39);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
    {
      v28 = 0;
      v24 = v52;
LABEL_14:

      goto LABEL_21;
    }
  }
  entry = self->_entry;
  if (entry == objc_msgSend_entry(v7, v30, v31, v32, v33))
  {
    exit = self->_exit;
    v28 = exit == objc_msgSend_exit(v7, v45, v46, v47, v48);
    v50 = channel == v34;
    v24 = v52;
    if (v50)
      goto LABEL_21;
    goto LABEL_14;
  }
  if (channel != v34)
  {

LABEL_18:
    v28 = 0;
    v24 = v52;
    if (BSSID == v17)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_20:
  v28 = 0;
  v24 = v52;
LABEL_21:

  if (BSSID != v17)
    goto LABEL_22;
LABEL_23:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  CWFBackgroundScanNetwork *v4;
  CWFBackgroundScanNetwork *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToBackgroundScanNetwork;

  v4 = (CWFBackgroundScanNetwork *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToBackgroundScanNetwork = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToBackgroundScanNetwork = objc_msgSend_isEqualToBackgroundScanNetwork_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToBackgroundScanNetwork = 0;
  }

  return isEqualToBackgroundScanNetwork;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = objc_msgSend_hash(self->_BSSID, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_channel, v7, v8, v9, v10) ^ v6 ^ self->_entry ^ (unint64_t)self->_exit;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFBackgroundScanNetwork, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setBSSID_(v11, v12, (uint64_t)self->_BSSID, v13, v14);
  objc_msgSend_setChannel_(v11, v15, (uint64_t)self->_channel, v16, v17);
  objc_msgSend_setEntry_(v11, v18, self->_entry, v19, v20);
  objc_msgSend_setExit_(v11, v21, self->_exit, v22, v23);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *BSSID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  BSSID = self->_BSSID;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)BSSID, (uint64_t)CFSTR("_BSSID"), v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_channel, (uint64_t)CFSTR("_channel"), v8);
  objc_msgSend_encodeBool_forKey_(v13, v9, self->_entry, (uint64_t)CFSTR("_entry"), v10);
  objc_msgSend_encodeBool_forKey_(v13, v11, self->_exit, (uint64_t)CFSTR("_exit"), v12);

}

- (CWFBackgroundScanNetwork)initWithCoder:(id)a3
{
  id v4;
  CWFBackgroundScanNetwork *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *BSSID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFChannel *channel;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CWFBackgroundScanNetwork;
  v5 = -[CWFBackgroundScanNetwork init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_BSSID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_channel"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v14;

    v5->_entry = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("_entry"), v17, v18);
    v5->_exit = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)CFSTR("_exit"), v20, v21);
  }

  return v5;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)entry
{
  return self->_entry;
}

- (void)setEntry:(BOOL)a3
{
  self->_entry = a3;
}

- (BOOL)exit
{
  return self->_exit;
}

- (void)setExit:(BOOL)a3
{
  self->_exit = a3;
}

- (CWFChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
}

@end
