@implementation AFSpeechRecordingAlertBehavior

- (AFSpeechRecordingAlertBehavior)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechRecordingAlertBehaviorMutation *);
  AFSpeechRecordingAlertBehavior *v5;
  AFSpeechRecordingAlertBehavior *v6;
  _AFSpeechRecordingAlertBehaviorMutation *v7;
  objc_super v9;

  v4 = (void (**)(id, _AFSpeechRecordingAlertBehaviorMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechRecordingAlertBehavior;
  v5 = -[AFSpeechRecordingAlertBehavior init](&v9, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechRecordingAlertBehaviorMutation initWithBase:]([_AFSpeechRecordingAlertBehaviorMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechRecordingAlertBehaviorMutation isDirty](v7, "isDirty"))
    {
      v6->_style = -[_AFSpeechRecordingAlertBehaviorMutation getStyle](v7, "getStyle");
      v6->_beepSoundID = -[_AFSpeechRecordingAlertBehaviorMutation getBeepSoundID](v7, "getBeepSoundID");
    }

  }
  return v6;
}

- (AFSpeechRecordingAlertBehavior)init
{
  return -[AFSpeechRecordingAlertBehavior initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechRecordingAlertBehavior)initWithStyle:(int64_t)a3 beepSoundID:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AFSpeechRecordingAlertBehavior_initWithStyle_beepSoundID___block_invoke;
  v5[3] = &__block_descriptor_48_e50_v16__0___AFSpeechRecordingAlertBehaviorMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return -[AFSpeechRecordingAlertBehavior initWithBuilder:](self, "initWithBuilder:", v5);
}

- (id)description
{
  return -[AFSpeechRecordingAlertBehavior _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t style;
  __CFString *v7;
  __CFString *v8;
  unint64_t beepSoundID;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  objc_super v14;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechRecordingAlertBehavior;
  -[AFSpeechRecordingAlertBehavior description](&v14, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  if (style > 3)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2F9E8[style];
  v8 = v7;
  beepSoundID = self->_beepSoundID;
  if (beepSoundID > 0xD)
    v10 = CFSTR("(unknown)");
  else
    v10 = off_1E3A2F538[beepSoundID];
  v11 = v10;
  v12 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {style = %@, beepSoundID = %@}"), v5, v8, v11);

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_style);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_beepSoundID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechRecordingAlertBehavior *v4;
  AFSpeechRecordingAlertBehavior *v5;
  int64_t style;
  int64_t beepSoundID;
  BOOL v8;

  v4 = (AFSpeechRecordingAlertBehavior *)a3;
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
      style = self->_style;
      if (style == -[AFSpeechRecordingAlertBehavior style](v5, "style"))
      {
        beepSoundID = self->_beepSoundID;
        v8 = beepSoundID == -[AFSpeechRecordingAlertBehavior beepSoundID](v5, "beepSoundID");
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

- (AFSpeechRecordingAlertBehavior)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechRecordingAlertBehavior::style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechRecordingAlertBehavior::beepSoundID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "integerValue");
  return -[AFSpeechRecordingAlertBehavior initWithStyle:beepSoundID:](self, "initWithStyle:beepSoundID:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t style;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  style = self->_style;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", style);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("AFSpeechRecordingAlertBehavior::style"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_beepSoundID);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("AFSpeechRecordingAlertBehavior::beepSoundID"));

}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)beepSoundID
{
  return self->_beepSoundID;
}

void __60__AFSpeechRecordingAlertBehavior_initWithStyle_beepSoundID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setStyle:", v3);
  objc_msgSend(v4, "setBeepSoundID:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFSpeechRecordingAlertBehaviorMutation *);
  _AFSpeechRecordingAlertBehaviorMutation *v5;
  AFSpeechRecordingAlertBehavior *v6;

  v4 = (void (**)(id, _AFSpeechRecordingAlertBehaviorMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechRecordingAlertBehaviorMutation initWithBase:]([_AFSpeechRecordingAlertBehaviorMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechRecordingAlertBehaviorMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechRecordingAlertBehavior);
      v6->_style = -[_AFSpeechRecordingAlertBehaviorMutation getStyle](v5, "getStyle");
      v6->_beepSoundID = -[_AFSpeechRecordingAlertBehaviorMutation getBeepSoundID](v5, "getBeepSoundID");
    }
    else
    {
      v6 = (AFSpeechRecordingAlertBehavior *)-[AFSpeechRecordingAlertBehavior copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechRecordingAlertBehavior *)-[AFSpeechRecordingAlertBehavior copy](self, "copy");
  }

  return v6;
}

@end
