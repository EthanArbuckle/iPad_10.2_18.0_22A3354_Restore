@implementation GKFriendRecommendationInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__GKFriendRecommendationInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_550 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_550, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_549;
}

void __57__GKFriendRecommendationInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFriendRecommendationInternal;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("reason");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("reason2");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("rid");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("source");
  v7[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_549;
  secureCodedPropertyKeys_sSecureCodedKeys_549 = (uint64_t)v2;

}

- (int)defaultFamiliarity
{
  return 4;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)reason2
{
  return self->_reason2;
}

- (void)setReason2:(id)a3
{
  objc_storeStrong((id *)&self->_reason2, a3);
}

- (unsigned)rid
{
  return self->_rid;
}

- (void)setRid:(unsigned int)a3
{
  self->_rid = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason2, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
