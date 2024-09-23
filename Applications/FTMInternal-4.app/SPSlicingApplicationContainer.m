@implementation SPSlicingApplicationContainer

+ (id)_coreTelephonyAppInfoContainer:(id)a3
{
  id v3;
  SPSlicingApplicationContainer *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_new(SPSlicingApplicationContainer);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appsInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SPSlicingApplicationInfo _coreTelephonyAppInfoList:](SPSlicingApplicationInfo, "_coreTelephonyAppInfoList:", v5));
  -[SPSlicingApplicationContainer setAppsInfo:](v4, "setAppsInfo:", v6);

  return v4;
}

- (NSArray)appsInfo
{
  return self->_appsInfo;
}

- (void)setAppsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_appsInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsInfo, 0);
}

@end
