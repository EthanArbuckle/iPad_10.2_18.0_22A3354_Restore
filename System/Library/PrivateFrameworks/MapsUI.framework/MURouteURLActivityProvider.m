@implementation MURouteURLActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96D88]))
  {
    -[MURouteActivityProvider activityURL](self, "activityURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96D88]))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", &unk_1E2E55D68, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    _MULocalizedStringFromThisBundle(CFSTR("Directions to %@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  void *v8;
  void *v9;
  void *v10;

  height = a5.height;
  width = a5.width;
  -[MUPlaceActivityProvider activityAnnotationView](self, "activityAnnotationView", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thumbnailWithSize:annotationView:", v8, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
