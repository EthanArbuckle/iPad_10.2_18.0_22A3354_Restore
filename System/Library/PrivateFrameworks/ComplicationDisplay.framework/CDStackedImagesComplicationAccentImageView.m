@implementation CDStackedImagesComplicationAccentImageView

- (int64_t)_backgroundFilterStyle
{
  void *v2;
  void *v3;
  int v4;

  -[CDStackedImagesComplicationImageView filterProvider](self, "filterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CDShowGossamerUI(v3);

  if (v4)
    return 2;
  else
    return 0;
}

- (int64_t)_foregroundFilterStyle
{
  void *v2;
  void *v3;
  int v4;

  -[CDStackedImagesComplicationImageView filterProvider](self, "filterProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CDShowGossamerUI(v3);

  if (v4)
    return 0;
  else
    return 2;
}

@end
