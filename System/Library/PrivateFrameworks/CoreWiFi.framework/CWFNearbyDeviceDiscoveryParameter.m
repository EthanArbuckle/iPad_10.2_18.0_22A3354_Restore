@implementation CWFNearbyDeviceDiscoveryParameter

- (CWFNearbyDeviceDiscoveryParameter)init
{
  CWFNearbyDeviceDiscoveryParameter *v2;
  CWFNearbyDeviceDiscoveryParameter *v3;
  NSArray *macIds;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CWFNearbyDeviceDiscoveryParameter;
  v2 = -[CWFNearbyDeviceDiscoveryParameter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    macIds = v2->_macIds;
    v2->_macIds = 0;

    v3->_operation = 0;
    *(_OWORD *)&v3->_channel = 0u;
    *(_OWORD *)&v3->_bandwidth = 0u;
  }
  return v3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("macIds="), v8, v9);
  if (objc_msgSend_count(self->_macIds, v10, v11, v12, v13))
  {
    v17 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_macIds, v14, v17, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CWFCorrectEthernetAddressString(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v20, (uint64_t)CFSTR("%@;"), v21, v22, v19);

      ++v17;
    }
    while (v17 < objc_msgSend_count(self->_macIds, v23, v24, v25, v26));
  }
  objc_msgSend_appendFormat_(v6, v14, (uint64_t)CFSTR("channel=%ld, "), v15, v16, self->_channel);
  objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR("band=%ld, "), v28, v29, self->_band);
  objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR("bandwidth=%ld, "), v31, v32, self->_bandwidth);
  objc_msgSend_appendFormat_(v6, v33, (uint64_t)CFSTR("type=%ld, "), v34, v35, self->_type);
  objc_msgSend_appendFormat_(v6, v36, (uint64_t)CFSTR("operation=%ld, "), v37, v38, self->_operation);
  return v6;
}

- (BOOL)isEqualToNDDParameters:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSArray *macIds;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  int64_t channel;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t band;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t bandwidth;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t type;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t operation;

  v6 = a3;
  macIds = self->_macIds;
  objc_msgSend_macIds(v6, v8, v9, v10, v11);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (macIds != v16)
  {
    if (!self->_macIds
      || (objc_msgSend_macIds(v6, v12, v13, v14, v15), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
      goto LABEL_15;
    }
    v3 = (void *)v17;
    v22 = self->_macIds;
    objc_msgSend_macIds(v6, v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      v26 = 0;
LABEL_14:

      v27 = v26;
      goto LABEL_15;
    }
  }
  channel = self->_channel;
  if (channel == objc_msgSend_channel(v6, v12, v13, v14, v15)
    && (band = self->_band, band == objc_msgSend_band(v6, v29, v30, v31, v32))
    && (bandwidth = self->_bandwidth, bandwidth == objc_msgSend_bandwidth(v6, v34, v35, v36, v37))
    && (type = self->_type, type == objc_msgSend_type(v6, v39, v40, v41, v42)))
  {
    operation = self->_operation;
    v26 = operation == objc_msgSend_operation(v6, v44, v45, v46, v47);
    v27 = v26;
  }
  else
  {
    v26 = 0;
    v27 = 0;
  }
  if (macIds != v16)
    goto LABEL_14;
LABEL_15:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CWFNearbyDeviceDiscoveryParameter *v4;
  CWFNearbyDeviceDiscoveryParameter *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToNDDParameters;

  v4 = (CWFNearbyDeviceDiscoveryParameter *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToNDDParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToNDDParameters = objc_msgSend_isEqualToNDDParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToNDDParameters = 0;
  }

  return isEqualToNDDParameters;
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
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v6 = objc_msgSend_hash(self->_macIds, a2, v2, v3, v4);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, self->_channel, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_hash(v10, v11, v12, v13, v14) ^ v6;
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v16, self->_band, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_hash(v19, v20, v21, v22, v23);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v25, self->_bandwidth, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v15 ^ v24 ^ objc_msgSend_hash(v28, v29, v30, v31, v32);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v34, self->_type, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_hash(v37, v38, v39, v40, v41);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v43, self->_operation, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v33 ^ v42 ^ objc_msgSend_hash(v46, v47, v48, v49, v50);

  return v51;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFNearbyDeviceDiscoveryParameter, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setMacIds_(v11, v12, (uint64_t)self->_macIds, v13, v14);
  objc_msgSend_setChannel_(v11, v15, self->_channel, v16, v17);
  objc_msgSend_setBand_(v11, v18, self->_band, v19, v20);
  objc_msgSend_setBandwidth_(v11, v21, self->_bandwidth, v22, v23);
  objc_msgSend_setType_(v11, v24, self->_type, v25, v26);
  objc_msgSend_setOperation_(v11, v27, self->_operation, v28, v29);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *macIds;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  macIds = self->_macIds;
  v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)macIds, (uint64_t)CFSTR("_macIds"), v6);
  objc_msgSend_encodeInteger_forKey_(v17, v7, self->_channel, (uint64_t)CFSTR("_channel"), v8);
  objc_msgSend_encodeInteger_forKey_(v17, v9, self->_band, (uint64_t)CFSTR("_band"), v10);
  objc_msgSend_encodeInteger_forKey_(v17, v11, self->_bandwidth, (uint64_t)CFSTR("_bandwidth"), v12);
  objc_msgSend_encodeInteger_forKey_(v17, v13, self->_type, (uint64_t)CFSTR("_type"), v14);
  objc_msgSend_encodeInteger_forKey_(v17, v15, self->_operation, (uint64_t)CFSTR("_operation"), v16);

}

- (CWFNearbyDeviceDiscoveryParameter)initWithCoder:(id)a3
{
  id v4;
  CWFNearbyDeviceDiscoveryParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *macIds;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CWFNearbyDeviceDiscoveryParameter;
  v5 = -[CWFNearbyDeviceDiscoveryParameter init](&v33, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, (uint64_t)CFSTR("_macIds"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    macIds = v5->_macIds;
    v5->_macIds = (NSArray *)v15;

    v5->_channel = objc_msgSend_decodeIntegerForKey_(v4, v17, (uint64_t)CFSTR("_channel"), v18, v19);
    v5->_band = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("_band"), v21, v22);
    v5->_bandwidth = objc_msgSend_decodeIntegerForKey_(v4, v23, (uint64_t)CFSTR("_bandwidth"), v24, v25);
    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v26, (uint64_t)CFSTR("_type"), v27, v28);
    v5->_operation = objc_msgSend_decodeIntegerForKey_(v4, v29, (uint64_t)CFSTR("_operation"), v30, v31);
  }

  return v5;
}

- (NSArray)macIds
{
  return self->_macIds;
}

- (void)setMacIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (int64_t)band
{
  return self->_band;
}

- (void)setBand:(int64_t)a3
{
  self->_band = a3;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (void)setBandwidth:(int64_t)a3
{
  self->_bandwidth = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macIds, 0);
}

@end
