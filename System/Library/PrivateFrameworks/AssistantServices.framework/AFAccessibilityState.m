@implementation AFAccessibilityState

- (AFAccessibilityState)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFAccessibilityStateMutation *);
  AFAccessibilityState *v5;
  AFAccessibilityState *v6;
  _AFAccessibilityStateMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFAccessibilityStateMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFAccessibilityState;
  v5 = -[AFAccessibilityState init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFAccessibilityStateMutation initWithBase:]([_AFAccessibilityStateMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFAccessibilityStateMutation isDirty](v7, "isDirty"))
    {
      v6->_isVoiceOverTouchEnabled = -[_AFAccessibilityStateMutation getIsVoiceOverTouchEnabled](v7, "getIsVoiceOverTouchEnabled");
      v6->_isVibrationDisabled = -[_AFAccessibilityStateMutation getIsVibrationDisabled](v7, "getIsVibrationDisabled");
    }

  }
  return v6;
}

- (AFAccessibilityState)init
{
  return -[AFAccessibilityState initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFAccessibilityState)initWithIsVoiceOverTouchEnabled:(int64_t)a3 isVibrationDisabled:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__AFAccessibilityState_initWithIsVoiceOverTouchEnabled_isVibrationDisabled___block_invoke;
  v5[3] = &__block_descriptor_48_e40_v16__0___AFAccessibilityStateMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return -[AFAccessibilityState initWithBuilder:](self, "initWithBuilder:", v5);
}

- (id)description
{
  return -[AFAccessibilityState _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t isVoiceOverTouchEnabled;
  __CFString *v7;
  __CFString *v8;
  unint64_t isVibrationDisabled;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)AFAccessibilityState;
  -[AFAccessibilityState description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
  if (isVoiceOverTouchEnabled > 2)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A345C8[isVoiceOverTouchEnabled];
  v8 = v7;
  isVibrationDisabled = self->_isVibrationDisabled;
  if (isVibrationDisabled > 2)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A345C8[isVibrationDisabled];
  v11 = v10;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isVoiceOverTouchEnabled = %@, isVibrationDisabled = %@}"), v5, v8, v11);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isVoiceOverTouchEnabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isVibrationDisabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFAccessibilityState *v4;
  AFAccessibilityState *v5;
  int64_t isVoiceOverTouchEnabled;
  int64_t isVibrationDisabled;
  BOOL v8;

  v4 = (AFAccessibilityState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
      if (isVoiceOverTouchEnabled == -[AFAccessibilityState isVoiceOverTouchEnabled](v5, "isVoiceOverTouchEnabled"))
      {
        isVibrationDisabled = self->_isVibrationDisabled;
        v8 = isVibrationDisabled == -[AFAccessibilityState isVibrationDisabled](v5, "isVibrationDisabled");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (AFAccessibilityState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAccessibilityState::isVoiceOverTouchEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFAccessibilityState::isVibrationDisabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  return -[AFAccessibilityState initWithIsVoiceOverTouchEnabled:isVibrationDisabled:](self, "initWithIsVoiceOverTouchEnabled:isVibrationDisabled:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t isVoiceOverTouchEnabled;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  isVoiceOverTouchEnabled = self->_isVoiceOverTouchEnabled;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", isVoiceOverTouchEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFAccessibilityState::isVoiceOverTouchEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_isVibrationDisabled);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFAccessibilityState::isVibrationDisabled"));

}

- (int64_t)isVoiceOverTouchEnabled
{
  return self->_isVoiceOverTouchEnabled;
}

- (int64_t)isVibrationDisabled
{
  return self->_isVibrationDisabled;
}

void __76__AFAccessibilityState_initWithIsVoiceOverTouchEnabled_isVibrationDisabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setIsVoiceOverTouchEnabled:", v3);
  objc_msgSend(v4, "setIsVibrationDisabled:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFAccessibilityStateMutation *);
  _AFAccessibilityStateMutation *v5;
  AFAccessibilityState *v6;

  v4 = (void (**)(id, _AFAccessibilityStateMutation *))a3;
  if (v4)
  {
    v5 = -[_AFAccessibilityStateMutation initWithBase:]([_AFAccessibilityStateMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFAccessibilityStateMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFAccessibilityState);
      v6->_isVoiceOverTouchEnabled = -[_AFAccessibilityStateMutation getIsVoiceOverTouchEnabled](v5, "getIsVoiceOverTouchEnabled");
      v6->_isVibrationDisabled = -[_AFAccessibilityStateMutation getIsVibrationDisabled](v5, "getIsVibrationDisabled");
    }
    else
    {
      v6 = (AFAccessibilityState *)-[AFAccessibilityState copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFAccessibilityState *)-[AFAccessibilityState copy](self, "copy");
  }

  return v6;
}

@end
