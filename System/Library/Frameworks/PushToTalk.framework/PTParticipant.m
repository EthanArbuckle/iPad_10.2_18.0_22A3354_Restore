@implementation PTParticipant

- (PTParticipant)initWithName:(NSString *)name image:(UIImage *)image
{
  NSString *v6;
  UIImage *v7;
  PTParticipant *v8;
  PTParticipant *v9;
  void *v10;
  uint64_t v11;
  CXParticipant *underlyingParticipant;
  objc_super v14;

  v6 = name;
  v7 = image;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("name must be a kind of NSString"));
  if (-[NSString length](v6, "length"))
  {
    if (!v7)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("name length must be greater than 0"));
    if (!v7)
      goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("image must be a UIImage"));
LABEL_9:
  v14.receiver = self;
  v14.super_class = (Class)PTParticipant;
  v8 = -[PTParticipant init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_image, image);
      _pttTemporaryFilesystemURLForImage(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDB78F0]), "initWithName:imageURL:", v6, v10);
    underlyingParticipant = v9->_underlyingParticipant;
    v9->_underlyingParticipant = (CXParticipant *)v11;

    -[CXParticipant setWrappedByObject:](v9->_underlyingParticipant, "setWrappedByObject:", v9);
  }

  return v9;
}

- (UIImage)image
{
  return self->_image;
}

- (id)imageFileURL
{
  void *v2;
  void *v3;

  -[PTParticipant underlyingParticipant](self, "underlyingParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[PTParticipant underlyingParticipant](self, "underlyingParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PTParticipant underlyingParticipant](self, "underlyingParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "underlyingParticipant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTParticipant underlyingParticipant](self, "underlyingParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CXParticipant)underlyingParticipant
{
  return self->_underlyingParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingParticipant, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
