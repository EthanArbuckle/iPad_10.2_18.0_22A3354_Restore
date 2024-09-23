@implementation Jas_FW_Status_iOSController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  NSMutableDictionary *v5;
  NSMutableDictionary *m_statusesDict;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  id CurrentVersion;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  JasperConfiguration *end;
  JasperConfiguration *v26;
  void *v27;
  JasperConfiguration v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;

  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
  m_statusesDict = self->m_statusesDict;
  self->m_statusesDict = v5;

  v27 = (void *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setupWithInputs Jas Diagnostic %@"), v27));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 51, v9);

  -[NSMutableDictionary setValue:forKey:](self->m_statusesDict, "setValue:forKey:", v27, CFSTR("DEVICE_NAME"));
  v10 = self->m_statusesDict;
  CurrentVersion = getCurrentVersion();
  v12 = (void *)objc_claimAutoreleasedReturnValue(CurrentVersion);
  -[NSMutableDictionary setValue:forKey:](v10, "setValue:forKey:", v12, CFSTR("VERSION"));

  self->m_scenariosNumber = 0;
  self->m_timeForStreamInUSec = 5000000;
  self->m_casesMask = 4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v13, "setData:", &__NSDictionary0__struct);

  self->m_isAllPass = 0;
  self->m_passCount = 0;
  self->m_isJasperEnable = 1;
  self->m_isSuperWideEnable = 0;
  self->m_isCurrentStatusOK = 1;
  if (self->m_casesMask >= 8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bad Diagnostic bit mask, bit mask 0x%x > 0x%x"), self->m_casesMask, 7));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 70, v17);

    v31 = CFSTR("PRE_CONFIGURATION_KEY");
    v32 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("PRE_CONFIGURATION_KEY"), v18);

  }
  v19 = 3;
  v20 = 1;
  do
  {
    if ((self->m_casesMask & v20) != 0)
    {
      v28.isJasperOn = 1;
      *(_DWORD *)&v28.isSuperWideOn = 0;
      v28.bitMaskID = 0;
      if (-[Jas_FW_Status_iOSController getConfigurationForCaseMask:returnedConfiguration:](self, "getConfigurationForCaseMask:returnedConfiguration:", v20, &v28))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Bad Diagnostic bit mask, configuration is not found")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v22, 88, v23);

        v29 = CFSTR("PRE_CONFIGURATION_KEY");
        v30 = CFSTR("Bad Diagnostic bit mask, configuration is not found");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
        -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("PRE_CONFIGURATION_KEY"), v24);

      }
      else
      {
        end = self->m_configurationsList.__end_;
        if (end >= self->m_configurationsList.__end_cap_.__value_)
        {
          v26 = (JasperConfiguration *)sub_100007114((uint64_t *)&self->m_configurationsList, &v28);
        }
        else
        {
          *end = v28;
          v26 = end + 1;
        }
        self->m_configurationsList.__end_ = v26;
      }
    }
    v20 = (2 * v20);
    --v19;
  }
  while (v19);
  self->m_scenariosNumber = (unint64_t)((char *)self->m_configurationsList.__end_
                                             - (char *)self->m_configurationsList.__begin_) >> 3;

}

- (int)getConfigurationForCaseMask:(int)a3 returnedConfiguration:(JasperConfiguration *)a4
{
  int result;
  JasperConfiguration v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  switch(a3)
  {
    case 1:
      result = 0;
      v5 = (JasperConfiguration)0x100000101;
      goto LABEL_7;
    case 2:
      result = 0;
      v5 = (JasperConfiguration)0x201000101;
      goto LABEL_7;
    case 4:
      result = 0;
      v5 = (JasperConfiguration)0x400000001;
LABEL_7:
      *a4 = v5;
      return result;
  }
  v6 = decToBinStr(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available configuration detetcted for this mask bit location %@"), v7));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 115, v10);

  return -536870206;
}

- (BOOL)checkConnectivity
{
  __int128 v3;
  DeviceCMInterface v5;

  DeviceCMInterface::DeviceCMInterface(&v5);
  self = (Jas_FW_Status_iOSController *)((char *)self + 32);
  v3 = *(_OWORD *)&v5.m_captureDeviceController;
  *(_OWORD *)self->DKDiagnosticController_opaque = *(_OWORD *)&v5.m_hVersion;
  *(_OWORD *)&self->m_validationStatusesList.__end_ = v3;
  *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v5.m_streamIdsInfo.rgbPearlStreamId;
  self->m_diagnosticCMInterface.m_captureDeviceController = *(HxISPCaptureDeviceController **)&v5.m_currentPearlConfiguration.isIrOn;
  self->m_diagnosticCMInterface.m_streamIdsInfo.rgbTeleStreamId = v5.m_currentPearlConfiguration.bitMaskID;
  objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId, v5.m_currentPearlConfiguration.deviceName);
  *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbSuperWideStreamId = *(_OWORD *)&v5.m_currentJasperConfiguration.isJasperOn;
  DeviceCMInterface::~DeviceCMInterface(&v5);
  DeviceCMInterface::initAndActivateCaptureDeviceController((DeviceCMInterface *)self);
}

- (BOOL)isPortTypeJasperDetected
{
  DeviceCMInterface v3;

  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (BOOL)isUnsealedUnitModule
{
  DeviceCMInterface v3;

  DeviceCMInterface::DeviceCMInterface(&v3);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v3);
}

- (int)ConfigDevice:(JasperConfiguration)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;

  self->m_isJasperEnable = 1;
  self->m_isSuperWideEnable = 0;
  v5 = DeviceCMInterface::configJasperDevice(&self->m_diagnosticCMInterface, *(const JasperConfiguration **)&a3);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail to configure device")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 180, v8);

  }
  else
  {
    self->m_isJasperEnable = *(_BYTE *)a3.isJasperOn;
    self->m_isSuperWideEnable = *(_BYTE *)(*(_QWORD *)&a3 + 1);
  }
  return v5;
}

- (int)startStreaming
{
  int started;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->m_isSuperWideEnable)
  {
    started = DeviceCMInterface::startRgbSuperWideRgbStream(&self->m_diagnosticCMInterface);
    if (started)
    {
      v4 = started;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start RGB SW stream failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 200, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isJasperEnable)
    return 0;
  v4 = DeviceCMInterface::startJasperStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start jasper stream failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 210, v7);
    goto LABEL_7;
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

  if (self->m_isJasperEnable)
  {
    v3 = DeviceCMInterface::stopJasperStream(&self->m_diagnosticCMInterface);
    if (v3)
    {
      v4 = v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop Jasper stream failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 228, v7);
LABEL_7:

      return v4;
    }
  }
  if (!self->m_isSuperWideEnable)
    return 0;
  v4 = DeviceCMInterface::stopRgbSuperWideStream(&self->m_diagnosticCMInterface);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop Jasper stream failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 238, v7);
    goto LABEL_7;
  }
  return v4;
}

- (void)produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:(JasperConfiguration)a3 ValidationStatus:(void *)a4
{
  DeviceCMInterface *p_m_diagnosticCMInterface;
  double v7;
  double v8;
  double JasperFpsDuringStreaming;
  double JasperAveragePointsDuringStreaming;
  _BOOL4 v11;
  double m_minAveragePointsNumberThreshold;
  _BOOL4 m_isJasperFramesArrived;
  id v14;
  char v15;
  char v18;
  BOOL v19;
  const __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id JasperConfigurationStringKey;
  void *v37;
  void *context;
  id v39;
  unint64_t v40;
  unsigned int v41;

  self->m_isCurrentStatusOK = 1;
  p_m_diagnosticCMInterface = &self->m_diagnosticCMInterface;
  if (self->m_diagnosticCMInterface.m_hVersion == 16)
    v7 = 62.0;
  else
    v7 = 124.0;
  if (self->m_diagnosticCMInterface.m_hVersion == 16)
    v8 = 54.0;
  else
    v8 = 108.0;
  context = objc_autoreleasePoolPush();
  JasperFpsDuringStreaming = JasDiagnosticInteractor::getJasperFpsDuringStreaming(&self->m_diagnosticInteractor);
  JasperAveragePointsDuringStreaming = JasDiagnosticInteractor::getJasperAveragePointsDuringStreaming(&self->m_diagnosticInteractor);
  v11 = JasperFpsDuringStreaming > v7 || JasperFpsDuringStreaming < v8;
  m_minAveragePointsNumberThreshold = self->m_diagnosticInteractor.m_minAveragePointsNumberThreshold;
  m_isJasperFramesArrived = self->m_diagnosticInteractor.m_isJasperFramesArrived;
  v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
  v41 = -1;
  DeviceCMInterface::validateJasperFwStatus(p_m_diagnosticCMInterface, &v41);
  v15 = 0;
  v18 = !self->m_isCurrentStatusOK || v41 != 0 || !m_isJasperFramesArrived || v11;
  if ((v18 & 1) == 0 && JasperAveragePointsDuringStreaming > m_minAveragePointsNumberThreshold)
    v15 = sub_100004708((uint64_t)a4);
  self->m_isCurrentStatusOK = v15;
  if (self->m_isAllPass)
    v19 = v15;
  else
    v19 = 0;
  self->m_isAllPass = v19;
  v20 = CFSTR("PASS");
  if (self->m_isCurrentStatusOK)
  {
    v21 = 0;
  }
  else
  {
    if (v11)
    {
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Fps = %f"), *(_QWORD *)&JasperFpsDuringStreaming));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&JasperFpsDuringStreaming));
      objc_msgSend(v14, "setValue:forKey:", v23, CFSTR("JASPER_FPS"));

      sub_1000047A0(a4, 30, v22);
    }
    else
    {
      v22 = 0;
    }
    if (JasperAveragePointsDuringStreaming > m_minAveragePointsNumberThreshold)
    {
      v21 = v22;
    }
    else
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PointCount = %f"), *(_QWORD *)&JasperAveragePointsDuringStreaming));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&JasperAveragePointsDuringStreaming));
      objc_msgSend(v14, "setValue:forKey:", v25, CFSTR("JASPER_POINTS_COUNT_AVERAGE"));

      v21 = v24;
      sub_1000047A0(a4, 31, v24);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), self->m_diagnosticInteractor.m_jasperFramesCount));
    objc_msgSend(v14, "setValue:forKey:", v26, CFSTR("JASPER_FRAME_COUNT"));

    v27 = v41;
    v28 = decToBinStr(v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0x%X) %@"), v27, v29, context));
    objc_msgSend(v14, "setValue:forKey:", v30, CFSTR("FW_VALIDATION_BITS"));

    v40 = 0;
    if (DeviceCMInterface::getJasperRikerProjectorFault(p_m_diagnosticCMInterface, &v40))
    {

      v21 = CFSTR("Fail to get riker information");
      objc_msgSend(v14, "setValue:forKey:", CFSTR("Fail to get information"), CFSTR("PROJECTOR_RIKER_FAULT"));
      sub_1000047A0(a4, 11, CFSTR("Fail to get riker information"));
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%X"), v40));
      objc_msgSend(v14, "setValue:forKey:", v31, CFSTR("PROJECTOR_RIKER_FAULT"));

    }
    v40 = 0;
    if (DeviceCMInterface::getJasperRikerProjectorWillFault(p_m_diagnosticCMInterface, &v40))
    {

      v21 = CFSTR("Fail to get riker information");
      objc_msgSend(v14, "setValue:forKey:", CFSTR("Fail to get information"), CFSTR("PROJECTOR_WILL_FAULT"));
      sub_1000047A0(a4, 11, CFSTR("Fail to get riker information"));
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%X"), v40));
      objc_msgSend(v14, "setValue:forKey:", v32, CFSTR("PROJECTOR_WILL_FAULT"));

    }
    v40 = 0;
    if (DeviceCMInterface::getJasperRikerResistance(p_m_diagnosticCMInterface, &v40))
    {

      v21 = CFSTR("Fail to get riker information");
      objc_msgSend(v14, "setValue:forKey:", CFSTR("Fail to get information"), CFSTR("PROJECTOR_RIKER_RESISTANCE"));
      sub_1000047A0(a4, 11, CFSTR("Fail to get riker information"));
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v40));
      objc_msgSend(v14, "setValue:forKey:", v33, CFSTR("PROJECTOR_RIKER_RESISTANCE"));

    }
    v20 = CFSTR("PASS");
    if (!self->m_isCurrentStatusOK)
      v20 = CFSTR("FAIL");
  }
  objc_msgSend(v14, "setValue:forKey:", v20, CFSTR("CONFIGURATION_STATUS"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", p_m_diagnosticCMInterface->m_hVersion));
  objc_msgSend(v14, "setValue:forKey:", v34, CFSTR("H_VER_ID"));

  if (self->m_isCurrentStatusOK)
  {

    v21 = CFSTR("Configuration status all pass");
    sub_1000047A0(a4, 0, CFSTR("Configuration status all pass"));
  }
  v39 = v14;
  setTestValidationBit(v41, &v39);
  v35 = v39;

  updateJasperValidationStatus(v41, (JasperValidationStatus *)a4);
  if (v41 == 525312)
  {

    v21 = CFSTR("Real power supply fault detected");
    sub_1000047A0(a4, 525312, CFSTR("Real power supply fault detected"));
  }

  objc_autoreleasePoolPop(context);
  JasperConfigurationStringKey = DeviceCMInterface::getJasperConfigurationStringKey(p_m_diagnosticCMInterface, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue(JasperConfigurationStringKey);
  if (v35)
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", v37, v35);

}

- (void)updateStatusDictionary:(id)a3 andValue:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  NSMutableDictionary *m_statusesDict;
  id v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->m_statusesDict, "allKeys"));
  v8 = objc_msgSend(v7, "containsObject:", v12);

  m_statusesDict = self->m_statusesDict;
  if (v8)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->m_statusesDict, "valueForKey:", v12));
    v11 = objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v10, "addEntriesFromDictionary:", v11);

  }
  else
  {
    v10 = objc_msgSend(v6, "mutableCopy");
    -[NSMutableDictionary setValue:forKey:](m_statusesDict, "setValue:forKey:", v10, v12);
  }

}

- (void)performFlow
{
  void *v3;
  void *v4;
  int m_timeForStreamInUSec;
  __CFString *v6;
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
  __int128 v18;
  NSString *m_deviceName;
  NSString *v20;
  _QWORD *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<int, int>, void *>>> *p_pair1;
  _QWORD *v23;
  unint64_t value;
  id JasperConfigurationStringKey;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  JasDiagnosticInteractor v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  m_timeForStreamInUSec = self->m_timeForStreamInUSec;
  v6 = decToBinStr(self->m_casesMask);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start diagnostic flow stream time: %d[sec] cases mask: %@"), (m_timeForStreamInUSec / 1000000), v7));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 403, v8);

  self->m_isAllPass = 1;
  if (!-[Jas_FW_Status_iOSController checkConnectivity](self, "checkConnectivity"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 411, v11);

    -[Jas_FW_Status_iOSController finalizingWithStatusCode:andInfoString:](self, "finalizingWithStatusCode:andInfoString:", 11, CFSTR("cannot define camera ststus, connectivity issue detected as camera interfaces cannot be reached"));
  }
  if (!-[Jas_FW_Status_iOSController isPortTypeJasperDetected](self, "isPortTypeJasperDetected"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Jasper module is missing")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v13, 419, v14);

    -[Jas_FW_Status_iOSController finalizingWithStatusCode:andInfoString:](self, "finalizingWithStatusCode:andInfoString:", 10, CFSTR("Jasper module is missing"));
  }
  if (-[Jas_FW_Status_iOSController isUnsealedUnitModule](self, "isUnsealedUnitModule"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Unsealed unit module suspected")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 427, v17);

    -[Jas_FW_Status_iOSController finalizingWithStatusCode:andInfoString:](self, "finalizingWithStatusCode:andInfoString:", 4294967294, CFSTR("Unsealed unit module suspected"));
  }
  if (self->m_scenariosNumber >= 1)
  {
    objc_autoreleasePoolPush();
    DeviceCMInterface::DeviceCMInterface((DeviceCMInterface *)&v32);
    v18 = *(_OWORD *)&v32.m_rgbSuperWideFrameCount;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_hVersion = *(_OWORD *)&v32._vptr$StreamingClient;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_captureDeviceController = v18;
    *(_OWORD *)&self->m_diagnosticCMInterface.m_streamIdsInfo.rgbPearlStreamId = *(_OWORD *)&v32.m_timer.beginTime;
    *(_QWORD *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.isIrOn = *(_QWORD *)&v32.m_maxBanksNumberForFrame;
    self->m_diagnosticCMInterface.m_currentPearlConfiguration.bitMaskID = LODWORD(v32.m_minAveragePointsNumberThreshold);
    objc_storeStrong((id *)&self->m_diagnosticCMInterface.m_currentPearlConfiguration.deviceName, v32.m_banksIdDictionary.__tree_.__begin_node_);
    *(_OWORD *)&self->m_diagnosticCMInterface.m_currentJasperConfiguration.isJasperOn = *(_OWORD *)&v32.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&v32);
    JasDiagnosticInteractor::JasDiagnosticInteractor(&v32);
    *(_QWORD *)&self->m_diagnosticInteractor.m_jasperFramesCount = *(_QWORD *)&v32.m_jasperFramesCount;
    *(_QWORD *)((char *)&self->m_diagnosticInteractor.m_jasperPointsCount + 2) = *(_QWORD *)((char *)&v32.m_jasperPointsCount
                                                                                           + 2);
    self->m_diagnosticInteractor.m_timer = v32.m_timer;
    m_deviceName = v32.m_deviceName;
    v32.m_deviceName = 0;
    v20 = self->m_diagnosticInteractor.m_deviceName;
    self->m_diagnosticInteractor.m_deviceName = m_deviceName;

    p_pair1 = &self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_;
    left = self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    *(_OWORD *)&self->m_diagnosticInteractor.m_maxBanksNumberForFrame = *(_OWORD *)&v32.m_maxBanksNumberForFrame;
    sub_1000031B8((uint64_t)&self->m_diagnosticInteractor.m_banksIdDictionary, left);
    v23 = v32.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__begin_node_ = v32.m_banksIdDictionary.__tree_.__begin_node_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = v23;
    value = v32.m_banksIdDictionary.__tree_.__pair3_.__value_;
    self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair3_.__value_ = v32.m_banksIdDictionary.__tree_.__pair3_.__value_;
    if (value)
    {
      v23[2] = p_pair1;
      v23 = 0;
      v32.m_banksIdDictionary.__tree_.__begin_node_ = &v32.m_banksIdDictionary.__tree_.__pair1_;
      v32.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_ = 0;
      v32.m_banksIdDictionary.__tree_.__pair3_.__value_ = 0;
    }
    else
    {
      self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__begin_node_ = p_pair1;
    }
    *(_QWORD *)&self->m_diagnosticInteractor.m_goodPointsCount = *(_QWORD *)&v32.m_goodPointsCount;
    self->m_diagnosticInteractor.m_subframeCount = v32.m_subframeCount;
    v32._vptr$StreamingClient = (void **)off_10001C688;
    sub_1000031B8((uint64_t)&v32.m_banksIdDictionary, v23);

    self->m_diagnosticCMInterface.m_delegate = (StreamingClient *)&self->m_diagnosticInteractor;
    JasperConfigurationStringKey = DeviceCMInterface::getJasperConfigurationStringKey(&self->m_diagnosticCMInterface, self->m_configurationsList.__begin_);
    v26 = (void *)objc_claimAutoreleasedReturnValue(JasperConfigurationStringKey);
    v32._vptr$StreamingClient = (void **)&stru_10001D350;
    memset(&v32.m_jasperFramesCount, 0, 24);
    v32._vptr$StreamingClient = (void **)v26;

    DeviceCMInterface::initAndActivateCaptureDeviceController(&self->m_diagnosticCMInterface);
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Finish diagnostic flow...")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v28, 576, v29);

  v30 = -[Jas_FW_Status_iOSController isAllStatusesGood](self, "isAllStatusesGood");
  if (self->m_isAllPass)
    v31 = v30;
  else
    v31 = 0;
  if (v31 == 1)
    -[Jas_FW_Status_iOSController finalizingWithStatusCode:andInfoString:](self, "finalizingWithStatusCode:andInfoString:", 0, &stru_10001D350);
  else
    -[Jas_FW_Status_iOSController finalizingOnError](self, "finalizingOnError");
}

- (BOOL)isAllStatusesGood
{
  vector<JasperValidationStatus, std::allocator<JasperValidationStatus>> *p_m_validationStatusesList;
  JasperValidationStatus *begin;
  unint64_t v4;
  unsigned int v5;
  void ***v6;
  char v7;
  void **v9;
  char v10[24];
  void **v11;

  p_m_validationStatusesList = &self->m_validationStatusesList;
  begin = self->m_validationStatusesList.__begin_;
  if (self->m_validationStatusesList.__end_ == begin)
    return 1;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = (void ***)((char *)begin + 32 * v4);
    v9 = *v6;
    memset(v10, 0, sizeof(v10));
    sub_100006FEC(v10, v6[1], v6[2], v6[2] - v6[1]);
    v7 = sub_100004708((uint64_t)&v9);
    v11 = (void **)v10;
    sub_1000070A8(&v11);

    if ((v7 & 1) == 0)
      break;
    v4 = v5;
    begin = p_m_validationStatusesList->__begin_;
    ++v5;
  }
  while (v4 < (p_m_validationStatusesList->__end_ - p_m_validationStatusesList->__begin_) >> 5);
  return v7;
}

- (void)start
{
  -[Jas_FW_Status_iOSController performFlow](self, "performFlow");
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *m_statusesDict;
  void *v8;
  void *v9;
  NSDictionary *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Jasper Diag was cancelled")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 611, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v6, "setStatusCode:", &off_10001F9C0);

  m_statusesDict = self->m_statusesDict;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v8, "setData:", m_statusesDict);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "statusCode"));
  logMainResults(v10, 8253, (uint64_t)objc_msgSend(v12, "intValue"));

  -[Jas_FW_Status_iOSController setFinished:](self, "setFinished:", 1);
}

- (void)finalizingOnError
{
  void *v2;
  void *v3;
  void *v4;
  JasperValidationStatus *begin;
  uint64_t v6;
  uint64_t v7;
  void ***v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  int v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  const __CFString *JasperStatusValueString;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  _UNKNOWN **v36;
  void *v37;
  NSMutableDictionary *m_statusesDict;
  void *v39;
  void *v40;
  NSDictionary *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  int v46;
  id obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void ***v53;
  uint64_t v54;
  uint64_t v55;
  void ****v56;
  void **v57;
  void **v58;
  uint64_t v59;
  uint64_t *v60;
  _QWORD *v61[2];
  void ***v62;
  void ***v63;
  void *v64;
  void *v65;
  _BYTE v66[128];

  -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("All_PASS_STATUS"), &off_10001FB20);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Agregating statuses")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 622, v4);

  v61[0] = 0;
  v61[1] = 0;
  v60 = (uint64_t *)v61;
  LODWORD(v53) = 1;
  v56 = &v53;
  *((_DWORD *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) = 0;
  LODWORD(v53) = 2;
  v56 = &v53;
  *((_DWORD *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) = 0;
  LODWORD(v53) = -1;
  v56 = &v53;
  *((_DWORD *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) = 0;
  LODWORD(v53) = 100;
  v56 = &v53;
  *((_DWORD *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) = 0;
  v48 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 50);
  begin = self->m_validationStatusesList.__begin_;
  if (self->m_validationStatusesList.__end_ != begin)
  {
    v6 = 0;
    v7 = 0;
    v44 = 0;
    while (1)
    {
      v8 = (void ***)((char *)begin + 32 * v6);
      v56 = *v8;
      v58 = 0;
      v59 = 0;
      v57 = 0;
      sub_100006FEC((char *)&v57, v8[1], v8[2], v8[2] - v8[1]);
      if ((sub_100004708((uint64_t)&v56) & 1) == 0)
        break;
LABEL_4:
      v53 = &v57;
      sub_1000070A8((void ***)&v53);

      begin = self->m_validationStatusesList.__begin_;
      v6 = ++v44;
      if (v44 >= (unint64_t)((self->m_validationStatusesList.__end_ - begin) >> 5))
        goto LABEL_27;
    }
    v9 = 0;
LABEL_7:
    v53 = 0;
    v54 = 0;
    v55 = 0;
    sub_100006FEC((char *)&v53, v57, v58, v58 - v57);
    v10 = v9;
    v11 = v54 - (_QWORD)v53;
    v63 = (void ***)&v53;
    sub_1000070A8((void ***)&v63);
    v46 = v10;
    if (v10 >= v11 >> 3)
      goto LABEL_4;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    sub_100006FEC((char *)&v53, v57, v58, v58 - v57);
    v12 = v53[v10];
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allKeys"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    if (!v14)
      goto LABEL_26;
    v15 = *(_QWORD *)v50;
LABEL_10:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8253/Jas_FW_Status_iOSController.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v20));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 646, v21);

      v22 = objc_msgSend(v17, "intValue");
      v23 = v22;
      if (v22 <= 0x30)
      {
        if (((1 << v22) & 0x1FF0040700C00) != 0)
        {
          LODWORD(v63) = 1;
          v62 = (void ***)&v63;
          v24 = sub_1000031F8(&v60, (int *)&v63, (uint64_t)&unk_100017105, (unsigned int **)&v62);
          ++*((_DWORD *)v24 + 8);
          v25 = 1;
          goto LABEL_16;
        }
        if (v22 == 31)
        {
          LODWORD(v63) = -1;
          v62 = (void ***)&v63;
          v32 = sub_1000031F8(&v60, (int *)&v63, (uint64_t)&unk_100017105, (unsigned int **)&v62);
          ++*((_DWORD *)v32 + 8);
          v25 = 0xFFFFFFFFLL;
          goto LABEL_16;
        }
      }
      if (v22 == 525312)
      {
        LODWORD(v63) = 2;
        v62 = (void ***)&v63;
        v33 = sub_1000031F8(&v60, (int *)&v63, (uint64_t)&unk_100017105, (unsigned int **)&v62);
        ++*((_DWORD *)v33 + 8);
        v25 = 2;
      }
      else
      {
        LODWORD(v63) = 100;
        v62 = (void ***)&v63;
        v34 = sub_1000031F8(&v60, (int *)&v63, (uint64_t)&unk_100017105, (unsigned int **)&v62);
        ++*((_DWORD *)v34 + 8);
        if (!v23)
          goto LABEL_17;
        v25 = 100;
      }
LABEL_16:
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GROUP_CODE: %d"), v25));
      JasperStatusValueString = getJasperStatusValueString(v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue(JasperStatusValueString);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%d] %@"), v7, v28));

      v64 = v26;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v17));
      v65 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));

      objc_msgSend(v48, "setValue:forKey:", v31, v29);
      v7 = (v7 + 1);
LABEL_17:
      if (v14 == (id)++v16)
      {
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        v14 = v35;
        if (!v35)
        {
LABEL_26:

          -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", v56, v48);
          v63 = (void ***)&v53;
          sub_1000070A8((void ***)&v63);
          v9 = v46 + 1;
          goto LABEL_7;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_27:
  LODWORD(v53) = 2;
  v56 = &v53;
  if (*((int *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) <= 0)
  {
    LODWORD(v53) = 1;
    v56 = &v53;
    if (*((int *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) <= 0)
    {
      LODWORD(v53) = -1;
      v56 = &v53;
      if (*((int *)sub_1000031F8(&v60, (int *)&v53, (uint64_t)&unk_100017105, (unsigned int **)&v56) + 8) <= 0)
        v36 = &off_10001FA20;
      else
        v36 = &off_10001FA08;
    }
    else
    {
      v36 = &off_10001F9F0;
    }
  }
  else
  {
    v36 = &off_10001F9D8;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v37, "setStatusCode:", v36);

  m_statusesDict = self->m_statusesDict;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v39, "setData:", m_statusesDict);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v41 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "data"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "statusCode"));
  logMainResults(v41, 8253, (uint64_t)objc_msgSend(v43, "intValue"));

  -[Jas_FW_Status_iOSController setFinished:](self, "setFinished:", 1);
  sub_1000031B8((uint64_t)&v60, v61[0]);
}

- (void)finalizingWithStatusCode:(int)a3 andInfoString:(id)a4
{
  id v6;
  void *v7;
  _UNKNOWN **v8;
  void *v9;
  NSMutableDictionary *m_statusesDict;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  id v21;

  v6 = a4;
  if (!a3 && self->m_isAllPass)
  {
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("All_PASS_STATUS"), &off_10001FB70);
    goto LABEL_8;
  }
  -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("All_PASS_STATUS"), &off_10001FB48);
  if ((a3 - 10) < 2)
  {
    if (!v6)
    {
      -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("IMMEDIATE_ERROR_FINALIZING"), &off_10001FB98);
      v8 = &off_10001F9F0;
      goto LABEL_16;
    }
    v20 = CFSTR("FINALIZING_ERROR_INFO");
    v21 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("IMMEDIATE_ERROR_FINALIZING"), v7);
    v8 = &off_10001F9F0;
    goto LABEL_13;
  }
  if (a3 == -2)
  {
    if (!v6)
    {
      v8 = &off_10001FA50;
      goto LABEL_16;
    }
    v18 = CFSTR("FINALIZING_ERROR_INFO");
    v19 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("IMMEDIATE_ERROR_FINALIZING"), v7);
    v8 = &off_10001FA50;
    goto LABEL_13;
  }
  if (a3)
  {
    v16 = CFSTR("JASPER_UNKNOWN_GROUP");
    v17 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    -[Jas_FW_Status_iOSController updateStatusDictionary:andValue:](self, "updateStatusDictionary:andValue:", CFSTR("IMMEDIATE_ERROR_FINALIZING"), v7);
    v8 = &off_10001FA20;
LABEL_13:

    goto LABEL_16;
  }
LABEL_8:
  v8 = &off_10001FA38;
LABEL_16:
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v9, "setStatusCode:", v8);

  m_statusesDict = self->m_statusesDict;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  objc_msgSend(v11, "setData:", m_statusesDict);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[Jas_FW_Status_iOSController result](self, "result"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "statusCode"));
  logMainResults(v13, 8253, (uint64_t)objc_msgSend(v15, "intValue"));

  -[Jas_FW_Status_iOSController setFinished:](self, "setFinished:", 1);
}

- (void).cxx_destruct
{
  JasDiagnosticInteractor *p_m_diagnosticInteractor;
  JasperConfiguration *begin;
  vector<JasperValidationStatus, std::allocator<JasperValidationStatus>> *p_m_validationStatusesList;

  p_m_diagnosticInteractor = &self->m_diagnosticInteractor;
  self->m_diagnosticInteractor._vptr$StreamingClient = (void **)off_10001C688;
  sub_1000031B8((uint64_t)&self->m_diagnosticInteractor.m_banksIdDictionary, (_QWORD *)self->m_diagnosticInteractor.m_banksIdDictionary.__tree_.__pair1_.__value_.__left_);

  objc_storeStrong((id *)&self->m_statusesDict, 0);
  begin = self->m_configurationsList.__begin_;
  if (begin)
  {
    self->m_configurationsList.__end_ = begin;
    operator delete(begin);
  }
  DeviceCMInterface::~DeviceCMInterface(&self->m_diagnosticCMInterface);
  p_m_validationStatusesList = &self->m_validationStatusesList;
  sub_1000076E0((void ***)&p_m_validationStatusesList);
}

- (id).cxx_construct
{
  self->m_validationStatusesList.__end_ = 0;
  self->m_validationStatusesList.__end_cap_.__value_ = 0;
  self->m_validationStatusesList.__begin_ = 0;
  DeviceCMInterface::DeviceCMInterface(&self->m_diagnosticCMInterface);
  self->m_configurationsList.__end_ = 0;
  self->m_configurationsList.__end_cap_.__value_ = 0;
  self->m_configurationsList.__begin_ = 0;
  JasDiagnosticInteractor::JasDiagnosticInteractor(&self->m_diagnosticInteractor);
  return self;
}

@end
