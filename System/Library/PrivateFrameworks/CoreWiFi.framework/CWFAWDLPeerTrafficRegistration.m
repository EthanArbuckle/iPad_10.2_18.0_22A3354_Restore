@implementation CWFAWDLPeerTrafficRegistration

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("serviceName=%@, sessionFlags=0x%x, active=%d, desiredBandwidth=%lu, desiredLatency=%lu, preferredChannel=%ld, secondaryPreferredChannel=%ld, peerContextList=%@"), v2, v3, self->_serviceName, self->_sessionFlags, self->_active, self->_desiredBandwidth, self->_desiredLatency, self->_preferredChannel, self->_secondaryPreferredChannel, self->_peerContextList);
}

- (BOOL)isEqualToAWDLPeerTrafficRegistration:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSString *serviceName;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  BOOL v27;
  int sessionFlags;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int active;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t desiredBandwidth;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t desiredLatency;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t preferredChannel;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t secondaryPreferredChannel;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *peerContextList;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  NSArray *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;

  v6 = a3;
  serviceName = self->_serviceName;
  objc_msgSend_serviceName(v6, v8, v9, v10, v11);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (serviceName != v16)
  {
    if (!self->_serviceName
      || (objc_msgSend_serviceName(v6, v12, v13, v14, v15), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = 0;
      goto LABEL_22;
    }
    v3 = (void *)v17;
    v22 = self->_serviceName;
    objc_msgSend_serviceName(v6, v18, v19, v20, v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      isEqual = 0;
LABEL_21:

      v27 = isEqual;
      goto LABEL_22;
    }
  }
  sessionFlags = self->_sessionFlags;
  if (sessionFlags == objc_msgSend_sessionFlags(v6, v12, v13, v14, v15))
  {
    active = self->_active;
    if (active == objc_msgSend_isActive(v6, v29, v30, v31, v32))
    {
      desiredBandwidth = self->_desiredBandwidth;
      if (desiredBandwidth == objc_msgSend_desiredBandwidth(v6, v34, v35, v36, v37))
      {
        desiredLatency = self->_desiredLatency;
        if (desiredLatency == objc_msgSend_desiredLatency(v6, v39, v40, v41, v42))
        {
          preferredChannel = self->_preferredChannel;
          if (preferredChannel == objc_msgSend_preferredChannel(v6, v44, v45, v46, v47))
          {
            secondaryPreferredChannel = self->_secondaryPreferredChannel;
            if (secondaryPreferredChannel == objc_msgSend_secondaryPreferredChannel(v6, v49, v50, v51, v52))
            {
              peerContextList = self->_peerContextList;
              objc_msgSend_peerContextList(v6, v54, v55, v56, v57);
              v63 = (NSArray *)objc_claimAutoreleasedReturnValue();
              isEqual = peerContextList == v63;
              if (isEqual || !self->_peerContextList)
                goto LABEL_17;
              objc_msgSend_peerContextList(v6, v59, v60, v61, v62);
              v64 = objc_claimAutoreleasedReturnValue();
              if (v64)
              {
                v69 = (void *)v64;
                v70 = self->_peerContextList;
                objc_msgSend_peerContextList(v6, v65, v66, v67, v68);
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                isEqual = objc_msgSend_isEqual_(v70, v72, (uint64_t)v71, v73, v74);

LABEL_17:
                v27 = isEqual;
                goto LABEL_20;
              }

            }
          }
        }
      }
    }
  }
  isEqual = 0;
  v27 = 0;
LABEL_20:
  if (serviceName != v16)
    goto LABEL_21;
LABEL_22:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  CWFAWDLPeerTrafficRegistration *v4;
  CWFAWDLPeerTrafficRegistration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAWDLPeerTrafficRegistration;

  v4 = (CWFAWDLPeerTrafficRegistration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAWDLPeerTrafficRegistration = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAWDLPeerTrafficRegistration = objc_msgSend_isEqualToAWDLPeerTrafficRegistration_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAWDLPeerTrafficRegistration = 0;
  }

  return isEqualToAWDLPeerTrafficRegistration;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t sessionFlags;
  _BOOL8 active;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int8x16_t v14;
  int8x16_t v16;
  int8x16_t v17;

  v6 = objc_msgSend_hash(self->_serviceName, a2, v2, v3, v4);
  sessionFlags = self->_sessionFlags;
  active = self->_active;
  v16 = *(int8x16_t *)&self->_desiredBandwidth;
  v17 = *(int8x16_t *)&self->_preferredChannel;
  v13 = objc_msgSend_hash(self->_peerContextList, v9, v10, v11, v12);
  v14 = veorq_s8(v16, v17);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) ^ v13 ^ v6 ^ active ^ sessionFlags;
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAWDLPeerTrafficRegistration, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setServiceName_(v11, v12, (uint64_t)self->_serviceName, v13, v14);
  objc_msgSend_setActive_(v11, v15, self->_active, v16, v17);
  objc_msgSend_setSessionFlags_(v11, v18, self->_sessionFlags, v19, v20);
  objc_msgSend_setDesiredBandwidth_(v11, v21, self->_desiredBandwidth, v22, v23);
  objc_msgSend_setDesiredLatency_(v11, v24, self->_desiredLatency, v25, v26);
  objc_msgSend_setPreferredChannel_(v11, v27, self->_preferredChannel, v28, v29);
  objc_msgSend_setSecondaryPreferredChannel_(v11, v30, self->_secondaryPreferredChannel, v31, v32);
  objc_msgSend_setPeerContextList_(v11, v33, (uint64_t)self->_peerContextList, v34, v35);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceName;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  id v37;

  serviceName = self->_serviceName;
  v37 = a3;
  objc_msgSend_encodeObject_forKey_(v37, v5, (uint64_t)serviceName, (uint64_t)CFSTR("_serviceName"), v6);
  objc_msgSend_encodeBool_forKey_(v37, v7, self->_active, (uint64_t)CFSTR("_active"), v8);
  objc_msgSend_encodeInteger_forKey_(v37, v9, self->_sessionFlags, (uint64_t)CFSTR("_sessionFlags"), v10);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v11, self->_desiredBandwidth, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v15, (uint64_t)v14, (uint64_t)CFSTR("_desiredBandwidth"), v16);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v17, self->_desiredLatency, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v21, (uint64_t)v20, (uint64_t)CFSTR("_desiredLatency"), v22);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v23, self->_preferredChannel, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v27, (uint64_t)v26, (uint64_t)CFSTR("_preferredChannel"), v28);

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v29, self->_secondaryPreferredChannel, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v37, v33, (uint64_t)v32, (uint64_t)CFSTR("_secondaryPreferredChannel"), v34);

  objc_msgSend_encodeObject_forKey_(v37, v35, (uint64_t)self->_peerContextList, (uint64_t)CFSTR("_peerContextList"), v36);
}

- (CWFAWDLPeerTrafficRegistration)initWithCoder:(id)a3
{
  id v4;
  CWFAWDLPeerTrafficRegistration *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *serviceName;
  const char *v11;
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
  uint64_t v25;
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
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  NSArray *peerContextList;
  objc_super v61;

  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CWFAWDLPeerTrafficRegistration;
  v5 = -[CWFAWDLPeerTrafficRegistration init](&v61, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_serviceName"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v9;

    v5->_active = objc_msgSend_decodeBoolForKey_(v4, v11, (uint64_t)CFSTR("_active"), v12, v13);
    v5->_sessionFlags = objc_msgSend_decodeIntegerForKey_(v4, v14, (uint64_t)CFSTR("_sessionFlags"), v15, v16);
    v17 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("_desiredBandwidth"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_desiredBandwidth = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("_desiredLatency"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_desiredLatency = objc_msgSend_unsignedIntegerValue(v28, v29, v30, v31, v32);

    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("_preferredChannel"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preferredChannel = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39, v40);

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("_secondaryPreferredChannel"), v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_secondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47, v48);

    v49 = (void *)MEMORY[0x1E0C99E60];
    v50 = objc_opt_class();
    v51 = objc_opt_class();
    objc_msgSend_setWithObjects_(v49, v52, v50, v53, v54, v51, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v56, (uint64_t)v55, (uint64_t)CFSTR("_peerContextList"), v57);
    v58 = objc_claimAutoreleasedReturnValue();
    peerContextList = v5->_peerContextList;
    v5->_peerContextList = (NSArray *)v58;

  }
  return v5;
}

- (id)serializedRegistrationInfo
{
  uint64_t v2;
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
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t isActive;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
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
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
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
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  ether_addr *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceName(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v12, (uint64_t)v11, (uint64_t)CFSTR("TR_SRV_NAME"), v13);

  v14 = (void *)MEMORY[0x1E0CB37E8];
  isActive = objc_msgSend_isActive(self, v15, v16, v17, v18);
  objc_msgSend_numberWithBool_(v14, v20, isActive, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v24, (uint64_t)v23, (uint64_t)CFSTR("TR_ACTIVE"), v25);

  v26 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend_sessionFlags(self, v27, v28, v29, v30);
  objc_msgSend_numberWithUnsignedInt_(v26, v32, v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v36, (uint64_t)v35, (uint64_t)CFSTR("TR_SESSION_FLAGS"), v37);

  v38 = (void *)MEMORY[0x1E0CB37E8];
  v43 = objc_msgSend_desiredBandwidth(self, v39, v40, v41, v42);
  objc_msgSend_numberWithUnsignedInteger_(v38, v44, v43, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v48, (uint64_t)v47, (uint64_t)CFSTR("TR_DESIRED_BW"), v49);

  v50 = (void *)MEMORY[0x1E0CB37E8];
  v55 = objc_msgSend_desiredLatency(self, v51, v52, v53, v54);
  objc_msgSend_numberWithUnsignedInteger_(v50, v56, v55, v57, v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v60, (uint64_t)v59, (uint64_t)CFSTR("TR_DESIRED_LATENCY"), v61);

  v62 = (void *)MEMORY[0x1E0CB37E8];
  v67 = objc_msgSend_preferredChannel(self, v63, v64, v65, v66);
  objc_msgSend_numberWithUnsignedInteger_(v62, v68, v67, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v6, v72, (uint64_t)v71, (uint64_t)CFSTR("AWDL_TR_CHANNEL"), v73);

  v74 = (void *)MEMORY[0x1E0CB37E8];
  v79 = objc_msgSend_secondaryPreferredChannel(self, v75, v76, v77, v78);
  objc_msgSend_numberWithUnsignedInteger_(v74, v80, v79, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v6;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v84, (uint64_t)v83, (uint64_t)CFSTR("AWDL_TR_SEC_CHANNEL"), v85);

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  objc_msgSend_peerContextList(self, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v141, (uint64_t)v145, 16);
  if (v97)
  {
    v102 = v97;
    v103 = *(_QWORD *)v142;
    do
    {
      v104 = 0;
      do
      {
        if (*(_QWORD *)v142 != v103)
          objc_enumerationMutation(v95);
        v105 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v104);
        objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v98, v99, v100, v101);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_MACAddress(v105, v107, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        if (v111)
        {
          objc_msgSend_MACAddress(v105, v112, v113, v114, v115);
          v116 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v121 = (const char *)objc_msgSend_UTF8String(v116, v117, v118, v119, v120);
          v122 = ether_aton(v121);

          if (v122)
          {
            objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v112, (uint64_t)v122, 6, v115);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v106, v124, (uint64_t)v123, (uint64_t)CFSTR("TR_PEER_ADDRESS"), v125);

          }
        }
        objc_msgSend_interfaceName(v105, v112, v113, v114, v115);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v106, v127, (uint64_t)v126, (uint64_t)CFSTR("TR_IFNAME"), v128);

        objc_msgSend_addObject_(v90, v129, (uint64_t)v106, v130, v131);
        ++v104;
      }
      while (v102 != v104);
      v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v141, (uint64_t)v145, 16);
    }
    while (v102);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v140, v132, (uint64_t)v90, (uint64_t)CFSTR("TR_PEER_CONTEXTS"), v133);
  v138 = (void *)objc_msgSend_copy(v140, v134, v135, v136, v137);

  return v138;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(int)a3
{
  self->_sessionFlags = a3;
}

- (unint64_t)desiredBandwidth
{
  return self->_desiredBandwidth;
}

- (void)setDesiredBandwidth:(unint64_t)a3
{
  self->_desiredBandwidth = a3;
}

- (unint64_t)desiredLatency
{
  return self->_desiredLatency;
}

- (void)setDesiredLatency:(unint64_t)a3
{
  self->_desiredLatency = a3;
}

- (unint64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(unint64_t)a3
{
  self->_preferredChannel = a3;
}

- (unint64_t)secondaryPreferredChannel
{
  return self->_secondaryPreferredChannel;
}

- (void)setSecondaryPreferredChannel:(unint64_t)a3
{
  self->_secondaryPreferredChannel = a3;
}

- (NSArray)peerContextList
{
  return self->_peerContextList;
}

- (void)setPeerContextList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerContextList, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
