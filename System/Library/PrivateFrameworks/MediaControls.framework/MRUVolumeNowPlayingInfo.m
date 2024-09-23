@implementation MRUVolumeNowPlayingInfo

- (MRUVolumeNowPlayingInfo)initWithBundleID:(id)a3 name:(id)a4 formatDescription:(id)a5
{
  id v9;
  id v10;
  id v11;
  MRUVolumeNowPlayingInfo *v12;
  MRUVolumeNowPlayingInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MRUVolumeNowPlayingInfo;
  v12 = -[MRUVolumeNowPlayingInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundleID, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_formatDescription, a5);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  MRUVolumeNowPlayingInfo *v4;
  MRUVolumeNowPlayingInfo *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v4 = (MRUVolumeNowPlayingInfo *)a3;
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
      -[MRUVolumeNowPlayingInfo bundleID](v5, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", self->_bundleID);

      -[MRUVolumeNowPlayingInfo name](v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 & objc_msgSend(v8, "isEqual:", self->_name);

      -[MRUVolumeNowPlayingInfo formatDescription](v5, "formatDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v9 & objc_msgSend(v10, "isEqualToString:", self->_formatDescription);
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)formatDescription
{
  return self->_formatDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
