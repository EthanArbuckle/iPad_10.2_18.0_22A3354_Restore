@implementation KVSpanInfo

- (KVSpanInfo)initWithSpanInfo:(id)a3
{
  id v5;
  KVSpanInfo *v6;
  KVSpanInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVSpanInfo;
  v6 = -[KVSpanInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_spanInfo, a3);

  return v7;
}

- (_NSRange)spanRange
{
  uint64_t v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = objc_msgSend_spanRange(self->_spanInfo, a2, v2, v3);
  result.length = v5;
  result.location = v4;
  return result;
}

- (float)matchScore
{
  uint64_t v2;
  uint64_t v3;
  float result;

  objc_msgSend_matchScore(self->_spanInfo, a2, v2, v3);
  return result;
}

- (unsigned)maxTokenCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_maxTokenCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)matchedTokenCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_matchedTokenCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)maxStopWordCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_maxStopWordCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)matchedStopWordCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_matchedStopWordCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)maxAliasCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_maxAliasCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)matchedAliasCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_matchedAliasCount(self->_spanInfo, a2, v2, v3);
}

- (unsigned)editDistance
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_editDistance(self->_spanInfo, a2, v2, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_opt_class();
  v8 = (_QWORD *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v11 = objc_msgSend_copyWithZone_(self->_spanInfo, v9, (uint64_t)a3, v10);
  v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  KVSpanInfo *v4;
  KVSpanInfo *v5;
  const char *v6;
  uint64_t v7;
  char isEqualToSpanInfo;

  v4 = (KVSpanInfo *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToSpanInfo = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToSpanInfo = objc_msgSend_isEqualToSpanInfo_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    isEqualToSpanInfo = 0;
  }

  return isEqualToSpanInfo;
}

- (BOOL)isEqualToSpanInfo:(id)a3
{
  void *v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SEMSpanInfo *spanInfo;
  SEMSpanInfo *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isEqual;

  v5 = a3;
  v9 = v5;
  spanInfo = self->_spanInfo;
  v11 = spanInfo;
  if (!spanInfo)
  {
    objc_msgSend_spanInfo(v5, v6, v7, v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      isEqual = 1;
LABEL_7:

      goto LABEL_8;
    }
    v11 = self->_spanInfo;
  }
  objc_msgSend_spanInfo(v9, v6, v7, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v13, (uint64_t)v12, v14);

  if (!spanInfo)
    goto LABEL_7;
LABEL_8:

  return isEqual;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_spanInfo, a2, v2, v3);
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_hash(self->_spanInfo, a2, v2, v3);
}

- (BOOL)isPartialMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1E0DE7D20])(self->_spanInfo, sel_isPartialMatch);
}

- (BOOL)isApproximateMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1E0DE7D20])(self->_spanInfo, sel_isApproximateMatch);
}

- (BOOL)isAliasMatch
{
  return ((uint64_t (*)(SEMSpanInfo *, char *))MEMORY[0x1E0DE7D20])(self->_spanInfo, sel_isAliasMatch);
}

- (id)getAliasTypesArray
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  char matched;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  matched = objc_msgSend_aliasMatchOptions(self->_spanInfo, v6, v7, v8);
  if ((matched & 1) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, 1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v13, (uint64_t)v12, v14);

  }
  if ((matched & 2) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, 2, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v16, (uint64_t)v15, v17);

  }
  if ((matched & 4) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, 4, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v19, (uint64_t)v18, v20);

  }
  if ((matched & 8) != 0)
  {
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, 8, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v22, (uint64_t)v21, v23);

  }
  return v5;
}

- (SEMSpanInfo)spanInfo
{
  return self->_spanInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spanInfo, 0);
}

+ (id)spanInfoFromEncodedString:(id)a3 error:(id *)a4
{
  objc_msgSend_spanInfoFromEncodedString_error_(KVEncodedSpanInfo, a2, (uint64_t)a3, (uint64_t)a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
