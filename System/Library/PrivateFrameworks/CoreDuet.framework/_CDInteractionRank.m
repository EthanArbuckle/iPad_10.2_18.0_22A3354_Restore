@implementation _CDInteractionRank

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSSet)reasons
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
