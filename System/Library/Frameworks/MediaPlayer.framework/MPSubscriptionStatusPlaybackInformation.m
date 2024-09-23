@implementation MPSubscriptionStatusPlaybackInformation

- (BOOL)shouldUseLease
{
  return self->_shouldUseLease;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusObject, 0);
}

- (MPSubscriptionStatusPlaybackInformation)initWithICSubscriptionStatus:(id)a3
{
  id v5;
  MPSubscriptionStatusPlaybackInformation *v6;
  MPSubscriptionStatusPlaybackInformation *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = -[MPSubscriptionStatusPlaybackInformation init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionStatusObject, a3);
    v8 = objc_msgSend(v5, "statusType");
    v9 = objc_msgSend(v5, "carrierBundlingStatusType");
    v10 = objc_msgSend(v5, "reasonType");
    if (v8 == 1)
    {
      v11 = 17;
      v12 = 16;
      v13 = 19;
      if (v9 != 2 || v10)
        goto LABEL_9;
      goto LABEL_8;
    }
    if (v9 == 4)
    {
      v11 = 16;
      v12 = 18;
      goto LABEL_11;
    }
    if (v9 == 2)
    {
LABEL_8:
      v11 = 16;
      v12 = 17;
      v13 = 20;
LABEL_9:
      *((_BYTE *)&v7->super.isa + v13) = 1;
LABEL_11:
      *((_BYTE *)&v7->super.isa + v12) = 1;
      *((_BYTE *)&v7->super.isa + v11) = 1;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p subscriptionStatusObject: %@>"), v5, self, self->_subscriptionStatusObject);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isDefinitiveInformation
{
  return self->_definitiveInformation;
}

- (BOOL)hasPlaybackCapability
{
  return self->_hasPlaybackCapability;
}

- (BOOL)requiresCarrierManualVerification
{
  return self->_requiresCarrierManualVerification;
}

- (BOOL)shouldUseAccountLessStreaming
{
  return self->_shouldUseAccountLessStreaming;
}

@end
