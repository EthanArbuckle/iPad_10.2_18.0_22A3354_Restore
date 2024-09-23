@implementation CPLTestFeedbackMessage

- (CPLTestFeedbackMessage)initWithTestMessage:(id)a3 libraryIdentifier:(id)a4
{
  id v6;
  CPLTestFeedbackMessage *v7;
  uint64_t v8;
  NSString *testMessage;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLTestFeedbackMessage;
  v7 = -[CPLFeedbackMessage initWithLibraryIdentifier:](&v11, sel_initWithLibraryIdentifier_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    testMessage = v7->_testMessage;
    v7->_testMessage = (NSString *)v8;

  }
  return v7;
}

- (id)serverMessage
{
  void *v3;
  CPLServerFeedbackKeyAndValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLTestFeedbackMessage;
  -[CPLFeedbackMessage serverMessage](&v6, sel_serverMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  -[CPLServerFeedbackKeyAndValue setKey:](v4, "setKey:", CFSTR("message"));
  -[CPLServerFeedbackKeyAndValue setValue:](v4, "setValue:", self->_testMessage);
  objc_msgSend(v3, "addKeysAndValues:", v4);

  return v3;
}

- (NSString)testMessage
{
  return self->_testMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testMessage, 0);
}

+ (id)feedbackType
{
  return CFSTR("test");
}

@end
