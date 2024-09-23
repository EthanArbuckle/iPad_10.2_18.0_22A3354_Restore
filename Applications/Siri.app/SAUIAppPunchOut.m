@implementation SAUIAppPunchOut

- (id)_convertedPunchout
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = objc_alloc_init((Class)SFPunchout);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut punchOutName](self, "punchOutName"));
  objc_msgSend(v3, "setName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut punchOutUri](self, "punchOutUri"));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v3, "setUrls:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut bundleId](self, "bundleId"));
  if (v7)
  {
    objc_msgSend(v3, "setBundleIdentifier:", v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SiriUIUtilities defaultBrowserBundleIdentifier](SiriUIUtilities, "defaultBrowserBundleIdentifier"));
    objc_msgSend(v3, "setBundleIdentifier:", v8);

  }
  return v3;
}

@end
