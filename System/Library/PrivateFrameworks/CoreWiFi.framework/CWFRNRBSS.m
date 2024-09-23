@implementation CWFRNRBSS

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_shortSSID(self, v7, v8, v9, v10);
  objc_msgSend_appendFormat_(v6, v12, (uint64_t)CFSTR("ssid=%lu, "), v13, v14, v11);
  objc_msgSend_BSSID(self, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CWFCorrectEthernetAddressString(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_redactedForWiFi(v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR("bssid=%@, "), v27, v28, v25);

  objc_msgSend_channel(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v34, (uint64_t)CFSTR("channel=%@, "), v35, v36, v33);

  if (objc_msgSend_isSameSSID(self, v37, v38, v39, v40))
    objc_msgSend_appendString_(v6, v41, (uint64_t)CFSTR("same=yes, "), v43, v44);
  if (objc_msgSend_isUPRActive(self, v41, v42, v43, v44))
    objc_msgSend_appendString_(v6, v45, (uint64_t)CFSTR("upr=yes, "), v47, v48);
  if (objc_msgSend_isMultipleBSSID(self, v45, v46, v47, v48))
    objc_msgSend_appendString_(v6, v49, (uint64_t)CFSTR("multiBSS=yes, "), v51, v52);
  if (objc_msgSend_isTransmittedBSSID(self, v49, v50, v51, v52))
    objc_msgSend_appendString_(v6, v53, (uint64_t)CFSTR("transmit=yes, "), v55, v56);
  if (objc_msgSend_isMultiband6GHz(self, v53, v54, v55, v56))
    objc_msgSend_appendString_(v6, v57, (uint64_t)CFSTR("multiband=yes, "), v59, v60);
  if (objc_msgSend_isColocatedAP(self, v57, v58, v59, v60))
    objc_msgSend_appendString_(v6, v61, (uint64_t)CFSTR("colocated=yes, "), v63, v64);
  v65 = objc_msgSend_TBTTOffset(self, v61, v62, v63, v64);
  objc_msgSend_appendFormat_(v6, v66, (uint64_t)CFSTR("tbtt=%lu, "), v67, v68, v65);
  v73 = objc_msgSend_primary20MHzPSD(self, v69, v70, v71, v72);
  objc_msgSend_appendFormat_(v6, v74, (uint64_t)CFSTR("psd=%lu, "), v75, v76, v73);
  if (objc_msgSend_hasSuffix_(v6, v77, (uint64_t)CFSTR(", "), v78, v79))
  {
    v84 = objc_msgSend_length(v6, v80, v81, v82, v83);
    objc_msgSend_deleteCharactersInRange_(v6, v85, v84 - 2, 2, v86);
  }
  return (NSString *)v6;
}

- (BOOL)isEqualToRNRBSS:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unint64_t shortSSID;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *BSSID;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  BOOL v32;
  int sameSSID;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int UPRActive;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int multipleBSSID;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int transmittedBSSID;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int multiband6GHz;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int colocatedAP;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t TBTTOffset;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t primary20MHzPSD;

  v6 = a3;
  shortSSID = self->_shortSSID;
  if (shortSSID == objc_msgSend_shortSSID(v6, v8, v9, v10, v11))
  {
    BSSID = self->_BSSID;
    objc_msgSend_BSSID(v6, v12, v13, v14, v15);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (BSSID == v21)
      goto LABEL_9;
    if (!self->_BSSID || (objc_msgSend_BSSID(v6, v17, v18, v19, v20), (v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v32 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v3 = (void *)v22;
    v27 = self->_BSSID;
    objc_msgSend_BSSID(v6, v23, v24, v25, v26);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v27, v28, (uint64_t)v4, v29, v30))
    {
LABEL_9:
      sameSSID = self->_sameSSID;
      if (sameSSID == objc_msgSend_isSameSSID(v6, v17, v18, v19, v20)
        && (UPRActive = self->_UPRActive, UPRActive == objc_msgSend_isUPRActive(v6, v34, v35, v36, v37))
        && (multipleBSSID = self->_multipleBSSID,
            multipleBSSID == objc_msgSend_isMultipleBSSID(v6, v39, v40, v41, v42))
        && (transmittedBSSID = self->_transmittedBSSID,
            transmittedBSSID == objc_msgSend_isTransmittedBSSID(v6, v44, v45, v46, v47))
        && (multiband6GHz = self->_multiband6GHz,
            multiband6GHz == objc_msgSend_isMultiband6GHz(v6, v49, v50, v51, v52))
        && (colocatedAP = self->_colocatedAP,
            colocatedAP == objc_msgSend_isColocatedAP(v6, v54, v55, v56, v57))
        && (TBTTOffset = self->_TBTTOffset, TBTTOffset == objc_msgSend_TBTTOffset(v6, v59, v60, v61, v62)))
      {
        primary20MHzPSD = self->_primary20MHzPSD;
        v31 = primary20MHzPSD == objc_msgSend_primary20MHzPSD(v6, v64, v65, v66, v67);
        v32 = v31;
      }
      else
      {
        v31 = 0;
        v32 = 0;
      }
      if (BSSID == v21)
        goto LABEL_20;
    }
    else
    {
      v31 = 0;
    }

    v32 = v31;
    goto LABEL_20;
  }
  v32 = 0;
LABEL_21:

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  CWFRNRBSS *v4;
  CWFRNRBSS *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRNRBSS;

  v4 = (CWFRNRBSS *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToRNRBSS = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToRNRBSS = objc_msgSend_isEqualToRNRBSS_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToRNRBSS = 0;
  }

  return isEqualToRNRBSS;
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
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, self->_shortSSID, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);
  v15 = objc_msgSend_hash(self->_BSSID, v11, v12, v13, v14);
  v20 = v15 ^ objc_msgSend_hash(self->_channel, v16, v17, v18, v19) ^ self->_sameSSID ^ v10 ^ self->_UPRActive ^ (unint64_t)self->_multipleBSSID ^ self->_transmittedBSSID ^ self->_multiband6GHz ^ self->_colocatedAP ^ self->_TBTTOffset ^ self->_primary20MHzPSD;

  return v20;
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
  const char *v42;
  uint64_t v43;
  uint64_t v44;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFRNRBSS, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setShortSSID_(v11, v12, self->_shortSSID, v13, v14);
  objc_msgSend_setBSSID_(v11, v15, (uint64_t)self->_BSSID, v16, v17);
  objc_msgSend_setChannel_(v11, v18, (uint64_t)self->_channel, v19, v20);
  objc_msgSend_setSameSSID_(v11, v21, self->_sameSSID, v22, v23);
  objc_msgSend_setUPRActive_(v11, v24, self->_UPRActive, v25, v26);
  objc_msgSend_setMultipleBSSID_(v11, v27, self->_multipleBSSID, v28, v29);
  objc_msgSend_setTransmittedBSSID_(v11, v30, self->_transmittedBSSID, v31, v32);
  objc_msgSend_setMultiband6GHz_(v11, v33, self->_multiband6GHz, v34, v35);
  objc_msgSend_setColocatedAP_(v11, v36, self->_colocatedAP, v37, v38);
  objc_msgSend_setTBTTOffset_(v11, v39, self->_TBTTOffset, v40, v41);
  objc_msgSend_setPrimary20MHzPSD_(v11, v42, self->_primary20MHzPSD, v43, v44);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t shortSSID;
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
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  id v40;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  shortSSID = self->_shortSSID;
  v6 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v4, v7, shortSSID, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("_shortSSID"), v12);

  objc_msgSend_encodeObject_forKey_(v6, v13, (uint64_t)self->_BSSID, (uint64_t)CFSTR("_BSSID"), v14);
  objc_msgSend_encodeObject_forKey_(v6, v15, (uint64_t)self->_channel, (uint64_t)CFSTR("_channel"), v16);
  objc_msgSend_encodeBool_forKey_(v6, v17, self->_sameSSID, (uint64_t)CFSTR("_sameSSID"), v18);
  objc_msgSend_encodeBool_forKey_(v6, v19, self->_UPRActive, (uint64_t)CFSTR("_UPRActive"), v20);
  objc_msgSend_encodeBool_forKey_(v6, v21, self->_multipleBSSID, (uint64_t)CFSTR("_multipleBSSID"), v22);
  objc_msgSend_encodeBool_forKey_(v6, v23, self->_transmittedBSSID, (uint64_t)CFSTR("_transmittedBSSID"), v24);
  objc_msgSend_encodeBool_forKey_(v6, v25, self->_multiband6GHz, (uint64_t)CFSTR("_multiband6GHz"), v26);
  objc_msgSend_encodeBool_forKey_(v6, v27, self->_colocatedAP, (uint64_t)CFSTR("_colocatedAP"), v28);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v29, self->_TBTTOffset, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v33, (uint64_t)v32, (uint64_t)CFSTR("_TBTTOffset"), v34);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v35, self->_primary20MHzPSD, v36, v37);
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v38, (uint64_t)v40, (uint64_t)CFSTR("_primary20MHzPSD"), v39);

}

- (CWFRNRBSS)initWithCoder:(id)a3
{
  id v4;
  CWFRNRBSS *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *BSSID;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  CWFChannel *channel;
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
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)CWFRNRBSS;
  v5 = -[CWFRNRBSS init](&v59, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_shortSSID"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shortSSID = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("_BSSID"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("_channel"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v22;

    v5->_sameSSID = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("_sameSSID"), v25, v26);
    v5->_UPRActive = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)CFSTR("_UPRActive"), v28, v29);
    v5->_multipleBSSID = objc_msgSend_decodeBoolForKey_(v4, v30, (uint64_t)CFSTR("_multipleBSSID"), v31, v32);
    v5->_transmittedBSSID = objc_msgSend_decodeBoolForKey_(v4, v33, (uint64_t)CFSTR("_transmittedBSSID"), v34, v35);
    v5->_multiband6GHz = objc_msgSend_decodeBoolForKey_(v4, v36, (uint64_t)CFSTR("_multiband6GHz"), v37, v38);
    v5->_colocatedAP = objc_msgSend_decodeBoolForKey_(v4, v39, (uint64_t)CFSTR("_colocatedAP"), v40, v41);
    v42 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, (uint64_t)CFSTR("_TBTTOffset"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_TBTTOffset = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49);

    v50 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, (uint64_t)CFSTR("_primary20MHzPSD"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_primary20MHzPSD = objc_msgSend_unsignedIntegerValue(v53, v54, v55, v56, v57);

  }
  return v5;
}

- (unint64_t)shortSSID
{
  return self->_shortSSID;
}

- (void)setShortSSID:(unint64_t)a3
{
  self->_shortSSID = a3;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CWFChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isUPRActive
{
  return self->_UPRActive;
}

- (void)setUPRActive:(BOOL)a3
{
  self->_UPRActive = a3;
}

- (BOOL)isSameSSID
{
  return self->_sameSSID;
}

- (void)setSameSSID:(BOOL)a3
{
  self->_sameSSID = a3;
}

- (BOOL)isMultipleBSSID
{
  return self->_multipleBSSID;
}

- (void)setMultipleBSSID:(BOOL)a3
{
  self->_multipleBSSID = a3;
}

- (BOOL)isTransmittedBSSID
{
  return self->_transmittedBSSID;
}

- (void)setTransmittedBSSID:(BOOL)a3
{
  self->_transmittedBSSID = a3;
}

- (BOOL)isMultiband6GHz
{
  return self->_multiband6GHz;
}

- (void)setMultiband6GHz:(BOOL)a3
{
  self->_multiband6GHz = a3;
}

- (BOOL)isColocatedAP
{
  return self->_colocatedAP;
}

- (void)setColocatedAP:(BOOL)a3
{
  self->_colocatedAP = a3;
}

- (unint64_t)TBTTOffset
{
  return self->_TBTTOffset;
}

- (void)setTBTTOffset:(unint64_t)a3
{
  self->_TBTTOffset = a3;
}

- (unint64_t)primary20MHzPSD
{
  return self->_primary20MHzPSD;
}

- (void)setPrimary20MHzPSD:(unint64_t)a3
{
  self->_primary20MHzPSD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
}

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
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t isUPRActive;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t isSameSSID;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t isMultipleBSSID;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t isTransmittedBSSID;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t isMultiband6GHz;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t isColocatedAP;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_BSSID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, (uint64_t)CFSTR("BSSID"), v10);

  objc_msgSend_channel(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_JSONCompatibleKeyValueMap(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, (uint64_t)CFSTR("channel"), v22);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  isUPRActive = objc_msgSend_isUPRActive(self, v24, v25, v26, v27);
  objc_msgSend_numberWithBool_(v23, v29, isUPRActive, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("upr_active"), v34);

  v35 = (void *)MEMORY[0x1E0CB37E8];
  isSameSSID = objc_msgSend_isSameSSID(self, v36, v37, v38, v39);
  objc_msgSend_numberWithBool_(v35, v41, isSameSSID, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, (uint64_t)CFSTR("same_ssid"), v46);

  v47 = (void *)MEMORY[0x1E0CB37E8];
  isMultipleBSSID = objc_msgSend_isMultipleBSSID(self, v48, v49, v50, v51);
  objc_msgSend_numberWithBool_(v47, v53, isMultipleBSSID, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, (uint64_t)CFSTR("multiple_bssid"), v58);

  v59 = (void *)MEMORY[0x1E0CB37E8];
  isTransmittedBSSID = objc_msgSend_isTransmittedBSSID(self, v60, v61, v62, v63);
  objc_msgSend_numberWithBool_(v59, v65, isTransmittedBSSID, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, (uint64_t)CFSTR("transmitted_bssid"), v70);

  v71 = (void *)MEMORY[0x1E0CB37E8];
  isMultiband6GHz = objc_msgSend_isMultiband6GHz(self, v72, v73, v74, v75);
  objc_msgSend_numberWithBool_(v71, v77, isMultiband6GHz, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, (uint64_t)CFSTR("multiband_6ghz"), v82);

  v83 = (void *)MEMORY[0x1E0CB37E8];
  isColocatedAP = objc_msgSend_isColocatedAP(self, v84, v85, v86, v87);
  objc_msgSend_numberWithBool_(v83, v89, isColocatedAP, v90, v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, (uint64_t)CFSTR("colocated_ap"), v94);

  v95 = (void *)MEMORY[0x1E0CB37E8];
  v100 = objc_msgSend_TBTTOffset(self, v96, v97, v98, v99);
  objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v105, (uint64_t)v104, (uint64_t)CFSTR("tbtt_offset"), v106);

  v107 = (void *)MEMORY[0x1E0CB37E8];
  v112 = objc_msgSend_primary20MHzPSD(self, v108, v109, v110, v111);
  objc_msgSend_numberWithUnsignedInteger_(v107, v113, v112, v114, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v117, (uint64_t)v116, (uint64_t)CFSTR("primary_20mhz_psd"), v118);

  sub_1B06475A8(v3, 0, 1u);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (v122)
  {
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v119, (uint64_t)v122, v120, v121);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v123 = 0;
  }

  return v123;
}

@end
