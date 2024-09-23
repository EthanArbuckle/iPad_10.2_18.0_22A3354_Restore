@implementation AFBluetoothDeviceInfo

- (AFBluetoothDeviceInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFBluetoothDeviceInfoMutation *);
  AFBluetoothDeviceInfo *v5;
  AFBluetoothDeviceInfo *v6;
  _AFBluetoothDeviceInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *address;
  void *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  uint64_t v15;
  NSUUID *deviceUID;
  void *v17;
  uint64_t v18;
  AFBluetoothHeadGestureConfiguration *headGestureConfiguration;
  objc_super v21;

  v4 = (void (**)(id, _AFBluetoothDeviceInfoMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFBluetoothDeviceInfo;
  v5 = -[AFBluetoothDeviceInfo init](&v21, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFBluetoothDeviceInfoMutation initWithBase:]([_AFBluetoothDeviceInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFBluetoothDeviceInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFBluetoothDeviceInfoMutation getAddress](v7, "getAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      address = v6->_address;
      v6->_address = (NSString *)v9;

      -[_AFBluetoothDeviceInfoMutation getName](v7, "getName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v12;

      -[_AFBluetoothDeviceInfoMutation getDeviceUID](v7, "getDeviceUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v15;

      v6->_vendorID = -[_AFBluetoothDeviceInfoMutation getVendorID](v7, "getVendorID");
      v6->_productID = -[_AFBluetoothDeviceInfoMutation getProductID](v7, "getProductID");
      v6->_isAdvancedAppleAudioDevice = -[_AFBluetoothDeviceInfoMutation getIsAdvancedAppleAudioDevice](v7, "getIsAdvancedAppleAudioDevice");
      v6->_supportsInEarDetection = -[_AFBluetoothDeviceInfoMutation getSupportsInEarDetection](v7, "getSupportsInEarDetection");
      v6->_supportsVoiceTrigger = -[_AFBluetoothDeviceInfoMutation getSupportsVoiceTrigger](v7, "getSupportsVoiceTrigger");
      v6->_supportsJustSiri = -[_AFBluetoothDeviceInfoMutation getSupportsJustSiri](v7, "getSupportsJustSiri");
      v6->_supportsSpokenNotification = -[_AFBluetoothDeviceInfoMutation getSupportsSpokenNotification](v7, "getSupportsSpokenNotification");
      v6->_supportsListeningModeANC = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeANC](v7, "getSupportsListeningModeANC");
      v6->_supportsListeningModeTransparency = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeTransparency](v7, "getSupportsListeningModeTransparency");
      v6->_supportsListeningModeAutomatic = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeAutomatic](v7, "getSupportsListeningModeAutomatic");
      v6->_supportsConversationAwareness = -[_AFBluetoothDeviceInfoMutation getSupportsConversationAwareness](v7, "getSupportsConversationAwareness");
      v6->_supportsPersonalVolume = -[_AFBluetoothDeviceInfoMutation getSupportsPersonalVolume](v7, "getSupportsPersonalVolume");
      v6->_supportsAnnounceCall = -[_AFBluetoothDeviceInfoMutation getSupportsAnnounceCall](v7, "getSupportsAnnounceCall");
      -[_AFBluetoothDeviceInfoMutation getHeadGestureConfiguration](v7, "getHeadGestureConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      headGestureConfiguration = v6->_headGestureConfiguration;
      v6->_headGestureConfiguration = (AFBluetoothHeadGestureConfiguration *)v18;

    }
  }

  return v6;
}

- (AFBluetoothDeviceInfo)init
{
  return -[AFBluetoothDeviceInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFBluetoothDeviceInfo)initWithAddress:(id)a3 name:(id)a4 deviceUID:(id)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7 isAdvancedAppleAudioDevice:(BOOL)a8 supportsInEarDetection:(BOOL)a9 supportsVoiceTrigger:(BOOL)a10 supportsJustSiri:(BOOL)a11 supportsSpokenNotification:(BOOL)a12 supportsListeningModeANC:(BOOL)a13 supportsListeningModeTransparency:(BOOL)a14 supportsListeningModeAutomatic:(BOOL)a15 supportsConversationAwareness:(BOOL)a16 supportsPersonalVolume:(BOOL)a17 supportsAnnounceCall:(BOOL)a18 headGestureConfiguration:(id)a19
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  AFBluetoothDeviceInfo *v29;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  unsigned int v40;
  unsigned int v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  BOOL v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;

  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a19;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __379__AFBluetoothDeviceInfo_initWithAddress_name_deviceUID_vendorID_productID_isAdvancedAppleAudioDevice_supportsInEarDetection_supportsVoiceTrigger_supportsJustSiri_supportsSpokenNotification_supportsListeningModeANC_supportsListeningModeTransparency_supportsListeningModeAutomatic_supportsConversationAwareness_supportsPersonalVolume_supportsAnnounceCall_headGestureConfiguration___block_invoke;
  v35[3] = &unk_1E3A301F0;
  v36 = v21;
  v37 = v22;
  v40 = a6;
  v41 = a7;
  v42 = a8;
  v43 = a9;
  v44 = a10;
  v45 = a11;
  v46 = a12;
  v47 = a13;
  v48 = a14;
  v49 = a15;
  v50 = a16;
  v51 = a17;
  v52 = a18;
  v38 = v23;
  v39 = v24;
  v25 = v24;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = -[AFBluetoothDeviceInfo initWithBuilder:](self, "initWithBuilder:", v35);

  return v29;
}

- (id)description
{
  return -[AFBluetoothDeviceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  objc_super v19;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19.receiver = self;
  v19.super_class = (Class)AFBluetoothDeviceInfo;
  -[AFBluetoothDeviceInfo description](&v19, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("YES");
  if (self->_isAdvancedAppleAudioDevice)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_supportsInEarDetection)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_supportsVoiceTrigger)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_supportsJustSiri)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_supportsSpokenNotification)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_supportsListeningModeANC)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->_supportsListeningModeTransparency)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_supportsListeningModeAutomatic)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_supportsConversationAwareness)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (self->_supportsPersonalVolume)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (!self->_supportsAnnounceCall)
    v6 = CFSTR("NO");
  v17 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {address = %@, name = %@, deviceUID = %@, vendorID = %u, productID = %u, isAdvancedAppleAudioDevice = %@, supportsInEarDetection = %@, supportsVoiceTrigger = %@, supportsJustSiri = %@, supportsSpokenNotification = %@, supportsListeningModeANC = %@, supportsListeningModeTransparency = %@, supportsListeningModeAutomatic = %@, supportsConversationAwareness = %@, supportsPersonalVolume = %@, supportsAnnounceCall = %@, headGestureConfiguration = %@}"), v5, *(_OWORD *)&self->_address, self->_deviceUID, self->_vendorID, self->_productID, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v6,
                  self->_headGestureConfiguration);

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = -[NSString hash](self->_address, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = v4 ^ -[NSUUID hash](self->_deviceUID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_vendorID);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 ^ objc_msgSend(v33, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_productID);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v32, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAdvancedAppleAudioDevice);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v7 ^ objc_msgSend(v31, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInEarDetection);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v30, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsVoiceTrigger);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v29, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsJustSiri);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8 ^ v10 ^ objc_msgSend(v28, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSpokenNotification);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v27, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeANC);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeTransparency);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeAutomatic);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v11 ^ v16 ^ objc_msgSend(v17, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsConversationAwareness);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsPersonalVolume);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAnnounceCall);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v18 ^ v24 ^ -[AFBluetoothHeadGestureConfiguration hash](self->_headGestureConfiguration, "hash");

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  AFBluetoothDeviceInfo *v4;
  AFBluetoothDeviceInfo *v5;
  unsigned int vendorID;
  unsigned int productID;
  _BOOL4 isAdvancedAppleAudioDevice;
  _BOOL4 supportsInEarDetection;
  _BOOL4 supportsVoiceTrigger;
  _BOOL4 supportsJustSiri;
  _BOOL4 supportsSpokenNotification;
  _BOOL4 supportsListeningModeANC;
  _BOOL4 supportsListeningModeTransparency;
  _BOOL4 supportsListeningModeAutomatic;
  _BOOL4 supportsConversationAwareness;
  _BOOL4 supportsPersonalVolume;
  _BOOL4 supportsAnnounceCall;
  NSString *v19;
  NSString *address;
  NSString *v21;
  NSString *name;
  NSUUID *v23;
  NSUUID *deviceUID;
  AFBluetoothHeadGestureConfiguration *v25;
  AFBluetoothHeadGestureConfiguration *headGestureConfiguration;
  BOOL v27;

  v4 = (AFBluetoothDeviceInfo *)a3;
  if (self == v4)
  {
    v27 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      vendorID = self->_vendorID;
      if (vendorID != -[AFBluetoothDeviceInfo vendorID](v5, "vendorID"))
        goto LABEL_27;
      productID = self->_productID;
      if (productID != -[AFBluetoothDeviceInfo productID](v5, "productID"))
        goto LABEL_27;
      isAdvancedAppleAudioDevice = self->_isAdvancedAppleAudioDevice;
      if (isAdvancedAppleAudioDevice != -[AFBluetoothDeviceInfo isAdvancedAppleAudioDevice](v5, "isAdvancedAppleAudioDevice"))goto LABEL_27;
      supportsInEarDetection = self->_supportsInEarDetection;
      if (supportsInEarDetection != -[AFBluetoothDeviceInfo supportsInEarDetection](v5, "supportsInEarDetection"))
        goto LABEL_27;
      supportsVoiceTrigger = self->_supportsVoiceTrigger;
      if (supportsVoiceTrigger != -[AFBluetoothDeviceInfo supportsVoiceTrigger](v5, "supportsVoiceTrigger"))
        goto LABEL_27;
      supportsJustSiri = self->_supportsJustSiri;
      if (supportsJustSiri != -[AFBluetoothDeviceInfo supportsJustSiri](v5, "supportsJustSiri"))
        goto LABEL_27;
      supportsSpokenNotification = self->_supportsSpokenNotification;
      if (supportsSpokenNotification == -[AFBluetoothDeviceInfo supportsSpokenNotification](v5, "supportsSpokenNotification")&& (supportsListeningModeANC = self->_supportsListeningModeANC, supportsListeningModeANC == -[AFBluetoothDeviceInfo supportsListeningModeANC](v5, "supportsListeningModeANC"))&& (supportsListeningModeTransparency = self->_supportsListeningModeTransparency, supportsListeningModeTransparency == -[AFBluetoothDeviceInfo supportsListeningModeTransparency](v5, "supportsListeningModeTransparency"))&& (supportsListeningModeAutomatic = self->_supportsListeningModeAutomatic, supportsListeningModeAutomatic == -[AFBluetoothDeviceInfo supportsListeningModeAutomatic](v5, "supportsListeningModeAutomatic"))&& (supportsConversationAwareness = self->_supportsConversationAwareness, supportsConversationAwareness == -[AFBluetoothDeviceInfo supportsConversationAwareness](v5, "supportsConversationAwareness"))&& (supportsPersonalVolume = self->_supportsPersonalVolume,
            supportsPersonalVolume == -[AFBluetoothDeviceInfo supportsPersonalVolume](v5, "supportsPersonalVolume"))
        && (supportsAnnounceCall = self->_supportsAnnounceCall,
            supportsAnnounceCall == -[AFBluetoothDeviceInfo supportsAnnounceCall](v5, "supportsAnnounceCall")))
      {
        -[AFBluetoothDeviceInfo address](v5, "address");
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        address = self->_address;
        if (address == v19 || -[NSString isEqual:](address, "isEqual:", v19))
        {
          -[AFBluetoothDeviceInfo name](v5, "name");
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();
          name = self->_name;
          if (name == v21 || -[NSString isEqual:](name, "isEqual:", v21))
          {
            -[AFBluetoothDeviceInfo deviceUID](v5, "deviceUID");
            v23 = (NSUUID *)objc_claimAutoreleasedReturnValue();
            deviceUID = self->_deviceUID;
            if (deviceUID == v23 || -[NSUUID isEqual:](deviceUID, "isEqual:", v23))
            {
              -[AFBluetoothDeviceInfo headGestureConfiguration](v5, "headGestureConfiguration");
              v25 = (AFBluetoothHeadGestureConfiguration *)objc_claimAutoreleasedReturnValue();
              headGestureConfiguration = self->_headGestureConfiguration;
              v27 = headGestureConfiguration == v25
                 || -[AFBluetoothHeadGestureConfiguration isEqual:](headGestureConfiguration, "isEqual:", v25);

            }
            else
            {
              v27 = 0;
            }

          }
          else
          {
            v27 = 0;
          }

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
LABEL_27:
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }
  }

  return v27;
}

- (AFBluetoothDeviceInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  AFBluetoothDeviceInfo *v24;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::address"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::name"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::deviceUID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::vendorID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v4, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::productID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::isAdvancedAppleAudioDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsInEarDetection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsVoiceTrigger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsJustSiri"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsSpokenNotification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsListeningModeANC"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsListeningModeTransparency"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsListeningModeAutomatic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsConversationAwareness"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsPersonalVolume"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::supportsAnnounceCall"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFBluetoothDeviceInfo::headGestureConfiguration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v27) = v22;
  LOBYTE(v27) = v20;
  HIBYTE(v26) = (_BYTE)v17;
  BYTE6(v26) = (_BYTE)v15;
  BYTE5(v26) = v16;
  BYTE4(v26) = v14;
  BYTE3(v26) = v12;
  BYTE2(v26) = v10;
  BYTE1(v26) = v28;
  LOBYTE(v26) = v29;
  v24 = -[AFBluetoothDeviceInfo initWithAddress:name:deviceUID:vendorID:productID:isAdvancedAppleAudioDevice:supportsInEarDetection:supportsVoiceTrigger:supportsJustSiri:supportsSpokenNotification:supportsListeningModeANC:supportsListeningModeTransparency:supportsListeningModeAutomatic:supportsConversationAwareness:supportsPersonalVolume:supportsAnnounceCall:headGestureConfiguration:](self, "initWithAddress:name:deviceUID:vendorID:productID:isAdvancedAppleAudioDevice:supportsInEarDetection:supportsVoiceTrigger:supportsJustSiri:supportsSpokenNotification:supportsListeningModeANC:supportsListeningModeTransparency:supportsListeningModeAutomatic:supportsConversationAwareness:supportsPersonalVolume:supportsAnnounceCall:headGestureConfiguration:", v35, v34, v33, v32, v31, v30, v26, v27, v23);

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *address;
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
  id v18;

  address = self->_address;
  v18 = a3;
  objc_msgSend(v18, "encodeObject:forKey:", address, CFSTR("AFBluetoothDeviceInfo::address"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_name, CFSTR("AFBluetoothDeviceInfo::name"));
  objc_msgSend(v18, "encodeObject:forKey:", self->_deviceUID, CFSTR("AFBluetoothDeviceInfo::deviceUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_vendorID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("AFBluetoothDeviceInfo::vendorID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_productID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v6, CFSTR("AFBluetoothDeviceInfo::productID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAdvancedAppleAudioDevice);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("AFBluetoothDeviceInfo::isAdvancedAppleAudioDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsInEarDetection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v8, CFSTR("AFBluetoothDeviceInfo::supportsInEarDetection"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsVoiceTrigger);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("AFBluetoothDeviceInfo::supportsVoiceTrigger"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsJustSiri);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v10, CFSTR("AFBluetoothDeviceInfo::supportsJustSiri"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsSpokenNotification);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("AFBluetoothDeviceInfo::supportsSpokenNotification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeANC);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v12, CFSTR("AFBluetoothDeviceInfo::supportsListeningModeANC"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeTransparency);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("AFBluetoothDeviceInfo::supportsListeningModeTransparency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsListeningModeAutomatic);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v14, CFSTR("AFBluetoothDeviceInfo::supportsListeningModeAutomatic"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsConversationAwareness);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("AFBluetoothDeviceInfo::supportsConversationAwareness"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsPersonalVolume);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v16, CFSTR("AFBluetoothDeviceInfo::supportsPersonalVolume"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAnnounceCall);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("AFBluetoothDeviceInfo::supportsAnnounceCall"));

  objc_msgSend(v18, "encodeObject:forKey:", self->_headGestureConfiguration, CFSTR("AFBluetoothDeviceInfo::headGestureConfiguration"));
}

- (NSString)address
{
  return self->_address;
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (BOOL)isAdvancedAppleAudioDevice
{
  return self->_isAdvancedAppleAudioDevice;
}

- (BOOL)supportsInEarDetection
{
  return self->_supportsInEarDetection;
}

- (BOOL)supportsVoiceTrigger
{
  return self->_supportsVoiceTrigger;
}

- (BOOL)supportsJustSiri
{
  return self->_supportsJustSiri;
}

- (BOOL)supportsSpokenNotification
{
  return self->_supportsSpokenNotification;
}

- (BOOL)supportsListeningModeANC
{
  return self->_supportsListeningModeANC;
}

- (BOOL)supportsListeningModeTransparency
{
  return self->_supportsListeningModeTransparency;
}

- (BOOL)supportsListeningModeAutomatic
{
  return self->_supportsListeningModeAutomatic;
}

- (BOOL)supportsConversationAwareness
{
  return self->_supportsConversationAwareness;
}

- (BOOL)supportsPersonalVolume
{
  return self->_supportsPersonalVolume;
}

- (BOOL)supportsAnnounceCall
{
  return self->_supportsAnnounceCall;
}

- (AFBluetoothHeadGestureConfiguration)headGestureConfiguration
{
  return self->_headGestureConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

void __379__AFBluetoothDeviceInfo_initWithAddress_name_deviceUID_vendorID_productID_isAdvancedAppleAudioDevice_supportsInEarDetection_supportsVoiceTrigger_supportsJustSiri_supportsSpokenNotification_supportsListeningModeANC_supportsListeningModeTransparency_supportsListeningModeAutomatic_supportsConversationAwareness_supportsPersonalVolume_supportsAnnounceCall_headGestureConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAddress:", v3);
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDeviceUID:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setVendorID:", *(unsigned int *)(a1 + 64));
  objc_msgSend(v4, "setProductID:", *(unsigned int *)(a1 + 68));
  objc_msgSend(v4, "setIsAdvancedAppleAudioDevice:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v4, "setSupportsInEarDetection:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v4, "setSupportsVoiceTrigger:", *(unsigned __int8 *)(a1 + 74));
  objc_msgSend(v4, "setSupportsJustSiri:", *(unsigned __int8 *)(a1 + 75));
  objc_msgSend(v4, "setSupportsSpokenNotification:", *(unsigned __int8 *)(a1 + 76));
  objc_msgSend(v4, "setSupportsListeningModeANC:", *(unsigned __int8 *)(a1 + 77));
  objc_msgSend(v4, "setSupportsListeningModeTransparency:", *(unsigned __int8 *)(a1 + 78));
  objc_msgSend(v4, "setSupportsListeningModeAutomatic:", *(unsigned __int8 *)(a1 + 79));
  objc_msgSend(v4, "setSupportsConversationAwareness:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(v4, "setSupportsPersonalVolume:", *(unsigned __int8 *)(a1 + 81));
  objc_msgSend(v4, "setSupportsAnnounceCall:", *(unsigned __int8 *)(a1 + 82));
  objc_msgSend(v4, "setHeadGestureConfiguration:", *(_QWORD *)(a1 + 56));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFBluetoothDeviceInfoMutation *);
  _AFBluetoothDeviceInfoMutation *v5;
  AFBluetoothDeviceInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *address;
  void *v10;
  uint64_t v11;
  NSString *name;
  void *v13;
  uint64_t v14;
  NSUUID *deviceUID;
  void *v16;
  uint64_t v17;
  AFBluetoothHeadGestureConfiguration *headGestureConfiguration;

  v4 = (void (**)(id, _AFBluetoothDeviceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFBluetoothDeviceInfoMutation initWithBase:]([_AFBluetoothDeviceInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFBluetoothDeviceInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFBluetoothDeviceInfo);
      -[_AFBluetoothDeviceInfoMutation getAddress](v5, "getAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      address = v6->_address;
      v6->_address = (NSString *)v8;

      -[_AFBluetoothDeviceInfoMutation getName](v5, "getName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v11;

      -[_AFBluetoothDeviceInfoMutation getDeviceUID](v5, "getDeviceUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v14;

      v6->_vendorID = -[_AFBluetoothDeviceInfoMutation getVendorID](v5, "getVendorID");
      v6->_productID = -[_AFBluetoothDeviceInfoMutation getProductID](v5, "getProductID");
      v6->_isAdvancedAppleAudioDevice = -[_AFBluetoothDeviceInfoMutation getIsAdvancedAppleAudioDevice](v5, "getIsAdvancedAppleAudioDevice");
      v6->_supportsInEarDetection = -[_AFBluetoothDeviceInfoMutation getSupportsInEarDetection](v5, "getSupportsInEarDetection");
      v6->_supportsVoiceTrigger = -[_AFBluetoothDeviceInfoMutation getSupportsVoiceTrigger](v5, "getSupportsVoiceTrigger");
      v6->_supportsJustSiri = -[_AFBluetoothDeviceInfoMutation getSupportsJustSiri](v5, "getSupportsJustSiri");
      v6->_supportsSpokenNotification = -[_AFBluetoothDeviceInfoMutation getSupportsSpokenNotification](v5, "getSupportsSpokenNotification");
      v6->_supportsListeningModeANC = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeANC](v5, "getSupportsListeningModeANC");
      v6->_supportsListeningModeTransparency = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeTransparency](v5, "getSupportsListeningModeTransparency");
      v6->_supportsListeningModeAutomatic = -[_AFBluetoothDeviceInfoMutation getSupportsListeningModeAutomatic](v5, "getSupportsListeningModeAutomatic");
      v6->_supportsConversationAwareness = -[_AFBluetoothDeviceInfoMutation getSupportsConversationAwareness](v5, "getSupportsConversationAwareness");
      v6->_supportsPersonalVolume = -[_AFBluetoothDeviceInfoMutation getSupportsPersonalVolume](v5, "getSupportsPersonalVolume");
      v6->_supportsAnnounceCall = -[_AFBluetoothDeviceInfoMutation getSupportsAnnounceCall](v5, "getSupportsAnnounceCall");
      -[_AFBluetoothDeviceInfoMutation getHeadGestureConfiguration](v5, "getHeadGestureConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      headGestureConfiguration = v6->_headGestureConfiguration;
      v6->_headGestureConfiguration = (AFBluetoothHeadGestureConfiguration *)v17;

    }
    else
    {
      v6 = (AFBluetoothDeviceInfo *)-[AFBluetoothDeviceInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFBluetoothDeviceInfo *)-[AFBluetoothDeviceInfo copy](self, "copy");
  }

  return v6;
}

@end
