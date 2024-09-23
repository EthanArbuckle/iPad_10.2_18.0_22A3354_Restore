@implementation CTCellularPlanItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 iccid:(id)a5 name:(id)a6 type:(int64_t)a7 phoneNumber:(id)a8 label:(id)a9 isLocalTransferToeSIMSupported:(BOOL)a10 isTransferred:(BOOL)a11 transferredStatus:(int64_t)a12 transferredToDeviceDisplayName:(id)a13 supportedTransferOption:(unint64_t)a14 settingsMode:(int64_t)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  CTCellularPlanItem *v27;
  uint64_t v28;
  NSString *uuid;
  uint64_t v30;
  NSString *iccid;
  uint64_t v32;
  NSString *name;
  uint64_t v34;
  NSString *phoneNumber;
  CTUserLabel *userLabel;
  uint64_t v37;
  NSString *label;
  CTCellularPlan *plan;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  CTPlan *ctPlan;
  uint64_t v45;
  id v47;
  id v49;
  objc_super v50;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a8;
  v26 = a9;
  v49 = a13;
  v50.receiver = self;
  v50.super_class = (Class)CTCellularPlanItem;
  v27 = -[CTCellularPlanItem init](&v50, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(v22, "copy");
    uuid = v27->_uuid;
    v27->_uuid = (NSString *)v28;

    objc_storeStrong((id *)&v27->_plan, a3);
    v30 = objc_msgSend(v23, "copy");
    iccid = v27->_iccid;
    v27->_iccid = (NSString *)v30;

    v47 = v24;
    v32 = objc_msgSend(v24, "copy");
    name = v27->_name;
    v27->_name = (NSString *)v32;

    v27->_type = a7;
    v27->_lockState = 0;
    v27->_isDefaultVoice = 0;
    *(_QWORD *)&v27->_shouldDisplayType = 0x10101000000;
    v27->_isLocalTransferToeSIMSupported = a10;
    v27->_isTransferred = a11;
    v27->_transferredStatus = a12;
    v34 = objc_msgSend(v25, "copy");
    phoneNumber = v27->_phoneNumber;
    v27->_phoneNumber = (NSString *)v34;

    objc_storeStrong((id *)&v27->_userLabel, a9);
    objc_storeStrong((id *)&v27->_transferredToDeviceDisplayName, a13);
    v27->_supportedTransferOption = a14;
    v27->_settingsMode = a15;
    userLabel = v27->_userLabel;
    if (userLabel)
    {
      -[CTUserLabel label](userLabel, "label");
      v37 = objc_claimAutoreleasedReturnValue();
      label = v27->_label;
      v27->_label = (NSString *)v37;

    }
    plan = v27->_plan;
    v40 = objc_alloc(MEMORY[0x1E0CA6CF0]);
    v41 = v40;
    if (plan)
    {
      objc_msgSend(v21, "iccid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v41, "initWithIccid:", v42);
      ctPlan = v27->_ctPlan;
      v27->_ctPlan = (CTPlan *)v43;

    }
    else
    {
      v45 = objc_msgSend(v40, "initWithIccid:", v27->_iccid);
      v42 = v27->_ctPlan;
      v27->_ctPlan = (CTPlan *)v45;
    }

    v24 = v47;
  }

  return v27;
}

- (CTCellularPlanItem)initWithCellularPlan:(id)a3 uuid:(id)a4 type:(int64_t)a5 phoneNumber:(id)a6 label:(id)a7 transferredStatus:(int64_t)a8 transferredToDeviceDisplayName:(id)a9 supportedTransferOption:(unint64_t)a10 settingsMode:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  CTCellularPlanItem *v23;
  uint64_t v25;

  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  objc_msgSend(v21, "iccid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v25) = 0;
  v23 = -[CTCellularPlanItem initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:](self, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", v21, v20, v22, 0, a5, v19, v18, v25, a8, v17, a10, a11);

  return v23;
}

- (CTCellularPlanItem)initWithIccid:(id)a3 uuid:(id)a4 name:(id)a5 phoneNumber:(id)a6 label:(id)a7 isLocalTransferToeSIMSupported:(BOOL)a8 isTransferred:(BOOL)a9 transferredStatus:(int64_t)a10 transferredToDeviceDisplayName:(id)a11 supportedTransferOption:(unint64_t)a12 settingsMode:(int64_t)a13
{
  uint64_t v14;

  BYTE1(v14) = a9;
  LOBYTE(v14) = a8;
  return -[CTCellularPlanItem initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:](self, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", 0, a4, a3, a5, 0, a6, a7, v14, a10, a11, a12, a13);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  uint64_t v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOWORD(v7) = *(_WORD *)&self->_isLocalTransferToeSIMSupported;
  v5 = (void *)objc_msgSend(v4, "initWithCellularPlan:uuid:iccid:name:type:phoneNumber:label:isLocalTransferToeSIMSupported:isTransferred:transferredStatus:transferredToDeviceDisplayName:supportedTransferOption:settingsMode:", self->_plan, self->_uuid, self->_iccid, self->_name, self->_type, self->_phoneNumber, self->_userLabel, v7, self->_transferredStatus, self->_transferredToDeviceDisplayName, self->_supportedTransferOption, self->_settingsMode);
  objc_msgSend(v5, "setStatus:", self->_status);
  return v5;
}

- (CTCellularPlanItem)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanItem *v5;
  uint64_t v6;
  CTCellularPlan *plan;
  uint64_t v8;
  CTPlan *ctPlan;
  uint64_t v10;
  NSString *uuid;
  uint64_t v12;
  NSString *iccid;
  uint64_t v14;
  NSNumber *isSelectedOverride;
  uint64_t v16;
  NSString *name;
  uint64_t v18;
  NSUUID *companionSlotUuid;
  uint64_t v20;
  NSString *companionSimLabelId;
  uint64_t v22;
  NSString *phoneNumber;
  uint64_t v24;
  CTUserLabel *userLabel;
  uint64_t v26;
  NSString *label;
  uint64_t v28;
  NSString *transferredToDeviceDisplayName;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CTCellularPlanItem;
  v5 = -[CTCellularPlanItem init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("plan"));
    v6 = objc_claimAutoreleasedReturnValue();
    plan = v5->_plan;
    v5->_plan = (CTCellularPlan *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ct_plan"));
    v8 = objc_claimAutoreleasedReturnValue();
    ctPlan = v5->_ctPlan;
    v5->_ctPlan = (CTPlan *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v10 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iccid"));
    v12 = objc_claimAutoreleasedReturnValue();
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isSelectedOverride"));
    v14 = objc_claimAutoreleasedReturnValue();
    isSelectedOverride = v5->_isSelectedOverride;
    v5->_isSelectedOverride = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v16 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v16;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_lockState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lockState"));
    v5->_shouldDisplayType = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("displayType"));
    v5->_isSelectable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSelectable"));
    v5->_shouldDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDisplay"));
    v5->_isSimStateValid = 1;
    v5->_shouldAppearDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldAppearDisabled"));
    v5->_isActiveDataPlan = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isActiveDataPlan"));
    v5->_isDefaultVoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDefaultVoice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSlotUuid"));
    v18 = objc_claimAutoreleasedReturnValue();
    companionSlotUuid = v5->_companionSlotUuid;
    v5->_companionSlotUuid = (NSUUID *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("companionSimLabelId"));
    v20 = objc_claimAutoreleasedReturnValue();
    companionSimLabelId = v5->_companionSimLabelId;
    v5->_companionSimLabelId = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneNumber"));
    v22 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v24 = objc_claimAutoreleasedReturnValue();
    userLabel = v5->_userLabel;
    v5->_userLabel = (CTUserLabel *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deprecateLabel"));
    v26 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v26;

    v5->_shouldDisplayExtendedConsentInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldDisplayExtendedConsentInfo"));
    v5->_isLocalTransferToeSIMSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocalTransferToeSIMSupported"));
    v5->_isTransferred = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTransferred"));
    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("isCheckingCellularConnectivity"));
    v5->_transferredStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferredStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferredToDeviceDisplayName"));
    v28 = objc_claimAutoreleasedReturnValue();
    transferredToDeviceDisplayName = v5->_transferredToDeviceDisplayName;
    v5->_transferredToDeviceDisplayName = (NSString *)v28;

    v5->_supportedTransferOption = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedTransferOption"));
    v5->_settingsMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("settingsMode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CTCellularPlan *plan;
  id v5;

  plan = self->_plan;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", plan, CFSTR("plan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ctPlan, CFSTR("ct_plan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_isSelectedOverride, CFSTR("isSelectedOverride"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iccid, CFSTR("iccid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_lockState, CFSTR("lockState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDisplayType, CFSTR("displayType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelectable, CFSTR("isSelectable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDisplay, CFSTR("shouldDisplay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAppearDisabled, CFSTR("shouldAppearDisabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isActiveDataPlan, CFSTR("isActiveDataPlan"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefaultVoice, CFSTR("isDefaultVoice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companionSlotUuid, CFSTR("companionSlotUuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_companionSimLabelId, CFSTR("companionSimLabelId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneNumber, CFSTR("phoneNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userLabel, CFSTR("label"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("deprecateLabel"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDisplayExtendedConsentInfo, CFSTR("shouldDisplayExtendedConsentInfo"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocalTransferToeSIMSupported, CFSTR("isLocalTransferToeSIMSupported"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isTransferred, CFSTR("isTransferred"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("isCheckingCellularConnectivity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transferredStatus, CFSTR("transferredStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferredToDeviceDisplayName, CFSTR("transferredToDeviceDisplayName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_supportedTransferOption, CFSTR("supportedTransferOption"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_settingsMode, CFSTR("settingsMode"));

}

- (int64_t)compare:(id)a3
{
  NSString *uuid;
  void *v4;
  int64_t v5;

  uuid = self->_uuid;
  objc_msgSend(a3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSString compare:options:](uuid, "compare:options:", v4, 64);

  return v5;
}

- (BOOL)isBackedByCellularPlan
{
  return self->_plan != 0;
}

- (BOOL)isCheckingCellularConnectivity
{
  return self->_status == 14 && self->_transferredStatus != 0;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)isSelected
{
  void *v3;
  void *v4;
  char v5;

  -[CTCellularPlanItem isSelectedOverride](self, "isSelectedOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CTCellularPlanItem isSelectedOverride](self, "isSelectedOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isInstalling
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[CTCellularPlanItem plan](self, "plan");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 6)
  {
    v4 = 1;
  }
  else
  {
    -[CTCellularPlanItem plan](self, "plan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "status") == 7)
    {
      v4 = 1;
    }
    else
    {
      -[CTCellularPlanItem plan](self, "plan");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "status") == 2;

    }
  }

  return v4;
}

- (NSString)label
{
  CTUserLabel *userLabel;
  NSString *v4;

  userLabel = self->_userLabel;
  if (userLabel)
  {
    -[CTUserLabel label](userLabel, "label");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_label;
  }
  return v4;
}

- (NSString)iccid
{
  NSString *v3;

  if (-[CTCellularPlanItem isBackedByCellularPlan](self, "isBackedByCellularPlan"))
  {
    -[CTCellularPlan iccid](self->_plan, "iccid");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_iccid;
  }
  return v3;
}

- (NSString)identifier
{
  __CFString *v3;
  NSString *iccid;

  if (-[CTCellularPlanItem isBackedByCellularPlan](self, "isBackedByCellularPlan"))
  {
    -[CTCellularPlan iccid](self->_plan, "iccid");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    iccid = self->_iccid;
    if (iccid)
      v3 = iccid;
    else
      v3 = CFSTR("Home");
  }
  return (NSString *)v3;
}

- (NSString)name
{
  void *v3;
  CTCellularPlan *plan;
  NSString *v5;

  if (-[CTCellularPlanItem isBackedByCellularPlan](self, "isBackedByCellularPlan"))
  {
    -[CTCellularPlan planDescription](self->_plan, "planDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    plan = self->_plan;
    if (v3)
      -[CTCellularPlan planDescription](plan, "planDescription");
    else
      -[CTCellularPlan carrierName](plan, "carrierName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self->_name;
  }
  return v5;
}

- (NSString)carrierName
{
  NSString *name;

  name = self->_name;
  if (name)
    return name;
  -[CTCellularPlan carrierName](self->_plan, "carrierName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSUUID)companionSlotUuid
{
  return self->_companionSlotUuid;
}

- (NSString)companionSimLabelId
{
  return self->_companionSimLabelId;
}

- (id)typeAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E9521740[a3];
}

- (id)transferredStatusAsString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E9521758[a3 - 1];
}

- (id)settingsModeAsString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Manual");
  if (a3 == 1)
    v3 = CFSTR("Automatic");
  if (a3 == 2)
    return CFSTR("Standard");
  else
    return (id)v3;
}

- (id)description
{
  void *iccid;
  uint64_t v4;
  void *v5;
  CTCellularPlan *plan;
  const char *v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSString *transferredToDeviceDisplayName;
  unint64_t supportedTransferOption;
  void *v13;
  void *v14;
  CTUserLabel *userLabel;
  NSString *phoneNumber;
  __int128 v18;
  _BOOL8 isDefaultVoice;
  _BOOL8 isActiveDataPlan;
  _BOOL8 isSelectable;
  NSNumber *isSelectedOverride;
  _BOOL8 isSimStateValid;
  void *v24;
  CTPlan *ctPlan;
  NSString *name;
  NSString *uuid;
  void *v28;
  void *v29;

  uuid = self->_uuid;
  v28 = (void *)MEMORY[0x1E0CB3940];
  iccid = self->_iccid;
  v29 = iccid;
  if (!iccid)
  {
    -[CTCellularPlan iccid](self->_plan, "iccid");
    iccid = (void *)objc_claimAutoreleasedReturnValue();
  }
  ctPlan = self->_ctPlan;
  name = self->_name;
  -[CTCellularPlanItem typeAsString:](self, "typeAsString:", self->_type);
  v4 = objc_claimAutoreleasedReturnValue();
  isSimStateValid = self->_isSimStateValid;
  v24 = (void *)v4;
  isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  isActiveDataPlan = self->_isActiveDataPlan;
  isDefaultVoice = self->_isDefaultVoice;
  v18 = *(_OWORD *)&self->_companionSlotUuid;
  userLabel = self->_userLabel;
  phoneNumber = self->_phoneNumber;
  -[CTCellularPlanItem carrierName](self, "carrierName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  plan = self->_plan;
  v7 = "NO";
  if (self->_isLocalTransferToeSIMSupported)
    v8 = "YES";
  else
    v8 = "NO";
  if (self->_isTransferred)
    v9 = "YES";
  else
    v9 = "NO";
  if (-[CTCellularPlanItem isCheckingCellularConnectivity](self, "isCheckingCellularConnectivity"))
    v7 = "YES";
  -[CTCellularPlanItem transferredStatusAsString:](self, "transferredStatusAsString:", self->_transferredStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  supportedTransferOption = self->_supportedTransferOption;
  -[CTCellularPlanItem settingsModeAsString:](self, "settingsModeAsString:", self->_settingsMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<item: uuid:%@ iccid:%@ name:%@, CTPlan: %@, type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, slotUuid:%@, labelId:%@, number:%@, label:%@ carrier:%@, plan:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, isCheckingCellularConnectivity:%s, transferredStatus:%@, transferredToDeviceDisplayName:%@, supportedTransferOption:%lu, settingsMode:%@>"), uuid, iccid, name, ctPlan, v24, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v18, phoneNumber, userLabel, v5, plan, v8,
    v9,
    v7,
    v10,
    transferredToDeviceDisplayName,
    supportedTransferOption,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  return v14;
}

- (id)redactedDescription
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  void *v9;
  unint64_t supportedTransferOption;
  NSString *transferredToDeviceDisplayName;
  void *v12;
  void *v13;
  _BOOL8 isDefaultVoice;
  _BOOL8 isActiveDataPlan;
  _BOOL8 isSelectable;
  NSNumber *isSelectedOverride;
  _BOOL8 isSimStateValid;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[CTCellularPlanItem typeAsString:](self, "typeAsString:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isSimStateValid = self->_isSimStateValid;
  isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  isActiveDataPlan = self->_isActiveDataPlan;
  isDefaultVoice = self->_isDefaultVoice;
  -[CTCellularPlanItem carrierName](self, "carrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlan redactedDescription](self->_plan, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = "NO";
  if (self->_isLocalTransferToeSIMSupported)
    v7 = "YES";
  else
    v7 = "NO";
  if (self->_isTransferred)
    v8 = "YES";
  else
    v8 = "NO";
  if (-[CTCellularPlanItem isCheckingCellularConnectivity](self, "isCheckingCellularConnectivity"))
    v6 = "YES";
  -[CTCellularPlanItem transferredStatusAsString:](self, "transferredStatusAsString:", self->_transferredStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  supportedTransferOption = self->_supportedTransferOption;
  -[CTCellularPlanItem settingsModeAsString:](self, "settingsModeAsString:", self->_settingsMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<item: type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, carrier:%@, plan:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, isCheckingConnectivity:%s transferredStatus:%@ target:%@, supportedTransferOption:%lu, settingsMode:%@>"), v3, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v4, v5, v7, v8, v6, v9, transferredToDeviceDisplayName, supportedTransferOption, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)customDescription
{
  void *iccid;
  uint64_t v4;
  CTUserLabel *userLabel;
  NSString *phoneNumber;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSString *transferredToDeviceDisplayName;
  unint64_t supportedTransferOption;
  void *v13;
  void *v14;
  __int128 v16;
  _BOOL8 isDefaultVoice;
  _BOOL8 isActiveDataPlan;
  _BOOL8 isSelectable;
  NSNumber *isSelectedOverride;
  _BOOL8 isSimStateValid;
  void *v22;
  NSString *name;
  NSString *uuid;
  void *v25;
  void *v26;

  uuid = self->_uuid;
  v25 = (void *)MEMORY[0x1E0CB3940];
  iccid = self->_iccid;
  v26 = iccid;
  if (!iccid)
  {
    -[CTCellularPlan iccid](self->_plan, "iccid");
    iccid = (void *)objc_claimAutoreleasedReturnValue();
  }
  name = self->_name;
  -[CTCellularPlanItem typeAsString:](self, "typeAsString:", self->_type);
  v4 = objc_claimAutoreleasedReturnValue();
  isSimStateValid = self->_isSimStateValid;
  v22 = (void *)v4;
  isSelectable = self->_isSelectable;
  isSelectedOverride = self->_isSelectedOverride;
  isActiveDataPlan = self->_isActiveDataPlan;
  isDefaultVoice = self->_isDefaultVoice;
  v16 = *(_OWORD *)&self->_companionSlotUuid;
  phoneNumber = self->_phoneNumber;
  userLabel = self->_userLabel;
  -[CTCellularPlanItem carrierName](self, "carrierName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isLocalTransferToeSIMSupported)
    v8 = "YES";
  else
    v8 = "NO";
  if (self->_isTransferred)
    v9 = "YES";
  else
    v9 = "NO";
  -[CTCellularPlanItem transferredStatusAsString:](self, "transferredStatusAsString:", self->_transferredStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  transferredToDeviceDisplayName = self->_transferredToDeviceDisplayName;
  supportedTransferOption = self->_supportedTransferOption;
  -[CTCellularPlanItem settingsModeAsString:](self, "settingsModeAsString:", self->_settingsMode);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("<item: uuid:%@ iccid:%@ name:%@, type:%@, validstate:%d, selected:%@, selectable:%d, activeData:%d, defaultVoice:%d, slotUuid:%@, labelId:%@, number:%@, label:%@ carrier:%@, isLocalTransferToeSIMSupported:%s, isTransferred:%s, transferredStatus:%@ transferredToDeviceDisplayName:%@, _supportedTransferOption:%lu, settingsMode:%@>"), uuid, iccid, name, v22, isSimStateValid, isSelectedOverride, isSelectable, isActiveDataPlan, isDefaultVoice, v16, phoneNumber, userLabel, v7, v8, v9, v10,
    transferredToDeviceDisplayName,
    supportedTransferOption,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  return v14;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (CTCellularPlan)plan
{
  return self->_plan;
}

- (CTPlan)ctPlan
{
  return self->_ctPlan;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int64_t)a3
{
  self->_lockState = a3;
}

- (BOOL)shouldDisplayType
{
  return self->_shouldDisplayType;
}

- (void)setShouldDisplayType:(BOOL)a3
{
  self->_shouldDisplayType = a3;
}

- (BOOL)shouldAutoSelectWhenInRange
{
  return self->_shouldAutoSelectWhenInRange;
}

- (void)setShouldAutoSelectWhenInRange:(BOOL)a3
{
  self->_shouldAutoSelectWhenInRange = a3;
}

- (BOOL)shouldDisplayExtendedConsentInfo
{
  return self->_shouldDisplayExtendedConsentInfo;
}

- (void)setShouldDisplayExtendedConsentInfo:(BOOL)a3
{
  self->_shouldDisplayExtendedConsentInfo = a3;
}

- (BOOL)isSimStateValid
{
  return self->_isSimStateValid;
}

- (void)setIsSimStateValid:(BOOL)a3
{
  self->_isSimStateValid = a3;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)shouldDisplay
{
  return self->_shouldDisplay;
}

- (void)setShouldDisplay:(BOOL)a3
{
  self->_shouldDisplay = a3;
}

- (BOOL)shouldAppearDisabled
{
  return self->_shouldAppearDisabled;
}

- (void)setShouldAppearDisabled:(BOOL)a3
{
  self->_shouldAppearDisabled = a3;
}

- (BOOL)isActiveDataPlan
{
  return self->_isActiveDataPlan;
}

- (void)setIsActiveDataPlan:(BOOL)a3
{
  self->_isActiveDataPlan = a3;
}

- (BOOL)isDefaultVoice
{
  return self->_isDefaultVoice;
}

- (void)setIsDefaultVoice:(BOOL)a3
{
  self->_isDefaultVoice = a3;
}

- (BOOL)isLocalTransferToeSIMSupported
{
  return self->_isLocalTransferToeSIMSupported;
}

- (void)setIsLocalTransferToeSIMSupported:(BOOL)a3
{
  self->_isLocalTransferToeSIMSupported = a3;
}

- (BOOL)isTransferred
{
  return self->_isTransferred;
}

- (void)setIsTransferred:(BOOL)a3
{
  self->_isTransferred = a3;
}

- (int64_t)transferredStatus
{
  return self->_transferredStatus;
}

- (NSString)transferredToDeviceDisplayName
{
  return self->_transferredToDeviceDisplayName;
}

- (unint64_t)supportedTransferOption
{
  return self->_supportedTransferOption;
}

- (void)setSupportedTransferOption:(unint64_t)a3
{
  self->_supportedTransferOption = a3;
}

- (int64_t)settingsMode
{
  return self->_settingsMode;
}

- (void)setSettingsMode:(int64_t)a3
{
  self->_settingsMode = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (CTUserLabel)userLabel
{
  return self->_userLabel;
}

- (void)setUserLabel:(id)a3
{
  objc_storeStrong((id *)&self->_userLabel, a3);
}

- (void)setCompanionSlotUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setCompanionSimLabelId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)isSelectedOverride
{
  return self->_isSelectedOverride;
}

- (void)setIsSelectedOverride:(id)a3
{
  objc_storeStrong((id *)&self->_isSelectedOverride, a3);
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isSelectedOverride, 0);
  objc_storeStrong((id *)&self->_companionSimLabelId, 0);
  objc_storeStrong((id *)&self->_companionSlotUuid, 0);
  objc_storeStrong((id *)&self->_userLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_transferredToDeviceDisplayName, 0);
  objc_storeStrong((id *)&self->_ctPlan, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
