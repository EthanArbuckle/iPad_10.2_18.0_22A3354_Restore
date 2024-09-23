@implementation SAMovieV2MovieListCell

- (id)_afui_mapsRelatedChild
{
  return -[SAMovieV2MovieListCell movieDetailSnippet](self, "movieDetailSnippet");
}

@end
