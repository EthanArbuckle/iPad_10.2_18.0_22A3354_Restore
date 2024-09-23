@implementation UNCSectionIconVariant(BBPrivate)

- (id)initWithSectionIconVariant:()BBPrivate
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&off_2549A5CB8;
  v5 = objc_msgSendSuper2(&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v5, "setFormat:", objc_msgSend(v4, "format"));
    objc_msgSend(v4, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundlePath:", v6);

    objc_msgSend(v5, "setPrecomposed:", objc_msgSend(v4, "isPrecomposed"));
    objc_msgSend(v4, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v5, "setImageData:", v7);
    objc_msgSend(v4, "imagePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v5, "setImagePath:", v8);
    objc_msgSend(v4, "imageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v5, "setImageName:", v9);
    objc_msgSend(v4, "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v5, "setApplicationIdentifier:", v10);
    objc_msgSend(v4, "systemImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v5, "setSystemImageName:", v11);
    v12 = v5;

  }
  return v5;
}

@end
