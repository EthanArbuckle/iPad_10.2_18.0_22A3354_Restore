@implementation CWFAWDLPeerAssistedDiscoveryParameters

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("localMasterChannel=%lu, localPreferredChannel=%lu, localSecondaryPreferredChannel=%lu, localAssistedDiscoveryMetric=%lu, peerMACAddr=%@, peerMasterChannel=%lu, peerPreferredChannel=%lu, peerSecondaryPreferredChannel=%lu, peerAssistedDiscoveryMetric=%lu, peerSupportedChannelFlags=0x%x, followMode=%d, followModePreferredBand=%lu"), v2, v3, self->_localMasterChannel, self->_localPreferredChannel, self->_localSecondaryPreferredChannel, self->_localAssistedDiscoveryMetric, self->_peerMACAddress, self->_peerMasterChannel, self->_peerPreferredChannel, self->_peerSecondaryPreferredChannel, self->_peerAssistedDiscoveryMetric, self->_peerSupportedChannelFlags, self->_followMode, self->_followModePreferredBand);
}

- (BOOL)isEqualToAWDLParameters:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  unint64_t localMasterChannel;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t localPreferredChannel;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t localSecondaryPreferredChannel;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t localAssistedDiscoveryMetric;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *peerMACAddress;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSString *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  unint64_t peerMasterChannel;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t peerPreferredChannel;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t peerSecondaryPreferredChannel;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t peerAssistedDiscoveryMetric;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int peerSupportedChannelFlags;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int followMode;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t followModePreferredBand;

  v6 = a3;
  localMasterChannel = self->_localMasterChannel;
  if (localMasterChannel == objc_msgSend_localMasterChannel(v6, v8, v9, v10, v11))
  {
    localPreferredChannel = self->_localPreferredChannel;
    if (localPreferredChannel == objc_msgSend_localPreferredChannel(v6, v12, v13, v14, v15))
    {
      localSecondaryPreferredChannel = self->_localSecondaryPreferredChannel;
      if (localSecondaryPreferredChannel == objc_msgSend_localSecondaryPreferredChannel(v6, v17, v18, v19, v20))
      {
        localAssistedDiscoveryMetric = self->_localAssistedDiscoveryMetric;
        if (localAssistedDiscoveryMetric == objc_msgSend_localAssistedDiscoveryMetric(v6, v22, v23, v24, v25))
        {
          peerMACAddress = self->_peerMACAddress;
          objc_msgSend_peerMACAddress(v6, v27, v28, v29, v30);
          v36 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (peerMACAddress == v36)
            goto LABEL_13;
          if (!self->_peerMACAddress
            || (objc_msgSend_peerMACAddress(v6, v32, v33, v34, v35), (v37 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v47 = 0;
LABEL_23:

            goto LABEL_11;
          }
          v3 = (void *)v37;
          v42 = self->_peerMACAddress;
          objc_msgSend_peerMACAddress(v6, v38, v39, v40, v41);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v42, v43, (uint64_t)v4, v44, v45))
          {
LABEL_13:
            peerMasterChannel = self->_peerMasterChannel;
            if (peerMasterChannel == objc_msgSend_peerMasterChannel(v6, v32, v33, v34, v35)
              && (peerPreferredChannel = self->_peerPreferredChannel,
                  peerPreferredChannel == objc_msgSend_peerPreferredChannel(v6, v50, v51, v52, v53))
              && (peerSecondaryPreferredChannel = self->_peerSecondaryPreferredChannel,
                  peerSecondaryPreferredChannel == objc_msgSend_peerSecondaryPreferredChannel(v6, v55, v56, v57, v58))
              && (peerAssistedDiscoveryMetric = self->_peerAssistedDiscoveryMetric,
                  peerAssistedDiscoveryMetric == objc_msgSend_peerAssistedDiscoveryMetric(v6, v60, v61, v62, v63))
              && (peerSupportedChannelFlags = self->_peerSupportedChannelFlags,
                  peerSupportedChannelFlags == objc_msgSend_peerSupportedChannelFlags(v6, v65, v66, v67, v68))&& (followMode = self->_followMode, followMode == objc_msgSend_followMode(v6, v70, v71, v72, v73)))
            {
              followModePreferredBand = self->_followModePreferredBand;
              v46 = followModePreferredBand == objc_msgSend_followModePreferredBand(v6, v75, v76, v77, v78);
              v47 = v46;
            }
            else
            {
              v46 = 0;
              v47 = 0;
            }
            if (peerMACAddress == v36)
              goto LABEL_23;
          }
          else
          {
            v46 = 0;
          }

          v47 = v46;
          goto LABEL_23;
        }
      }
    }
  }
  v47 = 0;
LABEL_11:

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  CWFAWDLPeerAssistedDiscoveryParameters *v4;
  CWFAWDLPeerAssistedDiscoveryParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAWDLParameters;

  v4 = (CWFAWDLPeerAssistedDiscoveryParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAWDLParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAWDLParameters = objc_msgSend_isEqualToAWDLParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAWDLParameters = 0;
  }

  return isEqualToAWDLParameters;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  int8x16_t v7;
  int8x16_t v9;
  int8x16_t v10;

  v9 = *(int8x16_t *)&self->_localSecondaryPreferredChannel;
  v10 = *(int8x16_t *)&self->_localMasterChannel;
  v6 = objc_msgSend_hash(self->_peerMACAddress, a2, v2, v3, v4);
  v7 = veorq_s8(veorq_s8(v10, *(int8x16_t *)&self->_peerMasterChannel), veorq_s8(v9, *(int8x16_t *)&self->_peerSecondaryPreferredChannel));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) ^ self->_followModePreferredBand ^ self->_peerSupportedChannelFlags ^ self->_followMode ^ (unint64_t)v6;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAWDLPeerAssistedDiscoveryParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setLocalMasterChannel_(v11, v12, self->_localMasterChannel, v13, v14);
  objc_msgSend_setLocalPreferredChannel_(v11, v15, self->_localPreferredChannel, v16, v17);
  objc_msgSend_setLocalSecondaryPreferredChannel_(v11, v18, self->_localSecondaryPreferredChannel, v19, v20);
  objc_msgSend_setLocalAssistedDiscoveryMetric_(v11, v21, self->_localAssistedDiscoveryMetric, v22, v23);
  objc_msgSend_setPeerMACAddress_(v11, v24, (uint64_t)self->_peerMACAddress, v25, v26);
  objc_msgSend_setPeerMasterChannel_(v11, v27, self->_peerMasterChannel, v28, v29);
  objc_msgSend_setPeerPreferredChannel_(v11, v30, self->_peerPreferredChannel, v31, v32);
  objc_msgSend_setPeerSecondaryPreferredChannel_(v11, v33, self->_peerSecondaryPreferredChannel, v34, v35);
  objc_msgSend_setPeerAssistedDiscoveryMetric_(v11, v36, self->_peerAssistedDiscoveryMetric, v37, v38);
  objc_msgSend_setPeerSupportedChannelFlags_(v11, v39, self->_peerSupportedChannelFlags, v40, v41);
  objc_msgSend_setFollowMode_(v11, v42, self->_followMode, v43, v44);
  objc_msgSend_setFollowModePreferredBand_(v11, v45, self->_followModePreferredBand, v46, v47);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t localMasterChannel;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  id v66;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  localMasterChannel = self->_localMasterChannel;
  v6 = a3;
  objc_msgSend_numberWithUnsignedInteger_(v4, v7, localMasterChannel, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, (uint64_t)CFSTR("_localMasterChannel"), v12);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v13, self->_localPreferredChannel, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("_localPreferredChannel"), v18);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v19, self->_localSecondaryPreferredChannel, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v23, (uint64_t)v22, (uint64_t)CFSTR("_localSecondaryPreferredChannel"), v24);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v25, self->_localAssistedDiscoveryMetric, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v29, (uint64_t)v28, (uint64_t)CFSTR("_localAssistedDiscoveryMetric"), v30);

  objc_msgSend_encodeObject_forKey_(v6, v31, (uint64_t)self->_peerMACAddress, (uint64_t)CFSTR("_peerMACAddress"), v32);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v33, self->_peerMasterChannel, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v37, (uint64_t)v36, (uint64_t)CFSTR("_peerMasterChannel"), v38);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v39, self->_peerPreferredChannel, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v43, (uint64_t)v42, (uint64_t)CFSTR("_peerPreferredChannel"), v44);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v45, self->_peerSecondaryPreferredChannel, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v49, (uint64_t)v48, (uint64_t)CFSTR("_peerSecondaryPreferredChannel"), v50);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v51, self->_peerAssistedDiscoveryMetric, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v55, (uint64_t)v54, (uint64_t)CFSTR("_peerAssistedDiscoveryMetric"), v56);

  objc_msgSend_encodeInteger_forKey_(v6, v57, self->_peerSupportedChannelFlags, (uint64_t)CFSTR("_peerSupportedChannelFlags"), v58);
  objc_msgSend_encodeBool_forKey_(v6, v59, self->_followMode, (uint64_t)CFSTR("_followMode"), v60);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v61, self->_followModePreferredBand, v62, v63);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v64, (uint64_t)v66, (uint64_t)CFSTR("_followModePreferredBand"), v65);

}

- (CWFAWDLPeerAssistedDiscoveryParameters)initWithCoder:(id)a3
{
  id v4;
  CWFAWDLPeerAssistedDiscoveryParameters *v5;
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
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSString *peerMACAddress;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  objc_super v90;

  v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)CWFAWDLPeerAssistedDiscoveryParameters;
  v5 = -[CWFAWDLPeerAssistedDiscoveryParameters init](&v90, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_localMasterChannel"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localMasterChannel = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("_localPreferredChannel"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localPreferredChannel = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20, v21);

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("_localSecondaryPreferredChannel"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localSecondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28, v29);

    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("_localAssistedDiscoveryMetric"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_localAssistedDiscoveryMetric = objc_msgSend_unsignedIntegerValue(v33, v34, v35, v36, v37);

    v38 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, (uint64_t)CFSTR("_peerMACAddress"), v40);
    v41 = objc_claimAutoreleasedReturnValue();
    peerMACAddress = v5->_peerMACAddress;
    v5->_peerMACAddress = (NSString *)v41;

    v43 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, (uint64_t)CFSTR("_peerMasterChannel"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_peerMasterChannel = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("_peerPreferredChannel"), v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_peerPreferredChannel = objc_msgSend_unsignedIntegerValue(v54, v55, v56, v57, v58);

    v59 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, (uint64_t)CFSTR("_peerSecondaryPreferredChannel"), v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_peerSecondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65, v66);

    v67 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, (uint64_t)CFSTR("_peerAssistedDiscoveryMetric"), v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_peerAssistedDiscoveryMetric = objc_msgSend_unsignedIntegerValue(v70, v71, v72, v73, v74);

    v5->_peerSupportedChannelFlags = objc_msgSend_decodeIntegerForKey_(v4, v75, (uint64_t)CFSTR("_peerSupportedChannelFlags"), v76, v77);
    v5->_followMode = objc_msgSend_decodeBoolForKey_(v4, v78, (uint64_t)CFSTR("_followMode"), v79, v80);
    v81 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, (uint64_t)CFSTR("_followModePreferredBand"), v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_followModePreferredBand = objc_msgSend_unsignedIntegerValue(v84, v85, v86, v87, v88);

  }
  return v5;
}

- (unint64_t)localMasterChannel
{
  return self->_localMasterChannel;
}

- (void)setLocalMasterChannel:(unint64_t)a3
{
  self->_localMasterChannel = a3;
}

- (unint64_t)localPreferredChannel
{
  return self->_localPreferredChannel;
}

- (void)setLocalPreferredChannel:(unint64_t)a3
{
  self->_localPreferredChannel = a3;
}

- (unint64_t)localSecondaryPreferredChannel
{
  return self->_localSecondaryPreferredChannel;
}

- (void)setLocalSecondaryPreferredChannel:(unint64_t)a3
{
  self->_localSecondaryPreferredChannel = a3;
}

- (unint64_t)localAssistedDiscoveryMetric
{
  return self->_localAssistedDiscoveryMetric;
}

- (void)setLocalAssistedDiscoveryMetric:(unint64_t)a3
{
  self->_localAssistedDiscoveryMetric = a3;
}

- (NSString)peerMACAddress
{
  return self->_peerMACAddress;
}

- (void)setPeerMACAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (void)setPeerMasterChannel:(unint64_t)a3
{
  self->_peerMasterChannel = a3;
}

- (unint64_t)peerPreferredChannel
{
  return self->_peerPreferredChannel;
}

- (void)setPeerPreferredChannel:(unint64_t)a3
{
  self->_peerPreferredChannel = a3;
}

- (unint64_t)peerSecondaryPreferredChannel
{
  return self->_peerSecondaryPreferredChannel;
}

- (void)setPeerSecondaryPreferredChannel:(unint64_t)a3
{
  self->_peerSecondaryPreferredChannel = a3;
}

- (unint64_t)peerAssistedDiscoveryMetric
{
  return self->_peerAssistedDiscoveryMetric;
}

- (void)setPeerAssistedDiscoveryMetric:(unint64_t)a3
{
  self->_peerAssistedDiscoveryMetric = a3;
}

- (int)peerSupportedChannelFlags
{
  return self->_peerSupportedChannelFlags;
}

- (void)setPeerSupportedChannelFlags:(int)a3
{
  self->_peerSupportedChannelFlags = a3;
}

- (BOOL)followMode
{
  return self->_followMode;
}

- (void)setFollowMode:(BOOL)a3
{
  self->_followMode = a3;
}

- (unint64_t)followModePreferredBand
{
  return self->_followModePreferredBand;
}

- (void)setFollowModePreferredBand:(unint64_t)a3
{
  self->_followModePreferredBand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerMACAddress, 0);
}

@end
