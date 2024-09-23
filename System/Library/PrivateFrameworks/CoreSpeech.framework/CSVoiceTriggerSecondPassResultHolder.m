@implementation CSVoiceTriggerSecondPassResultHolder

- (CSVoiceTriggerSecondPassResultHolder)initWithResult:(unint64_t)a3 voiceTriggerEventInfo:(id)a4 isSecondChanceCandidate:(BOOL)a5
{
  id v8;
  CSVoiceTriggerSecondPassResultHolder *v9;
  CSVoiceTriggerSecondPassResultHolder *v10;
  uint64_t v11;
  NSDictionary *voiceTriggerEventInfo;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSVoiceTriggerSecondPassResultHolder;
  v9 = -[CSVoiceTriggerSecondPassResultHolder init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_result = a3;
    v11 = objc_msgSend(v8, "copy");
    voiceTriggerEventInfo = v10->_voiceTriggerEventInfo;
    v10->_voiceTriggerEventInfo = (NSDictionary *)v11;

    v10->_isSecondChanceCandidate = a5;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("result=%lu, isSecondChanceCandidate=%d, voiceTriggerEventInfo=%@"), self->_result, self->_isSecondChanceCandidate, self->_voiceTriggerEventInfo);
}

- (unint64_t)result
{
  return self->_result;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (BOOL)isSecondChanceCandidate
{
  return self->_isSecondChanceCandidate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
}

@end
