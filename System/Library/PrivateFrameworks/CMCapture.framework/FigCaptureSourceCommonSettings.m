@implementation FigCaptureSourceCommonSettings

- (BOOL)realtimeFSDNetSupported
{
  return self->_realtimeFSDNetSupported;
}

- (BOOL)variableFrameRateVideoCaptureFromFWSupported
{
  return self->_variableFrameRateVideoCaptureFromFWSupported;
}

- (float)livePhotoJPEGIntermediateCompressionRatioDefaultOverride
{
  return self->_livePhotoJPEGIntermediateCompressionRatioDefaultOverride;
}

- (int)previewRegistrationType
{
  return self->_previewRegistrationType;
}

- (BOOL)previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled
{
  return self->_previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled;
}

- (BOOL)livePhotoVitalityScoringSupported
{
  return self->_livePhotoVitalityScoringSupported;
}

- (BOOL)videoStabilizationAdaptiveOverscanSupported
{
  return self->_videoStabilizationAdaptiveOverscanSupported;
}

- (_DWORD)initWithCommonSettingsDictionary:(void *)a1
{
  _DWORD *v3;
  int v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)FigCaptureSourceCommonSettings;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    v3[2] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("initialMemoryPoolSizeMB")), "intValue");
    *((_BYTE *)v3 + 12) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("livePhotoVitalityScoringSupported")), "BOOLValue");
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("livePhotoJPEGIntermediateCompressionRatioDefaultOverride")), "floatValue");
    v3[4] = v4;
    v3[5] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PreviewRegistrationType")), "intValue");
    *((_BYTE *)v3 + 24) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PreviewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled")), "BOOLValue");
    *((_QWORD *)v3 + 4) = (id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PhotoProcessingTimeRangesInMS"));
    *((_BYTE *)v3 + 40) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("RGBIRStereoFusionThresholdsEnabled")), "BOOLValue");
    *((_BYTE *)v3 + 41) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("flashMitigationRequired")), "BOOLValue");
    v3[12] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SWFRVersion")), "intValue");
    v3[13] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SemanticRenderingVersion")), "intValue");
    *((_BYTE *)v3 + 42) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("realtimeFSDNetSupported")), "BOOLValue");
    *((_BYTE *)v3 + 43) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("FrameRateSwitchBasedOnMotionForVFRDisabled")), "BOOLValue");
    *((_BYTE *)v3 + 44) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VideoStabilizationAdaptiveOverscanSupported")), "BOOLValue");
    *((_BYTE *)v3 + 45) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VariableFrameRateVideoCaptureFromFWSupported")), "BOOLValue");
    *((_BYTE *)v3 + 46) = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("HighPriorityLaunchFromLockScreenSupported")), "BOOLValue");
    v3[14] = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("SmartStyleRenderingVersion")), "intValue");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceCommonSettings;
  -[FigCaptureSourceCommonSettings dealloc](&v3, sel_dealloc);
}

- (int)initialMemoryPoolSizeMB
{
  return self->_initialMemoryPoolSizeMB;
}

- (NSDictionary)photoProcessingTimeRangesInMS
{
  return self->_photoProcessingTimeRangesInMS;
}

- (BOOL)RGBIRStereoFusionThresholdsEnabled
{
  return self->_RGBIRStereoFusionThresholdsEnabled;
}

- (BOOL)flashMitigationRequired
{
  return self->_flashMitigationRequired;
}

- (BOOL)frameRateSwitchBasedOnMotionForVFRDisabled
{
  return self->_frameRateSwitchBasedOnMotionForVFRDisabled;
}

- (BOOL)highPriorityLaunchFromLockScreenSupported
{
  return self->_highPriorityLaunchFromLockScreenSupported;
}

- (int)swfrVersion
{
  return self->_swfrVersion;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

@end
