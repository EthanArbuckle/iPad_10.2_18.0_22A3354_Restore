@implementation SFAccountIconSharingBadgeImageProvider

- (SFAccountIconSharingBadgeImageProvider)init
{
  SFAccountIconSharingBadgeImageProvider *v2;
  uint64_t v3;
  NSHashTable *subscribers;
  void *v5;
  SFAccountIconSharingBadgeImageProvider *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAccountIconSharingBadgeImageProvider;
  v2 = -[SFAccountIconSharingBadgeImageProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__resetAndInformSubscribers, *MEMORY[0x1E0DC59B0], 0);

    v6 = v2;
  }

  return v2;
}

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SFAccountIconSharingBadgeImageProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, block);
  return (id)sharedProvider_provider;
}

void __56__SFAccountIconSharingBadgeImageProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v1;

}

- (id)badgeImageForDiameter:(unint64_t)a3
{
  NSMutableDictionary *badgeDiameterToImageCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  badgeDiameterToImageCache = self->_badgeDiameterToImageCache;
  if (!badgeDiameterToImageCache)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_badgeDiameterToImageCache;
    self->_badgeDiameterToImageCache = v6;

    badgeDiameterToImageCache = self->_badgeDiameterToImageCache;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](badgeDiameterToImageCache, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SFAccountIconSharingBadgeImageProvider _createBadgeImageWithDiameter:](self, "_createBadgeImageWithDiameter:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_badgeDiameterToImageCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  v12 = v9;

  return v12;
}

- (id)_createBadgeImageWithDiameter:(unint64_t)a3
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[10];

  v3 = (double)a3;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOpaque:", 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v4, v3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__SFAccountIconSharingBadgeImageProvider__createBadgeImageWithDiameter___block_invoke;
  v8[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v8[4] = 0;
  v8[5] = 0;
  *(double *)&v8[6] = v3;
  *(double *)&v8[7] = v3;
  *(double *)&v8[8] = v3;
  *(double *)&v8[9] = v3;
  objc_msgSend(v5, "imageWithActions:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __72__SFAccountIconSharingBadgeImageProvider__createBadgeImageWithDiameter___block_invoke(double *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", a1[4], a1[5], a1[6], a1[7]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fill");

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.2.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "size");
  objc_msgSend(v6, "size");
  _SFCGRectOfSizeAlignedWithinRect();
  _SFRoundRectToPixels();
  objc_msgSend(v6, "drawInRect:");

}

- (void)addCoordinatorAsSubscriber:(id)a3
{
  -[NSHashTable addObject:](self->_subscribers, "addObject:", a3);
}

- (void)_resetAndInformSubscribers
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_badgeDiameterToImageCache, "removeAllObjects");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_subscribers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "reset", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDiameterToImageCache, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
}

@end
