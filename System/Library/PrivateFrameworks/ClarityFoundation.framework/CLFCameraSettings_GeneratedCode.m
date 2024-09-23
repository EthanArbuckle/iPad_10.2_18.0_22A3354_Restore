@implementation CLFCameraSettings_GeneratedCode

+ (CLFCameraSettings)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_6);
  return (CLFCameraSettings *)(id)sharedInstance_SharedSettings_3;
}

- (CLFCameraSettings_GeneratedCode)init
{
  CLFCameraSettings_GeneratedCode *v2;
  CLFCameraSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CLFCameraSettings_GeneratedCode;
  v2 = -[CLFBaseSettings init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowPhotoCapture);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AllowPhotoCapture"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowSelfieCapture);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("AllowSelfieCapture"), v7);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowSelfieVideoCapture);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("AllowSelfieVideoCapture"), v9);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowVideoCapture);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("AllowVideoCapture"), v11);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI.Camera");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___CLFCameraSettings_GeneratedCode;
  objc_msgSendSuper2(&v10, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_allowPhotoCapture);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  NSStringFromSelector(sel_allowSelfieCapture);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  NSStringFromSelector(sel_allowSelfieVideoCapture);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  NSStringFromSelector(sel_allowVideoCapture);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)allowPhotoCapture
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("AllowPhotoCapture"), 1);
}

- (void)setAllowPhotoCapture:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AllowPhotoCapture"));

}

- (BOOL)allowSelfieCapture
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("AllowSelfieCapture"), 0);
}

- (void)setAllowSelfieCapture:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AllowSelfieCapture"));

}

- (BOOL)allowSelfieVideoCapture
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("AllowSelfieVideoCapture"), 0);
}

- (void)setAllowSelfieVideoCapture:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AllowSelfieVideoCapture"));

}

- (BOOL)allowVideoCapture
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("AllowVideoCapture"), 0);
}

- (void)setAllowVideoCapture:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AllowVideoCapture"));

}

@end
