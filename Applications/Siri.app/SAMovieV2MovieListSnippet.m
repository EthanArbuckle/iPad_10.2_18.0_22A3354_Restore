@implementation SAMovieV2MovieListSnippet

- (id)_afui_mapsRelatedChildren
{
  return -[SAMovieV2MovieListSnippet movieListCells](self, "movieListCells");
}

@end
