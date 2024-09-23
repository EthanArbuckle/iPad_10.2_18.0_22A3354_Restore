@implementation MUPlaceURLActivityProvider

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

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96D88]))
  {
    -[MUPlaceActivityProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[MUPlaceActivityProvider delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "airdropURLJSONForMapActivity:", self);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13[0] = CFSTR("SFAirDropActivitySubjectMain");
      -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = CFSTR("SFAirDropActivitySubjectMapsLinkType");
      v14[0] = v7;
      v14[1] = &unk_1E2E55428;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v8;

    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v11, 4);

    return v12;
  }
  else
  {
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    return (id)objc_claimAutoreleasedReturnValue();
  }
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
  -[MUPlaceActivityProvider mapItem](self, "mapItem", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceActivityProvider activityAnnotationView](self, "activityAnnotationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailWithSize:annotationView:", v9, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  if (objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D96D88]))
  {
    -[MUPlaceActivityProvider activityAnnotationView](self, "activityAnnotationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 180.0;
    v7 = 240.0;
  }
  else
  {
    v5 = 0;
    v7 = 84.0;
    v6 = 84.0;
  }
  -[MUPlaceActivityProvider mapItem](self, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thumbnailWithSize:annotationView:", v5, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)activityViewController:(id)a3 attachmentULRTypeForActivityType:(id)a4
{
  return 2;
}

@end
