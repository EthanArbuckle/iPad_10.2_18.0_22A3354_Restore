@implementation MCMAMFIEncodedQuery

- (MCMAMFIEncodedQuery)initWithLoggingName:(id)a3 encodedQuery:(id)a4
{
  id v7;
  id v8;
  MCMAMFIEncodedQuery *v9;
  MCMAMFIEncodedQuery *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MCMAMFIEncodedQuery;
  v9 = -[MCMAMFIEncodedQuery init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingName, a3);
    objc_storeStrong((id *)&v10->_encodedQuery, a4);
  }

  return v10;
}

- (NSString)loggingName
{
  return self->_loggingName;
}

- (NSData)encodedQuery
{
  return self->_encodedQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedQuery, 0);
  objc_storeStrong((id *)&self->_loggingName, 0);
}

@end
