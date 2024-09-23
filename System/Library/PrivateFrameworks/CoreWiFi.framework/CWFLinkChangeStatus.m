@implementation CWFLinkChangeStatus

- (id)description
{
  void *v3;
  const char *v4;
  NSString *interfaceName;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_linkDown)
  {
    if (self->_involuntaryLinkDown)
      v4 = "down (involuntary)";
    else
      v4 = "down";
  }
  else
  {
    v4 = "up";
  }
  interfaceName = self->_interfaceName;
  sub_1B0630E50(self->_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v7, (uint64_t)CFSTR("link %s,  intf=%@ timestamp=%@ reason=%d sub=%ld debounce=%d rssi=%ld noise=%ld cca=%lu"), v8, v9, v4, interfaceName, v6, self->_reason, self->_subreason, self->_linkDownDebounceInProgress, self->_RSSI, self->_noise, self->_CCA);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqualToLinkChangeStatus:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  NSString *interfaceName;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  NSDate *timestamp;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSDate *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSDate *v39;
  uint64_t v40;
  NSDate *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  int linkDown;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int involuntaryLinkDown;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int reason;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t subreason;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int linkDownDebounceInProgress;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int64_t RSSI;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int64_t noise;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t CCA;
  void *v83;

  v7 = a3;
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v7, v9, v10, v11, v12);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (interfaceName != v17)
  {
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v7, v13, v14, v15, v16), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
      goto LABEL_30;
    }
    v3 = (void *)v18;
    v23 = self->_interfaceName;
    objc_msgSend_interfaceName(v7, v19, v20, v21, v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v4, v25, v26))
    {
      v27 = 0;
LABEL_29:

      goto LABEL_30;
    }
  }
  timestamp = self->_timestamp;
  objc_msgSend_timestamp(v7, v13, v14, v15, v16);
  v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (timestamp != v33)
  {
    if (!self->_timestamp)
      goto LABEL_24;
    objc_msgSend_timestamp(v7, v29, v30, v31, v32);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
LABEL_23:

      v27 = 0;
      goto LABEL_28;
    }
    v5 = (void *)v34;
    v39 = self->_timestamp;
    objc_msgSend_timestamp(v7, v35, v36, v37, v38);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v39;
    v42 = (void *)v40;
    if (!objc_msgSend_isEqual_(v41, v43, v40, v44, v45))
    {
      v27 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v83 = v42;
  }
  linkDown = self->_linkDown;
  if (linkDown == objc_msgSend_isLinkDown(v7, v29, v30, v31, v32))
  {
    involuntaryLinkDown = self->_involuntaryLinkDown;
    if (involuntaryLinkDown == objc_msgSend_isInvoluntaryLinkDown(v7, v47, v48, v49, v50))
    {
      reason = self->_reason;
      if (reason == objc_msgSend_reason(v7, v52, v53, v54, v55))
      {
        subreason = self->_subreason;
        if (subreason == objc_msgSend_subreason(v7, v57, v58, v59, v60))
        {
          linkDownDebounceInProgress = self->_linkDownDebounceInProgress;
          if (linkDownDebounceInProgress == objc_msgSend_isLinkDownDebounceInProgress(v7, v62, v63, v64, v65))
          {
            RSSI = self->_RSSI;
            if (RSSI == objc_msgSend_RSSI(v7, v67, v68, v69, v70))
            {
              noise = self->_noise;
              if (noise == objc_msgSend_noise(v7, v72, v73, v74, v75))
              {
                CCA = self->_CCA;
                v27 = CCA == objc_msgSend_CCA(v7, v77, v78, v79, v80);
                v42 = v83;
                if (timestamp == v33)
                  goto LABEL_27;
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
  }
  if (timestamp != v33)
  {

    goto LABEL_23;
  }
LABEL_24:
  v27 = 0;
LABEL_27:

LABEL_28:
  if (interfaceName != v17)
    goto LABEL_29;
LABEL_30:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CWFLinkChangeStatus *v4;
  CWFLinkChangeStatus *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = (CWFLinkChangeStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_msgSend_isEqualToLinkChangeStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  int8x16_t v12;

  v6 = objc_msgSend_hash(self->_interfaceName, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_timestamp, v7, v8, v9, v10);
  v12 = veorq_s8(*(int8x16_t *)&self->_subreason, *(int8x16_t *)&self->_noise);
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) ^ self->_linkDown ^ self->_involuntaryLinkDown ^ self->_linkDownDebounceInProgress ^ v11 ^ self->_reason ^ v6;
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
  const char *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFLinkChangeStatus, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setInterfaceName_(v11, v12, (uint64_t)self->_interfaceName, v13, v14);
  objc_msgSend_setLinkDown_(v11, v15, self->_linkDown, v16, v17);
  objc_msgSend_setInvoluntaryLinkDown_(v11, v18, self->_involuntaryLinkDown, v19, v20);
  objc_msgSend_setTimestamp_(v11, v21, (uint64_t)self->_timestamp, v22, v23);
  objc_msgSend_setReason_(v11, v24, self->_reason, v25, v26);
  objc_msgSend_setSubreason_(v11, v27, self->_subreason, v28, v29);
  objc_msgSend_setLinkDownDebounceInProgress_(v11, v30, self->_linkDownDebounceInProgress, v31, v32);
  objc_msgSend_setRSSI_(v11, v33, self->_RSSI, v34, v35);
  objc_msgSend_setNoise_(v11, v36, self->_noise, v37, v38);
  objc_msgSend_setCCA_(v11, v39, self->_CCA, v40, v41);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *interfaceName;
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
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;

  interfaceName = self->_interfaceName;
  v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)interfaceName, (uint64_t)CFSTR("_interfaceName"), v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_timestamp, (uint64_t)CFSTR("_timestamp"), v9);
  objc_msgSend_encodeBool_forKey_(v5, v10, self->_linkDown, (uint64_t)CFSTR("_linkDown"), v11);
  objc_msgSend_encodeBool_forKey_(v5, v12, self->_involuntaryLinkDown, (uint64_t)CFSTR("_involuntaryLinkDown"), v13);
  objc_msgSend_encodeInteger_forKey_(v5, v14, self->_reason, (uint64_t)CFSTR("_reason"), v15);
  objc_msgSend_encodeInteger_forKey_(v5, v16, self->_subreason, (uint64_t)CFSTR("_subreason"), v17);
  objc_msgSend_encodeBool_forKey_(v5, v18, self->_linkDownDebounceInProgress, (uint64_t)CFSTR("_linkDownDebounceInProgress"), v19);
  objc_msgSend_encodeInteger_forKey_(v5, v20, self->_RSSI, (uint64_t)CFSTR("_RSSI"), v21);
  objc_msgSend_encodeInteger_forKey_(v5, v22, self->_noise, (uint64_t)CFSTR("_noise"), v23);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v24, self->_CCA, v25, v26);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)v29, (uint64_t)CFSTR("_CCA"), v28);

}

- (CWFLinkChangeStatus)initWithCoder:(id)a3
{
  id v4;
  CWFLinkChangeStatus *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *interfaceName;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSDate *timestamp;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CWFLinkChangeStatus;
  v5 = -[CWFLinkChangeStatus init](&v46, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_interfaceName"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_timestamp"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    v5->_linkDown = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("_linkDown"), v17, v18);
    v5->_involuntaryLinkDown = objc_msgSend_decodeBoolForKey_(v4, v19, (uint64_t)CFSTR("_involuntaryLinkDown"), v20, v21);
    v5->_reason = objc_msgSend_decodeIntegerForKey_(v4, v22, (uint64_t)CFSTR("_reason"), v23, v24);
    v5->_subreason = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("_subreason"), v26, v27);
    v5->_linkDownDebounceInProgress = objc_msgSend_decodeBoolForKey_(v4, v28, (uint64_t)CFSTR("_linkDownDebounceInProgress"), v29, v30);
    v5->_RSSI = objc_msgSend_decodeIntegerForKey_(v4, v31, (uint64_t)CFSTR("_RSSI"), v32, v33);
    v5->_noise = objc_msgSend_decodeIntegerForKey_(v4, v34, (uint64_t)CFSTR("_noise"), v35, v36);
    v37 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, (uint64_t)CFSTR("_CCA"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_CCA = objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43, v44);

  }
  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isLinkDown
{
  return self->_linkDown;
}

- (void)setLinkDown:(BOOL)a3
{
  self->_linkDown = a3;
}

- (BOOL)isLinkDownDebounceInProgress
{
  return self->_linkDownDebounceInProgress;
}

- (void)setLinkDownDebounceInProgress:(BOOL)a3
{
  self->_linkDownDebounceInProgress = a3;
}

- (BOOL)isInvoluntaryLinkDown
{
  return self->_involuntaryLinkDown;
}

- (void)setInvoluntaryLinkDown:(BOOL)a3
{
  self->_involuntaryLinkDown = a3;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_reason = a3;
}

- (int64_t)subreason
{
  return self->_subreason;
}

- (void)setSubreason:(int64_t)a3
{
  self->_subreason = a3;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_RSSI = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (unint64_t)CCA
{
  return self->_CCA;
}

- (void)setCCA:(unint64_t)a3
{
  self->_CCA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
