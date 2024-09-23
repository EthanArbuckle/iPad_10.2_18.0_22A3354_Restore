@implementation AKAvailabilityInvitation

- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3 unavailableDuringActivityIdentifiers:(id)a4
{
  id v6;
  id v7;
  AKAvailabilityInvitation *v8;
  uint64_t v9;
  NSArray *availableDuringActivityIdentifiers;
  uint64_t v11;
  NSArray *unavailableDuringActivityIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAvailabilityInvitation;
  v8 = -[AKAvailabilityInvitation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    availableDuringActivityIdentifiers = v8->_availableDuringActivityIdentifiers;
    v8->_availableDuringActivityIdentifiers = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    unavailableDuringActivityIdentifiers = v8->_unavailableDuringActivityIdentifiers;
    v8->_unavailableDuringActivityIdentifiers = (NSArray *)v11;

  }
  return v8;
}

- (NSArray)availableDuringActivityIdentifiers
{
  return self->_availableDuringActivityIdentifiers;
}

- (NSArray)unavailableDuringActivityIdentifiers
{
  return self->_unavailableDuringActivityIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableDuringActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_availableDuringActivityIdentifiers, 0);
}

- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3
{
  return -[AKAvailabilityInvitation initWithAvailableDuringActivityIdentifiers:unavailableDuringActivityIdentifiers:](self, "initWithAvailableDuringActivityIdentifiers:unavailableDuringActivityIdentifiers:", a3, MEMORY[0x24BDBD1A8]);
}

- (AKAvailabilityInvitation)initWithStatusKitInvitationPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AKAvailabilityInvitation *v8;

  objc_msgSend(a3, "payloadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "availabilityKit_stringArrayForKey:allowEmptyString:", CFSTR("a"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availabilityKit_stringArrayForKey:allowEmptyString:", CFSTR("u"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[AKAvailabilityInvitation initWithAvailableDuringActivityIdentifiers:unavailableDuringActivityIdentifiers:](self, "initWithAvailableDuringActivityIdentifiers:unavailableDuringActivityIdentifiers:", v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)statusKitInvitationPayloadWithDateCreated:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AKAvailabilityInvitation _payloadDictionary](self, "_payloadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1040]), "initWithDictionary:dateCreated:", v5, v4);

  return v6;
}

- (id)_payloadDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[AKAvailabilityInvitation availableDuringActivityIdentifiers](self, "availableDuringActivityIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  if (v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("a"));
  -[AKAvailabilityInvitation unavailableDuringActivityIdentifiers](self, "unavailableDuringActivityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("u"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

@end
