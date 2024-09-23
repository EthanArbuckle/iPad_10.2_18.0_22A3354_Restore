@implementation NSXPCInterface(GEOAppleMediaServicesProtocol)

+ (id)_geo_GEOAppleMediaServicesProtocolInterface
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE046C08);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_mediaResultWithIdentifiers_bundleIdentifiers_type_artworkSize_screenScale_source_completion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_mediaResultWithIdentifiers_bundleIdentifiers_type_artworkSize_screenScale_source_completion_, 1, 1);

  return v0;
}

@end
