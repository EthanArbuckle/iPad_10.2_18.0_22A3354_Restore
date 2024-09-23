void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

{
  this->m_currentPearlConfiguration.deviceName = 0;
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *result;

  result = this->m_captureDeviceController;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    result = this->m_captureDeviceController;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->m_hVersion = -1;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  *(_QWORD *)&this->m_currentJasperConfiguration.bitMaskID = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  this->m_delegate = 0;
  this->m_captureDeviceController = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
  DeviceCMInterface::releaseInterface(this);

}

void sub_100002EB8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
  operator new();
}

void sub_100002FEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HxISPCaptureDeviceController *v3;
  uint64_t v5;
  NSNumber *v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFDictionaryRef DictionaryRepresentation;
  const __CFBoolean *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  BOOL v61;
  char v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  HxISPCaptureDeviceController *v70;
  NSNumber *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v76;
  int v77;
  int v78;
  id obja;
  id obj;
  uint64_t v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint64_t v89;
  id v90;
  _BYTE v91[128];

  if ((a2 & 0x80000000) != 0 || (v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error bad streamID of %d "), a2));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 164, v15);

    return 3758097084;
  }
  v5 = *(unsigned int *)(a3 + 44);
  if ((_DWORD)v5 == -1)
  {
    v88 = 0;
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v88);
    if ((_DWORD)v7)
    {
      obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to get sw stream supported formats %@"), v7, v18));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 175, v19);

      return (uint64_t)v7;
    }
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v88;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v34)
    {
      v35 = -1;
      v82 = *(_QWORD *)v85;
      while (2)
      {
        v36 = 0;
        v77 = v35 + (_DWORD)v34;
        v78 = v35;
        do
        {
          if (*(_QWORD *)v85 != v82)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("VideoIsBinned")));
          v39 = objc_msgSend(v38, "BOOLValue");

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorWidth")));
          v41 = objc_msgSend(v40, "integerValue");

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorHeight")));
          v43 = objc_msgSend(v42, "integerValue");

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SupportedOutputs")));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForKey:", CFSTR("PrimaryScaler")));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "valueForKey:", CFSTR("DefaultCropRect")));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("X")));
          objc_msgSend(v47, "floatValue");
          v49 = v48;

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Y")));
          objc_msgSend(v50, "floatValue");
          v52 = v51;

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Width")));
          objc_msgSend(v53, "floatValue");
          v55 = v54;

          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Height")));
          objc_msgSend(v56, "floatValue");
          v58 = v57;

          v61 = *(unsigned __int8 *)(a3 + 40) != v39 || *(_DWORD *)a3 != v41 || *(_DWORD *)(a3 + 4) != v43;
          if (*(double *)(a3 + 8) != v49)
            v61 = 1;
          if (*(double *)(a3 + 16) != v52)
            v61 = 1;
          if (*(double *)(a3 + 24) != v55)
            v61 = 1;
          v62 = *(double *)(a3 + 32) != v58 || v61;

          if ((v62 & 1) == 0)
          {
            v5 = (v78 + (_DWORD)v36 + 1);
            goto LABEL_47;
          }
          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
        v35 = v77;
        if (v34)
          continue;
        break;
      }
      v5 = 0xFFFFFFFFLL;
LABEL_47:

      if ((_DWORD)v5 != -1)
      {
        v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {

    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
    v66 = DeviceCMInterface::getErrorInformationString(0);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to find cam required format, %@"), 0, v67));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 216, v68);

    return 0;
  }
LABEL_4:
  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5);
  v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!(_DWORD)v7)
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v21, kFigCaptureStreamVideoOutputConfigurationKey_Height);

    }
    if (*(_DWORD *)(a3 + 48))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v22, kFigCaptureStreamVideoOutputConfigurationKey_Width);

    }
    v23 = *(double *)(a3 + 80);
    if (v23 != 0.0)
    {
      v24 = *(_QWORD *)(a3 + 56);
      v25 = *(_QWORD *)(a3 + 64);
      v26 = *(_QWORD *)(a3 + 72);
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v23 - 3));
      objc_msgSend(v20, "setValue:forKey:", DictionaryRepresentation, kFigCaptureStreamVideoOutputConfigurationKey_CropRect);

    }
    if (objc_msgSend(v20, "count"))
    {
      v89 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      v90 = v20;
      v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v28);
      if ((_DWORD)v7)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
        v31 = DeviceCMInterface::getErrorInformationString(v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to video configuration, %@"), v7, v32));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 243, v33);
        goto LABEL_18;
      }

    }
    if (*(_DWORD *)(a3 + 100))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v63 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 251, v32);
        goto LABEL_66;
      }
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_100034678);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v69 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus pos, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 257, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v70 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v71 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v70, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v71);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v72 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set max integrtion time, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 265, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v73 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set unlock auto expsosure now, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 274, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v74 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set SphereMode, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 283, v32);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      v7 = 0;
      goto LABEL_68;
    }
    v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v28);
    if (!(_DWORD)v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
    v76 = DeviceCMInterface::getErrorInformationString(v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v32));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 292, v33);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = DeviceCMInterface::getErrorInformationString(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set sw format index, %@"), v7, v11));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 222, v12);

  return (uint64_t)v7;
}

void sub_100003BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  const __CFString *result;

  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        result = CFSTR("base object error unsupported protocol");
        break;
      case 0xFFFFCE0D:
        result = CFSTR("base object error property not supported");
        break;
      case 0xFFFFCE0E:
        result = CFSTR("base object error allocation failed");
        break;
      case 0xFFFFCE0F:
        result = CFSTR("base object error invalidated");
        break;
      case 0xFFFFCE10:
        result = CFSTR("base object error property not found");
        break;
      case 0xFFFFCE11:
        result = CFSTR("base object error value not available");
        break;
      case 0xFFFFCE12:
        result = CFSTR("base object error unsupported operation");
        break;
      case 0xFFFFCE13:
        result = CFSTR("base object error unsupported version");
        break;
      case 0xFFFFCE14:
        result = CFSTR("base object error parameter error");
        break;
      default:
        if ((_DWORD)this)
LABEL_10:
          result = CFSTR("Unknown error information");
        else
          result = CFSTR("OK");
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        result = CFSTR("general error");
        break;
      case 0xE00002BD:
        result = CFSTR("can't allocate memory");
        break;
      case 0xE00002BE:
        result = CFSTR("resource shortage");
        break;
      case 0xE00002BF:
        result = CFSTR("error during IPC");
        break;
      case 0xE00002C0:
        result = CFSTR("no such device");
        break;
      case 0xE00002C1:
        result = CFSTR("privilege violation");
        break;
      case 0xE00002C2:
        result = CFSTR("invalid argument");
        break;
      case 0xE00002C3:
        result = CFSTR("device read locked");
        break;
      case 0xE00002C4:
        result = CFSTR("device write locked");
        break;
      case 0xE00002C5:
        result = CFSTR("exclusive access and");
        break;
      case 0xE00002C6:
        result = CFSTR("sent/received messages");
        break;
      case 0xE00002C7:
        result = CFSTR("unsupported function");
        break;
      case 0xE00002C8:
        result = CFSTR("misc. VM failure");
        break;
      case 0xE00002C9:
        result = CFSTR("internal error");
        break;
      case 0xE00002CA:
        result = CFSTR("General I/O error");
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        result = CFSTR("can't acquire lock");
        break;
      case 0xE00002CD:
        result = CFSTR("device not open");
        break;
      case 0xE00002CE:
        result = CFSTR("read not supported");
        break;
      case 0xE00002CF:
        result = CFSTR("write not supported");
        break;
      case 0xE00002D0:
        result = CFSTR("alignment error");
        break;
      case 0xE00002D1:
        result = CFSTR("Media Error");
        break;
      case 0xE00002D2:
        result = CFSTR("device(s) still open");
        break;
      case 0xE00002D3:
        result = CFSTR("rld failure");
        break;
      case 0xE00002D4:
        result = CFSTR("DMA failure");
        break;
      case 0xE00002D5:
        result = CFSTR("Device Busy");
        break;
      case 0xE00002D6:
        result = CFSTR("I/O Timeout");
        break;
      case 0xE00002D7:
        result = CFSTR("device offline");
        break;
      case 0xE00002D8:
        result = CFSTR("not ready");
        break;
      case 0xE00002D9:
        result = CFSTR("device not attached");
        break;
      case 0xE00002DA:
        result = CFSTR("no DMA channels left");
        break;
      case 0xE00002DB:
        result = CFSTR("no space for data");
        break;
      case 0xE00002DD:
        result = CFSTR("port already exists");
        break;
      case 0xE00002DE:
        result = CFSTR("can't wire down");
        break;
      case 0xE00002DF:
        result = CFSTR("no interrupt attached");
        break;
      case 0xE00002E0:
        result = CFSTR("no DMA frames enqueued");
        break;
      case 0xE00002E1:
        result = CFSTR("oversized msg received");
        break;
      case 0xE00002E2:
        result = CFSTR("not permitted");
        break;
      case 0xE00002E3:
        result = CFSTR("no power to device");
        break;
      case 0xE00002E4:
        result = CFSTR("media not present");
        break;
      case 0xE00002E5:
        result = CFSTR("media not formatted");
        break;
      case 0xE00002E6:
        result = CFSTR("no such mode");
        break;
      case 0xE00002E7:
        result = CFSTR("data underrun");
        break;
      case 0xE00002E8:
        result = CFSTR("data overrun");
        break;
      case 0xE00002E9:
        result = CFSTR("the device is not working properly!");
        break;
      case 0xE00002EA:
        result = CFSTR("a completion routine is required");
        break;
      case 0xE00002EB:
        result = CFSTR("operation aborted");
        break;
      case 0xE00002EC:
        result = CFSTR("bus bandwidth would be exceeded");
        break;
      case 0xE00002ED:
        result = CFSTR("device not responding");
        break;
      case 0xE00002EE:
        result = CFSTR("isochronous I/O request for distant past!");
        break;
      case 0xE00002EF:
        result = CFSTR("isochronous I/O request for distant future");
        break;
      case 0xE00002F0:
        result = CFSTR("data was not found");
        break;
      default:
        if ((_DWORD)this != -536870911)
          goto LABEL_10;
        result = CFSTR("should never be seen");
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  uint64_t v2;
  DeviceCMInterface *v3;
  void *v4;
  void *v5;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  if (this->m_currentJasperConfiguration.isWideOn)
  {
    v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbWideStreamId);
    if ((_DWORD)v2)
    {
      v3 = (DeviceCMInterface *)v2;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 306, v8);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->m_currentJasperConfiguration.isSuperWideOn)
  {
    v9 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
    if ((_DWORD)v9)
    {
      v3 = (DeviceCMInterface *)v9;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v10 = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 315, v8);
      goto LABEL_7;
    }
  }
  v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if ((_DWORD)v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 323, v7);
    goto LABEL_10;
  }
  return v3;
}

void sub_100004410(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if ((a2 & 0x80000000) != 0 || !this->m_captureDeviceController)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutputForStreamId failed, stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 885, v9);
    v6 = 3758097129;

    return v6;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_100004590(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  __CFDictionary *Mutable;
  const __CFBoolean *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    v4 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if ((_DWORD)v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableJasperOutput failed with OSStatus 0x%x, %@"), v4, v8));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 945, v9);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail to create output enable dictionary for pointcloud output")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 954, v12);
    v4 = 3758097084;

  }
  return v4;
}

void sub_100004774(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2;
  int bitMaskID;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 isWideOn;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _UNKNOWN **v38;

  v2 = 3758097126;
  if (!a2->isSyncModeOn && a2->isJasperOn)
  {
    if (this->m_streamIdsInfo.jasperStreamId == -1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 339, v18);

      return 3758097088;
    }
    bitMaskID = a2->bitMaskID;
    if (bitMaskID == 16 || bitMaskID == 8)
    {
      v37 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v38 = &off_100034690;
      v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if ((_DWORD)v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v9, jasperStreamId, v14));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 356, v15);

LABEL_13:
        v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->m_isJasperConfigured = 1;
      this->m_currentJasperConfiguration.isJasperOn = 1;
      isWideOn = a2->isWideOn;
      if (!a2->isSuperWideOn && !a2->isWideOn)
        goto LABEL_14;
      if (a2->isSuperWideOn)
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb sw failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 369, v21);

          goto LABEL_13;
        }
        isWideOn = a2->isWideOn;
      }
      if (isWideOn
        && (v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1), (_DWORD)v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb w failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 378, v22);

      }
      else
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 387, v23);

        }
        else
        {
          v24 = (char *)this->m_captureDeviceController + 16;
          v25 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
          v26 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.rgbWideStreamId];
          v27 = *(_QWORD *)&v24[8 * this->m_streamIdsInfo.jasperStreamId];
          v28 = objc_alloc_init((Class)NSMutableArray);
          v11 = v28;
          if (a2->isWideOn)
            objc_msgSend(v28, "addObject:", v26);
          if (a2->isSuperWideOn)
            objc_msgSend(v11, "addObject:", v25);
          if (a2->isJasperOn)
            objc_msgSend(v11, "addObject:", v27);
          v35 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v36 = v11;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
          v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if ((_DWORD)v9)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
            v31 = this->m_streamIdsInfo.jasperStreamId;
            v32 = DeviceCMInterface::getErrorInformationString(v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v9, v31, v33));
            NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 408, v34);

          }
          else
          {
            this->m_currentJasperConfiguration = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100004CCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbWideStreamId, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 774, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.jasperStreamId != (_DWORD)a2
    && this->m_streamIdsInfo.rgbSuperWideStreamId != (_DWORD)a2
    && this->m_streamIdsInfo.rgbWideStreamId != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d or %d or %d for jasper)"), a2, this->m_streamIdsInfo.jasperStreamId, this->m_streamIdsInfo.rgbSuperWideStreamId, this->m_streamIdsInfo.rgbWideStreamId));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 780, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 790, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_100005040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->m_currentJasperConfiguration = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  unsigned int jasperStreamId;
  uint64_t v5;
  CFArrayRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  const __CFBoolean *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFBoolean *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFBoolean *v29;
  uint64_t rgbSuperWideStreamId;
  void *v31;
  void *v32;
  void *v33;
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v35;
  uint64_t v36;
  uint64_t FigBaseObject;
  unsigned int (*v38)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v39;
  const __CFArray *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  DeviceCMInterface *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  CFArrayRef theArray;
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _UNKNOWN **v76;
  uint64_t v77;
  _UNKNOWN **v78;
  CFRange v79;
  CFRange v80;

  *(_WORD *)&this->m_isJasperSuperWideConfigured = 0;
  this->m_currentJasperConfiguration.isJasperOn = 1;
  *(_DWORD *)&this->m_currentJasperConfiguration.isSuperWideOn = 0;
  this->m_currentJasperConfiguration.bitMaskID = 0;
  jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 424, v15);

    return 3758097088;
  }
  if (a2->isJasperOn)
  {
    theArray = 0;
    v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, jasperStreamId, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    v6 = theArray;
    theArray = 0;
    if ((_DWORD)v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      v9 = this->m_streamIdsInfo.jasperStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)"), v5, v9, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 441, v12);

      return v5;
    }
    v16 = -[__CFArray containsObject:](v6, "containsObject:", &off_1000346A8);
    v17 = -[__CFArray containsObject:](v6, "containsObject:", &off_100034690);
    if (v16)
    {
      v77 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v78 = &off_1000346A8;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalShortHybridMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 456, v21);
    }
    else
    {
      if (!v17)
      {
        v29 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v29, "lastPathComponent"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot resolve projector mode")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 467, v24);
        v5 = 3758097084;
        goto LABEL_34;
      }
      v75 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v76 = &off_100034690;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 463, v21);
    }
    v22 = v18;

    v5 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v18);
    if ((_DWORD)v5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v25 = this->m_streamIdsInfo.jasperStreamId;
      v26 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v5, v25, v27));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 474, v28);

      v29 = v22;
LABEL_34:

      return v5;
    }
    this->m_isJasperConfigured = 1;
    this->m_currentJasperConfiguration.isJasperOn = 1;

  }
  if (a2->isSuperWideOn)
  {
    rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
    if ((_DWORD)rgbSuperWideStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
      if ((_DWORD)rgbSuperWideStreamId == -1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastPathComponent"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB super wide stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v46, 485, v47);

        return 3758097136;
      }
    }
    v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, rgbSuperWideStreamId, 1);
    if ((_DWORD)v5)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastPathComponent"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v32, 493, v33);

      return v5;
    }
    this->m_isJasperSuperWideConfigured = 1;
    if (a2->isJasperOn && a2->isSuperWideOn)
    {
      m_captureDeviceController = this->m_captureDeviceController;
      if (a2->isSyncModeOn)
      {
        if (*((_DWORD *)m_captureDeviceController + 536))
        {
          v35 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          v36 = 260;
          do
          {
            theArray = 0;
            FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*((_QWORD *)m_captureDeviceController
                                                                               + v36));
            v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 48);
            if (!v38 || v38(FigBaseObject, v35, kCFAllocatorDefault, &theArray))
              break;
            v39 = theArray;
            v79.length = CFArrayGetCount(theArray);
            v79.location = 0;
            if (CFArrayContainsValue(v39, v79, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.jasperStreamId + 2))&& (v40 = theArray, v80.length = CFArrayGetCount(theArray), v80.location = 0, CFArrayContainsValue(v40, v80, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbSuperWideStreamId + 2))))
            {
              v41 = *((_QWORD *)this->m_captureDeviceController + v36);
            }
            else
            {
              v41 = 0;
            }
            CFRelease(theArray);
            if (v41)
              goto LABEL_32;
            m_captureDeviceController = this->m_captureDeviceController;
            v42 = v36 - 259;
            ++v36;
          }
          while (v42 < *((unsigned int *)m_captureDeviceController + 536));
        }
        v41 = 0;
LABEL_32:
        v72 = v41;
        v73 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
        v74 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
      }
      else
      {
        v48 = (char *)m_captureDeviceController + 16;
        v49 = *(_QWORD *)&v48[8 * this->m_streamIdsInfo.jasperStreamId];
        v69[1] = *(_QWORD *)&v48[8 * this->m_streamIdsInfo.rgbSuperWideStreamId];
        v70 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v69[0] = v49;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
        v71 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
      }
      v50 = (void *)v44;

      v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if ((_DWORD)v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
        v54 = this->m_streamIdsInfo.jasperStreamId;
        v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v51, v54, v56));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v53, 542, v57);

      }
      v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if ((_DWORD)v5)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lastPathComponent"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v59, 549, v60);

        return v5;
      }

    }
  }
  v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->m_streamIdsInfo.jasperStreamId, 1);
  if ((_DWORD)v5)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastPathComponent"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v62, 560, v63);

  }
  else
  {
    v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if ((_DWORD)v5)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 568, v66);

    }
    else
    {
      this->m_currentJasperConfiguration = *a2;
    }
  }
  return v5;
}

void sub_100005A80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int rgbSuperWideStreamId;

  rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  if (rgbSuperWideStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    rgbSuperWideStreamId = this->m_streamIdsInfo.rgbSuperWideStreamId;
  }
  return rgbSuperWideStreamId != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 926, v4);

  }
  return v1;
}

void sub_100005D88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DeviceCMInterface *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *ErrorInformationString;
  void *v26;
  __CFDictionary *v30;
  uint64_t v31;
  _UNKNOWN **v32;

  if (this->m_captureDeviceController)
  {
    if (a2)
    {
      v31 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      v32 = &off_1000346A8;
      v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("request control on high priority")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 592, v7);

      v30 = (__CFDictionary *)v4;
    }
    else
    {
      v30 = 0;
    }
    v12 = 1;
    while (1)
    {
      v13 = HxISPCaptureDeviceController::RequestStreams(this->m_captureDeviceController, *((const __CFArray **)this->m_captureDeviceController + 1), v30);
      v14 = (DeviceCMInterface *)v13;
      if ((_DWORD)v13 != -12681)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol - controlled by another client. %d/%d"), v12, 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 600, v17);

      usleep(0x7A120u);
      v12 = (v12 + 1);
      if ((_DWORD)v12 == 11)
        goto LABEL_17;
    }
    if ((_DWORD)v13 != -12782 && (_DWORD)v13 != 0)
    {
LABEL_17:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@"), v14, v24));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 614, v26);

      v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waiting for preempted client to terminate for %.2f sec..."), (double)a3 / 1000000.0));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 621, v21);

      usleep(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("done waiting")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 623, v24);
      v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    v11 = 0;
LABEL_20:

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 584, v10);
    v11 = 3758097084;

  }
  return v11;
}

void sub_1000061EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *ErrorInformationString;
  void *v6;
  void *v7;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 635, v6);
    v2 = 3758097084;
    goto LABEL_5;
  }
  v2 = HxISPCaptureDeviceController::RelinquishStreams(m_captureDeviceController, *((const __CFArray **)m_captureDeviceController + 1));
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail during releaseControlOfStreams, OSStatus error 0x%x (%@)"), v2, v6));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 642, v7);

LABEL_5:
  }
  return v2;
}

void sub_10000642C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  StreamIdsInfo *p_m_streamIdsInfo;
  CFStringRef theString1;

  v2 = 0;
  *(_QWORD *)&this->m_streamIdsInfo.rgbTeleStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbPearlStreamId = -1;
  *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId = -1;
  p_m_streamIdsInfo = &this->m_streamIdsInfo;
  v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, v2, v3, &theString1))v11 = 1;
    else
      v11 = theString1 == 0;
    if (!v11)
    {
      if (CFStringCompare(theString1, v4, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.irPearlStreamId = v2;
      if (CFStringCompare(theString1, v5, 0) == kCFCompareEqualTo
        || CFStringCompare(theString1, v6, 0) == kCFCompareEqualTo)
      {
        this->m_streamIdsInfo.rgbPearlStreamId = v2;
      }
      if (CFStringCompare(theString1, v7, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.rgbSuperWideStreamId = v2;
      if (CFStringCompare(theString1, v8, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.rgbWideStreamId = v2;
      if (CFStringCompare(theString1, v9, 0) == kCFCompareEqualTo)
        p_m_streamIdsInfo->rgbTeleStreamId = v2;
      if (CFStringCompare(theString1, v10, 0) == kCFCompareEqualTo)
        this->m_streamIdsInfo.jasperStreamId = v2;
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->m_captureDeviceController || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IR Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 703, v15);
    v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RGB Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 709, v15);
    v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_100006708(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->m_captureDeviceController != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.irPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 802, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->m_streamIdsInfo.rgbPearlStreamId != (_DWORD)a2 && this->m_streamIdsInfo.irPearlStreamId != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d for rgb or %d for ir)"), a2, this->m_streamIdsInfo.rgbPearlStreamId, this->m_streamIdsInfo.irPearlStreamId));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 808, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 819, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_10000696C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int irPearlStreamId;

  irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if (irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  }
  return irPearlStreamId != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int rgbPearlStreamId;

  rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  if (rgbPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
  }
  return rgbPearlStreamId != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int jasperStreamId;

  jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  if (jasperStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
  }
  return jasperStreamId != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  NSDictionary *v7;
  HxISPCaptureDeviceController *m_captureDeviceController;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a4;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController)
  {
    v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, a2, a3, (const __CFBoolean *)v7);
    if (!(_DWORD)v9)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)"), a3, a2, v9, v13));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 839, v14);

    v15 = 3758097129;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 831, v13);
    v15 = 3758097084;
  }

LABEL_7:
  return v15;
}

void sub_100006BEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  const void *v2;
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFDictionary *Mutable;
  const __CFBoolean *v10;
  DeviceCMInterface *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v17 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v15 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  v16 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v18 = v3;
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  v5 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!(_DWORD)v5)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if ((_DWORD)v11)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableIROutput failed with OSStatus 0x%x (%@)"), v11, v8));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 870, v13);

        v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    v5 = 0;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output failed")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_100006E9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->m_streamIdsInfo.rgbPearlStreamId);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 914, v4);

  }
  return v1;
}

void sub_100006FC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;

  switch(a2)
  {
    case 0:
      v24 = CFSTR("EnableIRProjector");
      v25 = &__kCFBooleanFalse;
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("None")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = CFSTR("EnableIRProjector");
      v22[1] = CFSTR("ProjectorType");
      v23[0] = &__kCFBooleanTrue;
      v23[1] = CFSTR("Flood");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Flood")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = CFSTR("EnableIRProjector");
      v20[1] = CFSTR("ProjectorType");
      v21[0] = &__kCFBooleanTrue;
      v21[1] = CFSTR("SparseLowPower");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseLowPower")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = CFSTR("EnableIRProjector");
      v18[1] = CFSTR("ProjectorType");
      v19[0] = &__kCFBooleanTrue;
      v19[1] = CFSTR("Sparse");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Sparse")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = CFSTR("EnableIRProjector");
      v14[1] = CFSTR("ProjectorType");
      v15[0] = &__kCFBooleanTrue;
      v15[1] = CFSTR("Dense");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Dense")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = CFSTR("EnableIRProjector");
      v16[1] = CFSTR("ProjectorType");
      v17[0] = &__kCFBooleanTrue;
      v17[1] = CFSTR("DenseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("DenseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = CFSTR("EnableIRProjector");
      v12[1] = CFSTR("ProjectorType");
      v13[0] = &__kCFBooleanTrue;
      v13[1] = CFSTR("SparseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1023, v6);
LABEL_10:

      break;
    default:
      v3 = 0;
      break;
  }
  v7 = DeviceCMInterface::setStreamProperty(this, this->m_streamIdsInfo.irPearlStreamId, CFSTR("IRProjectorParams"), v3);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setProjectorMode failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1031, v10);

  }
  return v7;
}

void sub_10000761C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  __CFDictionary *Mutable;
  CFNumberRef v9;
  CFNumberRef v10;
  const void **v11;
  __CFArray *v12;
  __CFArray *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t valuePtr;

  v24 = a3;
  valuePtr = a2;
  if (!*(_QWORD *)(a1 + 16))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v21, 1042, v22, v24, valuePtr);
    v14 = 3758097084;

    return v14;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v24);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4)
    v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v13 = v12;
  if ((a5 & 1) != 0)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0)
LABEL_9:
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if ((_DWORD)v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed with OSStatus 0x%x (%@)"), v14, v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1092, v19, v24, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_100007A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t started;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  DeviceCMInterface *v17;
  const __CFString *ErrorInformationString;
  uint64_t v19;
  DeviceCMInterface *v20;
  const __CFString *v21;

  if (!this->m_captureDeviceController)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1289, v14);
    started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1295, v6);

  }
  if (!this->m_currentJasperConfiguration.bitMaskID)
  {
    v16 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_1000346D8);
    if ((_DWORD)v16)
    {
      v17 = (DeviceCMInterface *)v16;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v17, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1301, v15);
      goto LABEL_12;
    }
    v19 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_1000346D8);
    if ((_DWORD)v19)
    {
      v20 = (DeviceCMInterface *)v19;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v21 = DeviceCMInterface::getErrorInformationString(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v20, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1307, v15);
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1312, v9);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100008B80, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startRgbStream failed with OSStatus 0x%x (%@)"), started, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1321, v15);
LABEL_12:

    started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_100007E3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  const __CFString *v16;
  DeviceCMInterface *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFNumber *v23;
  uint64_t v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  DeviceCMInterface *v31;
  const __CFString *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  DeviceCMInterface *started;
  const __CFString *v38;
  void *v39;
  id v40;
  unsigned int valuePtr;
  const __CFBoolean *v42;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1114, v13);

    return 3758097084;
  }
  v42 = 0;
  valuePtr = 0x7FFFFFFF;
  v40 = 0;
  v3 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureProperty_SupportedPropertiesDictionary, &v40);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1127, v9);
    goto LABEL_4;
  }
  v15 = v40;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));

  v40 = 0;
  v16 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if (objc_msgSend(v5, "containsObject:", kFigCaptureStreamProperty_MaximumAllowedFrameRate))
  {
    v17 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, v16, &v42);
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = DeviceCMInterface::getErrorInformationString(v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed resolving maximum frame rate information OSStatus 0x%x (%@)"), v17, v21));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1148, v22);
      v10 = 3758097129;

      if (v42)
        CFRelease(v42);
      goto LABEL_5;
    }
    v23 = v42;
    if (!v42)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("null maximum frame rate detected")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1156, v9);
      v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    v23 = (const __CFNumber *)&off_1000346C0;
    v42 = (const __CFBoolean *)&off_1000346C0;
  }
  CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr);
  v24 = valuePtr;
  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MinimumFrameRate, v42);
  v4 = 3758097129;
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v28 = DeviceCMInterface::getErrorInformationString(v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps of %d failed with OSStatus 0x%x (%@)"), v24, v25, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1168, v30);
  }
  else
  {
    v31 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_MaximumFrameRate, v42);
    if (!(_DWORD)v31)
    {
      v10 = 0;
      v33 = 1;
      goto LABEL_18;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v32 = DeviceCMInterface::getErrorInformationString(v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps of %d failed with OSStatus 0x%x (%@)"), v24, v31, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1176, v30);
  }

  v33 = 0;
  v10 = 3758097129;
LABEL_18:
  CFRelease(v42);
  if (!v33)
    goto LABEL_5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastPathComponent"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->m_streamIdsInfo.jasperStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v35, 1187, v36);

  started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100008558,
                                   this);
  if (!(_DWORD)started)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v38 = DeviceCMInterface::getErrorInformationString(started);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startJasperStream failed with OSStatus 0x%x (%@)"), started, v9));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1201, v39);

LABEL_4:
  v10 = v4;
LABEL_5:

  return v10;
}

void sub_10000848C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_100008558(uint64_t result, __int128 *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  __int128 v8;
  uint64_t v9;

  if (a4)
  {
    v4 = result;
    result = *(_QWORD *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 32) == a3)
          v7 = 2;
        else
          v7 = v6;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v7;
      }
      v8 = *a2;
      v9 = *((_QWORD *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_captureDeviceController = this->m_captureDeviceController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1212, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->m_streamIdsInfo.jasperStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1216, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopJasperStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1220, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_10000878C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v3;
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t started;
  DeviceCMInterface *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1232, v8);
    started = 3758097084;
LABEL_10:

    return started;
  }
  v3 = HxISPCaptureDeviceController::SetStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_1000346D8);
  if ((_DWORD)v3)
  {
    v4 = (DeviceCMInterface *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1239, v9);
LABEL_9:

    started = 3758097129;
    goto LABEL_10;
  }
  v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_1000346D8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v5 = v12;
  if ((_DWORD)v11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v11, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1245, v9);
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->m_streamIdsInfo.irPearlStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 1250, v15);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100008B80, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v16 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startIrStream failed with OSStatus 0x%x (%@)"), started, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1259, v9);
    goto LABEL_9;
  }
  return started;
}

void sub_100008B08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_100008B80(uint64_t (***result)(_QWORD, _QWORD, __int128 *, uint64_t), __int128 *a2, int a3, uint64_t a4))(_QWORD, _QWORD, __int128 *, uint64_t)
{
  uint64_t (***v4)(_QWORD, _QWORD, _OWORD *, uint64_t);
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  uint64_t v8;

  if (a4)
  {
    v4 = result;
    result = *(uint64_t (****)(_QWORD, _QWORD, __int128 *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3)
          v6 = 5;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        if (*(_DWORD *)(a4 + 32) == a3)
          v6 = 2;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v6;
      }
      v7 = *a2;
      v8 = *((_QWORD *)a2 + 2);
      return (uint64_t (***)(_QWORD, _QWORD, __int128 *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_captureDeviceController = this->m_captureDeviceController;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!m_captureDeviceController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1270, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->m_streamIdsInfo.irPearlStreamId));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1274, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopIrStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1278, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_100008DC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;

  m_captureDeviceController = this->m_captureDeviceController;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v6 = v5;
  if (!m_captureDeviceController)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1337, v12);
    v9 = 3758097084;
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1341, v8);

  v9 = HxISPCaptureDeviceController::stopReceive(this->m_captureDeviceController, a2);
  if ((_DWORD)v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopRgbStream failed with OSStatus 0x%x (%@)"), v9, v12));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1345, v13);

LABEL_5:
  }
  return v9;
}

void sub_100008FCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbPearlStreamId);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbSuperWideStreamId);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->m_streamIdsInfo.rgbWideStreamId);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  DeviceCMInterface *v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ValidateComplianceWithDetails"), &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    result = 0;
    *a2 = valuePtr;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v4, irPearlStreamId, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1385, v11);

    return 3758097084;
  }
  return result;
}

void sub_100009168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  uint64_t v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  m_captureDeviceController = this->m_captureDeviceController;
  if (m_captureDeviceController
    && *((_BYTE *)m_captureDeviceController + 2148)
    && (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) == 0))
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ValidateComplianceWithDetails"), &number);
    if ((_DWORD)v6)
    {
      v7 = (DeviceCMInterface *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v7, irPearlStreamId, v12));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1407, v13);
      v14 = 3758097084;

    }
    else
    {
      v14 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed as bit mask was NULL")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1419, v17);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("device is not activated")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1400, v17);
  }
  v14 = 3758097084;

  return v14;
}

void sub_1000093BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1435, v4);

  }
  return v1;
}

void sub_1000094B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;
  const void *Group;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  DeviceCMInterface *v11;
  __CFArray *Mutable;
  __CFArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v22;
  void *v23;
  uint64_t v25;
  __CFArray *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting multicam...")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId);
  v6 = HxISPCaptureDeviceController::FindGroup(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId);
  if (Group && (v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set multi cam if both rgb/ir groups not the same")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    v13 = Mutable;
    if (Mutable)
      CFArrayAppendValue(Mutable, Group);
    v25 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    v26 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->m_captureDeviceController, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d"), v11));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1469, v17);

    if (v13)
      CFRelease(v13);
    if ((_DWORD)v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v11, irPearlStreamId, v22));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1476, v23);

    }
  }
  return v11;
}

void sub_100009804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  unsigned int irPearlStreamId;
  __CFArray *Mutable;
  __CFArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t rgbPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  if (!this->m_captureDeviceController
    || this->m_streamIdsInfo.rgbPearlStreamId < 0
    || this->m_streamIdsInfo.irPearlStreamId < 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot enableSyncForEnumeratedStreams one or more stream ids is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1486, v11);
    v6 = 3758097084;
    goto LABEL_13;
  }
  irPearlStreamId = a2;
  this->m_primarySyncModeStreamID = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.rgbPearlStreamId + 2));
    CFArrayAppendValue(v5, *((const void **)this->m_captureDeviceController + this->m_streamIdsInfo.irPearlStreamId + 2));
  }
  if (!irPearlStreamId)
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  v6 = HxISPCaptureDeviceController::SetGroupProperty(this->m_captureDeviceController, irPearlStreamId, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5)
    CFRelease(v5);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v6, rgbPearlStreamId, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1538, v12);

    v6 = 3758097129;
LABEL_13:

  }
  return v6;
}

void sub_100009A88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  __CFDictionary *Mutable;
  CFNumberRef v7;
  DeviceCMInterface *v8;
  void *v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  int valuePtr;

  valuePtr = a3;
  if (this->m_captureDeviceController)
  {
    if ((a2 & 0x80000000) == 0
      || this->m_streamIdsInfo.irPearlStreamId == (_DWORD)a2
      || this->m_streamIdsInfo.rgbPearlStreamId == (_DWORD)a2)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if ((_DWORD)v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)"), v8, a2, v12));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1598, v13);

      }
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set stream %d as master for sync, stream is invalid"), a2));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1556, v20);

      return 3758096385;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v15, 1549, v16);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_100009D78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.irPearlStreamId, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->m_streamIdsInfo.rgbPearlStreamId, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int irPearlStreamId)
{
  int m_primarySyncModeStreamID;
  HxISPCaptureDeviceController *m_captureDeviceController;
  const __CFString *v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  m_primarySyncModeStreamID = this->m_primarySyncModeStreamID;
  if (m_primarySyncModeStreamID == -1)
  {
    m_captureDeviceController = this->m_captureDeviceController;
    if (!irPearlStreamId)
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    m_captureDeviceController = this->m_captureDeviceController;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    irPearlStreamId = m_primarySyncModeStreamID;
  }
  v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(m_captureDeviceController, irPearlStreamId, v5, 0);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disableSyncMode failed with OSStatus 0x%x for stream id (%@)"), v6, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1636, v11);

  }
  return v6;
}

void sub_100009EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  return HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  uint64_t rgbPearlStreamId;
  _BOOL4 isRgbOn;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL isIrOn;
  uint64_t irPearlStreamId;
  uint64_t v21;
  uint64_t PearlProjectorHWVersion;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;

  *(_WORD *)&this->m_isPearlRgbConfigured = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  if (a2->isRgbOn)
  {
    rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    if ((_DWORD)rgbPearlStreamId == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
      if ((_DWORD)rgbPearlStreamId == -1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1731, v10);
LABEL_32:
        v11 = 3758097136;
        goto LABEL_40;
      }
      isRgbOn = a2->isRgbOn;
    }
    else
    {
      isRgbOn = 1;
    }
    if (a2->isIrOn && isRgbOn)
    {
      v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, rgbPearlStreamId);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v13, 1740, v14);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1744, v10);
        goto LABEL_40;
      }
      v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 1750, v18);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1754, v10);
        goto LABEL_40;
      }
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.rgbPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d"), this->m_streamIdsInfo.rgbPearlStreamId));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1760, v28);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1764, v10);
        goto LABEL_40;
      }
      rgbPearlStreamId = this->m_streamIdsInfo.rgbPearlStreamId;
    }
    v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, rgbPearlStreamId, 1);
    if ((_DWORD)v7)
    {
      v11 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1773, v10);
LABEL_40:

      return v11;
    }
    v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if ((_DWORD)v15)
    {
      v11 = v15;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1781, v10);
      goto LABEL_40;
    }
    this->m_isPearlRgbConfigured = 1;
  }
  isIrOn = a2->isIrOn;
  if (!a2->isIrOn)
    goto LABEL_49;
  irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
  if ((_DWORD)irPearlStreamId == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
    if ((_DWORD)irPearlStreamId == -1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available IR stream index")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1792, v10);
      goto LABEL_32;
    }
  }
  v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, irPearlStreamId, 1);
  if ((_DWORD)v21)
  {
    v11 = v21;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->m_hVersion < 11)
    goto LABEL_35;
  v43 = 0;
  PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!(_DWORD)PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("projector version %d"), 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 1816, v31);

      v32 = 1;
LABEL_36:
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d"), this->m_streamIdsInfo.rgbPearlStreamId, v32, v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v34, 1826, v35);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setPearlFormatIndex failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1830, v10);
        goto LABEL_40;
      }
      v36 = DeviceCMInterface::enablePearlIROutput(this);
      if ((_DWORD)v36)
      {
        v11 = v36;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1838, v10);
        goto LABEL_40;
      }
      v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->irType);
      if ((_DWORD)v38)
      {
        v11 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set projector mode to %u failed"), a2->irType));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v40, 1846, v41);

        return v11;
      }
      if (a2->isDepthOn)
      {
        v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if ((_DWORD)v42)
        {
          v11 = v42;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableDefaultDepthStream failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->m_isPearlIrConfigured = 1;
      isIrOn = a2->isIrOn;
LABEL_49:
      v11 = 0;
      this->m_currentPearlConfiguration.irType = a2->irType;
      this->m_currentPearlConfiguration.isIrOn = isIrOn;
      *(_WORD *)&this->m_currentPearlConfiguration.isDepthOn = *(_WORD *)&a2->isDepthOn;
      return v11;
    }
LABEL_35:
    v32 = 0;
    goto LABEL_36;
  }
  v11 = PearlProjectorHWVersion;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("config pearl device failed to read projector version")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 1821, v25);

  return v11;
}

void sub_10000A8D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlProjectorVersion failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2385, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("ProjectorHWVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2397, v13);

    }
  }
  return v6;
}

void sub_10000AB68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->m_currentPearlConfiguration.irType = a2->irType;
  this->m_currentPearlConfiguration.isRgbOn = a2->isRgbOn;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = *(_WORD *)&a2->isIrOn;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  JasperConfiguration *p_m_currentJasperConfiguration;
  JasperConfiguration v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  p_m_currentJasperConfiguration = &this->m_currentJasperConfiguration;
  if (a2)
    p_m_currentJasperConfiguration = a2;
  v3 = *p_m_currentJasperConfiguration;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v4, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (v3.isJasperOn)
    objc_msgSend(v4, "appendString:", CFSTR("_JASPER_DEPTH"));
  if ((*(_QWORD *)&v3 & 0xFF0000) != 0)
    objc_msgSend(v4, "appendString:", CFSTR("_WIDE"));
  if ((*(_WORD *)&v3.isJasperOn & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.isJasperOn & 0xFF000000) != 0)
      v5 = CFSTR("_SUPER_WIDE_SYNCED");
    else
      v5 = CFSTR("_SUPER_WIDE_UNSYNCED");
    objc_msgSend(v4, "appendString:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));

  return v6;
}

void sub_10000AC94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  PearlConfiguration *p_m_currentPearlConfiguration;
  BOOL *p_isDepthOn;
  BOOL *p_isRgbOn;
  int *p_irType;
  NSString **p_deviceName;
  _BOOL4 isIrOn;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  NSString *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  p_m_currentPearlConfiguration = &this->m_currentPearlConfiguration;
  p_isDepthOn = &this->m_currentPearlConfiguration.isDepthOn;
  p_isRgbOn = &this->m_currentPearlConfiguration.isRgbOn;
  p_irType = &this->m_currentPearlConfiguration.irType;
  p_deviceName = &this->m_currentPearlConfiguration.deviceName;
  if (a2)
  {
    p_deviceName = &a2->deviceName;
    p_irType = &a2->irType;
    p_isRgbOn = &a2->isRgbOn;
    p_isDepthOn = &a2->isDepthOn;
    p_m_currentPearlConfiguration = a2;
  }
  isIrOn = p_m_currentPearlConfiguration->isIrOn;
  v8 = *p_isDepthOn;
  v9 = *p_isRgbOn;
  v10 = *p_irType;
  v11 = *p_deviceName;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v12, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (isIrOn)
    objc_msgSend(v12, "appendString:", CFSTR("_IR"));
  if (v8)
    v13 = CFSTR("_DEPTH");
  else
    v13 = CFSTR("_NO_PCE");
  objc_msgSend(v12, "appendString:", v13);
  if (v9)
    objc_msgSend(v12, "appendString:", CFSTR("_RGB"));
  v14 = CFSTR("_DENSE");
  switch(v10)
  {
    case 0:
      v14 = CFSTR("_IR_MODE_NONE");
      goto LABEL_17;
    case 1:
      v14 = CFSTR("_FLOOD");
      goto LABEL_17;
    case 2:
      v14 = CFSTR("_SPARSE_LOW_POWER");
      goto LABEL_17;
    case 3:
      v14 = CFSTR("_SPARSE");
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      objc_msgSend(v12, "appendString:", CFSTR("_DENSE_PROB_AB"));
      goto LABEL_16;
    case 6:
LABEL_16:
      v14 = CFSTR("_SPARSE_PROB_AB");
LABEL_17:
      objc_msgSend(v12, "appendString:", v14);
      break;
    default:
      break;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v12));

  return v15;
}

void sub_10000AE24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeRef cf;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2004, v7);
LABEL_6:
    v4 = 3758097084;

    return v4;
  }
  cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("PCECalib"), &cf) == 0;
  if (!cf)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_10000AF8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperRikerProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  uint64_t v4;
  DeviceCMInterface *v5;
  void *v6;
  void *v7;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ProjectorRikerFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (DeviceCMInterface *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v5, jasperStreamId, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 2039, v11);
    v12 = 3758097084;

  }
  else
  {
    v12 = 0;
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRikerFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2051, v15);
    v12 = 3758097084;

  }
  return v12;
}

void sub_10000B168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("ProjectorWillFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)"), v4, jasperStreamId, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2067, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2079, v13);

  }
  return v4;
}

void sub_10000B340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerResistance(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RikerResistance"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)"), v4, jasperStreamId, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2094, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RikerResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2106, v13);

  }
  return v4;
}

void sub_10000B518(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2119, v15);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ProjectorRosalineFaultStatus"), &number);
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, irPearlStreamId, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2126, v12);

    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v18, 2138, v19);

    }
  }
  return v6;
}

void sub_10000B770(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t irPearlStreamId;
  const __CFString *ErrorInformationString;
  void *v15;
  void *v16;
  unint64_t valuePtr;
  CFNumberRef number;

  valuePtr = 0;
  number = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController || (v5 = this->m_streamIdsInfo.irPearlStreamId, (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2150, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, v5, CFSTR("ProjectorFaultStatus"), &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, irPearlStreamId, v15));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2163, v16);

    }
  }
  return v6;
}

void sub_10000B960(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;

  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("releaseControlOfStreams failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 2174, v4);

  }
  return DeviceCMInterface::releaseInterface(this);
}

void sub_10000BA58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  __n128 result;

  if (a2)
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  result = *(__n128 *)&this->m_streamIdsInfo.rgbTeleStreamId;
  *a3 = result;
  a3[1].n128_u64[0] = *(_QWORD *)&this->m_streamIdsInfo.rgbSuperWideStreamId;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  DeviceCMInterface *v12;
  void *v13;
  void *v14;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v17;
  void *v18;
  const __CFNumber *Value;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  CFTypeID TypeID;
  CFDictionaryRef theDict;

  theDict = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjReport"), &theDict);
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)"), v12, jasperStreamId, v17));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2219, v18);

  }
  else
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerReached"));
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerPassed"));
    CFNumberGetValue(v20, kCFNumberIntType, a3);
    v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfSuccess"));
    CFNumberGetValue(v21, kCFNumberIntType, a4);
    v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfFailure"));
    CFNumberGetValue(v22, kCFNumberIntType, a5);
    *a6 = 0;
    v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportFailedToSave"));
    if (v23)
    {
      v24 = v23;
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v24))
        CFNumberGetValue(v24, kCFNumberIntType, a6);
      else
        NSLog(CFSTR("The value for key %@ is not a number"), CFSTR("RgbjReportFailedToSave"));
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_10000BCBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  DeviceCMInterface *v2;
  void *v3;
  void *v4;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;

  v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjForceSaveCalib"), 0);
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)"), v2, jasperStreamId, v7));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 2250, v8);

  }
  return v2;
}

void sub_10000BDD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  void *v6;
  void *v7;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v17[0] = CFSTR("RgbjConfigurationFeatureVectorSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v17[1] = CFSTR("RgbjConfigurationDilutionRate");
  v18[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4));
  v18[1] = v7;
  v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("RgbjConfiguration"), v8);
  if ((_DWORD)v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)"), v9, jasperStreamId, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 2263, v15);

  }
  return v9;
}

void sub_10000BF8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  const __CFBoolean *v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  uint64_t jasperStreamId;
  const __CFString *ErrorInformationString;
  void *v30;
  void *v31;
  _QWORD v33[6];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v33[0] = v13;
  *(float *)&v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  v33[1] = v15;
  *(float *)&v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v33[2] = v17;
  *(float *)&v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  v33[3] = v19;
  *(float *)&v20 = a6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
  v33[4] = v21;
  *(float *)&v22 = a7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  v33[5] = v23;
  v24 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));

  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("OverrideJasperWideExtrinsics"), v24);
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    jasperStreamId = this->m_streamIdsInfo.jasperStreamId;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)"), v25, jasperStreamId, v30));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 2275, v31);

  }
  return v25;
}

void sub_10000C1F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("JasperCalib"), a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.jasperStreamId, CFSTR("JapserCalibData"), a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFDataRef theData;

  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlPCECalib failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2307, v9);

    return 3758097084;
  }
  else
  {
    theData = 0;
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("PCECalib"), &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2323, v13);

    }
  }
  return v6;
}

void sub_10000C434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, _QWORD *a2)
{
  HxISPCaptureDeviceController *v3;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  id v16;

  v16 = 0;
  v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelSerialNumber failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2336, v9);

    return 3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, CFSTR("RigelSerialNumber"), &v16);
    if (v16)
    {
      *a2 = v16;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@"), v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2347, v15);

    }
  }
  return (uint64_t)v6;
}

void sub_10000C5FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *m_captureDeviceController;
  unsigned int irPearlStreamId;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  m_captureDeviceController = this->m_captureDeviceController;
  if (!m_captureDeviceController
    || (irPearlStreamId = this->m_streamIdsInfo.irPearlStreamId, (irPearlStreamId & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelOtpVersion failed, ir stream id invalid, %@"), CFSTR("OK")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2360, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(m_captureDeviceController, irPearlStreamId, CFSTR("ProjectorVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2372, v13);

    }
  }
  return v6;
}

void sub_10000C7A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  DeviceCMInterface *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CFTypeRef cf;

  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("GuadRecordRegisters"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@"), v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2415, v19);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("GuadLastResistance"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2430, v18);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("BaneState"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2444, v18);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("ProjectorRosalineFaultStatus"), &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    cf = 0;
    v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->m_captureDeviceController, this->m_streamIdsInfo.irPearlStreamId, CFSTR("BaneResistance"), &cf);
    if (cf)
    {
      if (!(_DWORD)v12)
        LODWORD(v12) = v13;
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if ((_DWORD)v12)
        return (DeviceCMInterface *)v12;
      else
        return (DeviceCMInterface *)v14;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v25, 2477, v26);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v22, 2460, v23);

    return (DeviceCMInterface *)v13;
  }
}

void sub_10000CBB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getCurrentVersion(void)
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  return v1;
}

void sub_10000CC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void logMainResults(NSDictionary *a1, uint64_t a2, uint64_t a3)
{
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
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  NSDictionary *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v31 = a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Start Diag Logging Results Dictionary for %d -->"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 23, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Return code: %d"), a3));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 24, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](v31, "description"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Result description: %@"), v13));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 25, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Key/Val pairs:")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 26, v17);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](v31, "allKeys"));
  obj = v18;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v33;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v31, "objectForKey:", v22));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("key:%@ val: %@"), v22, v25));
        NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 29, v26);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v18 = obj;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v19);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DiagnosticUtils.mm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "lastPathComponent"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Done Diag Logging Results Dictionary <--")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v28, 31, v29);

}

void sub_10000D084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

__CFString *decToBinStr(unsigned int a1)
{
  unint64_t v1;
  __CFString *v2;
  int v3;
  void *v4;
  __CFString *v5;

  v1 = a1;
  v2 = &stru_100032C70;
  v3 = 32;
  do
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v1 & 1));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", v2));

    v1 >>= 1;
    v2 = v5;
    --v3;
  }
  while (v3);
  return v5;
}

void sub_10000D218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t setBit(uint64_t result, int a2, unsigned int *a3)
{
  unsigned int v3;

  v3 = *a3 | result;
  if (!a2)
    v3 = *a3 & ~(_DWORD)result;
  *a3 = v3;
  return result;
}

void updateJasperValidationStatus(int a1, _QWORD *a2)
{
  if ((a1 & 0x400) != 0)
  {
    sub_10000D370(a2, 40, CFSTR("JASPER_VC_PROJECTOR_NOT_ACTIVE"));
    if ((a1 & 0x1000) == 0)
    {
LABEL_3:
      if ((a1 & 0x8000) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((a1 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  sub_10000D370(a2, 41, CFSTR("JASPER_VC_BRICK"));
  if ((a1 & 0x8000) == 0)
  {
LABEL_4:
    if ((a1 & 0x20000) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  sub_10000D370(a2, 42, CFSTR("JASPER_VC_PROJECTOR_FAULT"));
  if ((a1 & 0x20000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  sub_10000D370(a2, 43, CFSTR("JASPER_VC_SW_SAFETY"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x80000) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  sub_10000D370(a2, 44, CFSTR("JASPER_VC_OVERHEAT"));
  if ((a1 & 0x80000) == 0)
  {
LABEL_7:
    if ((a1 & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  sub_10000D370(a2, 45, CFSTR("JASPER_VC_POWERSUPPLY"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_8:
    if ((a1 & 0x200000) == 0)
      goto LABEL_9;
    goto LABEL_18;
  }
LABEL_17:
  sub_10000D370(a2, 46, CFSTR("JASPER_VC_SENSOR_STATUS"));
  if ((a1 & 0x200000) == 0)
  {
LABEL_9:
    if ((a1 & 0x400000) == 0)
      return;
LABEL_19:
    sub_10000D370(a2, 48, CFSTR("JASPER_VC_PROJECTORON_NOT_ALLOWED"));
    return;
  }
LABEL_18:
  sub_10000D370(a2, 47, CFSTR("JASPER_VC_SENSOR_MONITOR"));
  if ((a1 & 0x400000) != 0)
    goto LABEL_19;
}

void sub_10000D370(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t *v17;
  char *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  _QWORD *v27;
  void *v28;
  id v29;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
  v28 = v6;
  v29 = v5;
  v7 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v8 = a1[3];
  v9 = (uint64_t *)a1[2];
  if ((unint64_t)v9 >= v8)
  {
    v11 = a1[1];
    v12 = ((uint64_t)v9 - v11) >> 3;
    if ((unint64_t)(v12 + 1) >> 61)
      sub_10000D980();
    v13 = v8 - v11;
    v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1))
      v14 = v12 + 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v14;
    v27 = a1 + 3;
    if (v15)
      v16 = (char *)sub_10000DA08((uint64_t)(a1 + 3), v15);
    else
      v16 = 0;
    v17 = (uint64_t *)&v16[8 * v12];
    v18 = &v16[8 * v15];
    v26 = v18;
    *v17 = v7;
    v10 = v17 + 1;
    v25.i64[1] = (uint64_t)(v17 + 1);
    v20 = (_QWORD *)a1[1];
    v19 = (_QWORD *)a1[2];
    if (v19 == v20)
    {
      v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        v21 = *--v19;
        *v19 = 0;
        *--v17 = v21;
      }
      while (v19 != v20);
      v22 = *(int64x2_t *)(a1 + 1);
      v10 = (_QWORD *)v25.i64[1];
      v18 = v26;
    }
    a1[1] = v17;
    a1[2] = v10;
    v25 = v22;
    v23 = (char *)a1[3];
    a1[3] = v18;
    v26 = v23;
    v24 = v22.i64[0];
    sub_10000DA64((uint64_t)&v24);
  }
  else
  {
    *v9 = v7;
    v10 = v9 + 1;
  }
  a1[2] = v10;

}

void sub_10000D504(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void setTestValidationBit(int a1, id *a2)
{
  id v4;

  if (a1)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if ((a1 & 1) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_FRAMERATE"));
    if ((a1 & 2) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_EXPOSURE"));
    if ((a1 & 4) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_AB"));
    if ((a1 & 8) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_C"));
    if ((a1 & 0x10) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_SELECT_AB34"));
    if ((a1 & 0x20) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT0"));
    if ((a1 & 0x40) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT1"));
    if ((a1 & 0x80) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT2"));
    if ((a1 & 0x100) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT3"));
    if ((a1 & 0x200) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_IOUT4"));
    if ((a1 & 0x400) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_NOT_ACTIVE"));
    if ((a1 & 0x800) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("MB_NO_ENABLE"));
    if ((a1 & 0x1000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("MB_BRICK"));
    if ((a1 & 0x2000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("YG"));
    if ((a1 & 0x4000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_CC"));
    if ((a1 & 0x8000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_FAULT"));
    if ((a1 & 0x10000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTOR_STROBECOUNT"));
    if ((a1 & 0x20000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SW_SAFETY"));
    if ((a1 & 0x40000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("OVERHEAT"));
    if ((a1 & 0x80000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("POWERSUPPLY"));
    if ((a1 & 0x100000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_STATUS"));
    if ((a1 & 0x200000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("SENSOR_MONITOR"));
    if ((a1 & 0x400000) != 0)
      objc_msgSend(v4, "setValue:forKey:", CFSTR("FAIL"), CFSTR("PROJECTORON_NOT_ALLOWED"));
    objc_msgSend(*a2, "setValue:forKey:", v4, CFSTR("FW VALIDATION FAIL INFO"));

  }
}

void sub_10000D820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

unint64_t isYGErrorDetected(unint64_t a1)
{
  return (a1 >> 13) & 1;
}

const __CFString *getJasperStatusValueString(int a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = CFSTR("JASPER_PASS_OK");
  if (a1 > 100)
  {
    v3 = CFSTR("JASPER_VC_REAL_POWERSUPPLY");
    if (a1 != 525312)
      v3 = CFSTR("JASPER_PASS_OK");
    if (a1 == 101)
      return CFSTR("JASPER_GENERIC_ERROR");
    else
      return v3;
  }
  else
  {
    switch(a1)
    {
      case 10:
        result = CFSTR("JASPER_MODULE_IS_MISSING");
        break;
      case 11:
        result = CFSTR("JASPER_INTERFACE_ERROR");
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
        return result;
      case 20:
        result = CFSTR("JASPER_FAILED_TO_START_STREAMING");
        break;
      case 21:
        result = CFSTR("JASPER_FAILED_TO_STOP_STREAMING");
        break;
      case 22:
        result = CFSTR("JASPER_FAILED_STREAM_CONTROL");
        break;
      case 30:
        result = CFSTR("JASPER_FPS_ERROR");
        break;
      case 31:
        result = CFSTR("JASPER_POINTS_ERROR");
        break;
      case 40:
        result = CFSTR("JASPER_VC_PROJECTOR_NOT_ACTIVE");
        break;
      case 41:
        result = CFSTR("JASPER_VC_BRICK");
        break;
      case 42:
        result = CFSTR("JASPER_VC_PROJECTOR_FAULT");
        break;
      case 43:
        result = CFSTR("JASPER_VC_SW_SAFETY");
        break;
      case 44:
        result = CFSTR("JASPER_VC_OVERHEAT");
        break;
      case 45:
        result = CFSTR("JASPER_VC_POWERSUPPLY");
        break;
      case 46:
        result = CFSTR("JASPER_VC_SENSOR_STATUS");
        break;
      case 47:
        result = CFSTR("JASPER_VC_SENSOR_MONITOR");
        break;
      case 48:
        result = CFSTR("JASPER_VC_PROJECTORON_NOT_ALLOWED");
        break;
      case 49:
        result = CFSTR("JASPER_VC_ANY_VALIDATION_ERROR");
        break;
      default:
        if (a1 == -2)
          result = CFSTR("JASPER_UNSEALED_STATUS");
        break;
    }
  }
  return result;
}

void sub_10000D980()
{
  sub_10000D994("vector");
}

void sub_10000D994(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000D9E4(exception, a1);
}

void sub_10000D9D0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000D9E4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000DA08(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_10000DA3C();
  return operator new(8 * a2);
}

void sub_10000DA3C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_10000DA64(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_10000DAB4(uint64_t a1)
{
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t sub_10000DB14(uint64_t a1)
{
  sub_10000EAF8(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void PearlDiagnosticInteractor::primaryScalerHxISPFrameAvailableCallback(PearlDiagnosticInteractor *a1, CVPixelBufferRef pixelBuffer, uint64_t a3, int a4)
{
  size_t Width;
  size_t Height;
  BOOL v9;
  int v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFNumber *Value;
  const __CFNumber *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int valuePtr;

  Width = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  if (CVPixelBufferGetDataSize(pixelBuffer))
    v9 = Height * Width == 0;
  else
    v9 = 1;
  v10 = !v9;
  if (pixelBuffer)
  {
    if (a4 == 2)
    {
      a1->m_isPearlRgbFramesArrived = v10;
      if (v10)
        ++a1->m_rgbPearlFramesCount;
    }
    else if (a4 == 1)
    {
      a1->m_isPearlIrFramesArrived = v10;
      if (v10)
        ++a1->m_irPearlFramesCount;
      if (a1->m_currentPearlConfiguration.irType == 3 && a1->m_currentPearlConfiguration.isDepthOn)
      {
        v11 = (const __CFDictionary *)CVBufferCopyAttachment(pixelBuffer, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
        if (v11)
        {
          v12 = v11;
          v16 = -2;
          valuePtr = 0xFFFF;
          Value = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("GMC-Result"));
          v14 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("GMC-NumOfPoints"));
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            CFRelease(Value);
          }
          if (v14)
          {
            CFNumberGetValue(v14, kCFNumberSInt32Type, &v16);
            CFRelease(v14);
            v15 = v16;
          }
          else
          {
            v15 = 4294967294;
          }
          PearlDiagnosticInteractor::updateGmcMetaData(a1, v15, valuePtr);
          CFRelease(v12);
        }
      }
    }
  }
}

PearlDiagnosticInteractor *PearlDiagnosticInteractor::setIsPearlIrframeArrived(PearlDiagnosticInteractor *this, _BOOL4 a2)
{
  this->m_isPearlIrFramesArrived = a2;
  if (a2)
    ++this->m_irPearlFramesCount;
  return this;
}

void PearlDiagnosticInteractor::updateGmcMetaData(PearlDiagnosticInteractor *this, uint64_t a2, uint64_t a3)
{
  NSNumber *v5;
  NSNumber *m_gmcPointCount;
  NSNumber *v7;
  NSNumber *m_gmcResult;

  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
  m_gmcPointCount = this->m_gmcPointCount;
  this->m_gmcPointCount = v5;

  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
  m_gmcResult = this->m_gmcResult;
  this->m_gmcResult = v7;

}

PearlDiagnosticInteractor *PearlDiagnosticInteractor::setIsPearlRgbframeArrived(PearlDiagnosticInteractor *this, _BOOL4 a2)
{
  this->m_isPearlRgbFramesArrived = a2;
  if (a2)
    ++this->m_rgbPearlFramesCount;
  return this;
}

void PearlDiagnosticInteractor::PearlDiagnosticInteractor(PearlDiagnosticInteractor *this)
{
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_irPearlFramesCount = 0;
  this->m_gmcResult = 0;
  this->m_gmcPointCount = 0;
  this->_vptr$StreamingClient = (void **)&off_100030768;
  *(_DWORD *)((char *)&this->m_gmcPointCount + 7) = 0;
  this->m_currentPearlConfiguration.deviceName = 0;
  *(NSString **)((char *)&this->m_currentPearlConfiguration.deviceName + 6) = 0;
  PearlDiagnosticInteractor::resetMembers(this);
}

{
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_irPearlFramesCount = 0;
  this->m_gmcResult = 0;
  this->m_gmcPointCount = 0;
  this->_vptr$StreamingClient = (void **)&off_100030768;
  *(_DWORD *)((char *)&this->m_gmcPointCount + 7) = 0;
  this->m_currentPearlConfiguration.deviceName = 0;
  *(NSString **)((char *)&this->m_currentPearlConfiguration.deviceName + 6) = 0;
  PearlDiagnosticInteractor::resetMembers(this);
}

void PearlDiagnosticInteractor::resetMembers(PearlDiagnosticInteractor *this)
{
  NSNumber *m_gmcResult;
  NSNumber *m_gmcPointCount;

  this->m_irPearlFramesCount = 0;
  *(_WORD *)&this->m_currentPearlConfiguration.isIrOn = 0;
  this->m_currentPearlConfiguration.isRgbOn = 0;
  this->m_currentPearlConfiguration.irType = 0;
  this->m_currentPearlConfiguration.bitMaskID = 0;
  this->m_rgbPearlFramesCount = 0;
  *(_WORD *)&this->m_isPearlRgbFramesArrived = 0;
  m_gmcResult = this->m_gmcResult;
  this->m_gmcResult = 0;

  m_gmcPointCount = this->m_gmcPointCount;
  this->m_gmcPointCount = 0;

}

uint64_t PearlDiagnosticInteractor::isGmcOk(PearlDiagnosticInteractor *this)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!this->m_currentPearlConfiguration.isDepthOn || this->m_currentPearlConfiguration.irType != 3)
    return 1;
  result = (uint64_t)this->m_gmcPointCount;
  if (result)
  {
    if ((int)objc_msgSend((id)result, "intValue") >= 700)
    {
      v6 = 0;
      while (-[NSNumber intValue](this->m_gmcResult, "intValue") != word_1000287B8[v6])
      {
        if (++v6 == 8)
          return 1;
      }
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/PearlDiagnosticInteractor.mm"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gmc result code %d detected"), -[NSNumber intValue](this->m_gmcResult, "intValue")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 208, v5);
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/PearlDiagnosticInteractor.mm"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("gmc point count  %d < %d detected"), -[NSNumber intValue](this->m_gmcPointCount, "intValue"), 700));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 198, v5);
    }

    return 0;
  }
  return result;
}

void sub_10000DF8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id PearlDiagnosticInteractor::getGmcMetaData(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  id result;

  *a2 = objc_retainAutorelease(*(id *)(a1 + 16));
  result = objc_retainAutorelease(*(id *)(a1 + 8));
  *a3 = result;
  return result;
}

void PearlDiagnosticInteractor::getGmcResultInformation(PearlDiagnosticInteractor *a1, int a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  int isGmcOk;
  uint64_t v10;
  int v11;
  uint64_t *v12;
  int v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t **v16;
  void **v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *__dst[2];
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *__p;
  char v32;
  int v33;
  int *v34;

  v33 = a2;
  isGmcOk = PearlDiagnosticInteractor::isGmcOk(a1);
  v10 = qword_100038D00;
  if (!qword_100038D00)
    goto LABEL_11;
  v11 = isGmcOk;
  v12 = &qword_100038D00;
  do
  {
    v13 = *(_DWORD *)(v10 + 32);
    v14 = v13 < a2;
    if (v13 >= a2)
      v15 = (uint64_t *)v10;
    else
      v15 = (uint64_t *)(v10 + 8);
    if (!v14)
      v12 = (uint64_t *)v10;
    v10 = *v15;
  }
  while (*v15);
  if (v12 != &qword_100038D00 && *((_DWORD *)v12 + 8) <= a2)
  {
    v34 = &v33;
    v16 = sub_10000EB40(&qword_100038CF8, &v33, (uint64_t)&unk_1000287F6, &v34);
    sub_10000E2BC((char *)__dst, (__int128 *)(v16 + 5));
    if (v26 >= 0)
      v17 = __dst;
    else
      v17 = (void **)__dst[0];
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v17));
    v18 = &v27;
    if (v28 < 0)
      v18 = v27;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v18));
    v19 = &v29;
    if (v30 < 0)
      v19 = v29;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v19));
    v21 = v20;
    if (v33)
      v22 = v11;
    else
      v22 = 0;
    if (v22 == 1)
    {
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingFormat:", CFSTR("%@"), CFSTR(" (NOT A FAILURE)")));

      v21 = (void *)v23;
    }
    v24 = objc_retainAutorelease(v21);
    *a5 = v24;

    if (v32 < 0)
      operator delete(__p);
    if (v30 < 0)
      operator delete(v29);
    if (v28 < 0)
      operator delete(v27);
    if (v26 < 0)
      operator delete(__dst[0]);
  }
  else
  {
LABEL_11:
    *a3 = CFSTR("N/A");
    *a5 = CFSTR("N/A");
    *a4 = CFSTR("N/A");
  }
}

void sub_10000E214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);

  sub_10000DAB4((uint64_t)va);
  _Unwind_Resume(a1);
}

id *sub_10000E23C(id *a1)
{

  return a1;
}

void sub_10000E274(id *a1)
{

  operator delete();
}

char *sub_10000E2BC(char *__dst, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _BYTE *v7;
  __int128 v8;

  if (*((char *)a2 + 23) < 0)
  {
    sub_10000E3E8(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    sub_10000E3E8(__dst + 24, *((void **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v5 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)__dst + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(__dst + 24) = v5;
  }
  if (*((char *)a2 + 71) < 0)
  {
    sub_10000E3E8(__dst + 48, *((void **)a2 + 6), *((_QWORD *)a2 + 7));
  }
  else
  {
    v6 = a2[3];
    *((_QWORD *)__dst + 8) = *((_QWORD *)a2 + 8);
    *((_OWORD *)__dst + 3) = v6;
  }
  v7 = __dst + 72;
  if (*((char *)a2 + 95) < 0)
  {
    sub_10000E3E8(v7, *((void **)a2 + 9), *((_QWORD *)a2 + 10));
  }
  else
  {
    v8 = *(__int128 *)((char *)a2 + 72);
    *((_QWORD *)__dst + 11) = *((_QWORD *)a2 + 11);
    *(_OWORD *)v7 = v8;
  }
  return __dst;
}

void sub_10000E39C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 71) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void *sub_10000E3E8(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_10000E474();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_10000E474()
{
  sub_10000D994("basic_string");
}

_QWORD *sub_10000E488(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000E474();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

uint64_t sub_10000E538(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v6;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (uint64_t *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = a1 + 8;
  if (a3)
  {
    v6 = 104 * a3;
    do
    {
      sub_10000E5B8((uint64_t **)a1, v4, a2, (uint64_t)a2);
      a2 += 26;
      v6 -= 104;
    }
    while (v6);
  }
  return a1;
}

void sub_10000E5A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_10000EAF8(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_10000E5B8(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;
  uint64_t *v12;

  v6 = sub_10000E64C(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    sub_10000E7F4((uint64_t)a1, a4, (uint64_t)v10);
    sub_10000E864(a1, (uint64_t)v12, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    sub_10000EA50((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t *sub_10000E64C(_QWORD *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t *v5;
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  int v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;

  v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      v9 = (uint64_t *)*a2;
      do
      {
        v10 = v9;
        v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      v13 = a2;
      do
      {
        v10 = (uint64_t *)v13[2];
        v14 = *v10 == (_QWORD)v13;
        v13 = v10;
      }
      while (v14);
    }
    v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5)
      goto LABEL_17;
    v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v17 = (uint64_t *)v16;
          v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18)
            break;
          v16 = *v17;
          v5 = v17;
          if (!*v17)
            goto LABEL_29;
        }
        if (v18 >= v15)
          break;
        v5 = v17 + 1;
        v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  v11 = a2[1];
  if (v11)
  {
    v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      v14 = *a4 == (_QWORD)v19;
      v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          v21 = (uint64_t *)v20;
          v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22)
            break;
          v20 = *v21;
          v5 = v21;
          if (!*v21)
            goto LABEL_48;
        }
        if (v22 >= v6)
          break;
        v5 = v21 + 1;
        v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

char *sub_10000E7F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  void *v6;
  char *result;

  v5 = a1 + 8;
  v6 = operator new(0x88uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *((_DWORD *)v6 + 8) = *(_DWORD *)a2;
  result = sub_10000E2BC((char *)v6 + 40, (__int128 *)(a2 + 8));
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_10000E84C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_10000EA50(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000E864(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_10000E8B8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_10000E8B8(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_10000EA50(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_10000EA94((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void sub_10000EA94(uint64_t a1)
{
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
}

void sub_10000EAF8(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_10000EAF8(a1, *a2);
    sub_10000EAF8(a1, a2[1]);
    sub_10000EA94((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t **sub_10000EB40(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t **v9;
  int v10;
  int v11;
  char *v12;
  _QWORD v14[2];
  char v15;

  v7 = a1 + 1;
  v6 = a1[1];
  v8 = a1 + 1;
  v9 = a1 + 1;
  if (v6)
  {
    v10 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11)
          break;
        v6 = *v9;
        v8 = v9;
        if (!*v9)
          goto LABEL_9;
      }
      if (v11 >= v10)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = (char *)operator new(0x88uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + 8) = **a4;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 88) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    v15 = 1;
    sub_10000E864(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    sub_10000EA50((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void sub_10000EC3C()
{
  void *v0;
  unint64_t v1;
  int *v2;
  int *v3;
  void *v4[2];
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *__p;
  char v11;
  void *v12[2];
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  __int128 v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  __int128 v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  __int128 v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  __int128 v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  __int128 v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  __int128 v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  void *v66;
  char v67;
  __int128 v68;
  char v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  __int128 v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  __int128 v84;
  char v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  char v91;
  __int128 v92;
  char v93;
  void *v94;
  char v95;
  void *v96;
  char v97;
  void *v98;
  char v99;
  __int128 v100;
  char v101;
  void *v102;
  char v103;
  void *v104;
  char v105;
  void *v106;
  char v107;
  __int128 v108;
  char v109;
  void *v110;
  char v111;
  void *v112;
  char v113;
  void *v114;
  char v115;
  __int128 v116;
  char v117;
  void *v118;
  char v119;
  void *v120[2];
  char v121;
  void *v122;
  char v123;
  int v124[2];
  char v125[96];
  int v126;
  char v127[96];
  int v128;
  char v129[96];
  int v130;
  char v131[96];
  int v132;
  char v133[96];
  int v134;
  char v135[96];
  int v136;
  char v137[96];
  int v138;
  char v139[96];
  int v140;
  char v141[96];
  int v142;
  char v143[96];
  int v144;
  char v145[96];
  int v146;
  char v147[96];
  int v148;
  char v149[96];
  int v150;
  char v151[96];
  int v152;
  char v153[96];

  v0 = objc_autoreleasePoolPush();
  sub_10000E488(&v116, "GMC_SUCCESS");
  sub_10000E488(&v118, "End");
  sub_10000E488(v120, "GMC completed successfully");
  sub_10000E488(&v122, "N/A");
  v124[0] = 0;
  sub_10000E2BC(v125, &v116);
  sub_10000E488(&v108, "GMC_FAIL_SPATIAL_COVERAGE");
  sub_10000E488(&v110, "Start");
  sub_10000E488(&v112, "No depth. Points do not cover a sufficient part of the FOV");
  sub_10000E488(&v114, "coverageRateThresh");
  v126 = -1;
  sub_10000E2BC(v127, &v108);
  sub_10000E488(&v100, "GMC_FAIL_NOT_ENOUGH_POINTS");
  sub_10000E488(&v102, "Start");
  sub_10000E488(&v104, "No depth. Not enough points to run GMC");
  sub_10000E488(&v106, "corrNumThresh");
  v128 = -2;
  sub_10000E2BC(v129, &v100);
  sub_10000E488(&v92, "GMC_FAIL_NOT_ENOUGH_INLIERS_PHASE1");
  sub_10000E488(&v94, "After RANSAC");
  sub_10000E488(&v96, "Not enough points following outlier removal by RANSAC");
  sub_10000E488(&v98, "inliersNumThresh");
  v130 = -3;
  sub_10000E2BC(v131, &v92);
  sub_10000E488(&v84, "GMC_FAIL_NOT_ENOUGH_INLIERS_PHASE2");
  sub_10000E488(&v86, "Before BA");
  sub_10000E488(&v88, "Not enough points following outlier removal by 3D constraints");
  sub_10000E488(&v90, "inliersNumThresh");
  v132 = -4;
  sub_10000E2BC(v133, &v84);
  sub_10000E488(&v76, "GMC_FAIL_AMBIGUITY");
  sub_10000E488(&v78, "Before BA");
  sub_10000E488(&v80, "EPD values in test set are larger than in the work set used to compute F");
  sub_10000E488(&v82, "ambiguityThresh, ambiguityInlierMargin");
  v134 = -5;
  sub_10000E2BC(v135, &v76);
  sub_10000E488(&v68, "GMC_FAIL_ROTATION_OUT_OF_TOLERANCES");
  sub_10000E488(&v70, "Before BA");
  sub_10000E488(&v72, "Rotations computed from the essential matrix are out of tolerances");
  sub_10000E488(&v74, "rotationTolerances");
  v136 = -6;
  sub_10000E2BC(v137, &v68);
  sub_10000E488(&v60, "GMC_FAIL_FINAL_ROTATION_OUT_OF_TOLERANCES");
  sub_10000E488(&v62, "End");
  sub_10000E488(&v64, "Rotations estimated by BA are out of tolerances");
  sub_10000E488(&v66, "rotationTolerances");
  v138 = -7;
  sub_10000E2BC(v139, &v60);
  sub_10000E488(&v52, "GMC_FAIL_FINAL_EFL_OUT_OF_TOLERANCES");
  sub_10000E488(&v54, "End");
  sub_10000E488(&v56, "Scale estimated by BA is out of tolerances");
  sub_10000E488(&v58, "scaleTolerance");
  v140 = -8;
  sub_10000E2BC(v141, &v52);
  sub_10000E488(&v44, "GMC_FAIL_BUNDLE_ADJUSTMENT_DIDNT_CONVERGE");
  sub_10000E488(&v46, "End");
  sub_10000E488(&v48, "BA ran to the maximal number of iterations and so did not converge");
  sub_10000E488(&v50, "ba.maxItr");
  v142 = -9;
  sub_10000E2BC(v143, &v44);
  sub_10000E488(&v36, "GMC_FAIL_MEDIAN_REPROJECTION_ERROR_INCREASED");
  sub_10000E488(&v38, "End");
  sub_10000E488(&v40, "No change. PDM on test set is larger than before GMC but still passes threshold");
  sub_10000E488(&v42, "pdmMedianThresh");
  v144 = -10;
  sub_10000E2BC(v145, &v36);
  sub_10000E488(&v28, "GMC_FAIL_INLIERS_SPATIAL_COVERAGE");
  sub_10000E488(&v30, "Before BA");
  sub_10000E488(&v32, "Not enough spatial coverage after outlier removal");
  sub_10000E488(&v34, "coverageRateThresh");
  v146 = -11;
  sub_10000E2BC(v147, &v28);
  sub_10000E488(&v20, "GMC_FAIL_FACE_COVERAGE");
  sub_10000E488(&v22, "Start");
  sub_10000E488(&v24, "Not enough points in the face ROI or not enough coverage inside it");
  sub_10000E488(&v26, "faceCoverageRateThresh, faceCorrNumThresh");
  v148 = -12;
  sub_10000E2BC(v149, &v20);
  sub_10000E488(v12, "GMC_FAIL_RANSAC");
  sub_10000E488(&v14, "RANSAC");
  sub_10000E488(&v16, "Unforeseen error in RANSAC. Should not happen and is cause for investigation");
  sub_10000E488(&v18, "N/A");
  v150 = -13;
  sub_10000E2BC(v151, (__int128 *)v12);
  sub_10000E488(v4, "GMC_FAIL_MEDIAN_REPROJECTION_ERROR_LARGE");
  sub_10000E488(&v6, "End");
  sub_10000E488(&v8, "PDM on test set is larger than threshold");
  sub_10000E488(&__p, "pdmMedianThresh");
  v152 = -14;
  sub_10000E2BC(v153, (__int128 *)v4);
  sub_10000E538((uint64_t)&unk_100038CF8, v124, 15);
  v1 = 1560;
  do
  {
    v2 = &v124[v1 / 4];
    if (SHIBYTE(v124[v1 / 4 - 1]) < 0)
      operator delete(*((void **)v2 - 3));
    if (*((char *)v2 - 25) < 0)
      operator delete(v120[v1 / 8]);
    v3 = &v124[v1 / 4];
    if (*(&v119 + v1) < 0)
      operator delete(*((void **)v3 - 9));
    if (*((char *)v3 - 73) < 0)
      operator delete(*((void **)v2 - 12));
    v1 -= 104;
  }
  while (v1);
  if (v11 < 0)
    operator delete(__p);
  if (v9 < 0)
    operator delete(v8);
  if (v7 < 0)
    operator delete(v6);
  if (v5 < 0)
    operator delete(v4[0]);
  if (v19 < 0)
    operator delete(v18);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12[0]);
  if (v27 < 0)
    operator delete(v26);
  if (v25 < 0)
    operator delete(v24);
  if (v23 < 0)
    operator delete(v22);
  if (v21 < 0)
    operator delete((void *)v20);
  if (v35 < 0)
    operator delete(v34);
  if (v33 < 0)
    operator delete(v32);
  if (v31 < 0)
    operator delete(v30);
  if (v29 < 0)
    operator delete((void *)v28);
  if (v43 < 0)
    operator delete(v42);
  if (v41 < 0)
    operator delete(v40);
  if (v39 < 0)
    operator delete(v38);
  if (v37 < 0)
    operator delete((void *)v36);
  if (v51 < 0)
    operator delete(v50);
  if (v49 < 0)
    operator delete(v48);
  if (v47 < 0)
    operator delete(v46);
  if (v45 < 0)
    operator delete((void *)v44);
  if (v59 < 0)
    operator delete(v58);
  if (v57 < 0)
    operator delete(v56);
  if (v55 < 0)
    operator delete(v54);
  if (v53 < 0)
    operator delete((void *)v52);
  if (v67 < 0)
    operator delete(v66);
  if (v65 < 0)
    operator delete(v64);
  if (v63 < 0)
    operator delete(v62);
  if (v61 < 0)
    operator delete((void *)v60);
  if (v75 < 0)
    operator delete(v74);
  if (v73 < 0)
    operator delete(v72);
  if (v71 < 0)
    operator delete(v70);
  if (v69 < 0)
    operator delete((void *)v68);
  if (v83 < 0)
    operator delete(v82);
  if (v81 < 0)
    operator delete(v80);
  if (v79 < 0)
    operator delete(v78);
  if (v77 < 0)
    operator delete((void *)v76);
  if (v91 < 0)
    operator delete(v90);
  if (v89 < 0)
    operator delete(v88);
  if (v87 < 0)
    operator delete(v86);
  if (v85 < 0)
    operator delete((void *)v84);
  if (v99 < 0)
    operator delete(v98);
  if (v97 < 0)
    operator delete(v96);
  if (v95 < 0)
    operator delete(v94);
  if (v93 < 0)
    operator delete((void *)v92);
  if (v107 < 0)
    operator delete(v106);
  if (v105 < 0)
    operator delete(v104);
  if (v103 < 0)
    operator delete(v102);
  if (v101 < 0)
    operator delete((void *)v100);
  if (v115 < 0)
    operator delete(v114);
  if (v113 < 0)
    operator delete(v112);
  if (v111 < 0)
    operator delete(v110);
  if (v109 < 0)
    operator delete((void *)v108);
  if (v123 < 0)
    operator delete(v122);
  if (v121 < 0)
    operator delete(v120[0]);
  if (v119 < 0)
    operator delete(v118);
  if (v117 < 0)
    operator delete((void *)v116);
  __cxa_atexit((void (*)(void *))sub_10000DB14, &unk_100038CF8, (void *)&_mh_execute_header);
  objc_autoreleasePoolPop(v0);
}

void sub_10000F6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,uint64_t a53,uint64_t a54,int a55,__int16 a56,char a57,char a58,uint64_t a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  char a64;
  char a70;
  char a72;
  char a73;
  char a74;
  char a75;
  char a76;
  char a77;
  char a78;
  char a79;
  char a80;
  char a81;
  uint64_t v81;
  void **v82;

  sub_100025030(v81 + 1560, (uint64_t)&STACK[0x5B0]);
  if (a34 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  if (a22 < 0)
    operator delete(a17);
  if (a16 < 0)
    operator delete(a11);
  if (a58 < 0)
    operator delete(v82[9]);
  if (a52 < 0)
    operator delete(v82[6]);
  if (a46 < 0)
    operator delete(a41);
  if (a40 < 0)
    operator delete(a35);
  if (a73 < 0)
    operator delete(v82[21]);
  if (a72 < 0)
    operator delete(v82[18]);
  if (a70 < 0)
    operator delete(v82[15]);
  if (a64 < 0)
    operator delete(v82[12]);
  if (a77 < 0)
    operator delete(v82[33]);
  if (a76 < 0)
    operator delete(v82[30]);
  if (a75 < 0)
    operator delete(v82[27]);
  if (a74 < 0)
    operator delete(v82[24]);
  if (a81 < 0)
    operator delete(v82[45]);
  if (a80 < 0)
    operator delete(v82[42]);
  if (a79 < 0)
    operator delete(v82[39]);
  if (a78 < 0)
    operator delete(v82[36]);
  if (SLOBYTE(STACK[0x24F]) < 0)
    operator delete(v82[57]);
  if (SLOBYTE(STACK[0x237]) < 0)
    operator delete(v82[54]);
  if (SLOBYTE(STACK[0x21F]) < 0)
    operator delete(v82[51]);
  if (SLOBYTE(STACK[0x207]) < 0)
    operator delete(v82[48]);
  if (SLOBYTE(STACK[0x2AF]) < 0)
    operator delete(v82[69]);
  if (SLOBYTE(STACK[0x297]) < 0)
    operator delete(v82[66]);
  if (SLOBYTE(STACK[0x27F]) < 0)
    operator delete(v82[63]);
  if (SLOBYTE(STACK[0x267]) < 0)
    operator delete(v82[60]);
  if (SLOBYTE(STACK[0x30F]) < 0)
    operator delete(v82[81]);
  if (SLOBYTE(STACK[0x2F7]) < 0)
    operator delete(v82[78]);
  if (SLOBYTE(STACK[0x2DF]) < 0)
    operator delete(v82[75]);
  if (SLOBYTE(STACK[0x2C7]) < 0)
    operator delete(v82[72]);
  if (SLOBYTE(STACK[0x36F]) < 0)
    operator delete(v82[93]);
  if (SLOBYTE(STACK[0x357]) < 0)
    operator delete(v82[90]);
  if (SLOBYTE(STACK[0x33F]) < 0)
    operator delete(v82[87]);
  if (SLOBYTE(STACK[0x327]) < 0)
    operator delete(v82[84]);
  if (SLOBYTE(STACK[0x3CF]) < 0)
    operator delete(v82[105]);
  if (SLOBYTE(STACK[0x3B7]) < 0)
    operator delete(v82[102]);
  if (SLOBYTE(STACK[0x39F]) < 0)
    operator delete(v82[99]);
  if (SLOBYTE(STACK[0x387]) < 0)
    operator delete(v82[96]);
  if (SLOBYTE(STACK[0x42F]) < 0)
    operator delete(v82[117]);
  if (SLOBYTE(STACK[0x417]) < 0)
    operator delete(v82[114]);
  if (SLOBYTE(STACK[0x3FF]) < 0)
    operator delete(v82[111]);
  if (SLOBYTE(STACK[0x3E7]) < 0)
    operator delete(v82[108]);
  if (SLOBYTE(STACK[0x48F]) < 0)
    operator delete(v82[129]);
  if (SLOBYTE(STACK[0x477]) < 0)
    operator delete(v82[126]);
  if (SLOBYTE(STACK[0x45F]) < 0)
    operator delete(v82[123]);
  if (SLOBYTE(STACK[0x447]) < 0)
    operator delete(v82[120]);
  if (SLOBYTE(STACK[0x4EF]) < 0)
    operator delete(v82[141]);
  if (SLOBYTE(STACK[0x4D7]) < 0)
    operator delete(v82[138]);
  if (SLOBYTE(STACK[0x4BF]) < 0)
    operator delete(v82[135]);
  if (SLOBYTE(STACK[0x4A7]) < 0)
    operator delete(v82[132]);
  if (SLOBYTE(STACK[0x54F]) < 0)
    operator delete(v82[153]);
  if (SLOBYTE(STACK[0x537]) < 0)
    operator delete(v82[150]);
  if (SLOBYTE(STACK[0x51F]) < 0)
    operator delete(v82[147]);
  if (SLOBYTE(STACK[0x507]) < 0)
    operator delete(v82[144]);
  if (SLOBYTE(STACK[0x5AF]) < 0)
    operator delete(v82[165]);
  if (SLOBYTE(STACK[0x597]) < 0)
    operator delete(v82[162]);
  if (SLOBYTE(STACK[0x57F]) < 0)
    operator delete(v82[159]);
  if (SLOBYTE(STACK[0x567]) < 0)
    operator delete(v82[156]);
  _Unwind_Resume(a1);
}

void sub_10000FDF0()
{
  void **v0;

  if (SLOBYTE(STACK[0x357]) < 0)
    operator delete(v0[90]);
  if (SLOBYTE(STACK[0x33F]) < 0)
    operator delete(v0[87]);
  if (SLOBYTE(STACK[0x327]) < 0)
    operator delete(v0[84]);
  JUMPOUT(0x10000FC08);
}

void sub_10000FE48()
{
  void **v0;

  if (SLOBYTE(STACK[0x3B7]) < 0)
    operator delete(v0[102]);
  if (SLOBYTE(STACK[0x39F]) < 0)
    operator delete(v0[99]);
  if (SLOBYTE(STACK[0x387]) < 0)
    operator delete(v0[96]);
  JUMPOUT(0x10000FC48);
}

void sub_10000FEA0()
{
  void **v0;

  if (SLOBYTE(STACK[0x417]) < 0)
    operator delete(v0[114]);
  if (SLOBYTE(STACK[0x3FF]) < 0)
    operator delete(v0[111]);
  if (SLOBYTE(STACK[0x3E7]) < 0)
    operator delete(v0[108]);
  JUMPOUT(0x10000FC88);
}

void sub_10000FEF8()
{
  void **v0;

  if (SLOBYTE(STACK[0x477]) < 0)
    operator delete(v0[126]);
  if (SLOBYTE(STACK[0x45F]) < 0)
    operator delete(v0[123]);
  if (SLOBYTE(STACK[0x447]) < 0)
    operator delete(v0[120]);
  JUMPOUT(0x10000FCC8);
}

void sub_10000FF50()
{
  void **v0;

  if (SLOBYTE(STACK[0x4D7]) < 0)
    operator delete(v0[138]);
  if (SLOBYTE(STACK[0x4BF]) < 0)
    operator delete(v0[135]);
  if (SLOBYTE(STACK[0x4A7]) < 0)
    operator delete(v0[132]);
  JUMPOUT(0x10000FD08);
}

void sub_10000FFA8()
{
  void **v0;

  if (SLOBYTE(STACK[0x537]) < 0)
    operator delete(v0[150]);
  if (SLOBYTE(STACK[0x51F]) < 0)
    operator delete(v0[147]);
  if (SLOBYTE(STACK[0x507]) < 0)
    operator delete(v0[144]);
  JUMPOUT(0x10000FD48);
}

void sub_10000FFFC()
{
  void **v0;
  void **v1;
  uint64_t v2;

  if (SLOBYTE(STACK[0x5AF]) < 0)
    operator delete(*(void **)(v2 + 1320));
  sub_10002509C((uint64_t)&STACK[0x550], v1, v0);
  JUMPOUT(0x10000FDE8);
}

void sub_100010024()
{
  void **v0;

  if (SLOBYTE(STACK[0x597]) < 0)
    operator delete(v0[162]);
  if (SLOBYTE(STACK[0x57F]) < 0)
    operator delete(v0[159]);
  if (SLOBYTE(STACK[0x567]) < 0)
    operator delete(v0[156]);
  JUMPOUT(0x10000FDE8);
}

void sub_10001006C()
{
  JUMPOUT(0x10000FDE8);
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  char *v7;
  uint64_t FigBaseObject;
  unsigned int (*v9)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v10;
  CFArrayRef theArray;
  CFRange v13;

  if (!*((_DWORD *)this + 536))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  v6 = (const void **)((char *)this + 8 * a2 + 16);
  v7 = (char *)this + 2080;
  do
  {
    theArray = 0;
    FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v7[8 * v3]);
    v9 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 48);
    if (!v9 || v9(FigBaseObject, v5, kCFAllocatorDefault, &theArray))
      break;
    v10 = theArray;
    v13.length = CFArrayGetCount(theArray);
    v13.location = 0;
    if (CFArrayContainsValue(v10, v13, *v6))
      v4 = *(_QWORD *)&v7[8 * v3];
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  for (i = 296; i != 2280; i += 248)
    *((_BYTE *)this + i) = 0;
  v3 = 0;
  v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((_QWORD *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((_BYTE *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  do
  {
    v5 = (char *)this + 8 * v4;
    *((_QWORD *)v5 + 2) = 0;
    *((_QWORD *)v5 + 260) = 0;
    v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((_QWORD *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((_QWORD *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(_QWORD *)(v6 + 276) = 0xFFFFLL;
    *((_QWORD *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  v3 = 256;
  do
  {
    if (*((_BYTE *)this + v3))
      HxISPCaptureDeviceController::stopReceive(this, v2);
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((_BYTE *)this + 2148))
    HxISPCaptureDeviceController::deactivate(this);
  v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  opaqueCMBufferQueue *v8;
  CMBufferQueueRef *v9;
  opaqueCMBufferQueue *v10;
  CMBufferRef v11;
  char *v12;
  opaqueCMBufferQueue *i;
  opaqueCMBufferQueue **v14;
  opaqueCMBufferQueue *v15;
  CMBufferRef v16;
  char *v17;
  pthread_t *v18;
  char *v19;
  pthread_mutex_t *v20;
  int j;
  int *v22;
  int v23;
  char *v24;
  void *v26;

  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      v6 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((_BYTE *)this + 248 * a2 + 272) = 1;
      v4 = *((_QWORD *)this + a2 + 2);
      v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v4) + 16) + 16);
      if (v5)
        v6 = v5(v4);
      else
        v6 = 4294954514;
      v7 = (char *)this + 248 * a2;
      v10 = (opaqueCMBufferQueue *)*((_QWORD *)v7 + 27);
      v9 = (CMBufferQueueRef *)(v7 + 216);
      v8 = v10;
      if (v10)
      {
        CMBufferQueueRemoveTrigger(v8, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          v11 = CMBufferQueueDequeueAndRetain(*v9);
          if (!v11)
            break;
          CFRelease(v11);
        }
        v12 = (char *)this + 248 * a2;
        v15 = (opaqueCMBufferQueue *)*((_QWORD *)v12 + 29);
        v14 = (opaqueCMBufferQueue **)(v12 + 232);
        for (i = v15; ; i = *v14)
        {
          v16 = CMBufferQueueDequeueAndRetain(i);
          if (!v16)
            break;
          CFRelease(v16);
        }
      }
      v17 = (char *)this + 248 * a2;
      if (*((_QWORD *)v17 + 33))
      {
        v18 = (pthread_t *)(v17 + 264);
        v19 = (char *)this + 248 * a2;
        v20 = (pthread_mutex_t *)(v19 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v19 + 96));
        v23 = *((_DWORD *)v19 + 52);
        v22 = (int *)(v19 + 208);
        for (j = v23; j == 1; j = *v22)
        {
          pthread_mutex_unlock(v20);
          usleep(0x2710u);
          pthread_mutex_lock(v20);
        }
        v26 = 0;
        *v22 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v20);
        pthread_join(*v18, &v26);
        *v18 = 0;
      }
      v24 = (char *)this + 248 * a2;
      *((_QWORD *)v24 + 30) = 0;
      *((_QWORD *)v24 + 31) = 0;
      v24[256] = 0;
    }
  }
  else
  {
    v6 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v6;
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t DefaultLocalCenter;
  uint64_t j;
  const void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  const void *v11;
  const void *v12;
  uint64_t FigBaseObject;
  uint64_t v14;
  void (*v15)(uint64_t);

  if (*((_BYTE *)this + 2148))
  {
    for (i = 16; i != 80; i += 8)
    {
      if (*(_QWORD *)((char *)this + i))
      {
        DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener(DefaultLocalCenter, this, 0, 0, *(_QWORD *)((char *)this + i));
      }
    }
    for (j = 0; j != 1984; j += 248)
    {
      v5 = *(const void **)((char *)this + j + 216);
      if (v5)
        CFRelease(v5);
      v6 = *(const void **)((char *)this + j + 232);
      if (v6)
        CFRelease(v6);
    }
    v7 = 0;
    v8 = -1984;
    do
    {
      v9 = (char *)this + v7;
      *((_QWORD *)v9 + 2) = 0;
      *((_QWORD *)v9 + 260) = 0;
      v10 = (char *)this + v8;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v8 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v8 + 2144), 0);
      *((_WORD *)v10 + 1128) = 0;
      *((_QWORD *)v10 + 281) = 0;
      *((_DWORD *)v10 + 548) = 0;
      *(_OWORD *)(v10 + 2200) = 0u;
      *(_OWORD *)(v10 + 2216) = 0u;
      *(_OWORD *)(v10 + 2225) = 0u;
      *((_QWORD *)v10 + 258) = this;
      v7 += 8;
      *((_DWORD *)v10 + 518) = 0;
      v8 += 248;
    }
    while (v8);
    v11 = (const void *)*((_QWORD *)this + 259);
    if (v11)
      CFRelease(v11);
    v12 = (const void *)*((_QWORD *)this + 1);
    if (v12)
      CFRelease(v12);
    if (*(_QWORD *)this)
    {
      FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        v14 = FigBaseObject;
        v15 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 24);
        if (v15)
          v15(v14);
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((_BYTE *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1;
  const void *v3;
  int *v4;
  unint64_t v5;
  const __CFDictionary *v6;
  const char *v7;
  uint64_t FigBaseObject;
  uint64_t (*v10)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int Count;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t DefaultLocalCenter;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int v20;
  int v21;
  unint64_t v22;
  const void *v23;

  v1 = 0xFFFFFFFFLL;
  if (*((_BYTE *)this + 2148))
    return v1;
  *((_DWORD *)this + 538) = -1;
  v23 = 0;
  v1 = sub_10001216C("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v23);
  if (v23)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    v3 = v23;
    if (v23)
    {
LABEL_13:
      *(_QWORD *)this = v3;
      goto LABEL_14;
    }
  }
  v4 = &dword_100030BA8;
  v5 = 1;
  do
  {
    v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      v7 = (const char *)*((_QWORD *)v4 - 2);
      v1 = sub_10001216C(v7, *((const char **)v4 - 1), (uint64_t)&v23);
      if (!v23)
      {
        v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    v3 = v23;
LABEL_10:
    if (v5 > 4)
      break;
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this)
    goto LABEL_13;
  if (v3)
    CFRelease(v3);
LABEL_14:
  if ((_DWORD)v1 || !*(_QWORD *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v10 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 48);
    if (!v10)
      return 4294954514;
    v1 = v10(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if ((_DWORD)v1)
      return v1;
    Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8)
      v12 = 8;
    else
      v12 = Count;
    *((_DWORD *)this + 516) = v12;
    if (v12)
    {
      v13 = 0;
      do
      {
        *((_QWORD *)this + v13 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v13);
        ++v13;
        v14 = *((unsigned int *)this + 516);
      }
      while (v13 < v14);
      if ((_DWORD)v14)
      {
        v15 = 0;
        do
        {
          v16 = (char *)this + 8 * v15;
          if (*((_QWORD *)v16 + 2))
          {
            DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener(DefaultLocalCenter, this, sub_1000108B8, 0, *((_QWORD *)v16 + 2), 0);
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v15);
          }
          ++v15;
        }
        while (v15 < *((unsigned int *)this + 516));
      }
    }
    v18 = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v19 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v18)
                                                                                              + 8)
                                                                                  + 48);
    if (!v19)
      return 4294954514;
    v1 = v19(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!(_DWORD)v1)
    {
      v20 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v20 >= 8)
        v21 = 8;
      else
        v21 = v20;
      *((_DWORD *)this + 536) = v21;
      if (v21)
      {
        v22 = 0;
        do
        {
          *((_QWORD *)this + v22 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v22);
          ++v22;
        }
        while (v22 < *((unsigned int *)this + 536));
      }
      v1 = 0;
      *((_BYTE *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_1000108B8(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  unint64_t v7;
  unsigned int v8;
  size_t result;
  FILE *v10;
  const char *CStringPtr;

  if (!a2 || !cf1)
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, __stdoutp);
  if (*(_DWORD *)(a2 + 2064))
  {
    v7 = 0;
    do
    {
      if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7)))
        break;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a2 + 2064));
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v10 = __stdoutp;
  CStringPtr = CFStringGetCStringPtr(a3, 0);
  fprintf(v10, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
  fflush(__stdoutp);
  result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a2 + 248 * v8 + 256))
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, const __CFArray *, const __CFDictionary *);

  if (!a2)
    return 4294954516;
  v5 = *(_QWORD *)this;
  v6 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v6 >= 2uLL && (v7 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v6[2]) != 0)
    return v7(v5, a2, a3);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, const __CFArray *, _QWORD);

  if (!a2)
    return 4294954516;
  v3 = *(_QWORD *)this;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v4 >= 2uLL && (v5 = (uint64_t (*)(uint64_t, const __CFArray *, _QWORD))v4[3]) != 0)
    return v5(v3, a2, 0);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  char *v5;
  uint64_t v6;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t FigBaseObject;
  unsigned int (*v14)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  char *v15;
  CMBufferQueueRef *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  opaqueCMBufferQueue *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *);
  uint64_t v25;
  uint64_t (*v26)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  _BYTE *v27;
  char *v28;
  pthread_mutex_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  CMTime time;
  CFTypeRef obj;
  pthread_attr_t v35;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v9 = (char *)this + 248 * a2;
  *((_QWORD *)v9 + 30) = a3;
  *((_QWORD *)v9 + 31) = a4;
  obj = 0;
  v10 = (char *)this + 8 * a2;
  v12 = *((_QWORD *)v10 + 2);
  v11 = v10 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v12);
  v14 = *(unsigned int (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                          + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    obj = 0;
  }
  v15 = (char *)this + 248 * a2;
  v17 = *((_QWORD *)v15 + 27);
  v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    v23 = FigCaptureStreamGetFigBaseObject(*v11);
    v24 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *))(*(_QWORD *)(CMBaseObjectGetVTable(v23) + 8)
                                                                                              + 48);
    if (!v24)
      return 4294954514;
    v6 = v24(v23, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if ((_DWORD)v6)
      return v6;
  }
  v18 = (char *)this + 248 * a2;
  v20 = *((_QWORD *)v18 + 29);
  v19 = v18 + 232;
  if (!v20)
  {
    v25 = FigCaptureStreamGetFigBaseObject(*v11);
    v26 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v25)
                                                                                              + 8)
                                                                                  + 48);
    if (v26)
    {
      v6 = v26(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if ((_DWORD)v6)
        return v6;
      goto LABEL_14;
    }
    return 4294954514;
  }
LABEL_14:
  v21 = v5 + 80;
  v22 = *v16;
  time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v22, (CMBufferQueueTriggerCallback)sub_100010E1C, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  v27 = v5 + 256;
  v28 = (char *)this + 248 * a2;
  v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v35);
  pthread_attr_setdetachstate(&v35, 1);
  pthread_create((pthread_t *)v30 + 7, &v35, (void *(__cdecl *)(void *))sub_100010E78, v21);
  pthread_attr_destroy(&v35);
  pthread_mutex_unlock(v29);
  v31 = *v11;
  v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v11) + 16) + 8);
  if (v32)
  {
    v6 = v32(v31);
    if (!(_DWORD)v6)
    {
      v6 = 0;
      *v27 = 1;
      return v6;
    }
  }
  else
  {
    v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v35.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1)
      break;
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v35);
  *v27 = 0;
  return v6;
}

uint64_t sub_100010E1C(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 192))
  {
    v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_100010E78(uint64_t a1)
{
  const char *v2;
  CMBufferRef v3;
  CMBufferRef v4;
  void (*v5)(CMBufferRef, _QWORD, _QWORD);

  if (*(_DWORD *)(a1 + 8))
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  else
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2)
      break;
    v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      v4 = v3;
      do
      {
        v5 = *(void (**)(CMBufferRef, _QWORD, _QWORD))(a1 + 160);
        if (v5)
          v5(v4, *(unsigned int *)(a1 + 8), *(_QWORD *)(a1 + 168));
        CFRelease(v4);
        v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  uint64_t result;
  uint64_t v31;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  __CFDictionary *v38;
  __CFDictionary *v39;
  __CFDictionary *v40;
  __CFDictionary *v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  __CFDictionary *v44;
  __CFDictionary *v45;
  __CFDictionary *v46;
  __CFDictionary *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  __CFDictionary *v50;
  __CFDictionary *v51;
  __CFDictionary *v52;
  __CFDictionary *v53;
  int v54;
  char *v55;
  char *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t FigBaseObject;
  uint64_t (*v60)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  char *v63;
  CFTypeRef obj;
  _QWORD v65[6];
  unsigned int v66;
  _QWORD v67[6];
  unsigned int v68;
  _QWORD v69[6];
  unsigned int v70;
  _QWORD v71[6];
  unsigned int v72;
  _QWORD v73[6];
  unsigned int v74;
  _QWORD v75[6];
  unsigned int v76;
  _QWORD v77[6];
  unsigned int v78;
  _QWORD v79[6];
  unsigned int v80;
  _QWORD v81[6];
  unsigned int v82;
  _QWORD value[6];
  unsigned int v84;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v63 = (char *)this + 248 * a2;
  v31 = a2;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v33 = Mutable;
    v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_10001177C;
      value[3] = &unk_1000307B0;
      v84 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000307F0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      v37 = v36;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_1000117EC;
      v81[3] = &unk_100030810;
      v82 = a2;
      v81[4] = a5;
      v81[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030850);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      v39 = v38;
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 0x40000000;
      v79[2] = sub_10001185C;
      v79[3] = &unk_100030870;
      v80 = a2;
      v79[4] = a7;
      v79[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000308B0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        v41 = v40;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_1000118CC;
        v77[3] = &unk_1000308D0;
        v78 = a2;
        v77[4] = a9;
        v77[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030910);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        v43 = v42;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_10001193C;
        v75[3] = &unk_100030930;
        v76 = a2;
        v75[4] = a11;
        v75[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030970);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        v45 = v44;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_1000119AC;
        v73[3] = &unk_100030990;
        v74 = a2;
        v73[4] = a13;
        v73[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000309D0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_100011A1C;
        v71[3] = &unk_1000309F0;
        v72 = a2;
        v71[4] = a15;
        v71[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030A30);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        v49 = v48;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_100011A8C;
        v69[3] = &unk_100030A50;
        v70 = a2;
        v69[4] = a17;
        v69[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030A90);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        v51 = v50;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_100011AFC;
        v67[3] = &unk_100030AB0;
        v68 = a2;
        v67[4] = a19;
        v67[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v67);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030AF0);
        CFDictionarySetValue(v33, CFSTR("VisPipe"), v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        v53 = v52;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 0x40000000;
        v65[2] = sub_100011B6C;
        v65[3] = &unk_100030B10;
        v66 = a2;
        v65[4] = a21;
        v65[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v65);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100030B50);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54)
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    CFRelease(v33);
    v31 = a2;
  }
  v55 = (char *)this + 248 * v31;
  *((_QWORD *)v55 + 30) = 0;
  *((_QWORD *)v55 + 31) = 0;
  obj = 0;
  v56 = (char *)this + 8 * v31;
  v58 = *((_QWORD *)v56 + 2);
  v57 = v56 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v58);
  v60 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                                 + 8)
                                                                                     + 48);
  if (!v60)
    return 4294954514;
  result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if ((_DWORD)result)
    return result;
  CFShow(obj);
  CFRelease(obj);
  obj = 0;
  v61 = *v57;
  v62 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v57) + 16) + 8);
  if (!v62)
    return 4294954514;
  result = v62(v61);
  if (!(_DWORD)result)
    v63[256] = 1;
  return result;
}

uint64_t sub_10001177C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000117C4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_1000117EC(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011834(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_10001185C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000118A4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_1000118CC(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011914(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_10001193C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011984(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_1000119AC(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000119F4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_100011A1C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011A64(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_100011A8C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011AD4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_100011AFC(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011B44(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_100011B6C(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100011BB4(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, const __CFString *, const __CFBoolean *);
  uint64_t result;
  _BYTE *v11;
  const char *v12;

  if (!*((_BYTE *)this + 2148))
  {
    v12 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_10:
    puts(v12);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v12 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_10;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v9 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 56);
  if (!v9)
    return 4294954514;
  result = v9(FigBaseObject, a3, a4);
  if (!(_DWORD)result)
  {
    result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if ((_DWORD)result)
    {
      result = CFBooleanGetValue(a4);
      v11 = (char *)this + 248 * a2 + 273;
      if ((_DWORD)result)
      {
        result = 0;
        *v11 = 1;
      }
      else
      {
        *v11 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                         + 8)
                                                                             + 56);
    if (v6)
      return v6(FigBaseObject, a2, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const CFAllocatorRef, void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                             + 48);
    if (v6)
      return v6(FigBaseObject, a2, kCFAllocatorDefault, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  const char *v9;

  if (!*((_BYTE *)this + 2148))
  {
    v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v7 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                           + 48);
  if (v7)
    return v7(FigBaseObject, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                            + 56);
  if (v18)
    return v18(v17, a3, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                                            + 48);
  if (v18)
    return v18(v17, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t sub_10001216C(const char *a1, const char *a2, uint64_t a3)
{
  void *v5;
  uint64_t (*v6)(const CFAllocatorRef, _QWORD, uint64_t);

  v5 = dlopen(a1, 4);
  if (v5 && (v6 = (uint64_t (*)(const CFAllocatorRef, _QWORD, uint64_t))dlsym(v5, a2)) != 0)
    return v6(kCFAllocatorDefault, 0, a3);
  else
    return 0;
}

void sub_1000125B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000128E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100012B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_100012DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_100013B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,void *a28,void *a29,void *a30)
{
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_100013ED8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1000140A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;
  void *v16;

  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_100014364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_100014584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, DeviceCMInterface *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;
  void *v15;
  void *v16;

  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a14);
  _Unwind_Resume(a1);
}

void sub_10001525C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_100015560(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100015768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000158FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100015A28(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a10);
  _Unwind_Resume(a1);
}

void sub_100015A90(_Unwind_Exception *a1, DeviceCMInterface *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  DeviceCMInterface::~DeviceCMInterface((DeviceCMInterface *)&a10);
  _Unwind_Resume(a1);
}

void sub_1000166F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000168D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001699C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100016B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1000171EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void *sub_1000173B8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_10000DA3C();
  return operator new(24 * a2);
}

uint64_t sub_1000173FC(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 24;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10001744C(void ***a1)
{
  void **v1;
  id *v2;
  id *v4;
  void *v5;
  id *v6;

  v1 = *a1;
  v2 = (id *)**a1;
  if (v2)
  {
    v4 = (id *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 3;

        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t encryptFDRData(const char *a1, size_t a2, char *a3, char *a4)
{
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  size_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v8 = __osLogPearlLibTrace;
  else
    v8 = &_os_log_default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    v17 = a1;
    v18 = 2048;
    v19 = a2;
    v20 = 2048;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "encryptFDRData %p %zu %p %p\n", buf, 0x2Au);
  }
  v9 = encryptFDRDataInternal(a1, a2, a3, a4, 0);
  if ((_DWORD)v9)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 161);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v14 = __osLogPearlLib;
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = (int)v9;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 161;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v15 = __osLogPearlLibTrace;
    else
      v15 = &_os_log_default;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v9;
      v11 = v15;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v10 = __osLogPearlLibTrace;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      v11 = v10;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "encryptFDRData -> %d\n", buf, 8u);
    }
  }
  return v9;
}

uint64_t encryptFDRDataInternal(const char *a1, size_t a2, char *a3, char *a4, int a5)
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  size_t v21;
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  size_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v10 = __osLogPearlLibTrace;
  else
    v10 = &_os_log_default;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    v24 = a1;
    v25 = 2048;
    v26 = a2;
    v27 = 2048;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 1024;
    v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "encryptFDRDataInternal %p %zu %p %p %d\n", buf, 0x30u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 209);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "data";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 209;
LABEL_77:
    v20 = v18;
LABEL_78:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_79:
    v12 = 258;
    goto LABEL_16;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 210);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "dataLength > 0";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 210;
    goto LABEL_77;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "encryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 211);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "encryptedDataBuffer";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 211;
    goto LABEL_77;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 212);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "outLength";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 212;
    goto LABEL_77;
  }
  if (a2 >= 0xFFFFFFFFFFFFFFACLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encryptedData)), (&minimalOutputBufferLength))) == 0 ", a2 >= 0xFFFFFFFFFFFFFFACLL, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 215);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "__os_warn_unused(__builtin_add_overflow((dataLength), (2 * 16 + __builtin_offsetof(psd2_encrypted_t, encrypted"
          "Data)), (&minimalOutputBufferLength))) == 0 ";
    v25 = 2048;
    v26 = a2 >= 0xFFFFFFFFFFFFFFACLL;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 215;
    v20 = v19;
    goto LABEL_78;
  }
  if (*(_QWORD *)a4 < a2 + 84)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*outLength >= minimalOutputBufferLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 217);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_79;
    *(_DWORD *)buf = 136316162;
    v24 = "*outLength >= minimalOutputBufferLength";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 217;
    goto LABEL_77;
  }
  v11 = sub_100018734();
  if ((_DWORD)v11)
  {
    v12 = v11;
    v21 = (int)v11;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 220);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v22 = __osLogPearlLib;
    else
      v22 = &_os_log_default;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = v21;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v31 = 1024;
      v32 = 220;
LABEL_94:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v12 = sub_1000189F0(dword_100038D10, 9, a5, a1, a2, a3, a4);
    if ((_DWORD)v12)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 223);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v22 = __osLogPearlLib ? __osLogPearlLib : &_os_log_default;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v24 = "err == 0 ";
        v25 = 2048;
        v26 = (int)v12;
        v27 = 2080;
        v28 = "";
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v31 = 1024;
        v32 = 223;
        goto LABEL_94;
      }
    }
  }
LABEL_16:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v12)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v13 = __osLogPearlLibTrace;
    else
      v13 = &_os_log_default;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v12;
      v14 = v13;
      v15 = OS_LOG_TYPE_ERROR;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "encryptFDRDataInternal -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v16 = __osLogPearlLibTrace;
    else
      v16 = &_os_log_default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      v14 = v16;
      v15 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_33;
    }
  }
  return v12;
}

uint64_t verifyFDRData(const char *a1, size_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  size_t v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  size_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v18 = a1;
    v19 = 2048;
    v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "verifyFDRData %p %zu\n", buf, 0x16u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 179);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v18 = "data";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 179;
    goto LABEL_45;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 180);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    *(_DWORD *)buf = 136316162;
    v18 = "dataLength > 0";
    v19 = 2048;
    v20 = 0;
    v21 = 2080;
    v22 = "";
    v23 = 2080;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v25 = 1024;
    v26 = 180;
LABEL_45:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_46:
    v5 = 258;
    goto LABEL_12;
  }
  v5 = sub_100018734();
  if ((_DWORD)v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 183);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v13 = __osLogPearlLib;
    else
      v13 = &_os_log_default;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "err == 0 ";
      v19 = 2048;
      v20 = (int)v5;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v25 = 1024;
      v26 = 183;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = sub_1000189F0(dword_100038D10, 10, 0, a1, a2, 0, 0);
    if ((_DWORD)v6)
    {
      v14 = v6;
      v15 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 186);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v16 = __osLogPearlLib;
      else
        v16 = &_os_log_default;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v18 = "err == 0 ";
        v19 = 2048;
        v20 = v15;
        v21 = 2080;
        v22 = "";
        v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v25 = 1024;
        v26 = 186;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v5 = v14;
    }
  }
LABEL_12:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v5)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v7 = __osLogPearlLibTrace;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v5;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "verifyFDRData -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v10 = __osLogPearlLibTrace;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_29;
    }
  }
  return v5;
}

uint64_t sub_100018734()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v0 = IOServiceMatching("ApplePearlSEPDriver");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100038D10);
    if ((_DWORD)v3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 129);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v6 = __osLogPearlLib;
      else
        v6 = &_os_log_default;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v8 = "err == 0 ";
        v9 = 2048;
        v10 = (int)v3;
        v11 = 2080;
        v12 = "";
        v13 = 2080;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v15 = 1024;
        v16 = 129;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    IOObjectRelease(v2);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "service", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 126);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v3 = 3758097084;
    if (__osLogPearlLib)
      v5 = __osLogPearlLib;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "service";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v15 = 1024;
      v16 = 126;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  return v3;
}

uint64_t sub_1000189F0(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v14;
  _WORD *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  _BYTE outputStructCnt[12];
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v14 = a5 + 8;
  v15 = calloc(a5 + 8, 1uLL);
  if (v15)
  {
    v16 = v15;
    *v15 = 21072;
    v15[1] = a2;
    v15[2] = 1;
    v15[3] = a3;
    if (a5)
      memmove(v15 + 4, a4, a5);
    if (a7)
    {
      *(_QWORD *)outputStructCnt = *a7;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
      *a7 = *(_QWORD *)outputStructCnt;
    }
    else
    {
      *(_QWORD *)outputStructCnt = 0;
      v17 = IOConnectCallStructMethod(a1, 0, v16, v14, a6, (size_t *)outputStructCnt);
    }
    free(v16);
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "cmd", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 99);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)outputStructCnt = 136316162;
      *(_QWORD *)&outputStructCnt[4] = "cmd";
      v21 = 2048;
      v22 = 0;
      v23 = 2080;
      v24 = "";
      v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v27 = 1024;
      v28 = 99;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", outputStructCnt, 0x30u);
    }
    return 260;
  }
  return v17;
}

uint64_t decryptFDRData(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 241);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = &_os_log_default;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "data";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 241;
    goto LABEL_46;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 242);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = &_os_log_default;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "dataLength > 0";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 242;
    goto LABEL_46;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "decryptedDataBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 243);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = &_os_log_default;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "decryptedDataBuffer";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 243;
    goto LABEL_46;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 244);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = &_os_log_default;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "outLength";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 244;
    goto LABEL_46;
  }
  if (*a4 < a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(*outLength > 0) && (*outLength >= dataLength)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 245);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v11 = __osLogPearlLib;
    else
      v11 = &_os_log_default;
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 136316162;
    v17 = "(*outLength > 0) && (*outLength >= dataLength)";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 245;
LABEL_46:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_47:
    v8 = 258;
    goto LABEL_8;
  }
  v8 = sub_100018734();
  if ((_DWORD)v8)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 248);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = (int)v8;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 248;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v9 = sub_1000189F0(dword_100038D10, 30, 0, a1, a2, a3, a4);
    if ((_DWORD)v9)
    {
      v13 = v9;
      v14 = (int)v9;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 251);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v15 = __osLogPearlLib;
      else
        v15 = &_os_log_default;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "err == 0 ";
        v18 = 2048;
        v19 = v14;
        v20 = 2080;
        v21 = "";
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v24 = 1024;
        v25 = 251;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v8 = v13;
    }
  }
LABEL_8:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v8;
}

uint64_t overridePCECalibration(const void *a1, size_t a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (a1 && a2)
  {
    v4 = sub_100018734();
    if ((_DWORD)v4)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 269);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v8 = __osLogPearlLib;
      else
        v8 = &_os_log_default;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = "err == 0 ";
        v14 = 2048;
        v15 = (int)v4;
        v16 = 2080;
        v17 = "";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v20 = 1024;
        v21 = 269;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    else
    {
      v5 = sub_1000189F0(dword_100038D10, 34, 0, a1, a2, 0, 0);
      if ((_DWORD)v5)
      {
        v9 = v5;
        v10 = (int)v5;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 272);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v11 = __osLogPearlLib;
        else
          v11 = &_os_log_default;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v13 = "err == 0 ";
          v14 = 2048;
          v15 = v10;
          v16 = 2080;
          v17 = "";
          v18 = 2080;
          v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v20 = 1024;
          v21 = 272;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v4 = v9;
      }
    }
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "calibration && (calibrationSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 266);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v7 = __osLogPearlLib;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = "calibration && (calibrationSize > 0)";
      v14 = 2048;
      v15 = 0;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v20 = 1024;
      v21 = 266;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v4 = 258;
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v4;
}

uint64_t decompressReferenceFrames(const void *a1, size_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSString *v15;
  FILE *v16;
  NSString *v17;
  NSObject *v18;
  NSString *v19;
  NSObject *v20;
  const char *v21;
  NSFileManager *v22;
  unsigned int v23;
  NSFileManager *v24;
  unsigned int v25;
  NSObject *v26;
  NSFileManager *v27;
  unsigned __int8 v28;
  NSDictionary *v29;
  NSFileManager *v30;
  uint64_t v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  __objc2_meth_list *v35;
  int *v36;
  int v37;
  NSObject *v38;
  int v39;
  unsigned int v40;
  int v41;
  uint64_t v42;
  id v43;
  NSString *v44;
  unsigned int v45;
  unsigned int *v46;
  unsigned int *v47;
  uint64_t v48;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  NSData *v55;
  NSString *v56;
  unsigned __int8 v57;
  FILE *v58;
  double v59;
  unsigned int v60;
  int v61;
  NSObject *v62;
  unsigned int v63;
  int v64;
  double v65;
  NSString *v66;
  NSObject *v67;
  const char *v68;
  unsigned __int8 v69;
  FILE *v70;
  NSObject *v71;
  NSString *v72;
  NSObject *v73;
  const char *v74;
  NSString *v75;
  NSString *v76;
  NSData *v77;
  NSData *v78;
  NSString *v79;
  NSObject *v80;
  NSString *v81;
  uint64_t v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  NSObject *v86;
  NSObject *v87;
  io_connect_t entrysize;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSString *v93;
  NSObject *v94;
  NSString *v95;
  NSObject *v96;
  NSString *v97;
  NSObject *v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  unsigned int *v110;
  uint64_t v111;
  NSString *v112;
  unsigned int *v113;
  uint64_t v114;
  unsigned int *v115;
  id v116;
  int *v117;
  NSString *v118;
  NSData *v119;
  NSString *v120;
  int v121;
  _DWORD v122[2];
  size_t v123;
  NSFileAttributeKey v124;
  _UNKNOWN **v125;
  uint8_t buf[4];
  _BYTE v127[10];
  uint64_t v128;
  _BYTE v129[26];
  char __str[16];
  __int128 v131;

  v123 = 0;
  *(_OWORD *)__str = 0u;
  v131 = 0u;
  if (!a1 || !a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "prf1Class && (prf1ClassSize > 0)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 309);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v99 = __osLogPearlLib;
    else
      v99 = &_os_log_default;
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "prf1Class && (prf1ClassSize > 0)";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 309;
    goto LABEL_190;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "systemRootPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 310);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v99 = __osLogPearlLib;
    else
      v99 = &_os_log_default;
    if (!os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
      goto LABEL_191;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "systemRootPath";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 310;
LABEL_190:
    _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_191:
    v12 = 258;
LABEL_263:
    v35 = &OBJC_INSTANCE_METHODS_NSObject;
    goto LABEL_124;
  }
  v6 = sub_100018734();
  if ((_DWORD)v6)
  {
    v12 = v6;
    v100 = (int)v6;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 313);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v101 = __osLogPearlLib;
    else
      v101 = &_os_log_default;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v100;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 313;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_263;
  }
  v7 = (char *)calloc(a2 + 9, 1uLL);
  if (!v7)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 317);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v102 = __osLogPearlLib;
    else
      v102 = &_os_log_default;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "fdrInput";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 317;
    goto LABEL_221;
  }
  v8 = v7;
  *(_DWORD *)v7 = 589827;
  v7[4] = 0;
  *(_DWORD *)(v7 + 5) = a2;
  memcpy(v7 + 9, a1, a2);
  v9 = sub_1000189F0(dword_100038D10, 36, 0, v8, a2 + 9, 0, 0);
  if ((_DWORD)v9)
  {
    v12 = v9;
    v103 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 327);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v104 = __osLogPearlLib;
    else
      v104 = &_os_log_default;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v103;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 327;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v8);
    goto LABEL_263;
  }
  free(v8);
  v123 = 52;
  v10 = calloc(0x34uLL, 1uLL);
  if (!v10)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 334);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v102 = __osLogPearlLib;
    else
      v102 = &_os_log_default;
    if (!os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      goto LABEL_222;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v127 = "dataInfo";
    *(_WORD *)&v127[8] = 2048;
    v128 = 0;
    *(_WORD *)v129 = 2080;
    *(_QWORD *)&v129[2] = "";
    *(_WORD *)&v129[10] = 2080;
    *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v129[20] = 1024;
    *(_DWORD *)&v129[22] = 334;
LABEL_221:
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_222:
    v12 = 260;
    goto LABEL_263;
  }
  v11 = v10;
  v12 = sub_1000189F0(dword_100038D10, 45, 0, 0, 0, v10, &v123);
  if ((_DWORD)v12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 338);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v105 = __osLogPearlLib;
    else
      v105 = &_os_log_default;
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = (int)v12;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 338;
      _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_262;
  }
  fprintf(__stderrp, "ReferenceFramesInfo setCount: %d\n", *v11);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v13 = __osLogPearlLib;
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *v11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v127 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ReferenceFramesInfo setCount: %d\n", buf, 8u);
  }
  if (!*v11)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataInfo->setCount > 0", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 342);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v106 = __osLogPearlLib;
    else
      v106 = &_os_log_default;
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "dataInfo->setCount > 0";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 342;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 259;
    goto LABEL_262;
  }
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s%s"), a3, "/System/Library/Pearl/ReferenceFrames");
  v16 = __stderrp;
  if (!v15)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "path", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 345);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v107 = __osLogPearlLib;
    else
      v107 = &_os_log_default;
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "path";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 345;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v12 = 261;
    goto LABEL_262;
  }
  v17 = objc_retainAutorelease(v15);
  fprintf(v16, "ReferenceFramesPath: %s\n", -[NSString UTF8String](v17, "UTF8String"));
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v18 = __osLogPearlLib;
  else
    v18 = &_os_log_default;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_retainAutorelease(v17);
    v20 = v18;
    v21 = -[NSString UTF8String](v19, "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v127 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ReferenceFramesPath: %s\n", buf, 0xCu);

  }
  v22 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v23 = -[NSFileManager fileExistsAtPath:](v22, "fileExistsAtPath:", v17);

  if (v23)
  {
    v24 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v25 = -[NSFileManager removeItemAtPath:error:](v24, "removeItemAtPath:error:", v17, 0);

    if ((v25 & 1) == 0)
    {
      v12 = v25 ^ 1;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 353);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v108 = __osLogPearlLib;
      else
        v108 = &_os_log_default;
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v127 = "err == 0 ";
        *(_WORD *)&v127[8] = 2048;
        v128 = v12;
        *(_WORD *)v129 = 2080;
        *(_QWORD *)&v129[2] = "";
        *(_WORD *)&v129[10] = 2080;
        *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v129[20] = 1024;
        *(_DWORD *)&v129[22] = 353;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      goto LABEL_261;
    }
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v26 = __osLogPearlLib;
    else
      v26 = &_os_log_default;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v127 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Removed %@\n", buf, 0xCu);
    }
  }
  v27 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v28 = -[NSFileManager fileExistsAtPath:](v27, "fileExistsAtPath:", v17);

  if ((v28 & 1) != 0)
    goto LABEL_37;
  v124 = NSFilePosixPermissions;
  v125 = &off_100034738;
  v29 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
  v30 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v12 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v30, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, v29, 0) ^ 1;

  if ((v12 & 1) != 0)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", v12, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 362);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v109 = __osLogPearlLib;
    else
      v109 = &_os_log_default;
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "err == 0 ";
      *(_WORD *)&v127[8] = 2048;
      v128 = v12;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 362;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

LABEL_261:
LABEL_262:
    free(v11);
    goto LABEL_263;
  }

LABEL_37:
  if (*v11)
  {
    v31 = 0;
    v119 = 0;
    v120 = 0;
    v114 = 0;
    v32 = 0;
    v33 = 0;
    v116 = 0;
    v34 = 0;
    v35 = &OBJC_INSTANCE_METHODS_NSObject;
    v110 = v11;
    while (1)
    {
      v36 = &v11[3 * v31];
      v37 = v36[1];
      v115 = (unsigned int *)(++v36 + 1);
      v117 = v36;
      v113 = (unsigned int *)(v36 + 2);
      fprintf(__stderrp, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", v31, v37, v36[1], v36[2]);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v121 = v31;
      if (__osLogPearlLib)
        v38 = __osLogPearlLib;
      else
        v38 = &_os_log_default;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = *v117;
        v40 = *v115;
        v41 = *v113;
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v127 = v31;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v39;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v40;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "ReferenceFramesSetInfo, index: %d, type: %d, count: %d, size: %d\n", buf, 0x1Au);
      }
      v42 = *v117;
      if (v42 <= 3)
        v114 = (uint64_t)*(&off_100030C70 + v42);
      v43 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");

      if (!v43)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "setDictionary", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 383);
        v93 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v94 = __osLogPearlLib;
        else
          v94 = &_os_log_default;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "setDictionary";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 383;
          _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v11 = v110;
        v77 = v119;
        v32 = v93;
        v76 = v33;
        goto LABEL_79;
      }
      v111 = v31;
      v116 = v43;
      objc_msgSend(v43, "setObject:forKeyedSubscript:", &off_100034750, CFSTR("FormatDR"));
      v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/reference-%@.plist"), v17, v114);

      if (!v44)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dictFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 388);
        v77 = v119;
        v95 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v96 = __osLogPearlLib;
        else
          v96 = &_os_log_default;
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "dictFileName";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 388;
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
        v76 = (NSString *)v43;
        v11 = v110;
        v32 = v95;
        goto LABEL_79;
      }
      v112 = v44;
      if (*v115)
        break;
LABEL_68:
      v69 = objc_msgSend(v116, "writeToFile:atomically:", v112, 0);
      v70 = __stderrp;
      if ((v69 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 438);
        v97 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v77 = v119;
        if (__osLogPearlLib)
          v98 = __osLogPearlLib;
        else
          v98 = &_os_log_default;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v128 = 1;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 438;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }

        v12 = 1;
        v11 = v110;
        v32 = v97;
        v76 = v112;
        goto LABEL_79;
      }
      v33 = objc_retainAutorelease(v112);
      fprintf(v70, "Reference set dictionary written to %s\n", -[NSString UTF8String](v33, "UTF8String"));
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v11 = v110;
      if (__osLogPearlLib)
        v71 = __osLogPearlLib;
      else
        v71 = &_os_log_default;
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        v72 = objc_retainAutorelease(v33);
        v73 = v71;
        v74 = -[NSString UTF8String](v72, "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v127 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Reference set dictionary written to %s\n", buf, 0xCu);

      }
      v31 = v111 + 1;
      if (v111 + 1 >= (unint64_t)*v110)
      {

        v12 = 0;
        v76 = v33;
        v77 = v119;
LABEL_79:

        v75 = v120;
        goto LABEL_80;
      }
    }
    v45 = 0;
    while (1)
    {
      v122[0] = v121;
      v122[1] = v45;
      v123 = *v113 + 524;
      v46 = (unsigned int *)calloc(v123, 1uLL);
      if (!v46)
        break;
      v47 = v46;
      v48 = sub_1000189F0(v35[418].entrysize, 46, 0, v122, 8uLL, v46, &v123);
      if ((_DWORD)v48)
      {
        v12 = v48;
        v81 = v34;
        v82 = (int)v48;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v48, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 403);
        v118 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v83 = __osLogPearlLib;
        else
          v83 = &_os_log_default;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v128 = v82;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 403;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_104;
      }
      if ((snprintf(__str, 0x20uLL, "%.6f", *(double *)v47) - 32) <= 0xFFFFFFE0)
      {
        v81 = v34;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ret > 0 && ret < sizeof(tempChar)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 406);
        v118 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v84 = __osLogPearlLib;
        else
          v84 = &_os_log_default;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "ret > 0 && ret < sizeof(tempChar)";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 406;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v12 = 261;
LABEL_104:
        v85 = v110;
        v50 = v81;
LABEL_121:
        v53 = v120;
LABEL_122:
        free(v85);
        free(v47);

        v78 = v119;
        goto LABEL_123;
      }
      v49 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str);

      if (!v49)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "tempString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 409);
        v118 = v32;
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v85 = v110;
        if (__osLogPearlLib)
          v86 = __osLogPearlLib;
        else
          v86 = &_os_log_default;
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "tempString";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 409;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v50 = 0;
        v12 = 261;
        v35 = &OBJC_INSTANCE_METHODS_NSObject;
        goto LABEL_121;
      }
      v50 = v49;
      v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reference-%@__T_%@.bin"), v114, v49);

      if (!v51)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFileName", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 412);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v85 = v110;
        if (__osLogPearlLib)
          v87 = __osLogPearlLib;
        else
          v87 = &_os_log_default;
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refFileName";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 412;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v118 = 0;
        v12 = 261;
        goto LABEL_121;
      }
      v52 = v51;
      v53 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v17, v51);

      v118 = v52;
      if (!v53)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refPath", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 415);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v90 = __osLogPearlLib;
        else
          v90 = &_os_log_default;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refPath";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 415;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v53 = 0;
        v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v54 = v17;
      objc_msgSend(v116, "setObject:forKeyedSubscript:", v52, v50);
      v55 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v47 + 3, v47[2], 0);

      if (!v55)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrameData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 423);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v17 = v54;
        if (__osLogPearlLib)
          v91 = __osLogPearlLib;
        else
          v91 = &_os_log_default;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "refFrameData";
          *(_WORD *)&v127[8] = 2048;
          v128 = 0;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 423;
          _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v119 = 0;
        v12 = 261;
        v85 = v110;
        goto LABEL_122;
      }
      v56 = v50;
      v119 = v55;
      v57 = -[NSData writeToFile:atomically:](v55, "writeToFile:atomically:", v53, 0);
      v58 = __stderrp;
      if ((v57 & 1) == 0)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", 1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 426);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v17 = v54;
        if (__osLogPearlLib)
          v92 = __osLogPearlLib;
        else
          v92 = &_os_log_default;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)v127 = "err == 0 ";
          *(_WORD *)&v127[8] = 2048;
          v12 = 1;
          v128 = 1;
          *(_WORD *)v129 = 2080;
          *(_QWORD *)&v129[2] = "";
          *(_WORD *)&v129[10] = 2080;
          *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          *(_WORD *)&v129[20] = 1024;
          *(_DWORD *)&v129[22] = 426;
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        else
        {
          v12 = 1;
        }
        v85 = v110;
        goto LABEL_122;
      }
      v59 = *(double *)v47;
      v60 = v47[2];
      v61 = *v117;
      v120 = objc_retainAutorelease(v53);
      fprintf(v58, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", v121, v45, v60, v61, v59, -[NSString UTF8String](v120, "UTF8String"));
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v62 = __osLogPearlLib;
      else
        v62 = &_os_log_default;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = v47[2];
        v64 = *v117;
        v65 = *(double *)v47;
        v66 = objc_retainAutorelease(v120);
        v67 = v62;
        v68 = -[NSString UTF8String](v66, "UTF8String");
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)v127 = v121;
        *(_WORD *)&v127[4] = 1024;
        *(_DWORD *)&v127[6] = v45;
        LOWORD(v128) = 1024;
        *(_DWORD *)((char *)&v128 + 2) = v63;
        HIWORD(v128) = 1024;
        *(_DWORD *)v129 = v64;
        *(_WORD *)&v129[4] = 2048;
        *(double *)&v129[6] = v65;
        v35 = &OBJC_INSTANCE_METHODS_NSObject;
        *(_WORD *)&v129[14] = 2080;
        *(_QWORD *)&v129[16] = v68;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Reference frame (set=%d, frame=%d, size=%d, type=%d, temp=%f) written to %s\n", buf, 0x2Eu);

      }
      free(v47);
      ++v45;
      v17 = v54;
      v34 = v56;
      v32 = v118;
      if (v45 >= *v115)
        goto LABEL_68;
    }
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "refFrame", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 400);
    v79 = v32;
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v80 = __osLogPearlLib;
    else
      v80 = &_os_log_default;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v127 = "refFrame";
      *(_WORD *)&v127[8] = 2048;
      v128 = 0;
      *(_WORD *)v129 = 2080;
      *(_QWORD *)&v129[2] = "";
      *(_WORD *)&v129[10] = 2080;
      *(_QWORD *)&v129[12] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v129[20] = 1024;
      *(_DWORD *)&v129[22] = 400;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    free(v110);

    v12 = 260;
  }
  else
  {
    v75 = 0;
    v32 = 0;
    v34 = 0;
    v77 = 0;
    v12 = 0;
    v35 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_80:
    free(v11);

    v78 = v77;
LABEL_123:

  }
LABEL_124:
  entrysize = v35[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v35[418].entrysize = 0;
  }
  return v12;
}

uint64_t getSavageProvisioningData(uint64_t a1, __int128 *a2, uint64_t a3, _OWORD *a4, uint64_t a5, const void *a6, size_t a7, uint64_t a8, _QWORD *a9, _OWORD *a10, _QWORD *a11, uint64_t a12, _QWORD *a13)
{
  uint64_t v18;
  NSDictionary *v19;
  NSMutableDictionary *v20;
  NSString *v21;
  NSURL *v22;
  NSURL *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  char *v27;
  char *v28;
  char *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  _DWORD *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __objc2_meth_list *v38;
  uint64_t v39;
  __int128 v40;
  NSObject *v41;
  io_connect_t entrysize;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  NSMutableDictionary *v57;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[3];
  _QWORD v62[3];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  int v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _OWORD v76[2];

  v75 = 0u;
  memset(v76, 0, 27);
  v73 = 0u;
  v74 = 0u;
  v59 = 0;
  v60 = 75;
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savagePubKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 480);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "savagePubKey";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 480;
    goto LABEL_125;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageUID", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 482);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "savageUID";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 482;
    goto LABEL_125;
  }
  if (!a6 || !a7)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "savageFWCert && savageFWCertLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 484);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "savageFWCert && savageFWCertLength";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 484;
    goto LABEL_125;
  }
  if (!a8)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "hostPubKeyBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 485);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "hostPubKeyBuffer";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 485;
    goto LABEL_125;
  }
  if (!a9 || *a9 <= 0x37uLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 486);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v44 = __osLogPearlLib;
    else
      v44 = &_os_log_default;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v64 = "outHostPubKeyLength && (*outHostPubKeyLength >= (448 / 8))";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 486;
    goto LABEL_81;
  }
  if (!a10)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "ngidDEBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 487);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "ngidDEBuffer";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 487;
    goto LABEL_125;
  }
  if (!a11 || *a11 <= 0xFuLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outNGIDDELength && (*outNGIDDELength >= 16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 488);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v44 = __osLogPearlLib;
    else
      v44 = &_os_log_default;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v64 = "outNGIDDELength && (*outNGIDDELength >= 16)";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 488;
    goto LABEL_81;
  }
  if (!a12)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "kcvBuffer", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 489);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v45 = __osLogPearlLib;
    else
      v45 = &_os_log_default;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      goto LABEL_126;
    *(_DWORD *)buf = 136316162;
    v64 = "kcvBuffer";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 489;
LABEL_125:
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_126:
    v31 = 258;
    goto LABEL_57;
  }
  if (!a13 || *a13 <= 2uLL)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outKCVLength && (*outKCVLength >= 3)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 490);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v44 = __osLogPearlLib;
    else
      v44 = &_os_log_default;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      goto LABEL_82;
    *(_DWORD *)buf = 136316162;
    v64 = "outKCVLength && (*outKCVLength >= 3)";
    v65 = 2048;
    v66 = 0;
    v67 = 2080;
    v68 = "";
    v69 = 2080;
    v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v71 = 1024;
    v72 = 490;
LABEL_81:
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_82:
    v31 = 265;
    goto LABEL_57;
  }
  v18 = sub_100018734();
  if ((_DWORD)v18)
  {
    v31 = v18;
    v46 = (int)v18;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v18, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 494);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v47 = __osLogPearlLib;
    else
      v47 = &_os_log_default;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v64 = "err == 0 ";
      v65 = 2048;
      v66 = v46;
      v67 = 2080;
      v68 = "";
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v71 = 1024;
      v72 = 494;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_57;
  }
  v61[0] = CFSTR("GetCombined");
  v61[1] = CFSTR("StripImg4");
  v62[0] = &__kCFBooleanTrue;
  v62[1] = &__kCFBooleanFalse;
  v61[2] = CFSTR("VerifyData");
  v62[2] = &__kCFBooleanFalse;
  v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v20 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19);

  if (a1)
  {
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@"), a1, CFSTR("/System/Library/Caches/com.apple.factorydata"));
    if (v21)
    {
      v22 = +[NSURL URLWithString:](NSURL, "URLWithString:", v21);
      if (v22)
      {
        v23 = v22;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v22, CFSTR("DataDirectory"));

        goto LABEL_19;
      }
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fileURL", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 511);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v38 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib)
        v56 = __osLogPearlLib;
      else
        v56 = &_os_log_default;
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
LABEL_203:

        v31 = 261;
        goto LABEL_57;
      }
      *(_DWORD *)buf = 136316162;
      v64 = "fileURL";
      v65 = 2048;
      v66 = 0;
      v67 = 2080;
      v68 = "";
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v71 = 1024;
      v72 = 511;
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pathString", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 509);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v38 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib)
        v56 = __osLogPearlLib;
      else
        v56 = &_os_log_default;
      if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        goto LABEL_203;
      *(_DWORD *)buf = 136316162;
      v64 = "pathString";
      v65 = 2048;
      v66 = 0;
      v67 = 2080;
      v68 = "";
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v71 = 1024;
      v72 = 509;
    }
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_203;
  }
LABEL_19:
  v24 = (void *)AMFDRSealingMapCopyLocalDataForClass(CFSTR("pspc"), v20, &v59);
  fprintf(__stderrp, "%s: Loading PSPC from FDR.\n", "getSavageProvisioningData");
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v25 = __osLogPearlLib;
  else
    v25 = &_os_log_default;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v64 = "getSavageProvisioningData";
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Loading PSPC from FDR.\n", buf, 0xCu);
  }
  if (v24)
  {
    fprintf(__stderrp, "%s: PSPC data found.\n", "getSavageProvisioningData");
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v26 = __osLogPearlLib;
    else
      v26 = &_os_log_default;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v64 = "getSavageProvisioningData";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: PSPC data found.\n", buf, 0xCu);
    }
    v27 = (char *)objc_msgSend(v24, "length") + 9;
    v28 = (char *)calloc((size_t)v27, 1uLL);
    if (v28)
    {
      v29 = v28;
      v57 = v20;
      bzero(v28, (size_t)v27);
      *(_DWORD *)v29 = 1048579;
      v29[4] = 0;
      *(_DWORD *)(v29 + 5) = objc_msgSend(v24, "length");
      v30 = objc_retainAutorelease(v24);
      memcpy(v29 + 9, objc_msgSend(v30, "bytes"), *(unsigned int *)(v29 + 5));
      v31 = sub_1000189F0(dword_100038D10, 36, 0, v29, (size_t)v27, 0, 0);
      if ((_DWORD)v31)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v31, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 535);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v38 = &OBJC_INSTANCE_METHODS_NSObject;
        if (__osLogPearlLib)
          v50 = __osLogPearlLib;
        else
          v50 = &_os_log_default;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v64 = "err == 0 ";
          v65 = 2048;
          v66 = (int)v31;
          v67 = 2080;
          v68 = "";
          v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v71 = 1024;
          v72 = 535;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        goto LABEL_56;
      }
      fprintf(__stderrp, "%s: PSPC data loaded to SEP.\n", "getSavageProvisioningData");
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v32 = __osLogPearlLib;
      else
        v32 = &_os_log_default;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v64 = "getSavageProvisioningData";
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s: PSPC data loaded to SEP.\n", buf, 0xCu);
      }
      if (a7 >= 0xFFFFFFFFFFFFFFB4)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a7 >= 0xFFFFFFFFFFFFFFB4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 541);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        v38 = &OBJC_INSTANCE_METHODS_NSObject;
        if (__osLogPearlLib)
          v51 = __osLogPearlLib;
        else
          v51 = &_os_log_default;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v64 = "err == 0 ";
          v65 = 2048;
          v66 = a7 >= 0xFFFFFFFFFFFFFFB4;
          v67 = 2080;
          v68 = "";
          v69 = 2080;
          v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v71 = 1024;
          v72 = 541;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v31 = 1;
      }
      else
      {
        v33 = (char *)calloc(a7 + 76, 1uLL);
        if (!v33)
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 544);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          v38 = &OBJC_INSTANCE_METHODS_NSObject;
          if (__osLogPearlLib)
            v52 = __osLogPearlLib;
          else
            v52 = &_os_log_default;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v64 = "inData";
            v65 = 2048;
            v66 = 0;
            v67 = 2080;
            v68 = "";
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v71 = 1024;
            v72 = 544;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v31 = 260;
          goto LABEL_56;
        }
        v34 = v33;
        v35 = *a2;
        v36 = a2[1];
        v37 = a2[2];
        *((_QWORD *)v33 + 6) = *((_QWORD *)a2 + 6);
        *((_OWORD *)v33 + 1) = v36;
        *((_OWORD *)v33 + 2) = v37;
        *(_OWORD *)v33 = v35;
        *(_OWORD *)(v33 + 56) = *a4;
        memcpy(v33 + 76, a6, a7);
        v34[18] = a7;
        v38 = &OBJC_INSTANCE_METHODS_NSObject;
        v39 = sub_1000189F0(dword_100038D10, 2, 0, v34, a7 + 76, &v73, &v60);
        if ((_DWORD)v39)
        {
          v31 = v39;
          v53 = (int)v39;
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v39, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 556);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v54 = __osLogPearlLib;
          else
            v54 = &_os_log_default;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v64 = "err == 0 ";
            v65 = 2048;
            v66 = v53;
            v67 = 2080;
            v68 = "";
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v71 = 1024;
            v72 = 556;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
        }
        else if (v60 == 75)
        {
          *a9 = 56;
          v40 = v74;
          *(_OWORD *)a8 = v73;
          *(_OWORD *)(a8 + 16) = v40;
          *(_OWORD *)(a8 + 32) = v75;
          *(_QWORD *)(a8 + 48) = *(_QWORD *)&v76[0];
          *a11 = 16;
          *a10 = *(_OWORD *)((char *)v76 + 8);
          *a13 = 3;
          *(_WORD *)a12 = WORD4(v76[1]);
          *(_BYTE *)(a12 + 2) = BYTE10(v76[1]);
          fprintf(__stderrp, "%s: Successfully got provisioning data.\n", "getSavageProvisioningData");
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v41 = __osLogPearlLib;
          else
            v41 = &_os_log_default;
          v31 = 0;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v64 = "getSavageProvisioningData";
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s: Successfully got provisioning data.\n", buf, 0xCu);
            v31 = 0;
          }
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(outData)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 557);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v55 = __osLogPearlLib;
          else
            v55 = &_os_log_default;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v64 = "replySize == sizeof(outData)";
            v65 = 2048;
            v66 = 0;
            v67 = 2080;
            v68 = "";
            v69 = 2080;
            v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v71 = 1024;
            v72 = 557;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v31 = 261;
        }
        free(v34);
      }
      v20 = v57;
LABEL_56:
      free(v29);

      goto LABEL_57;
    }
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "fdrInput", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 525);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v49 = __osLogPearlLib;
    else
      v49 = &_os_log_default;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v64 = "fdrInput";
      v65 = 2048;
      v66 = 0;
      v67 = 2080;
      v68 = "";
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v71 = 1024;
      v72 = 525;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    v31 = 260;
  }
  else
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "pspcData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 519);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v38 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v48 = __osLogPearlLib;
    else
      v48 = &_os_log_default;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v64 = "pspcData";
      v65 = 2048;
      v66 = 0;
      v67 = 2080;
      v68 = "";
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v71 = 1024;
      v72 = 519;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }

    v31 = 259;
  }
LABEL_57:
  entrysize = v38[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v38[418].entrysize = 0;
  }
  return v31;
}

uint64_t checkSavageProvisioning(_DWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning\n", buf, 2u);
  }
  v15 = 0;
  v14 = 1;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "provisioningStatus", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 598);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v8 = __osLogPearlLib;
    else
      v8 = &_os_log_default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "provisioningStatus";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 598;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v6 = 258;
    goto LABEL_53;
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v9 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 601);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = &_os_log_default;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v9;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 601;
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  v4 = sub_1000189F0(dword_100038D10, 11, 0, 0, 0, &v15, &v14);
  if ((_DWORD)v4)
  {
    v6 = v4;
    v11 = (int)v4;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 604);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = &_os_log_default;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 604;
    goto LABEL_44;
  }
  if (v14 == 1)
  {
    *a1 = v15;
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkSavageProvisioning -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_19;
  }
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(status)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 605);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v12 = __osLogPearlLib;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "replySize == sizeof(status)";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 605;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v6 = 261;
LABEL_53:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v13 = __osLogPearlLibTrace;
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "checkSavageProvisioning -> %d\n", buf, 8u);
  }
LABEL_19:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t getPearlSelfTestResult(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult\n", buf, 2u);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outResult", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 626);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v8 = __osLogPearlLib;
    else
      v8 = &_os_log_default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "outResult";
      v18 = 2048;
      v19 = 0;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 626;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v6 = 258;
    goto LABEL_53;
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v9 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 629);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = &_os_log_default;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v9;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 629;
LABEL_44:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_53;
  }
  v14 = 8;
  v15 = 0;
  v4 = sub_1000189F0(dword_100038D10, 58, 0, 0, 0, &v15, &v14);
  if ((_DWORD)v4)
  {
    v6 = v4;
    v11 = (int)v4;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 635);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v10 = __osLogPearlLib;
    else
      v10 = &_os_log_default;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_53;
    *(_DWORD *)buf = 136316162;
    v17 = "err == 0 ";
    v18 = 2048;
    v19 = v11;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 635;
    goto LABEL_44;
  }
  if (v14 == 8)
  {
    *a1 = v15;
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "getPearlSelfTestResult -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_19;
  }
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "size == sizeof(response)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 636);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v12 = __osLogPearlLib;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v17 = "size == sizeof(response)";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v24 = 1024;
    v25 = 636;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v6 = 263;
LABEL_53:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v13 = __osLogPearlLibTrace;
  else
    v13 = &_os_log_default;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v17) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "getPearlSelfTestResult -> %d\n", buf, 8u);
  }
LABEL_19:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t simulateSelfTestFailure(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[2];
  int v13;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure\n", buf, 2u);
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 658);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = &_os_log_default;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v16 = "err == 0 ";
    v17 = 2048;
    v18 = v8;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v23 = 1024;
    v24 = 658;
    goto LABEL_34;
  }
  v12[0] = -1;
  v12[1] = -1;
  v13 = -1;
  v14 = a1;
  v4 = sub_1000189F0(dword_100038D10, 44, 0, v12, 0x18uLL, 0, 0);
  if (!(_DWORD)v4)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "simulateSelfTestFailure -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_17;
  }
  v6 = v4;
  v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 664);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v9 = __osLogPearlLib;
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v16 = "err == 0 ";
    v17 = 2048;
    v18 = v10;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v23 = 1024;
    v24 = 664;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "simulateSelfTestFailure -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t checkSecureStreaming()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v6;
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v0 = __osLogPearlLibTrace;
  else
    v0 = &_os_log_default;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "checkSecureStreaming\n", buf, 2u);
  }
  v1 = checkSecureStreamingAndVerifySignatures(0);
  if ((_DWORD)v1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 684);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v6 = __osLogPearlLib;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v9 = "err == 0 ";
      v10 = 2048;
      v11 = (int)v1;
      v12 = 2080;
      v13 = "";
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v16 = 1024;
      v17 = 684;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v7 = __osLogPearlLibTrace;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v9) = v1;
      v3 = v7;
      v4 = OS_LOG_TYPE_ERROR;
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v2 = __osLogPearlLibTrace;
    else
      v2 = &_os_log_default;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v9) = 0;
      v3 = v2;
      v4 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "checkSecureStreaming -> %d\n", buf, 8u);
    }
  }
  return v1;
}

uint64_t checkSecureStreamingAndVerifySignatures(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures (%u)\n", buf, 8u);
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 703);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = &_os_log_default;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v8;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 703;
    goto LABEL_34;
  }
  v4 = sub_1000189F0(dword_100038D10, 59, a1, 0, 0, 0, 0);
  if (!(_DWORD)v4)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_17;
  }
  v6 = v4;
  v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 706);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v9 = __osLogPearlLib;
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v10;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 706;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "checkSecureStreamingAndVerifySignatures -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t prewarmCamera(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "prewarmCamera (%u)\n", buf, 8u);
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 726);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = &_os_log_default;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v8;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 726;
    goto LABEL_34;
  }
  v4 = sub_1000189F0(dword_100038D10, 43, a1, 0, 0, 0, 0);
  if (!(_DWORD)v4)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "prewarmCamera -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_17;
  }
  v6 = v4;
  v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 729);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v9 = __osLogPearlLib;
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v13 = "err == 0 ";
    v14 = 2048;
    v15 = v10;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 729;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "prewarmCamera -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t setEntitlementOverride(int a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  v12 = a1;
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig (0x%x)\n", buf, 8u);
  }
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 749);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = &_os_log_default;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v8;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 749;
    goto LABEL_34;
  }
  v4 = sub_1000189F0(dword_100038D10, 64, 0, &v12, 4uLL, 0, 0);
  if (!(_DWORD)v4)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_17;
  }
  v6 = v4;
  v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 752);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v9 = __osLogPearlLib;
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "err == 0 ";
    v15 = 2048;
    v16 = v10;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v21 = 1024;
    v22 = 752;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v14) = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "setEntitlementOverrideConfig -> %d\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t pearlSeaCookieHandleMessage(int a1, const void *a2, size_t a3, void *a4, _QWORD *a5, id a6)
{
  __objc2_meth_list *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  _BYTE *v17;
  __objc2_meth_list *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  io_connect_t entrysize;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[44];

  v41 = a6;
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v43 = a1;
    *(_WORD *)&v43[4] = 2048;
    *(_QWORD *)&v43[6] = a2;
    *(_WORD *)&v43[14] = 2048;
    *(_QWORD *)&v43[16] = a3;
    *(_WORD *)&v43[24] = 2048;
    *(_QWORD *)&v43[26] = a4;
    *(_WORD *)&v43[34] = 2048;
    *(_QWORD *)&v43[36] = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage %d %p %zu %p %p\n", buf, 0x30u);
  }
  if (a1 && a1 != 7)
  {
    if (!a2)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 776);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v18 = &OBJC_INSTANCE_METHODS_NSObject;
      v20 = v41;
      if (__osLogPearlLib)
        v29 = __osLogPearlLib;
      else
        v29 = &_os_log_default;
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_110;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || message";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 776;
      goto LABEL_109;
    }
    if (!a3)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 777);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v40 = __osLogPearlLib;
      else
        v40 = &_os_log_default;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieMessageS0) || (type == kPearlFactorySeaCookieGenerateNonce) || messageSize";
        *(_WORD *)&v43[8] = 2048;
        *(_QWORD *)&v43[10] = 0;
        *(_WORD *)&v43[18] = 2080;
        *(_QWORD *)&v43[20] = "";
        *(_WORD *)&v43[28] = 2080;
        *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        *(_WORD *)&v43[38] = 1024;
        *(_DWORD *)&v43[40] = 777;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v17 = 0;
      v26 = 258;
      goto LABEL_71;
    }
  }
  if (a1 != 8 && !a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 778);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v20 = v41;
    if (__osLogPearlLib)
      v29 = __osLogPearlLib;
    else
      v29 = &_os_log_default;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || reply";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 778;
    goto LABEL_109;
  }
  if (a1 != 8 && !a5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 779);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v20 = v41;
    if (__osLogPearlLib)
      v29 = __osLogPearlLib;
    else
      v29 = &_os_log_default;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_110;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "(type == kPearlFactorySeaCookieValidateTatsuTicket) || replySize";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = 0;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 779;
LABEL_109:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_110:
    v17 = 0;
    v26 = 258;
    goto LABEL_129;
  }
  if (a5)
    v13 = *a5;
  else
    v13 = 0;
  v14 = sub_100018734();
  if ((_DWORD)v14)
  {
    v26 = v14;
    v30 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 786);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v31 = __osLogPearlLib;
    else
      v31 = &_os_log_default;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = v30;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 786;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
LABEL_71:
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_119:
    v20 = v41;
    goto LABEL_129;
  }
  v15 = a3 + 13;
  if (a3 >= 0xFFFFFFFFFFFFFFF3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", a3 >= 0xFFFFFFFFFFFFFFF3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 789);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v32 = __osLogPearlLib;
    else
      v32 = &_os_log_default;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "err == 0 ";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = a3 >= 0xFFFFFFFFFFFFFFF3;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 789;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
    v26 = 1;
    goto LABEL_119;
  }
  v16 = (char *)malloc(a3 + 13);
  if (!v16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "inData", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 792);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v18 = &OBJC_INSTANCE_METHODS_NSObject;
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    v26 = 3758097085;
    if (__osLogPearlLib)
      v33 = __osLogPearlLib;
    else
      v33 = &_os_log_default;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "inData";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 792;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v17 = 0;
    goto LABEL_119;
  }
  v17 = v16;
  *(_DWORD *)v16 = a1;
  v16[4] = 1;
  *(_QWORD *)(v16 + 5) = a3;
  memcpy(v16 + 13, a2, a3);
  v18 = &OBJC_INSTANCE_METHODS_NSObject;
  v19 = sub_1000189F0(dword_100038D10, 70, 0, v17, a3 + 13, a4, a5);
  if ((_DWORD)v19)
  {
    v26 = v19;
    v34 = (int)v19;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v19, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 800);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v35 = __osLogPearlLib;
    else
      v35 = &_os_log_default;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = v34;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 800;
    goto LABEL_127;
  }
  v20 = v41;
  if (a1 == 2)
    goto LABEL_27;
  if (a1 != 5)
    goto LABEL_28;
  if (!v41)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "callback", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 804);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    v11 = &OBJC_INSTANCE_METHODS_NSObject;
    if (__osLogPearlLib)
      v37 = __osLogPearlLib;
    else
      v37 = &_os_log_default;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v43 = "callback";
      *(_WORD *)&v43[8] = 2048;
      *(_QWORD *)&v43[10] = 0;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = "";
      *(_WORD *)&v43[28] = 2080;
      *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      *(_WORD *)&v43[38] = 1024;
      *(_DWORD *)&v43[40] = 804;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    v26 = 258;
    goto LABEL_119;
  }
  v21 = (*((uint64_t (**)(id, _QWORD, void *, _QWORD))v41 + 2))(v41, 0, a4, *a5);
  if (!(_DWORD)v21)
  {
LABEL_27:
    v17[4] = 0;
    *a5 = v13;
    v22 = sub_1000189F0(dword_100038D10, 70, 0, v17, v15, a4, a5);
    if (!(_DWORD)v22)
    {
LABEL_28:
      if (a4 && a5)
      {
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = &_os_log_default;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *a5;
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v43 = a1;
          *(_WORD *)&v43[4] = 2048;
          *(_QWORD *)&v43[6] = v24;
          *(_WORD *)&v43[14] = 1040;
          *(_DWORD *)&v43[16] = v24;
          *(_WORD *)&v43[20] = 2096;
          *(_QWORD *)&v43[22] = a4;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d reply[%zu] %.*P\n", buf, 0x22u);
        }
      }
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLibTrace)
        v25 = __osLogPearlLibTrace;
      else
        v25 = &_os_log_default;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v43 = a1;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
      }
      v26 = 0;
LABEL_45:
      free(v17);
      goto LABEL_46;
    }
    v26 = v22;
    v36 = (int)v22;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v22, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 814);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v35 = __osLogPearlLib;
    else
      v35 = &_os_log_default;
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      goto LABEL_128;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "err == 0 ";
    *(_WORD *)&v43[8] = 2048;
    *(_QWORD *)&v43[10] = v36;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = "";
    *(_WORD *)&v43[28] = 2080;
    *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    *(_WORD *)&v43[38] = 1024;
    *(_DWORD *)&v43[40] = 814;
    goto LABEL_127;
  }
  v26 = v21;
  v38 = (int)v21;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v21, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 807);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v35 = __osLogPearlLib;
  else
    v35 = &_os_log_default;
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    goto LABEL_128;
  *(_DWORD *)buf = 136316162;
  *(_QWORD *)v43 = "err == 0 ";
  *(_WORD *)&v43[8] = 2048;
  *(_QWORD *)&v43[10] = v38;
  *(_WORD *)&v43[18] = 2080;
  *(_QWORD *)&v43[20] = "";
  *(_WORD *)&v43[28] = 2080;
  *(_QWORD *)&v43[30] = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
  *(_WORD *)&v43[38] = 1024;
  *(_DWORD *)&v43[40] = 807;
LABEL_127:
  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_128:
  v18 = &OBJC_INSTANCE_METHODS_NSObject;
  v20 = v41;
  v11 = &OBJC_INSTANCE_METHODS_NSObject;
LABEL_129:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (v11[420])
    v39 = v11[420];
  else
    v39 = &_os_log_default;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v43 = a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "pearlSeaCookieHandleMessage, type=%d -> 0x%x\n", buf, 0xEu);
  }
  if (v17)
    goto LABEL_45;
LABEL_46:
  entrysize = v18[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v18[418].entrysize = 0;
  }

  return v26;
}

uint64_t mapScheme3ObjectToISPANE(int *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  char v13;
  uint8_t buf[4];
  _BYTE v15[18];
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v2 = __osLogPearlLibTrace;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)v15 = 4;
    *(_WORD *)&v15[4] = 2080;
    *(_QWORD *)&v15[6] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "mapScheme3Object: fourcc:%.4s\n\n", buf, 0x12u);
  }
  v12 = *a1;
  v13 = *((_BYTE *)a1 + 4);
  v3 = sub_100018734();
  if ((_DWORD)v3)
  {
    v6 = v3;
    v8 = (int)v3;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v3, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 842);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v9 = __osLogPearlLib;
    else
      v9 = &_os_log_default;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    *(_QWORD *)&v15[10] = v8;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 842;
    goto LABEL_34;
  }
  v4 = sub_1000189F0(dword_100038D10, 72, 0, &v12, 5uLL, 0, 0);
  if (!(_DWORD)v4)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v5 = __osLogPearlLibTrace;
    else
      v5 = &_os_log_default;
    v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "mapScheme3Object -> 0x%x\n", buf, 8u);
      v6 = 0;
    }
    goto LABEL_17;
  }
  v6 = v4;
  v10 = (int)v4;
  fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v4, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 845);
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLib)
    v9 = __osLogPearlLib;
  else
    v9 = &_os_log_default;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v15 = "err == 0 ";
    *(_WORD *)&v15[8] = 2048;
    *(_QWORD *)&v15[10] = v10;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v20 = 1024;
    v21 = 845;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
LABEL_35:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v11 = __osLogPearlLibTrace;
  else
    v11 = &_os_log_default;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "mapScheme3Object -> 0x%x\n", buf, 8u);
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  return v6;
}

uint64_t allocateAndMapObjectS3C1(int *a1, int a2, int a3)
{
  __objc2_meth_list *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __objc2_meth_list *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  const char *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  const char *v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  const char *v43;
  void *v44;
  NSObject *v45;
  const char *v46;
  const char *v47;
  void *v48;
  NSObject *v49;
  const char *v50;
  const char *v51;
  void *v52;
  NSObject *v53;
  const char *v54;
  const char *v55;
  void *v56;
  NSObject *v57;
  const char *v58;
  const char *v59;
  void *v60;
  NSObject *v61;
  const char *v62;
  void *v63;
  NSObject *v64;
  BOOL v65;
  BOOL v68;
  int v69;
  BOOL v70;
  BOOL v73;
  char v74;
  void *v75;
  io_connect_t entrysize;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  NSObject *v81;
  NSObject *v82;
  unint64_t v83;
  int v84;
  char v85;
  char v86;
  char v87;
  _BYTE v88[19];
  uint8_t buf[4];
  _BYTE v90[20];
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  v6 = &OBJC_INSTANCE_METHODS_NSObject;
  if (__osLogPearlLibTrace)
    v7 = (void *)__osLogPearlLibTrace;
  else
    v7 = &_os_log_default;
  v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v90 = 4;
    *(_WORD *)&v90[4] = 2080;
    *(_QWORD *)&v90[6] = a1;
    *(_WORD *)&v90[14] = 1024;
    *(_DWORD *)&v90[16] = a2;
    LOWORD(v91) = 1024;
    *(_DWORD *)((char *)&v91 + 2) = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1: fourcc:%.4s mapObj:%d unmapObj:%d\n\n", buf, 0x1Eu);
  }

  *(_QWORD *)v88 = 0;
  *(_QWORD *)&v88[8] = 0;
  *(_DWORD *)&v88[15] = 0;
  v84 = *a1;
  v85 = *((_BYTE *)a1 + 4);
  v86 = a2;
  v87 = a3;
  v83 = 19;
  v9 = sub_100018734();
  v10 = &OBJC_INSTANCE_METHODS_NSObject;
  if ((_DWORD)v9)
  {
    v12 = v9;
    v78 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 873);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v79 = __osLogPearlLib;
    else
      v79 = &_os_log_default;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)v90 = "err == 0 ";
      *(_WORD *)&v90[8] = 2048;
      *(_QWORD *)&v90[10] = v78;
      *(_WORD *)&v90[18] = 2080;
      v91 = "";
      v92 = 2080;
      v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v94 = 1024;
      v95 = 873;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    goto LABEL_177;
  }
  v11 = sub_1000189F0(dword_100038D10, 82, 0, &v84, 7uLL, v88, &v83);
  if ((_DWORD)v11 != -536870201)
  {
    v12 = v11;
    if ((_DWORD)v11)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v11, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 877);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v80 = (void *)__osLogPearlLib;
      else
        v80 = &_os_log_default;
      v81 = v80;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v90 = "err == 0 ";
        *(_WORD *)&v90[8] = 2048;
        *(_QWORD *)&v90[10] = (int)v12;
        *(_WORD *)&v90[18] = 2080;
        v91 = "";
        v92 = 2080;
        v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v94 = 1024;
        v95 = 877;
        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }

      v6 = &OBJC_INSTANCE_METHODS_NSObject;
    }
    if (v83 <= 0x12)
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 879);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v10 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib)
        v82 = __osLogPearlLib;
      else
        v82 = &_os_log_default;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)v90 = "replySize >= sizeof(cmd_alloc_map_s3c1_out_v1_t)";
        *(_WORD *)&v90[8] = 2048;
        *(_QWORD *)&v90[10] = 0;
        *(_WORD *)&v90[18] = 2080;
        v91 = "";
        v92 = 2080;
        v93 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v94 = 1024;
        v95 = 879;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v12 = 3758097090;
    }
    else
    {
      fwrite("Results of Allocation and Mapping Object Scheme3 Context1:\n", 0x3BuLL, 1uLL, __stderrp);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v13 = (void *)__osLogPearlLib;
      else
        v13 = &_os_log_default;
      v14 = v13;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Results of Allocation and Mapping Object Scheme3 Context1:\n", buf, 2u);
      }

      if (v88[0])
        v15 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v15 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "objectFound:\t\t%s\n", v15);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v16 = (void *)__osLogPearlLib;
      else
        v16 = &_os_log_default;
      v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[0])
          v18 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v18 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "objectFound:\t\t%s\n", buf, 0xCu);
      }

      fprintf(__stderrp, "dvaOffset:\t\t0x%X\n", *(_DWORD *)&v88[1]);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v19 = (void *)__osLogPearlLib;
      else
        v19 = &_os_log_default;
      v20 = v19;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v90 = *(_DWORD *)&v88[1];
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "dvaOffset:\t\t0x%X\n", buf, 8u);
      }

      fprintf(__stderrp, "objectSize:\t\t%d\n", *(_DWORD *)&v88[5]);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v21 = (void *)__osLogPearlLib;
      else
        v21 = &_os_log_default;
      v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v90 = *(_DWORD *)&v88[5];
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "objectSize:\t\t%d\n", buf, 8u);
      }

      if (v88[9])
        v23 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v23 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "aneMapFunction:\t\t%s\n", v23);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v24 = (void *)__osLogPearlLib;
      else
        v24 = &_os_log_default;
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[9])
          v26 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v26 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "aneMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v88[10])
        v27 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v27 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "ispMapFunction:\t\t%s\n", v27);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v28 = (void *)__osLogPearlLib;
      else
        v28 = &_os_log_default;
      v29 = v28;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[10])
          v30 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v30 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "ispMapFunction:\t\t%s\n", buf, 0xCu);
      }

      if (v88[11])
        v31 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v31 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "aneUnmapFunction:\t%s\n", v31);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v32 = (void *)__osLogPearlLib;
      else
        v32 = &_os_log_default;
      v33 = v32;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[11])
          v34 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v34 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "aneUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v88[12])
        v35 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v35 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "ispUnmapFunction:\t%s\n", v35);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v36 = (void *)__osLogPearlLib;
      else
        v36 = &_os_log_default;
      v37 = v36;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[12])
          v38 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v38 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "ispUnmapFunction:\t%s\n", buf, 0xCu);
      }

      if (v88[13])
        v39 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v39 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "mappedToSEP:\t\t%s\n", v39);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v40 = (void *)__osLogPearlLib;
      else
        v40 = &_os_log_default;
      v41 = v40;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[13])
          v42 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v42 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v42;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "mappedToSEP:\t\t%s\n", buf, 0xCu);
      }

      if (v88[14])
        v43 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v43 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "mappedToANE:\t\t%s\n", v43);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v44 = (void *)__osLogPearlLib;
      else
        v44 = &_os_log_default;
      v45 = v44;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[14])
          v46 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v46 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "mappedToANE:\t\t%s\n", buf, 0xCu);
      }

      if (v88[15])
        v47 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v47 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "mappedToISP:\t\t%s\n", v47);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v48 = (void *)__osLogPearlLib;
      else
        v48 = &_os_log_default;
      v49 = v48;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[15])
          v50 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v50 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "mappedToISP:\t\t%s\n", buf, 0xCu);
      }

      if (v88[18])
        v51 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v51 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "unmappedFromISP:\t%s\n", v51);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v52 = (void *)__osLogPearlLib;
      else
        v52 = &_os_log_default;
      v53 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[18])
          v54 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v54 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "unmappedFromISP:\t%s\n", buf, 0xCu);
      }

      if (v88[17])
        v55 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v55 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "unmappedFromANE:\t%s\n", v55);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v56 = (void *)__osLogPearlLib;
      else
        v56 = &_os_log_default;
      v57 = v56;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[17])
          v58 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v58 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v58;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "unmappedFromANE:\t%s\n", buf, 0xCu);
      }

      if (v88[16])
        v59 = "\x1B[32mSUCCESS\x1B[0m";
      else
        v59 = "\x1B[31mFAIL\x1B[0m";
      fprintf(__stderrp, "unmappedFromSEP:\t%s\n", v59);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      v10 = &OBJC_INSTANCE_METHODS_NSObject;
      if (__osLogPearlLib)
        v60 = (void *)__osLogPearlLib;
      else
        v60 = &_os_log_default;
      v61 = v60;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        if (v88[16])
          v62 = "\x1B[32mSUCCESS\x1B[0m";
        else
          v62 = "\x1B[31mFAIL\x1B[0m";
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v90 = v62;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "unmappedFromSEP:\t%s\n", buf, 0xCu);
      }

      v6 = &OBJC_INSTANCE_METHODS_NSObject;
      if (!(_DWORD)v12)
      {
        if (v88[9])
          v65 = v88[10] == 0;
        else
          v65 = 1;
        v68 = v65 || v88[13] == 0 || v88[14] == 0 || v88[15] == 0;
        v69 = a2 ^ 1;
        if (!v68)
          v69 = 1;
        if (v88[11])
          v70 = v88[12] == 0;
        else
          v70 = 1;
        v73 = v70 || v88[16] == 0 || v88[17] == 0 || v88[18] == 0;
        v74 = a3 ^ 1;
        if (!v73)
          v74 = 1;
        v12 = 261;
        if (v69 == 1 && (v74 & 1) != 0)
          goto LABEL_214;
      }
    }
LABEL_177:
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (v6[420])
      v63 = (void *)v6[420];
    else
      v63 = &_os_log_default;
    v64 = v63;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v90 = v12;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
    }
    goto LABEL_222;
  }
LABEL_214:
  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v75 = (void *)__osLogPearlLibTrace;
  else
    v75 = &_os_log_default;
  v64 = v75;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v90 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "allocateAndMapObjectS3C1 -> 0x%x\n", buf, 8u);
  }
  v12 = 0;
LABEL_222:

  entrysize = v10[418].entrysize;
  if (entrysize)
  {
    IOServiceClose(entrysize);
    v10[418].entrysize = 0;
  }
  return v12;
}

uint64_t getBrunorCollectionKey(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getBrunorCollectionKey\n", buf, 2u);
  }
  v22 = 65;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 928);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v15 = __osLogPearlLib;
    else
      v15 = &_os_log_default;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v24 = "collectionKey";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 928;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "collectionKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 929);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v15 = __osLogPearlLib;
    else
      v15 = &_os_log_default;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v24 = "collectionKeyLength";
    v25 = 2048;
    v26 = 0;
    v27 = 2080;
    v28 = "";
    v29 = 2080;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v31 = 1024;
    v32 = 929;
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    v9 = 258;
    goto LABEL_15;
  }
  v5 = sub_100018734();
  if ((_DWORD)v5)
  {
    v9 = v5;
    v16 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 932);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v17 = __osLogPearlLib;
    else
      v17 = &_os_log_default;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "err == 0 ";
      v25 = 2048;
      v26 = v16;
      v27 = 2080;
      v28 = "";
      v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v31 = 1024;
      v32 = 932;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = calloc(1uLL, 0x41uLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000189F0(dword_100038D10, 73, 0, 0, 0, v6, &v22);
      if ((_DWORD)v8)
      {
        v9 = v8;
        v19 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 938);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v20 = __osLogPearlLib;
        else
          v20 = &_os_log_default;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v24 = "err == 0 ";
          v25 = 2048;
          v26 = v19;
          v27 = 2080;
          v28 = "";
          v29 = 2080;
          v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v31 = 1024;
          v32 = 938;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        if (v22 == 65)
        {
          v9 = 0;
          *a1 = v7;
          *a2 = 65;
          goto LABEL_15;
        }
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 939);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v21 = __osLogPearlLib;
        else
          v21 = &_os_log_default;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v24 = "replySize == sizeof(cmd_get_brunor_collection_key_out_v1_t)";
          v25 = 2048;
          v26 = 0;
          v27 = 2080;
          v28 = "";
          v29 = 2080;
          v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v31 = 1024;
          v32 = 939;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v9 = 261;
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 935);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v18 = __osLogPearlLib;
      else
        v18 = &_os_log_default;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v24 = "reply";
        v25 = 2048;
        v26 = 0;
        v27 = 2080;
        v28 = "";
        v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v31 = 1024;
        v32 = 935;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v9 = 260;
    }
  }
LABEL_15:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v9)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v10 = __osLogPearlLibTrace;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v9;
      v11 = v10;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "getBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v13 = __osLogPearlLibTrace;
    else
      v13 = &_os_log_default;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = 0;
      v11 = v13;
      v12 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v9;
}

uint64_t getAttestationToBrunorCollectionKey(_QWORD *a1, size_t *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  size_t __size;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getAttestationToBrunorCollectionKey\n", buf, 2u);
  }
  __size = 0x4000;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 966);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = &_os_log_default;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    *(_DWORD *)buf = 136316162;
    v26 = "attestation";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    v34 = 966;
    goto LABEL_50;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "attestationLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 967);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = &_os_log_default;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    *(_DWORD *)buf = 136316162;
    v26 = "attestationLength";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    v34 = 967;
LABEL_50:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_51:
    v10 = 258;
    goto LABEL_17;
  }
  v5 = sub_100018734();
  if ((_DWORD)v5)
  {
    v10 = v5;
    v17 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 970);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v17;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v33 = 1024;
      v34 = 970;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = calloc(1uLL, 0x4000uLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000189F0(dword_100038D10, 74, 0, 0, 0, v6, &__size);
      if ((_DWORD)v8)
      {
        v10 = v8;
        v20 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 976);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v21 = __osLogPearlLib;
        else
          v21 = &_os_log_default;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = "err == 0 ";
          v27 = 2048;
          v28 = v20;
          v29 = 2080;
          v30 = "";
          v31 = 2080;
          v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v33 = 1024;
          v34 = 976;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else if (__size > 0x4000)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= (16 * 1024)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 977);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v22 = __osLogPearlLib;
        else
          v22 = &_os_log_default;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v26 = "replySize <= (16 * 1024)";
          v27 = 2048;
          v28 = 0;
          v29 = 2080;
          v30 = "";
          v31 = 2080;
          v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v33 = 1024;
          v34 = 977;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v10 = 261;
      }
      else
      {
        v9 = calloc(1uLL, __size);
        *a1 = v9;
        if (v9)
        {
          memcpy(v9, v7, __size);
          v10 = 0;
          *a2 = __size;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*attestation", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 980);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v23 = __osLogPearlLib;
          else
            v23 = &_os_log_default;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v26 = "*attestation";
            v27 = 2048;
            v28 = 0;
            v29 = 2080;
            v30 = "";
            v31 = 2080;
            v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v33 = 1024;
            v34 = 980;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
          }
          v10 = 260;
        }
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 973);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v19 = __osLogPearlLib;
      else
        v19 = &_os_log_default;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v26 = "reply";
        v27 = 2048;
        v28 = 0;
        v29 = 2080;
        v30 = "";
        v31 = 2080;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v33 = 1024;
        v34 = 973;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 260;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v10)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = &_os_log_default;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v10;
      v12 = v11;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getAttestationToBrunorCollectionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      v12 = v14;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v10;
}

uint64_t signDataWithBrunorCollectionKey(const void *a1, size_t a2, _QWORD *a3, size_t *a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  size_t __size;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v8 = __osLogPearlLibTrace;
  else
    v8 = &_os_log_default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorCollectionKey\n", buf, 2u);
  }
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)buf = 0u;
  __size = 128;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1005);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "data";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1005;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1006);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "dataLength";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1006;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1007);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "signature";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1007;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1008);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "signatureLength";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1008;
LABEL_64:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
LABEL_65:
    v13 = 258;
    goto LABEL_17;
  }
  v9 = sub_100018734();
  if ((_DWORD)v9)
  {
    v13 = v9;
    v20 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1011);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v20;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      v35 = 1011;
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
    }
  }
  else
  {
    v10 = sub_1000189F0(dword_100038D10, 75, 0, a1, a2, buf, &__size);
    if (!(_DWORD)v10)
    {
      if (__size >= 0x81)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1015);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = &_os_log_default;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 136316162;
          v27 = "replySize <= sizeof(reply)";
          v28 = 2048;
          v29 = 0;
          v30 = 2080;
          v31 = "";
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v34 = 1024;
          v35 = 1015;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
        }
        v13 = 261;
      }
      else
      {
        v11 = calloc(1uLL, __size);
        *a3 = v11;
        if (v11)
        {
          v12 = __size;
          *a4 = __size;
          memcpy(v11, buf, v12);
          v13 = 0;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1018);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v24 = __osLogPearlLib;
          else
            v24 = &_os_log_default;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v26 = 136316162;
            v27 = "*signature";
            v28 = 2048;
            v29 = 0;
            v30 = 2080;
            v31 = "";
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v34 = 1024;
            v35 = 1018;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
          }
          v13 = 260;
        }
      }
      goto LABEL_17;
    }
    v13 = v10;
    v22 = (int)v10;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1014);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v22;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      v35 = 1014;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v13)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 67109120;
      LODWORD(v27) = v13;
      v15 = v14;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "signDataWithBrunorCollectionKey -> %d\n", v26, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v17 = __osLogPearlLibTrace;
    else
      v17 = &_os_log_default;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 67109120;
      LODWORD(v27) = 0;
      v15 = v17;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v13;
}

uint64_t getBrunorPermanentKey(_QWORD *a1, unint64_t *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  unint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getBrunorPermanentKey\n", buf, 2u);
  }
  v23 = 57;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKey", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1040);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = &_os_log_default;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v25 = "permanentKey";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 1040;
    goto LABEL_48;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "permanentKeyLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1041);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v16 = __osLogPearlLib;
    else
      v16 = &_os_log_default;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_DWORD *)buf = 136316162;
    v25 = "permanentKeyLength";
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v32 = 1024;
    v33 = 1041;
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_49:
    v10 = 258;
    goto LABEL_15;
  }
  v5 = sub_100018734();
  if ((_DWORD)v5)
  {
    v10 = v5;
    v17 = (int)v5;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1044);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v18 = __osLogPearlLib;
    else
      v18 = &_os_log_default;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "err == 0 ";
      v26 = 2048;
      v27 = v17;
      v28 = 2080;
      v29 = "";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v32 = 1024;
      v33 = 1044;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = calloc(1uLL, 0x39uLL);
    if (v6)
    {
      v7 = v6;
      v8 = sub_1000189F0(dword_100038D10, 76, 0, 0, 0, v6, &v23);
      if ((_DWORD)v8)
      {
        v10 = v8;
        v20 = (int)v8;
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v8, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1050);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v21 = __osLogPearlLib;
        else
          v21 = &_os_log_default;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v25 = "err == 0 ";
          v26 = 2048;
          v27 = v20;
          v28 = 2080;
          v29 = "";
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v32 = 1024;
          v33 = 1050;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
      }
      else
      {
        v9 = v23;
        if (v23 < 0x3A)
        {
          v10 = 0;
          *a1 = v7;
          *a2 = v9;
          goto LABEL_15;
        }
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1051);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v22 = __osLogPearlLib;
        else
          v22 = &_os_log_default;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v25 = "replySize <= sizeof(cmd_get_brunor_permanent_key_out_v1_t)";
          v26 = 2048;
          v27 = 0;
          v28 = 2080;
          v29 = "";
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v32 = 1024;
          v33 = 1051;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        v10 = 261;
      }
      free(v7);
    }
    else
    {
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "reply", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1047);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v19 = __osLogPearlLib;
      else
        v19 = &_os_log_default;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v25 = "reply";
        v26 = 2048;
        v27 = 0;
        v28 = 2080;
        v29 = "";
        v30 = 2080;
        v31 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v32 = 1024;
        v33 = 1047;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v10 = 260;
    }
  }
LABEL_15:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v10)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v11 = __osLogPearlLibTrace;
    else
      v11 = &_os_log_default;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v10;
      v12 = v11;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getBrunorPermanentKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = 0;
      v12 = v14;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
  }
  return v10;
}

uint64_t signDataWithBrunorPermanentKey(const void *a1, size_t a2, _QWORD *a3, size_t *a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  size_t __size;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v8 = __osLogPearlLibTrace;
  else
    v8 = &_os_log_default;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "signDataWithBrunorPermanentKey\n", buf, 2u);
  }
  v40 = 0;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)buf = 0u;
  v37 = 0u;
  __size = 65;
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "data", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1079);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "data";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1079;
    goto LABEL_64;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "dataLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1080);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "dataLength";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1080;
    goto LABEL_64;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1081);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "signature";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1081;
    goto LABEL_64;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "signatureLength", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1082);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v19 = __osLogPearlLib;
    else
      v19 = &_os_log_default;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      goto LABEL_65;
    *(_DWORD *)v26 = 136316162;
    v27 = "signatureLength";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v34 = 1024;
    v35 = 1082;
LABEL_64:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
LABEL_65:
    v13 = 258;
    goto LABEL_17;
  }
  v9 = sub_100018734();
  if ((_DWORD)v9)
  {
    v13 = v9;
    v20 = (int)v9;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v9, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1085);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v20;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      v35 = 1085;
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
    }
  }
  else
  {
    v10 = sub_1000189F0(dword_100038D10, 77, 0, a1, a2, buf, &__size);
    if (!(_DWORD)v10)
    {
      if (__size >= 0x42)
      {
        fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "replySize <= sizeof(reply)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1089);
        if (qword_100038D18 != -1)
          dispatch_once(&qword_100038D18, &stru_100030C50);
        if (__osLogPearlLib)
          v23 = __osLogPearlLib;
        else
          v23 = &_os_log_default;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 136316162;
          v27 = "replySize <= sizeof(reply)";
          v28 = 2048;
          v29 = 0;
          v30 = 2080;
          v31 = "";
          v32 = 2080;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
          v34 = 1024;
          v35 = 1089;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
        }
        v13 = 261;
      }
      else
      {
        v11 = calloc(1uLL, __size);
        *a3 = v11;
        if (v11)
        {
          v12 = __size;
          *a4 = __size;
          memcpy(v11, buf, v12);
          v13 = 0;
        }
        else
        {
          fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "*signature", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1092);
          if (qword_100038D18 != -1)
            dispatch_once(&qword_100038D18, &stru_100030C50);
          if (__osLogPearlLib)
            v24 = __osLogPearlLib;
          else
            v24 = &_os_log_default;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v26 = 136316162;
            v27 = "*signature";
            v28 = 2048;
            v29 = 0;
            v30 = 2080;
            v31 = "";
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
            v34 = 1024;
            v35 = 1092;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v26, 0x30u);
          }
          v13 = 260;
        }
      }
      goto LABEL_17;
    }
    v13 = v10;
    v22 = (int)v10;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v10, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1088);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 136316162;
      v27 = "err == 0 ";
      v28 = 2048;
      v29 = v22;
      v30 = 2080;
      v31 = "";
      v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v34 = 1024;
      v35 = 1088;
      goto LABEL_80;
    }
  }
LABEL_17:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v13)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v14 = __osLogPearlLibTrace;
    else
      v14 = &_os_log_default;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 67109120;
      LODWORD(v27) = v13;
      v15 = v14;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "signDataWithBrunorPermanentKey -> %d\n", v26, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v17 = __osLogPearlLibTrace;
    else
      v17 = &_os_log_default;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v26 = 67109120;
      LODWORD(v27) = 0;
      v15 = v17;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_34;
    }
  }
  return v13;
}

uint64_t prepareFDRDataEncryptionKey()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *v6;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v0 = __osLogPearlLibTrace;
  else
    v0 = &_os_log_default;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "prepareFDRDataEncryptionKey\n", buf, 2u);
  }
  v1 = sub_100018734();
  if ((_DWORD)v1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v1, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1112);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v8 = __osLogPearlLib;
    else
      v8 = &_os_log_default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v13 = "err == 0 ";
      v14 = 2048;
      v15 = (int)v1;
      v16 = 2080;
      v17 = "";
      v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v20 = 1024;
      v21 = 1112;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v2 = sub_1000189F0(dword_100038D10, 78, 0, 0, 0, 0, 0);
    if ((_DWORD)v2)
    {
      v9 = v2;
      v10 = (int)v2;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v2, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1115);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v11 = __osLogPearlLib;
      else
        v11 = &_os_log_default;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = "err == 0 ";
        v14 = 2048;
        v15 = v10;
        v16 = 2080;
        v17 = "";
        v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v20 = 1024;
        v21 = 1115;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v1 = v9;
    }
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v1)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v3 = __osLogPearlLibTrace;
    else
      v3 = &_os_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = v1;
      v4 = v3;
      v5 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "prepareFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v6 = __osLogPearlLibTrace;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v13) = 0;
      v4 = v6;
      v5 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v1;
}

uint64_t setDummyWrappedFDRDataEncryptionKey(const void *a1, size_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v4 = __osLogPearlLibTrace;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "setDummyWrappedFDRDataEncryptionKey\n", buf, 2u);
  }
  v5 = sub_100018734();
  if ((_DWORD)v5)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v5, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1132);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v12 = __osLogPearlLib;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v17 = "err == 0 ";
      v18 = 2048;
      v19 = (int)v5;
      v20 = 2080;
      v21 = "";
      v22 = 2080;
      v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v24 = 1024;
      v25 = 1132;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v6 = sub_1000189F0(dword_100038D10, 79, 0, a1, a2, 0, 0);
    if ((_DWORD)v6)
    {
      v13 = v6;
      v14 = (int)v6;
      fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v6, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1135);
      if (qword_100038D18 != -1)
        dispatch_once(&qword_100038D18, &stru_100030C50);
      if (__osLogPearlLib)
        v15 = __osLogPearlLib;
      else
        v15 = &_os_log_default;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = "err == 0 ";
        v18 = 2048;
        v19 = v14;
        v20 = 2080;
        v21 = "";
        v22 = 2080;
        v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
        v24 = 1024;
        v25 = 1135;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
      v5 = v13;
    }
  }
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v5)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v7 = __osLogPearlLibTrace;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = v5;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "setDummyWrappedFDRDataEncryptionKey -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v10 = __osLogPearlLibTrace;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v5;
}

uint64_t encryptFDRDataForBrunor(const char *a1, size_t a2, uint64_t a3, char *a4, _OWORD *a5, uint64_t a6)
{
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  NSObject *v21;
  size_t v22;
  NSObject *v23;
  size_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  size_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  _OWORD *v34;
  __int16 v35;
  uint64_t v36;

  if (qword_100038D18 != -1)
    dispatch_once(&qword_100038D18, &stru_100030C50);
  if (__osLogPearlLibTrace)
    v12 = __osLogPearlLibTrace;
  else
    v12 = &_os_log_default;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    v26 = a1;
    v27 = 2048;
    v28 = a2;
    v29 = 2048;
    v30 = (const char *)a3;
    v31 = 2048;
    v32 = a4;
    v33 = 2048;
    v34 = a5;
    v35 = 2048;
    v36 = a6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "encryptFDRDataForBrunor %p %zu %p %p %p %zu\n", buf, 0x3Eu);
  }
  if (!a1)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1152);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v26 = "PSD2";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    LODWORD(v34) = 1152;
    goto LABEL_87;
  }
  if (!a2)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD2Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1153);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v26 = "PSD2Length";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    LODWORD(v34) = 1153;
    goto LABEL_87;
  }
  if (!a3)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1154);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v26 = "PSD3";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    LODWORD(v34) = 1154;
    goto LABEL_87;
  }
  if (!a4)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "outPSD3Length", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1155);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v26 = "outPSD3Length";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    LODWORD(v34) = 1155;
    goto LABEL_87;
  }
  if (a5 && a6 != 16)
  {
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "PSD3MACLength == (16)", 0, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1160);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v21 = __osLogPearlLib;
    else
      v21 = &_os_log_default;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_88;
    *(_DWORD *)buf = 136316162;
    v26 = "PSD3MACLength == (16)";
    v27 = 2048;
    v28 = 0;
    v29 = 2080;
    v30 = "";
    v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
    v33 = 1024;
    LODWORD(v34) = 1160;
LABEL_87:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_88:
    v15 = 258;
    goto LABEL_18;
  }
  v13 = sub_100018734();
  if ((_DWORD)v13)
  {
    v15 = v13;
    v22 = (int)v13;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v13, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1164);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v23 = __osLogPearlLib;
    else
      v23 = &_os_log_default;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v22;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v33 = 1024;
      LODWORD(v34) = 1164;
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else
  {
    v14 = sub_1000189F0(dword_100038D10, 80, 0, a1, a2, (void *)a3, a4);
    if (!(_DWORD)v14)
    {
      v15 = 0;
      if (a5)
        *a5 = *(_OWORD *)(a3 + 108);
      goto LABEL_18;
    }
    v15 = v14;
    v24 = (int)v14;
    fprintf(__stderrp, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", "err == 0 ", (int)v14, "", "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m", 1167);
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLib)
      v23 = __osLogPearlLib;
    else
      v23 = &_os_log_default;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "err == 0 ";
      v27 = 2048;
      v28 = v24;
      v29 = 2080;
      v30 = "";
      v31 = 2080;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Pearl_Kernel/PearlFactoryLib/PearlFactoryLib.m";
      v33 = 1024;
      LODWORD(v34) = 1167;
      goto LABEL_79;
    }
  }
LABEL_18:
  if (dword_100038D10)
  {
    IOServiceClose(dword_100038D10);
    dword_100038D10 = 0;
  }
  if ((_DWORD)v15)
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v16 = __osLogPearlLibTrace;
    else
      v16 = &_os_log_default;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      v17 = v16;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "encryptFDRDataForBrunor -> %d\n", buf, 8u);
    }
  }
  else
  {
    if (qword_100038D18 != -1)
      dispatch_once(&qword_100038D18, &stru_100030C50);
    if (__osLogPearlLibTrace)
      v19 = __osLogPearlLibTrace;
    else
      v19 = &_os_log_default;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = 0;
      v17 = v19;
      v18 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_35;
    }
  }
  return v15;
}

void sub_100024F7C(id a1)
{
  os_log_t v1;
  void *v2;
  void *v3;

  v1 = os_log_create("com.apple.BiometricKit", "Library-PearlFactory");
  v2 = (void *)__osLogPearlLib;
  __osLogPearlLib = (uint64_t)v1;

  v3 = (void *)__osLogPearlLib;
  if (!__osLogPearlLib)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100024FEC();
    v3 = (void *)__osLogPearlLib;
  }
  objc_storeStrong((id *)&__osLogPearlLibTrace, v3);
}

void sub_100024FEC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-PearlFactory'!\n", v0, 2u);
}

void sub_100025030(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(char *)(a1 - 1) < 0)
      operator delete(*(void **)(a1 - 24));
    if (*(char *)(a1 - 25) < 0)
      operator delete(*(void **)(a1 - 48));
    if (*(char *)(a1 - 49) < 0)
      operator delete(*(void **)(a1 - 72));
    if (*(char *)(a1 - 73) < 0)
      operator delete(*(void **)(a1 - 96));
    a1 -= 104;
  }
  while (a1 != a2);
}

void sub_10002509C(uint64_t a1, void **a2, void **a3)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*a2);
  if (*(char *)(a1 + 47) < 0)
    operator delete(*a3);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_ConfigDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ConfigDevice:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_checkConnectivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkConnectivity");
}

id objc_msgSend_compare_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:range:");
}

id objc_msgSend_configurationTimeForStreamInSec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationTimeForStreamInSec");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_diagnosticCasesMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticCasesMask");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableAttentionDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableAttentionDetection");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_finalizingWithErrorStatusCode_andInfoString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizingWithErrorStatusCode:andInfoString:");
}

id objc_msgSend_finalizingWithStatusCode_andFinalizingCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizingWithStatusCode:andFinalizingCode:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getConfigurationForCaseMask_returnedConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConfigurationForCaseMask:returnedConfiguration:");
}

id objc_msgSend_getPLEUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPLEUUID:");
}

id objc_msgSend_getPearlProjectorHWVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPearlProjectorHWVersion:");
}

id objc_msgSend_getRigelInfo_serialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRigelInfo:serialNumber:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isPortTypeFrontIRDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPortTypeFrontIRDetected");
}

id objc_msgSend_isPortTypeFrontRgbDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPortTypeFrontRgbDetected");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preemtingWaitInMicroSec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preemtingWaitInMicroSec");
}

id objc_msgSend_produceGeneralFailurForDiagnosticConfiguration_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "produceGeneralFailurForDiagnosticConfiguration:withString:");
}

id objc_msgSend_produceStatusForDiagnosticConfigurationDetailsOnFailureOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "produceStatusForDiagnosticConfigurationDetailsOnFailureOnly:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_restoreAttentionDetection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAttentionDetection");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setResultBitMaskStatus_andState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultBitMaskStatus:andState:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_startStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startStreaming");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopStreaming");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_terminateComunication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateComunication");
}

id objc_msgSend_useADControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useADControl");
}

id objc_msgSend_useHighPriority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useHighPriority");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
