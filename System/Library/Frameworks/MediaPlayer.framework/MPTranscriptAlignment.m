@implementation MPTranscriptAlignment

- (MPTranscriptAlignment)initWithPlayerStartTime:(double)a3 playerEndTime:(double)a4 referenceStartTime:(double)a5 referenceEndTime:(double)a6 matchedBeginning:(BOOL)a7 matchedEnd:(BOOL)a8
{
  MPTranscriptAlignment *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MPTranscriptAlignment;
  result = -[MPTranscriptAlignment init](&v15, sel_init);
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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPTranscriptAlignment playerStartTime](self, "playerStartTime");
  v7 = v6;
  -[MPTranscriptAlignment playerEndTime](self, "playerEndTime");
  v9 = v8;
  -[MPTranscriptAlignment referenceStartTime](self, "referenceStartTime");
  v11 = v10;
  -[MPTranscriptAlignment referenceEndTime](self, "referenceEndTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, Player: [%0.2f, %0.2f], Reference: [%0.2f, %0.2f]>"), v5, self, v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

@end
