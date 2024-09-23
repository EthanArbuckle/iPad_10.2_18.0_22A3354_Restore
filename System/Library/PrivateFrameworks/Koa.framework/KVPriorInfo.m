@implementation KVPriorInfo

- (KVPriorInfo)initWithOrdinality:(unsigned int)a3 score:(float)a4
{
  KVPriorInfo *v6;
  KVPriorInfo *v7;
  KVPriorInfo *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)KVPriorInfo;
  v6 = -[KVPriorInfo init](&v11, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  v6->_score = a4;
  if (a4 >= 0.0 && a4 <= 1.0)
  {
    v6->_ordinality = a3;
LABEL_5:
    v8 = v6;
    goto LABEL_9;
  }
  v9 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[KVPriorInfo initWithOrdinality:score:]";
    v14 = 2048;
    v15 = a4;
    _os_log_error_impl(&dword_1B70E7000, v9, OS_LOG_TYPE_ERROR, "%s Invalid score: %f", buf, 0x16u);
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (KVPriorInfo)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (unsigned)ordinality
{
  return self->_ordinality;
}

- (float)score
{
  return self->_score;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  id result;

  v5 = (void *)objc_opt_class();
  result = (id)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  *((_DWORD *)result + 2) = self->_ordinality;
  *((_DWORD *)result + 3) = LODWORD(self->_score);
  return result;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KVPriorInfo;
  -[KVPriorInfo description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v4, (uint64_t)CFSTR(" ordinality: %d, prior score: %f"), v5, self->_ordinality, self->_score);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  KVPriorInfo *v4;
  KVPriorInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToPriorInfo;

  v4 = (KVPriorInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToPriorInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToPriorInfo = objc_msgSend_isEqualToPriorInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToPriorInfo = 0;
  }

  return isEqualToPriorInfo;
}

- (BOOL)isEqualToPriorInfo:(id)a3
{
  id v4;
  unsigned int ordinality;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  float score;
  float v13;
  BOOL v14;

  v4 = a3;
  ordinality = self->_ordinality;
  if (ordinality == objc_msgSend_ordinality(v4, v6, v7, v8))
  {
    score = self->_score;
    objc_msgSend_score(v4, v9, v10, v11);
    v14 = score == v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, self->_ordinality, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);
  *(float *)&v9 = self->_score;
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v10, v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v8;

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v4, self->_ordinality, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)v6, (uint64_t)CFSTR("o"));

  *(float *)&v8 = self->_score;
  objc_msgSend_encodeFloat_forKey_(v11, v9, (uint64_t)CFSTR("s"), v10, v8);

}

- (KVPriorInfo)initWithCoder:(id)a3
{
  id v4;
  KVPriorInfo *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  float v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVPriorInfo;
  v5 = -[KVPriorInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("o"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ordinality = objc_msgSend_unsignedIntValue(v8, v9, v10, v11);

    objc_msgSend_decodeFloatForKey_(v4, v12, (uint64_t)CFSTR("s"), v13);
    v5->_score = v14;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
