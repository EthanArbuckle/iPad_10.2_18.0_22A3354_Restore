@implementation HMDeviceDiagnosticRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)getHMDiagnosticStatusForValue:(unsigned __int8)a3
{
  if (a3 < 5u)
    return a3 + 1;
  else
    return 0;
}

+ (int)getHMDiagnosticMeasurementStatusForValue:(unsigned __int8)a3
{
  if (a3 < 8u)
    return a3 + 1;
  else
    return 0;
}

- (HMDeviceDiagnosticRecord)initWithCoder:(id)a3
{
  id v4;
  HMDeviceDiagnosticRecord *v5;
  id v6;
  id v7;
  HMDeviceDiagnosticRecord *v8;

  v4 = a3;
  v5 = -[HMDeviceDiagnosticRecord init](self, "init");
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
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent())
      v5->_errMicStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_errMicStatusRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_frontVentStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_frontVentStatusRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_generalSystemStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_generalSystemStatusRight = 0;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    if (NSDecodeSInt64RangedIfPresent())
      v5->_latestMeasurementResultLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_latestMeasurementResultRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_rearVentStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_rearVentStatusRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_refMicStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_refMicStatusRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_speakerStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_speakerStatusRight = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_vceMicStatusLeft = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_vceMicStatusRight = 0;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *bluetoothUUID;
  NSString *bluetoothAddress;
  NSNumber *daysSinceLastMeasurementLeft;
  NSNumber *daysSinceLastMeasurementRight;
  NSNumber *daysSinceLastHarmonicMeasurementLeft;
  NSNumber *daysSinceLastHarmonicMeasurementRight;
  uint64_t errMicStatusLeft;
  uint64_t errMicStatusRight;
  uint64_t frontVentStatusLeft;
  uint64_t frontVentStatusRight;
  uint64_t generalSystemStatusLeft;
  uint64_t generalSystemStatusRight;
  NSDate *lastMeasurementTimestampLeft;
  NSDate *lastMeasurementTimestampRight;
  uint64_t latestMeasurementResultLeft;
  uint64_t latestMeasurementResultRight;
  uint64_t rearVentStatusLeft;
  uint64_t rearVentStatusRight;
  uint64_t refMicStatusLeft;
  uint64_t refMicStatusRight;
  uint64_t speakerStatusLeft;
  uint64_t speakerStatusRight;
  uint64_t vceMicStatusLeft;
  uint64_t vceMicStatusRight;
  NSNumber *version;
  id v30;

  v4 = a3;
  bluetoothUUID = self->_bluetoothUUID;
  v30 = v4;
  if (bluetoothUUID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bluetoothUUID, CFSTR("btUUID"));
    v4 = v30;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    objc_msgSend(v30, "encodeObject:forKey:", bluetoothAddress, CFSTR("btAdS"));
    v4 = v30;
  }
  daysSinceLastMeasurementLeft = self->_daysSinceLastMeasurementLeft;
  if (daysSinceLastMeasurementLeft)
  {
    objc_msgSend(v30, "encodeObject:forKey:", daysSinceLastMeasurementLeft, CFSTR("dslml"));
    v4 = v30;
  }
  daysSinceLastMeasurementRight = self->_daysSinceLastMeasurementRight;
  if (daysSinceLastMeasurementRight)
  {
    objc_msgSend(v30, "encodeObject:forKey:", daysSinceLastMeasurementRight, CFSTR("dslmr"));
    v4 = v30;
  }
  daysSinceLastHarmonicMeasurementLeft = self->_daysSinceLastHarmonicMeasurementLeft;
  if (daysSinceLastHarmonicMeasurementLeft)
  {
    objc_msgSend(v30, "encodeObject:forKey:", daysSinceLastHarmonicMeasurementLeft, CFSTR("dsHml"));
    v4 = v30;
  }
  daysSinceLastHarmonicMeasurementRight = self->_daysSinceLastHarmonicMeasurementRight;
  if (daysSinceLastHarmonicMeasurementRight)
  {
    objc_msgSend(v30, "encodeObject:forKey:", daysSinceLastHarmonicMeasurementRight, CFSTR("dsHmr"));
    v4 = v30;
  }
  errMicStatusLeft = self->_errMicStatusLeft;
  if ((_DWORD)errMicStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", errMicStatusLeft, CFSTR("errFL"));
    v4 = v30;
  }
  errMicStatusRight = self->_errMicStatusRight;
  if ((_DWORD)errMicStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", errMicStatusRight, CFSTR("errFR"));
    v4 = v30;
  }
  frontVentStatusLeft = self->_frontVentStatusLeft;
  if ((_DWORD)frontVentStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", frontVentStatusLeft, CFSTR("fvnFL"));
    v4 = v30;
  }
  frontVentStatusRight = self->_frontVentStatusRight;
  if ((_DWORD)frontVentStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", frontVentStatusRight, CFSTR("fvnFR"));
    v4 = v30;
  }
  generalSystemStatusLeft = self->_generalSystemStatusLeft;
  if ((_DWORD)generalSystemStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", generalSystemStatusLeft, CFSTR("gnrFL"));
    v4 = v30;
  }
  generalSystemStatusRight = self->_generalSystemStatusRight;
  if ((_DWORD)generalSystemStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", generalSystemStatusRight, CFSTR("gnrFR"));
    v4 = v30;
  }
  lastMeasurementTimestampLeft = self->_lastMeasurementTimestampLeft;
  if (lastMeasurementTimestampLeft)
  {
    objc_msgSend(v30, "encodeObject:forKey:", lastMeasurementTimestampLeft, CFSTR("lmTsL"));
    v4 = v30;
  }
  lastMeasurementTimestampRight = self->_lastMeasurementTimestampRight;
  if (lastMeasurementTimestampRight)
  {
    objc_msgSend(v30, "encodeObject:forKey:", lastMeasurementTimestampRight, CFSTR("lmTsR"));
    v4 = v30;
  }
  latestMeasurementResultLeft = self->_latestMeasurementResultLeft;
  if ((_DWORD)latestMeasurementResultLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", latestMeasurementResultLeft, CFSTR("lmRsL"));
    v4 = v30;
  }
  latestMeasurementResultRight = self->_latestMeasurementResultRight;
  if ((_DWORD)latestMeasurementResultRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", latestMeasurementResultRight, CFSTR("lmRsR"));
    v4 = v30;
  }
  rearVentStatusLeft = self->_rearVentStatusLeft;
  if ((_DWORD)rearVentStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", rearVentStatusLeft, CFSTR("rvnFL"));
    v4 = v30;
  }
  rearVentStatusRight = self->_rearVentStatusRight;
  if ((_DWORD)rearVentStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", rearVentStatusRight, CFSTR("rvnFR"));
    v4 = v30;
  }
  refMicStatusLeft = self->_refMicStatusLeft;
  if ((_DWORD)refMicStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", refMicStatusLeft, CFSTR("refFL"));
    v4 = v30;
  }
  refMicStatusRight = self->_refMicStatusRight;
  if ((_DWORD)refMicStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", refMicStatusRight, CFSTR("refFR"));
    v4 = v30;
  }
  speakerStatusLeft = self->_speakerStatusLeft;
  if ((_DWORD)speakerStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", speakerStatusLeft, CFSTR("sprFL"));
    v4 = v30;
  }
  speakerStatusRight = self->_speakerStatusRight;
  if ((_DWORD)speakerStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", speakerStatusRight, CFSTR("sprFR"));
    v4 = v30;
  }
  vceMicStatusLeft = self->_vceMicStatusLeft;
  if ((_DWORD)vceMicStatusLeft)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", vceMicStatusLeft, CFSTR("vceFL"));
    v4 = v30;
  }
  vceMicStatusRight = self->_vceMicStatusRight;
  if ((_DWORD)vceMicStatusRight)
  {
    objc_msgSend(v30, "encodeInteger:forKey:", vceMicStatusRight, CFSTR("vceFR"));
    v4 = v30;
  }
  version = self->_version;
  if (version)
  {
    objc_msgSend(v30, "encodeObject:forKey:", version, CFSTR("versn"));
    v4 = v30;
  }

}

- (id)description
{
  return -[HMDeviceDiagnosticRecord descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v5;
  id v6;
  NSString *v7;
  id v8;
  NSString *v9;
  id v10;
  NSNumber *v11;
  id v12;
  NSNumber *v13;
  id v14;
  NSNumber *v15;
  id v16;
  NSNumber *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSDate *v25;
  id v26;
  NSDate *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSNumber *v38;
  id v39;
  id v40;
  id v41;
  void *v43;

  objc_msgSend((id)objc_opt_class(), "description");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v5 = 0;

  if (a3 <= 20)
  {
    NSAppendPrintF_safe();
    v6 = v5;

    v5 = v6;
  }
  v7 = self->_bluetoothAddress;
  if (v7)
  {
    NSAppendPrintF_safe();
    v8 = v5;

    v5 = v8;
  }

  v9 = self->_bluetoothUUID;
  if (v9)
  {
    NSAppendPrintF_safe();
    v10 = v5;

    v5 = v10;
  }

  v11 = self->_daysSinceLastMeasurementLeft;
  if (v11)
  {
    NSAppendPrintF_safe();
    v12 = v5;

    v5 = v12;
  }

  v13 = self->_daysSinceLastMeasurementRight;
  if (v13)
  {
    NSAppendPrintF_safe();
    v14 = v5;

    v5 = v14;
  }

  v15 = self->_daysSinceLastHarmonicMeasurementLeft;
  if (v15)
  {
    NSAppendPrintF_safe();
    v16 = v5;

    v5 = v16;
  }

  v17 = self->_daysSinceLastHarmonicMeasurementRight;
  if (v17)
  {
    NSAppendPrintF_safe();
    v18 = v5;

    v5 = v18;
  }

  if (self->_errMicStatusLeft)
  {
    NSAppendPrintF_safe();
    v19 = v5;

    v5 = v19;
  }
  if (self->_errMicStatusRight)
  {
    NSAppendPrintF_safe();
    v20 = v5;

    v5 = v20;
  }
  if (self->_generalSystemStatusLeft)
  {
    NSAppendPrintF_safe();
    v21 = v5;

    v5 = v21;
  }
  if (self->_generalSystemStatusRight)
  {
    NSAppendPrintF_safe();
    v22 = v5;

    v5 = v22;
  }
  if (self->_frontVentStatusLeft)
  {
    NSAppendPrintF_safe();
    v23 = v5;

    v5 = v23;
  }
  if (self->_frontVentStatusRight)
  {
    NSAppendPrintF_safe();
    v24 = v5;

    v5 = v24;
  }
  v25 = self->_lastMeasurementTimestampLeft;
  if (v25)
  {
    NSAppendPrintF_safe();
    v26 = v5;

    v5 = v26;
  }

  v27 = self->_lastMeasurementTimestampRight;
  if (v27)
  {
    NSAppendPrintF_safe();
    v28 = v5;

    v5 = v28;
  }

  if (self->_latestMeasurementResultLeft)
  {
    NSAppendPrintF_safe();
    v29 = v5;

    if (self->_latestMeasurementResultLeft)
    {
      NSAppendPrintF_safe();
      v5 = v29;

    }
    else
    {
      v5 = v29;
    }
  }
  if (self->_rearVentStatusLeft)
  {
    NSAppendPrintF_safe();
    v30 = v5;

    v5 = v30;
  }
  if (self->_rearVentStatusRight)
  {
    NSAppendPrintF_safe();
    v31 = v5;

    v5 = v31;
  }
  if (self->_refMicStatusLeft)
  {
    NSAppendPrintF_safe();
    v32 = v5;

    v5 = v32;
  }
  if (self->_refMicStatusRight)
  {
    NSAppendPrintF_safe();
    v33 = v5;

    v5 = v33;
  }
  if (self->_speakerStatusLeft)
  {
    NSAppendPrintF_safe();
    v34 = v5;

    v5 = v34;
  }
  if (self->_speakerStatusRight)
  {
    NSAppendPrintF_safe();
    v35 = v5;

    v5 = v35;
  }
  if (self->_vceMicStatusLeft)
  {
    NSAppendPrintF_safe();
    v36 = v5;

    v5 = v36;
  }
  if (self->_vceMicStatusRight)
  {
    NSAppendPrintF_safe();
    v37 = v5;

    v5 = v37;
  }
  v38 = self->_version;
  if (v38)
  {
    NSAppendPrintF_safe();
    v39 = v5;

    v5 = v39;
  }

  if (a3 < 21)
  {
    NSAppendPrintF_safe();
    v40 = v5;

    v5 = v40;
  }
  v41 = v5;

  return v41;
}

- (void)updateWithHMDeviceRecord:(id)a3
{
  id v4;
  NSString *v5;
  NSString *bluetoothAddress;
  NSString *v7;
  NSString *bluetoothUUID;
  NSString *v9;

  v4 = a3;
  objc_msgSend(v4, "bluetoothAddress");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  bluetoothAddress = self->_bluetoothAddress;
  self->_bluetoothAddress = v5;
  v9 = v5;

  objc_msgSend(v4, "bluetoothUUID");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  bluetoothUUID = self->_bluetoothUUID;
  self->_bluetoothUUID = v7;

}

- (void)updateWithDiagnosticData:(id)a3
{
  id v4;
  void *v5;
  NSNumber *v6;
  NSNumber *version;
  unsigned __int8 v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v8 = 0;
    objc_msgSend(v5, "getBytes:length:", &v8, 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", v8);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v6;

    if (v8 == 3)
    {
      -[HMDeviceDiagnosticRecord updateWithMeasurementDataVersion3:](self, "updateWithMeasurementDataVersion3:", v5);
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      -[HMDeviceDiagnosticRecord updateWithMeasurementDataVersion2:](self, "updateWithMeasurementDataVersion2:", v5);
      goto LABEL_14;
    }
    if (gLogCategory_HMDeviceDiagnosticRecord <= 90
      && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
LABEL_14:

}

- (void)updateWithMeasurementDataVersion2:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *daysSinceLastMeasurementLeft;
  NSNumber *v7;
  NSNumber *daysSinceLastMeasurementRight;
  NSNumber *v9;
  NSNumber *daysSinceLastHarmonicMeasurementLeft;
  NSNumber *v11;
  NSNumber *daysSinceLastHarmonicMeasurementRight;
  _QWORD v13[3];
  char v14;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 0x18)
  {
    memset(v13, 0, sizeof(v13));
    v14 = 0;
    objc_msgSend(v4, "getBytes:length:", v13, 25);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)v13 + 1));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    daysSinceLastMeasurementLeft = self->_daysSinceLastMeasurementLeft;
    self->_daysSinceLastMeasurementLeft = v5;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)v13 + 3));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    daysSinceLastMeasurementRight = self->_daysSinceLastMeasurementRight;
    self->_daysSinceLastMeasurementRight = v7;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)&v13[1] + 5));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    daysSinceLastHarmonicMeasurementLeft = self->_daysSinceLastHarmonicMeasurementLeft;
    self->_daysSinceLastHarmonicMeasurementLeft = v9;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", *(unsigned __int16 *)((char *)&v13[1] + 7));
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    daysSinceLastHarmonicMeasurementRight = self->_daysSinceLastHarmonicMeasurementRight;
    self->_daysSinceLastHarmonicMeasurementRight = v11;

    -[HMDeviceDiagnosticRecord updateWithMeasurementResultLeft:measurementResultRight:](self, "updateWithMeasurementResultLeft:measurementResultRight:", *(unsigned int *)((char *)v13 + 5), *(unsigned int *)((char *)&v13[1] + 1));
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)updateWithMeasurementDataVersion3:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastMeasurementTimestampLeft;
  NSDate *v7;
  NSDate *lastMeasurementTimestampRight;
  _OWORD v9[2];
  char v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") > 0x20)
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
    objc_msgSend(v4, "getBytes:length:", v9, 33);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)*(unint64_t *)((char *)v9 + 1));
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastMeasurementTimestampLeft = self->_lastMeasurementTimestampLeft;
    self->_lastMeasurementTimestampLeft = v5;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)*(unint64_t *)((char *)v9 + 9));
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastMeasurementTimestampRight = self->_lastMeasurementTimestampRight;
    self->_lastMeasurementTimestampRight = v7;

    -[HMDeviceDiagnosticRecord updateWithMeasurementResultLeft:measurementResultRight:](self, "updateWithMeasurementResultLeft:measurementResultRight:", *(unsigned int *)((char *)&v9[1] + 1), *(unsigned int *)((char *)&v9[1] + 5));
  }
  else if (gLogCategory_HMDeviceDiagnosticRecord <= 90
         && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)updateWithMeasurementResultLeft:(unsigned int)a3 measurementResultRight:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSString *bluetoothUUID;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (gLogCategory_HMDeviceDiagnosticRecord <= 10
    && (gLogCategory_HMDeviceDiagnosticRecord != -1 || _LogCategory_Initialize()))
  {
    v8 = v5;
    v9 = v4;
    bluetoothUUID = self->_bluetoothUUID;
    LogPrintF();
  }
  self->_generalSystemStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", v5 & 7, bluetoothUUID, v8, v9);
  self->_generalSystemStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", v4 & 7);
  self->_latestMeasurementResultLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticMeasurementStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticMeasurementStatusForValue:", 0);
  self->_latestMeasurementResultRight = +[HMDeviceDiagnosticRecord getHMDiagnosticMeasurementStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticMeasurementStatusForValue:", 0);
  self->_speakerStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_speakerStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_rearVentStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_rearVentStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_frontVentStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_frontVentStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_vceMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_vceMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_refMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_refMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_errMicStatusLeft = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
  self->_errMicStatusRight = +[HMDeviceDiagnosticRecord getHMDiagnosticStatusForValue:](HMDeviceDiagnosticRecord, "getHMDiagnosticStatusForValue:", 0);
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (NSNumber)daysSinceLastMeasurementLeft
{
  return self->_daysSinceLastMeasurementLeft;
}

- (NSNumber)daysSinceLastMeasurementRight
{
  return self->_daysSinceLastMeasurementRight;
}

- (NSNumber)daysSinceLastHarmonicMeasurementLeft
{
  return self->_daysSinceLastHarmonicMeasurementLeft;
}

- (NSNumber)daysSinceLastHarmonicMeasurementRight
{
  return self->_daysSinceLastHarmonicMeasurementRight;
}

- (int)errMicStatusLeft
{
  return self->_errMicStatusLeft;
}

- (int)errMicStatusRight
{
  return self->_errMicStatusRight;
}

- (int)frontVentStatusLeft
{
  return self->_frontVentStatusLeft;
}

- (int)frontVentStatusRight
{
  return self->_frontVentStatusRight;
}

- (int)generalSystemStatusLeft
{
  return self->_generalSystemStatusLeft;
}

- (int)generalSystemStatusRight
{
  return self->_generalSystemStatusRight;
}

- (NSDate)lastMeasurementTimestampLeft
{
  return self->_lastMeasurementTimestampLeft;
}

- (NSDate)lastMeasurementTimestampRight
{
  return self->_lastMeasurementTimestampRight;
}

- (int)latestMeasurementResultLeft
{
  return self->_latestMeasurementResultLeft;
}

- (int)latestMeasurementResultRight
{
  return self->_latestMeasurementResultRight;
}

- (int)rearVentStatusLeft
{
  return self->_rearVentStatusLeft;
}

- (int)rearVentStatusRight
{
  return self->_rearVentStatusRight;
}

- (int)refMicStatusLeft
{
  return self->_refMicStatusLeft;
}

- (int)refMicStatusRight
{
  return self->_refMicStatusRight;
}

- (int)speakerStatusLeft
{
  return self->_speakerStatusLeft;
}

- (int)speakerStatusRight
{
  return self->_speakerStatusRight;
}

- (int)vceMicStatusLeft
{
  return self->_vceMicStatusLeft;
}

- (int)vceMicStatusRight
{
  return self->_vceMicStatusRight;
}

- (NSNumber)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_lastMeasurementTimestampRight, 0);
  objc_storeStrong((id *)&self->_lastMeasurementTimestampLeft, 0);
  objc_storeStrong((id *)&self->_daysSinceLastHarmonicMeasurementRight, 0);
  objc_storeStrong((id *)&self->_daysSinceLastHarmonicMeasurementLeft, 0);
  objc_storeStrong((id *)&self->_daysSinceLastMeasurementRight, 0);
  objc_storeStrong((id *)&self->_daysSinceLastMeasurementLeft, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end
