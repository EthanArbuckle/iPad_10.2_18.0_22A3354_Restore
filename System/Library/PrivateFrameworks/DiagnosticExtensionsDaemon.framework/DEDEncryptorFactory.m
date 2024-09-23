@implementation DEDEncryptorFactory

+ (id)getEncryptorForExtensionIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[11];

  v9[10] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  v9[0] = CFSTR("com.apple.DiagnosticExtensions.Cinnamon");
  v9[1] = CFSTR("com.apple.DiagnosticExtensions.sysdiagnose");
  v9[2] = CFSTR("com.apple.AppleElementsSupport.AppleElementsSleepDiagnostic");
  v9[3] = CFSTR("com.apple.AppleElementsSupport.AppleElementsDiagnostic");
  v9[4] = CFSTR("com.apple.HealthAlgorithms.CycleTrackingDiagnosticExtension");
  v9[5] = CFSTR("com.apple.HeartRhythmAlgorithms.IRNDiagnosticExtension");
  v9[6] = CFSTR("com.apple.HealthLite.KaliDiagnosticExtension");
  v9[7] = CFSTR("com.apple.AfibBurden.AfibBurdenDiagnosticExtension");
  v9[8] = CFSTR("healthwrap");
  v9[9] = CFSTR("AppleEncryptedArchive");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  if (objc_msgSend(v6, "containsObject:", v3))
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("AppleEncryptedArchive"));
    v7 = (void *)objc_opt_new();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
