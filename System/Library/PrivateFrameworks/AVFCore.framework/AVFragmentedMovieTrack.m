@implementation AVFragmentedMovieTrack

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentedMovieTrack, 0);
}

@end
