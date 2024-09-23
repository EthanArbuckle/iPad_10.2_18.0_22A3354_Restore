@implementation MULookAroundURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if ((objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96DB0]) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[MUPlaceActivityProvider activityURL](self, "activityURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  height = a5.height;
  width = a5.width;
  v8 = objc_alloc(MEMORY[0x1E0CC1A58]);
  -[MUPlaceActivityProvider activityURL](self, "activityURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithURL:", v9);

  objc_msgSend(v10, "parseIncludingCustomParameters:", 1);
  if (objc_msgSend(v10, "mapType") == 107)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CC1860]);
    objc_msgSend(v11, "setMapType:", objc_msgSend(v10, "mapType"));
    objc_msgSend(v10, "mapCamera");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCamera:", v12);

    objc_msgSend(v11, "setSize:", width, height);
    objc_msgSend(v11, "_setShowsPointLabels:", 0);
    objc_msgSend(v11, "_setShowsAppleLogo:", 0);
    objc_msgSend(MEMORY[0x1E0CC1850], "createSnapshotWithOptions:timeoutInSeconds:", v11, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
