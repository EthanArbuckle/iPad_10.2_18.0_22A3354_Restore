@implementation VCCaptionTaskInfo

- (VCCaptionTaskInfo)initWithTask:(id)a3 token:(int64_t)a4 utteranceNumber:(unsigned int)a5
{
  VCCaptionTaskInfo *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCCaptionTaskInfo;
  v8 = -[VCCaptionTaskInfo init](&v10, sel_init);
  if (v8)
  {
    v8->_task = a3;
    v8->_token = a4;
    v8->_updateNumber = 0;
    v8->_utteranceNumber = a5;
    v8->_hostTime = NAN;
  }
  return v8;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionTaskInfo;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ token=%ld updateNumber=%u utteranceNumber=%u hostTime=%f"), -[VCCaptionTaskInfo description](&v3, sel_description), self->_token, self->_updateNumber, self->_utteranceNumber, *(_QWORD *)&self->_hostTime);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionTaskInfo;
  -[VCCaptionTaskInfo dealloc](&v3, sel_dealloc);
}

- (id)task
{
  return self->_task;
}

- (int64_t)token
{
  return self->_token;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_updateNumber = a3;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

@end
