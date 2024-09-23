@implementation CHClientDataSource

- (CHClientDataSource)initWithStrokeProvider:(id)a3
{
  return (CHClientDataSource *)((uint64_t (*)(CHClientDataSource *, char *, id, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_initWithStrokeProvider_calculateDocumentProvider_, a3, 0);
}

- (CHClientDataSource)initWithStrokeProvider:(id)a3 calculateDocumentProvider:(id)a4
{
  id v7;
  id v8;
  CHClientDataSource *v9;
  CHClientDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHClientDataSource;
  v9 = -[CHClientDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeProviderSnapshot, a3);
    objc_storeStrong((id *)&v10->_calculateDocumentProviderSnapshot, a4);
  }

  return v10;
}

- (CHClientStrokeProvider)strokeProviderSnapshot
{
  return self->_strokeProviderSnapshot;
}

- (CHClientCalculateDocumentProvider)calculateDocumentProviderSnapshot
{
  return self->_calculateDocumentProviderSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calculateDocumentProviderSnapshot, 0);
  objc_storeStrong((id *)&self->_strokeProviderSnapshot, 0);
}

@end
