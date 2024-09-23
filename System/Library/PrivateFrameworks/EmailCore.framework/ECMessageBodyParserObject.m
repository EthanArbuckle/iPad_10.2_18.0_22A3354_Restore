@implementation ECMessageBodyParserObject

- (void)messageBodyParserWillBeginParsing:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[ECMessageBodyParserObject timeoutInterval](self, "timeoutInterval", a3);
  v5 = v4;
  v6 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0.0);
    v6 = v5 + v7;
  }
  self->_timeoutTime = v6;
}

- (void)abortParsing
{
  self->_shouldAbort = 1;
}

- (BOOL)shouldProceedParsing
{
  double v3;

  if (self->_timeoutTime > 0.0 && !self->_didTimeout)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v3 > self->_timeoutTime)
      self->_didTimeout = 1;
  }
  return !self->_shouldAbort && !self->_didTimeout;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

@end
