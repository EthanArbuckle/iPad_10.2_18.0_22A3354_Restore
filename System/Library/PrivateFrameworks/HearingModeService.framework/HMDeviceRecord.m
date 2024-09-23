@implementation HMDeviceRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (char)getHMMultiStateFromPMEState:(unsigned __int8)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (HMDeviceRecord)init
{
  HMDeviceRecord *v2;
  HMDeviceRecord *v3;
  HMDeviceRecord *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDeviceRecord;
  v2 = -[HMDeviceRecord init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (HMDeviceRecord)initWithCoder:(id)a3
{
  id v4;
  HMDeviceRecord *v5;
  id v6;
  id v7;
  void **p_pmeMediaLossDataLeft;
  void **p_pmeMediaLossDataRight;
  void **p_pmeVoiceLossDataLeft;
  void **p_pmeVoiceLossDataRight;
  uint64_t v12;
  NSArray *pmeMediaLossPresetsLeft;
  uint64_t v14;
  NSArray *pmeMediaLossPresetsRight;
  uint64_t v16;
  NSArray *pmeVoiceLossPresetsLeft;
  uint64_t v18;
  NSArray *pmeVoiceLossPresetsRight;
  HMDeviceRecord *v20;

  v4 = a3;
  v5 = -[HMDeviceRecord init](self, "init");
  if (v5)
  {
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent())
      v5->_pmeMediaEnabled = 0;
    objc_opt_class();
    p_pmeMediaLossDataLeft = (void **)&v5->_pmeMediaLossDataLeft;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeMediaLossDataRight = (void **)&v5->_pmeMediaLossDataRight;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeVoiceLossDataLeft = (void **)&v5->_pmeVoiceLossDataLeft;
    NSDecodeObjectIfPresent();
    objc_opt_class();
    p_pmeVoiceLossDataRight = (void **)&v5->_pmeVoiceLossDataRight;
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent())
      v5->_pmeVoiceEnabled = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_pmeVoiceEnrolled = 0;
    if (*p_pmeMediaLossDataLeft)
    {
      HMEarLossDataToArray(*p_pmeMediaLossDataLeft);
      v12 = objc_claimAutoreleasedReturnValue();
      pmeMediaLossPresetsLeft = v5->_pmeMediaLossPresetsLeft;
      v5->_pmeMediaLossPresetsLeft = (NSArray *)v12;

    }
    if (*p_pmeMediaLossDataRight)
    {
      HMEarLossDataToArray(*p_pmeMediaLossDataRight);
      v14 = objc_claimAutoreleasedReturnValue();
      pmeMediaLossPresetsRight = v5->_pmeMediaLossPresetsRight;
      v5->_pmeMediaLossPresetsRight = (NSArray *)v14;

    }
    if (*p_pmeVoiceLossDataLeft)
    {
      HMEarLossDataToArray(*p_pmeVoiceLossDataLeft);
      v16 = objc_claimAutoreleasedReturnValue();
      pmeVoiceLossPresetsLeft = v5->_pmeVoiceLossPresetsLeft;
      v5->_pmeVoiceLossPresetsLeft = (NSArray *)v16;

    }
    if (*p_pmeVoiceLossDataRight)
    {
      HMEarLossDataToArray(*p_pmeVoiceLossDataRight);
      v18 = objc_claimAutoreleasedReturnValue();
      pmeVoiceLossPresetsRight = v5->_pmeVoiceLossPresetsRight;
      v5->_pmeVoiceLossPresetsRight = (NSArray *)v18;

    }
    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *bluetoothUUID;
  NSString *bluetoothAddress;
  NSData *bluetoothAddressData;
  NSData *pmeMediaLossDataLeft;
  NSData *pmeMediaLossDataRight;
  NSData *pmeVoiceLossDataLeft;
  NSData *pmeVoiceLossDataRight;
  id v12;

  v4 = a3;
  bluetoothUUID = self->_bluetoothUUID;
  v12 = v4;
  if (bluetoothUUID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bluetoothUUID, CFSTR("btUUID"));
    v4 = v12;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    objc_msgSend(v12, "encodeObject:forKey:", bluetoothAddress, CFSTR("btAdS"));
    v4 = v12;
  }
  bluetoothAddressData = self->_bluetoothAddressData;
  if (bluetoothAddressData)
  {
    objc_msgSend(v12, "encodeObject:forKey:", bluetoothAddressData, CFSTR("btAd"));
    v4 = v12;
  }
  if (self->_pmeMediaEnabled)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }
  pmeMediaLossDataLeft = self->_pmeMediaLossDataLeft;
  if (pmeMediaLossDataLeft)
  {
    objc_msgSend(v12, "encodeObject:forKey:", pmeMediaLossDataLeft, CFSTR("pmML"));
    v4 = v12;
  }
  pmeMediaLossDataRight = self->_pmeMediaLossDataRight;
  if (pmeMediaLossDataRight)
  {
    objc_msgSend(v12, "encodeObject:forKey:", pmeMediaLossDataRight, CFSTR("pmMR"));
    v4 = v12;
  }
  pmeVoiceLossDataLeft = self->_pmeVoiceLossDataLeft;
  if (pmeVoiceLossDataLeft)
  {
    objc_msgSend(v12, "encodeObject:forKey:", pmeVoiceLossDataLeft, CFSTR("pmVL"));
    v4 = v12;
  }
  pmeVoiceLossDataRight = self->_pmeVoiceLossDataRight;
  if (pmeVoiceLossDataRight)
  {
    objc_msgSend(v12, "encodeObject:forKey:", pmeVoiceLossDataRight, CFSTR("pmVR"));
    v4 = v12;
  }
  if (self->_pmeVoiceEnabled)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }
  if (self->_pmeVoiceEnrolled)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    v4 = v12;
  }

}

- (id)description
{
  return -[HMDeviceRecord descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  NSString *bluetoothAddress;
  id v7;
  NSString *bluetoothUUID;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v15;
  NSString *v16;
  NSString *v17;

  objc_msgSend((id)objc_opt_class(), "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v5 = 0;

  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v16 = bluetoothAddress;
    NSAppendPrintF_safe();
    v7 = v5;

    v5 = v7;
  }
  bluetoothUUID = self->_bluetoothUUID;
  if (bluetoothUUID)
  {
    v17 = bluetoothUUID;
    NSAppendPrintF_safe();
    v9 = v5;

    v5 = v9;
  }
  if (self->_pmeMediaEnabled)
  {
    NSAppendPrintF_safe();
    v10 = v5;

    v5 = v10;
  }
  if (self->_pmeVoiceEnabled)
  {
    NSAppendPrintF_safe();
    v11 = v5;

    v5 = v11;
  }
  if (self->_pmeVoiceEnrolled)
  {
    NSAppendPrintF_safe();
    v12 = v5;

    v5 = v12;
  }
  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    v13 = v5;

    v5 = v13;
  }
  return v5;
}

- (BOOL)updateWithAADevice:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *v7;
  NSString *p_isa;
  BOOL v9;
  char v10;
  NSString *bluetoothAddress;
  NSString *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  char v17;
  NSString *bluetoothUUID;
  NSString *v19;
  char v20;
  AudioAccessoryDevice *aaDevice;

  v4 = a3;
  objc_msgSend(v4, "bluetoothAddressData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_bluetoothAddressData;
  v7 = v5;
  p_isa = (NSString *)&v7->super.isa;
  v9 = v6 != v7;
  if (v6 == v7)
  {

    bluetoothAddress = p_isa;
  }
  else
  {
    if ((v7 != 0) != (v6 == 0))
    {
      v10 = -[NSData isEqual:](v6, "isEqual:", v7);

      if ((v10 & 1) != 0)
      {
        v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_bluetoothAddressData, v5);
    CUPrintNSDataAddress();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    bluetoothAddress = self->_bluetoothAddress;
    self->_bluetoothAddress = v12;
  }

LABEL_9:
  objc_msgSend(v4, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_bluetoothUUID;
  v15 = v13;
  v16 = v15;
  if (v14 == v15)
  {

    bluetoothUUID = v16;
  }
  else
  {
    if ((v15 != 0) != (v14 == 0))
    {
      v17 = -[NSString isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    v19 = v16;
    bluetoothUUID = self->_bluetoothUUID;
    self->_bluetoothUUID = v19;
    v9 = 1;
  }

LABEL_17:
  v20 = objc_msgSend(v4, "listeningModeOffAllowed");
  if (_os_feature_enabled_impl() && self->_listeningModeOffAllowed != v20)
  {
    self->_listeningModeOffAllowed = v20;
    v9 = 1;
  }
  aaDevice = self->_aaDevice;
  self->_aaDevice = (AudioAccessoryDevice *)v4;

  return v9;
}

- (BOOL)updateWithPMEConfigData:(id)a3
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  int pmeMediaEnabled;
  BOOL v9;
  char v10;
  char v11;
  void *v12;
  NSData *pmeVoiceLossDataLeft;
  NSData *v14;
  NSData *v15;
  NSData *v16;
  char v17;
  NSData *v18;
  NSData *v19;
  void *v20;
  NSData *pmeMediaLossDataLeft;
  NSData *v22;
  NSData *v23;
  NSData *v24;
  char v25;
  NSData *v26;
  NSData *v27;
  void *v28;
  NSData *pmeVoiceLossDataRight;
  NSData *v30;
  NSData *v31;
  NSData *v32;
  char v33;
  NSData *v34;
  NSData *v35;
  void *v36;
  NSData *pmeMediaLossDataRight;
  NSData *v38;
  NSData *v39;
  NSData *v40;
  char v41;
  NSData *v42;
  NSData *v43;
  _OWORD v45[8];
  int v46;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v46 = 0;
    memset(v45, 0, sizeof(v45));
    objc_msgSend(v5, "getBytes:length:", v45, 132);
    v7 = +[HMDeviceRecord getHMMultiStateFromPMEState:](HMDeviceRecord, "getHMMultiStateFromPMEState:", BYTE3(v45[0]));
    pmeMediaEnabled = self->_pmeMediaEnabled;
    v9 = v7 != pmeMediaEnabled;
    if (v7 != pmeMediaEnabled)
      self->_pmeMediaEnabled = v7;
    v10 = +[HMDeviceRecord getHMMultiStateFromPMEState:](HMDeviceRecord, "getHMMultiStateFromPMEState:", BYTE2(v45[0]));
    if (self->_pmeVoiceEnabled != v10)
    {
      self->_pmeVoiceEnabled = v10;
      v9 = 1;
    }
    v11 = +[HMDeviceRecord getHMMultiStateFromPMEState:](HMDeviceRecord, "getHMMultiStateFromPMEState:", BYTE1(v45[0]));
    if (self->_pmeVoiceEnrolled != v11)
    {
      self->_pmeVoiceEnrolled = v11;
      v9 = 1;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", (char *)v45 + 4, 32);
    pmeVoiceLossDataLeft = self->_pmeVoiceLossDataLeft;
    v14 = v12;
    v15 = pmeVoiceLossDataLeft;
    if (v14 == v15)
    {

      v18 = v14;
    }
    else
    {
      v16 = v15;
      if ((v14 == 0) != (v15 != 0))
      {
        v17 = -[NSData isEqual:](v14, "isEqual:", v15);

        if ((v17 & 1) != 0)
        {
LABEL_19:
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", (char *)&v45[2] + 4, 32);
          pmeMediaLossDataLeft = self->_pmeMediaLossDataLeft;
          v22 = v20;
          v23 = pmeMediaLossDataLeft;
          if (v22 == v23)
          {

            v26 = v22;
          }
          else
          {
            v24 = v23;
            if ((v22 == 0) != (v23 != 0))
            {
              v25 = -[NSData isEqual:](v22, "isEqual:", v23);

              if ((v25 & 1) != 0)
              {
LABEL_27:
                v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", (char *)&v45[4] + 4, 32);
                pmeVoiceLossDataRight = self->_pmeVoiceLossDataRight;
                v30 = v28;
                v31 = pmeVoiceLossDataRight;
                if (v30 == v31)
                {

                  v34 = v30;
                }
                else
                {
                  v32 = v31;
                  if ((v30 == 0) != (v31 != 0))
                  {
                    v33 = -[NSData isEqual:](v30, "isEqual:", v31);

                    if ((v33 & 1) != 0)
                    {
LABEL_35:
                      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", (char *)&v45[6] + 4, 32);
                      pmeMediaLossDataRight = self->_pmeMediaLossDataRight;
                      v38 = v36;
                      v39 = pmeMediaLossDataRight;
                      if (v38 == v39)
                      {

                        v42 = v38;
                      }
                      else
                      {
                        v40 = v39;
                        if ((v38 == 0) != (v39 != 0))
                        {
                          v41 = -[NSData isEqual:](v38, "isEqual:", v39);

                          if ((v41 & 1) != 0)
                            goto LABEL_43;
                        }
                        else
                        {

                        }
                        v43 = v38;
                        v42 = self->_pmeMediaLossDataRight;
                        self->_pmeMediaLossDataRight = v43;
                        v9 = 1;
                      }

LABEL_43:
                      objc_storeStrong((id *)&self->_configDataPME, a3);
                      goto LABEL_46;
                    }
                  }
                  else
                  {

                  }
                  v35 = v30;
                  v34 = self->_pmeVoiceLossDataRight;
                  self->_pmeVoiceLossDataRight = v35;
                  v9 = 1;
                }

                goto LABEL_35;
              }
            }
            else
            {

            }
            v27 = v22;
            v26 = self->_pmeMediaLossDataLeft;
            self->_pmeMediaLossDataLeft = v27;
            v9 = 1;
          }

          goto LABEL_27;
        }
      }
      else
      {

      }
      v19 = v14;
      v18 = self->_pmeVoiceLossDataLeft;
      self->_pmeVoiceLossDataLeft = v19;
      v9 = 1;
    }

    goto LABEL_19;
  }
  if (gLogCategory_HMDeviceRecord <= 90
    && (gLogCategory_HMDeviceRecord != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = 0;
LABEL_46:

  return v9;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSData)bluetoothAddressData
{
  return self->_bluetoothAddressData;
}

- (NSString)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (char)pmeMediaEnabled
{
  return self->_pmeMediaEnabled;
}

- (NSArray)pmeMediaLossPresetsLeft
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)pmeMediaLossPresetsRight
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)pmeVoiceLossPresetsLeft
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)pmeVoiceLossPresetsRight
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (char)pmeVoiceEnabled
{
  return self->_pmeVoiceEnabled;
}

- (char)pmeVoiceEnrolled
{
  return self->_pmeVoiceEnrolled;
}

- (AudioAccessoryDevice)aaDevice
{
  return self->_aaDevice;
}

- (void)setAaDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (HMDeviceCloudRecordInfo)cloudRecord
{
  return self->_cloudRecord;
}

- (void)setCloudRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)configDataPME
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfigDataPME:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSData)pmeMediaLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPmeMediaLossDataLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSData)pmeMediaLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPmeMediaLossDataRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSData)pmeVoiceLossDataLeft
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPmeVoiceLossDataLeft:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSData)pmeVoiceLossDataRight
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPmeVoiceLossDataRight:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pmeVoiceLossDataRight, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossDataLeft, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossDataRight, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossDataLeft, 0);
  objc_storeStrong((id *)&self->_configDataPME, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_aaDevice, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossPresetsRight, 0);
  objc_storeStrong((id *)&self->_pmeVoiceLossPresetsLeft, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossPresetsRight, 0);
  objc_storeStrong((id *)&self->_pmeMediaLossPresetsLeft, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddressData, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
