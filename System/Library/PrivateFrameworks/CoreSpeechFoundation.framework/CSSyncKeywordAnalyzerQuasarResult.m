@implementation CSSyncKeywordAnalyzerQuasarResult

- (CSSyncKeywordAnalyzerQuasarResult)initWithConfidence:(double)a3
{
  CSSyncKeywordAnalyzerQuasarResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSSyncKeywordAnalyzerQuasarResult;
  result = -[CSSyncKeywordAnalyzerQuasarResult init](&v5, sel_init);
  if (result)
    result->_triggerConfidence = a3;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("triggerConfidence = %lf"), *(_QWORD *)&self->_triggerConfidence);
}

- (double)triggerConfidence
{
  return self->_triggerConfidence;
}

- (void)setTriggerConfidence:(double)a3
{
  self->_triggerConfidence = a3;
}

@end
