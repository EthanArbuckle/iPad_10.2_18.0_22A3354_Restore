@implementation CKVMatchingSpanMetadata

- (CKVMatchingSpanMetadata)initWithMatchScore:(float)a3
{
  return -[CKVMatchingSpanMetadata initWithMatchingSpanPriorInfo:matchScore:](self, "initWithMatchingSpanPriorInfo:matchScore:", 0);
}

- (CKVMatchingSpanMetadata)initWithMatchingSpanPriorInfo:(id)a3 matchScore:(float)a4
{
  id v7;
  CKVMatchingSpanMetadata *v8;
  float *v9;
  NSObject *v10;
  CKVMatchingSpanMetadata *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVMatchingSpanMetadata;
  v8 = -[CKVMatchingSpanMetadata init](&v13, sel_init);
  v9 = (float *)v8;
  if (!v8)
    goto LABEL_7;
  if (a4 >= 0.0)
  {
    objc_storeStrong((id *)&v8->_priorInfo, a3);
    v9[2] = a4;
LABEL_7:
    v11 = v9;
    goto LABEL_8;
  }
  v10 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CKVMatchingSpanMetadata initWithMatchingSpanPriorInfo:matchScore:]";
    _os_log_error_impl(&dword_1A48B3000, v10, OS_LOG_TYPE_ERROR, "%s Cannot construct CKVMatchingSpanMetadata with negative match score.", buf, 0xCu);
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (CKVMatchingSpanMetadata)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use supported initializers"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)(v4 + 8) = self->_matchScore;
  v5 = -[CKVMatchingSpanPriorInfo copy](self->_priorInfo, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  return (id)v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVMatchingSpanMetadata;
  -[CKVMatchingSpanMetadata description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" prior information: %@, match score: %f"), self->_priorInfo, self->_matchScore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  double v2;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  *(float *)&v2 = self->_matchScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[CKVMatchingSpanPriorInfo hash](self->_priorInfo, "hash") ^ v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  float matchScore;
  double v5;
  id v6;

  matchScore = self->_matchScore;
  v6 = a3;
  *(float *)&v5 = matchScore;
  objc_msgSend(v6, "encodeFloat:forKey:", CFSTR("matchScore"), v5);
  objc_msgSend(v6, "encodeObject:forKey:", self->_priorInfo, CFSTR("priorInfo"));

}

- (CKVMatchingSpanMetadata)initWithCoder:(id)a3
{
  id v4;
  CKVMatchingSpanMetadata *v5;
  float v6;
  uint64_t v7;
  CKVMatchingSpanPriorInfo *priorInfo;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKVMatchingSpanMetadata;
  v5 = -[CKVMatchingSpanMetadata init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("matchScore"));
    v5->_matchScore = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("priorInfo"));
    v7 = objc_claimAutoreleasedReturnValue();
    priorInfo = v5->_priorInfo;
    v5->_priorInfo = (CKVMatchingSpanPriorInfo *)v7;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  CKVMatchingSpanMetadata *v4;
  CKVMatchingSpanMetadata *v5;
  BOOL v6;

  v4 = (CKVMatchingSpanMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVMatchingSpanMetadata isEqualToMatchingSpanMetadata:](self, "isEqualToMatchingSpanMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToMatchingSpanMetadata:(id)a3
{
  id v4;
  float matchScore;
  float v6;
  char v7;
  uint64_t v8;
  CKVMatchingSpanPriorInfo *priorInfo;

  v4 = a3;
  matchScore = self->_matchScore;
  objc_msgSend(v4, "matchScore");
  if (matchScore == v6)
  {
    objc_msgSend(v4, "priorInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    priorInfo = self->_priorInfo;
    if ((unint64_t)priorInfo | v8)
    {
      v7 = 0;
      if (priorInfo && v8)
        v7 = -[CKVMatchingSpanPriorInfo isEqual:](priorInfo, "isEqual:", v8);
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (float)matchScore
{
  return self->_matchScore;
}

- (CKVMatchingSpanPriorInfo)priorInfo
{
  return self->_priorInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorInfo, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
