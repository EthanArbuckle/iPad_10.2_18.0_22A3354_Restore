@implementation ZoomUI_SBHomeGesturePanGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBHomeGesturePanGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)translationInView:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v36;
  CGPoint result;

  v4 = a3;
  if (!+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))goto LABEL_6;
  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "zoomInStandby"))
  {

LABEL_6:
    v36.receiver = self;
    v36.super_class = (Class)ZoomUI_SBHomeGesturePanGestureRecognizer;
    -[ZoomUI_SBHomeGesturePanGestureRecognizer translationInView:](&v36, sel_translationInView_, v4);
    v29 = v32;
    v31 = v33;
    goto LABEL_7;
  }
  v6 = +[ZoomServicesUI _deviceIsPortrait](ZoomServicesUI, "_deviceIsPortrait");

  if (!v6)
    goto LABEL_6;
  -[ZoomUI_SBHomeGesturePanGestureRecognizer safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_firstSceneReferenceLocation"));
  v8 = v7;
  v10 = v9;
  -[ZoomUI_SBHomeGesturePanGestureRecognizer safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_lastSceneReferenceLocation"));
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "displayID");

  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "zoomFrameOnDisplay:", v18);
  *(_QWORD *)zoomFrame = v20;
  *(_QWORD *)&zoomFrame[8] = v21;
  *(_QWORD *)&zoomFrame[16] = v22;
  *(_QWORD *)&zoomFrame[24] = v23;

  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v8, v10);
  v25 = v24;
  v27 = v26;
  +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v12, v14);
  v29 = v28 - v25;
  v31 = v30 - v27;
LABEL_7:

  v34 = v29;
  v35 = v31;
  result.y = v35;
  result.x = v34;
  return result;
}

@end
