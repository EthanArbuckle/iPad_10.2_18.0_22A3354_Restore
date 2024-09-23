@implementation CPLFeedbackMessage

- (CPLFeedbackMessage)initWithLibraryIdentifier:(id)a3
{
  id v4;
  CPLFeedbackMessage *v5;
  uint64_t v6;
  NSString *libraryIdentifier;
  uint64_t v8;
  NSString *feedbackType;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLFeedbackMessage;
  v5 = -[CPLFeedbackMessage init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    libraryIdentifier = v5->_libraryIdentifier;
    v5->_libraryIdentifier = (NSString *)v6;

    objc_msgSend((id)objc_opt_class(), "feedbackType");
    v8 = objc_claimAutoreleasedReturnValue();
    feedbackType = v5->_feedbackType;
    v5->_feedbackType = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

  }
  return v5;
}

- (NSString)libraryIdentifierDescription
{
  _BOOL4 v3;
  NSString *libraryIdentifier;
  void *v5;
  void *v6;

  v3 = -[NSString hasSuffix:](self->_libraryIdentifier, "hasSuffix:", CFSTR("Library"));
  libraryIdentifier = self->_libraryIdentifier;
  if (v3)
  {
    -[NSString substringToIndex:](libraryIdentifier, "substringToIndex:", -[NSString length](libraryIdentifier, "length") - 7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSString lowercaseString](libraryIdentifier, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v6;
}

- (CPLServerFeedbackMessage)serverMessage
{
  CPLServerFeedbackMessage *v3;
  CPLServerFeedbackKeyAndValue *v4;
  CPLServerFeedbackKeyAndValue *v5;
  void *v6;
  CPLServerFeedbackKeyAndValue *v7;
  void *v8;

  v3 = objc_alloc_init(CPLServerFeedbackMessage);
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v4, "setKey:", CFSTR("type"));
  -[CPLServerFeedbackKeyAndValue setValue:](v4, "setValue:", self->_feedbackType);
  -[CPLServerFeedbackMessage addKeysAndValues:](v3, "addKeysAndValues:", v4);
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  if (serverMessage_onceToken != -1)
    dispatch_once(&serverMessage_onceToken, &__block_literal_global_3);
  -[CPLServerFeedbackKeyAndValue setKey:](v5, "setKey:", CFSTR("date"));
  objc_msgSend((id)serverMessage_formatter, "stringFromDate:", self->_creationDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLServerFeedbackKeyAndValue setValue:](v5, "setValue:", v6);

  -[CPLServerFeedbackMessage addKeysAndValues:](v3, "addKeysAndValues:", v5);
  if (!-[NSString isEqualToString:](self->_libraryIdentifier, "isEqualToString:", CFSTR("SystemLibrary")))
  {
    v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
    -[CPLServerFeedbackKeyAndValue setKey:](v7, "setKey:", CFSTR("library"));
    -[CPLFeedbackMessage libraryIdentifierDescription](self, "libraryIdentifierDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLServerFeedbackKeyAndValue setValue:](v7, "setValue:", v8);

    -[CPLServerFeedbackMessage addKeysAndValues:](v3, "addKeysAndValues:", v7);
  }

  return v3;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (NSString)feedbackType
{
  return self->_feedbackType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackType, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

void __35__CPLFeedbackMessage_serverMessage__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)serverMessage_formatter;
  serverMessage_formatter = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serverMessage_formatter, "setLocale:", v2);
  objc_msgSend((id)serverMessage_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));

}

+ (id)feedbackType
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Feedback/CPLFeedbackMessage.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v5, 67, CFSTR("%@ should be overriden"), v6);

  abort();
}

@end
