@implementation ASCLocalOffer

- (ASCLocalOffer)initWithMetadata:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  ASCLocalOffer *v8;
  uint64_t v9;
  ASCOfferMetadata *metadata;
  uint64_t v11;
  id action;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCLocalOffer;
  v8 = -[ASCLocalOffer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    metadata = v8->_metadata;
    v8->_metadata = (ASCOfferMetadata *)v9;

    v11 = objc_msgSend(v7, "copy");
    action = v8->_action;
    v8->_action = (id)v11;

  }
  return v8;
}

+ (id)viewInAppStoreOfferForLockupView:(id)a3
{
  id v4;
  id v5;
  ASCViewInAppStoreOfferMetadata *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, v4);
  v5 = objc_alloc((Class)a1);
  v6 = objc_alloc_init(ASCViewInAppStoreOfferMetadata);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__ASCLocalOffer_viewInAppStoreOfferForLockupView___block_invoke;
  v9[3] = &unk_1E7560470;
  objc_copyWeak(&v10, &location);
  v7 = (void *)objc_msgSend(v5, "initWithMetadata:action:", v6, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

void __50__ASCLocalOffer_viewInAppStoreOfferForLockupView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentProductDetailsViewController");

}

- (ASCAdamID)id
{
  return +[ASCAdamID invalidAdamID](ASCAdamID, "invalidAdamID");
}

- (NSDictionary)titles
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSDictionary)subtitles
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)price
{
  return 0;
}

- (id)formattedPrice
{
  return 0;
}

- (int64_t)flags
{
  return 0;
}

- (NSNumber)ageRating
{
  return 0;
}

- (NSArray)metrics
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLocalOffer metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLocalOffer action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1BCCFE944]();
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;

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
    -[ASCLocalOffer metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "metadata");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_10;
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      -[ASCLocalOffer action](self, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1BCCFE944]();
      objc_msgSend(v7, "action");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1BCCFE944]();
      v15 = (void *)v14;
      if (v12 && v14)
        v16 = objc_msgSend(v12, "isEqual:", v14);
      else
        v16 = v12 == (void *)v14;

      goto LABEL_18;
    }
    v16 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLocalOffer metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("metadata"));

  -[ASCLocalOffer action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1BCCFE944]();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("action"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ASCOfferMetadata)metadata
{
  return self->_metadata;
}

- (id)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
