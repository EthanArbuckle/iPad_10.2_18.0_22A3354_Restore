@implementation CKVMatchingSpanPriorInfo

- (CKVMatchingSpanPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4
{
  CKVMatchingSpanPriorInfo *v6;
  CKVMatchingSpanPriorInfo *v7;
  NSObject *v8;
  CKVMatchingSpanPriorInfo *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)CKVMatchingSpanPriorInfo;
  v6 = -[CKVMatchingSpanPriorInfo init](&v11, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  if (a4 >= 0.0)
  {
    v6->_ordinality = a3;
    v6->_score = a4;
LABEL_7:
    v9 = v6;
    goto LABEL_8;
  }
  v8 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[CKVMatchingSpanPriorInfo initWithOrdinality:score:]";
    _os_log_error_impl(&dword_1A48B3000, v8, OS_LOG_TYPE_ERROR, "%s Cannot construct CKVMatchingSpanPriorInfo with negative prior score.", buf, 0xCu);
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (CKVMatchingSpanPriorInfo)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use supported initializers"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *((_DWORD *)result + 2) = self->_ordinality;
  *((_DWORD *)result + 3) = LODWORD(self->_score);
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVMatchingSpanPriorInfo;
  -[CKVMatchingSpanPriorInfo description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" ordinality: %d, prior score: %f"), self->_ordinality, self->_score);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_ordinality);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  *(float *)&v5 = self->_score;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ v4;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t ordinality;
  void *v6;
  double v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  ordinality = self->_ordinality;
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", ordinality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("ordinality"));

  *(float *)&v7 = self->_score;
  objc_msgSend(v8, "encodeFloat:forKey:", CFSTR("score"), v7);

}

- (CKVMatchingSpanPriorInfo)initWithCoder:(id)a3
{
  id v4;
  CKVMatchingSpanPriorInfo *v5;
  void *v6;
  float v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKVMatchingSpanPriorInfo;
  v5 = -[CKVMatchingSpanPriorInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ordinality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ordinality = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("score"));
    v5->_score = v7;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CKVMatchingSpanPriorInfo *v4;
  CKVMatchingSpanPriorInfo *v5;
  BOOL v6;

  v4 = (CKVMatchingSpanPriorInfo *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVMatchingSpanPriorInfo isEqualToMatchingSpanPriorInfo:](self, "isEqualToMatchingSpanPriorInfo:", v5);

  return v6;
}

- (BOOL)isEqualToMatchingSpanPriorInfo:(id)a3
{
  id v4;
  unsigned int ordinality;
  float score;
  float v7;
  BOOL v8;

  v4 = a3;
  ordinality = self->_ordinality;
  if (ordinality == objc_msgSend(v4, "ordinality"))
  {
    score = self->_score;
    objc_msgSend(v4, "score");
    v8 = score == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)ordinality
{
  return self->_ordinality;
}

- (float)score
{
  return self->_score;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
