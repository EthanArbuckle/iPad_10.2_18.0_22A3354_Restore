@implementation NLLexiconCompletion

- (NLLexiconCompletion)initWithTokenID:(unsigned int)a3 score:(double)a4
{
  NLLexiconCompletion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NLLexiconCompletion;
  result = -[NLLexiconCompletion init](&v7, sel_init);
  if (result)
  {
    result->_tokenID = a3;
    result->_score = a4;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%u %.4g>"), self->_tokenID, *(_QWORD *)&self->_score);
}

- (unsigned)tokenID
{
  return self->_tokenID;
}

- (double)score
{
  return self->_score;
}

@end
