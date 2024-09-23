@implementation AMSMarketingItem

- (AMSMarketingItem)initWithDictionary:(id)a3
{
  id v5;
  AMSMarketingItem *v6;
  AMSMarketingItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMarketingItem;
  v6 = -[AMSMarketingItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_rawValues, a3);

  return v7;
}

- (NSDictionary)artworkDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  AMSAttributesKeyPath((uint64_t)CFSTR("marketingArtwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
    goto LABEL_5;
  }
  v6 = v5;

  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_71);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (NSDictionary *)v7;
}

AMSPair *__37__AMSMarketingItem_artworkDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  AMSMediaArtwork *v10;
  AMSPair *v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v9 = 0;
LABEL_9:
    v11 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", 0, 0);
    goto LABEL_10;
  }
  v9 = v8;

  if (!v9 || !v7)
    goto LABEL_9;
  v10 = -[AMSMediaArtwork initWithDictionary:]([AMSMediaArtwork alloc], "initWithDictionary:", v9);
  v11 = -[AMSPair initWithFirst:second:]([AMSPair alloc], "initWithFirst:second:", v7, v10);

LABEL_10:
  return v11;
}

- (NSString)badge
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("badge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)campaignID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("campaignId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)itemID
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItem rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E254FE00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSArray)itemActions
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = CFSTR("offers");
  AMSAttributesKeyPath((uint64_t)v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  v8 = CFSTR("serviceDisplayData");
  AMSAttributesKeyPath((uint64_t)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (v7)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __31__AMSMarketingItem_itemActions__block_invoke;
    v15[3] = &unk_1E2542BF8;
    v16 = v12;
    objc_msgSend(v7, "ams_mapWithTransform:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return (NSArray *)v13;
}

AMSMarketingItemAction *__31__AMSMarketingItem_itemActions__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  AMSMarketingItemAction *v4;
  void *v5;
  AMSMarketingItemAction *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), 0x1E2559720);
  v4 = [AMSMarketingItemAction alloc];
  v5 = (void *)objc_msgSend(v3, "copy");
  v6 = -[AMSMarketingItemAction initWithDictionary:](v4, "initWithDictionary:", v5);

  return v6;
}

- (NSArray)relatedContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSRelationshipsContentDataKeyPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSArray *)v6;
}

- (NSString)serviceType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("serviceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("subtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)templateID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("display.template"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AMSAttributesKeyPath((uint64_t)CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)type
{
  void *v2;
  void *v3;
  id v4;

  -[AMSMarketingItem rawValues](self, "rawValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E2554060);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSArray)videos
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  AMSAttributesKeyPath((uint64_t)CFSTR("marketingVideo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMarketingItem rawValues](self, "rawValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;

    if (!v6)
    {
      v7 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v6, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_9_3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

LABEL_7:
  return (NSArray *)v7;
}

AMSMediaVideo *__26__AMSMarketingItem_videos__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  AMSMediaVideo *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
    goto LABEL_5;
  }
  v3 = v2;

  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v4 = -[AMSMediaVideo initWithDictionary:]([AMSMediaVideo alloc], "initWithDictionary:", v3);
LABEL_6:

  return v4;
}

- (id)abSettings
{
  return 0;
}

- (id)endDate
{
  return 0;
}

- (id)renderingAttributes
{
  return 0;
}

- (id)tagline
{
  return 0;
}

- (NSString)URLString
{
  return 0;
}

- (id)video
{
  void *v2;
  void *v3;

  -[AMSMarketingItem videos](self, "videos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)rawValues
{
  return self->_rawValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawValues, 0);
}

@end
