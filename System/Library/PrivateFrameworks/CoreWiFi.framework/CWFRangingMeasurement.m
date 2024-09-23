@implementation CWFRangingMeasurement

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("rtt=%ld rssi=%ld snr=%ld channel=%lu coreid=%lu"), v2, v3, self->_roundTripTime, self->_RSSI, self->_SNR, self->_channel, self->_coreID);
}

- (BOOL)isEqualToRangingMeasurement:(id)a3
{
  id v4;
  int64_t roundTripTime;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t channel;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t RSSI;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t SNR;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t coreID;
  BOOL v30;

  v4 = a3;
  roundTripTime = self->_roundTripTime;
  if (roundTripTime == objc_msgSend_roundTripTime(v4, v6, v7, v8, v9)
    && (channel = self->_channel, channel == objc_msgSend_channel(v4, v10, v11, v12, v13))
    && (RSSI = self->_RSSI, RSSI == objc_msgSend_RSSI(v4, v15, v16, v17, v18))
    && (SNR = self->_SNR, SNR == objc_msgSend_SNR(v4, v20, v21, v22, v23)))
  {
    coreID = self->_coreID;
    v30 = coreID == objc_msgSend_coreID(v4, v25, v26, v27, v28);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  CWFRangingMeasurement *v4;
  CWFRangingMeasurement *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRangingMeasurement;

  v4 = (CWFRangingMeasurement *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRangingMeasurement = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRangingMeasurement = objc_msgSend_isEqualToRangingMeasurement_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRangingMeasurement = 0;
  }

  return isEqualToRangingMeasurement;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, self->_roundTripTime, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_channel ^ objc_msgSend_hash(v5, v6, v7, v8, v9);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v11, self->_RSSI, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v14, v15, v16, v17, v18);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v20, self->_SNR, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10 ^ v19 ^ objc_msgSend_hash(v23, v24, v25, v26, v27) ^ self->_coreID;

  return v28;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRangingMeasurement, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setRoundTripTime_(v11, v12, self->_roundTripTime, v13, v14);
  objc_msgSend_setRSSI_(v11, v15, self->_RSSI, v16, v17);
  objc_msgSend_setChannel_(v11, v18, self->_channel, v19, v20);
  objc_msgSend_setSNR_(v11, v21, self->_SNR, v22, v23);
  objc_msgSend_setCoreID_(v11, v24, self->_coreID, v25, v26);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t roundTripTime;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  id v32;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  roundTripTime = self->_roundTripTime;
  v6 = a3;
  objc_msgSend_numberWithInteger_(v4, v7, roundTripTime, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("_roundTripTime"), v12);

  objc_msgSend_encodeInteger_forKey_(v6, v13, self->_RSSI, (uint64_t)CFSTR("_RSSI"), v14);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, self->_channel, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v19, (uint64_t)v18, (uint64_t)CFSTR("_channel"), v20);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v21, self->_SNR, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v25, (uint64_t)v24, (uint64_t)CFSTR("_SNR"), v26);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v27, self->_coreID, v28, v29);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v30, (uint64_t)v32, (uint64_t)CFSTR("_coreID"), v31);

}

- (CWFRangingMeasurement)initWithCoder:(id)a3
{
  id v4;
  CWFRangingMeasurement *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CWFRangingMeasurement;
  v5 = -[CWFRangingMeasurement init](&v37, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_roundTripTime"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_roundTripTime = objc_msgSend_integerValue(v9, v10, v11, v12, v13);

    v5->_RSSI = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("_RSSI"), v15, v16);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("_channel"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_channel = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    v5->_SNR = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("_SNR"), v26, v27);
    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("_coreID"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_coreID = objc_msgSend_unsignedIntegerValue(v31, v32, v33, v34, v35);

  }
  return v5;
}

- (int64_t)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(int64_t)a3
{
  self->_roundTripTime = a3;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (unint64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(unint64_t)a3
{
  self->_channel = a3;
}

- (int64_t)SNR
{
  return self->_SNR;
}

- (void)setSNR:(int64_t)a3
{
  self->_SNR = a3;
}

- (unint64_t)coreID
{
  return self->_coreID;
}

- (void)setCoreID:(unint64_t)a3
{
  self->_coreID = a3;
}

@end
