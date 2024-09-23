@implementation CUICalibration

+ (void)showCalibrationAlert
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.compass"));
  objc_msgSend(MEMORY[0x24BE3CFE0], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isInternalInstall"))
  {

    goto LABEL_5;
  }
  v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CalibrationDisabled"));

  if (!v4)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2559843C0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.CompassCalibration"));
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);
    objc_msgSend(v6, "resume");
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_22825AD90;
    v9[3] = &unk_24F0D2350;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "showCalibrationAlert:", v9);

    goto LABEL_6;
  }
  NSLog(CFSTR("The calibration sheet is disabled. Please re-enable it if you want to see the calibration sheet."));
LABEL_6:

}

+ (void)dismissCalibrationAlert
{
  notify_post("com.apple.DismissCalibration");
}

@end
