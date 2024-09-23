@implementation FAInviteCompletionInfo

- (id)serverReadableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAInviteCompletionInfo _transportStringValue](self, "_transportStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("transportMode"));

  -[FAInviteCompletionInfo recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("inviteRecipients"));

  -[FAInviteCompletionInfo _completionStatusStringValue](self, "_completionStatusStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("completionStatus"));

  return v3;
}

- (id)_transportStringValue
{
  unint64_t v2;

  v2 = -[FAInviteCompletionInfo transportType](self, "transportType");
  if (v2 - 1 > 3)
    return 0;
  else
    return off_1E85624A0[v2 - 1];
}

- (unint64_t)transportTypeFrom:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("messages")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mail")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("airdrop")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("inviteInPerson")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_completionStatusStringValue
{
  unint64_t v2;

  v2 = -[FAInviteCompletionInfo status](self, "status");
  if (v2 > 2)
    return 0;
  else
    return off_1E85624C0[v2];
}

- (unint64_t)completionTypeFrom:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("failure")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("success"));

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[FAInviteCompletionInfo _transportStringValue](self, "_transportStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transportMode"));

  -[FAInviteCompletionInfo recipients](self, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("inviteRecipients"));

  -[FAInviteCompletionInfo _completionStatusStringValue](self, "_completionStatusStringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("completionStatus"));

}

- (FAInviteCompletionInfo)initWithCoder:(id)a3
{
  id v4;
  FAInviteCompletionInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *recipients;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[FAInviteCompletionInfo init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("inviteRecipients"));
    v9 = objc_claimAutoreleasedReturnValue();
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transportMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transportType = -[FAInviteCompletionInfo transportTypeFrom:](v5, "transportTypeFrom:", v11);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("completionStatus"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = -[FAInviteCompletionInfo completionTypeFrom:](v5, "completionTypeFrom:", v12);

  }
  return v5;
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
