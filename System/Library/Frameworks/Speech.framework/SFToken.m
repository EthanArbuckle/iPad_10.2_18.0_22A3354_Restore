@implementation SFToken

- (SFToken)initWithText:(id)a3 confidence:(double)a4 startTime:(double)a5 duration:(double)a6
{
  id v11;
  SFToken *v12;
  SFToken *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFToken;
  v12 = -[SFToken init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_text, a3);
    v13->_confidence = a4;
    v13->_startTime = a5;
    v13->_duration = a6;
  }

  return v13;
}

- (NSString)text
{
  return self->_text;
}

- (double)confidence
{
  return self->_confidence;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
