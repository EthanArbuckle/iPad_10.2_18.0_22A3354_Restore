@implementation PodcastsUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MTPlayerController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MTPlayerController"), CFSTR("defaultInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTPlayerController"), CFSTR("mediaRemoteController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMediaRemoteController"), CFSTR("player"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMAVPlayer"), CFSTR("playbackSpeed"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMAVPlayer"), CFSTR("togglePlayPause"), "B", 0);

}

- (id)_accessibilityPlayer
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)MEMORY[0x234919BBC](CFSTR("MTPlayerController"), a2), "safeValueForKey:", CFSTR("defaultInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("mediaRemoteController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("player"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityPlaybackSpeed
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[PodcastsUIApplicationAccessibility _accessibilityPlayer](self, "_accessibilityPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("playbackSpeed"));

  if (v3 > 5)
  {
    v4 = 0;
  }
  else
  {
    accessibilityLocalizedString(off_2502FD1B0[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
