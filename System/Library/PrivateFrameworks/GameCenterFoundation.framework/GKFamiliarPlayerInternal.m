@implementation GKFamiliarPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GKFamiliarPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_422 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_422, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_421;
}

void __51__GKFamiliarPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKFamiliarPlayerInternal;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("firstName");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("lastName");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("friendLevel");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("compositeName");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("allowReceivingFriendInvites");
  v7[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_421;
  secureCodedPropertyKeys_sSecureCodedKeys_421 = (uint64_t)v2;

}

- (id)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (id)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (id)compositeName
{
  return self->_compositeName;
}

- (void)setCompositeName:(id)a3
{
  objc_storeStrong((id *)&self->_compositeName, a3);
}

- (BOOL)allowReceivingFriendInvites
{
  return self->_allowReceivingFriendInvites;
}

- (void)setAllowReceivingFriendInvites:(BOOL)a3
{
  self->_allowReceivingFriendInvites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositeName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
