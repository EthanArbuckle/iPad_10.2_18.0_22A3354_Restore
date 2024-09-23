@implementation CNGeminiChannel

- (id)initWithSenderIdentity:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "accountUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedShortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v5, v6, v7, v9, v3, 1);

    v2 = v10;
  }
  return v2;
}

- (id)initWithChannelIdentifier:(void *)a3 localizedLabel:(void *)a4 localizedBadgeLabel:(void *)a5 handle:(void *)a6 senderIdentity:(char)a7 available:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  objc_super v27;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)CNGeminiChannel;
    a1 = (id *)objc_msgSendSuper2(&v27, sel_init);
    if (a1)
    {
      v18 = objc_msgSend(v13, "copy");
      v19 = a1[2];
      a1[2] = (id)v18;

      v20 = objc_msgSend(v14, "copy");
      v21 = a1[3];
      a1[3] = (id)v20;

      v22 = objc_msgSend(v15, "copy");
      v23 = a1[4];
      a1[4] = (id)v22;

      v24 = objc_msgSend(v16, "copy");
      v25 = a1[5];
      a1[5] = (id)v24;

      objc_storeStrong(a1 + 6, a6);
      *((_BYTE *)a1 + 8) = a7;
    }
  }

  return a1;
}

- (id)initWithDanglingPlanItem:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "simLabelID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v4, v6, 0, v7, 0, 0);
  }
  return v2;
}

- (id)initWithDisabledCellularPlanItem:(id *)a1
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "userLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "userLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:](v2, v5, v7, 0, v8, 0, 0);
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGeminiChannel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  CNGeminiChannel *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_channelIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedBadgeLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_handle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", getTUSenderIdentityClass(), CFSTR("_senderIdentity"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_available"));

  v11 = (CNGeminiChannel *)-[CNGeminiChannel initWithChannelIdentifier:localizedLabel:localizedBadgeLabel:handle:senderIdentity:available:]((id *)&self->super.isa, v5, v6, v7, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *channelIdentifier;
  id v5;

  channelIdentifier = self->_channelIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", channelIdentifier, CFSTR("_channelIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedLabel, CFSTR("_localizedLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedBadgeLabel, CFSTR("_localizedBadgeLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_handle, CFSTR("_handle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderIdentity, CFSTR("_senderIdentity"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_available, CFSTR("_available"));

}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (NSString)localizedLabel
{
  return self->_localizedLabel;
}

- (NSString)localizedBadgeLabel
{
  return self->_localizedBadgeLabel;
}

- (NSString)handle
{
  return self->_handle;
}

- (TUSenderIdentity)senderIdentity
{
  return self->_senderIdentity;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentity, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_localizedBadgeLabel, 0);
  objc_storeStrong((id *)&self->_localizedLabel, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end
