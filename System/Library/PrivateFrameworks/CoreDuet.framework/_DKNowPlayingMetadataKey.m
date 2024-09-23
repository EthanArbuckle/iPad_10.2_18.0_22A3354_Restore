@implementation _DKNowPlayingMetadataKey

+ (id)playing
{
  return CFSTR("_DKNowPlayingMetadataKey-playing");
}

+ (id)album
{
  return CFSTR("_DKNowPlayingMetadataKey-album");
}

+ (id)artist
{
  return CFSTR("_DKNowPlayingMetadataKey-artist");
}

+ (id)duration
{
  return CFSTR("_DKNowPlayingMetadataKey-duration");
}

+ (id)elapsed
{
  return CFSTR("_DKNowPlayingMetadataKey-elapsed");
}

+ (id)genre
{
  return CFSTR("_DKNowPlayingMetadataKey-genre");
}

+ (id)title
{
  return CFSTR("_DKNowPlayingMetadataKey-title");
}

+ (id)identifier
{
  return CFSTR("_DKNowPlayingMetadataKey-identifier");
}

+ (id)mediaType
{
  return CFSTR("_DKNowPlayingMetadataKey-mediaType");
}

+ (id)iTunesStoreIdentifier
{
  return CFSTR("_DKNowPlayingMetadataKey-iTunesStoreIdentifier");
}

+ (id)iTunesSubscriptionIdentifier
{
  return CFSTR("_DKNowPlayingMetadataKey-iTunesSubscriptionIdentifier");
}

+ (id)outputDeviceIDs
{
  return CFSTR("_DKNowPlayingMetadataKey-outputDeviceIDs");
}

+ (id)isAirPlayVideo
{
  return CFSTR("_DKNowPlayingMetadataKey-isAirPlayVideo");
}

@end
