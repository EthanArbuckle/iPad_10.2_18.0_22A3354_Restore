@implementation AXUIAssistiveTouchStringForName

void __AXUIAssistiveTouchStringForName_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[96];
  _QWORD v35[97];

  v35[96] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CF4BC0];
  v34[0] = *MEMORY[0x1E0CF4B58];
  v34[1] = v0;
  v35[0] = CFSTR("HOME");
  v35[1] = CFSTR("NOTIFICATION_CENTER");
  v1 = *MEMORY[0x1E0CF4AB0];
  v34[2] = *MEMORY[0x1E0CF4AA0];
  v34[3] = v1;
  v35[2] = CFSTR("CUSTOM");
  v35[3] = CFSTR("DEVICE");
  v2 = *MEMORY[0x1E0CF4CD8];
  v34[4] = *MEMORY[0x1E0CF4C70];
  v34[5] = v2;
  v35[4] = CFSTR("SIRI");
  v35[5] = CFSTR("TYPE_TO_SIRI");
  v3 = *MEMORY[0x1E0CF4B78];
  v34[6] = *MEMORY[0x1E0CF4A98];
  v34[7] = v3;
  v35[6] = CFSTR("CONTROL_CENTER");
  v35[7] = CFSTR("LOCK");
  v4 = *MEMORY[0x1E0CF4CF8];
  v34[8] = *MEMORY[0x1E0CF4C10];
  v34[9] = v4;
  v35[8] = CFSTR("ORIENTATION");
  v35[9] = CFSTR("VOLUME_UP_ASSISTIVE_TOUCH");
  v5 = *MEMORY[0x1E0CF4BB0];
  v34[10] = *MEMORY[0x1E0CF4CF0];
  v34[11] = v5;
  v35[10] = CFSTR("VOLUME_DOWN_ASSISTIVE_TOUCH");
  v35[11] = CFSTR("MUTE");
  v6 = *MEMORY[0x1E0CF4CD0];
  v34[12] = *MEMORY[0x1E0CF4B48];
  v34[13] = v6;
  v35[12] = CFSTR("GESTURES");
  v35[13] = CFSTR("TRIPLE_CLICK");
  v7 = *MEMORY[0x1E0CF4A18];
  v34[14] = *MEMORY[0x1E0CF4C60];
  v34[15] = v7;
  v35[14] = CFSTR("SHAKE");
  v35[15] = CFSTR("APP_SWITCHER");
  v8 = *MEMORY[0x1E0CF4BD8];
  v34[16] = *MEMORY[0x1E0CF4C20];
  v34[17] = v8;
  v35[16] = CFSTR("SCREENSHOT");
  v35[17] = CFSTR("ORIENTATION_LOCKED");
  v9 = *MEMORY[0x1E0CF4A78];
  v34[18] = *MEMORY[0x1E0CF4CE0];
  v34[19] = v9;
  v35[18] = CFSTR("VOICE_CONTROL");
  v35[19] = CFSTR("COMMAND_AND_CONTROL");
  v10 = *MEMORY[0x1E0CF4C08];
  v34[20] = *MEMORY[0x1E0CF4BE8];
  v34[21] = v10;
  v35[20] = CFSTR("PINCH");
  v35[21] = CFSTR("ROTATE");
  v11 = *MEMORY[0x1E0CF4B30];
  v34[22] = *MEMORY[0x1E0CF4BF0];
  v34[23] = v11;
  v35[22] = CFSTR("PINCH_ROTATE");
  v35[23] = CFSTR("FORCE_TAP");
  v12 = *MEMORY[0x1E0CF4CB0];
  v34[24] = *MEMORY[0x1E0CF4AD8];
  v34[25] = v12;
  v35[24] = CFSTR("TAP");
  v35[25] = CFSTR("TAP");
  v13 = *MEMORY[0x1E0CF4B80];
  v34[26] = *MEMORY[0x1E0CF4AC0];
  v34[27] = v13;
  v35[26] = CFSTR("DOUBLE_TAP");
  v35[27] = CFSTR("LONG_PRESS");
  v14 = *MEMORY[0x1E0CF4BA8];
  v34[28] = *MEMORY[0x1E0CF4AC8];
  v34[29] = v14;
  v35[28] = CFSTR("HOLD_AND_DRAG");
  v35[29] = CFSTR("MOVE_MENU");
  v15 = *MEMORY[0x1E0CF4C18];
  v34[30] = *MEMORY[0x1E0CF4C98];
  v34[31] = v15;
  v35[30] = CFSTR("SPOTLIGHT");
  v35[31] = CFSTR("SOS");
  v16 = *MEMORY[0x1E0CF4BF8];
  v34[32] = *MEMORY[0x1E0CF4CA8];
  v34[33] = v16;
  v35[32] = CFSTR("SYSDIAGNOSE");
  v35[33] = CFSTR("REACHABILITY");
  v17 = *MEMORY[0x1E0CF4CB8];
  v34[34] = *MEMORY[0x1E0CF4C00];
  v34[35] = v17;
  v35[34] = CFSTR("REBOOT_DEVICE");
  v35[35] = CFSTR("DOCK");
  v18 = *MEMORY[0x1E0CF4B60];
  v34[36] = *MEMORY[0x1E0CF4A20];
  v34[37] = v18;
  v35[36] = CFSTR("APPLE_PAY");
  v35[37] = CFSTR("HOVERTEXT_TYPING");
  v19 = *MEMORY[0x1E0CF4A80];
  v34[38] = *MEMORY[0x1E0CF4CC8];
  v34[39] = v19;
  v35[38] = CFSTR("VIRTUAL_TRACKPAD");
  v35[39] = CFSTR("APPLE_PAY_CONFIRM");
  v20 = *MEMORY[0x1E0CF4BD0];
  v34[40] = *MEMORY[0x1E0CF4C90];
  v34[41] = v20;
  v35[40] = CFSTR("SPEAK_SCREEN");
  v35[41] = CFSTR("OPEN_MENU");
  v21 = *MEMORY[0x1E0CF4B98];
  v34[42] = *MEMORY[0x1E0CF4BE0];
  v34[43] = v21;
  v35[42] = CFSTR("PASS_THROUGH");
  v35[43] = CFSTR("MOUSE_PRIMARY_CLICK");
  v22 = *MEMORY[0x1E0CF4C68];
  v34[44] = *MEMORY[0x1E0CF4BA0];
  v34[45] = v22;
  v35[44] = CFSTR("MOUSE_SECONDARY_CLICK");
  v35[45] = CFSTR("SIDE_APP");
  v23 = *MEMORY[0x1E0CF4B10];
  v34[46] = *MEMORY[0x1E0CF4AD0];
  v34[47] = v23;
  v35[46] = CFSTR("DWELL");
  v35[47] = CFSTR("DWELL_RESUME");
  v24 = *MEMORY[0x1E0CF4B08];
  v34[48] = *MEMORY[0x1E0CF4B00];
  v34[49] = v24;
  v35[48] = CFSTR("DWELL_PAUSE");
  v35[49] = CFSTR("DWELL_PAUSE_TOGGLE");
  v25 = *MEMORY[0x1E0CF4B18];
  v34[50] = *MEMORY[0x1E0CF4AF0];
  v34[51] = v25;
  v35[50] = CFSTR("DWELL_LOCK");
  v35[51] = CFSTR("DWELL_UNLOCK");
  v26 = *MEMORY[0x1E0CF4AE8];
  v34[52] = *MEMORY[0x1E0CF4AF8];
  v34[53] = v26;
  v35[52] = CFSTR("DWELL_LOCK_TOGGLE");
  v35[53] = CFSTR("DWELL_TIME_INCREASE");
  v27 = *MEMORY[0x1E0CF4C28];
  v34[54] = *MEMORY[0x1E0CF4AE0];
  v34[55] = v27;
  v35[54] = CFSTR("DWELL_TIME_DECREASE");
  v35[55] = CFSTR("SCROLL");
  v28 = *MEMORY[0x1E0CF4C30];
  v34[56] = *MEMORY[0x1E0CF4C58];
  v34[57] = v28;
  v35[56] = CFSTR("Scroll-Up");
  v35[57] = CFSTR("Scroll-Down");
  v29 = *MEMORY[0x1E0CF4C40];
  v34[58] = *MEMORY[0x1E0CF4C38];
  v34[59] = v29;
  v35[58] = CFSTR("Scroll-Left");
  v35[59] = CFSTR("Scroll-Right");
  v30 = *MEMORY[0x1E0CF4C48];
  v34[60] = *MEMORY[0x1E0CF4C50];
  v34[61] = v30;
  v35[60] = CFSTR("SCROLL_TO_TOP");
  v35[61] = CFSTR("SCROLL_TO_BOTTOM");
  v31 = *MEMORY[0x1E0CF4A90];
  v34[62] = *MEMORY[0x1E0CF4A88];
  v34[63] = v31;
  v35[62] = CFSTR("SCROLL_CONTINUOUS_HORIZONTAL");
  v35[63] = CFSTR("SCROLL_CONTINUOUS_VERTICAL");
  v34[64] = *MEMORY[0x1E0CF4A48];
  v35[64] = CFSTR("CAMERA");
  v34[65] = *MEMORY[0x1E0CF4B38];
  v35[65] = CFSTR("CAMERA_FRONT");
  v34[66] = *MEMORY[0x1E0CF4CC0];
  v35[66] = CFSTR("TORCH");
  v34[67] = *MEMORY[0x1E0CF4B28];
  v35[67] = CFSTR("EYE_TRACKING_BUBBLE_MODE_TOGGLE");
  v34[68] = *MEMORY[0x1E0CF4B20];
  v35[68] = CFSTR("EYE_TRACKING_AUTO_HIDE_TOGGLE");
  v34[69] = *MEMORY[0x1E0CF4A30];
  v35[69] = CFSTR("ASSSISTIVETOUCH");
  v34[70] = *MEMORY[0x1E0CF4CE8];
  v35[70] = CFSTR("VOICEOVER");
  v34[71] = *MEMORY[0x1E0CF4A68];
  v35[71] = CFSTR("CLASSIC_INVERT");
  v34[72] = *MEMORY[0x1E0CF4A70];
  v35[72] = CFSTR("COLOR_FILTERS");
  v34[73] = *MEMORY[0x1E0CF4C88];
  v35[73] = CFSTR("SMART_INVERT");
  v34[74] = *MEMORY[0x1E0CF4D08];
  v35[74] = CFSTR("ZOOM");
  v34[75] = *MEMORY[0x1E0CF4D10];
  v35[75] = CFSTR("ZOOM_CONTROLLER");
  v34[76] = *MEMORY[0x1E0CF4B88];
  v35[76] = CFSTR("MAGNIFIER");
  v34[77] = *MEMORY[0x1E0CF4CA0];
  v35[77] = CFSTR("SWITCH_CONTROL");
  v34[78] = *MEMORY[0x1E0CF4AA8];
  v35[78] = CFSTR("DETECTION_MODE");
  v34[79] = *MEMORY[0x1E0CF4A38];
  v35[79] = CFSTR("BACKGROUND_SOUNDS");
  v34[80] = *MEMORY[0x1E0CF4BB8];
  v35[80] = CFSTR("NEARBY_DEVICE_CONTROL");
  v34[81] = *MEMORY[0x1E0CF4D00];
  v35[81] = CFSTR("REMOTE_SCREEN");
  v34[82] = *MEMORY[0x1E0CF4B50];
  v35[82] = CFSTR("HAPTIC_MUSIC");
  v34[83] = *MEMORY[0x1E0CF4B90];
  v35[83] = CFSTR("MOTION_CUES");
  v34[84] = *MEMORY[0x1E0CF4B68];
  v35[84] = CFSTR("LIVE_TRANSCRIPTIONS");
  v34[85] = *MEMORY[0x1E0CF4B70];
  v35[85] = CFSTR("LIVE_SPEECH");
  v34[86] = *MEMORY[0x1E0CF4B40];
  v35[86] = CFSTR("FULL_KEYBOARD_ACCESS");
  v34[87] = *MEMORY[0x1E0CF4C80];
  v35[87] = CFSTR("SIRI_SHORTCUTS");
  v34[88] = *MEMORY[0x1E0CF4AB8];
  v35[88] = CFSTR("DIM_FLASHING_LIGHTS");
  v34[89] = *MEMORY[0x1E0CF4A10];
  v35[89] = CFSTR("ACTION_BUTTON");
  v34[90] = *MEMORY[0x1E0CF4A50];
  v35[90] = CFSTR("CAMERA_BUTTON");
  v34[91] = *MEMORY[0x1E0CF4A60];
  v35[91] = CFSTR("CAMERA_BUTTON_LIGHT_PRESS");
  v34[92] = *MEMORY[0x1E0CF4A58];
  v35[92] = CFSTR("CAMERA_BUTTON_DOUBLE_LIGHT_PRESS");
  v34[93] = *MEMORY[0x1E0CF4A40];
  v35[93] = CFSTR("CALIBRATE_ON_DEVICE_EYE_TRACKING");
  v34[94] = *MEMORY[0x1E0CF4BC8];
  v35[94] = CFSTR("ZOOM_SCREEN_ON_DEVICE_EYE_TRACKING");
  v34[95] = *MEMORY[0x1E0CF4A28];
  v35[95] = CFSTR("ASSISTIVE_ACCESS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 96);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)AXUIAssistiveTouchStringForName_ASTMapping;
  AXUIAssistiveTouchStringForName_ASTMapping = v32;

}

@end
