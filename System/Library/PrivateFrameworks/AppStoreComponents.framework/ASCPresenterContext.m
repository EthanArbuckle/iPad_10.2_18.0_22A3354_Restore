@implementation ASCPresenterContext

+ (ASCPresenterContext)sharedContext
{
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_23);
  return (ASCPresenterContext *)(id)sharedContext_sharedContext;
}

void __36__ASCPresenterContext_sharedContext__block_invoke()
{
  ASCPresenterContext *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = [ASCPresenterContext alloc];
  +[ASCArtworkFetcher sharedFetcher](ASCArtworkFetcher, "sharedFetcher");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ASCLockupFetcher sharedFetcher](ASCLockupFetcher, "sharedFetcher");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCAppOfferStateCenter sharedCenter](ASCAppOfferStateCenter, "sharedCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[ASCPresenterContext initWithArtworkFetcher:lockupFetcher:appOfferStateCenter:](v0, "initWithArtworkFetcher:lockupFetcher:appOfferStateCenter:", v5, v1, v2);
  v4 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = v3;

}

- (ASCPresenterContext)initWithArtworkFetcher:(id)a3 lockupFetcher:(id)a4 appOfferStateCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASCPresenterContext *v12;
  ASCPresenterContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASCPresenterContext;
  v12 = -[ASCPresenterContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_artworkFetcher, a3);
    objc_storeStrong((id *)&v13->_lockupFetcher, a4);
    objc_storeStrong((id *)&v13->_appOfferStateCenter, a5);
  }

  return v13;
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCPresenterContext artworkFetcher](self, "artworkFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCPresenterContext lockupFetcher](self, "lockupFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCPresenterContext appOfferStateCenter](self, "appOfferStateCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCPresenterContext artworkFetcher](self, "artworkFetcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "artworkFetcher");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
      {
LABEL_10:
        -[ASCPresenterContext lockupFetcher](self, "lockupFetcher");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lockupFetcher");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v11 && v12)
        {
          if (objc_msgSend(v11, "isEqual:", v12))
            goto LABEL_13;
        }
        else if (v11 == (void *)v12)
        {
LABEL_13:
          -[ASCPresenterContext appOfferStateCenter](self, "appOfferStateCenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appOfferStateCenter");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v14 && v15)
            v17 = objc_msgSend(v14, "isEqual:", v15);
          else
            v17 = v14 == (void *)v15;

          goto LABEL_23;
        }
        v17 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (v8 == (void *)v9)
    {
      goto LABEL_10;
    }
    v17 = 0;
LABEL_24:

    goto LABEL_25;
  }
  v17 = 0;
LABEL_25:

  return v17;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCPresenterContext artworkFetcher](self, "artworkFetcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("artworkFetcher"));

  -[ASCPresenterContext lockupFetcher](self, "lockupFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("lockupFetcher"));

  -[ASCPresenterContext appOfferStateCenter](self, "appOfferStateCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("appOfferStateCenter"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ASCArtworkFetcher)artworkFetcher
{
  return self->_artworkFetcher;
}

- (ASCLockupFetcher)lockupFetcher
{
  return self->_lockupFetcher;
}

- (ASCAppOfferStateCenter)appOfferStateCenter
{
  return self->_appOfferStateCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appOfferStateCenter, 0);
  objc_storeStrong((id *)&self->_lockupFetcher, 0);
  objc_storeStrong((id *)&self->_artworkFetcher, 0);
}

@end
