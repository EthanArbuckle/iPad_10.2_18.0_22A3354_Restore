@implementation CDComplicationImageViewProvider

+ (id)viewForImageProvider:(id)a3
{
  id v3;
  void *v4;
  void (**v5)(_QWORD);
  CDStackedImagesComplicationImageView *v6;
  CDStackedImagesComplicationImageView *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "imageViewCreationHandler");
    v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "maxSize");
      v5[2](v5);
      v6 = (CDStackedImagesComplicationImageView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_alloc_init(CDStackedImagesComplicationImageView);
    }
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)existingImageView:(id)a3 supportsImageProvider:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  char v8;

  v5 = a3;
  objc_msgSend(a4, "imageViewCreationHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = 0;
  if (v5 && a4)
    v8 = (v6 != 0) ^ isKindOfClass;
  return v8 & 1;
}

@end
