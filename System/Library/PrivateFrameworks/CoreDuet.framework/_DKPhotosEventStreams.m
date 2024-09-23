@implementation _DKPhotosEventStreams

+ (id)sharesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/all"));
}

+ (id)shareExtensionStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/extension"));
}

+ (id)useAsWallpaperStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/useAsWallpaper"));
}

+ (id)createWatchFaceStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/createWatchFace"));
}

+ (id)airplayStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/airplay"));
}

+ (id)airdropStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/airdrop"));
}

+ (id)saveToFilesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/saveToFiles"));
}

+ (id)assignToContactStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/assignToContact"));
}

+ (id)addToAlbumStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/addToAlbum"));
}

+ (id)addToSharedAlbumStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/addToSharedAlbum"));
}

+ (id)hideStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/share/hide"));
}

+ (id)viewedFor1SecondStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/0To1Seconds"));
}

+ (id)viewedFor2SecondsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/1To2Seconds"));
}

+ (id)viewedFor3SecondsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/2To3Seconds"));
}

+ (id)eyeCatchinessStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/eyeCatchiness"));
}

+ (id)zoomEngagementStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/zoom"));
}

+ (id)otherEngagementStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/engagement/other"));
}

+ (id)recentFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/favorites/recent"));
}

+ (id)oldFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/favorites/old"));
}

+ (id)otherFavoritesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/favorites/other"));
}

+ (id)recentDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/deletes/recent"));
}

+ (id)oldDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/deletes/old"));
}

+ (id)allDeletionsStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/deletes/all"));
}

+ (id)editFilterStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/edit/filter"));
}

+ (id)editLightingStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/edit/lighting"));
}

+ (id)editCropStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/edit/crop"));
}

+ (id)editAllStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/edit/all"));
}

+ (id)livePhotosLoopStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/livePhotos/loop"));
}

+ (id)livePhotosBounceStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/livePhotos/bounce"));
}

+ (id)livePhotosLongExposureStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/livePhotos/longExposure"));
}

+ (id)livePhotosOtherStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/livePhotos/other"));
}

+ (id)memoriesViewedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/viewed"));
}

+ (id)memoriesEngagementLowStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/engagement/low"));
}

+ (id)memoriesEngagementMediumStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/engagement/medium"));
}

+ (id)memoriesEngagementHighStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/engagement/high"));
}

+ (id)memoriesFavoritedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/favorited"));
}

+ (id)memoriesUnfavoritedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/unfavorited"));
}

+ (id)memoriesBlockedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/blocked"));
}

+ (id)memoriesDeletedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/deleted"));
}

+ (id)memoriesMoviePlayedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/moviePlayed"));
}

+ (id)memoriesNotificationSeenStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/notification/seen"));
}

+ (id)memoriesNotificationRespondedStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/notification/responded"));
}

+ (id)memoriesCreatedViaAddToMemoriesStream
{
  return +[_DKEventStream eventStreamWithName:](_DKEventStream, "eventStreamWithName:", CFSTR("/photos/memories/createdViaAddToMemories"));
}

@end
