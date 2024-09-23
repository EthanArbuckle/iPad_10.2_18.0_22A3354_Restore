@implementation SAMovieV2MovieTheater

- (id)_afui_mapsRelatedChild
{
  return -[SAMovieV2MovieTheater business](self, "business");
}

- (id)_afui_mapsRelatedChildren
{
  return -[SAMovieV2MovieTheater movies](self, "movies");
}

@end
