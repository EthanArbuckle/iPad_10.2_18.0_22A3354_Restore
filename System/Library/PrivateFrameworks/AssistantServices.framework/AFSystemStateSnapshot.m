@implementation AFSystemStateSnapshot

- (id)ad_shortDescription
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[AFSystemStateSnapshot sleepState](self, "sleepState");
  if (v3 > 2)
    v4 = CFSTR("(unknown)");
  else
    v4 = off_1E3A350C0[v3];
  v5 = v4;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(attention = %@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (AFSystemStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFSystemStateSnapshot *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self = -[AFSystemStateSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v5 = self;
  }
  else
  {
    if (v4)
    {
      v6 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
      {
        v8 = 136315394;
        v9 = "-[AFSystemStateSnapshot(ContextSnapshot) initWithSerializedBackingStore:]";
        v10 = 2112;
        v11 = v4;
        _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    v5 = 0;
  }

  return v5;
}

- (AFSystemStateSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSystemStateSnapshotMutation *);
  AFSystemStateSnapshot *v5;
  AFSystemStateSnapshot *v6;
  _AFSystemStateSnapshotMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFSystemStateSnapshotMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSystemStateSnapshot;
  v5 = -[AFSystemStateSnapshot init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSystemStateSnapshotMutation initWithBase:]([_AFSystemStateSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSystemStateSnapshotMutation isDirty](v7, "isDirty"))
      v6->_sleepState = -[_AFSystemStateSnapshotMutation getSleepState](v7, "getSleepState");

  }
  return v6;
}

- (AFSystemStateSnapshot)init
{
  return -[AFSystemStateSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSystemStateSnapshot)initWithSleepState:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AFSystemStateSnapshot_initWithSleepState___block_invoke;
  v4[3] = &__block_descriptor_40_e41_v16__0___AFSystemStateSnapshotMutating__8l;
  v4[4] = a3;
  return -[AFSystemStateSnapshot initWithBuilder:](self, "initWithBuilder:", v4);
}

- (NSString)description
{
  return (NSString *)-[AFSystemStateSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t sleepState;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFSystemStateSnapshot;
  -[AFSystemStateSnapshot description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sleepState = self->_sleepState;
  if (sleepState > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A350C0[sleepState];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sleepState = %@}"), v5, v8);

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sleepState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AFSystemStateSnapshot *v4;
  int64_t sleepState;
  BOOL v6;

  v4 = (AFSystemStateSnapshot *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      sleepState = self->_sleepState;
      v6 = sleepState == -[AFSystemStateSnapshot sleepState](v4, "sleepState");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (AFSystemStateSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSystemStateSnapshot::sleepState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return -[AFSystemStateSnapshot initWithSleepState:](self, "initWithSleepState:", v6);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  int64_t sleepState;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  sleepState = self->_sleepState;
  v5 = a3;
  objc_msgSend(v3, "numberWithInteger:", sleepState);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFSystemStateSnapshot::sleepState"));

}

- (AFSystemStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  uint64_t v5;
  AFSystemStateSnapshot *v6;

  if (a3)
  {
    objc_msgSend(a3, "objectForKey:", CFSTR("sleepState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = AFSleepStateGetFromName(v4);
    else
      v5 = 0;

    self = -[AFSystemStateSnapshot initWithSleepState:](self, "initWithSleepState:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  unint64_t sleepState;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  sleepState = self->_sleepState;
  if (sleepState > 2)
    v5 = CFSTR("(unknown)");
  else
    v5 = off_1E3A350C0[sleepState];
  v6 = v5;
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("sleepState"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (int64_t)sleepState
{
  return self->_sleepState;
}

uint64_t __44__AFSystemStateSnapshot_initWithSleepState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSleepState:", *(_QWORD *)(a1 + 32));
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
  void (**v4)(id, _AFSystemStateSnapshotMutation *);
  _AFSystemStateSnapshotMutation *v5;
  AFSystemStateSnapshot *v6;

  v4 = (void (**)(id, _AFSystemStateSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSystemStateSnapshotMutation initWithBase:]([_AFSystemStateSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSystemStateSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSystemStateSnapshot);
      v6->_sleepState = -[_AFSystemStateSnapshotMutation getSleepState](v5, "getSleepState");
    }
    else
    {
      v6 = (AFSystemStateSnapshot *)-[AFSystemStateSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSystemStateSnapshot *)-[AFSystemStateSnapshot copy](self, "copy");
  }

  return v6;
}

@end
