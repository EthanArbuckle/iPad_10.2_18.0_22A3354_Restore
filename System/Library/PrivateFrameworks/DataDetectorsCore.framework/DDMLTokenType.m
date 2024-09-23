@implementation DDMLTokenType

- (id)debugDescription
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;

  if (-[DDMLTokenType classification](self, "classification") == 10)
  {
    v3 = CFSTR("0");
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    if (-[DDMLTokenType beginning](self, "beginning"))
      v5 = CFSTR("B");
    else
      v5 = CFSTR("I");
    v6 = -[DDMLTokenType classification](self, "classification");
    if (v6 > 0xA)
      v7 = 0;
    else
      v7 = off_1E3C94E70[v6];
    v8 = v7;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v5, v8);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (DDMLTokenType)initWithClassification:(int)a3 beginning:(BOOL)a4
{
  DDMLTokenType *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DDMLTokenType;
  result = -[DDMLTokenType init](&v7, sel_init);
  if (result)
  {
    result->_classification = a3;
    result->_beginning = a4;
  }
  return result;
}

- (int)classification
{
  return self->_classification;
}

- (BOOL)beginning
{
  return self->_beginning;
}

@end
