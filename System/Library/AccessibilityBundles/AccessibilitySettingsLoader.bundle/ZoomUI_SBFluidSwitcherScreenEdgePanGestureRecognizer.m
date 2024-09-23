@implementation ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherScreenEdgePanGestureRecognizer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)_convertPortaitPointToSBOrientation:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = v8 - x;
  v12 = v10 - y;
  v13 = v10 - x;
  v14 = v8 - y;
  if (v5 == 4)
  {
    v15 = x;
  }
  else
  {
    v14 = x;
    v15 = y;
  }
  if (v5 == 3)
    v14 = y;
  else
    v13 = v15;
  if (v5 != 2)
  {
    v11 = v14;
    v12 = v13;
  }
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)_convertSBPointToPortaitOrientation:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "activeInterfaceOrientation");
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = v8 - x;
  v12 = v10 - y;
  if (v5 == 4)
    v13 = y;
  else
    v13 = x;
  if (v5 == 4)
    v14 = v8 - x;
  else
    v14 = y;
  if (v5 == 3)
  {
    v13 = v10 - y;
    v14 = x;
  }
  if (v5 != 2)
  {
    v11 = v13;
    v12 = v14;
  }
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(getZoomServicesClass(), "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoomFrameOnDisplay:", objc_msgSend(v10, "displayID"));
  *(_QWORD *)zoomFrame = v11;
  *(_QWORD *)&zoomFrame[8] = v12;
  *(_QWORD *)&zoomFrame[16] = v13;
  *(_QWORD *)&zoomFrame[24] = v14;

  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  zoomInStandByAtGestureStart = objc_msgSend(v15, "zoomInStandby");

  translatedUpwards = 0;
  v16.receiver = self;
  v16.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
  -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer touchesBegan:withEvent:](&v16, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  __int128 v4;
  objc_super v5;

  v4 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  *(_OWORD *)zoomFrame = *MEMORY[0x24BDBF090];
  *(_OWORD *)&zoomFrame[16] = v4;
  translatedUpwards = 0;
  v5.receiver = self;
  v5.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
  -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
}

- (BOOL)_viewOrientationDoesNotMatchSBOrientation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v3 = (void *)MEMORY[0x24BDF6D38];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = v9 != v13 || v7 != v11;
  return v14;
}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGPoint result;

  v4 = a3;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))
  {
    v5 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    v5 = 0;
  }
  if (v5)
  {
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_lastSceneReferenceLocation"));
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:");
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:");
    v11 = v10;
    v13 = v12;
    if (-[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _viewOrientationDoesNotMatchSBOrientation:](self, "_viewOrientationDoesNotMatchSBOrientation:", v4))
    {
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v11, v13);
      v11 = v14;
      v13 = v15;
    }
    objc_msgSend(v4, "bounds");
    v7 = v11 + v16;
    objc_msgSend(v4, "bounds");
    v9 = v13 + v17;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer locationInView:](&v20, sel_locationInView_, v4);
    v7 = v6;
    v9 = v8;
  }

  v18 = v7;
  v19 = v9;
  result.y = v19;
  result.x = v18;
  return result;
}

- (CGPoint)translationInView:(id)a3
{
  id v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
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
  double v36;
  double v37;
  double v38;
  double v39;
  objc_super v40;
  CGPoint result;

  v4 = a3;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))
  {
    v5 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    v5 = 0;
  }
  if (v5)
  {
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_firstSceneReferenceLocation"));
    v11 = v10;
    v13 = v12;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_lastSceneReferenceLocation"));
    v15 = v14;
    v17 = v16;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:", v11, v13);
    v19 = v18;
    v21 = v20;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertPortaitPointToSBOrientation:](self, "_convertPortaitPointToSBOrientation:", v15, v17);
    v23 = v22;
    v25 = v24;
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v19, v21);
    v27 = v26;
    v29 = v28;
    +[ZoomServicesUI _unMappedZoomPoint:](ZoomServicesUI, "_unMappedZoomPoint:", v23, v25);
    v31 = v30;
    v33 = v32;
    if (-[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _viewOrientationDoesNotMatchSBOrientation:](self, "_viewOrientationDoesNotMatchSBOrientation:", v4))
    {
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v27, v29);
      v27 = v34;
      v29 = v35;
      -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer _convertSBPointToPortaitOrientation:](self, "_convertSBPointToPortaitOrientation:", v31, v33);
      v31 = v36;
      v33 = v37;
    }
    v7 = v31 - v27;
    v9 = v33 - v29;
    translatedUpwards = v9 < 0.0;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer translationInView:](&v40, sel_translationInView_, v4);
    v7 = v6;
    v9 = v8;
  }

  v38 = v7;
  v39 = v9;
  result.y = v39;
  result.x = v38;
  return result;
}

- (void)setTranslation:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (+[ZoomServicesUI _shouldUnmapPointsForFluidGestures](ZoomServicesUI, "_shouldUnmapPointsForFluidGestures"))
  {
    v8 = zoomInStandByAtGestureStart == 0;
  }
  else
  {
    v8 = 0;
  }
  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer;
    -[ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer setTranslation:inView:](&v9, sel_setTranslation_inView_, v7, x, y);
  }

}

@end
