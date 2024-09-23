@implementation PMSeparationParticipant

- (PMSeparationParticipant)initWithParticipant:(id)a3 identity:(id)a4
{
  id v7;
  id v8;
  PMSeparationParticipant *v9;
  PMSeparationParticipant *v10;
  PMSeparationParticipant *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PMSeparationParticipant;
  v9 = -[PMSeparationParticipant init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong((id *)&v10->_identity, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[KCSharingParticipant handle](self->_participant, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; handle: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)permission
{
  return 2;
}

- (int64_t)role
{
  if (-[KCSharingParticipant permissionLevel](self->_participant, "permissionLevel") == 2)
    return 1;
  else
    return 2;
}

- (DSIdentifiable)identity
{
  return self->_identity;
}

- (KCSharingParticipant)participant
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
