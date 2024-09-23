@implementation AFExperimentState

- (AFExperimentState)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFExperimentStateMutation *);
  AFExperimentState *v5;
  AFExperimentState *v6;
  _AFExperimentStateMutation *v7;
  void *v8;
  uint64_t v9;
  NSDate *lastSyncDate;
  void *v11;
  uint64_t v12;
  NSString *endingGroupIdentifier;
  void *v14;
  uint64_t v15;
  NSString *version;
  objc_super v18;

  v4 = (void (**)(id, _AFExperimentStateMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)AFExperimentState;
  v5 = -[AFExperimentState init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFExperimentStateMutation initWithBase:]([_AFExperimentStateMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFExperimentStateMutation isDirty](v7, "isDirty"))
    {
      -[_AFExperimentStateMutation getLastSyncDate](v7, "getLastSyncDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      lastSyncDate = v6->_lastSyncDate;
      v6->_lastSyncDate = (NSDate *)v9;

      v6->_didEnd = -[_AFExperimentStateMutation getDidEnd](v7, "getDidEnd");
      -[_AFExperimentStateMutation getEndingGroupIdentifier](v7, "getEndingGroupIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      endingGroupIdentifier = v6->_endingGroupIdentifier;
      v6->_endingGroupIdentifier = (NSString *)v12;

      -[_AFExperimentStateMutation getVersion](v7, "getVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      version = v6->_version;
      v6->_version = (NSString *)v15;

    }
  }

  return v6;
}

- (AFExperimentState)init
{
  return -[AFExperimentState initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFExperimentState)initWithLastSyncDate:(id)a3 didEnd:(BOOL)a4 endingGroupIdentifier:(id)a5 version:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  AFExperimentState *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__AFExperimentState_initWithLastSyncDate_didEnd_endingGroupIdentifier_version___block_invoke;
  v18[3] = &unk_1E3A323E0;
  v22 = a4;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = -[AFExperimentState initWithBuilder:](self, "initWithBuilder:", v18);

  return v16;
}

- (NSString)description
{
  return (NSString *)-[AFExperimentState _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10.receiver = self;
  v10.super_class = (Class)AFExperimentState;
  -[AFExperimentState description](&v10, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_didEnd)
    v7 = CFSTR("NO");
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {lastSyncDate = %@, didEnd = %@, endingGroupIdentifier = %@, version = %@}"), v5, self->_lastSyncDate, v7, self->_endingGroupIdentifier, self->_version);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSDate hash](self->_lastSyncDate, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didEnd);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSString hash](self->_endingGroupIdentifier, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_version, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AFExperimentState *v4;
  AFExperimentState *v5;
  _BOOL4 didEnd;
  NSDate *v7;
  NSDate *lastSyncDate;
  NSString *v9;
  NSString *endingGroupIdentifier;
  NSString *v11;
  NSString *version;
  BOOL v13;

  v4 = (AFExperimentState *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      didEnd = self->_didEnd;
      if (didEnd == -[AFExperimentState didEnd](v5, "didEnd"))
      {
        -[AFExperimentState lastSyncDate](v5, "lastSyncDate");
        v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastSyncDate = self->_lastSyncDate;
        if (lastSyncDate == v7 || -[NSDate isEqual:](lastSyncDate, "isEqual:", v7))
        {
          -[AFExperimentState endingGroupIdentifier](v5, "endingGroupIdentifier");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          endingGroupIdentifier = self->_endingGroupIdentifier;
          if (endingGroupIdentifier == v9 || -[NSString isEqual:](endingGroupIdentifier, "isEqual:", v9))
          {
            -[AFExperimentState version](v5, "version");
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            version = self->_version;
            v13 = version == v11 || -[NSString isEqual:](version, "isEqual:", v11);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (AFExperimentState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  AFExperimentState *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentState::lastSyncDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentState::didEnd"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentState::endingGroupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFExperimentState::version"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AFExperimentState initWithLastSyncDate:didEnd:endingGroupIdentifier:version:](self, "initWithLastSyncDate:didEnd:endingGroupIdentifier:version:", v5, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastSyncDate;
  void *v5;
  id v6;

  lastSyncDate = self->_lastSyncDate;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", lastSyncDate, CFSTR("AFExperimentState::lastSyncDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didEnd);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFExperimentState::didEnd"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_endingGroupIdentifier, CFSTR("AFExperimentState::endingGroupIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_version, CFSTR("AFExperimentState::version"));

}

- (AFExperimentState)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFExperimentState *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("lastSyncDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("didEnd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("endingGroupIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    self = -[AFExperimentState initWithLastSyncDate:didEnd:endingGroupIdentifier:version:](self, "initWithLastSyncDate:didEnd:endingGroupIdentifier:version:", v7, v11, v13, v15);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSDate *lastSyncDate;
  void *v6;
  NSString *endingGroupIdentifier;
  NSString *version;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  lastSyncDate = self->_lastSyncDate;
  if (lastSyncDate)
    objc_msgSend(v3, "setObject:forKey:", lastSyncDate, CFSTR("lastSyncDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didEnd);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("didEnd"));

  endingGroupIdentifier = self->_endingGroupIdentifier;
  if (endingGroupIdentifier)
    objc_msgSend(v4, "setObject:forKey:", endingGroupIdentifier, CFSTR("endingGroupIdentifier"));
  version = self->_version;
  if (version)
    objc_msgSend(v4, "setObject:forKey:", version, CFSTR("version"));
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (NSString)endingGroupIdentifier
{
  return self->_endingGroupIdentifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_endingGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

void __79__AFExperimentState_initWithLastSyncDate_didEnd_endingGroupIdentifier_version___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLastSyncDate:", v3);
  objc_msgSend(v4, "setDidEnd:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(v4, "setEndingGroupIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setVersion:", *(_QWORD *)(a1 + 48));

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
  void (**v4)(id, _AFExperimentStateMutation *);
  _AFExperimentStateMutation *v5;
  AFExperimentState *v6;
  void *v7;
  uint64_t v8;
  NSDate *lastSyncDate;
  void *v10;
  uint64_t v11;
  NSString *endingGroupIdentifier;
  void *v13;
  uint64_t v14;
  NSString *version;

  v4 = (void (**)(id, _AFExperimentStateMutation *))a3;
  if (v4)
  {
    v5 = -[_AFExperimentStateMutation initWithBase:]([_AFExperimentStateMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFExperimentStateMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFExperimentState);
      -[_AFExperimentStateMutation getLastSyncDate](v5, "getLastSyncDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      lastSyncDate = v6->_lastSyncDate;
      v6->_lastSyncDate = (NSDate *)v8;

      v6->_didEnd = -[_AFExperimentStateMutation getDidEnd](v5, "getDidEnd");
      -[_AFExperimentStateMutation getEndingGroupIdentifier](v5, "getEndingGroupIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      endingGroupIdentifier = v6->_endingGroupIdentifier;
      v6->_endingGroupIdentifier = (NSString *)v11;

      -[_AFExperimentStateMutation getVersion](v5, "getVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      version = v6->_version;
      v6->_version = (NSString *)v14;

    }
    else
    {
      v6 = (AFExperimentState *)-[AFExperimentState copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFExperimentState *)-[AFExperimentState copy](self, "copy");
  }

  return v6;
}

@end
