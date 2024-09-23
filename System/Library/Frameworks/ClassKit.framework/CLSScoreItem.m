@implementation CLSScoreItem

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSScoreItem;
  return -[CLSActivityItem _init](&v3, sel__init);
}

- (CLSScoreItem)initWithIdentifier:(id)a3 title:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLSScoreItem;
  return -[CLSActivityItem initWithIdentifier:title:](&v5, sel_initWithIdentifier_title_, a3, a4);
}

- (CLSScoreItem)initWithIdentifier:(NSString *)identifier title:(NSString *)title score:(double)score maxScore:(double)maxScore
{
  CLSScoreItem *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSScoreItem;
  result = -[CLSActivityItem initWithIdentifier:title:](&v9, sel_initWithIdentifier_title_, identifier, title);
  if (result)
  {
    result->_score = score;
    result->_maxScore = maxScore;
  }
  return result;
}

- (CLSScoreItem)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSScoreItem *v6;
  double v7;
  const char *v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSScoreItem;
  v6 = -[CLSActivityItem initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend_decodeDoubleForKey_(v4, v5, (uint64_t)CFSTR("score"));
    v6->_score = v7;
    objc_msgSend_decodeDoubleForKey_(v4, v8, (uint64_t)CFSTR("maxScore"));
    v6->_maxScore = v9;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSScoreItem;
  v4 = a3;
  -[CLSActivityItem encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeDouble_forKey_(v4, v5, (uint64_t)CFSTR("score"), self->_score, v7.receiver, v7.super_class);
  objc_msgSend_encodeDouble_forKey_(v4, v6, (uint64_t)CFSTR("maxScore"), self->_maxScore);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v19.receiver = self;
  v19.super_class = (Class)CLSScoreItem;
  -[CLSActivityItem description](&v19, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend_initWithString_(v3, v5, (uint64_t)v4);

  objc_msgSend_score(self, v7, v8);
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR(" (score: %.2f)"), v10);
  objc_msgSend_maxScore(self, v11, v12);
  objc_msgSend_appendFormat_(v6, v13, (uint64_t)CFSTR(" (maxScore: %.2f)"), v14);
  v17 = (void *)objc_msgSend_copy(v6, v15, v16);

  return v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLSScoreItem;
  -[CLSActivityItem dictionaryRepresentation](&v17, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(self, v4, v5);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v6, v7, self->_score);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, CFSTR("score"));

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v10, v11, self->_maxScore);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v3, v13, (uint64_t)v12, CFSTR("maxScore"));

  objc_msgSend_unlock(self, v14, v15);
  return v3;
}

- (double)score
{
  uint64_t v2;
  double score;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  score = self->_score;
  objc_msgSend_unlock(self, v5, v6);
  return score;
}

- (void)setScore:(double)score
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v3);
  if (self->_score != score)
  {
    self->_score = score;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
}

- (double)maxScore
{
  uint64_t v2;
  double maxScore;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  maxScore = self->_maxScore;
  objc_msgSend_unlock(self, v5, v6);
  return maxScore;
}

- (void)setMaxScore:(double)maxScore
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_lock(self, a2, v3);
  if (self->_maxScore != maxScore)
  {
    self->_maxScore = maxScore;
    objc_msgSend_setModified_(self, v6, 1);
  }
  objc_msgSend_unlock(self, v6, v7);
}

@end
