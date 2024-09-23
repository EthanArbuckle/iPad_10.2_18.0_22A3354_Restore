@implementation CLSEventResult

- (BOOL)isSameEventAsResult:(id)a3
{
  return 0;
}

- (void)mergeWithResult:(id)a3
{
  float v4;
  float v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "confidence");
  if (v4 > self->_confidence)
  {
    objc_msgSend(v6, "confidence");
    self->_confidence = v5;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CLSEvent title](self->_event, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] (%f)"), v4, self->_confidence);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CLSEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

+ (id)eventResultWithEvent:(id)a3 andConfidence:(float)a4
{
  id v5;
  CLSEventResult *v6;
  double v7;

  v5 = a3;
  v6 = objc_alloc_init(CLSEventResult);
  -[CLSEventResult setEvent:](v6, "setEvent:", v5);

  *(float *)&v7 = a4;
  -[CLSEventResult setConfidence:](v6, "setConfidence:", v7);
  return v6;
}

@end
