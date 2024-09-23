@implementation ATXPETEventTracker2Logger

- (void)logMessage:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D80F28];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:", v4);

}

- (void)trackScalarForMessage:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D80F28];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackScalarForMessage:", v4);

}

- (void)trackScalarForMessage:(id)a3 count:(int)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)MEMORY[0x1E0D80F28];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackScalarForMessage:count:", v6, v4);

}

- (void)trackDistributionForMessage:(id)a3 value:(double)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D80F28];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackDistributionForMessage:value:", v6, a4);

}

@end
