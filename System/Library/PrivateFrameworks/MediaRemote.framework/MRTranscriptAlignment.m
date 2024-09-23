@implementation MRTranscriptAlignment

- (MRTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8
{
  MRTranscriptAlignment *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRTranscriptAlignment;
  result = -[MRTranscriptAlignment init](&v15, sel_init);
  if (result)
  {
    result->_playerStartTime = a3;
    result->_playerEndTime = a4;
    result->_referenceStartTime = a5;
    result->_referenceEndTime = a6;
    result->_matchedBeginning = a7;
    result->_matchedEnd = a8;
  }
  return result;
}

- (MRTranscriptAlignment)initWithProtobuf:(id)a3
{
  id v4;
  MRTranscriptAlignment *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  MRTranscriptAlignment *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRTranscriptAlignment;
    v5 = -[MRTranscriptAlignment init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "playerStartTime");
      v5->_playerStartTime = v6;
      objc_msgSend(v4, "playerEndTime");
      v5->_playerEndTime = v7;
      objc_msgSend(v4, "referenceStartTime");
      v5->_referenceStartTime = v8;
      objc_msgSend(v4, "referenceEndTime");
      v5->_referenceEndTime = v9;
      v5->_matchedBeginning = objc_msgSend(v4, "matchedBeginning");
      v5->_matchedEnd = objc_msgSend(v4, "matchedEnd");
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MRTranscriptAlignmentProtobuf)protobuf
{
  _MRTranscriptAlignmentProtobuf *v3;

  v3 = objc_alloc_init(_MRTranscriptAlignmentProtobuf);
  -[MRTranscriptAlignment playerStartTime](self, "playerStartTime");
  -[_MRTranscriptAlignmentProtobuf setPlayerStartTime:](v3, "setPlayerStartTime:");
  -[MRTranscriptAlignment playerEndTime](self, "playerEndTime");
  -[_MRTranscriptAlignmentProtobuf setPlayerEndTime:](v3, "setPlayerEndTime:");
  -[MRTranscriptAlignment referenceStartTime](self, "referenceStartTime");
  -[_MRTranscriptAlignmentProtobuf setReferenceStartTime:](v3, "setReferenceStartTime:");
  -[MRTranscriptAlignment referenceEndTime](self, "referenceEndTime");
  -[_MRTranscriptAlignmentProtobuf setReferenceEndTime:](v3, "setReferenceEndTime:");
  -[_MRTranscriptAlignmentProtobuf setMatchedBeginning:](v3, "setMatchedBeginning:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"));
  -[_MRTranscriptAlignmentProtobuf setMatchedEnd:](v3, "setMatchedEnd:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"));
  return v3;
}

- (id)data
{
  void *v2;
  void *v3;

  -[MRTranscriptAlignment protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("playerStartTime");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[MRTranscriptAlignment playerStartTime](self, "playerStartTime");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("playerEndTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MRTranscriptAlignment playerEndTime](self, "playerEndTime");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("referenceStartTime");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[MRTranscriptAlignment referenceStartTime](self, "referenceStartTime");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("referenceEndTime");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MRTranscriptAlignment referenceEndTime](self, "referenceEndTime");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  v15[4] = CFSTR("matchedBeginning");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v11;
  v15[5] = CFSTR("matchedEnd");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[MRTranscriptAlignment playerStartTime](self, "playerStartTime");
  objc_msgSend(v4, "setPlayerStartTime:");
  -[MRTranscriptAlignment playerEndTime](self, "playerEndTime");
  objc_msgSend(v4, "setPlayerEndTime:");
  -[MRTranscriptAlignment referenceStartTime](self, "referenceStartTime");
  objc_msgSend(v4, "setReferenceStartTime:");
  -[MRTranscriptAlignment referenceEndTime](self, "referenceEndTime");
  objc_msgSend(v4, "setReferenceEndTime:");
  objc_msgSend(v4, "setMatchedBeginning:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"));
  objc_msgSend(v4, "setMatchedEnd:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    -[MRTranscriptAlignment playerStartTime](self, "playerStartTime");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("playerStartTime"));
    -[MRTranscriptAlignment playerEndTime](self, "playerEndTime");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("playerEndTime"));
    -[MRTranscriptAlignment referenceStartTime](self, "referenceStartTime");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("referenceStartTime"));
    -[MRTranscriptAlignment referenceEndTime](self, "referenceEndTime");
    objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("referenceEndTime"));
    objc_msgSend(v5, "encodeBool:forKey:", -[MRTranscriptAlignment matchedBeginning](self, "matchedBeginning"), CFSTR("matchedBeginning"));
    objc_msgSend(v5, "encodeBool:forKey:", -[MRTranscriptAlignment matchedEnd](self, "matchedEnd"), CFSTR("matchedEnd"));
    -[MRTranscriptAlignment protobuf](self, "protobuf");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("protobuf"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("coder must support key-value coding"));
  }

}

- (MRTranscriptAlignment)initWithCoder:(id)a3
{
  id v4;
  MRTranscriptAlignment *v5;
  void *v6;
  MRTranscriptAlignment *v7;
  void *v8;
  NSObject *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRTranscriptAlignment;
  v5 = -[MRTranscriptAlignment init](&v11, sel_init);
  if (!v5)
    goto LABEL_11;
  if (!objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 38);
    objc_msgSend(v4, "failWithError:", v8);

LABEL_11:
    v7 = v5;
    goto LABEL_12;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v6, v9);

    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_10:
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("playerStartTime"));
    -[MRTranscriptAlignment setPlayerStartTime:](v5, "setPlayerStartTime:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("playerEndTime"));
    -[MRTranscriptAlignment setPlayerEndTime:](v5, "setPlayerEndTime:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("referenceStartTime"));
    -[MRTranscriptAlignment setReferenceStartTime:](v5, "setReferenceStartTime:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("referenceEndTime"));
    -[MRTranscriptAlignment setReferenceEndTime:](v5, "setReferenceEndTime:");
    -[MRTranscriptAlignment setMatchedBeginning:](v5, "setMatchedBeginning:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("matchedBeginning")));
    -[MRTranscriptAlignment setMatchedEnd:](v5, "setMatchedEnd:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("matchedEnd")));
    goto LABEL_11;
  }
  v7 = -[MRTranscriptAlignment initWithProtobuf:](v5, "initWithProtobuf:", v6);

LABEL_12:
  return v7;
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (void)setPlayerStartTime:(double)a3
{
  self->_playerStartTime = a3;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (void)setPlayerEndTime:(double)a3
{
  self->_playerEndTime = a3;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (void)setReferenceStartTime:(double)a3
{
  self->_referenceStartTime = a3;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (void)setReferenceEndTime:(double)a3
{
  self->_referenceEndTime = a3;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (void)setMatchedBeginning:(BOOL)a3
{
  self->_matchedBeginning = a3;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

- (void)setMatchedEnd:(BOOL)a3
{
  self->_matchedEnd = a3;
}

@end
