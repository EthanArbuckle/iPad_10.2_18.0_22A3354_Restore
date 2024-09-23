@implementation AXAssistiveTouchSystemIcons

uint64_t __AXAssistiveTouchSystemIcons_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t result;
  _QWORD v4[47];

  v4[46] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AXAssistiveTouchIconTypeHome");
  v4[1] = CFSTR("AXAssistiveTouchIconTypeNotificationCenter");
  v4[2] = CFSTR("AXAssistiveTouchIconTypeCustom");
  v4[3] = CFSTR("AXAssistiveTouchIconTypeDevice");
  v4[4] = CFSTR("AXAssistiveTouchIconTypeSiri");
  v4[5] = CFSTR("AXAssistiveTouchIconTypeTypeToSiri");
  v4[6] = CFSTR("AXAssistiveTouchIconTypeControlCenter");
  v4[7] = CFSTR("AXAssistiveTouchIconTypeLockScreen");
  v4[8] = CFSTR("AXAssistiveTouchIconTypeRotateScreen");
  v4[9] = CFSTR("AXAssistiveTouchIconTypeVolumeUp");
  v4[10] = CFSTR("AXAssistiveTouchIconTypeVolumeDown");
  v4[11] = CFSTR("AXAssistiveTouchIconTypeMute");
  v4[12] = CFSTR("AXAssistiveTouchIconTypeGestures");
  v4[13] = CFSTR("AXAssistiveTouchIconTypeShake");
  v4[14] = CFSTR("AXAssistiveTouchIconTypeMultitasking");
  v4[15] = CFSTR("AXAssistiveTouchIconTypeScreenshot");
  v4[16] = CFSTR("AXAssistiveTouchIconTypeOrientation");
  v4[17] = CFSTR("AXAssistiveTouchIconTypeVoiceControl");
  v4[18] = CFSTR("AXAssistiveTouchIconTypePinch");
  v4[19] = CFSTR("AXAssistiveTouchIconTypeRotate");
  v4[20] = CFSTR("AXAssistiveTouchIconTypePinchAndRotate");
  v4[21] = CFSTR("AXAssistiveTouchIconTypeForceTap");
  v4[22] = CFSTR("AXAssistiveTouchIconTypeTap");
  v4[23] = CFSTR("AXAssistiveTouchIconTypeDoubleTap");
  v4[24] = CFSTR("AXAssistiveTouchIconTypeLongPress");
  v4[25] = CFSTR("AXAssistiveTouchIconTypeDragAndDrop");
  v4[26] = CFSTR("AXAssistiveTouchIconTypeMoveMenu");
  v4[27] = CFSTR("AXAssistiveTouchIconTypeSpotlight");
  v4[28] = CFSTR("AXAssistiveTouchIconTypeSOS");
  v4[29] = CFSTR("AXAssistiveTouchIconTypeSysdiagnose");
  v4[30] = CFSTR("AXAssistiveTouchIconTypeToggleDock");
  v4[31] = CFSTR("AXAssistiveTouchIconTypeReachability");
  v4[32] = CFSTR("AXAssistiveTouchIconTypeRebootDevice");
  v4[33] = CFSTR("AXAssistiveTouchIcontTypeArmApplePay");
  v4[34] = CFSTR("AXAssistiveTouchIconTypeTorch");
  v4[35] = CFSTR("AXAssistiveTouchIcontTypeConfirmApplePay");
  v4[36] = CFSTR("AXAssistiveTouchIconTypeSideApp");
  v4[37] = CFSTR("AXAssistiveTouchIconTypeScroll");
  v4[38] = CFSTR("AXAssistiveTouchIconTypeDwell");
  v4[39] = CFSTR("AXAssistiveTouchIconTypeCamera");
  v4[40] = CFSTR("AXAssistiveTouchIconTypeFrontFacingCamera");
  v4[41] = CFSTR("AXAssistiveTouchIconTypeSiriShortcutsMenu");
  v4[42] = CFSTR("AXAssistiveTouchIconTypeActionButton");
  v4[43] = CFSTR("AXAssistiveTouchIconTypeCameraButton");
  v4[44] = CFSTR("AXAssistiveTouchIconTypeCameraButtonLightPress");
  v4[45] = CFSTR("AXAssistiveTouchIconTypeCameraButtonDoubleLightPress");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 46);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)AXAssistiveTouchSystemIcons_Array;
  AXAssistiveTouchSystemIcons_Array = v1;

  if (AXDeviceHasStaccato())
  {
    AXDeviceIsRingerSwitchAvailable();
  }
  else
  {
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeActionButton"));
    if ((AXDeviceIsRingerSwitchAvailable() & 1) != 0)
      goto LABEL_5;
  }
  objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeMute"));
LABEL_5:
  if ((AXDeviceIsSOSAvailable() & 1) == 0)
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeSOS"));
  if ((MGGetBoolAnswer() & 1) == 0)
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeReachability"));
  if ((AXDeviceSupportsSideApp() & 1) == 0)
  {
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeToggleDock"));
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeSideApp"));
  }
  result = AXDeviceSupportsCameraButton();
  if ((result & 1) == 0)
  {
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeCameraButton"));
    objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeCameraButtonLightPress"));
    return objc_msgSend((id)AXAssistiveTouchSystemIcons_Array, "removeObject:", CFSTR("AXAssistiveTouchIconTypeCameraButtonDoubleLightPress"));
  }
  return result;
}

@end
