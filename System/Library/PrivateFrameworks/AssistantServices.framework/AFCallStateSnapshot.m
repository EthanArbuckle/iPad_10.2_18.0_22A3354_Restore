@implementation AFCallStateSnapshot

- (AFCallStateSnapshot)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFCallStateSnapshotMutation *);
  AFCallStateSnapshot *v5;
  AFCallStateSnapshot *v6;
  _AFCallStateSnapshotMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFCallStateSnapshotMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFCallStateSnapshot;
  v5 = -[AFCallStateSnapshot init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFCallStateSnapshotMutation initWithBase:]([_AFCallStateSnapshotMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFCallStateSnapshotMutation isDirty](v7, "isDirty"))
    {
      v6->_callState = -[_AFCallStateSnapshotMutation getCallState](v7, "getCallState");
      v6->_onSpeaker = -[_AFCallStateSnapshotMutation getOnSpeaker](v7, "getOnSpeaker");
      v6->_isDropInCall = -[_AFCallStateSnapshotMutation getIsDropInCall](v7, "getIsDropInCall");
    }

  }
  return v6;
}

- (AFCallStateSnapshot)init
{
  return -[AFCallStateSnapshot initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFCallStateSnapshot)initWithCallState:(unint64_t)a3 onSpeaker:(BOOL)a4 isDropInCall:(BOOL)a5
{
  _QWORD v6[5];
  BOOL v7;
  BOOL v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__AFCallStateSnapshot_initWithCallState_onSpeaker_isDropInCall___block_invoke;
  v6[3] = &__block_descriptor_42_e39_v16__0___AFCallStateSnapshotMutating__8l;
  v6[4] = a3;
  v7 = a4;
  v8 = a5;
  return -[AFCallStateSnapshot initWithBuilder:](self, "initWithBuilder:", v6);
}

- (NSString)description
{
  return (NSString *)-[AFCallStateSnapshot _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFCallStateSnapshot;
  -[AFCallStateSnapshot description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AFCallStateGetNames(self->_callState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("YES");
  if (self->_onSpeaker)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!self->_isDropInCall)
    v9 = CFSTR("NO");
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {callState = %@, onSpeaker = %@, isDropInCall = %@}"), v5, v7, v10, v9);

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_callState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onSpeaker);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDropInCall);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AFCallStateSnapshot *v4;
  AFCallStateSnapshot *v5;
  unint64_t callState;
  _BOOL4 onSpeaker;
  _BOOL4 isDropInCall;
  BOOL v9;

  v4 = (AFCallStateSnapshot *)a3;
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
      callState = self->_callState;
      if (callState == -[AFCallStateSnapshot callState](v5, "callState")
        && (onSpeaker = self->_onSpeaker, onSpeaker == -[AFCallStateSnapshot onSpeaker](v5, "onSpeaker")))
      {
        isDropInCall = self->_isDropInCall;
        v9 = isDropInCall == -[AFCallStateSnapshot isDropInCall](v5, "isDropInCall");
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

- (AFCallStateSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCallStateSnapshot::callState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCallStateSnapshot::onSpeaker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCallStateSnapshot::isDropInCall"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  return -[AFCallStateSnapshot initWithCallState:onSpeaker:isDropInCall:](self, "initWithCallState:onSpeaker:isDropInCall:", v6, v8, v10);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t callState;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  callState = self->_callState;
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", callState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFCallStateSnapshot::callState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onSpeaker);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFCallStateSnapshot::onSpeaker"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDropInCall);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("AFCallStateSnapshot::isDropInCall"));

}

- (AFCallStateSnapshot)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AFCallStateSnapshot *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("callState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = AFCallStateGetFromNames(v6);
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("onSpeaker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    v11 = objc_msgSend(v10, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("isDropInCall"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    v14 = objc_msgSend(v13, "BOOLValue");
    self = -[AFCallStateSnapshot initWithCallState:onSpeaker:isDropInCall:](self, "initWithCallState:onSpeaker:isDropInCall:", v7, v11, v14);
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
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  AFCallStateGetNames(self->_callState);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("callState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onSpeaker);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("onSpeaker"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDropInCall);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isDropInCall"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (unint64_t)callState
{
  return self->_callState;
}

- (BOOL)onSpeaker
{
  return self->_onSpeaker;
}

- (BOOL)isDropInCall
{
  return self->_isDropInCall;
}

void __64__AFCallStateSnapshot_initWithCallState_onSpeaker_isDropInCall___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setCallState:", v3);
  objc_msgSend(v4, "setOnSpeaker:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(v4, "setIsDropInCall:", *(unsigned __int8 *)(a1 + 41));

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
  void (**v4)(id, _AFCallStateSnapshotMutation *);
  _AFCallStateSnapshotMutation *v5;
  AFCallStateSnapshot *v6;

  v4 = (void (**)(id, _AFCallStateSnapshotMutation *))a3;
  if (v4)
  {
    v5 = -[_AFCallStateSnapshotMutation initWithBase:]([_AFCallStateSnapshotMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFCallStateSnapshotMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFCallStateSnapshot);
      v6->_callState = -[_AFCallStateSnapshotMutation getCallState](v5, "getCallState");
      v6->_onSpeaker = -[_AFCallStateSnapshotMutation getOnSpeaker](v5, "getOnSpeaker");
      v6->_isDropInCall = -[_AFCallStateSnapshotMutation getIsDropInCall](v5, "getIsDropInCall");
    }
    else
    {
      v6 = (AFCallStateSnapshot *)-[AFCallStateSnapshot copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFCallStateSnapshot *)-[AFCallStateSnapshot copy](self, "copy");
  }

  return v6;
}

- (id)ad_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  AFCallStateGetNames(-[AFCallStateSnapshot callState](self, "callState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(callState = %@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AFCallStateSnapshot)initWithSerializedBackingStore:(id)a3
{
  id v4;
  AFCallStateSnapshot *v5;
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
    self = -[AFCallStateSnapshot initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
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
        v9 = "-[AFCallStateSnapshot(ContextSnapshot) initWithSerializedBackingStore:]";
        v10 = 2112;
        v11 = v4;
        _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s #hal serializedBackingStore is of unexpected type: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    v5 = 0;
  }

  return v5;
}

@end
