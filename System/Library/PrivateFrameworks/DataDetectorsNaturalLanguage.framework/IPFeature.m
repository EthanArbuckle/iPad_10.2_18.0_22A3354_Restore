@implementation IPFeature

- (id)matchString
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  -[IPFeature textUnit](self, "textUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v5 = -[IPFeature matchRange](self, "matchRange");
  v7 = 0;
  v8 = __CFADD__(v6, v5);
  if (v6 && v4 && !v8 && v5 + v6 <= v4)
  {
    objc_msgSend(v3, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)IPFeature;
  -[IPFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeature matchString](self, "matchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isMatchStringInsideQuotationMarks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v3 = -[IPFeature matchRange](self, "matchRange");
  v5 = v4;
  -[IPFeature textUnit](self, "textUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[IPRegexToolbox isRangeInsideQuotationMarks:text:limitToSurroundingText:](IPRegexToolbox, "isRangeInsideQuotationMarks:text:limitToSurroundingText:", v3, v5, v6, 1);

  return v7;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (_NSRange)matchRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_matchRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setMatchRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_matchRange, &v3, 16, 1, 0);
}

- (NSString)textUnit
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTextUnit:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textUnit, 0);
}

@end
