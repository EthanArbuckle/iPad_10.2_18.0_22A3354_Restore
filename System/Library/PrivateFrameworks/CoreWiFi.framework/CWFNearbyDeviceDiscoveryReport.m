@implementation CWFNearbyDeviceDiscoveryReport

- (CWFNearbyDeviceDiscoveryReport)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CWFNearbyDeviceDiscoveryReport;
  v6 = -[CWFNearbyDeviceDiscoveryReport init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend_date(MEMORY[0x1E0C99D68], v2, v3, v4, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    v9 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = 0;

    v10 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = 0;

    v6[8] = 0;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((_QWORD *)v6 + 9) = 0;
  }
  return (CWFNearbyDeviceDiscoveryReport *)v6;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("timeStamp=%@, "), v8, v9, self->_timeStamp);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR("macId=%@, "), v11, v12, self->_macId);
  if (objc_msgSend_count(self->_rssi, v13, v14, v15, v16))
  {
    v20 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_rssi, v17, v20, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR("rssi%d = %@, "), v23, v24, v20, v21);

      ++v20;
    }
    while (v20 < objc_msgSend_count(self->_rssi, v25, v26, v27, v28));
  }
  objc_msgSend_appendFormat_(v6, v17, (uint64_t)CFSTR("frameType=%ld, "), v18, v19, self->_frameType);
  objc_msgSend_appendFormat_(v6, v29, (uint64_t)CFSTR("bandwidth=%ld, "), v30, v31, self->_bandwidth);
  objc_msgSend_appendFormat_(v6, v32, (uint64_t)CFSTR("channel=%ld, "), v33, v34, self->_channel);
  objc_msgSend_appendFormat_(v6, v35, (uint64_t)CFSTR("band=%ld, "), v36, v37, self->_band);
  objc_msgSend_appendFormat_(v6, v38, (uint64_t)CFSTR("rateMbps=%ld, "), v39, v40, self->_rateMbps);
  objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR("isLowConfidence=%d, "), v42, v43, self->_isLowConfidence);
  return v6;
}

- (BOOL)isEqualToNDDParameters:(id)a3
{
  void *v3;
  id v5;
  NSDate *timeStamp;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSDate *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  NSString *macId;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSString *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSArray *rssi;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSArray *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSArray *v55;
  uint64_t v56;
  NSArray *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int64_t frameType;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int64_t bandwidth;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int64_t channel;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int64_t band;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int64_t rateMbps;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int isLowConfidence;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;

  v5 = a3;
  timeStamp = self->_timeStamp;
  objc_msgSend_timeStamp(v5, v7, v8, v9, v10);
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (timeStamp != v15)
  {
    if (!self->_timeStamp
      || (objc_msgSend_timeStamp(v5, v11, v12, v13, v14), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26 = 0;
      goto LABEL_36;
    }
    v3 = (void *)v16;
    v21 = self->_timeStamp;
    objc_msgSend_timeStamp(v5, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      v26 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v93 = v22;
  }
  macId = self->_macId;
  objc_msgSend_macId(v5, v11, v12, v13, v14);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (macId != v32)
  {
    if (!self->_macId || (objc_msgSend_macId(v5, v28, v29, v30, v31), (v33 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v26 = 0;
LABEL_13:
      v22 = v93;
      goto LABEL_34;
    }
    v38 = (void *)v33;
    v39 = self->_macId;
    objc_msgSend_macId(v5, v34, v35, v36, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43) & 1) == 0)
    {

      v26 = 0;
      goto LABEL_38;
    }
    v91 = v40;
    v92 = v38;
  }
  rssi = self->_rssi;
  objc_msgSend_rssi(v5, v28, v29, v30, v31);
  v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (rssi != v49)
  {
    if (!self->_rssi)
      goto LABEL_30;
    objc_msgSend_rssi(v5, v45, v46, v47, v48);
    v50 = objc_claimAutoreleasedReturnValue();
    if (!v50)
    {
LABEL_29:

      v26 = 0;
      goto LABEL_32;
    }
    v90 = (void *)v50;
    v55 = self->_rssi;
    objc_msgSend_rssi(v5, v51, v52, v53, v54);
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = v55;
    v58 = (void *)v56;
    if (!objc_msgSend_isEqual_(v57, v59, v56, v60, v61))
    {
      v26 = 0;
LABEL_41:

      if (macId != v32)
      {

        goto LABEL_13;
      }

LABEL_38:
      v22 = v93;
      if (timeStamp == v15)
        goto LABEL_36;
      goto LABEL_35;
    }
    v89 = v58;
  }
  frameType = self->_frameType;
  if (frameType == objc_msgSend_frameType(v5, v45, v46, v47, v48))
  {
    bandwidth = self->_bandwidth;
    if (bandwidth == objc_msgSend_bandwidth(v5, v63, v64, v65, v66))
    {
      channel = self->_channel;
      if (channel == objc_msgSend_channel(v5, v68, v69, v70, v71))
      {
        band = self->_band;
        if (band == objc_msgSend_band(v5, v73, v74, v75, v76))
        {
          rateMbps = self->_rateMbps;
          if (rateMbps == objc_msgSend_rateMbps(v5, v78, v79, v80, v81))
          {
            isLowConfidence = self->_isLowConfidence;
            v26 = isLowConfidence == objc_msgSend_isLowConfidence(v5, v83, v84, v85, v86);
            v58 = v89;
            if (rssi == v49)
              goto LABEL_31;
            goto LABEL_41;
          }
        }
      }
    }
  }
  if (rssi != v49)
  {

    goto LABEL_29;
  }
LABEL_30:
  v26 = 0;
LABEL_31:

LABEL_32:
  v22 = v93;
  if (macId != v32)
  {

  }
LABEL_34:

  if (timeStamp != v15)
    goto LABEL_35;
LABEL_36:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  CWFNearbyDeviceDiscoveryReport *v4;
  CWFNearbyDeviceDiscoveryReport *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToNDDParameters;

  v4 = (CWFNearbyDeviceDiscoveryReport *)a3;
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
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;

  v6 = objc_msgSend_hash(self->_timeStamp, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_macId, v7, v8, v9, v10) ^ v6;
  v16 = v11 ^ objc_msgSend_hash(self->_rssi, v12, v13, v14, v15);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v17, self->_frameType, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16 ^ objc_msgSend_hash(v20, v21, v22, v23, v24);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v26, self->_bandwidth, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_hash(v29, v30, v31, v32, v33);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v35, self->_channel, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v25 ^ v34 ^ objc_msgSend_hash(v38, v39, v40, v41, v42);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v44, self->_band, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_hash(v47, v48, v49, v50, v51);
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v53, self->_rateMbps, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v52 ^ objc_msgSend_hash(v56, v57, v58, v59, v60);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v62, self->_isLowConfidence, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v43 ^ v61 ^ objc_msgSend_hash(v65, v66, v67, v68, v69);

  return v70;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFNearbyDeviceDiscoveryReport, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTimeStamp_(v11, v12, (uint64_t)self->_timeStamp, v13, v14);
  objc_msgSend_setMacId_(v11, v15, (uint64_t)self->_macId, v16, v17);
  objc_msgSend_setRssi_(v11, v18, (uint64_t)self->_rssi, v19, v20);
  objc_msgSend_setFrameType_(v11, v21, self->_frameType, v22, v23);
  objc_msgSend_setBandwidth_(v11, v24, self->_bandwidth, v25, v26);
  objc_msgSend_setChannel_(v11, v27, self->_channel, v28, v29);
  objc_msgSend_setBand_(v11, v30, self->_band, v31, v32);
  objc_msgSend_setRateMbps_(v11, v33, self->_rateMbps, v34, v35);
  objc_msgSend_setIsLowConfidence_(v11, v36, self->_isLowConfidence, v37, v38);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timeStamp;
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
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;

  timeStamp = self->_timeStamp;
  v23 = a3;
  objc_msgSend_encodeObject_forKey_(v23, v5, (uint64_t)timeStamp, (uint64_t)CFSTR("_timeStamp"), v6);
  objc_msgSend_encodeObject_forKey_(v23, v7, (uint64_t)self->_macId, (uint64_t)CFSTR("_macId"), v8);
  objc_msgSend_encodeObject_forKey_(v23, v9, (uint64_t)self->_rssi, (uint64_t)CFSTR("_rssi"), v10);
  objc_msgSend_encodeInteger_forKey_(v23, v11, self->_frameType, (uint64_t)CFSTR("_frameType"), v12);
  objc_msgSend_encodeInteger_forKey_(v23, v13, self->_bandwidth, (uint64_t)CFSTR("_bandwidth"), v14);
  objc_msgSend_encodeInteger_forKey_(v23, v15, self->_channel, (uint64_t)CFSTR("_channel"), v16);
  objc_msgSend_encodeInteger_forKey_(v23, v17, self->_band, (uint64_t)CFSTR("_band"), v18);
  objc_msgSend_encodeInteger_forKey_(v23, v19, self->_rateMbps, (uint64_t)CFSTR("_rateMbps"), v20);
  objc_msgSend_encodeBool_forKey_(v23, v21, self->_isLowConfidence, (uint64_t)CFSTR("_isLowConfidence"), v22);

}

- (CWFNearbyDeviceDiscoveryReport)initWithCoder:(id)a3
{
  id v4;
  CWFNearbyDeviceDiscoveryReport *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *timeStamp;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *macId;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *rssi;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CWFNearbyDeviceDiscoveryReport;
  v5 = -[CWFNearbyDeviceDiscoveryReport init](&v56, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v8, v7, v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, (uint64_t)CFSTR("_timeStamp"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    timeStamp = v5->_timeStamp;
    v5->_timeStamp = (NSDate *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend_setWithObjects_(v16, v18, v17, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, (uint64_t)CFSTR("_macId"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    macId = v5->_macId;
    v5->_macId = (NSString *)v24;

    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, (uint64_t)CFSTR("_rssi"), v34);
    v35 = objc_claimAutoreleasedReturnValue();
    rssi = v5->_rssi;
    v5->_rssi = (NSArray *)v35;

    v5->_frameType = objc_msgSend_decodeIntegerForKey_(v4, v37, (uint64_t)CFSTR("_frameType"), v38, v39);
    v5->_bandwidth = objc_msgSend_decodeIntegerForKey_(v4, v40, (uint64_t)CFSTR("_bandwidth"), v41, v42);
    v5->_channel = objc_msgSend_decodeIntegerForKey_(v4, v43, (uint64_t)CFSTR("_channel"), v44, v45);
    v5->_band = objc_msgSend_decodeIntegerForKey_(v4, v46, (uint64_t)CFSTR("_band"), v47, v48);
    v5->_rateMbps = objc_msgSend_decodeIntegerForKey_(v4, v49, (uint64_t)CFSTR("_rateMbps"), v50, v51);
    v5->_isLowConfidence = objc_msgSend_decodeIntegerForKey_(v4, v52, (uint64_t)CFSTR("_isLowConfidence"), v53, v54) != 0;
  }

  return v5;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)macId
{
  return self->_macId;
}

- (void)setMacId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)frameType
{
  return self->_frameType;
}

- (void)setFrameType:(int64_t)a3
{
  self->_frameType = a3;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (void)setBandwidth:(int64_t)a3
{
  self->_bandwidth = a3;
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

- (int64_t)rateMbps
{
  return self->_rateMbps;
}

- (void)setRateMbps:(int64_t)a3
{
  self->_rateMbps = a3;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_isLowConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_macId, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
}

@end
