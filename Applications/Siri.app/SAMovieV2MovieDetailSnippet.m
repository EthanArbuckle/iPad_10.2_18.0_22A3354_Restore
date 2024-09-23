@implementation SAMovieV2MovieDetailSnippet

- (id)_afui_mapsRelatedChildren
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAMovieV2MovieDetailSnippet showtimeSnippet](self, "showtimeSnippet"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAMovieV2MovieDetailSnippet theaterShowtimeListSnippet](self, "theaterShowtimeListSnippet"));
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

@end
