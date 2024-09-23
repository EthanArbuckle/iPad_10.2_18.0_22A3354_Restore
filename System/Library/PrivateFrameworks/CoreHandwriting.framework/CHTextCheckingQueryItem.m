@implementation CHTextCheckingQueryItem

- (void)dealloc
{
  CGPath *estimatedBaseline;
  objc_super v4;

  estimatedBaseline = self->_estimatedBaseline;
  if (estimatedBaseline)
    CGPathRelease(estimatedBaseline);
  v4.receiver = self;
  v4.super_class = (Class)CHTextCheckingQueryItem;
  -[CHTextCheckingQueryItem dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t textCheckingResultType;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CHTextCheckingQueryItem;
  -[CHTextCheckingQueryItem description](&v23, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  textCheckingResultType = self->_textCheckingResultType;
  objc_msgSend_replacementStrings(self, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v17, (uint64_t)CFSTR(" strokeIdentifiers: %@, correction type = %d, replacement strings = %@"), v18, v19, v20, v9, textCheckingResultType, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isEqualToTextCheckingQueryItem:(id)a3
{
  CHTextCheckingQueryItem *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
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
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const CGPath *v50;
  BOOL v51;
  int v53;
  CHTextCheckingQueryItem *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (CHTextCheckingQueryItem *)a3;
  if (!v4)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v53 = 138412290;
      v54 = v4;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHTextCheckingQueryItem: %@", (uint8_t *)&v53, 0xCu);
    }

  }
  if (v4 == self)
  {
    v51 = 1;
    goto LABEL_15;
  }
  objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (!isEqual)
    goto LABEL_13;
  if (objc_msgSend_textCheckingResultType(v4, v23, v24, v25, v26, v27) == self->_textCheckingResultType
    && (objc_msgSend_replacementStrings(v4, v28, v29, v30, v31, v32),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_replacementStrings(self, v34, v35, v36, v37, v38),
        v39 = (void *)objc_claimAutoreleasedReturnValue(),
        v44 = objc_msgSend_isEqual_(v33, v40, (uint64_t)v39, v41, v42, v43),
        v39,
        v33,
        v44))
  {
    v50 = (const CGPath *)objc_msgSend_estimatedBaseline(v4, v45, v46, v47, v48, v49);
    v51 = CGPathEqualToPath(v50, self->_estimatedBaseline);
  }
  else
  {
LABEL_13:
    v51 = 0;
  }
LABEL_15:

  return v51;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTextCheckingQueryItem;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTextCheckingQueryItem = objc_msgSend_isEqualToTextCheckingQueryItem_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTextCheckingQueryItem;
  }
  else
  {

    return 0;
  }
}

- (BOOL)isEquivalentToTextCheckingQueryItem:(id)a3
{
  CHTextCheckingQueryItem *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
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
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  int v30;
  CHTextCheckingQueryItem *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (CHTextCheckingQueryItem *)a3;
  if (!v4)
    goto LABEL_11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v10 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v30 = 138412290;
      v31 = v4;
      _os_log_impl(&dword_1BE607000, v10, OS_LOG_TYPE_FAULT, "item should be of class CHTextCheckingQueryItem: %@", (uint8_t *)&v30, 0xCu);
    }

  }
  if (v4 == self)
  {
    v28 = 1;
    goto LABEL_13;
  }
  objc_msgSend_strokeIdentifiers(v4, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifiers(self, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v18, (uint64_t)v17, v19, v20, v21);

  if (isEqual)
    v28 = objc_msgSend_textCheckingResultType(v4, v23, v24, v25, v26, v27) == self->_textCheckingResultType;
  else
LABEL_11:
    v28 = 0;
LABEL_13:

  return v28;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5) ^ self->_textCheckingResultType;
}

- (NSArray)replacementStrings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int textCheckingResultType;
  void *v8;
  NSTextCheckingResult *textCheckingResult;
  void *v10;
  void *v11;
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSTextCheckingResult *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  textCheckingResultType = self->_textCheckingResultType;
  v8 = (void *)MEMORY[0x1E0C9AA60];
  if (textCheckingResultType != 1)
  {
    if (textCheckingResultType)
      return (NSArray *)v8;
    textCheckingResult = self->_textCheckingResult;
    if (textCheckingResult)
    {
      objc_msgSend_replacementString(textCheckingResult, a2, v2, v3, v4, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend_alternativeStrings(self->_textCheckingResult, a2, v2, v3, v4, v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend_count(v11, v12, v13, v14, v15, v16);

        objc_msgSend_replacementString(self->_textCheckingResult, v18, v19, v20, v21, v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v63 = v26;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)&v63, 1, v24, v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_alternativeStrings(self->_textCheckingResult, v28, v29, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_arrayByAddingObjectsFromArray_(v27, v34, (uint64_t)v33, v35, v36, v37);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v64[0] = v26;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v23, (uint64_t)v64, 1, v24, v25);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
  }
  v38 = self->_textCheckingResult;
  if (v38)
  {
    if (self->_textCheckingResultGrammarDetailIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_grammarDetails(v38, a2, v2, v3, v4, v5);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (unint64_t)objc_msgSend_count(v39, v40, v41, v42, v43, v44) > self->_textCheckingResultGrammarDetailIndex;

      if (v45)
      {
        objc_msgSend_grammarDetails(self->_textCheckingResult, v46, v47, v48, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v51, v52, self->_textCheckingResultGrammarDetailIndex, v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v56, v57, (uint64_t)CFSTR("NSGrammarCorrections"), v58, v59, v60);
        v61 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v61;
      }
    }
  }
  return (NSArray *)v8;
}

- (_NSRange)replacementRange
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int textCheckingResultType;
  NSUInteger v8;
  NSUInteger v9;
  NSTextCheckingResult *textCheckingResult;
  uint64_t v11;
  NSUInteger v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t textCheckingResultGrammarDetailIndex;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  _NSRange result;

  textCheckingResultType = self->_textCheckingResultType;
  if (textCheckingResultType == 1)
  {
    textCheckingResult = self->_textCheckingResult;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (textCheckingResult && self->_textCheckingResultGrammarDetailIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_grammarDetails(textCheckingResult, a2, v2, v3, v4, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend_count(v13, v14, v15, v16, v17, v18);
      textCheckingResultGrammarDetailIndex = self->_textCheckingResultGrammarDetailIndex;

      if (v19 <= textCheckingResultGrammarDetailIndex)
        goto LABEL_9;
      objc_msgSend_grammarDetails(self->_textCheckingResult, v21, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v26, v27, self->_textCheckingResultGrammarDetailIndex, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKey_(v31, v32, (uint64_t)CFSTR("NSGrammarRange"), v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend_rangeValue(v36, v37, v38, v39, v40, v41);
      v12 = v42;

    }
    else
    {
      v12 = 0;
    }
LABEL_10:
    v8 = v11;
    v9 = v12;
    goto LABEL_11;
  }
  if (textCheckingResultType)
  {
LABEL_9:
    v12 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  v8 = objc_msgSend_range(self->_textCheckingResult, a2, v2, v3, v4, v5);
LABEL_11:
  result.length = v9;
  result.location = v8;
  return result;
}

- (CGPath)estimatedBaseline
{
  return self->_estimatedBaseline;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (int)textCheckingResultType
{
  return self->_textCheckingResultType;
}

- (NSTextCheckingResult)textCheckingResult
{
  return self->_textCheckingResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCheckingResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end
