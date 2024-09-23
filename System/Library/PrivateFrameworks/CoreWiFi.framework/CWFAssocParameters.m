@implementation CWFAssocParameters

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

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v7, (uint64_t)CFSTR("scanResult=%@, profile=%@, hasPassword=%d, eap=%@, remember=%d, forceBSSID=%d, bandPref=%ld, colocatedScopeID=%@"), v8, v9, self->_scanResult, self->_knownNetworkProfile, self->_password != 0, self->_EAPCredentials, self->_rememberUponSuccessfulAssociation, self->_forceBSSID, self->_bandPreference, self->_colocatedScopeID);
  objc_msgSend_appendFormat_(v6, v10, (uint64_t)CFSTR("has6GHzOnlyBSS=%d"), v11, v12, self->_has6GHzOnlyBSS);
  return v6;
}

- (BOOL)isEqualToAssocParameters:(id)a3
{
  void *v3;
  id v5;
  CWFScanResult *scanResult;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CWFScanResult *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CWFScanResult *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isEqual;
  CWFNetworkProfile *knownNetworkProfile;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CWFNetworkProfile *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  CWFNetworkProfile *v39;
  uint64_t v40;
  CWFNetworkProfile *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSString *password;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSString *v58;
  uint64_t v59;
  NSString *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  CWFEAPCredentials *EAPCredentials;
  CWFEAPCredentials *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CWFEAPCredentials *v76;
  uint64_t v77;
  CWFEAPCredentials *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSString *v83;
  int rememberUponSuccessfulAssociation;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int forceBSSID;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t bandPreference;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int has6GHzOnlyBSS;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSString *colocatedScopeID;
  NSString *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  NSString *v110;
  BOOL v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSString *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  CWFEAPCredentials *v128;
  void *v129;
  void *v130;
  CWFEAPCredentials *v131;
  void *v132;
  NSString *v133;
  void *v134;

  v5 = a3;
  scanResult = self->_scanResult;
  objc_msgSend_scanResult(v5, v7, v8, v9, v10);
  v15 = (CWFScanResult *)objc_claimAutoreleasedReturnValue();
  if (scanResult != v15)
  {
    if (!self->_scanResult
      || (objc_msgSend_scanResult(v5, v11, v12, v13, v14), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      isEqual = 0;
      goto LABEL_68;
    }
    v3 = (void *)v16;
    v21 = self->_scanResult;
    objc_msgSend_scanResult(v5, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      isEqual = 0;
LABEL_67:

      goto LABEL_68;
    }
    v134 = v22;
  }
  knownNetworkProfile = self->_knownNetworkProfile;
  objc_msgSend_knownNetworkProfile(v5, v11, v12, v13, v14);
  v32 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
  if (knownNetworkProfile != v32)
  {
    if (!self->_knownNetworkProfile)
    {
      isEqual = 0;
      goto LABEL_66;
    }
    objc_msgSend_knownNetworkProfile(v5, v28, v29, v30, v31);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      goto LABEL_40;
    v38 = (void *)v33;
    v39 = self->_knownNetworkProfile;
    objc_msgSend_knownNetworkProfile(v5, v34, v35, v36, v37);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v39;
    v42 = (void *)v40;
    if ((objc_msgSend_isEqual_(v41, v43, v40, v44, v45) & 1) == 0)
    {

      goto LABEL_40;
    }
    v130 = v42;
    v132 = v38;
  }
  password = self->_password;
  objc_msgSend_password(v5, v28, v29, v30, v31);
  v47 = objc_claimAutoreleasedReturnValue();
  v52 = (void *)v47;
  if (password == (NSString *)v47)
  {
    v133 = (NSString *)v47;
    v64 = v3;
LABEL_20:
    EAPCredentials = self->_EAPCredentials;
    objc_msgSend_EAPCredentials(v5, v48, v49, v50, v51);
    v66 = (CWFEAPCredentials *)objc_claimAutoreleasedReturnValue();
    v128 = EAPCredentials;
    v129 = v52;
    v131 = v66;
    if (EAPCredentials == v66)
    {
      v3 = v64;
      v83 = password;
    }
    else
    {
      if (!self->_EAPCredentials)
      {
        isEqual = 0;
        v3 = v64;
        v83 = password;
        goto LABEL_61;
      }
      objc_msgSend_EAPCredentials(v5, v67, v68, v69, v70);
      v71 = objc_claimAutoreleasedReturnValue();
      v3 = v64;
      if (!v71)
      {
        v111 = 0;
        v83 = password;
LABEL_60:

        isEqual = v111;
        goto LABEL_62;
      }
      v126 = (void *)v71;
      v76 = self->_EAPCredentials;
      objc_msgSend_EAPCredentials(v5, v72, v73, v74, v75);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = v76;
      v79 = (void *)v77;
      v83 = password;
      if ((objc_msgSend_isEqual_(v78, v80, v77, v81, v82) & 1) == 0)
      {

        isEqual = 0;
LABEL_45:
        v52 = v133;
        if (v83 == v133)
        {

          v122 = v132;
          if (knownNetworkProfile == v32)
            goto LABEL_49;
          goto LABEL_48;
        }

LABEL_47:
        v122 = v132;

        if (knownNetworkProfile == v32)
        {
LABEL_49:

LABEL_50:
          v22 = v134;
          if (scanResult == v15)
            goto LABEL_68;
          goto LABEL_67;
        }
LABEL_48:

        goto LABEL_49;
      }
      v125 = v79;
    }
    rememberUponSuccessfulAssociation = self->_rememberUponSuccessfulAssociation;
    if (rememberUponSuccessfulAssociation == objc_msgSend_rememberUponSuccessfulAssociation(v5, v67, v68, v69, v70))
    {
      forceBSSID = self->_forceBSSID;
      if (forceBSSID == objc_msgSend_forceBSSID(v5, v85, v86, v87, v88))
      {
        bandPreference = self->_bandPreference;
        if (bandPreference == objc_msgSend_bandPreference(v5, v90, v91, v92, v93))
        {
          has6GHzOnlyBSS = self->_has6GHzOnlyBSS;
          if (has6GHzOnlyBSS == objc_msgSend_has6GHzOnlyBSS(v5, v95, v96, v97, v98))
          {
            colocatedScopeID = self->_colocatedScopeID;
            objc_msgSend_colocatedScopeID(v5, v100, v101, v102, v103);
            v105 = (NSString *)objc_claimAutoreleasedReturnValue();
            v110 = v105;
            v111 = colocatedScopeID == v105;
            if (v111 || !self->_colocatedScopeID)
            {

              isEqual = v111;
              goto LABEL_58;
            }
            objc_msgSend_colocatedScopeID(v5, v106, v107, v108, v109);
            v112 = objc_claimAutoreleasedReturnValue();
            if (v112)
            {
              v117 = self->_colocatedScopeID;
              v124 = (void *)v112;
              objc_msgSend_colocatedScopeID(v5, v113, v114, v115, v116);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v117, v119, (uint64_t)v118, v120, v121);

              if (v128 == v131)
              {

              }
              else
              {

              }
              goto LABEL_45;
            }

          }
        }
      }
    }
    v111 = 0;
    isEqual = 0;
LABEL_58:
    v66 = v131;
    if (v128 != v131)
    {

      goto LABEL_60;
    }
LABEL_61:

LABEL_62:
    v52 = v133;
    if (v83 != v133)
    {

    }
    goto LABEL_64;
  }
  if (self->_password)
  {
    objc_msgSend_password(v5, v48, v49, v50, v51);
    v53 = objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      isEqual = 0;
      goto LABEL_47;
    }
    v133 = (NSString *)v52;
    v127 = (void *)v53;
    v58 = self->_password;
    objc_msgSend_password(v5, v54, v55, v56, v57);
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = v58;
    v52 = (void *)v59;
    if ((objc_msgSend_isEqual_(v60, v61, v59, v62, v63) & 1) != 0)
    {
      v64 = v3;
      goto LABEL_20;
    }

    if (knownNetworkProfile == v32)
    {

      goto LABEL_41;
    }

LABEL_40:
LABEL_41:
    isEqual = 0;
    goto LABEL_50;
  }
  isEqual = 0;
LABEL_64:

  if (knownNetworkProfile != v32)
  {

  }
LABEL_66:
  v22 = v134;

  if (scanResult != v15)
    goto LABEL_67;
LABEL_68:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFAssocParameters *v4;
  CWFAssocParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAssocParameters;

  v4 = (CWFAssocParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAssocParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAssocParameters = objc_msgSend_isEqualToAssocParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAssocParameters = 0;
  }

  return isEqualToAssocParameters;
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
  uint64_t v20;
  uint64_t v21;
  NSString *colocatedScopeID;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = objc_msgSend_hash(self->_scanResult, a2, v2, v3, v4);
  v11 = objc_msgSend_hash(self->_knownNetworkProfile, v7, v8, v9, v10) ^ v6;
  v16 = objc_msgSend_hash(self->_password, v12, v13, v14, v15);
  v21 = v11 ^ v16 ^ objc_msgSend_hash(self->_EAPCredentials, v17, v18, v19, v20);
  colocatedScopeID = self->_colocatedScopeID;
  v23 = v21 ^ self->_rememberUponSuccessfulAssociation ^ (unint64_t)self->_forceBSSID ^ self->_bandPreference ^ self->_has6GHzOnlyBSS;
  return v23 ^ objc_msgSend_hash(colocatedScopeID, v24, v25, v26, v27);
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

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAssocParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setScanResult_(v11, v12, (uint64_t)self->_scanResult, v13, v14);
  objc_msgSend_setKnownNetworkProfile_(v11, v15, (uint64_t)self->_knownNetworkProfile, v16, v17);
  objc_msgSend_setPassword_(v11, v18, (uint64_t)self->_password, v19, v20);
  objc_msgSend_setEAPCredentials_(v11, v21, (uint64_t)self->_EAPCredentials, v22, v23);
  objc_msgSend_setRememberUponSuccessfulAssociation_(v11, v24, self->_rememberUponSuccessfulAssociation, v25, v26);
  objc_msgSend_setForceBSSID_(v11, v27, self->_forceBSSID, v28, v29);
  objc_msgSend_setBandPreference_(v11, v30, self->_bandPreference, v31, v32);
  objc_msgSend_setColocatedScopeID_(v11, v33, (uint64_t)self->_colocatedScopeID, v34, v35);
  objc_msgSend_setHas6GHzOnlyBSS_(v11, v36, self->_has6GHzOnlyBSS, v37, v38);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CWFScanResult *scanResult;
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

  scanResult = self->_scanResult;
  v23 = a3;
  objc_msgSend_encodeObject_forKey_(v23, v5, (uint64_t)scanResult, (uint64_t)CFSTR("_scanResult"), v6);
  objc_msgSend_encodeObject_forKey_(v23, v7, (uint64_t)self->_knownNetworkProfile, (uint64_t)CFSTR("_knownNetworkProfile"), v8);
  objc_msgSend_encodeObject_forKey_(v23, v9, (uint64_t)self->_password, (uint64_t)CFSTR("_password"), v10);
  objc_msgSend_encodeObject_forKey_(v23, v11, (uint64_t)self->_EAPCredentials, (uint64_t)CFSTR("_EAPCredentials"), v12);
  objc_msgSend_encodeBool_forKey_(v23, v13, self->_rememberUponSuccessfulAssociation, (uint64_t)CFSTR("_rememberUponSuccessfulAssociation"), v14);
  objc_msgSend_encodeBool_forKey_(v23, v15, self->_forceBSSID, (uint64_t)CFSTR("_forceBSSID"), v16);
  objc_msgSend_encodeInteger_forKey_(v23, v17, self->_bandPreference, (uint64_t)CFSTR("_bandPreference"), v18);
  objc_msgSend_encodeObject_forKey_(v23, v19, (uint64_t)self->_colocatedScopeID, (uint64_t)CFSTR("_colocatedScopeID"), v20);
  objc_msgSend_encodeBool_forKey_(v23, v21, self->_has6GHzOnlyBSS, (uint64_t)CFSTR("_has6GHzOnlyBSS"), v22);

}

- (CWFAssocParameters)initWithCoder:(id)a3
{
  id v4;
  CWFAssocParameters *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CWFScanResult *scanResult;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CWFNetworkProfile *knownNetworkProfile;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *password;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  CWFEAPCredentials *EAPCredentials;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString *colocatedScopeID;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)CWFAssocParameters;
  v5 = -[CWFAssocParameters init](&v44, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_scanResult"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    scanResult = v5->_scanResult;
    v5->_scanResult = (CWFScanResult *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_knownNetworkProfile"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    knownNetworkProfile = v5->_knownNetworkProfile;
    v5->_knownNetworkProfile = (CWFNetworkProfile *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_password"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("_EAPCredentials"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    EAPCredentials = v5->_EAPCredentials;
    v5->_EAPCredentials = (CWFEAPCredentials *)v24;

    v5->_rememberUponSuccessfulAssociation = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("_rememberUponSuccessfulAssociation"), v27, v28);
    v5->_forceBSSID = objc_msgSend_decodeBoolForKey_(v4, v29, (uint64_t)CFSTR("_forceBSSID"), v30, v31);
    v5->_bandPreference = objc_msgSend_decodeIntegerForKey_(v4, v32, (uint64_t)CFSTR("_bandPreference"), v33, v34);
    v35 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, (uint64_t)CFSTR("_colocatedScopeID"), v37);
    v38 = objc_claimAutoreleasedReturnValue();
    colocatedScopeID = v5->_colocatedScopeID;
    v5->_colocatedScopeID = (NSString *)v38;

    v5->_has6GHzOnlyBSS = objc_msgSend_decodeBoolForKey_(v4, v40, (uint64_t)CFSTR("_has6GHzOnlyBSS"), v41, v42);
  }

  return v5;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CWFNetworkProfile)knownNetworkProfile
{
  return self->_knownNetworkProfile;
}

- (void)setKnownNetworkProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CWFEAPCredentials)EAPCredentials
{
  return self->_EAPCredentials;
}

- (void)setEAPCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)rememberUponSuccessfulAssociation
{
  return self->_rememberUponSuccessfulAssociation;
}

- (void)setRememberUponSuccessfulAssociation:(BOOL)a3
{
  self->_rememberUponSuccessfulAssociation = a3;
}

- (int64_t)bandPreference
{
  return self->_bandPreference;
}

- (void)setBandPreference:(int64_t)a3
{
  self->_bandPreference = a3;
}

- (NSString)colocatedScopeID
{
  return self->_colocatedScopeID;
}

- (void)setColocatedScopeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)forceBSSID
{
  return self->_forceBSSID;
}

- (void)setForceBSSID:(BOOL)a3
{
  self->_forceBSSID = a3;
}

- (BOOL)has6GHzOnlyBSS
{
  return self->_has6GHzOnlyBSS;
}

- (void)setHas6GHzOnlyBSS:(BOOL)a3
{
  self->_has6GHzOnlyBSS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colocatedScopeID, 0);
  objc_storeStrong((id *)&self->_EAPCredentials, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_knownNetworkProfile, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end
