@implementation UIImage(MKTransitArtworkExtras)

+ (uint64_t)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:
{
  return objc_msgSend(a1, "_mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:", a3, a4, 0);
}

+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:nightMode:
{
  id v9;
  void *v10;
  void *v11;

  v9 = a4;
  +[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:", v9, a5, 2, a6, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_mapkit_transitArtworkImageWithDataSource:()MKTransitArtworkExtras size:scale:withWidthPaddingMultiple:
{
  id v9;
  void *v10;
  void *v11;

  v9 = a5;
  +[MKTransitArtworkManager sharedInstance](MKTransitArtworkManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitArtworkImageWithDataSource:size:featureType:scale:nightMode:withWidthPaddingMultiple:", v9, a6, 2, 0, a1, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_mapkit_imageFromVKImage:()MKTransitArtworkExtras
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  float v7;
  float v8;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CEA638];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "image");
  objc_msgSend(v4, "contentScale");
  v8 = v7;

  return (id)objc_msgSend(v5, "initWithCGImage:scale:orientation:", v6, 0, v8);
}

@end
