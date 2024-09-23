@implementation AFDataStore(AFUIDataStoring)

- (void)setImage:()AFUIDataStoring forKey:
{
  objc_class *v6;
  id v7;
  UIImage *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  if (a3)
  {
    v6 = (objc_class *)MEMORY[0x24BE091F0];
    v7 = a4;
    v8 = a3;
    v12 = objc_alloc_init(v6);
    UIImagePNGRepresentation(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageData:", v9);

    -[UIImage scale](v8, "scale");
    v11 = v10;

    objc_msgSend(v12, "setScale:", v11);
    objc_msgSend(a1, "setImageData:forKey:", v12, v7);

  }
}

- (id)imageForKey:()AFUIDataStoring
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "imageDataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x24BEBD640]);
  objc_msgSend(v1, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v4 = (void *)objc_msgSend(v2, "initWithData:scale:", v3);

  return v4;
}

- (_AFUIDataStoringShim)afui_dataStoringShim
{
  _AFUIDataStoringShim *v2;
  void *v3;
  _AFUIDataStoringShim *v4;

  v2 = [_AFUIDataStoringShim alloc];
  objc_msgSend(a1, "propertyListRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_AFUIDataStoringShim initWithPropertyListRepresentation:](v2, "initWithPropertyListRepresentation:", v3);

  return v4;
}

@end
