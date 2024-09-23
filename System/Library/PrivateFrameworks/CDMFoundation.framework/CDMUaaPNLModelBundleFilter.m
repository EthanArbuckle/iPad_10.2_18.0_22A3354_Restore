@implementation CDMUaaPNLModelBundleFilter

+ (id)selectModelBundlesForLoadedAppModelBundles:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
