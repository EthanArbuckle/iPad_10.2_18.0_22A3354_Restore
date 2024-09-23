@implementation CHRecognitionResult

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_score(self, v5, v6, v7, v8, v9);
  v11 = v10;
  objc_msgSend_string(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v18, (uint64_t)CFSTR("class: %@ score: %3.5f string: %@"), v19, v20, v21, v4, v11, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CHRecognitionResult)initWithScore:(double)a3
{
  CHRecognitionResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHRecognitionResult;
  result = -[CHRecognitionResult init](&v5, sel_init);
  if (result)
    result->_score = a3;
  return result;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

@end
