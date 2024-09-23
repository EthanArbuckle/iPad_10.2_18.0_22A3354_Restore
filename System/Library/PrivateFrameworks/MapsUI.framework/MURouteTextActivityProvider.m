@implementation MURouteTextActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1E2E05448;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    -[MURouteActivityProvider activityURL](self, "activityURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    _MULocalizedStringFromThisBundle(CFSTR("[Route Sharing] Email body"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MURouteActivityProvider activitySourceTitle](self, "activitySourceTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "_navigation_sanitizedStringForDisplayInHTML");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<html><head><meta charset=\"utf-8\" /></head><body><a href='%@'>%@</a></body></html>"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

@end
