@implementation STUIStatusBarBackgroundActivityItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarBackgroundActivityItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarItemUpdate"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarBackgroundActivityItem"), CFSTR("STUIStatusBarIndicatorItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBackgroundActivityItem"), CFSTR("backgroundView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBackgroundActivityItem"), CFSTR("iconView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarIndicatorItem"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItemUpdate"), CFSTR("data"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarData"), CFSTR("backgroundActivityEntry"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataBackgroundActivityEntry"), CFSTR("backgroundActivityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBackgroundActivityItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarBackgroundActivityItem"), CFSTR("createDisplayItemForIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItem"), CFSTR("setNeedsUpdate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarPillBackgroundActivityItem"), CFSTR("combinedView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarPillBackgroundActivityItem"), CFSTR("STUIStatusBarBackgroundActivityItem"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarPillBackgroundActivityItem"), CFSTR("STUIStatusBarBackgroundActivityItem"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBar_Wrapper"), CFSTR("UIStatusBar_Base"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBar_Base"), CFSTR("forceUpdate:"), "v", "B", 0);

}

- (id)_axBackgroundActivityLabelByBackgroundActivityID:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    if (_axBackgroundActivityLabelByBackgroundActivityID__onceToken != -1)
      dispatch_once(&_axBackgroundActivityLabelByBackgroundActivityID__onceToken, &__block_literal_global_0);
    objc_msgSend((id)_axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      accessibilityLocalizedString(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __101__STUIStatusBarBackgroundActivityItemAccessibility__axBackgroundActivityLabelByBackgroundActivityID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[46];
  _QWORD v3[47];

  v3[46] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOS");
  v2[1] = CFSTR("com.apple.systemstatus.background-activity.SatelliteSOSDisconnected");
  v3[0] = CFSTR("status.backgroundactivity.call.stewie");
  v3[1] = CFSTR("status.backgroundactivity.call.stewie.disconnected");
  v2[2] = CFSTR("com.apple.systemstatus.background-activity.CallRinging");
  v2[3] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceRinging");
  v3[2] = CFSTR("status.backgroundactivity.callRinging");
  v3[3] = CFSTR("status.backgroundactivity.videoConferenceRinging");
  v2[4] = CFSTR("com.apple.systemstatus.background-activity.CallHandoff");
  v2[5] = CFSTR("com.apple.systemstatus.background-activity.VideoConferenceHandoff");
  v3[4] = CFSTR("status.backgroundactivity.call.handoff");
  v3[5] = CFSTR("status.backgroundactivity.video.handoff");
  v2[6] = CFSTR("com.apple.systemstatus.background-activity.InCall");
  v2[7] = CFSTR("com.apple.systemstatus.background-activity.InVideoConference");
  v3[6] = CFSTR("status.backgroundactivity.incall");
  v3[7] = CFSTR("status.backgroundactivity.videoconference");
  v2[8] = CFSTR("com.apple.systemstatus.background-activity.ActivePushToTalkCall");
  v2[9] = CFSTR("com.apple.systemstatus.background-activity.IdlePushToTalkCall");
  v3[8] = CFSTR("status.backgroundactivity.push.to.talk.active");
  v3[9] = CFSTR("status.backgroundactivity.push.to.talk.idle");
  v2[10] = CFSTR("com.apple.systemstatus.background-activity.WebRTCCapture");
  v2[11] = CFSTR("com.apple.systemstatus.background-activity.WebRTCAudioCapture");
  v3[10] = CFSTR("status.backgroundactivity.web.rtc.video");
  v3[11] = CFSTR("status.backgroundactivity.web.rtc.audio");
  v2[12] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCCapture");
  v2[13] = CFSTR("com.apple.systemstatus.background-activity.FullScreenWebRTCAudioCapture");
  v3[12] = CFSTR("status.backgroundactivity.web.rtc.screen.video");
  v3[13] = CFSTR("status.backgroundactivity.web.rtc.screen.audio");
  v2[14] = CFSTR("com.apple.systemstatus.background-activity.Navigation");
  v2[15] = CFSTR("com.apple.systemstatus.background-activity.BackgroundLocation");
  v3[14] = CFSTR("status.backgroundactivity.navigation");
  v3[15] = CFSTR("status.backgroundactivity.location");
  v2[16] = CFSTR("com.apple.systemstatus.background-activity.NearbyInteractions");
  v2[17] = CFSTR("com.apple.systemstatus.background-activity.Recording");
  v3[16] = CFSTR("status.backgroundactivity.nearby.interactions");
  v3[17] = CFSTR("status.backgroundactivity.audiorecording");
  v2[18] = CFSTR("com.apple.systemstatus.background-activity.HearingAidRecording");
  v2[19] = CFSTR("com.apple.systemstatus.background-activity.SharePlay");
  v3[18] = CFSTR("status.backgroundactivity.hearingaidrecording");
  v3[19] = CFSTR("status.backgroundactivity.shareplay");
  v2[20] = CFSTR("com.apple.systemstatus.background-activity.SharePlayScreenSharing");
  v2[21] = CFSTR("com.apple.systemstatus.background-activity.SharePlayInactive");
  v3[20] = CFSTR("status.backgroundactivity.shareplay.screen");
  v3[21] = CFSTR("status.backgroundactivity.shareplay.inactive");
  v2[22] = CFSTR("com.apple.systemstatus.background-activity.Playgrounds");
  v2[23] = CFSTR("com.apple.systemstatus.background-activity.VideoOut");
  v3[22] = CFSTR("status.backgroundactivity.playground");
  v3[23] = CFSTR("status.backgroundactivity.videoout");
  v2[24] = CFSTR("com.apple.systemstatus.background-activity.ScreenSharing");
  v2[25] = CFSTR("com.apple.systemstatus.background-activity.ScreenSharingServer");
  v3[24] = CFSTR("status.backgroundactivity.screenshare");
  v3[25] = CFSTR("status.backgroundactivity.videoout");
  v2[26] = CFSTR("com.apple.systemstatus.background-activity.ScreenReplayRecording");
  v2[27] = CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayReady");
  v3[26] = CFSTR("status.backgroundactivity.screenrecording");
  v3[27] = CFSTR("status.backgroundactivity.auto.airplay.ready");
  v2[28] = CFSTR("com.apple.systemstatus.background-activity.AutoAirPlayPlaying");
  v2[29] = CFSTR("com.apple.systemstatus.background-activity.Sysdiagnose");
  v3[28] = CFSTR("status.backgroundactivity.auto.airplay.play");
  v3[29] = CFSTR("status.backgroundactivity.sysdiagnose");
  v2[30] = CFSTR("com.apple.systemstatus.background-activity.Diagnostics");
  v2[31] = CFSTR("com.apple.systemstatus.background-activity.LoggingCapture");
  v3[30] = CFSTR("status.backgroundactivity.diagnostics");
  v3[31] = CFSTR("status.backgroundactivity.logging");
  v2[32] = CFSTR("com.apple.systemstatus.background-activity.CarPlay");
  v2[33] = CFSTR("com.apple.systemstatus.background-activity.AssistantEyesFree");
  v3[32] = CFSTR("status.backgroundactivity.carplay");
  v3[33] = CFSTR("status.backgroundactivity.assistant");
  v2[34] = CFSTR("com.apple.systemstatus.background-activity.Tethering");
  v2[35] = CFSTR("com.apple.systemstatus.background-activity.AirPrint");
  v3[34] = CFSTR("status.backgroundactivity.tethering");
  v3[35] = CFSTR("status.backgroundactivity.airprint");
  v2[36] = CFSTR("com.apple.systemstatus.background-activity.CellularSOS");
  v2[37] = CFSTR("com.apple.systemstatus.background-activity.DeveloperTools");
  v3[36] = CFSTR("status.backgroundactivity.sos");
  v3[37] = CFSTR("status.backgroundactivity.devtools");
  v2[38] = CFSTR("com.apple.mediaremoted.background-activity.routed-video");
  v2[39] = CFSTR("com.apple.mediaremoted.background-activity.routed-audio-pulse");
  v3[38] = CFSTR("status.backgroundactivity.mediaremote.video");
  v3[39] = CFSTR("status.backgroundactivity.mediaremote.video");
  v2[40] = CFSTR("com.apple.mediaremoted.background-activity.routed-audio");
  v2[41] = CFSTR("com.apple.mediaremoted.background-activity.routed-video-pulse");
  v3[40] = CFSTR("status.backgroundactivity.mediaremote.audio");
  v3[41] = CFSTR("status.backgroundactivity.mediaremote.audio");
  v2[42] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-video");
  v2[43] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-audio");
  v3[42] = CFSTR("status.backgroundactivity.continuitycapture.video");
  v3[43] = CFSTR("status.backgroundactivity.continuitycapture.audio");
  v2[44] = CFSTR("com.apple.systemstatus.background-activity.continuitycapture.streaming-none");
  v2[45] = CFSTR("com.apple.systemstatus.background-activity.CallScreening");
  v3[44] = CFSTR("status.backgroundactivity.continuitycapture.none");
  v3[45] = CFSTR("status.backgroundactivity.call.screening");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 46);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap;
  _axBackgroundActivityLabelByBackgroundActivityID__ActivityToLabelMap = v0;

}

- (void)_axApplyLabelToBackground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  if (a1)
  {
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2349217D4](CFSTR("STUIStatusBarItemUpdate"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("data.backgroundActivityEntry"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safeStringForKey:", CFSTR("backgroundActivityIdentifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByBackgroundActivityID:]((uint64_t)a1, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x2349217D4](CFSTR("STUIStatusBarBackgroundActivityItem"));
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (MEMORY[0x2349217D4](CFSTR("STUIStatusBarFullBackgroundActivityItem")), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(a1, "safeUIViewForKey:", CFSTR("backgroundView"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v6);
        v7 = MEMORY[0x24BDAC760];
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke;
        v14[3] = &unk_25039D8E0;
        v8 = v5;
        v15 = v8;
        objc_copyWeak(&v16, &location);
        objc_msgSend(v6, "_setAccessibilityLabelBlock:", v14);
        objc_msgSend(a1, "safeUIViewForKey:", CFSTR("combinedView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2;
        v11[3] = &unk_25039D8E0;
        v12 = v8;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v9, "_setAccessibilityLabelBlock:", v11);

        objc_destroyWeak(&v13);
        objc_destroyWeak(&v16);

        objc_destroyWeak(&location);
      }
      else
      {
        objc_msgSend(a1, "safeUIViewForKey:", CFSTR("backgroundView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAccessibilityLabel:", v5);

      }
    }

  }
}

id __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  AXStatusBarPillTimeView(WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __77__STUIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  AXStatusBarPillTimeView(WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  -[STUIStatusBarBackgroundActivityItemAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarBackgroundActivityItemAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!self)
    {
LABEL_5:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      block[3] = &unk_25039D908;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      goto LABEL_6;
    }
    if ((__UIAccessibilityGetAssociatedBool() & 1) == 0)
    {
      __UIAccessibilitySetAssociatedBool();
      goto LABEL_5;
    }
  }
LABEL_6:
  -[STUIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](self);
  -[STUIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("imageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
  -[STUIStatusBarBackgroundActivityItemAccessibility _axSetupIconViewWithUpdateData:](self, "_axSetupIconViewWithUpdateData:", v3);

}

uint64_t __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t result;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("setNeedsUpdate"));
  AXPerformSafeBlock();
  MEMORY[0x2349217D4](CFSTR("STUIStatusBarPillBackgroundActivityItem"));
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return AXPerformSafeBlock();
  return result;
}

void __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("backgroundView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349217D4](CFSTR("STUIStatusBar_Wrapper")));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceUpdate:", 1);

}

void __94__STUIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("combinedView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349217D4](CFSTR("STUIStatusBar_Wrapper")));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "forceUpdate:", 1);

}

- (id)_axBackgroundView
{
  return (id)-[STUIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("backgroundView"));
}

- (id)_axStatusBarModern
{
  void *v2;
  void *v3;

  -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundView](self, "_axBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349217D4](CFSTR("STUIStatusBar_Wrapper")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axSetupIconViewWithUpdateData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  MEMORY[0x2349217D4](CFSTR("STUIStatusBarPillBackgroundActivityItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[STUIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("iconView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("data.backgroundActivityEntry"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeStringForKey:", CFSTR("backgroundActivityIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(CFSTR("com.apple.systemstatus.background-activity.InCall"), "isEqualToString:", v7) & 1) != 0
        || objc_msgSend(CFSTR("com.apple.systemstatus.background-activity.InVideoConference"), "isEqualToString:", v7))
      {
        -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundView](self, "_axBackgroundView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUIStatusBarBackgroundActivityItemAccessibility _axStatusBarModern](self, "_axStatusBarModern");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "safeCGRectForKey:", CFSTR("frame"));
        if (v8)
        {
          v11 = v10;
          if (v10 != 0.0)
          {
            objc_msgSend(v8, "frame");
            if (v11 == v12)
            {
              objc_msgSend(v5, "_setIsAccessibilityElementBlock:", &__block_literal_global_416);
              -[STUIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByBackgroundActivityID:]((uint64_t)self, v7);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v15[0] = MEMORY[0x24BDAC760];
              v15[1] = 3221225472;
              v15[2] = __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2;
              v15[3] = &unk_25039D970;
              v16 = v13;
              v14 = v13;
              objc_msgSend(v5, "_setAccessibilityLabelBlock:", v15);

LABEL_12:
              goto LABEL_13;
            }
          }
        }

      }
    }
    objc_msgSend(v5, "_setIsAccessibilityElementBlock:", 0);
    objc_msgSend(v5, "_setAccessibilityLabelBlock:", 0);
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke()
{
  return 1;
}

id __83__STUIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  -[STUIStatusBarBackgroundActivityItemAccessibility createDisplayItemForIdentifier:](&v6, sel_createDisplayItemForIdentifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](self);
  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarBackgroundActivityItemAccessibility;
  v6 = a3;
  -[STUIStatusBarBackgroundActivityItemAccessibility applyUpdate:toDisplayItem:](&v9, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarBackgroundActivityItemAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AccessibilityStatusBarUpdateData"), v9.receiver, v9.super_class);

  -[STUIStatusBarBackgroundActivityItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v7;
}

@end
