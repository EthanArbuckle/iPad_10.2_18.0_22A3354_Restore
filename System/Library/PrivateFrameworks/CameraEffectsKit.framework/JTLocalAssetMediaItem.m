@implementation JTLocalAssetMediaItem

- (JTLocalAssetMediaItem)initWithURL:(id)a3
{
  id v4;
  JTLocalAssetMediaItem *v5;
  JTLocalAssetMediaItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)JTLocalAssetMediaItem;
  v5 = -[JFXMediaItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[JTLocalAssetMediaItem setLocalFileURL:](v5, "setLocalFileURL:", v4);

  return v6;
}

- (void)dealloc
{
  NSURL *localFileURL;
  NSString *localFileName;
  objc_super v5;

  localFileURL = self->_localFileURL;
  self->_localFileURL = 0;

  localFileName = self->_localFileName;
  self->_localFileName = 0;

  v5.receiver = self;
  v5.super_class = (Class)JTLocalAssetMediaItem;
  -[JFXMediaItem dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  if (self->_localFileURL)
  {
    v8.receiver = self;
    v8.super_class = (Class)JTLocalAssetMediaItem;
    -[JFXMediaItem description](&v8, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\r\turl: %@"), self->_localFileURL);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)JTLocalAssetMediaItem;
    -[JFXMediaItem description](&v7, sel_description);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSURL *localFileURL;
  uint64_t v7;
  void *v8;
  NSString *localFileName;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)JTLocalAssetMediaItem;
  v5 = -[JFXMediaItem copyWithZone:](&v13, sel_copyWithZone_);
  localFileURL = self->_localFileURL;
  if (localFileURL)
  {
    v7 = -[NSURL copyWithZone:](localFileURL, "copyWithZone:", a3);
    v8 = (void *)v5[8];
    v5[8] = v7;
  }
  else
  {
    v8 = (void *)v5[8];
    v5[8] = 0;
  }

  localFileName = self->_localFileName;
  if (localFileName)
  {
    v10 = -[NSString copyWithZone:](localFileName, "copyWithZone:", a3);
    v11 = (void *)v5[7];
    v5[7] = v10;
  }
  else
  {
    v11 = (void *)v5[7];
    v5[7] = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  JTLocalAssetMediaItem *v4;
  JTLocalAssetMediaItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (JTLocalAssetMediaItem *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTLocalAssetMediaItem localFileURL](v5, "localFileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v8, "isEqualToString:", v10);

      }
      else
      {
        -[JTLocalAssetMediaItem localFileName](self, "localFileName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
LABEL_10:

          goto LABEL_11;
        }
        -[JTLocalAssetMediaItem localFileName](self, "localFileName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[JTLocalAssetMediaItem localFileName](v5, "localFileName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v7, "isEqual:", v8);
      }

      goto LABEL_10;
    }
    LOBYTE(v11) = 0;
  }
LABEL_11:

  return (char)v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[JTLocalAssetMediaItem localFileURL](self, "localFileURL");
  else
    -[JTLocalAssetMediaItem localFileName](self, "localFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (void)setLocalFileURL:(id)a3
{
  NSString *v5;
  NSString *localFileName;
  id v7;

  objc_storeStrong((id *)&self->_localFileURL, a3);
  v7 = a3;
  objc_msgSend(v7, "lastPathComponent");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  localFileName = self->_localFileName;
  self->_localFileName = v5;

}

- (BOOL)canSaveToCameraRoll
{
  return self->_localFileURL != 0;
}

- (JTLocalAssetMediaItem)initWithInfo:(id)a3 delegate:(id)a4
{
  id v5;
  JTLocalAssetMediaItem *v6;
  uint64_t v7;
  NSString *localFileName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JTLocalAssetMediaItem;
  v5 = a3;
  v6 = -[JFXMediaItem initWithInfo:delegate:](&v10, sel_initWithInfo_delegate_, v5, a4);
  objc_msgSend(v5, "objectForKey:", kMediaItemLocalFileNameKey, v10.receiver, v10.super_class);
  v7 = objc_claimAutoreleasedReturnValue();

  localFileName = v6->_localFileName;
  v6->_localFileName = (NSString *)v7;

  return v6;
}

- (id)info
{
  void *v3;
  void *v4;
  void *v5;
  NSString *localFileName;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v8.receiver = self;
  v8.super_class = (Class)JTLocalAssetMediaItem;
  -[JFXMediaItem info](&v8, sel_info);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  localFileName = self->_localFileName;
  if (localFileName)
    objc_msgSend(v5, "setObject:forKey:", localFileName, kMediaItemLocalFileNameKey);
  return v5;
}

- (NSString)localFileName
{
  return self->_localFileName;
}

- (void)setLocalFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)localFileURL
{
  return self->_localFileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localFileURL, 0);
  objc_storeStrong((id *)&self->_localFileName, 0);
}

@end
