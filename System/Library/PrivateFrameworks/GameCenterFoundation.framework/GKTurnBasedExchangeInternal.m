@implementation GKTurnBasedExchangeInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_316 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_316, &__block_literal_global_317);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_315;
}

void __54__GKTurnBasedExchangeInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[10];
  _QWORD v17[12];

  v17[10] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("exchangeID");
  v17[0] = objc_opt_class();
  v16[1] = CFSTR("senderIndex");
  v17[1] = objc_opt_class();
  v16[2] = CFSTR("statusString");
  v17[2] = objc_opt_class();
  v16[3] = CFSTR("recipientIndexes");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v3;
  v16[4] = CFSTR("localizableMessage");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v9;
  v16[5] = CFSTR("data");
  v17[5] = objc_opt_class();
  v16[6] = CFSTR("sendDate");
  v17[6] = objc_opt_class();
  v16[7] = CFSTR("timeoutDate");
  v17[7] = objc_opt_class();
  v16[8] = CFSTR("completionDate");
  v17[8] = objc_opt_class();
  v16[9] = CFSTR("replies");
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 10);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_315;
  secureCodedPropertyKeys_sSecureCodedKeys_315 = v14;

}

- (unint64_t)hash
{
  return -[NSString hash](self->_exchangeID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *exchangeID;
  NSString *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    exchangeID = self->_exchangeID;
    objc_msgSend(v4, "exchangeID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = exchangeID == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)exchangeID
{
  return self->_exchangeID;
}

- (void)setExchangeID:(id)a3
{
  objc_storeStrong((id *)&self->_exchangeID, a3);
}

- (unsigned)senderIndex
{
  return self->_senderIndex;
}

- (void)setSenderIndex:(unsigned __int8)a3
{
  self->_senderIndex = a3;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_storeStrong((id *)&self->_statusString, a3);
}

- (NSArray)recipientIndexes
{
  return self->_recipientIndexes;
}

- (void)setRecipientIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_recipientIndexes, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSDate)timeoutDate
{
  return self->_timeoutDate;
}

- (void)setTimeoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutDate, a3);
}

- (NSArray)replies
{
  return self->_replies;
}

- (void)setReplies:(id)a3
{
  objc_storeStrong((id *)&self->_replies, a3);
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (void)setSendDate:(id)a3
{
  objc_storeStrong((id *)&self->_sendDate, a3);
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableMessage, a3);
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_completionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replies, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_timeoutDate, 0);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_recipientIndexes, 0);
  objc_storeStrong((id *)&self->_exchangeID, 0);
}

@end
