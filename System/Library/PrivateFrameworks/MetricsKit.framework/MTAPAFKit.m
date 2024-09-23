@implementation MTAPAFKit

- (id)trackerWithPlaylist:(id)a3
{
  id v4;
  MTPAFTracker *v5;

  v4 = a3;
  v5 = objc_alloc_init(MTPAFTracker);
  -[MTPAFTracker trackPlaylist:using:](v5, "trackPlaylist:using:", v4, self);

  return v5;
}

@end
