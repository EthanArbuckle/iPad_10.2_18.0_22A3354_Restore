@implementation HDHealthRecordsPrivateUserAgentString

void __HDHealthRecordsPrivateUserAgentString_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = (id)objc_msgSend(CFSTR("Health/1.0"), "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentOSName");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (__CFString *)v1;
  else
    v3 = CFSTR("Unknown");
  v4 = v3;

  objc_msgSend(v0, "currentOSVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = CFSTR("Unknown");
  v8 = v7;

  objc_msgSend(v19, "appendFormat:", CFSTR(" %@/%@"), v4, v8);
  objc_msgSend(v0, "currentDeviceProductType");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = CFSTR("Unknown");
  v12 = v11;

  objc_msgSend(v19, "appendFormat:", CFSTR(" %@"), v12);
  if (objc_msgSend(v0, "isAppleInternalInstall"))
  {
    objc_msgSend(v0, "currentOSBuild");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (__CFString *)v13;
    else
      v15 = CFSTR("Unknown");
    v16 = v15;

    objc_msgSend(v19, "appendFormat:", CFSTR(" (%@)"), v16);
  }
  v17 = objc_msgSend(v19, "copy");
  v18 = (void *)HDHealthRecordsPrivateUserAgentString_userAgent;
  HDHealthRecordsPrivateUserAgentString_userAgent = v17;

}

@end
