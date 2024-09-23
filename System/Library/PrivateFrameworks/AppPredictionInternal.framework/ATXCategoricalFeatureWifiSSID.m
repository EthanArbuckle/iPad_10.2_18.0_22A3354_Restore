@implementation ATXCategoricalFeatureWifiSSID

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "deviceStateContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiSSID");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("<Unexpected Category Value>");
  v7 = v5;

  return v7;
}

@end
