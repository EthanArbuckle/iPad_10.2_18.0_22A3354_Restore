@implementation GKContactRelationshipResult

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken, &__block_literal_global_10);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys;
}

void __54__GKContactRelationshipResult_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("handle");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("relatedPlayer");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("relationship");
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;
  secureCodedPropertyKeys_sSecureCodedKeys = v0;

}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (GKPlayerInternal)relatedPlayer
{
  return self->_relatedPlayer;
}

- (void)setRelatedPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_relatedPlayer, a3);
}

- (int)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(int)a3
{
  self->_relationship = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlayer, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
