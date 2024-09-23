@implementation MDLCamera(SCNModelIO)

+ (id)cameraWithSCNCamera:()SCNModelIO
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = objc_alloc_init(a1);
  objc_setAssociatedObject(v4, CFSTR("SCNSceneKitAssociatedObject"), a3, (void *)0x301);
  objc_msgSend(a3, "focusDistance");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "setFocusDistance:", v5);
  objc_msgSend(a3, "sensorHeight");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "setSensorVerticalAperture:", v6);
  objc_msgSend(v4, "setApertureBladeCount:", objc_msgSend(a3, "apertureBladeCount"));
  if (objc_msgSend(a3, "useLegacyFov"))
    objc_msgSend(a3, "yFov");
  else
    objc_msgSend(a3, "fieldOfView");
  *(float *)&v7 = v7;
  objc_msgSend(v4, "setFieldOfView:", v7);
  objc_msgSend(a3, "aspectRatio");
  *(float *)&v8 = v8;
  objc_msgSend(v4, "setSensorAspect:", v8);
  objc_msgSend(a3, "zNear");
  *(float *)&v9 = v9;
  objc_msgSend(v4, "setNearVisibilityDistance:", v9);
  objc_msgSend(a3, "zFar");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "setFarVisibilityDistance:", v10);
  objc_msgSend(a3, "focalBlurRadius");
  *(float *)&v11 = v11;
  objc_msgSend(v4, "setMaximumCircleOfConfusion:", v11);
  objc_msgSend(a3, "fStop");
  *(float *)&v12 = v12;
  objc_msgSend(v4, "setFStop:", v12);
  objc_msgSend(v4, "setProjection:", objc_msgSend(a3, "usesOrthographicProjection"));
  return v4;
}

@end
