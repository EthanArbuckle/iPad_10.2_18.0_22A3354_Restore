@implementation CWFHostAPConfiguration

- (id)description
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_SSID(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHumanReadableStringFromData(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_hasPrefix_(v12, v13, (uint64_t)CFSTR(" "), v14, v15) & 1) != 0
    || objc_msgSend_hasSuffix_(v12, v16, (uint64_t)CFSTR(" "), v17, v18))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("'%@'"), v17, v18, v12);
    v19 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v19;
  }
  objc_msgSend_appendFormat_(v6, v16, (uint64_t)CFSTR("%@ - "), v17, v18, v12);
  objc_msgSend_SSID(self, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR("ssid=%@, "), v31, v32, v29);

  v37 = objc_msgSend_securityType(self, v33, v34, v35, v36);
  sub_1B06248F4(v37, 0, 0, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v41, (uint64_t)CFSTR("security=%@, "), v42, v43, v40);

  objc_msgSend_channel(self, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v49, (uint64_t)CFSTR("channel=[%@], "), v50, v51, v48);

  objc_msgSend_password(self, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v57, (uint64_t)CFSTR("hasPassword=%d, "), v58, v59, v56 != 0);

  if (objc_msgSend_PHYMode(self, v60, v61, v62, v63))
  {
    v68 = objc_msgSend_PHYMode(self, v64, v65, v66, v67);
    sub_1B0625874(v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v74, (uint64_t)CFSTR("phy=%@, "), v75, v76, v73);

  }
  if (objc_msgSend_forceHiddenMode(self, v64, v65, v66, v67))
  {
    v81 = objc_msgSend_forceHiddenMode(self, v77, v78, v79, v80);
    objc_msgSend_appendFormat_(v6, v82, (uint64_t)CFSTR("forceHidden=%d, "), v83, v84, v81);
  }
  if (objc_msgSend_forceBeaconInterval100ms(self, v77, v78, v79, v80))
  {
    v89 = objc_msgSend_forceBeaconInterval100ms(self, v85, v86, v87, v88);
    objc_msgSend_appendFormat_(v6, v90, (uint64_t)CFSTR("forceBI100=%d, "), v91, v92, v89);
  }
  if (objc_msgSend_bridgeMode(self, v85, v86, v87, v88)
    || objc_msgSend_bridgeType(self, v93, v94, v95, v96)
    || (objc_msgSend_bridgeInterfaceName(self, v93, v94, v95, v96),
        v97 = (void *)objc_claimAutoreleasedReturnValue(),
        v97,
        v97))
  {
    v98 = objc_msgSend_bridgeMode(self, v93, v94, v95, v96);
    v103 = objc_msgSend_bridgeType(self, v99, v100, v101, v102);
    objc_msgSend_bridgeInterfaceName(self, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v109, (uint64_t)CFSTR("bridge=[mode=%d, type=%d, intf=%@], "), v110, v111, v98, v103, v108);

  }
  objc_msgSend_IEList(self, v93, v94, v95, v96);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  CWFHexadecimalStringFromData(v112, v113, v114, v115, v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v118, (uint64_t)CFSTR("IEList=%@"), v119, v120, v117);

  return v6;
}

- (BOOL)isEqualToHostAPConfiguration:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  NSData *SSID;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSData *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char isEqual;
  unint64_t securityType;
  CWFChannel *channel;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CWFChannel *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CWFChannel *v48;
  uint64_t v49;
  CWFChannel *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSString *password;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSString *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSString *v66;
  uint64_t v67;
  NSString *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  int PHYMode;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int forceHiddenMode;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int forceBeaconInterval100ms;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int bridgeMode;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int bridgeType;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSString *bridgeInterfaceName;
  NSString *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *IEList;
  uint64_t v109;
  NSString *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSData *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  NSString *v134;
  NSString *v135;
  NSString *v136;
  void *v137;
  void *v138;
  void *v139;
  NSString *v140;
  void *v141;

  v6 = a3;
  SSID = self->_SSID;
  objc_msgSend_SSID(v6, v8, v9, v10, v11);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (SSID == v16)
  {
    securityType = self->_securityType;
    if (securityType == objc_msgSend_securityType(v6, v12, v13, v14, v15))
      goto LABEL_8;
LABEL_13:
    isEqual = 0;
    goto LABEL_46;
  }
  if (!self->_SSID)
    goto LABEL_13;
  objc_msgSend_SSID(v6, v12, v13, v14, v15);
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_13;
  v3 = (void *)v17;
  v22 = self->_SSID;
  objc_msgSend_SSID(v6, v18, v19, v20, v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25) & 1) == 0
    || (v30 = self->_securityType, v30 != objc_msgSend_securityType(v6, v26, v27, v28, v29)))
  {
    isEqual = 0;
LABEL_45:

    goto LABEL_46;
  }
LABEL_8:
  channel = self->_channel;
  objc_msgSend_channel(v6, v31, v32, v33, v34);
  v42 = (CWFChannel *)objc_claimAutoreleasedReturnValue();
  if (channel == v42)
  {
LABEL_14:
    password = self->_password;
    objc_msgSend_password(v6, v38, v39, v40, v41);
    v60 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (password == v60)
    {
      v140 = password;
      goto LABEL_22;
    }
    if (!self->_password
      || (objc_msgSend_password(v6, v56, v57, v58, v59), (v61 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
LABEL_35:

      if (channel != v42)
      {

      }
      goto LABEL_37;
    }
    v140 = password;
    v138 = (void *)v61;
    v66 = self->_password;
    objc_msgSend_password(v6, v62, v63, v64, v65);
    v67 = objc_claimAutoreleasedReturnValue();
    v68 = v66;
    v69 = (void *)v67;
    if ((objc_msgSend_isEqual_(v68, v70, v67, v71, v72) & 1) != 0)
    {
      v137 = v69;
LABEL_22:
      PHYMode = self->_PHYMode;
      if (PHYMode != objc_msgSend_PHYMode(v6, v56, v57, v58, v59)
        || (forceHiddenMode = self->_forceHiddenMode,
            forceHiddenMode != objc_msgSend_forceHiddenMode(v6, v74, v75, v76, v77))
        || (forceBeaconInterval100ms = self->_forceBeaconInterval100ms,
            forceBeaconInterval100ms != objc_msgSend_forceBeaconInterval100ms(v6, v79, v80, v81, v82))
        || (bridgeMode = self->_bridgeMode, bridgeMode != objc_msgSend_bridgeMode(v6, v84, v85, v86, v87))
        || (bridgeType = self->_bridgeType, bridgeType != objc_msgSend_bridgeType(v6, v89, v90, v91, v92)))
      {
        LOBYTE(IEList) = 0;
        isEqual = 0;
        goto LABEL_33;
      }
      bridgeInterfaceName = self->_bridgeInterfaceName;
      objc_msgSend_bridgeInterfaceName(v6, v94, v95, v96, v97);
      v99 = (NSString *)objc_claimAutoreleasedReturnValue();
      v136 = v99;
      if (bridgeInterfaceName == v99)
      {
        v135 = bridgeInterfaceName;
      }
      else
      {
        if (!self->_bridgeInterfaceName)
        {
LABEL_59:
          LOBYTE(IEList) = 0;
          goto LABEL_60;
        }
        v135 = bridgeInterfaceName;
        objc_msgSend_bridgeInterfaceName(v6, v100, v101, v102, v103);
        IEList = (void *)objc_claimAutoreleasedReturnValue();
        if (!IEList)
        {
LABEL_56:

LABEL_61:
          isEqual = (char)IEList;
LABEL_33:
          if (v140 != v60)
          {

            isEqual = (char)IEList;
          }
          goto LABEL_35;
        }
        v134 = self->_bridgeInterfaceName;
        objc_msgSend_bridgeInterfaceName(v6, v104, v105, v106, v107);
        v109 = objc_claimAutoreleasedReturnValue();
        v110 = v134;
        v133 = (void *)v109;
        if ((objc_msgSend_isEqual_(v110, v111, v109, v112, v113) & 1) == 0)
        {

          isEqual = 0;
          goto LABEL_63;
        }
        v132 = IEList;
      }
      IEList = self->_IEList;
      objc_msgSend_IEList(v6, v100, v101, v102, v103);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(IEList) = IEList == v115;
      if ((_BYTE)IEList || !self->_IEList)
      {

        v99 = v136;
        if (v135 == v136)
        {
LABEL_60:

          goto LABEL_61;
        }
      }
      else
      {
        v131 = v115;
        objc_msgSend_IEList(v6, v116, v117, v118, v119);
        v120 = objc_claimAutoreleasedReturnValue();
        if (v120)
        {
          v125 = self->_IEList;
          v130 = (void *)v120;
          objc_msgSend_IEList(v6, v121, v122, v123, v124);
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v125, v127, (uint64_t)v126, v128, v129);

          if (v135 == v136)
          {

          }
          else
          {

          }
LABEL_63:
          if (v140 != v60)
          {

          }
          goto LABEL_35;
        }

        v99 = v136;
        if (v135 == v136)
          goto LABEL_59;
      }

      goto LABEL_56;
    }

    if (channel == v42)
    {

      goto LABEL_43;
    }

    goto LABEL_41;
  }
  if (!self->_channel)
  {
    isEqual = 0;
LABEL_37:

    goto LABEL_44;
  }
  objc_msgSend_channel(v6, v38, v39, v40, v41);
  v43 = objc_claimAutoreleasedReturnValue();
  if (!v43)
    goto LABEL_42;
  v141 = (void *)v43;
  v48 = self->_channel;
  objc_msgSend_channel(v6, v44, v45, v46, v47);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v48;
  v51 = (void *)v49;
  if ((objc_msgSend_isEqual_(v50, v52, v49, v53, v54) & 1) != 0)
  {
    v139 = v51;
    goto LABEL_14;
  }

LABEL_41:
LABEL_42:

LABEL_43:
  isEqual = 0;
LABEL_44:
  if (SSID != v16)
    goto LABEL_45;
LABEL_46:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFHostAPConfiguration *v4;
  CWFHostAPConfiguration *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToHostAPConfiguration;

  v4 = (CWFHostAPConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToHostAPConfiguration = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToHostAPConfiguration = objc_msgSend_isEqualToHostAPConfiguration_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToHostAPConfiguration = 0;
  }

  return isEqualToHostAPConfiguration;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t bridgeType;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = self->_securityType ^ objc_msgSend_hash(self->_SSID, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_channel, v7, v8, v9, v10);
  v16 = v6 ^ v11 ^ objc_msgSend_hash(self->_password, v12, v13, v14, v15) ^ self->_PHYMode ^ (unint64_t)self->_forceHiddenMode ^ self->_forceBeaconInterval100ms ^ self->_bridgeMode;
  bridgeType = self->_bridgeType;
  v22 = bridgeType ^ objc_msgSend_hash(self->_bridgeInterfaceName, v18, v19, v20, v21);
  return v16 ^ v22 ^ objc_msgSend_hash(self->_IEList, v23, v24, v25, v26);
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFHostAPConfiguration, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setSSID_(v11, v12, (uint64_t)self->_SSID, v13, v14);
  objc_msgSend_setSecurityType_(v11, v15, self->_securityType, v16, v17);
  objc_msgSend_setChannel_(v11, v18, (uint64_t)self->_channel, v19, v20);
  objc_msgSend_setPassword_(v11, v21, (uint64_t)self->_password, v22, v23);
  objc_msgSend_setPHYMode_(v11, v24, self->_PHYMode, v25, v26);
  objc_msgSend_setForceHiddenMode_(v11, v27, self->_forceHiddenMode, v28, v29);
  objc_msgSend_setForceBeaconInterval100ms_(v11, v30, self->_forceBeaconInterval100ms, v31, v32);
  objc_msgSend_setBridgeMode_(v11, v33, self->_bridgeMode, v34, v35);
  objc_msgSend_setBridgeType_(v11, v36, self->_bridgeType, v37, v38);
  objc_msgSend_setBridgeInterfaceName_(v11, v39, (uint64_t)self->_bridgeInterfaceName, v40, v41);
  objc_msgSend_setIEList_(v11, v42, (uint64_t)self->_IEList, v43, v44);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *SSID;
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
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;

  SSID = self->_SSID;
  v27 = a3;
  objc_msgSend_encodeObject_forKey_(v27, v5, (uint64_t)SSID, (uint64_t)CFSTR("_SSID"), v6);
  objc_msgSend_encodeInteger_forKey_(v27, v7, self->_securityType, (uint64_t)CFSTR("_securityType"), v8);
  objc_msgSend_encodeObject_forKey_(v27, v9, (uint64_t)self->_channel, (uint64_t)CFSTR("_channel"), v10);
  objc_msgSend_encodeObject_forKey_(v27, v11, (uint64_t)self->_password, (uint64_t)CFSTR("_password"), v12);
  objc_msgSend_encodeInteger_forKey_(v27, v13, self->_PHYMode, (uint64_t)CFSTR("_PHYMode"), v14);
  objc_msgSend_encodeBool_forKey_(v27, v15, self->_forceHiddenMode, (uint64_t)CFSTR("_forceHiddenMode"), v16);
  objc_msgSend_encodeBool_forKey_(v27, v17, self->_forceBeaconInterval100ms, (uint64_t)CFSTR("_forceBeaconInterval100ms"), v18);
  objc_msgSend_encodeInteger_forKey_(v27, v19, self->_bridgeMode, (uint64_t)CFSTR("_bridgeMode"), v20);
  objc_msgSend_encodeInteger_forKey_(v27, v21, self->_bridgeType, (uint64_t)CFSTR("_bridgeType"), v22);
  objc_msgSend_encodeObject_forKey_(v27, v23, (uint64_t)self->_bridgeInterfaceName, (uint64_t)CFSTR("_bridgeInterfaceName"), v24);
  objc_msgSend_encodeObject_forKey_(v27, v25, (uint64_t)self->_IEList, (uint64_t)CFSTR("_IEList"), v26);

}

- (CWFHostAPConfiguration)initWithCoder:(id)a3
{
  id v4;
  CWFHostAPConfiguration *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSData *SSID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CWFChannel *channel;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSString *password;
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
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSString *bridgeInterfaceName;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSData *IEList;
  objc_super v50;

  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)CWFHostAPConfiguration;
  v5 = -[CWFHostAPConfiguration init](&v50, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_SSID"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    SSID = v5->_SSID;
    v5->_SSID = (NSData *)v9;

    v5->_securityType = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("_securityType"), v12, v13);
    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("_channel"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v17;

    v19 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, (uint64_t)CFSTR("_password"), v21);
    v22 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v22;

    v5->_PHYMode = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("_PHYMode"), v25, v26);
    v5->_forceHiddenMode = objc_msgSend_decodeBoolForKey_(v4, v27, (uint64_t)CFSTR("_forceHiddenMode"), v28, v29);
    v5->_forceBeaconInterval100ms = objc_msgSend_decodeBoolForKey_(v4, v30, (uint64_t)CFSTR("_forceBeaconInterval100ms"), v31, v32);
    v5->_bridgeMode = objc_msgSend_decodeIntegerForKey_(v4, v33, (uint64_t)CFSTR("_bridgeMode"), v34, v35);
    v5->_bridgeType = objc_msgSend_decodeIntegerForKey_(v4, v36, (uint64_t)CFSTR("_bridgeType"), v37, v38);
    v39 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, (uint64_t)CFSTR("_bridgeInterfaceName"), v41);
    v42 = objc_claimAutoreleasedReturnValue();
    bridgeInterfaceName = v5->_bridgeInterfaceName;
    v5->_bridgeInterfaceName = (NSString *)v42;

    v44 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v45, v44, (uint64_t)CFSTR("_IEList"), v46);
    v47 = objc_claimAutoreleasedReturnValue();
    IEList = v5->_IEList;
    v5->_IEList = (NSData *)v47;

  }
  return v5;
}

- (NSData)SSID
{
  return self->_SSID;
}

- (void)setSSID:(id)a3
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

- (unint64_t)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(unint64_t)a3
{
  self->_securityType = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)PHYMode
{
  return self->_PHYMode;
}

- (void)setPHYMode:(int)a3
{
  self->_PHYMode = a3;
}

- (NSData)IEList
{
  return self->_IEList;
}

- (void)setIEList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)forceHiddenMode
{
  return self->_forceHiddenMode;
}

- (void)setForceHiddenMode:(BOOL)a3
{
  self->_forceHiddenMode = a3;
}

- (BOOL)forceBeaconInterval100ms
{
  return self->_forceBeaconInterval100ms;
}

- (void)setForceBeaconInterval100ms:(BOOL)a3
{
  self->_forceBeaconInterval100ms = a3;
}

- (int)bridgeMode
{
  return self->_bridgeMode;
}

- (void)setBridgeMode:(int)a3
{
  self->_bridgeMode = a3;
}

- (int)bridgeType
{
  return self->_bridgeType;
}

- (void)setBridgeType:(int)a3
{
  self->_bridgeType = a3;
}

- (NSString)bridgeInterfaceName
{
  return self->_bridgeInterfaceName;
}

- (void)setBridgeInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeInterfaceName, 0);
  objc_storeStrong((id *)&self->_IEList, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_SSID, 0);
}

@end
