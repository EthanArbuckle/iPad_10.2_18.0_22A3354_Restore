@implementation SGMailIntelligenceWarning

- (SGMailIntelligenceWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  SGMailIntelligenceWarning *v18;
  SGMailIntelligenceWarning *v19;
  id v22;
  objc_super v23;

  v22 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SGMailIntelligenceWarning;
  v18 = -[SGMailIntelligenceWarning init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_snippet, a3);
    objc_storeStrong((id *)&v19->_core, a4);
    objc_storeStrong((id *)&v19->_signature, a5);
    objc_storeStrong((id *)&v19->_detectedLanguage, a6);
    v19->_isIncomingMessage = a7;
    objc_storeStrong((id *)&v19->_score, a8);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *snippet;
  id v5;

  snippet = self->_snippet;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", snippet, CFSTR("snippet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_core, CFSTR("core"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detectedLanguage, CFSTR("detectedLanguage"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isIncomingMessage, CFSTR("isIncomingMessage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_score, CFSTR("score"));

}

- (SGMailIntelligenceWarning)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SGMailIntelligenceWarning *v25;
  void *v26;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("snippet"), v3, 1, CFSTR("SGErrorDomain"), 11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D81610];
  v9 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("core"), v3, 1, CFSTR("SGErrorDomain"), 11, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D81610];
  v13 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v13, CFSTR("signature"), v3, 1, CFSTR("SGErrorDomain"), 11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D81610];
  v17 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("detectedLanguage"), v3, 1, CFSTR("SGErrorDomain"), 11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isIncomingMessage"));
  v21 = (void *)MEMORY[0x1E0D81610];
  v22 = objc_opt_class();
  sgMailIntelligenceLogHandle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v22, CFSTR("score"), v3, 1, CFSTR("SGErrorDomain"), 11, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  if (v7 && v11 && v15 && v24 && v19)
  {
    objc_msgSend(v3, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      v25 = 0;
    else
      v25 = -[SGMailIntelligenceWarning initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:]([SGMailIntelligenceWarning alloc], "initWithSnippet:core:signature:detectedLanguage:isIncomingMessage:score:", v7, v11, v15, v19, v20, v24);
  }

  return v25;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGMailIntelligenceWarning triggered on: %@ (with signature %@) score: %@>"), self->_snippet, self->_signature, self->_score);
}

- (id)initFromString:(id)a3 coreRange:(_NSRange)a4 signature:(id)a5 maxWindowSizeAroundCore:(unint64_t)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9
{
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;
  SGMailIntelligenceWarning *v17;
  SGMailIntelligenceWarning *v18;
  uint64_t v19;
  NSString *snippet;
  uint64_t v21;
  NSString *core;
  NSUInteger length;
  objc_super v26;

  length = a4.length;
  location = a4.location;
  v13 = a3;
  v14 = a5;
  v15 = a7;
  v16 = a9;
  v17 = 0;
  if (objc_msgSend(v13, "length") && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v14, "length") && objc_msgSend(v15, "length"))
    {
      v26.receiver = self;
      v26.super_class = (Class)SGMailIntelligenceWarning;
      v18 = -[SGMailIntelligenceWarning init](&v26, sel_init);
      if (v18)
      {
        +[SGMailIntelligenceWarning snippetFromString:coreRange:withMaxWindowSizeAroundCore:](SGMailIntelligenceWarning, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v13, location, length, a6);
        v19 = objc_claimAutoreleasedReturnValue();
        snippet = v18->_snippet;
        v18->_snippet = (NSString *)v19;

        objc_msgSend(v13, "substringWithRange:", location, length);
        v21 = objc_claimAutoreleasedReturnValue();
        core = v18->_core;
        v18->_core = (NSString *)v21;

        objc_storeStrong((id *)&v18->_signature, a5);
        objc_storeStrong((id *)&v18->_detectedLanguage, a7);
        v18->_isIncomingMessage = a8;
        objc_storeStrong((id *)&v18->_score, a9);
      }
      self = v18;
      v17 = self;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (NSString)snippet
{
  return self->_snippet;
}

- (NSString)core
{
  return self->_core;
}

- (NSString)signature
{
  return self->_signature;
}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (BOOL)isIncomingMessage
{
  return self->_isIncomingMessage;
}

- (NSNumber)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_core, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)snippetFromString:(id)a3 coreRange:(_NSRange)a4 withMaxWindowSizeAroundCore:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  int v29;
  void *v30;
  int v31;
  int v32;
  const __CFString *v33;
  uint64_t v35;
  uint64_t v36;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (location <= a5)
    goto LABEL_10;
  if (location - a5 >= location)
  {
LABEL_7:
    v11 = location;
  }
  else
  {
    v10 = -(uint64_t)a5;
    while (1)
    {
      v11 = location + v10;
      if ((objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", location + v10)) & 1) != 0)
        break;
      if (__CFADD__(v10++, 1))
        goto LABEL_7;
    }
  }
  v13 = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", v11);
  if (v13)
  {
    v14 = v13;
    v15 = CFSTR("…");
  }
  else
  {
LABEL_10:
    v14 = 0;
    v15 = &stru_1E4762D08;
  }
  v16 = location + length;
  v17 = v16 + a5;
  if (v17 >= objc_msgSend(v8, "length") - 1)
  {
    v18 = objc_msgSend(v8, "length");
  }
  else
  {
    while (v17 > v16)
    {
      if ((objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v17)) & 1) != 0)
      {
        v16 = v17;
        break;
      }
      --v17;
    }
    v19 = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", v16);
    if (v20 >= 2)
      v18 = v19 + v20;
    else
      v18 = v16;
  }
  v21 = objc_msgSend(v8, "length");
  objc_msgSend(v8, "substringWithRange:", v14, v18 - v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringByTrimmingCharactersInSet:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\s+"), 1, &v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v23, 0, 0, objc_msgSend(v23, "length"), CFSTR(" "));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = &stru_1E4762D08;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v21;
    v28 = v15;
    v29 = objc_msgSend(v27, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", 0));

    if (v29)
      v28 = &stru_1E4762D08;
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", objc_msgSend(v25, "length") - 1));

    if (v18 == v35)
      v32 = 1;
    else
      v32 = v31;
    if (v32)
      v33 = &stru_1E4762D08;
    else
      v33 = CFSTR("…");
    v26 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@%@"), v28, v25, v33);
  }

  return v26;
}

@end
