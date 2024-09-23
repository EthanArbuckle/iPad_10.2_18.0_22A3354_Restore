@implementation MDLLight(SCNModelIO)

+ (id)lightWithSCNLight:()SCNModelIO
{
  id v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;

  v4 = objc_alloc_init(MEMORY[0x1E0CC77D8]);
  objc_setAssociatedObject(v4, CFSTR("SCNSceneKitAssociatedObject"), a3, (void *)0x301);
  objc_msgSend(v4, "setColorSpace:", *MEMORY[0x1E0C9DA10]);
  objc_msgSend(a3, "color");
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (void *)objc_msgSend(a3, "color");
  v7 = (uint64_t)v6;
  if ((isKindOfClass & 1) != 0)
    v7 = objc_msgSend(v6, "CGColor");
  objc_msgSend(v4, "setColor:", v7);
  objc_msgSend(a3, "attenuationStartDistance");
  *(float *)&v8 = v8;
  objc_msgSend(v4, "setAttenuationStartDistance:", v8);
  objc_msgSend(a3, "attenuationEndDistance");
  *(float *)&v9 = v9;
  objc_msgSend(v4, "setAttenuationEndDistance:", v9);
  objc_msgSend(a3, "attenuationFalloffExponent");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "setAttenuationFalloffExponent:", v10);
  objc_msgSend(a3, "spotInnerAngle");
  *(float *)&v11 = v11;
  objc_msgSend(v4, "setInnerConeAngle:", v11);
  objc_msgSend(a3, "spotOuterAngle");
  *(float *)&v12 = v12;
  objc_msgSend(v4, "setOuterConeAngle:", v12);
  if ((objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("ambient")) & 1) != 0)
  {
    v13 = 1;
LABEL_11:
    objc_msgSend(v4, "setLightType:", v13);
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("spot")) & 1) != 0)
  {
    v13 = 3;
    goto LABEL_11;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("directional")) & 1) != 0)
  {
    v13 = 2;
    goto LABEL_11;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("omni")))
  {
    v13 = 4;
    goto LABEL_11;
  }
  return v4;
}

@end
