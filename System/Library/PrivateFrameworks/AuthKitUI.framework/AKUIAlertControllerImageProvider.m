@implementation AKUIAlertControllerImageProvider

+ (id)imageForUIAlertController
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0C99D50]);
  +[AKAlertImageURLProvider url](AKAlertImageURLProvider, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfURL:", v3);

  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
