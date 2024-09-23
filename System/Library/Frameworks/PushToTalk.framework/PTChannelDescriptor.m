@implementation PTChannelDescriptor

- (PTChannelDescriptor)initWithName:(NSString *)name image:(UIImage *)image
{
  NSString *v6;
  UIImage *v7;
  PTChannelDescriptor *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSURL *imageFileURL;
  objc_super v14;

  v6 = name;
  v7 = image;
  v14.receiver = self;
  v14.super_class = (Class)PTChannelDescriptor;
  v8 = -[PTChannelDescriptor init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_image, image);
    _pttTemporaryFilesystemURLForImage(v7);
    v11 = objc_claimAutoreleasedReturnValue();
    imageFileURL = v8->_imageFileURL;
    v8->_imageFileURL = (NSURL *)v11;

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)image
{
  return self->_image;
}

- (NSURL)imageFileURL
{
  return self->_imageFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFileURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
