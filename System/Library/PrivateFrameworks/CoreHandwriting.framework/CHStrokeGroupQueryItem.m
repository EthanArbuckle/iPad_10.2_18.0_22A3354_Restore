@implementation CHStrokeGroupQueryItem

+ (id)descriptionForStrokeGroupQueryItemType:(int64_t)a3
{
  const __CFString *v3;

  v3 = &stru_1E77F6F28;
  if (a3 == 1)
    v3 = CFSTR("Handwriting");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Unknown");
}

- (id)textRecognitionResultForLocale:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSDictionary *errorsByLocale;
  NSDictionary *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v10 = a3;
  if (self)
  {
    objc_msgSend_objectForKeyedSubscript_(self->__tokenizedTextResultsByLocale, v6, (uint64_t)v10, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend_objectForKeyedSubscript_(0, v6, (uint64_t)v10, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_6;
  }
  if (self)
    errorsByLocale = self->__errorsByLocale;
  else
    errorsByLocale = 0;
  v13 = errorsByLocale;
  objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v10, v15, v16, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  *a4 = v18;
LABEL_6:

  return v11;
}

- (int64_t)strokeClassification
{
  return self->__strokeClassification;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSNumber *strokeGroupIdentifier;
  NSNumber *strokeGroupStableIdentifier;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v3 = (void *)objc_opt_class();
  objc_msgSend_descriptionForStrokeGroupQueryItemType_(v3, v4, self->_strokeGroupType, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)CHStrokeGroupQueryItem;
  -[CHStrokeGroupQueryItem description](&v24, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  strokeGroupIdentifier = self->_strokeGroupIdentifier;
  strokeGroupStableIdentifier = self->_strokeGroupStableIdentifier;
  v17 = objc_msgSend_count(self->_strokeIdentifiers, v12, v13, v14, v15, v16);
  objc_msgSend_stringByAppendingFormat_(v9, v18, (uint64_t)CFSTR(" ID: %@, StableID: %@, Stroke count: %ld, type: %@"), v19, v20, v21, strokeGroupIdentifier, strokeGroupStableIdentifier, v17, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSNumber)strokeGroupIdentifier
{
  return self->_strokeGroupIdentifier;
}

- (NSNumber)strokeGroupStableIdentifier
{
  return self->_strokeGroupStableIdentifier;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (int64_t)strokeGroupType
{
  return self->_strokeGroupType;
}

- (NSLocale)preferredLocale
{
  return self->_preferredLocale;
}

- (CHTokenizedMathResult)mathResult
{
  return self->_mathResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__errorsByLocale, 0);
  objc_storeStrong((id *)&self->__tokenizedTextResultsByLocale, 0);
  objc_storeStrong((id *)&self->_mathResult, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeGroupStableIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeGroupIdentifier, 0);
}

@end
