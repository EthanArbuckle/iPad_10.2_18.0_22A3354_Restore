@implementation MKMapItem(MUTransitStationSummary)

- (id)artworkImage
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_transitInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CC1970], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenScale");
  objc_msgSend(v5, "_mapkit_transitArtworkImageWithDataSource:size:scale:", v4, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
