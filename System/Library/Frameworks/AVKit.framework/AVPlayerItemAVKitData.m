@implementation AVPlayerItemAVKitData

- (void)setInterstitialPolicyEnforcement:(int64_t)a3
{
  self->_interstitialPolicyEnforcement = a3;
}

- (AVPlayerItemAVKitData)init
{
  AVPlayerItemAVKitData *v2;
  uint64_t v3;
  NSMutableDictionary *customPropertyStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerItemAVKitData;
  v2 = -[AVPlayerItemAVKitData init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    customPropertyStorage = v2->_customPropertyStorage;
    v2->_customPropertyStorage = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (NSMutableDictionary)customPropertyStorage
{
  return self->_customPropertyStorage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVPlayerItemAVKitData *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(AVPlayerItemAVKitData);
  -[AVPlayerItemAVKitData customPropertyStorage](v4, "customPropertyStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerItemAVKitData customPropertyStorage](self, "customPropertyStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDictionary:", v6);

  -[AVPlayerItemAVKitData setInterstitialPolicyEnforcement:](v4, "setInterstitialPolicyEnforcement:", 1);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customPropertyStorage, 0);
}

- (int64_t)interstitialPolicyEnforcement
{
  return self->_interstitialPolicyEnforcement;
}

@end
