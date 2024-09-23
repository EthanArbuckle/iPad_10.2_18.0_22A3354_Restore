@implementation CNTUCallProvider

- (CNTUCallProvider)initWithCallProvider:(id)a3
{
  id v4;
  CNTUCallProvider *v5;
  uint64_t v6;
  TUCallProvider *callProvider;
  CNTUCallProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTUCallProvider;
  v5 = -[CNTUCallProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    callProvider = v5->_callProvider;
    v5->_callProvider = (TUCallProvider *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)localizedName
{
  void *v2;
  void *v3;

  -[CNTUCallProvider callProvider](self, "callProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[CNTUCallProvider callProvider](self, "callProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)supportsAudio
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNTUCallProvider callProvider](self, "callProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTelephonyProvider") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[CNTUCallProvider callProvider](self, "callProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isFaceTimeProvider") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      -[CNTUCallProvider callProvider](self, "callProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "supportsAudioOnly");

    }
  }

  return v4;
}

- (BOOL)supportsVideo
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[CNTUCallProvider callProvider](self, "callProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTelephonyProvider") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[CNTUCallProvider callProvider](self, "callProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isFaceTimeProvider") & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      -[CNTUCallProvider callProvider](self, "callProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "supportsAudioAndVideo");

    }
  }

  return v4;
}

- (NSSet)supportedHandleTypes
{
  void *v2;
  void *v3;

  -[CNTUCallProvider callProvider](self, "callProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedHandleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)dialRequestForHandle:(id)a3 contact:(id)a4 video:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  Class (__cdecl *v9)();
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v8 = a4;
  v9 = (Class (__cdecl *)())getTUDialRequestClass_2;
  v10 = a3;
  v11 = objc_alloc(v9());
  -[CNTUCallProvider callProvider](self, "callProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithProvider:", v12);

  +[CNHandle tuHandleForHandle:](CNHandle, "tuHandleForHandle:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHandle:", v14);

  objc_msgSend(v10, "customIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setProviderCustomIdentifier:", v15);
  if (objc_msgSend(v8, "hasBeenPersisted"))
  {
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContactIdentifier:", v16);

  }
  objc_msgSend(v13, "setVideo:", v5);

  return v13;
}

- (TUCallProvider)callProvider
{
  return self->_callProvider;
}

- (void)setCallProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProvider, 0);
}

@end
