@implementation _AFSpeechSynthesisRecordMutation

- (_AFSpeechSynthesisRecordMutation)initWithBase:(id)a3
{
  id v5;
  _AFSpeechSynthesisRecordMutation *v6;
  _AFSpeechSynthesisRecordMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechSynthesisRecordMutation;
  v6 = -[_AFSpeechSynthesisRecordMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getUtterance
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_utterance;
  }
  else
  {
    -[AFSpeechSynthesisRecord utterance](self->_base, "utterance");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getBeginTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_beginTimestamp;
  else
    return -[AFSpeechSynthesisRecord beginTimestamp](self->_base, "beginTimestamp");
}

- (void)setBeginTimestamp:(unint64_t)a3
{
  self->_beginTimestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getEndTimestamp
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_endTimestamp;
  else
    return -[AFSpeechSynthesisRecord endTimestamp](self->_base, "endTimestamp");
}

- (void)setEndTimestamp:(unint64_t)a3
{
  self->_endTimestamp = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
