@implementation MULookAroundTextActivityProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    -[MUPlaceActivityProvider activityURL](self, "activityURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MULookAroundTextActivityProvider activityViewController:subjectForActivityType:](self, "activityViewController:subjectForActivityType:", v6, v7);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      v9 = &stru_1E2E05448;
    -[__CFString _navigation_sanitizedStringForDisplayInHTML](v9, "_navigation_sanitizedStringForDisplayInHTML");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("<html><head><meta charset=\"utf-8\" /></head><body><a href=\"%@\">%@</a></body></html>"), v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D96DC0]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D96DA0]) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1E2E05448;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  _MULocalizedStringFromThisBundle(CFSTR("Look Around: %@ [Sharing]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
