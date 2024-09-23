@implementation MSParsecSearchSessionSuggestion

+ (id)suggestionWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:category:option:resultDetails:", v10, v11, a5, v12);

  return v13;
}

- (MSParsecSearchSessionSuggestion)initWithIdentifier:(id)a3 category:(id)a4 option:(int64_t)a5 resultDetails:(id)a6
{
  id v11;
  id v12;
  id v13;
  MSParsecSearchSessionSuggestion *v14;
  MSParsecSearchSessionSuggestion *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSParsecSearchSessionSuggestion;
  v14 = -[MSParsecSearchSessionSuggestion init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resultID, a3);
    objc_storeStrong((id *)&v15->_category, a4);
    v15->_option = a5;
    objc_storeStrong((id *)&v15->_resultDetails, a6);
  }

  return v15;
}

- (id)feedbackResult
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D8C6A8]);
  objc_msgSend(v3, "setIdentifier:", self->_resultID);
  objc_msgSend(v3, "setSectionBundleIdentifier:", self->_category);
  -[MSParsecSearchSessionSuggestion _suggestionBundleID](self, "_suggestionBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultBundleId:", v4);

  objc_msgSend(v3, "setType:", 2);
  objc_msgSend(v3, "setMailResultDetails:", self->_resultDetails);
  return v3;
}

- (id)_suggestionBundleID
{
  int64_t v2;
  const __CFString *v3;

  v2 = -[MSParsecSearchSessionSuggestion option](self, "option");
  v3 = CFSTR("com.apple.mail.search.suggestion");
  if (v2 == 1)
    v3 = CFSTR("com.apple.mail.search.suggestion.vip");
  if (v2 == 2)
    return CFSTR("com.apple.mail.search.suggestion.usertyped");
  else
    return (id)v3;
}

- (NSString)resultID
{
  return self->_resultID;
}

- (int64_t)option
{
  return self->_option;
}

- (SFMailResultDetails)resultDetails
{
  return self->_resultDetails;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_resultDetails, 0);
  objc_storeStrong((id *)&self->_resultID, 0);
}

@end
