@implementation SymbolCandidate

- (NSString)description
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[SymbolCandidate symbol](self, "symbol");
  -[SymbolCandidate probability](self, "probability");
  v6 = v5;
  -[SymbolCandidate logProbability](self, "logProbability");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%C : %f (%f)"), v4, v6, v7);
}

- (unsigned)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(unsigned __int16)a3
{
  self->_symbol = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (double)logProbability
{
  return self->_logProbability;
}

- (void)setLogProbability:(double)a3
{
  self->_logProbability = a3;
}

@end
