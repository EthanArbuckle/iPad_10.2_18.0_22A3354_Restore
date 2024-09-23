@implementation MRNowPlayingAudioFormatApplication

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p | bundleID: %@ | displayName: %@"), objc_opt_class(), self, self->_bundleID, self->_displayName);
}

- (BOOL)isEqual:(id)a3
{
  MRNowPlayingAudioFormatApplication *v4;
  MRNowPlayingAudioFormatApplication *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;

  v4 = (MRNowPlayingAudioFormatApplication *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRNowPlayingAudioFormatApplication bundleID](v5, "bundleID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", self->_bundleID);

      -[MRNowPlayingAudioFormatApplication displayName](v5, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v7 & objc_msgSend(v8, "isEqualToString:", self->_displayName);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (MRNowPlayingAudioFormatApplication)initWithBundleID:(id)a3 displayName:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingAudioFormatApplication *v9;
  MRNowPlayingAudioFormatApplication *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRNowPlayingAudioFormatApplication;
  v9 = -[MRNowPlayingAudioFormatApplication init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
