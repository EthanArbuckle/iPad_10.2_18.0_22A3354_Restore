@implementation ASDEventServiceExtension

- (int64_t)didReceiveInstallationEvent:(id)a3
{
  return 0;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v12;
  else
    v4 = 0;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v5, "setExtensionInstance:", self);
    v11 = v12;
  }
  else
  {
    ASDErrorWithUserInfoAndFormat(901, 0, CFSTR("context is not an instance of ASDEventServiceExtensionRemoteContext: context='%@'"), v6, v7, v8, v9, v10, (uint64_t)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancelRequestWithError:", v11);
  }

}

@end
