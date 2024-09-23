@implementation EARSpeechRecognitionToken

- (EARSpeechRecognitionToken)initWithToken:(id)a3
{
  id v4;
  EARSpeechRecognitionToken *v5;
  void *v6;
  uint64_t v7;
  NSString *tokenName;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  NSString *phoneSequence;
  void *v16;
  uint64_t v17;
  NSString *ipaPhoneSequence;
  double v19;
  double v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EARSpeechRecognitionToken;
  v5 = -[EARSpeechRecognitionToken init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tokenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    tokenName = v5->_tokenName;
    v5->_tokenName = (NSString *)v7;

    objc_msgSend(v4, "start");
    v5->_start = v9;
    objc_msgSend(v4, "end");
    v5->_end = v10;
    objc_msgSend(v4, "silenceStart");
    v5->_silenceStart = v11;
    objc_msgSend(v4, "confidence");
    v5->_confidence = v12;
    v5->_hasSpaceAfter = objc_msgSend(v4, "hasSpaceAfter");
    v5->_hasSpaceBefore = objc_msgSend(v4, "hasSpaceBefore");
    objc_msgSend(v4, "phoneSequence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v14;

    objc_msgSend(v4, "ipaPhoneSequence");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v17;

    v5->_appendedAutoPunctuation = objc_msgSend(v4, "appendedAutoPunctuation");
    v5->_prependedAutoPunctuation = objc_msgSend(v4, "prependedAutoPunctuation");
    v5->_isModifiedByAutoPunctuation = objc_msgSend(v4, "isModifiedByAutoPunctuation");
    objc_msgSend(v4, "graphCost");
    v5->_graphCost = v19;
    objc_msgSend(v4, "acousticCost");
    v5->_acousticCost = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *tokenName;
  id v5;

  tokenName = self->_tokenName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tokenName, CFSTR("tokenName"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("start"), self->_start);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("end"), self->_end);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("silenceStart"), self->_silenceStart);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSpaceAfter, CFSTR("hasSpaceAfter"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasSpaceBefore, CFSTR("hasSpaceBefore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phoneSequence, CFSTR("phoneSequence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipaPhoneSequence, CFSTR("ipaPhoneSequence"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appendedAutoPunctuation, CFSTR("appendedAutoPunctuation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prependedAutoPunctuation, CFSTR("prependedAutoPunctuation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isModifiedByAutoPunctuation, CFSTR("isModifiedByAutoPunctuation"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("graphCost"), self->_graphCost);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("acousticCost"), self->_acousticCost);

}

- (EARSpeechRecognitionToken)initWithCoder:(id)a3
{
  id v4;
  EARSpeechRecognitionToken *v5;
  uint64_t v6;
  NSString *tokenName;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSString *phoneSequence;
  uint64_t v14;
  NSString *ipaPhoneSequence;
  double v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EARSpeechRecognitionToken;
  v5 = -[EARSpeechRecognitionToken init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenName"));
    v6 = objc_claimAutoreleasedReturnValue();
    tokenName = v5->_tokenName;
    v5->_tokenName = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start"));
    v5->_start = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("end"));
    v5->_end = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("silenceStart"));
    v5->_silenceStart = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v11;
    v5->_hasSpaceAfter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpaceAfter"));
    v5->_hasSpaceBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasSpaceBefore"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phoneSequence"));
    v12 = objc_claimAutoreleasedReturnValue();
    phoneSequence = v5->_phoneSequence;
    v5->_phoneSequence = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ipaPhoneSequence"));
    v14 = objc_claimAutoreleasedReturnValue();
    ipaPhoneSequence = v5->_ipaPhoneSequence;
    v5->_ipaPhoneSequence = (NSString *)v14;

    v5->_appendedAutoPunctuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appendedAutoPunctuation"));
    v5->_prependedAutoPunctuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prependedAutoPunctuation"));
    v5->_isModifiedByAutoPunctuation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isModifiedByAutoPunctuation"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("graphCost"));
    v5->_graphCost = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("acousticCost"));
    v5->_acousticCost = v17;
  }

  return v5;
}

- (NSString)tokenName
{
  return self->_tokenName;
}

- (double)start
{
  return self->_start;
}

- (double)end
{
  return self->_end;
}

- (double)silenceStart
{
  return self->_silenceStart;
}

- (double)confidence
{
  return self->_confidence;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (BOOL)hasSpaceBefore
{
  return self->_hasSpaceBefore;
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (BOOL)appendedAutoPunctuation
{
  return self->_appendedAutoPunctuation;
}

- (BOOL)prependedAutoPunctuation
{
  return self->_prependedAutoPunctuation;
}

- (BOOL)isModifiedByAutoPunctuation
{
  return self->_isModifiedByAutoPunctuation;
}

- (double)graphCost
{
  return self->_graphCost;
}

- (double)acousticCost
{
  return self->_acousticCost;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_tokenName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
