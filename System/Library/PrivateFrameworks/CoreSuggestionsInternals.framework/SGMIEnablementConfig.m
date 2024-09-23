@implementation SGMIEnablementConfig

+ (BOOL)detectSalientMails
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0D198F0], "detectSalientMails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "isDNUOnlyEnablement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = objc_msgSend(v6, "BOOLValue");
      if (v7)
        v4 = 0;
      else
        v4 = v8;
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      if (!v9)
      {
        if (objc_msgSend(v7, "BOOLValue"))
          v4 = objc_msgSend(MEMORY[0x1E0D81588], "isDNUEnabled");
        else
          v4 = 1;
      }
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

+ (BOOL)logWarningSignatureStats
{
  void *v2;
  void *v3;
  char v4;

  +[SGMITrialClientWrapper sharedInstance](SGMITrialClientWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureStatsLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
