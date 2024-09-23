@implementation GKFriendRequestInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__GKFriendRequestInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_531 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_531, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_530;
}

void __50__GKFriendRequestInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___GKFriendRequestInternal;
  objc_msgSendSuper2(&v6, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v7[0] = CFSTR("date");
  v3 = objc_opt_class();
  v7[1] = CFSTR("message");
  v8[0] = v3;
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_530;
  secureCodedPropertyKeys_sSecureCodedKeys_530 = (uint64_t)v2;

}

- (int)defaultFamiliarity
{
  return 3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
