@implementation WFContentItemChangeTransaction

- (WFContentItemChangeTransaction)initWithContentItem:(id)a3
{
  id v6;
  WFContentItemChangeTransaction *v7;
  WFContentItemChangeTransaction *v8;
  NSString *mode;
  WFContentItemChangeTransaction *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContentItemChangeTransaction.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItem"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFContentItemChangeTransaction;
  v7 = -[WFContentItemChangeTransaction init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    mode = v7->_mode;
    v7->_mode = (NSString *)CFSTR("Set");

    objc_storeStrong((id *)&v8->_contentItem, a3);
    v10 = v8;
  }

  return v8;
}

- (void)saveWithCompletionHandler:(id)a3 isNew:(BOOL)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
