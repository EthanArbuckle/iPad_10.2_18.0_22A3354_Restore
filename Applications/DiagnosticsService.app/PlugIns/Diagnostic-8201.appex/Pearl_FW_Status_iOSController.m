@implementation Pearl_FW_Status_iOSController

- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(PearlConfiguration *)a4
{
  int v5;
  uint64_t v6;
  NSString *deviceName;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  if (a3 <= 31)
  {
    switch(a3)
    {
      case 1:
        v5 = 0;
        *(_WORD *)&a4->isIrOn = 257;
        a4->isRgbOn = 1;
        v6 = 0x100000003;
        goto LABEL_19;
      case 2:
        v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        v6 = 0x200000003;
        goto LABEL_19;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_13;
      case 4:
        v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        v6 = 0x400000004;
        goto LABEL_19;
      case 8:
        v5 = 0;
        *(_WORD *)&a4->isIrOn = 1;
        a4->isRgbOn = 0;
        v6 = 0x800000001;
        goto LABEL_19;
      default:
        if (a3 != 16)
          goto LABEL_13;
        v5 = 0;
        *(_WORD *)&a4->isIrOn = 0;
        a4->isRgbOn = 1;
        v6 = 0x1000000000;
        break;
    }
    goto LABEL_19;
  }
  if (a3 > 127)
  {
    if (a3 == 128)
    {
      v5 = 0;
      *(_WORD *)&a4->isIrOn = 1;
      a4->isRgbOn = 0;
      v6 = 0x8000000005;
      goto LABEL_19;
    }
    if (a3 == 256)
    {
      v5 = 0;
      *(_WORD *)&a4->isIrOn = 1;
      a4->isRgbOn = 0;
      v6 = 0x10000000006;
      goto LABEL_19;
    }
  }
  else
  {
    if (a3 == 32)
    {
      v5 = 0;
      *(_WORD *)&a4->isIrOn = 257;
      a4->isRgbOn = 0;
      v6 = 0x2000000003;
      goto LABEL_19;
    }
    if (a3 == 64)
    {
      v5 = 0;
      *(_WORD *)&a4->isIrOn = 257;
      a4->isRgbOn = 0;
      v6 = 0x4000000004;
LABEL_19:
      *(_QWORD *)&a4->irType = v6;
      deviceName = a4->deviceName;
      a4->deviceName = 0;
      goto LABEL_20;
    }
  }
LABEL_13:
  deviceName = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](deviceName, "lastPathComponent"));
  v9 = decToBinStr(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available configuration detected for this mask bit location %@"), v10));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 87, v11);

  v5 = -536870206;
LABEL_20:

  return v5;
}

- (void)setResultBitMaskStatus:(int)a3 andState:(BOOL)a4
{
  unsigned int m_resultsCasesMask;
  int v5;
  unsigned int v6;

  m_resultsCasesMask = self->m_resultsCasesMask;
  v5 = m_resultsCasesMask & ~a3;
  v6 = m_resultsCasesMask | a3;
  if (!a4)
    v6 = v5;
  self->m_resultsCasesMask = v6;
}

- (void)disableAttentionDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  if (self->m_isUseADControl)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disableAttentionDetection if needed")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 109, v4);

    self->m_attentionDetectionSetting = _AXSAttentionAwarenessFeaturesEnabled() != 0;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("current attention detection status %d"), self->m_attentionDetectionSetting));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 111, v6);

    if (self->m_attentionDetectionSetting)
    {
      _AXSSetAttentionAwarenessFeaturesEnabled(0);
      usleep(0x7A120u);
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disable attention detection, current status is %d"), _AXSAttentionAwarenessFeaturesEnabled());
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 116, v9);
    }
    else
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("attention detection already disabled")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 120, v9);
    }

  }
}

- (void)restoreAttentionDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  id v11;
  id v12;

  if (self->m_isUseADControl)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("restore attention detection if needed")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 131, v4);

    LODWORD(v4) = _AXSAttentionAwarenessFeaturesEnabled() != 0;
    LODWORD(v3) = self->m_attentionDetectionSetting;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v12 = v5;
    if ((_DWORD)v3 == (_DWORD)v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("attention detection already as require")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 142, v7);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("restore attention detection to its prevues status of %d"), self->m_attentionDetectionSetting));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 135, v9);

      _AXSSetAttentionAwarenessFeaturesEnabled(self->m_attentionDetectionSetting);
      usleep(0x7A120u);
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("attention detection current status is %d after restoring"), _AXSAttentionAwarenessFeaturesEnabled());
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 138, v7);
    }

  }
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *m_statusesDict;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  id CurrentVersion;
  void *v23;
  unsigned int v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t m_casesMask;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  vector<PearlConfiguration, std::allocator<PearlConfiguration>> *p_m_configurationsList;
  PearlConfiguration *end;
  PearlConfiguration *value;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  PearlConfiguration *v67;
  PearlConfiguration *begin;
  PearlConfiguration *v69;
  uint64_t v70;
  int bitMaskID;
  NSString *deviceName;
  int64x2_t v73;
  PearlConfiguration *v74;
  PearlConfiguration *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  __CFString *v84;
  __CFString *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  int v92;
  id v93;
  id v94;
  unsigned int v95;
  int v96;
  uint64_t v97;
  int64x2_t v98;
  PearlConfiguration *v99;
  __compressed_pair<PearlConfiguration *, std::allocator<PearlConfiguration>> *p_end_cap;
  _BYTE v101[16];

  v6 = a3;
  v83 = a4;
  v90 = v6;
  self->m_useHighPriorityControlRequest = objc_msgSend(v90, "useHighPriority");
  self->m_isUseADControl = objc_msgSend(v90, "useADControl");
  self->m_preemtionWaitingTimeInMicroSec = objc_msgSend(v90, "preemtingWaitInMicroSec");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("input value: useHighPriority = %d"), self->m_useHighPriorityControlRequest));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 154, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("input value: isUseADControl = %d"), self->m_isUseADControl));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 155, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("input value: preemtionWaitingTimeInMicroSec = %d"), self->m_preemtionWaitingTimeInMicroSec));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 156, v15);

  -[Pearl_FW_Status_iOSController disableAttentionDetection](self, "disableAttentionDetection");
  self->m_isYGErrorDetected = 0;
  v16 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
  m_statusesDict = self->m_statusesDict;
  self->m_statusesDict = v16;

  v89 = (void *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setupWithInputs Pearl Diagnostic %@"), v89));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 163, v20);

  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", v89, CFSTR("DEVICE_NAME"));
  v21 = self->m_statusesDict;
  CurrentVersion = getCurrentVersion();
  v23 = (void *)objc_claimAutoreleasedReturnValue(CurrentVersion);
  -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v23, CFSTR("VERSION"));

  self->m_resultsCasesMask = 0;
  self->m_timeForStreamInUSec = 5000000;
  self->m_casesMask = 255;
  v95 = -1;
  v96 = -1;
  v24 = -[Pearl_FW_Status_iOSController getPearlProjectorHWVersion:](self, "getPearlProjectorHWVersion:", &v96);
  self->m_isSmp = 0;
  self->m_isNuri = 0;
  if (!v24)
  {
    if (v96 == 10)
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "lastPathComponent"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NURI projector version detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v79, 185, v80);

      self->m_isNuri = 1;
    }
    else if (v96 == 8)
    {
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "lastPathComponent"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SMP projector version detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v32, 180, v33);

      self->m_isSmp = 1;
    }
    else
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "lastPathComponent"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Standard Pearl projector version detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v81, 190, v82);

    }
  }
  v94 = 0;
  v25 = -[Pearl_FW_Status_iOSController getRigelInfo:serialNumber:](self, "getRigelInfo:serialNumber:", &v95, &v94);
  v26 = (const __CFString *)v94;
  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to get Rigel info")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v28, 196, v29);

  }
  v30 = CFSTR("N/A");
  if (v26)
    v31 = v26;
  else
    v31 = CFSTR("N/A");
  v85 = (__CFString *)v31;
  if (v95 != -1)
    v30 = (const __CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v95));
  v84 = (__CFString *)v30;
  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:");
  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", v85, CFSTR("RIGEL_SERIAL_NUMBER"));
  if (-[Pearl_FW_Status_iOSController getPLEUUID:](self, "getPLEUUID:", v101))
  {
    -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("N/A"), CFSTR("PCE_CALIB_UUID"));
  }
  else
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X"), v101[0], v101[1], v101[2], v101[3], v101[4], v101[5], v101[6], v101[7], v101[8], v101[9], v101[10], v101[11], v101[12], v101[13], v101[14],
                      v101[15]));
    -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", v34, CFSTR("PCE_CALIB_UUID"));

  }
  if (self->m_isSmp || self->m_isNuri)
    self->m_casesMask = 315;
  if (!v90)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fail to instantiate input class")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v40, 285, v41);

    -[Pearl_FW_Status_iOSController finalizingWithErrorStatusCode:andInfoString:](self, "finalizingWithErrorStatusCode:andInfoString:", &off_1000346F0, CFSTR("Fail to instantiate input class"));
    goto LABEL_53;
  }
  if ((int)objc_msgSend(v90, "configurationTimeForStreamInSec") >= 1)
  {
    if ((int)objc_msgSend(v90, "configurationTimeForStreamInSec") <= 4)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("external stream time of %d sec detected and it is less then minimal (5 sec), Diagnostic will not run"), objc_msgSend(v90, "configurationTimeForStreamInSec")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "lastPathComponent"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v35));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v37, 242, v38);

      -[Pearl_FW_Status_iOSController finalizingWithErrorStatusCode:andInfoString:](self, "finalizingWithErrorStatusCode:andInfoString:", &off_1000346F0, v35);
      goto LABEL_53;
    }
    self->m_timeForStreamInUSec = 1000000 * objc_msgSend(v90, "configurationTimeForStreamInSec");
  }
  if (objc_msgSend(v90, "diagnosticCasesMask") != -1)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastPathComponent"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Overriding mask due to external file input")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v43, 252, v44);

    self->m_casesMask = objc_msgSend(v90, "diagnosticCasesMask");
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastPathComponent"));
  m_casesMask = self->m_casesMask;
  v48 = decToBinStr(self->m_casesMask);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("diagnostic mask: %d [%@] detected"), m_casesMask, v49));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v46, 256, v50);

  if (self->m_casesMask <= 0x1FF)
  {
    v52 = 0;
    v53 = 1;
    while (1)
    {
      if ((self->m_casesMask & v53) != 0)
      {
        v93 = 0;
        LOWORD(v91) = 0;
        BYTE2(v91) = 0;
        HIDWORD(v91) = 0;
        v92 = 0;
        v93 = v89;
        if (-[Pearl_FW_Status_iOSController getConfigurationForCaseMask:returnedConfiguration:](self, "getConfigurationForCaseMask:returnedConfiguration:", v53, &v91))
        {
          -[Pearl_FW_Status_iOSController finalizingWithErrorStatusCode:andInfoString:](self, "finalizingWithErrorStatusCode:andInfoString:", &off_1000346F0, CFSTR("Bad Diagnostic bit mask"));

          goto LABEL_53;
        }
        p_m_configurationsList = &self->m_configurationsList;
        end = self->m_configurationsList.__end_;
        value = self->m_configurationsList.__end_cap_.__value_;
        if (end >= value)
        {
          v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)p_m_configurationsList->__begin_) >> 3);
          v59 = v58 + 1;
          if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
            sub_10000D980();
          v60 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)p_m_configurationsList->__begin_) >> 3);
          if (2 * v60 > v59)
            v59 = 2 * v60;
          if (v60 >= 0x555555555555555)
            v61 = 0xAAAAAAAAAAAAAAALL;
          else
            v61 = v59;
          p_end_cap = &self->m_configurationsList.__end_cap_;
          if (v61)
          {
            v62 = (char *)sub_1000173B8((uint64_t)&self->m_configurationsList.__end_cap_, v61);
            v64 = v63;
          }
          else
          {
            v62 = 0;
            v64 = 0;
          }
          v65 = &v62[24 * v58];
          v66 = v91;
          *((_DWORD *)v65 + 2) = v92;
          *(_QWORD *)v65 = v66;
          *((_QWORD *)v65 + 2) = v93;
          begin = p_m_configurationsList->__begin_;
          v67 = self->m_configurationsList.__end_;
          if (v67 == p_m_configurationsList->__begin_)
          {
            v73 = vdupq_n_s64((unint64_t)v67);
            v69 = (PearlConfiguration *)v65;
          }
          else
          {
            v69 = (PearlConfiguration *)v65;
            do
            {
              v70 = *(_QWORD *)&v67[-1].isIrOn;
              --v67;
              bitMaskID = v67->bitMaskID;
              *(_QWORD *)&v69[-1].isIrOn = v70;
              --v69;
              v69->bitMaskID = bitMaskID;
              deviceName = v67->deviceName;
              v67->deviceName = 0;
              v69->deviceName = deviceName;
            }
            while (v67 != begin);
            v73 = *(int64x2_t *)&p_m_configurationsList->__begin_;
          }
          v74 = (PearlConfiguration *)(v65 + 24);
          p_m_configurationsList->__begin_ = v69;
          self->m_configurationsList.__end_ = v74;
          v98 = v73;
          v75 = self->m_configurationsList.__end_cap_.__value_;
          self->m_configurationsList.__end_cap_.__value_ = (PearlConfiguration *)&v62[24 * v64];
          v99 = v75;
          v97 = v73.i64[0];
          sub_1000173FC((uint64_t)&v97);
          self->m_configurationsList.__end_ = v74;

        }
        else
        {
          v57 = v91;
          end->bitMaskID = v92;
          *(_QWORD *)&end->isIrOn = v57;
          end->deviceName = (NSString *)v93;
          self->m_configurationsList.__end_ = end + 1;

        }
      }
      ++v52;
      v53 = (2 * v53);
      if (v52 == 9)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "lastPathComponent"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("time for streaming: %d [us]"), self->m_timeForStreamInUSec));
        NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v77, 289, v78);

        self->m_isIrEnable = 0;
        self->m_isRgbEnable = 0;
        self->m_isAllPass = 0;
        self->m_isCurrentStatusOK = 1;
        self->m_scenariosNumber = -1431655765
                                * ((unint64_t)((char *)self->m_configurationsList.__end_
                                                    - (char *)self->m_configurationsList.__begin_) >> 3);
        self->m_passCount = 0;
        goto LABEL_53;
      }
    }
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bad Diagnostic bit mask, bit mask 0x%x > 0x%x"), self->m_casesMask, 511));
  -[Pearl_FW_Status_iOSController finalizingWithErrorStatusCode:andInfoString:](self, "finalizingWithErrorStatusCode:andInfoString:", &off_1000346F0, v51);

LABEL_53:
}

- (void)start
{
  -[Pearl_FW_Status_iOSController performFlow](self, "performFlow");
}

- (void)produceGeneralFailurForDiagnosticConfiguration:(PearlConfiguration *)a3 withString:(id)a4
{
  id v6;
  id PearlConfigurationStringKey;
  void *v8;
  NSMutableDictionary *m_statusesDict;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v6 = a4;
  PearlConfigurationStringKey = DeviceCMInterface::getPearlConfigurationStringKey(&self->m_diagnosticCMInterface, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(PearlConfigurationStringKey);
  self->m_isAllPass = 0;
  self->m_isCurrentStatusOK = 0;
  m_statusesDict = self->m_statusesDict;
  v11[0] = CFSTR("OVERALL_FOR_CONFIGURATION");
  v11[1] = CFSTR("Status");
  v12[0] = CFSTR("FAIL");
  v12[1] = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  -[NSMutableDictionary setValue:forKey:](m_statusesDict, "setValue:forKey:", v10, v8);

  -[Pearl_FW_Status_iOSController setResultBitMaskStatus:andState:](self, "setResultBitMaskStatus:andState:", a3->bitMaskID, 1);
}

- (int)getPLEUUID:(char *)a3
{
  DeviceCMInterface v4;

  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (int)getRigelInfo:(int *)a3 serialNumber:(id *)a4
{
  DeviceCMInterface v5;

  DeviceCMInterface::DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v5);
}

- (int)getPearlProjectorHWVersion:(int *)a3
{
  DeviceCMInterface v4;

  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(PearlConfiguration *)a3
{
  id v4;
  unsigned int v5;
  BOOL v7;
  void *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  id v49;
  _BOOL4 m_isPearlRgbFramesArrived;
  BOOL v52;
  void *v53;
  _UNKNOWN **v54;
  BOOL v56;
  id PearlConfigurationStringKey;
  void *v58;
  NSMutableDictionary *m_statusesDict;
  void *v60;
  NSMutableDictionary *v61;
  NSMutableDictionary *v62;
  void *context;
  int isGmcOk;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  BOOL v75[8];
  unsigned int v76[2];
  unsigned int v77;
  const __CFString *v78;
  _UNKNOWN **v79;
  const __CFString *v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;

  self->m_isCurrentStatusOK = 1;
  if (!a3->isIrOn)
  {
    v8 = 0;
    goto LABEL_58;
  }
  context = objc_autoreleasePoolPush();
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 70);
  v77 = -1;
  isGmcOk = PearlDiagnosticInteractor::isGmcOk(&self->m_diagnosticInteractor);
  DeviceCMInterface::validateIrFwStatus(&self->m_diagnosticCMInterface, &v77);
  v5 = v77;
  if (self->m_isCurrentStatusOK && v77 == 0)
  {
    v7 = isGmcOk;
    if (!self->m_diagnosticInteractor.m_isPearlIrFramesArrived)
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  self->m_isCurrentStatusOK = v7;
  if (!self->m_isAllPass)
    v7 = 0;
  self->m_isAllPass = v7;
  if (!self->m_isCurrentStatusOK)
  {
    if (self->m_isSmp || self->m_isNuri)
    {
      *(_QWORD *)v75 = 0;
      *(_QWORD *)v76 = 0;
      v74 = 0;
      v73 = 0;
      v72 = 0;
      v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 70);
      if (DeviceCMInterface::getGuadalupeValues(&self->m_diagnosticCMInterface, (uint64_t *)v76, (uint64_t *)v75, &v74, &v73, &v72))
      {
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("PROJECTOR_STATE"));
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("PROJECTOR_FAULTS"));
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("PROJECTOR_RESISTANCE"));
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("PROJECTOR_LAST_RESISTANCE"));
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("GUADALUPE_RECORDING_REGISTER"));
        objc_msgSend(v9, "setValue:forKey:", CFSTR("N/A"), CFSTR("GUADALUPE_REGISTER_4"));
      }
      else
      {
        v10 = decToBinStr(v76[0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
        objc_msgSend(v9, "setValue:forKey:", v12, CFSTR("PROJECTOR_STATE"));

        v13 = decToBinStr(*(unsigned int *)v75);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));
        objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("PROJECTOR_STATUS"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v74));
        objc_msgSend(v9, "setValue:forKey:", v16, CFSTR("PROJECTOR_RESISTANCE"));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v73));
        objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("PROJECTOR_LAST_RESISTANCE"));

        LODWORD(v15) = HIDWORD(v72);
        v18 = decToBinStr(v72);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v19));
        objc_msgSend(v9, "setValue:forKey:", v20, CFSTR("GUADALUPE_RECORDING_REGISTER"));

        v21 = decToBinStr(v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v22));
        objc_msgSend(v9, "setValue:forKey:", v23, CFSTR("GUADALUPE_REGISTER_4"));

      }
      objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("GUADALUPE_VALUES"));

      v5 = v77;
    }
    v24 = decToBinStr(v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v4, "setValue:forKey:", v25, CFSTR("FW_VALIDATION_BITS"));

    v75[0] = 0;
    if (DeviceCMInterface::isPDECaliobrationValid(&self->m_diagnosticCMInterface, v75))
    {
      v26 = CFSTR("Fail to get information");
    }
    else
    {
      if (v75[0])
      {
LABEL_23:
        *(_QWORD *)v76 = 0;
        v27 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
        if (a3->irType == 1)
        {
          if (!DeviceCMInterface::getPearlFloodProjectorFault(&self->m_diagnosticCMInterface, (unint64_t *)v76))
          {
            v92 = CFSTR("Fault Status");
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08X"), *(_QWORD *)v76));
            v93 = v29;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
            objc_msgSend(v4, "setValue:forKey:", v30, CFSTR("PROJECTOR_FAULT_FLOOD"));

            goto LABEL_31;
          }
          v28 = CFSTR("PROJECTOR_FAULT_FLOOD");
        }
        else
        {
          if (!DeviceCMInterface::getStructuredProjectorFault(&self->m_diagnosticCMInterface, (unint64_t *)v76))
          {
            v90 = CFSTR("[0x7C 0x7E 0x80 0x82 0x84]");
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%02X 0x%02X 0x%02X 0x%02X 0x%02X]"), HIBYTE(v76[1]), BYTE2(v76[1]), BYTE1(v76[1]), LOBYTE(v76[1]), HIBYTE(v76[0]), context));
            v91 = v31;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1));
            objc_msgSend(v27, "setValue:forKey:", v32, CFSTR("Fault Status"));

            v88 = CFSTR("[0x1C 0xF0]");
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%02X 0x%02X]"), BYTE2(v76[0]), BYTE1(v76[0])));
            v89 = v33;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1));
            objc_msgSend(v27, "setValue:forKey:", v34, CFSTR("CC State"));

            v86 = CFSTR("[0x07]");
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[0x%02X]"), LOBYTE(v76[0])));
            v87 = v35;
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1));
            objc_msgSend(v27, "setValue:forKey:", v36, CFSTR("Rigel State"));

            objc_msgSend(v4, "setValue:forKey:", v27, CFSTR("PROJECTOR_FAULT_STRUCTURED"));
            goto LABEL_31;
          }
          v28 = CFSTR("PROJECTOR_FAULT_STRUCTURED");
        }
        objc_msgSend(v4, "setValue:forKey:", CFSTR("Fail to get information"), v28);
LABEL_31:

        goto LABEL_32;
      }
      v26 = CFSTR("Not Valid");
    }
    objc_msgSend(v4, "setValue:forKey:", v26, CFSTR("PDE_CALIBRATION"));
    goto LABEL_23;
  }
LABEL_32:
  if (a3->isDepthOn && a3->irType == 3)
  {
    v70 = 0;
    v71 = 0;
    PearlDiagnosticInteractor::getGmcMetaData((uint64_t)&self->m_diagnosticInteractor, &v71, &v70);
    v37 = v71;
    v38 = v70;
    v39 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 10);
    v40 = v39;
    if (v38)
    {
      if (objc_msgSend(v38, "intValue") == 0xFFFF)
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d DATA NEVER DETECTED"), objc_msgSend(v38, "intValue")));
      else
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v38, "intValue")));
      objc_msgSend(v40, "setValue:forKey:", v41, CFSTR("GMC_RESULTS"));

    }
    else
    {
      objc_msgSend(v39, "setValue:forKey:", CFSTR("Fail to get information"), CFSTR("GMC_RESULTS"));
    }
    if (v37)
    {
      if (objc_msgSend(v37, "intValue") == -2)
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d DATA NEVER DETECTED"), objc_msgSend(v37, "intValue")));
      else
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v37, "intValue")));
      objc_msgSend(v40, "setValue:forKey:", v42, CFSTR("GMC_POINT_COUNT"));

    }
    else
    {
      objc_msgSend(v40, "setValue:forKey:", CFSTR("Fail to get information"), CFSTR("GMC_POINT_COUNT"));
    }
    v68 = 0;
    v69 = 0;
    v67 = 0;
    PearlDiagnosticInteractor::getGmcResultInformation(&self->m_diagnosticInteractor, (int)objc_msgSend(v38, "intValue"), &v69, &v68, &v67);
    v43 = v69;
    v44 = v68;
    v45 = v67;
    objc_msgSend(v40, "setValue:forKey:", v43, CFSTR("GMC_RESULT_NAME"));
    objc_msgSend(v40, "setValue:forKey:", v45, CFSTR("GMC_RESULT_DESCRIPTION"));
    objc_msgSend(v40, "setValue:forKey:", v44, CFSTR("GMC_RESULT_STAGE"));
    if (isGmcOk)
      v46 = CFSTR("PASS");
    else
      v46 = CFSTR("FAIL");
    objc_msgSend(v4, "setValue:forKey:", v46, CFSTR("GMC_STATUS"));
    objc_msgSend(v4, "setValue:forKey:", v40, CFSTR("GMC_META_DATA"));

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->m_diagnosticInteractor.m_irPearlFramesCount));
  objc_msgSend(v4, "setValue:forKey:", v47, CFSTR("IR_FRAME_COUNT"));

  if ((self->m_isCurrentStatusOK & isGmcOk) != 0)
    v48 = CFSTR("OK");
  else
    v48 = CFSTR("FAIL");
  objc_msgSend(v4, "setValue:forKey:", v48, CFSTR("OVERALL_IR"));
  if (!self->m_diagnosticInteractor.m_isPearlIrFramesArrived)
    objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("IR_FRAME_VALIDATION"));
  v66 = v4;
  setTestValidationBit(v77, &v66);
  v49 = v66;

  if ((v77 & 0x2000) != 0)
    self->m_isYGErrorDetected = 1;
  objc_autoreleasePoolPop(context);
  v8 = v49;
LABEL_58:
  if (a3->isRgbOn)
  {
    m_isPearlRgbFramesArrived = self->m_diagnosticInteractor.m_isPearlRgbFramesArrived;
    v52 = self->m_diagnosticInteractor.m_isPearlRgbFramesArrived && self->m_isAllPass;
    self->m_isAllPass = v52;
    if (m_isPearlRgbFramesArrived)
    {
      v84[0] = CFSTR("OVERALL_RGB");
      v84[1] = CFSTR("RGB_FRAME_COUNT");
      v85[0] = CFSTR("OK");
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->m_diagnosticInteractor.m_rgbPearlFramesCount));
      v85[1] = v53;
      v54 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 2));

    }
    else
    {
      v54 = &off_100034798;
    }
    v56 = m_isPearlRgbFramesArrived && self->m_isCurrentStatusOK;
    self->m_isCurrentStatusOK = v56;
  }
  else
  {
    v54 = 0;
  }
  PearlConfigurationStringKey = DeviceCMInterface::getPearlConfigurationStringKey(&self->m_diagnosticCMInterface, 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue(PearlConfigurationStringKey);
  if (v8 && v54)
  {
    m_statusesDict = self->m_statusesDict;
    v82[0] = CFSTR("RGB");
    v82[1] = CFSTR("IR");
    v83[0] = v54;
    v83[1] = v8;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 2));
    -[NSMutableDictionary setValue:forKey:](m_statusesDict, "setValue:forKey:", v60, v58);
LABEL_83:

    goto LABEL_84;
  }
  if (v8)
  {
    v61 = self->m_statusesDict;
    v80 = CFSTR("IR");
    v81 = v8;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1));
    -[NSMutableDictionary setValue:forKey:](v61, "setValue:forKey:", v60, v58);
    goto LABEL_83;
  }
  if (v54)
  {
    v62 = self->m_statusesDict;
    v78 = CFSTR("RGB");
    v79 = v54;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
    -[NSMutableDictionary setValue:forKey:](v62, "setValue:forKey:", v60, v58);
    goto LABEL_83;
  }
LABEL_84:
  -[Pearl_FW_Status_iOSController setResultBitMaskStatus:andState:](self, "setResultBitMaskStatus:andState:", a3->bitMaskID, !self->m_isCurrentStatusOK);

}

- (int)ConfigDevice:(PearlConfiguration *)a3
{
  DeviceCMInterface *p_m_diagnosticCMInterface;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  self->m_isRgbEnable = 0;
  self->m_isIrEnable = 0;
  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  v6 = DeviceCMInterface::configPearlDevice(&self->m_diagnosticCMInterface, a3);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail to configure device")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 688, v9);

  }
  else
  {
    self->m_isIrEnable = p_m_diagnosticCMInterface->m_isPearlIrConfigured;
    self->m_isRgbEnable = p_m_diagnosticCMInterface->m_isPearlRgbConfigured;
  }

  return v6;
}

- (int)startStreaming
{
  int started;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->m_isIrEnable)
  {
    if (!self->m_isRgbEnable)
      goto LABEL_8;
  }
  else if (!self->m_isRgbEnable)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("there is no stream avaiable for streaming")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 705, v7);
    v4 = -536870212;
    goto LABEL_11;
  }
  started = DeviceCMInterface::startPearlRgbStream(&self->m_diagnosticCMInterface);
  if (started)
  {
    v4 = started;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start Rgb stream failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 714, v7);
LABEL_11:

    return v4;
  }
  if (!self->m_isIrEnable)
    return 0;
LABEL_8:
  v4 = DeviceCMInterface::startPearlIrStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start ir stream failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 724, v7);
    goto LABEL_11;
  }
  return v4;
}

- (int)stopStreaming
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->m_isIrEnable)
  {
    v3 = DeviceCMInterface::stopPearlIrStream(&self->m_diagnosticCMInterface);
    if (v3)
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop ir stream failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 742, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isRgbEnable)
    return 0;
  v4 = DeviceCMInterface::stopPearlRgbStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop Rgb stream failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 752, v7);
    goto LABEL_7;
  }
  return v4;
}

- (BOOL)checkConnectivity
{
  __int128 v3;
  DeviceCMInterface v5;

  DeviceCMInterface::DeviceCMInterface(&v5);
  v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  *(_QWORD *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(_QWORD *)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_currentPearlConfiguration.bitMaskID = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
}

- (BOOL)isPortTypeFrontIRDetected
{
  DeviceCMInterface v3;

  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isPortTypeFrontRgbDetected
{
  DeviceCMInterface v3;

  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isPearlDetected
{
  __int128 v3;
  DeviceCMInterface v5;

  DeviceCMInterface::DeviceCMInterface(&v5);
  v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  *(_QWORD *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(_QWORD *)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_currentPearlConfiguration.bitMaskID = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
}

- (void)performFlow
{
  void *v3;
  void *v4;
  int m_timeForStreamInUSec;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t PearlSelfTestResult;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  NSNumber *m_delegate;
  NSNumber *m_gmcResult;
  HxISPCaptureDeviceController *m_captureDeviceController;
  NSNumber *m_gmcPointCount;
  NSString *v21;
  NSString *deviceName;
  void *v23;
  void *v24;
  void *v25;
  _UNKNOWN **v26;
  Pearl_FW_Status_iOSController *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  DeviceCMInterface v35;
  uint64_t v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  m_timeForStreamInUSec = self->m_timeForStreamInUSec;
  v6 = decToBinStr(self->m_casesMask);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start diagnostic flow stream time: %d[sec] cases mask: %@"), (m_timeForStreamInUSec / 1000000), v7));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 817, v8);

  v36 = 5;
  PearlSelfTestResult = getPearlSelfTestResult(&v36);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SelfTestResult ret value is %d results %llu"), PearlSelfTestResult, v36));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 821, v12);

  self->m_isAllPass = 1;
  self->m_resultsCasesMask = 0;
  if (-[Pearl_FW_Status_iOSController checkConnectivity](self, "checkConnectivity"))
  {
    if (!-[Pearl_FW_Status_iOSController isPortTypeFrontRgbDetected](self, "isPortTypeFrontRgbDetected"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing FCAM device, tests with FCAM will fail!")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 835, v15);

    }
    if (-[Pearl_FW_Status_iOSController isPortTypeFrontIRDetected](self, "isPortTypeFrontIRDetected"))
    {
      if (self->m_scenariosNumber >= 1)
      {
        objc_autoreleasePoolPush();
        DeviceCMInterface::DeviceCMInterface(&v35);
        v16 = *(_OWORD *)&v35.m_captureDeviceController;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v35.m_hVersion;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v16;
        *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v35.m_streamIdsInfo.rgbPearlStreamId;
        *(_QWORD *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(_QWORD *)&v35.m_currentPearlConfiguration.isIrOn;
        self->m_diagnosticCMInterface.m_currentPearlConfiguration.bitMaskID = v35.m_currentPearlConfiguration.bitMaskID;
        objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v35.m_currentPearlConfiguration.deviceName);
        *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v35.m_currentJasperConfiguration.isJasperOn;
        DeviceCMInterface::~DeviceCMInterface(&v35);
        PearlDiagnosticInteractor::PearlDiagnosticInteractor((PearlDiagnosticInteractor *)&v35);
        m_delegate = (NSNumber *)v35.m_delegate;
        v35.m_delegate = 0;
        m_gmcResult = self->m_diagnosticInteractor.m_gmcResult;
        self->m_diagnosticInteractor.m_gmcResult = m_delegate;

        m_captureDeviceController = v35.m_captureDeviceController;
        v35.m_captureDeviceController = 0;
        m_gmcPointCount = self->m_diagnosticInteractor.m_gmcPointCount;
        self->m_diagnosticInteractor.m_gmcPointCount = (NSNumber *)m_captureDeviceController;

        *(_QWORD *)&self->m_diagnosticInteractor.m_currentPearlConfiguration.isIrOn = *(_QWORD *)&v35.m_streamIdsInfo.rgbTeleStreamId;
        self->m_diagnosticInteractor.m_currentPearlConfiguration.bitMaskID = v35.m_streamIdsInfo.rgbPearlStreamId;
        v21 = *(NSString **)&v35.m_streamIdsInfo.rgbSuperWideStreamId;
        *(_QWORD *)&v35.m_streamIdsInfo.rgbSuperWideStreamId = 0;
        deviceName = self->m_diagnosticInteractor.m_currentPearlConfiguration.deviceName;
        self->m_diagnosticInteractor.m_currentPearlConfiguration.deviceName = v21;

        *(_QWORD *)&self->m_diagnosticInteractor.m_rgbPearlFramesCount = *(_QWORD *)&v35.m_currentPearlConfiguration.isIrOn;
        self->m_diagnosticInteractor.m_irPearlFramesCount = v35.m_currentPearlConfiguration.bitMaskID;

        self->m_diagnosticCMInterface.m_delegate = (StreamingClient *)&self->m_diagnosticInteractor;
        DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Finish diagnostic flow...")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 972, v25);

      v26 = &off_100034708;
      v27 = self;
      v28 = 0;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail with missing PEARL device, cannot dignose pearl")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v33, 840, v34);

      self->m_isAllPass = 0;
      v26 = &off_1000346F0;
      v27 = self;
      v28 = 0x8000000;
    }
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 829, v31);

    self->m_isAllPass = 0;
    v26 = &off_1000346F0;
    v27 = self;
    v28 = 0x2000000;
  }
  -[Pearl_FW_Status_iOSController finalizingWithStatusCode:andFinalizingCode:](v27, "finalizingWithStatusCode:andFinalizingCode:", v26, v28);
}

- (void)teardown
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("tear down triggered, verify attention detection status before bailing out")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 979, v5);

  -[Pearl_FW_Status_iOSController restoreAttentionDetection](self, "restoreAttentionDetection");
  -[Pearl_FW_Status_iOSController terminateComunication](self, "terminateComunication");
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cancel triggered, verify attention detection status before bailing out")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 988, v5);

  -[Pearl_FW_Status_iOSController restoreAttentionDetection](self, "restoreAttentionDetection");
  -[Pearl_FW_Status_iOSController terminateComunication](self, "terminateComunication");
}

- (void)finalizingWithErrorStatusCode:(id)a3 andInfoString:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *m_statusesDict;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[Pearl_FW_Status_iOSController restoreAttentionDetection](self, "restoreAttentionDetection");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v7, "setStatusCode:", v16);

  m_statusesDict = self->m_statusesDict;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL due to: %@"), v6));
  -[NSMutableDictionary setValue:forKey:](m_statusesDict, "setValue:forKey:", v9, CFSTR("All_PASS_STATUS"));

  v10 = self->m_statusesDict;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v11, "setData:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "statusCode"));
  logMainResults(v13, 8201, (uint64_t)objc_msgSend(v15, "intValue"));

  -[Pearl_FW_Status_iOSController terminateComunication](self, "terminateComunication");
  -[Pearl_FW_Status_iOSController setFinished:](self, "setFinished:", 1);

}

- (void)finalizingWithStatusCode:(id)a3 andFinalizingCode:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  const __CFString *v12;
  NSMutableDictionary *m_statusesDict;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  const __CFString *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  -[Pearl_FW_Status_iOSController restoreAttentionDetection](self, "restoreAttentionDetection");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->m_resultsCasesMask));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v7, "setStatusCode:", v6);

  if (!objc_msgSend(v35, "intValue"))
  {
    if (a4)
    {
      v12 = CFSTR("PASS");
      if (a4 == 0x10000)
      {
        m_statusesDict = self->m_statusesDict;
        if (!self->m_isAllPass)
          v12 = CFSTR("FAIL");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, device without pearl"), v12));
        -[NSMutableDictionary setValue:forKey:](m_statusesDict, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
      }
      else
      {
        v18 = self->m_statusesDict;
        if (!self->m_isAllPass)
          v12 = CFSTR("FAIL");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, missing information..."), v12));
        -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
      }
    }
    else
    {
      v16 = self->m_statusesDict;
      if (self->m_isAllPass)
        v17 = CFSTR("PASS");
      else
        v17 = CFSTR("FAIL");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, (%d passed out of %d)"), v17, self->m_passCount, self->m_scenariosNumber));
      -[NSMutableDictionary setValue:forKey:](v16, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
    }
    goto LABEL_38;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->m_resultsCasesMask | a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v9, "setStatusCode:", v8);

  if (a4 >= 0x400000)
  {
    if (a4 <= 0x1FFFFFF)
    {
      if (a4 == 0x400000)
      {
        v20 = self->m_statusesDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL, (%d passed out of %d) cannot stop streaming"), self->m_passCount, self->m_scenariosNumber));
        -[NSMutableDictionary setValue:forKey:](v20, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
        goto LABEL_38;
      }
      if (a4 == 0x800000)
      {
        v15 = self->m_statusesDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL, (%d passed out of %d) cannot disable sync mode"), self->m_passCount, self->m_scenariosNumber));
        -[NSMutableDictionary setValue:forKey:](v15, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
        goto LABEL_38;
      }
      goto LABEL_42;
    }
    if (a4 == 0x8000000)
    {
      -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, missing PEARL"), CFSTR("All_PASS_STATUS"));
      goto LABEL_39;
    }
    if (a4 == 0x4000000)
    {
      -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, missing FCAM"), CFSTR("All_PASS_STATUS"));
      goto LABEL_39;
    }
    if (a4 != 0x2000000)
      goto LABEL_42;
LABEL_36:
    -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, connectivity issue detected (fail to connect to interfaces)"), CFSTR("All_PASS_STATUS"));
    goto LABEL_39;
  }
  if (a4 >= 0x80000)
  {
    switch(a4)
    {
      case 0x80000:
        -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, cannot activate device"), CFSTR("All_PASS_STATUS"));
        goto LABEL_39;
      case 0x100000:
        v19 = self->m_statusesDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL, (%d passed out of %d) cannot achieve control on streams"), self->m_passCount, self->m_scenariosNumber));
        -[NSMutableDictionary setValue:forKey:](v19, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
        goto LABEL_38;
      case 0x200000:
        v10 = self->m_statusesDict;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL, (%d passed out of %d) cannot start streaming"), self->m_passCount, self->m_scenariosNumber));
        -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
LABEL_38:

        goto LABEL_39;
    }
    goto LABEL_42;
  }
  if (a4 == 0x20000)
  {
    -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, enumeration fail on rgb or ir sensores"), CFSTR("All_PASS_STATUS"));
    goto LABEL_36;
  }
  if (a4 == 0x40000)
  {
    v14 = self->m_statusesDict;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FAIL, (%d passed out of %d) Diagnostic bit mask input is not illegal"), self->m_passCount, self->m_scenariosNumber));
    -[NSMutableDictionary setValue:forKey:](v14, "setValue:forKey:", v11, CFSTR("All_PASS_STATUS"));
    goto LABEL_38;
  }
LABEL_42:
  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", CFSTR("FAIL, FAIL_ON_FLOW_ISSUE, unknown flow issue"), CFSTR("All_PASS_STATUS"));
LABEL_39:
  if (self->m_isYGErrorDetected)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
    objc_msgSend(v21, "setStatusCode:", &off_100034720);

  }
  v22 = self->m_statusesDict;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v23, "setData:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "data"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "statusCode"));
  logMainResults(v25, 8201, (uint64_t)objc_msgSend(v27, "intValue"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_FW_Status_iOSController.mm"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[Pearl_FW_Status_iOSController result](self, "result"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "statusCode"));
  v32 = decToBinStr(objc_msgSend(v31, "intValue"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ended Diagnostic. diagnostic flow status code %@ and all pass = %d"), v33, self->m_isAllPass));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 1074, v34);

  -[Pearl_FW_Status_iOSController terminateComunication](self, "terminateComunication");
  -[Pearl_FW_Status_iOSController setFinished:](self, "setFinished:", 1);

}

- (void)terminateComunication
{
  DeviceCMInterface *p_m_diagnosticCMInterface;

  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  if (DeviceCMInterface::isActivated(&self->m_diagnosticCMInterface))
    DeviceCMInterface::releaseDevice(p_m_diagnosticCMInterface);
}

- (void).cxx_destruct
{
  PearlDiagnosticInteractor *p_m_diagnosticInteractor;
  vector<PearlConfiguration, std::allocator<PearlConfiguration>> *p_m_configurationsList;

  p_m_diagnosticInteractor = &self->m_diagnosticInteractor;

  p_m_configurationsList = &self->m_configurationsList;
  sub_10001744C((void ***)&p_m_configurationsList);
  objc_storeStrong((id *)&self->m_statusesDict, 0);
  DeviceCMInterface::~DeviceCMInterface(&self->m_diagnosticCMInterface);
}

- (id).cxx_construct
{
  DeviceCMInterface::DeviceCMInterface(&self->m_diagnosticCMInterface);
  self->m_configurationsList.__end_ = 0;
  self->m_configurationsList.__end_cap_.__value_ = 0;
  self->m_configurationsList.__begin_ = 0;
  PearlDiagnosticInteractor::PearlDiagnosticInteractor(&self->m_diagnosticInteractor);
  return self;
}

@end
