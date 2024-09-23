@implementation AXTypingPrediction

- (id)description
{
  void *v3;
  NSString *prefix;
  void *v5;
  void *v6;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXTypingPrediction;
  -[AXTypingPrediction description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&self->_fullWord;
  prefix = self->_prefix;
  NSStringFromRange(self->_rangeToReplace);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - fullWord %@, textToInsert %@, prefix %@, range to replace %@"), v8, prefix, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)fullWord
{
  return self->_fullWord;
}

- (void)setFullWord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)textToInsert
{
  return self->_textToInsert;
}

- (void)setTextToInsert:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_NSRange)rangeToReplace
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeToReplace.length;
  location = self->_rangeToReplace.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeToReplace:(_NSRange)a3
{
  self->_rangeToReplace = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_textToInsert, 0);
  objc_storeStrong((id *)&self->_fullWord, 0);
}

@end
