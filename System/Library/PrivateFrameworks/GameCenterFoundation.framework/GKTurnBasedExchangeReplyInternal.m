@implementation GKTurnBasedExchangeReplyInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_378 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_378, &__block_literal_global_379);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_377;
}

void __59__GKTurnBasedExchangeReplyInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v9[0] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0, CFSTR("recipientIndex"), CFSTR("localizableMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  v8[2] = CFSTR("data");
  v9[2] = objc_opt_class();
  v8[3] = CFSTR("replyDate");
  v9[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_377;
  secureCodedPropertyKeys_sSecureCodedKeys_377 = v6;

}

- (unsigned)recipientIndex
{
  return self->_recipientIndex;
}

- (void)setRecipientIndex:(unsigned __int8)a3
{
  self->_recipientIndex = a3;
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableMessage, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDate)replyDate
{
  return self->_replyDate;
}

- (void)setReplyDate:(id)a3
{
  objc_storeStrong((id *)&self->_replyDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
}

@end
