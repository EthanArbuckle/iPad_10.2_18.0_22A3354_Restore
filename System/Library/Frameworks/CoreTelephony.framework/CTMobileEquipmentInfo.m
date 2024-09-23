@implementation CTMobileEquipmentInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", slotID=%s"), CTSubscriptionSlotAsString(-[CTMobileEquipmentInfo slotId](self, "slotId")));
  -[CTMobileEquipmentInfo currentMobileId](self, "currentMobileId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", currentMobileId=%@"), v4);

  -[CTMobileEquipmentInfo currentSubscriberId](self, "currentSubscriberId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", currentSubscriberId=%@"), v5);

  -[CTMobileEquipmentInfo IMEI](self, "IMEI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", IMEI=%@"), v6);

  -[CTMobileEquipmentInfo ICCID](self, "ICCID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", ICCID=%@"), v7);

  -[CTMobileEquipmentInfo IMSI](self, "IMSI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", IMSI=%@"), v8);

  -[CTMobileEquipmentInfo cdmaIMSI](self, "cdmaIMSI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA IMSI=%@"), v9);

  -[CTMobileEquipmentInfo MEID](self, "MEID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA MEID=%@"), v10);

  -[CTMobileEquipmentInfo EUIMID](self, "EUIMID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA EUIMID=%@"), v11);

  -[CTMobileEquipmentInfo PRLVersion](self, "PRLVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA PRL Version=%@"), v12);

  -[CTMobileEquipmentInfo ERIVersion](self, "ERIVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA ERI Version=%@"), v13);

  -[CTMobileEquipmentInfo MIN](self, "MIN");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA MIN=%@"), v14);

  -[CTMobileEquipmentInfo NAI](self, "NAI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CDMA NAI=%@"), v15);

  -[CTMobileEquipmentInfo baseVersion](self, "baseVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", baseVersion=%@"), v16);

  -[CTMobileEquipmentInfo baseId](self, "baseId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", baseId=%@"), v17);

  -[CTMobileEquipmentInfo baseProfile](self, "baseProfile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", baseProfile=%@"), v18);

  -[CTMobileEquipmentInfo effectiveICCID](self, "effectiveICCID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", effectiveICCID=%@"), v19);

  -[CTMobileEquipmentInfo CSN](self, "CSN");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CSN=%@"), v20);

  -[CTMobileEquipmentInfo displayCSN](self, "displayCSN");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", displayCSN=%@"), v21);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t slotId;
  NSString *currentMobileId;
  uint64_t v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *currentSubscriberId;
  uint64_t v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *IMEI;
  uint64_t v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *ICCID;
  uint64_t v22;
  void *v23;
  NSString *v24;
  void *v25;
  NSString *IMSI;
  uint64_t v27;
  void *v28;
  NSString *v29;
  void *v30;
  NSString *cdmaIMSI;
  uint64_t v32;
  void *v33;
  NSString *v34;
  void *v35;
  NSString *EUIMID;
  uint64_t v37;
  void *v38;
  NSString *v39;
  void *v40;
  NSNumber *PRLVersion;
  uint64_t v42;
  void *v43;
  NSNumber *v44;
  void *v45;
  NSNumber *ERIVersion;
  uint64_t v47;
  void *v48;
  NSNumber *v49;
  void *v50;
  NSString *MIN;
  uint64_t v52;
  void *v53;
  NSString *v54;
  void *v55;
  NSString *NAI;
  uint64_t v57;
  void *v58;
  NSString *v59;
  void *v60;
  NSString *baseVersion;
  uint64_t v62;
  void *v63;
  NSString *v64;
  void *v65;
  NSString *baseId;
  uint64_t v67;
  void *v68;
  NSString *v69;
  void *v70;
  NSString *baseProfile;
  uint64_t v72;
  void *v73;
  NSString *v74;
  void *v75;
  NSString *effectiveICCID;
  uint64_t v77;
  void *v78;
  NSString *v79;
  void *v80;
  NSString *CSN;
  uint64_t v82;
  void *v83;
  NSString *v84;
  void *v85;
  char v86;
  NSString *displayCSN;
  uint64_t v89;
  NSString *v90;
  NSString *v91;
  void *v92;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_65;
  slotId = self->_slotId;
  if (slotId != objc_msgSend(v4, "slotId"))
    goto LABEL_65;
  currentMobileId = self->_currentMobileId;
  objc_msgSend(v4, "currentMobileId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (currentMobileId == (NSString *)v7)
  {

  }
  else
  {
    v8 = (void *)v7;
    v9 = self->_currentMobileId;
    objc_msgSend(v4, "currentMobileId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    if (!(_DWORD)v9)
      goto LABEL_65;
  }
  currentSubscriberId = self->_currentSubscriberId;
  objc_msgSend(v4, "currentSubscriberId");
  v12 = objc_claimAutoreleasedReturnValue();
  if (currentSubscriberId == (NSString *)v12)
  {

  }
  else
  {
    v13 = (void *)v12;
    v14 = self->_currentSubscriberId;
    objc_msgSend(v4, "currentSubscriberId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = -[NSString isEqualToString:](v14, "isEqualToString:", v15);

    if (!(_DWORD)v14)
      goto LABEL_65;
  }
  IMEI = self->_IMEI;
  objc_msgSend(v4, "IMEI");
  v17 = objc_claimAutoreleasedReturnValue();
  if (IMEI == (NSString *)v17)
  {

  }
  else
  {
    v18 = (void *)v17;
    v19 = self->_IMEI;
    objc_msgSend(v4, "IMEI");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

    if (!(_DWORD)v19)
      goto LABEL_65;
  }
  ICCID = self->_ICCID;
  objc_msgSend(v4, "ICCID");
  v22 = objc_claimAutoreleasedReturnValue();
  if (ICCID == (NSString *)v22)
  {

  }
  else
  {
    v23 = (void *)v22;
    v24 = self->_ICCID;
    objc_msgSend(v4, "ICCID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = -[NSString isEqualToString:](v24, "isEqualToString:", v25);

    if (!(_DWORD)v24)
      goto LABEL_65;
  }
  IMSI = self->_IMSI;
  objc_msgSend(v4, "IMSI");
  v27 = objc_claimAutoreleasedReturnValue();
  if (IMSI == (NSString *)v27)
  {

  }
  else
  {
    v28 = (void *)v27;
    v29 = self->_IMSI;
    objc_msgSend(v4, "IMSI");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = -[NSString isEqualToString:](v29, "isEqualToString:", v30);

    if (!(_DWORD)v29)
      goto LABEL_65;
  }
  cdmaIMSI = self->_cdmaIMSI;
  objc_msgSend(v4, "cdmaIMSI");
  v32 = objc_claimAutoreleasedReturnValue();
  if (cdmaIMSI == (NSString *)v32)
  {

  }
  else
  {
    v33 = (void *)v32;
    v34 = self->_cdmaIMSI;
    objc_msgSend(v4, "cdmaIMSI");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v34) = -[NSString isEqualToString:](v34, "isEqualToString:", v35);

    if (!(_DWORD)v34)
      goto LABEL_65;
  }
  EUIMID = self->_EUIMID;
  objc_msgSend(v4, "EUIMID");
  v37 = objc_claimAutoreleasedReturnValue();
  if (EUIMID == (NSString *)v37)
  {

  }
  else
  {
    v38 = (void *)v37;
    v39 = self->_EUIMID;
    objc_msgSend(v4, "EUIMID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v39) = -[NSString isEqualToString:](v39, "isEqualToString:", v40);

    if (!(_DWORD)v39)
      goto LABEL_65;
  }
  PRLVersion = self->_PRLVersion;
  objc_msgSend(v4, "PRLVersion");
  v42 = objc_claimAutoreleasedReturnValue();
  if (PRLVersion == (NSNumber *)v42)
  {

  }
  else
  {
    v43 = (void *)v42;
    v44 = self->_PRLVersion;
    objc_msgSend(v4, "PRLVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = -[NSNumber isEqual:](v44, "isEqual:", v45);

    if (!(_DWORD)v44)
      goto LABEL_65;
  }
  ERIVersion = self->_ERIVersion;
  objc_msgSend(v4, "ERIVersion");
  v47 = objc_claimAutoreleasedReturnValue();
  if (ERIVersion == (NSNumber *)v47)
  {

  }
  else
  {
    v48 = (void *)v47;
    v49 = self->_ERIVersion;
    objc_msgSend(v4, "ERIVersion");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = -[NSNumber isEqual:](v49, "isEqual:", v50);

    if (!(_DWORD)v49)
      goto LABEL_65;
  }
  MIN = self->_MIN;
  objc_msgSend(v4, "MIN");
  v52 = objc_claimAutoreleasedReturnValue();
  if (MIN == (NSString *)v52)
  {

  }
  else
  {
    v53 = (void *)v52;
    v54 = self->_MIN;
    objc_msgSend(v4, "MIN");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v54) = -[NSString isEqualToString:](v54, "isEqualToString:", v55);

    if (!(_DWORD)v54)
      goto LABEL_65;
  }
  NAI = self->_NAI;
  objc_msgSend(v4, "NAI");
  v57 = objc_claimAutoreleasedReturnValue();
  if (NAI == (NSString *)v57)
  {

  }
  else
  {
    v58 = (void *)v57;
    v59 = self->_NAI;
    objc_msgSend(v4, "NAI");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v59) = -[NSString isEqualToString:](v59, "isEqualToString:", v60);

    if (!(_DWORD)v59)
      goto LABEL_65;
  }
  baseVersion = self->_baseVersion;
  objc_msgSend(v4, "baseVersion");
  v62 = objc_claimAutoreleasedReturnValue();
  if (baseVersion == (NSString *)v62)
  {

  }
  else
  {
    v63 = (void *)v62;
    v64 = self->_baseVersion;
    objc_msgSend(v4, "baseVersion");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v64) = -[NSString isEqualToString:](v64, "isEqualToString:", v65);

    if (!(_DWORD)v64)
      goto LABEL_65;
  }
  baseId = self->_baseId;
  objc_msgSend(v4, "baseId");
  v67 = objc_claimAutoreleasedReturnValue();
  if (baseId == (NSString *)v67)
  {

  }
  else
  {
    v68 = (void *)v67;
    v69 = self->_baseId;
    objc_msgSend(v4, "baseId");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v69) = -[NSString isEqualToString:](v69, "isEqualToString:", v70);

    if (!(_DWORD)v69)
      goto LABEL_65;
  }
  baseProfile = self->_baseProfile;
  objc_msgSend(v4, "baseProfile");
  v72 = objc_claimAutoreleasedReturnValue();
  if (baseProfile == (NSString *)v72)
  {

  }
  else
  {
    v73 = (void *)v72;
    v74 = self->_baseProfile;
    objc_msgSend(v4, "baseProfile");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v74) = -[NSString isEqualToString:](v74, "isEqualToString:", v75);

    if (!(_DWORD)v74)
      goto LABEL_65;
  }
  effectiveICCID = self->_effectiveICCID;
  objc_msgSend(v4, "effectiveICCID");
  v77 = objc_claimAutoreleasedReturnValue();
  if (effectiveICCID == (NSString *)v77)
  {

  }
  else
  {
    v78 = (void *)v77;
    v79 = self->_effectiveICCID;
    objc_msgSend(v4, "effectiveICCID");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v79) = -[NSString isEqualToString:](v79, "isEqualToString:", v80);

    if (!(_DWORD)v79)
      goto LABEL_65;
  }
  CSN = self->_CSN;
  objc_msgSend(v4, "CSN");
  v82 = objc_claimAutoreleasedReturnValue();
  if (CSN == (NSString *)v82)
  {

  }
  else
  {
    v83 = (void *)v82;
    v84 = self->_CSN;
    objc_msgSend(v4, "CSN");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = -[NSString isEqualToString:](v84, "isEqualToString:", v85);

    if (!(_DWORD)v84)
    {
LABEL_65:
      v86 = 0;
      goto LABEL_66;
    }
  }
  displayCSN = self->_displayCSN;
  objc_msgSend(v4, "displayCSN");
  v89 = objc_claimAutoreleasedReturnValue();
  if (displayCSN == (NSString *)v89)
  {
    v86 = 1;
  }
  else
  {
    v90 = (NSString *)v89;
    v91 = self->_displayCSN;
    objc_msgSend(v4, "displayCSN");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = -[NSString isEqualToString:](v91, "isEqualToString:", v92);

    displayCSN = v90;
  }

LABEL_66:
  return v86;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSlotId:", -[CTMobileEquipmentInfo slotId](self, "slotId"));
  -[CTMobileEquipmentInfo currentMobileId](self, "currentMobileId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setCurrentMobileId:", v6);

  -[CTMobileEquipmentInfo currentSubscriberId](self, "currentSubscriberId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setCurrentSubscriberId:", v8);

  -[CTMobileEquipmentInfo IMEI](self, "IMEI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setIMEI:", v10);

  -[CTMobileEquipmentInfo ICCID](self, "ICCID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setICCID:", v12);

  -[CTMobileEquipmentInfo IMSI](self, "IMSI");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setIMSI:", v14);

  -[CTMobileEquipmentInfo cdmaIMSI](self, "cdmaIMSI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setCdmaIMSI:", v16);

  -[CTMobileEquipmentInfo MEID](self, "MEID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMEID:", v18);

  -[CTMobileEquipmentInfo EUIMID](self, "EUIMID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setEUIMID:", v20);

  -[CTMobileEquipmentInfo PRLVersion](self, "PRLVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setPRLVersion:", v22);

  -[CTMobileEquipmentInfo ERIVersion](self, "ERIVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setERIVersion:", v24);

  -[CTMobileEquipmentInfo MIN](self, "MIN");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setMIN:", v26);

  -[CTMobileEquipmentInfo NAI](self, "NAI");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setNAI:", v28);

  -[CTMobileEquipmentInfo baseVersion](self, "baseVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setBaseVersion:", v30);

  -[CTMobileEquipmentInfo baseId](self, "baseId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setBaseId:", v32);

  -[CTMobileEquipmentInfo baseProfile](self, "baseProfile");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setBaseProfile:", v34);

  -[CTMobileEquipmentInfo effectiveICCID](self, "effectiveICCID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setEffectiveICCID:", v36);

  -[CTMobileEquipmentInfo CSN](self, "CSN");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setCSN:", v38);

  -[CTMobileEquipmentInfo displayCSN](self, "displayCSN");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setDisplayCSN:", v40);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTMobileEquipmentInfo slotId](self, "slotId"), CFSTR("slotId"));
  -[CTMobileEquipmentInfo currentMobileId](self, "currentMobileId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("currentMobileId"));

  -[CTMobileEquipmentInfo currentSubscriberId](self, "currentSubscriberId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("currentSubscriberId"));

  -[CTMobileEquipmentInfo IMEI](self, "IMEI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("IMEI"));

  -[CTMobileEquipmentInfo ICCID](self, "ICCID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ICCID"));

  -[CTMobileEquipmentInfo IMSI](self, "IMSI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("IMSI"));

  -[CTMobileEquipmentInfo cdmaIMSI](self, "cdmaIMSI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("cdmaIMSI"));

  -[CTMobileEquipmentInfo MEID](self, "MEID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("MEID"));

  -[CTMobileEquipmentInfo EUIMID](self, "EUIMID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("EUIMID"));

  -[CTMobileEquipmentInfo PRLVersion](self, "PRLVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("PRLVersion"));

  -[CTMobileEquipmentInfo ERIVersion](self, "ERIVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("ERIVersion"));

  -[CTMobileEquipmentInfo MIN](self, "MIN");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("MIN"));

  -[CTMobileEquipmentInfo NAI](self, "NAI");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("NAI"));

  -[CTMobileEquipmentInfo baseVersion](self, "baseVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("baseVersion"));

  -[CTMobileEquipmentInfo baseId](self, "baseId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("baseId"));

  -[CTMobileEquipmentInfo baseProfile](self, "baseProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("baseProfile"));

  -[CTMobileEquipmentInfo effectiveICCID](self, "effectiveICCID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("effectiveICCID"));

  -[CTMobileEquipmentInfo CSN](self, "CSN");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("CSN"));

  -[CTMobileEquipmentInfo displayCSN](self, "displayCSN");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("displayCSN"));

}

- (CTMobileEquipmentInfo)initWithCoder:(id)a3
{
  id v4;
  CTMobileEquipmentInfo *v5;
  uint64_t v6;
  NSString *currentMobileId;
  uint64_t v8;
  NSString *currentSubscriberId;
  uint64_t v10;
  NSString *IMEI;
  uint64_t v12;
  NSString *ICCID;
  uint64_t v14;
  NSString *IMSI;
  uint64_t v16;
  NSString *cdmaIMSI;
  uint64_t v18;
  NSString *MEID;
  uint64_t v20;
  NSString *EUIMID;
  uint64_t v22;
  NSNumber *PRLVersion;
  uint64_t v24;
  NSNumber *ERIVersion;
  uint64_t v26;
  NSString *MIN;
  uint64_t v28;
  NSString *NAI;
  uint64_t v30;
  NSString *baseVersion;
  uint64_t v32;
  NSString *baseId;
  uint64_t v34;
  NSString *baseProfile;
  uint64_t v36;
  NSString *effectiveICCID;
  uint64_t v38;
  NSString *CSN;
  uint64_t v40;
  NSString *displayCSN;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CTMobileEquipmentInfo;
  v5 = -[CTMobileEquipmentInfo init](&v43, sel_init);
  if (v5)
  {
    v5->_slotId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("slotId"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentMobileId"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentMobileId = v5->_currentMobileId;
    v5->_currentMobileId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSubscriberId"));
    v8 = objc_claimAutoreleasedReturnValue();
    currentSubscriberId = v5->_currentSubscriberId;
    v5->_currentSubscriberId = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMEI"));
    v10 = objc_claimAutoreleasedReturnValue();
    IMEI = v5->_IMEI;
    v5->_IMEI = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ICCID"));
    v12 = objc_claimAutoreleasedReturnValue();
    ICCID = v5->_ICCID;
    v5->_ICCID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IMSI"));
    v14 = objc_claimAutoreleasedReturnValue();
    IMSI = v5->_IMSI;
    v5->_IMSI = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdmaIMSI"));
    v16 = objc_claimAutoreleasedReturnValue();
    cdmaIMSI = v5->_cdmaIMSI;
    v5->_cdmaIMSI = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MEID"));
    v18 = objc_claimAutoreleasedReturnValue();
    MEID = v5->_MEID;
    v5->_MEID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EUIMID"));
    v20 = objc_claimAutoreleasedReturnValue();
    EUIMID = v5->_EUIMID;
    v5->_EUIMID = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PRLVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    PRLVersion = v5->_PRLVersion;
    v5->_PRLVersion = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ERIVersion"));
    v24 = objc_claimAutoreleasedReturnValue();
    ERIVersion = v5->_ERIVersion;
    v5->_ERIVersion = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MIN"));
    v26 = objc_claimAutoreleasedReturnValue();
    MIN = v5->_MIN;
    v5->_MIN = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NAI"));
    v28 = objc_claimAutoreleasedReturnValue();
    NAI = v5->_NAI;
    v5->_NAI = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseVersion"));
    v30 = objc_claimAutoreleasedReturnValue();
    baseVersion = v5->_baseVersion;
    v5->_baseVersion = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseId"));
    v32 = objc_claimAutoreleasedReturnValue();
    baseId = v5->_baseId;
    v5->_baseId = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseProfile"));
    v34 = objc_claimAutoreleasedReturnValue();
    baseProfile = v5->_baseProfile;
    v5->_baseProfile = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("effectiveICCID"));
    v36 = objc_claimAutoreleasedReturnValue();
    effectiveICCID = v5->_effectiveICCID;
    v5->_effectiveICCID = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSN"));
    v38 = objc_claimAutoreleasedReturnValue();
    CSN = v5->_CSN;
    v5->_CSN = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayCSN"));
    v40 = objc_claimAutoreleasedReturnValue();
    displayCSN = v5->_displayCSN;
    v5->_displayCSN = (NSString *)v40;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)slotId
{
  return self->_slotId;
}

- (void)setSlotId:(int64_t)a3
{
  self->_slotId = a3;
}

- (NSString)currentMobileId
{
  return self->_currentMobileId;
}

- (void)setCurrentMobileId:(id)a3
{
  objc_storeStrong((id *)&self->_currentMobileId, a3);
}

- (NSString)currentSubscriberId
{
  return self->_currentSubscriberId;
}

- (void)setCurrentSubscriberId:(id)a3
{
  objc_storeStrong((id *)&self->_currentSubscriberId, a3);
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
  objc_storeStrong((id *)&self->_IMEI, a3);
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (void)setICCID:(id)a3
{
  objc_storeStrong((id *)&self->_ICCID, a3);
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
  objc_storeStrong((id *)&self->_IMSI, a3);
}

- (NSString)cdmaIMSI
{
  return self->_cdmaIMSI;
}

- (void)setCdmaIMSI:(id)a3
{
  objc_storeStrong((id *)&self->_cdmaIMSI, a3);
}

- (NSString)MEID
{
  return self->_MEID;
}

- (void)setMEID:(id)a3
{
  objc_storeStrong((id *)&self->_MEID, a3);
}

- (NSString)EUIMID
{
  return self->_EUIMID;
}

- (void)setEUIMID:(id)a3
{
  objc_storeStrong((id *)&self->_EUIMID, a3);
}

- (NSNumber)PRLVersion
{
  return self->_PRLVersion;
}

- (void)setPRLVersion:(id)a3
{
  objc_storeStrong((id *)&self->_PRLVersion, a3);
}

- (NSNumber)ERIVersion
{
  return self->_ERIVersion;
}

- (void)setERIVersion:(id)a3
{
  objc_storeStrong((id *)&self->_ERIVersion, a3);
}

- (NSString)MIN
{
  return self->_MIN;
}

- (void)setMIN:(id)a3
{
  objc_storeStrong((id *)&self->_MIN, a3);
}

- (NSString)NAI
{
  return self->_NAI;
}

- (void)setNAI:(id)a3
{
  objc_storeStrong((id *)&self->_NAI, a3);
}

- (NSString)baseVersion
{
  return self->_baseVersion;
}

- (void)setBaseVersion:(id)a3
{
  objc_storeStrong((id *)&self->_baseVersion, a3);
}

- (NSString)baseId
{
  return self->_baseId;
}

- (void)setBaseId:(id)a3
{
  objc_storeStrong((id *)&self->_baseId, a3);
}

- (NSString)baseProfile
{
  return self->_baseProfile;
}

- (void)setBaseProfile:(id)a3
{
  objc_storeStrong((id *)&self->_baseProfile, a3);
}

- (NSString)effectiveICCID
{
  return self->_effectiveICCID;
}

- (void)setEffectiveICCID:(id)a3
{
  objc_storeStrong((id *)&self->_effectiveICCID, a3);
}

- (NSString)CSN
{
  return self->_CSN;
}

- (void)setCSN:(id)a3
{
  objc_storeStrong((id *)&self->_CSN, a3);
}

- (NSString)displayCSN
{
  return self->_displayCSN;
}

- (void)setDisplayCSN:(id)a3
{
  objc_storeStrong((id *)&self->_displayCSN, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayCSN, 0);
  objc_storeStrong((id *)&self->_CSN, 0);
  objc_storeStrong((id *)&self->_effectiveICCID, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_baseId, 0);
  objc_storeStrong((id *)&self->_baseVersion, 0);
  objc_storeStrong((id *)&self->_NAI, 0);
  objc_storeStrong((id *)&self->_MIN, 0);
  objc_storeStrong((id *)&self->_ERIVersion, 0);
  objc_storeStrong((id *)&self->_PRLVersion, 0);
  objc_storeStrong((id *)&self->_EUIMID, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
  objc_storeStrong((id *)&self->_cdmaIMSI, 0);
  objc_storeStrong((id *)&self->_IMSI, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_currentSubscriberId, 0);
  objc_storeStrong((id *)&self->_currentMobileId, 0);
}

@end
