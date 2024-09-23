@implementation CWFUserSettings

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int64_t syncMode;
  int64_t compatibilityMode;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v14 = *(_OWORD *)&self->_askToJoinMode;
  syncMode = self->_syncMode;
  compatibilityMode = self->_compatibilityMode;
  objc_msgSend_OSSpecificAttributes(self, a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v9, (uint64_t)CFSTR("askToJoinMode=%ld, autoHotspotMode=%ld, syncMode=%ld, compatibilityMode=%ld, OSSpecificAttributes=%@"), v10, v11, v14, syncMode, compatibilityMode, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqualToUserSettings:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSDictionary *OSSpecificAttributes;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSDictionary *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  int64_t askToJoinMode;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t autoHotspotMode;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t compatibilityMode;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t syncMode;

  v6 = a3;
  OSSpecificAttributes = self->_OSSpecificAttributes;
  objc_msgSend_OSSpecificAttributes(v6, v8, v9, v10, v11);
  v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (OSSpecificAttributes != v16)
  {
    if (!self->_OSSpecificAttributes
      || (objc_msgSend_OSSpecificAttributes(v6, v12, v13, v14, v15), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
      goto LABEL_14;
    }
    v3 = (void *)v17;
    v22 = self->_OSSpecificAttributes;
    objc_msgSend_OSSpecificAttributes(v6, v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      v26 = 0;
LABEL_13:

      v27 = v26;
      goto LABEL_14;
    }
  }
  askToJoinMode = self->_askToJoinMode;
  if (askToJoinMode == objc_msgSend_askToJoinMode(v6, v12, v13, v14, v15)
    && (autoHotspotMode = self->_autoHotspotMode, autoHotspotMode == objc_msgSend_autoHotspotMode(v6, v29, v30, v31, v32))&& (compatibilityMode = self->_compatibilityMode, compatibilityMode == objc_msgSend_compatibilityMode(v6, v34, v35, v36, v37)))
  {
    syncMode = self->_syncMode;
    v26 = syncMode == objc_msgSend_syncMode(v6, v39, v40, v41, v42);
    v27 = v26;
  }
  else
  {
    v26 = 0;
    v27 = 0;
  }
  if (OSSpecificAttributes != v16)
    goto LABEL_13;
LABEL_14:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CWFUserSettings *v4;
  CWFUserSettings *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToUserSettings;

  v4 = (CWFUserSettings *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToUserSettings = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToUserSettings = objc_msgSend_isEqualToUserSettings_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToUserSettings = 0;
  }

  return isEqualToUserSettings;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v8;
  int8x16_t v9;

  v8 = *(int8x16_t *)&self->_syncMode;
  v9 = *(int8x16_t *)&self->_autoHotspotMode;
  v5 = objc_msgSend_hash(self->_OSSpecificAttributes, a2, v2, v3, v4);
  v6 = veorq_s8(v8, v9);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v7 = (void *)objc_msgSend_allocWithZone_(CWFUserSettings, a2, (uint64_t)a3, v3, v4);
  v12 = (void *)objc_msgSend_init(v7, v8, v9, v10, v11);
  objc_msgSend_setAskToJoinMode_(v12, v13, self->_askToJoinMode, v14, v15);
  objc_msgSend_setAutoHotspotMode_(v12, v16, self->_autoHotspotMode, v17, v18);
  objc_msgSend_setSyncMode_(v12, v19, self->_syncMode, v20, v21);
  objc_msgSend_setCompatibilityMode_(v12, v22, self->_compatibilityMode, v23, v24);
  v28 = (void *)objc_msgSend_copyWithZone_(self->_OSSpecificAttributes, v25, (uint64_t)a3, v26, v27);
  objc_msgSend_setOSSpecificAttributes_(v12, v29, (uint64_t)v28, v30, v31);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t askToJoinMode;
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
  id v15;

  askToJoinMode = self->_askToJoinMode;
  v15 = a3;
  objc_msgSend_encodeInteger_forKey_(v15, v5, askToJoinMode, (uint64_t)CFSTR("_askToJoinMode"), v6);
  objc_msgSend_encodeInteger_forKey_(v15, v7, self->_autoHotspotMode, (uint64_t)CFSTR("_autoHotspotMode"), v8);
  objc_msgSend_encodeInteger_forKey_(v15, v9, self->_syncMode, (uint64_t)CFSTR("_syncMode"), v10);
  objc_msgSend_encodeInteger_forKey_(v15, v11, self->_compatibilityMode, (uint64_t)CFSTR("_compatibilityMode"), v12);
  objc_msgSend_encodeObject_forKey_(v15, v13, (uint64_t)self->_OSSpecificAttributes, (uint64_t)CFSTR("_OSSpecificAttributes"), v14);

}

- (CWFUserSettings)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFUserSettings *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
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
  NSDictionary *OSSpecificAttributes;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CWFUserSettings;
  v8 = -[CWFUserSettings init](&v34, sel_init);
  if (v8)
  {
    v8->_askToJoinMode = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("_askToJoinMode"), v6, v7);
    v8->_autoHotspotMode = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("_autoHotspotMode"), v10, v11);
    v8->_syncMode = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("_syncMode"), v13, v14);
    v8->_compatibilityMode = objc_msgSend_decodeIntegerForKey_(v4, v15, (uint64_t)CFSTR("_compatibilityMode"), v16, v17);
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend_setWithObjects_(v18, v25, v19, v26, v27, v20, v21, v22, v23, v24, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, (uint64_t)CFSTR("_OSSpecificAttributes"), v30);
    v31 = objc_claimAutoreleasedReturnValue();
    OSSpecificAttributes = v8->_OSSpecificAttributes;
    v8->_OSSpecificAttributes = (NSDictionary *)v31;

  }
  return v8;
}

- (int64_t)syncMode
{
  return self->_syncMode;
}

- (void)setSyncMode:(int64_t)a3
{
  self->_syncMode = a3;
}

- (int64_t)askToJoinMode
{
  return self->_askToJoinMode;
}

- (void)setAskToJoinMode:(int64_t)a3
{
  self->_askToJoinMode = a3;
}

- (int64_t)autoHotspotMode
{
  return self->_autoHotspotMode;
}

- (void)setAutoHotspotMode:(int64_t)a3
{
  self->_autoHotspotMode = a3;
}

- (int64_t)compatibilityMode
{
  return self->_compatibilityMode;
}

- (void)setCompatibilityMode:(int64_t)a3
{
  self->_compatibilityMode = a3;
}

- (NSDictionary)OSSpecificAttributes
{
  return self->_OSSpecificAttributes;
}

- (void)setOSSpecificAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_OSSpecificAttributes, 0);
}

@end
