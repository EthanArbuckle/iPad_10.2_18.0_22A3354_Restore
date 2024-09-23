@implementation UIDevice(HUAdditions)

+ (id)hu_modelAndNetworkLocalizedStringKeyForKey:()HUAdditions
{
  void *v1;
  int v2;
  const __CFString *v3;
  void *v4;

  objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(MEMORY[0x1E0D319D0], "useWLANInsteadOfWiFi");
  v3 = CFSTR("WIFI");
  if (v2)
    v3 = CFSTR("WLAN");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
