@implementation _AXMSemanticTextCursor

- (_AXMSemanticTextCursor)initWithText:(id)a3 semanticText:(id)a4
{
  id v6;
  id v7;
  _AXMSemanticTextCursor *v8;
  _AXMSemanticTextCursor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_AXMSemanticTextCursor;
  v8 = -[_AXMSemanticTextCursor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_text, v6);
    objc_storeWeak((id *)&v9->_semanticText, v7);
    v9->_currentIndex = 0;
    v9->_length = objc_msgSend(v6, "length");
  }

  return v9;
}

- (_NSRange)remainingRange
{
  NSUInteger v3;
  NSUInteger currentIndex;
  _NSRange result;

  if (-[_AXMSemanticTextCursor isFinished](self, "isFinished"))
  {
    v3 = 0;
    currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    currentIndex = self->_currentIndex;
    v3 = self->_length - currentIndex;
  }
  result.length = v3;
  result.location = currentIndex;
  return result;
}

- (BOOL)isFinished
{
  return self->_currentIndex >= self->_length;
}

- (void)advance
{
  ++self->_currentIndex;
}

- (BOOL)processAttribute:(id)a3 getSubstring:(id *)a4 advanceCursor:(BOOL)a5 markAsSemanticError:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id WeakRetained;
  unint64_t currentIndex;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  int v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];

  v8 = a6;
  v9 = a5;
  v43[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v40 = 0;
  v41 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_text);
  currentIndex = self->_currentIndex;
  v15 = -[_AXMSemanticTextCursor remainingRange](self, "remainingRange");
  objc_msgSend(WeakRetained, "attribute:atIndex:longestEffectiveRange:inRange:", v12, currentIndex, &v40, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB28A8];
    v42 = *MEMORY[0x1E0CB2D60];
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_AXMSemanticTextCursor remainingRange](self, "remainingRange"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[_AXMSemanticTextCursor remainingRange](self, "remainingRange");
    objc_msgSend(v26, "numberWithUnsignedInteger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to advance cursor. No value for attribute: %@. remaining:[%@ %@]"), v12, v25, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (a4)
  {
    v18 = objc_loadWeakRetained((id *)&self->_text);
    objc_msgSend(v18, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "substringWithRange:", v40, v41);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "isEqual:", CFSTR("DD:Address")))
    {
      v20 = objc_loadWeakRetained((id *)&self->_semanticText);
      objc_msgSend(v20, "locale");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isEqual:", CFSTR("en_US")))
      {

LABEL_8:
        +[AXMAddressFormatter replaceDirectionalAbbreviations:](AXMAddressFormatter, "replaceDirectionalAbbreviations:", a4);
        goto LABEL_9;
      }
      v37 = objc_loadWeakRetained((id *)&self->_semanticText);
      objc_msgSend(v37, "locale");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localeIdentifier");
      v38 = v20;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v33, "isEqual:", CFSTR("en_CA"));

      if (v36)
        goto LABEL_8;
    }
  }
LABEL_9:
  if (v8)
  {
    v34 = objc_loadWeakRetained((id *)&self->_semanticText);
    objc_msgSend(v34, "addSemanticErrorWithRange:", v40, v41);

  }
  v31 = 0;
  if (v9)
    self->_currentIndex += v41;
LABEL_13:
  if (a7)
    *a7 = objc_retainAutorelease(v31);

  return v31 == 0;
}

- (void)markCurrentIndexAsSemanticErrorAndAdvanceCursor
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_semanticText);
  objc_msgSend(WeakRetained, "addSemanticErrorWithRange:", self->_currentIndex, 1);

  -[_AXMSemanticTextCursor advance](self, "advance");
}

- (NSDictionary)currentAttributes
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_text);
  objc_msgSend(WeakRetained, "attributesAtIndex:effectiveRange:", self->_currentIndex, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (BOOL)isOtherWord
{
  void *v2;
  __CFString *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NLPToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("NLP:OtherWord");

  return v4;
}

- (BOOL)isProperNoun
{
  void *v2;
  __CFString *v3;
  BOOL v6;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NLPToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = v3 == CFSTR("NLP:PlaceName") || v3 == CFSTR("NLP:PersonalName") || v3 == CFSTR("NLP:OrganizationName");
  return v6;
}

- (BOOL)isWhitespace
{
  void *v2;
  __CFString *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NLPToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("NLP:Whitespace");

  return v4;
}

- (BOOL)isPunctuation
{
  void *v2;
  __CFString *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NLPToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("NLP:Punctuation");

  return v4;
}

- (BOOL)isSentenceTerminator
{
  void *v2;
  __CFString *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NLPToken"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == CFSTR("NLP:SentenceTerminator");

  return v4;
}

- (BOOL)isInLexicon
{
  void *v2;
  void *v3;
  char v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("IsInLexicon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isCustomPattern
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CustomPattern"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isDataDetector
{
  void *v2;
  void *v3;
  BOOL v4;

  -[_AXMSemanticTextCursor currentAttributes](self, "currentAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DataDetector"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_semanticText);
  objc_destroyWeak((id *)&self->_text);
}

@end
