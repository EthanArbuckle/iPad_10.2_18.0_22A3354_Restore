@implementation AVMovieTrackInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metadataWaitingSemaphore, 0);
}

@end
