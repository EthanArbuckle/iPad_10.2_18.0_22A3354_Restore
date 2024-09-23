@implementation DKDiagnosticAllowList

- (DKDiagnosticAllowList)initWithIdentifiers:(id)a3 contactMessage:(id)a4
{
  id v6;
  id v7;
  DKDiagnosticAllowList *v8;
  uint64_t v9;
  NSString *contactMessage;
  uint64_t v11;
  NSArray *allowList;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DKDiagnosticAllowList;
  v8 = -[DKDiagnosticAllowList init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    contactMessage = v8->_contactMessage;
    v8->_contactMessage = (NSString *)v9;

    v11 = objc_msgSend(v6, "copy");
    allowList = v8->_allowList;
    v8->_allowList = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[DKDiagnosticAllowList allowList](self, "allowList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (NSString)contactMessage
{
  return self->_contactMessage;
}

- (NSArray)allowList
{
  return self->_allowList;
}

- (void)setAllowList:(id)a3
{
  objc_storeStrong((id *)&self->_allowList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowList, 0);
  objc_storeStrong((id *)&self->_contactMessage, 0);
}

@end
