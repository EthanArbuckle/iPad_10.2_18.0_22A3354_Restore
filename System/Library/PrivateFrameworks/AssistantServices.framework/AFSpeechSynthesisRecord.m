@implementation AFSpeechSynthesisRecord

- (AFSpeechSynthesisRecord)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSpeechSynthesisRecordMutation *);
  AFSpeechSynthesisRecord *v5;
  AFSpeechSynthesisRecord *v6;
  _AFSpeechSynthesisRecordMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *utterance;
  objc_super v12;

  v4 = (void (**)(id, _AFSpeechSynthesisRecordMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechSynthesisRecord;
  v5 = -[AFSpeechSynthesisRecord init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSpeechSynthesisRecordMutation initWithBase:]([_AFSpeechSynthesisRecordMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSpeechSynthesisRecordMutation isDirty](v7, "isDirty"))
    {
      -[_AFSpeechSynthesisRecordMutation getUtterance](v7, "getUtterance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      utterance = v6->_utterance;
      v6->_utterance = (NSString *)v9;

      v6->_beginTimestamp = -[_AFSpeechSynthesisRecordMutation getBeginTimestamp](v7, "getBeginTimestamp");
      v6->_endTimestamp = -[_AFSpeechSynthesisRecordMutation getEndTimestamp](v7, "getEndTimestamp");
    }

  }
  return v6;
}

- (AFSpeechSynthesisRecord)init
{
  return -[AFSpeechSynthesisRecord initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSpeechSynthesisRecord)initWithUtterance:(id)a3 beginTimestamp:(unint64_t)a4 endTimestamp:(unint64_t)a5
{
  id v8;
  id v9;
  AFSpeechSynthesisRecord *v10;
  _QWORD v12[4];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__AFSpeechSynthesisRecord_initWithUtterance_beginTimestamp_endTimestamp___block_invoke;
  v12[3] = &unk_1E3A35838;
  v13 = v8;
  v14 = a4;
  v15 = a5;
  v9 = v8;
  v10 = -[AFSpeechSynthesisRecord initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFSpeechSynthesisRecord _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechSynthesisRecord;
  -[AFSpeechSynthesisRecord description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {utterance = %@, beginTimestamp = %llu, endTimestamp = %llu}"), v5, self->_utterance, self->_beginTimestamp, self->_endTimestamp);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_utterance, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_beginTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_endTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  AFSpeechSynthesisRecord *v4;
  AFSpeechSynthesisRecord *v5;
  unint64_t beginTimestamp;
  unint64_t endTimestamp;
  NSString *v8;
  NSString *utterance;
  BOOL v10;

  v4 = (AFSpeechSynthesisRecord *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      beginTimestamp = self->_beginTimestamp;
      if (beginTimestamp == -[AFSpeechSynthesisRecord beginTimestamp](v5, "beginTimestamp")
        && (endTimestamp = self->_endTimestamp,
            endTimestamp == -[AFSpeechSynthesisRecord endTimestamp](v5, "endTimestamp")))
      {
        -[AFSpeechSynthesisRecord utterance](v5, "utterance");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        utterance = self->_utterance;
        v10 = utterance == v8 || -[NSString isEqual:](utterance, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFSpeechSynthesisRecord)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  AFSpeechSynthesisRecord *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechSynthesisRecord::utterance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechSynthesisRecord::beginTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSpeechSynthesisRecord::endTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  v10 = -[AFSpeechSynthesisRecord initWithUtterance:beginTimestamp:endTimestamp:](self, "initWithUtterance:beginTimestamp:endTimestamp:", v5, v7, v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *utterance;
  id v5;
  void *v6;
  id v7;

  utterance = self->_utterance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", utterance, CFSTR("AFSpeechSynthesisRecord::utterance"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_beginTimestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFSpeechSynthesisRecord::beginTimestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_endTimestamp);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("AFSpeechSynthesisRecord::endTimestamp"));

}

- (NSString)utterance
{
  return self->_utterance;
}

- (unint64_t)beginTimestamp
{
  return self->_beginTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
}

void __73__AFSpeechSynthesisRecord_initWithUtterance_beginTimestamp_endTimestamp___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setUtterance:", v3);
  objc_msgSend(v4, "setBeginTimestamp:", a1[5]);
  objc_msgSend(v4, "setEndTimestamp:", a1[6]);

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
  void (**v4)(id, _AFSpeechSynthesisRecordMutation *);
  _AFSpeechSynthesisRecordMutation *v5;
  AFSpeechSynthesisRecord *v6;
  void *v7;
  uint64_t v8;
  NSString *utterance;

  v4 = (void (**)(id, _AFSpeechSynthesisRecordMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSpeechSynthesisRecordMutation initWithBase:]([_AFSpeechSynthesisRecordMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSpeechSynthesisRecordMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSpeechSynthesisRecord);
      -[_AFSpeechSynthesisRecordMutation getUtterance](v5, "getUtterance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      utterance = v6->_utterance;
      v6->_utterance = (NSString *)v8;

      v6->_beginTimestamp = -[_AFSpeechSynthesisRecordMutation getBeginTimestamp](v5, "getBeginTimestamp");
      v6->_endTimestamp = -[_AFSpeechSynthesisRecordMutation getEndTimestamp](v5, "getEndTimestamp");
    }
    else
    {
      v6 = (AFSpeechSynthesisRecord *)-[AFSpeechSynthesisRecord copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSpeechSynthesisRecord *)-[AFSpeechSynthesisRecord copy](self, "copy");
  }

  return v6;
}

@end
