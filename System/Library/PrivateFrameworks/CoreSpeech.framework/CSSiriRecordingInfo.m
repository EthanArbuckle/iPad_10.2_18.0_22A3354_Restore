@implementation CSSiriRecordingInfo

- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 fingerprintOnly:(BOOL)a4 secureOfflineOnly:(BOOL)a5 audioAlertStyle:(int64_t)a6 recordSettings:(id)a7 recordRoute:(id)a8 recordDeviceInfo:(id)a9 playbackRoute:(id)a10 audioDeviceID:(unsigned int)a11 audioSessionID:(unsigned int)a12 voiceTriggerEventInfo:(id)a13 activationAlertStartTimestamp:(double)a14 startRecordingTimestamp:(double)a15 firstBufferTimestamp:(double)a16 firstBufferHostTime:(unint64_t)a17 estimatedSpeechEndHostTime:(unint64_t)a18 deviceIdentifier:(id)a19 includeBTInfo:(BOOL)a20 speechEvent:(int64_t)a21
{
  id v30;
  id v31;
  CSSiriRecordingInfo *v32;
  uint64_t v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  id v43;
  id *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  id v49;
  NSString *codec;
  NSObject *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  char v55;
  void **v56;
  _QWORD *v57;
  id *v58;
  NSString *v59;
  NSString *source;
  NSString *v61;
  id v62;
  id v63;
  int v64;
  void **v65;
  void *v66;
  id v67;
  char v68;
  _QWORD *v69;
  id *v70;
  NSString *v71;
  NSString *destination;
  void *v73;
  uint64_t v74;
  NSString *route;
  uint64_t v76;
  CSFAudioRecordDeviceInfo *deviceInfo;
  uint64_t v78;
  NSDictionary *voiceTriggerEventInfo;
  void *v80;
  uint64_t v81;
  NSString *deviceIdentifier;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSString *headsetName;
  void *v91;
  uint64_t v92;
  NSString *headsetAddress;
  void *v94;
  void *v95;
  _BOOL4 v96;
  NSString *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  NSString *v101;
  void *v102;
  uint64_t v103;
  NSString *modelName;
  CSSiriRecordingInfo *v105;
  uint64_t v107;
  NSString *v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  id v114;
  objc_super v115;
  int outPropertyData;
  UInt32 ioPropertyDataSize;
  uint8_t buf[4];
  const char *v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v113 = a7;
  v112 = a8;
  v114 = a9;
  v111 = a10;
  v30 = a13;
  v31 = a19;
  v115.receiver = self;
  v115.super_class = (Class)CSSiriRecordingInfo;
  v32 = -[CSSiriRecordingInfo init](&v115, sel_init);

  if (!v32)
    goto LABEL_137;
  v32->_isDictation = a3;
  v32->_isFingerprintOnly = a4;
  v32->_isSecureOfflineOnly = a5;
  v32->_audioAlertStyle = a6;
  v33 = *MEMORY[0x1E0C898E0];
  v34 = v113;
  objc_msgSend(v34, "objectForKey:", v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "intValue");

  objc_msgSend(v34, "objectForKey:", *MEMORY[0x1E0C89930]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "intValue");

  objc_msgSend(v34, "objectForKey:", *MEMORY[0x1E0C898F0]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "intValue");

  objc_msgSend(v34, "objectForKey:", *MEMORY[0x1E0C89970]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_msgSend(v41, "intValue");
  if (v36 == 1819304813 && v38 == 1 && v40 == 16)
  {
    v43 = 0;
    if (v42 <= 15999)
    {
      if (v42 == 8000)
      {
        v44 = (id *)MEMORY[0x1E0D89038];
      }
      else
      {
        if (v42 != 11025)
          goto LABEL_28;
        v44 = (id *)MEMORY[0x1E0D89018];
      }
    }
    else
    {
      switch(v42)
      {
        case 16000:
          v44 = (id *)MEMORY[0x1E0D89020];
          break;
        case 22050:
          v44 = (id *)MEMORY[0x1E0D89028];
          break;
        case 32000:
          v44 = (id *)MEMORY[0x1E0D89030];
          break;
        default:
          goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
  if (v36 == 1869641075)
  {
    if (v42 == 8000)
    {
      v44 = (id *)MEMORY[0x1E0D89010];
      goto LABEL_27;
    }
    if (v42 == 16000)
    {
      v44 = (id *)MEMORY[0x1E0D89008];
      goto LABEL_27;
    }
LABEL_21:
    v43 = 0;
    goto LABEL_28;
  }
  if (v36 != 1936745848)
    goto LABEL_21;
  if (v42 == 8000)
  {
    v44 = (id *)MEMORY[0x1E0D89040];
    goto LABEL_27;
  }
  if (v42 != 16000)
    goto LABEL_21;
  v44 = (id *)MEMORY[0x1E0D89048];
LABEL_27:
  v43 = *v44;
LABEL_28:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectoryForUser(CFSTR("mobile"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "stringByAppendingPathComponent:", CFSTR("forceSiriPCMAudio"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v45, "fileExistsAtPath:", v47);

  if (v48)
  {
    v49 = (id)*MEMORY[0x1E0D89048];

    v43 = v49;
  }
  v109 = v30;
  codec = v32->_codec;
  v32->_codec = (NSString *)v43;

  if (!v32->_codec)
  {
    v51 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v119 = "-[CSSiriRecordingInfo initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:re"
             "cordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlert"
             "StartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:"
             "deviceIdentifier:includeBTInfo:speechEvent:]";
      v120 = 2114;
      v121 = v34;
      _os_log_error_impl(&dword_1C2614000, v51, OS_LOG_TYPE_ERROR, "%s No SACodec for settings %{public}@", buf, 0x16u);
    }
  }
  v52 = a11;
  v53 = v112;
  v54 = *MEMORY[0x1E0C89860];
  v55 = objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89860]);
  v56 = (void **)MEMORY[0x1E0D890E0];
  v57 = (_QWORD *)MEMORY[0x1E0C897F8];
  v58 = (id *)MEMORY[0x1E0D890E0];
  if ((v55 & 1) == 0)
  {
    if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C897F8]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890C8];
    }
    else if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89850]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890F0];
    }
    else if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890C0];
    }
    else if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89868]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890E8];
    }
    else if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890D0];
    }
    else if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89A30]) & 1) != 0)
    {
      v58 = (id *)MEMORY[0x1E0D890D8];
    }
    else
    {
      if ((objc_msgSend(v53, "isEqualToString:", *MEMORY[0x1E0C89A00]) & 1) == 0)
      {

        goto LABEL_51;
      }
      v58 = (id *)MEMORY[0x1E0D890B8];
    }
  }
  v59 = (NSString *)*v58;

  if (v59)
  {
    source = v32->_source;
    v32->_source = v59;
    v61 = v59;
    goto LABEL_55;
  }
LABEL_51:
  if (!a11)
    goto LABEL_53;
  ioPropertyDataSize = 4;
  *(_DWORD *)buf = 0;
  if (AudioDeviceGetProperty(a11, 0, 1u, 0x7472616Eu, &ioPropertyDataSize, buf))
    goto LABEL_53;
  v62 = 0;
  if (*(int *)buf > 1818848868)
  {
    if (*(_DWORD *)buf == 1818848869)
    {
      v66 = *v56;
      goto LABEL_80;
    }
    if (*(_DWORD *)buf != 1970496032)
      goto LABEL_54;
    v65 = (void **)MEMORY[0x1E0D890E8];
LABEL_72:
    v66 = *v65;
LABEL_80:
    v62 = v66;
    goto LABEL_54;
  }
  if (*(_DWORD *)buf != 1651274862)
  {
    if (*(_DWORD *)buf != 1651275109)
      goto LABEL_54;
    v65 = (void **)MEMORY[0x1E0D890C0];
    goto LABEL_72;
  }
  outPropertyData = 0;
  ioPropertyDataSize = 4;
  if (!AudioDeviceGetProperty(a11, 0, 1u, 0x73737263u, &ioPropertyDataSize, &outPropertyData))
  {
    if (outPropertyData == 1768778083)
    {
      v65 = (void **)MEMORY[0x1E0D890C8];
      goto LABEL_72;
    }
    if (outPropertyData == 1701669219)
    {
      v65 = (void **)MEMORY[0x1E0D890F0];
      goto LABEL_72;
    }
  }
LABEL_53:
  v62 = 0;
LABEL_54:
  v61 = (NSString *)v62;
  source = v32->_source;
  v32->_source = v61;
LABEL_55:

  v63 = v53;
  if ((objc_msgSend(v63, "isEqualToString:", v54) & 1) != 0)
  {
    v64 = 1;
LABEL_85:

    goto LABEL_86;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *v57) & 1) != 0)
  {
    v64 = 2;
    goto LABEL_85;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89850]) & 1) != 0)
  {
    v64 = 3;
    goto LABEL_85;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) != 0)
  {
    v64 = 4;
    goto LABEL_85;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89868]) & 1) != 0)
  {
    v64 = 5;
    goto LABEL_85;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0)
  {
    v64 = 6;
    goto LABEL_85;
  }
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89A30]) & 1) != 0)
  {
    v64 = 8;
    goto LABEL_85;
  }
  if (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89A00]))
  {
    v64 = 7;
    goto LABEL_85;
  }

  if (!a11)
    goto LABEL_104;
  ioPropertyDataSize = 4;
  *(_DWORD *)buf = 0;
  if (AudioDeviceGetProperty(a11, 0, 1u, 0x7472616Eu, &ioPropertyDataSize, buf))
    goto LABEL_104;
  if (*(int *)buf > 1818848868)
  {
    if (*(_DWORD *)buf == 1818848869)
    {
      v64 = 1;
    }
    else
    {
      if (*(_DWORD *)buf != 1970496032)
        goto LABEL_104;
      v64 = 5;
    }
  }
  else
  {
    if (*(_DWORD *)buf != 1651274862)
    {
      if (*(_DWORD *)buf == 1651275109)
      {
        v64 = 4;
        goto LABEL_86;
      }
LABEL_104:
      v64 = 0;
      goto LABEL_86;
    }
    outPropertyData = 0;
    ioPropertyDataSize = 4;
    if (AudioDeviceGetProperty(a11, 0, 1u, 0x73737263u, &ioPropertyDataSize, &outPropertyData))
      goto LABEL_104;
    if (outPropertyData == 1768778083)
    {
      v64 = 2;
    }
    else
    {
      if (outPropertyData != 1701669219)
        goto LABEL_104;
      v64 = 3;
    }
  }
LABEL_86:
  v32->_mhSource = v64;
  v67 = v111;
  v68 = objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89810]);
  v69 = (_QWORD *)MEMORY[0x1E0C897D0];
  if ((v68 & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89088];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89800]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89080];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89840]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D890A0];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *v69) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89068];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89070];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C897E8]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89078];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D89090];
  }
  else if ((objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89868]) & 1) != 0)
  {
    v70 = (id *)MEMORY[0x1E0D890B0];
  }
  else
  {
    if (!objc_msgSend(v67, "isEqualToString:", *MEMORY[0x1E0C89838]))
    {
      v71 = 0;
      if (!v67)
        goto LABEL_110;
      goto LABEL_108;
    }
    v70 = (id *)MEMORY[0x1E0D89098];
  }
  v71 = (NSString *)*v70;
  if (!v67)
    goto LABEL_110;
LABEL_108:
  if (!v71)
    v71 = (NSString *)(id)*MEMORY[0x1E0D890A8];
LABEL_110:

  destination = v32->_destination;
  v32->_destination = v71;

  v73 = v63;
  if (!v63)
  {
    objc_msgSend(v114, "route");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v74 = objc_msgSend(v73, "copy", v109);
  route = v32->_route;
  v32->_route = (NSString *)v74;

  if (!v63)
  v76 = objc_msgSend(v114, "copy");
  deviceInfo = v32->_deviceInfo;
  v32->_deviceInfo = (CSFAudioRecordDeviceInfo *)v76;

  v78 = objc_msgSend(v110, "copy");
  voiceTriggerEventInfo = v32->_voiceTriggerEventInfo;
  v32->_voiceTriggerEventInfo = (NSDictionary *)v78;

  v32->_activationAlertStartTimestamp = a14;
  v32->_startRecordingTimestamp = a15;
  v32->_firstBufferTimestamp = a16;
  v80 = v31;
  v32->_firstBufferHostTime = a17;
  if (!v31)
  {
    objc_msgSend(v114, "remoteDeviceUID");
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v52, "UUIDString");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81 = objc_msgSend(v80, "copy");
  deviceIdentifier = v32->_deviceIdentifier;
  v32->_deviceIdentifier = (NSString *)v81;

  if (!v31)
  {

  }
  v32->_speechEvent = a21;
  objc_msgSend(v34, "objectForKey:", CFSTR("CSSpeechRecordSettingsKey_isDucking"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v32->_isDucking = objc_msgSend(v83, "BOOLValue");

  v32->_audioSessionID = a12;
  v32->_estimatedSpeechEndHostTime = a18;
  if ((objc_msgSend(v63, "isEqualToString:", *v69) & 1) != 0
    || (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C897E0]) & 1) != 0
    || objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C897E8]))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "retrieveSessionWithID:", a12);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "currentRoute");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "inputs");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "firstObject");
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v87, "portName");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "copy");
    headsetName = v32->_headsetName;
    v32->_headsetName = (NSString *)v89;

    objc_msgSend(v87, "UID");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "copy");
    headsetAddress = v32->_headsetAddress;
    v32->_headsetAddress = (NSString *)v92;

    if (objc_msgSend(v84, "isEarpieceActiveNoiseCancelationEnabled"))
      v94 = (void *)*MEMORY[0x1E0D890F8];
    else
      v94 = 0;
    objc_storeStrong((id *)&v32->_dspStatus, v94);

  }
  v30 = v110;
  if (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89A00]))
  {
    objc_msgSend(v114, "remoteDeviceUID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95 != 0;

  }
  else
  {
    v96 = 0;
  }
  v97 = v32->_headsetAddress;
  if (v97)
  {
    if (!v32->_deviceIdentifier)
    {
      v107 = -[NSString copy](v97, "copy");
      v108 = v32->_deviceIdentifier;
      v32->_deviceIdentifier = (NSString *)v107;

      if (v32->_headsetAddress)
        v96 = 1;
      if (!v96)
        goto LABEL_134;
      goto LABEL_132;
    }
    v96 = 1;
  }
  if (v96)
  {
LABEL_132:
    if (a20)
      -[CSSiriRecordingInfo _fetchBTInfo](v32, "_fetchBTInfo");
  }
LABEL_134:
  if ((objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0
    || objc_msgSend(v63, "isEqualToString:", *MEMORY[0x1E0C89A30]))
  {
    objc_msgSend(MEMORY[0x1E0C8B1B8], "currentCarPlayExternalDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "screenIDs");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "componentsJoinedByString:", CFSTR(","));
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = v32->_deviceIdentifier;
    v32->_deviceIdentifier = (NSString *)v100;

    objc_msgSend(v98, "modelName");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = objc_msgSend(v102, "copy");
    modelName = v32->_modelName;
    v32->_modelName = (NSString *)v103;

  }
LABEL_137:
  v105 = v32;

  return v105;
}

- (CSSiriRecordingInfo)initWithDictation:(BOOL)a3 codec:(id)a4
{
  id v6;
  CSSiriRecordingInfo *v7;
  CSSiriRecordingInfo *v8;
  uint64_t v9;
  NSString *codec;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSSiriRecordingInfo;
  v7 = -[CSSiriRecordingInfo init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_isDictation = a3;
    v9 = objc_msgSend(v6, "copy");
    codec = v8->_codec;
    v8->_codec = (NSString *)v9;

  }
  return v8;
}

- (BOOL)isBluetooth
{
  return -[NSString isEqualToString:](self->_source, "isEqualToString:", *MEMORY[0x1E0D890C0])
      || -[NSString isEqualToString:](self->_source, "isEqualToString:", *MEMORY[0x1E0D890B8]);
}

- (void)_fetchBTInfo
{
  AFBluetoothDevice *v3;
  void *bluetoothDevice;
  void *v5;
  AFBluetoothDevice *v6;
  AFBluetoothDevice *v7;
  id v8;

  if (self->_headsetAddress)
  {
    +[CSSiriBluetoothManager sharedInstance](CSSiriBluetoothManager, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deviceWithAddress:", self->_headsetAddress);
    v3 = (AFBluetoothDevice *)objc_claimAutoreleasedReturnValue();
    bluetoothDevice = self->_bluetoothDevice;
    self->_bluetoothDevice = v3;
    goto LABEL_3;
  }
  if (-[NSString isEqualToString:](self->_source, "isEqualToString:", *MEMORY[0x1E0D890B8]))
  {
    -[CSFAudioRecordDeviceInfo remoteDeviceUID](self->_deviceInfo, "remoteDeviceUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_4;
    v8 = v5;
    +[CSSiriBluetoothManager sharedInstance](CSSiriBluetoothManager, "sharedInstance");
    bluetoothDevice = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(bluetoothDevice, "deviceWithUID:", v8);
    v6 = (AFBluetoothDevice *)objc_claimAutoreleasedReturnValue();
    v7 = self->_bluetoothDevice;
    self->_bluetoothDevice = v6;

LABEL_3:
    v5 = v8;
LABEL_4:

  }
}

- (id)_bluetoothDeviceInfo
{
  return (id)-[AFBluetoothDevice deviceInfo](self->_bluetoothDevice, "deviceInfo");
}

- (NSString)headsetAddress
{
  NSString *headsetAddress;
  NSString *v3;
  void *v4;

  headsetAddress = self->_headsetAddress;
  if (headsetAddress)
  {
    v3 = headsetAddress;
  }
  else
  {
    -[CSSiriRecordingInfo _bluetoothDeviceInfo](self, "_bluetoothDeviceInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "address");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)vendorId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CSSiriRecordingInfo _bluetoothDeviceInfo](self, "_bluetoothDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "vendorID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)productId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[CSSiriRecordingInfo _bluetoothDeviceInfo](self, "_bluetoothDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v3, "productID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)codecIsNarrowband
{
  return -[NSString isEqualToString:](self->_codec, "isEqualToString:", *MEMORY[0x1E0D89010])
      || -[NSString isEqualToString:](self->_codec, "isEqualToString:", *MEMORY[0x1E0D89040]);
}

- (BOOL)isDictation
{
  return self->_isDictation;
}

- (BOOL)isFingerprintOnly
{
  return self->_isFingerprintOnly;
}

- (BOOL)isSecureOfflineOnly
{
  return self->_isSecureOfflineOnly;
}

- (int64_t)audioAlertStyle
{
  return self->_audioAlertStyle;
}

- (NSString)codec
{
  return self->_codec;
}

- (NSString)source
{
  return self->_source;
}

- (int)mhSource
{
  return self->_mhSource;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)route
{
  return self->_route;
}

- (CSFAudioRecordDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)dspStatus
{
  return self->_dspStatus;
}

- (NSString)headsetName
{
  return self->_headsetName;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (double)activationAlertStartTimestamp
{
  return self->_activationAlertStartTimestamp;
}

- (double)startRecordingTimestamp
{
  return self->_startRecordingTimestamp;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (double)firstBufferTimestamp
{
  return self->_firstBufferTimestamp;
}

- (unint64_t)firstBufferHostTime
{
  return self->_firstBufferHostTime;
}

- (unint64_t)estimatedSpeechEndHostTime
{
  return self->_estimatedSpeechEndHostTime;
}

- (BOOL)isDucking
{
  return self->_isDucking;
}

- (BOOL)isEndAlertInfo
{
  return self->_isEndAlertInfo;
}

- (void)setIsEndAlertInfo:(BOOL)a3
{
  self->_isEndAlertInfo = a3;
}

- (BOOL)triggeredTwoShotBorealis
{
  return self->_triggeredTwoShotBorealis;
}

- (void)setTriggeredTwoShotBorealis:(BOOL)a3
{
  self->_triggeredTwoShotBorealis = a3;
}

- (unint64_t)audioSessionSetActiveEndHostTime
{
  return self->_audioSessionSetActiveEndHostTime;
}

- (void)setAudioSessionSetActiveEndHostTime:(unint64_t)a3
{
  self->_audioSessionSetActiveEndHostTime = a3;
}

- (AFBluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (int64_t)speechEvent
{
  return self->_speechEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_headsetName, 0);
  objc_storeStrong((id *)&self->_dspStatus, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_headsetAddress, 0);
}

@end
