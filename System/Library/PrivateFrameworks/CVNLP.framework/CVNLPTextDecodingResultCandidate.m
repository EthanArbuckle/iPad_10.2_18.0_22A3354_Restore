@implementation CVNLPTextDecodingResultCandidate

- (CVNLPTextDecodingResultCandidate)initWithTokens:(id)a3 score:(double)a4 activationScore:(double)a5
{
  id v9;
  CVNLPTextDecodingResultCandidate *v10;
  CVNLPTextDecodingResultCandidate *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CVNLPTextDecodingResultCandidate;
  v10 = -[CVNLPTextDecodingResultCandidate init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tokens, a3);
    v11->_score = a4;
    v11->_activationScore = a5;
  }

  return v11;
}

- (NSString)fullString
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSArray *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_tokens;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v6);
        objc_msgSend_fullString(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v14), v9, v10, v11, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v5, v16, (uint64_t)v15, v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
    }
    while (v12);
  }

  return (NSString *)v5;
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)activationScore
{
  return self->_activationScore;
}

- (void)setActivationScore:(double)a3
{
  self->_activationScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
