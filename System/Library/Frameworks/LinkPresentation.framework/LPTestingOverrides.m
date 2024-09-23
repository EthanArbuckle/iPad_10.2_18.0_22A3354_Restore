@implementation LPTestingOverrides

+ (void)reset
{
  void *v2;
  void *v3;
  void *v4;

  _forceRTL = 0;
  _forceImageLoadingScaleFactor = 0;
  v2 = (void *)_forceSubsampleImagesToScreenSize;
  _forceSubsampleImagesToScreenSize = 0;

  _forceEnableAllEntitlements = 0;
  _forceIgnoreAllTCCChecks = 0;
  _forceMonospaceFonts = 0;
  _forceEnableLockdownMode = 0;
  v3 = (void *)_customLoader;
  _customLoader = 0;

  v4 = (void *)_additionalAllowedFileURLDirectories;
  _additionalAllowedFileURLDirectories = 0;

  _forceUseSmallerMaximumMetadataSize = 0;
  _forceDisableImageDeduplication = 0;
  _forceCollapseButtons = 0;
  +[LPResources clearCachedResources](LPResources, "clearCachedResources");
  +[LPTheme invalidateThemeCache](LPTheme, "invalidateThemeCache");
}

+ (void)setForceRTL:(BOOL)a3
{
  _forceRTL = a3;
}

+ (BOOL)forceRTL
{
  return _forceRTL;
}

+ (void)setForceImageLoadingScaleFactor:(unint64_t)a3
{
  _forceImageLoadingScaleFactor = a3;
  +[LPResources clearCachedResources](LPResources, "clearCachedResources");
}

+ (unint64_t)forceImageLoadingScaleFactor
{
  return _forceImageLoadingScaleFactor;
}

+ (void)setForceSubsampleImagesToScreenSize:(id)a3
{
  id v4;

  objc_storeStrong((id *)&_forceSubsampleImagesToScreenSize, a3);
  v4 = a3;
  +[LPResources clearCachedResources](LPResources, "clearCachedResources");

}

+ (NSNumber)forceSubsampleImagesToScreenSize
{
  return (NSNumber *)(id)_forceSubsampleImagesToScreenSize;
}

+ (void)setForceEnableAllEntitlements:(BOOL)a3
{
  _forceEnableAllEntitlements = a3;
}

+ (BOOL)forceEnableAllEntitlements
{
  return _forceEnableAllEntitlements;
}

+ (void)setForceIgnoreAllTCCChecks:(BOOL)a3
{
  _forceIgnoreAllTCCChecks = a3;
}

+ (BOOL)forceIgnoreAllTCCChecks
{
  return _forceIgnoreAllTCCChecks;
}

+ (void)setForceMonospaceFonts:(BOOL)a3
{
  _forceMonospaceFonts = a3;
  +[LPTheme invalidateThemeCache](LPTheme, "invalidateThemeCache");
}

+ (BOOL)forceMonospaceFonts
{
  return _forceMonospaceFonts;
}

+ (void)setForceEnableLockdownMode:(BOOL)a3
{
  _forceEnableLockdownMode = a3;
}

+ (BOOL)forceEnableLockdownMode
{
  return _forceEnableLockdownMode;
}

+ (void)setCustomLoader:(id)a3
{
  objc_storeStrong((id *)&_customLoader, a3);
}

+ (LPTestingLoader)customLoader
{
  return (LPTestingLoader *)(id)_customLoader;
}

+ (void)setAdditionalAllowedFileURLDirectories:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a3;
  v3 = objc_msgSend(v5, "copy");
  v4 = (void *)_additionalAllowedFileURLDirectories;
  _additionalAllowedFileURLDirectories = v3;

}

+ (NSArray)additionalAllowedFileURLDirectories
{
  return (NSArray *)(id)_additionalAllowedFileURLDirectories;
}

+ (BOOL)forceUseSmallerMaximumMetadataSize
{
  return _forceUseSmallerMaximumMetadataSize;
}

+ (void)setForceUseSmallerMaximumMetadataSize:(BOOL)a3
{
  _forceUseSmallerMaximumMetadataSize = a3;
}

+ (BOOL)forceDisableImageDeduplication
{
  return _forceDisableImageDeduplication;
}

+ (void)setForceDisableImageDeduplication:(BOOL)a3
{
  _forceDisableImageDeduplication = a3;
}

+ (BOOL)forceCollapseButtons
{
  return _forceCollapseButtons;
}

+ (void)setForceCollapseButtons:(BOOL)a3
{
  _forceCollapseButtons = a3;
}

@end
