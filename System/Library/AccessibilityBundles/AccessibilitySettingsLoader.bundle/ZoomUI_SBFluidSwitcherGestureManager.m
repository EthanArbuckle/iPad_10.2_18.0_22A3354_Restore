@implementation ZoomUI_SBFluidSwitcherGestureManager

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherGestureManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  unsigned __int8 v35;
  objc_super v37;
  char v38;

  v6 = a3;
  v7 = a4;
  if (!+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))goto LABEL_12;
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "zoomInStandby"))
  {

LABEL_12:
    v37.receiver = self;
    v37.super_class = (Class)ZoomUI_SBFluidSwitcherGestureManager;
    v35 = -[ZoomUI_SBFluidSwitcherGestureManager gestureRecognizer:shouldReceiveTouch:](&v37, sel_gestureRecognizer_shouldReceiveTouch_, v6, v7);
    goto LABEL_13;
  }
  v9 = +[ZoomServicesUI _deviceIsPortrait](ZoomServicesUI, "_deviceIsPortrait");

  if (!v9)
    goto LABEL_12;
  v38 = 0;
  v10 = objc_opt_class();
  -[ZoomUI_SBFluidSwitcherGestureManager safeValueForKey:](self, "safeValueForKey:", CFSTR("activateReachabilityGestureRecognizer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  soft___UIAccessibilityCastAsClass(v10, v11, (uint64_t)&v38);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v38)
    goto LABEL_14;
  if (v12 != v6)
  {
LABEL_11:

    goto LABEL_12;
  }
  v38 = 0;
  v13 = objc_opt_class();
  -[ZoomUI_SBFluidSwitcherGestureManager safeValueForKey:](self, "safeValueForKey:", CFSTR("switcherContentController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  soft___UIAccessibilityCastAsClass(v13, v14, (uint64_t)&v38);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
LABEL_14:
    abort();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  -[ZoomUI_SBFluidSwitcherGestureManager safeValueForKey:](self, "safeValueForKey:", CFSTR("reachabilitySettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  soft_AXSafeClassFromString(CFSTR("SBReachabilitySettings"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v19, "safeCGFloatForKey:", CFSTR("homeGestureSwipeDownHeight"));
  v21 = v20;
  objc_msgSend(v6, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v22);
  v24 = v23;
  v26 = v25;

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "displayIdentity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "zoomFrameOnDisplay:", objc_msgSend(v29, "displayID"));
  *(_QWORD *)zoomFrame = v30;
  *(_QWORD *)&zoomFrame[8] = v31;
  *(_QWORD *)&zoomFrame[16] = v32;
  *(_QWORD *)&zoomFrame[24] = v33;

  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v24, v26);
  v35 = v34 > v18 - v21;

LABEL_13:
  return v35;
}

@end
