@implementation CWFXPCEvent

- (CWFXPCEvent)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CWFXPCEvent *v6;
  uint64_t v7;
  NSUUID *UUID;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CWFXPCEvent;
  v6 = -[CWFXPCEvent init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDictionary)info
{
  return self->_info;
}

- (unint64_t)acknowledgementTimeout
{
  return self->_acknowledgementTimeout;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)UUID, (uint64_t)CFSTR("_UUID"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_timestamp, (uint64_t)CFSTR("_timestamp"), v9);
  objc_msgSend_encodeInteger_forKey_(v5, v10, self->_type, (uint64_t)CFSTR("_type"), v11);
  objc_msgSend_encodeInteger_forKey_(v5, v12, self->_internalType, (uint64_t)CFSTR("_internalType"), v13);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)self->_interfaceName, (uint64_t)CFSTR("_interfaceName"), v15);
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)self->_info, (uint64_t)CFSTR("_info"), v17);
  objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x1E0CB37E8], v18, self->_acknowledgementTimeout, v19, v20);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v21, (uint64_t)v23, (uint64_t)CFSTR("_acknowledgementTimeout"), v22);

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (CWFXPCEvent)initWithCoder:(id)a3
{
  id v4;
  CWFXPCEvent *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSUUID *UUID;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *timestamp;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *interfaceName;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *info;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v47;
  _QWORD v48[16];

  v48[15] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)CWFXPCEvent;
  v5 = -[CWFXPCEvent init](&v47, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_UUID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_timestamp"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_interfaceName"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v19;

    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)CFSTR("_type"), v22, v23);
    v5->_internalType = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("_internalType"), v25, v26);
    v48[0] = objc_opt_class();
    v48[1] = objc_opt_class();
    v48[2] = objc_opt_class();
    v48[3] = objc_opt_class();
    v48[4] = objc_opt_class();
    v48[5] = objc_opt_class();
    v48[6] = objc_opt_class();
    v48[7] = objc_opt_class();
    v48[8] = objc_opt_class();
    v48[9] = objc_opt_class();
    v48[10] = objc_opt_class();
    v48[11] = objc_opt_class();
    v48[12] = objc_opt_class();
    v48[13] = objc_opt_class();
    v48[14] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v48, 15, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v30, (uint64_t)v29, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v33, (uint64_t)CFSTR("_info"), v35);
    v36 = objc_claimAutoreleasedReturnValue();
    info = v5->_info;
    v5->_info = (NSDictionary *)v36;

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("_acknowledgementTimeout"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_acknowledgementTimeout = objc_msgSend_unsignedLongLongValue(v41, v42, v43, v44, v45);

  }
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)__descriptionForEventType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t internalType;

  internalType = self->_internalType;
  if (internalType)
    sub_1B0641438(internalType, a2, v2, v3, v4);
  else
    sub_1B062BEE0(self->_type, a2, v2, v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  NSString *interfaceName;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend___descriptionForEventType(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  interfaceName = self->_interfaceName;
  objc_msgSend_UUIDString(self->_UUID, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v13, v14, 5, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0630E50(self->_timestamp);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v19, (uint64_t)CFSTR("type=%@, intf=%@, uuid=%@, timestamp=%@ ackTimeout=%lluns info=%@"), v20, v21, v7, interfaceName, v17, v18, self->_acknowledgementTimeout, self->_info);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqualToXPCEvent:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSUUID *UUID;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *interfaceName;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char isEqual;
  BOOL v42;
  int64_t type;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t internalType;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSDate *timestamp;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;

  v6 = a3;
  v11 = v6;
  if (self->_UUID)
  {
    objc_msgSend_UUID(v6, v7, v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v42 = 0;
LABEL_23:

      goto LABEL_24;
    }
    UUID = self->_UUID;
    objc_msgSend_UUID(v11, v12, v13, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(UUID, v19, (uint64_t)v18, v20, v21))
    {
      v42 = 0;
LABEL_22:

      goto LABEL_23;
    }
    interfaceName = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v22, v23, v24, v25);
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (interfaceName == v31)
      goto LABEL_13;
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v11, v27, v28, v29, v30), (v32 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v42 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v3 = (void *)v32;
    v37 = self->_interfaceName;
    objc_msgSend_interfaceName(v11, v33, v34, v35, v36);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v37, v38, (uint64_t)v4, v39, v40))
    {
LABEL_13:
      type = self->_type;
      if (type == objc_msgSend_type(v11, v27, v28, v29, v30)
        && (internalType = self->_internalType, internalType == objc_msgSend_internalType(v11, v44, v45, v46, v47))
        && self->_timestamp
        && (objc_msgSend_timestamp(v11, v49, v50, v51, v52), (v53 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v58 = (void *)v53;
        timestamp = self->_timestamp;
        objc_msgSend_timestamp(v11, v54, v55, v56, v57);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(timestamp, v61, (uint64_t)v60, v62, v63);

        v42 = isEqual;
      }
      else
      {
        isEqual = 0;
        v42 = 0;
      }
      if (interfaceName == v31)
        goto LABEL_21;
    }
    else
    {
      isEqual = 0;
    }

    v42 = isEqual;
    goto LABEL_21;
  }
  v42 = 0;
LABEL_24:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  CWFXPCEvent *v4;
  CWFXPCEvent *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToXPCEvent;

  v4 = (CWFXPCEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToXPCEvent = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToXPCEvent = objc_msgSend_isEqualToXPCEvent_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToXPCEvent = 0;
  }

  return isEqualToXPCEvent;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = self->_type ^ self->_internalType ^ objc_msgSend_hash(self->_UUID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_interfaceName, v7, v8, v9, v10);
  return v6 ^ v11 ^ objc_msgSend_hash(self->_timestamp, v12, v13, v14, v15);
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFXPCEvent, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setUUID_(v11, v12, (uint64_t)self->_UUID, v13, v14);
  objc_msgSend_setType_(v11, v15, self->_type, v16, v17);
  objc_msgSend_setInternalType_(v11, v18, self->_internalType, v19, v20);
  objc_msgSend_setInterfaceName_(v11, v21, (uint64_t)self->_interfaceName, v22, v23);
  objc_msgSend_setTimestamp_(v11, v24, (uint64_t)self->_timestamp, v25, v26);
  objc_msgSend_setInfo_(v11, v27, (uint64_t)self->_info, v28, v29);
  objc_msgSend_setAcknowledgementTimeout_(v11, v30, self->_acknowledgementTimeout, v31, v32);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)internalType
{
  return self->_internalType;
}

- (void)setInternalType:(int64_t)a3
{
  self->_internalType = a3;
}

- (void)setAcknowledgementTimeout:(unint64_t)a3
{
  self->_acknowledgementTimeout = a3;
}

@end
