@implementation RTMapItemExtendedAttributes

+ (id)fingerprintLabelTypeToString:(int64_t)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 < 3)
    return off_1E4FB15E0[a3];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "+[RTMapItemExtendedAttributes fingerprintLabelTypeToString:]";
    v7 = 1024;
    v8 = 43;
    _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "unknown wifi fingerprint label (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (RTMapItemExtendedAttributes)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_addressIdentifier_isMe_wifiConfidence_wifiFingerprintLabelType_);
}

- (RTMapItemExtendedAttributes)initWithExtendedAttributesMO:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  RTMapItemExtendedAttributes *v13;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addressIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isMe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");
    objc_msgSend(v4, "wifiConfidence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;
    objc_msgSend(v4, "wifiFingerprintLabelType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:](self, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v5, v6, v8, objc_msgSend(v12, "integerValue"), v11);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (RTMapItemExtendedAttributes)initWithIdentifier:(id)a3 addressIdentifier:(id)a4 isMe:(BOOL)a5 wifiConfidence:(double)a6 wifiFingerprintLabelType:(int64_t)a7
{
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  RTMapItemExtendedAttributes *v18;
  RTMapItemExtendedAttributes *v19;
  RTMapItemExtendedAttributes *v20;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      v25 = 1024;
      v26 = 71;
      _os_log_error_impl(&dword_1A5E26000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

  }
  if ((unint64_t)a7 >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      v25 = 1024;
      v26 = 72;
      _os_log_error_impl(&dword_1A5E26000, v16, OS_LOG_TYPE_ERROR, "invalid wifi label type (in %s:%d)", buf, 0x12u);
    }

  }
  if (a6 < 0.0 || a6 > 1.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:]";
      v25 = 1024;
      v26 = 73;
      _os_log_error_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_ERROR, "invalid wifiConfidence (in %s:%d)", buf, 0x12u);
    }

  }
  v18 = 0;
  if (v13 && a6 <= 1.0 && a6 >= 0.0 && (unint64_t)a7 <= 2)
  {
    v22.receiver = self;
    v22.super_class = (Class)RTMapItemExtendedAttributes;
    v19 = -[RTMapItemExtendedAttributes init](&v22, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_identifier, a3);
      objc_storeStrong((id *)&v20->_addressIdentifier, a4);
      v20->_isMe = a5;
      v20->_wifiConfidence = a6;
      v20->_wifiFingerprintLabelType = a7;
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

- (RTMapItemExtendedAttributes)initWithAddressIdentifier:(id)a3 isMe:(BOOL)a4 wifiConfidence:(double)a5 wifiFingerprintLabelType:(int64_t)a6
{
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  RTMapItemExtendedAttributes *v13;

  v8 = a4;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a3;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:](self, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v12, v11, v8, a6, a5);

  return v13;
}

- (id)description
{
  void *v2;
  NSUUID *identifier;
  NSString *addressIdentifier;
  const __CFString *v5;
  double wifiConfidence;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB3940];
  identifier = self->_identifier;
  addressIdentifier = self->_addressIdentifier;
  if (self->_isMe)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  wifiConfidence = self->_wifiConfidence;
  objc_msgSend((id)objc_opt_class(), "fingerprintLabelTypeToString:", self->_wifiFingerprintLabelType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("identifier, %@, address identifier, %@, isMe, %@, wifiConfidence, %.3lf, labelType, %@"), identifier, addressIdentifier, v5, *(_QWORD *)&wifiConfidence, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  RTMapItemExtendedAttributes *v4;
  RTMapItemExtendedAttributes *v5;
  BOOL v6;

  v4 = (RTMapItemExtendedAttributes *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[RTMapItemExtendedAttributes isEqualToMapItemExtendedAttributes:](self, "isEqualToMapItemExtendedAttributes:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_addressIdentifier, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMe);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_wifiConfidence);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_wifiFingerprintLabelType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqualToMapItemExtendedAttributes:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  NSUUID *identifier;
  NSUUID *v8;
  void *v9;
  char v10;
  NSString *addressIdentifier;
  NSString *v12;
  void *v13;
  char v14;
  int isMe;
  int v16;
  double wifiConfidence;
  double v18;
  double v19;
  int64_t wifiFingerprintLabelType;
  uint64_t v21;
  char v22;
  BOOL v23;

  v5 = a3;
  v6 = v5;
  identifier = self->_identifier;
  v8 = identifier;
  if (identifier)
  {
LABEL_4:
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSUUID isEqual:](v8, "isEqual:", v9);

    if (identifier)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v5, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = self->_identifier;
    goto LABEL_4;
  }
  v10 = 1;
LABEL_7:

LABEL_8:
  addressIdentifier = self->_addressIdentifier;
  v12 = addressIdentifier;
  if (addressIdentifier)
    goto LABEL_11;
  objc_msgSend(v6, "addressIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v12 = self->_addressIdentifier;
LABEL_11:
    objc_msgSend(v6, "addressIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSString isEqual:](v12, "isEqual:", v13);

    if (addressIdentifier)
      goto LABEL_15;
    goto LABEL_14;
  }
  v14 = 1;
LABEL_14:

LABEL_15:
  isMe = self->_isMe;
  v16 = objc_msgSend(v6, "isMe");
  wifiConfidence = self->_wifiConfidence;
  objc_msgSend(v6, "wifiConfidence");
  v19 = v18;
  wifiFingerprintLabelType = self->_wifiFingerprintLabelType;
  v21 = objc_msgSend(v6, "wifiFingerprintLabelType");
  v22 = v10 & v14;
  if (isMe != v16)
    v22 = 0;
  if (wifiConfidence != v19)
    v22 = 0;
  if (wifiFingerprintLabelType == v21)
    v23 = v22;
  else
    v23 = 0;

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTMapItemExtendedAttributes)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  RTMapItemExtendedAttributes *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addressIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isMe"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("wifiConfidence"));
  v9 = v8;
  v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("wifiFingerprintLabelType"));

  v11 = -[RTMapItemExtendedAttributes initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:](self, "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", v5, v6, v7, v10, v9);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addressIdentifier, CFSTR("addressIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isMe, CFSTR("isMe"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("wifiConfidence"), self->_wifiConfidence);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_wifiFingerprintLabelType, CFSTR("wifiFingerprintLabelType"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIdentifier:addressIdentifier:isMe:wifiConfidence:wifiFingerprintLabelType:", self->_identifier, self->_addressIdentifier, self->_isMe, self->_wifiFingerprintLabelType, self->_wifiConfidence);
}

- (NSString)addressIdentifier
{
  return self->_addressIdentifier;
}

- (void)setAddressIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (double)wifiConfidence
{
  return self->_wifiConfidence;
}

- (void)setWifiConfidence:(double)a3
{
  self->_wifiConfidence = a3;
}

- (int64_t)wifiFingerprintLabelType
{
  return self->_wifiFingerprintLabelType;
}

- (void)setWifiFingerprintLabelType:(int64_t)a3
{
  self->_wifiFingerprintLabelType = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_addressIdentifier, 0);
}

@end
