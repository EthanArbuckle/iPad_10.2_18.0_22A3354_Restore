@implementation MRSendCommandHandlerDialog

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:message:", v7, v6);

  return v8;
}

- (MRSendCommandHandlerDialog)initWithTitle:(id)a3 message:(id)a4
{
  id v7;
  id v8;
  MRSendCommandHandlerDialog *v9;
  MRSendCommandHandlerDialog *v10;
  NSMutableArray *v11;
  NSMutableArray *mutableActions;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRSendCommandHandlerDialog;
  v9 = -[MRSendCommandHandlerDialog init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedTitle, a3);
    objc_storeStrong((id *)&v10->_localizedMessage, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableActions = v10->_mutableActions;
    v10->_mutableActions = v11;

  }
  return v10;
}

- (MRSendCommandHandlerDialog)initWithProtobuf:(id)a3
{
  id v4;
  MRSendCommandHandlerDialog *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedMessage;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *mutableActions;
  MRSendCommandHandlerDialog *v14;
  objc_super v16;

  v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)MRSendCommandHandlerDialog;
    v5 = -[MRSendCommandHandlerDialog init](&v16, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "localizedTitle");
      v6 = objc_claimAutoreleasedReturnValue();
      localizedTitle = v5->_localizedTitle;
      v5->_localizedTitle = (NSString *)v6;

      objc_msgSend(v4, "localizedMessage");
      v8 = objc_claimAutoreleasedReturnValue();
      localizedMessage = v5->_localizedMessage;
      v5->_localizedMessage = (NSString *)v8;

      objc_msgSend(v4, "actions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "msv_map:", &__block_literal_global_41);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "mutableCopy");
      mutableActions = v5->_mutableActions;
      v5->_mutableActions = (NSMutableArray *)v12;

    }
    self = v5;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

MRSendCommandHandlerDialogAction *__47__MRSendCommandHandlerDialog_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRSendCommandHandlerDialogAction *v3;

  v2 = a2;
  v3 = -[MRSendCommandHandlerDialogAction initWithProtobuf:]([MRSendCommandHandlerDialogAction alloc], "initWithProtobuf:", v2);

  return v3;
}

- (_MRSendCommandResultHandlerDialogProtobuf)protobuf
{
  _MRSendCommandResultHandlerDialogProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(_MRSendCommandResultHandlerDialogProtobuf);
  -[MRSendCommandHandlerDialog localizedTitle](self, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedTitle:](v3, "setLocalizedTitle:", v4);

  -[MRSendCommandHandlerDialog localizedMessage](self, "localizedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogProtobuf setLocalizedMessage:](v3, "setLocalizedMessage:", v5);

  -[MRSendCommandHandlerDialog actions](self, "actions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_map:", &__block_literal_global_69);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[_MRSendCommandResultHandlerDialogProtobuf setActions:](v3, "setActions:", v8);

  return v3;
}

uint64_t __38__MRSendCommandHandlerDialog_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (void)addAction:(id)a3
{
  -[NSMutableArray addObject:](self->_mutableActions, "addObject:", a3);
}

- (NSArray)actions
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableActions, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MRSendCommandHandlerDialog localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[MRSendCommandHandlerDialog localizedMessage](self, "localizedMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  v10 = (_QWORD *)objc_msgSend(v5, "initWithTitle:message:", v7, v9);

  v11 = -[NSMutableArray copyWithZone:](self->_mutableActions, "copyWithZone:", a3);
  v12 = (void *)v10[1];
  v10[1] = v11;

  return v10;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRSendCommandHandlerDialog localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRSendCommandHandlerDialog localizedMessage](self, "localizedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRSendCommandHandlerDialog actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p {\n   title= %@\n   message= %@\n   actions= %@\n}>\n"), v4, self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void)setLocalizedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_mutableActions, 0);
}

@end
