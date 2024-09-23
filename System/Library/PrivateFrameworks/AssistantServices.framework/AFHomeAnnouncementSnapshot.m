@implementation AFHomeAnnouncementSnapshot

- (AFHomeAnnouncementSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeAnnouncementSnapshotMutation *);
  AFHomeAnnouncementSnapshot *v5;
  AFHomeAnnouncementSnapshot *v6;
  _AFHomeAnnouncementSnapshotMutation *v7;
  void *v8;
  uint64_t v9;
  AFHomeAnnouncement *lastPlayedAnnouncement;
  objc_super v12;

  v4 = (void (**)(id, _AFHomeAnnouncementSnapshotMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFHomeAnnouncementSnapshot;
  v5 = -[AFHomeAnnouncementSnapshot init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeAnnouncementSnapshotMutation initWithBase:]([_AFHomeAnnouncementSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeAnnouncementSnapshotMutation isDirty](v7, "isDirty"))
    {
      v6->_state = -[_AFHomeAnnouncementSnapshotMutation getState](v7, "getState");
      -[_AFHomeAnnouncementSnapshotMutation getLastPlayedAnnouncement](v7, "getLastPlayedAnnouncement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      lastPlayedAnnouncement = v6->_lastPlayedAnnouncement;
      v6->_lastPlayedAnnouncement = (AFHomeAnnouncement *)v9;

    }
  }

  return v6;
}

- (AFHomeAnnouncementSnapshot)init
{
  return -[AFHomeAnnouncementSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeAnnouncementSnapshot)initWithState:(unint64_t)a3 lastPlayedAnnouncement:(id)a4
{
  id v6;
  id v7;
  AFHomeAnnouncementSnapshot *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__AFHomeAnnouncementSnapshot_initWithState_lastPlayedAnnouncement___block_invoke;
  v10[3] = &unk_1E3A326D8;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  v8 = -[AFHomeAnnouncementSnapshot initWithBuilder:](self, "initWithBuilder:", v10);

  return v8;
}

- (NSString)description
{
  return (NSString *)-[AFHomeAnnouncementSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFHomeAnnouncementSnapshot;
  -[AFHomeAnnouncementSnapshot description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AFHomeAnnouncementStateGetNames(self->_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {state = %@, lastPlayedAnnouncement = %@}"), v5, v7, self->_lastPlayedAnnouncement);

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_state);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[AFHomeAnnouncement hash](self->_lastPlayedAnnouncement, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeAnnouncementSnapshot *v4;
  AFHomeAnnouncementSnapshot *v5;
  unint64_t state;
  AFHomeAnnouncement *v7;
  AFHomeAnnouncement *lastPlayedAnnouncement;
  BOOL v9;

  v4 = (AFHomeAnnouncementSnapshot *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      state = self->_state;
      if (state == -[AFHomeAnnouncementSnapshot state](v5, "state"))
      {
        -[AFHomeAnnouncementSnapshot lastPlayedAnnouncement](v5, "lastPlayedAnnouncement");
        v7 = (AFHomeAnnouncement *)objc_claimAutoreleasedReturnValue();
        lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
        v9 = lastPlayedAnnouncement == v7 || -[AFHomeAnnouncement isEqual:](lastPlayedAnnouncement, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (AFHomeAnnouncementSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  AFHomeAnnouncementSnapshot *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncementSnapshot::state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAnnouncementSnapshot::lastPlayedAnnouncement"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFHomeAnnouncementSnapshot initWithState:lastPlayedAnnouncement:](self, "initWithState:lastPlayedAnnouncement:", v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t state;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  state = self->_state;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFHomeAnnouncementSnapshot::state"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_lastPlayedAnnouncement, CFSTR("AFHomeAnnouncementSnapshot::lastPlayedAnnouncement"));
}

- (AFHomeAnnouncementSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  AFHomeAnnouncementSnapshot *v7;
  void *v8;
  AFHomeAnnouncement *v9;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "objectForKey:", CFSTR("state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = AFHomeAnnouncementStateGetFromNames(v5);
    else
      v6 = 0;

    objc_msgSend(v4, "objectForKey:", CFSTR("lastPlayedAnnouncement"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = -[AFHomeAnnouncement initWithDictionaryRepresentation:]([AFHomeAnnouncement alloc], "initWithDictionaryRepresentation:", v8);
    else
      v9 = 0;

    self = -[AFHomeAnnouncementSnapshot initWithState:lastPlayedAnnouncement:](self, "initWithState:lastPlayedAnnouncement:", v6, v9);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  AFHomeAnnouncement *lastPlayedAnnouncement;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  AFHomeAnnouncementStateGetNames(self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("state"));

  lastPlayedAnnouncement = self->_lastPlayedAnnouncement;
  if (lastPlayedAnnouncement)
  {
    -[AFHomeAnnouncement buildDictionaryRepresentation](lastPlayedAnnouncement, "buildDictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("lastPlayedAnnouncement"));

  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (AFHomeAnnouncement)lastPlayedAnnouncement
{
  return self->_lastPlayedAnnouncement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, 0);
}

void __67__AFHomeAnnouncementSnapshot_initWithState_lastPlayedAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setState:", v3);
  objc_msgSend(v4, "setLastPlayedAnnouncement:", *(_QWORD *)(a1 + 32));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFHomeAnnouncementSnapshotMutation *);
  _AFHomeAnnouncementSnapshotMutation *v5;
  AFHomeAnnouncementSnapshot *v6;
  void *v7;
  uint64_t v8;
  AFHomeAnnouncement *lastPlayedAnnouncement;

  v4 = (void (**)(id, _AFHomeAnnouncementSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeAnnouncementSnapshotMutation initWithBase:]([_AFHomeAnnouncementSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeAnnouncementSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeAnnouncementSnapshot);
      v6->_state = -[_AFHomeAnnouncementSnapshotMutation getState](v5, "getState");
      -[_AFHomeAnnouncementSnapshotMutation getLastPlayedAnnouncement](v5, "getLastPlayedAnnouncement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      lastPlayedAnnouncement = v6->_lastPlayedAnnouncement;
      v6->_lastPlayedAnnouncement = (AFHomeAnnouncement *)v8;

    }
    else
    {
      v6 = (AFHomeAnnouncementSnapshot *)-[AFHomeAnnouncementSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeAnnouncementSnapshot *)-[AFHomeAnnouncementSnapshot copy](self, "copy");
  }

  return v6;
}

- (id)ad_shortDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  AFHomeAnnouncementStateGetNames(-[AFHomeAnnouncementSnapshot state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(state: %@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AFHomeAnnouncementSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFHomeAnnouncementSnapshot *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFHomeAnnouncementSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
