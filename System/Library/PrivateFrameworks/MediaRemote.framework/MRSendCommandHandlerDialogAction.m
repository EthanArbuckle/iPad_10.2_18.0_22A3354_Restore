@implementation MRSendCommandHandlerDialogAction

+ (id)actionWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:type:commandEvent:", v9, a4, v8);

  return v10;
}

- (MRSendCommandHandlerDialogAction)initWithTitle:(id)a3 type:(int64_t)a4 commandEvent:(id)a5
{
  id v9;
  id v10;
  MRSendCommandHandlerDialogAction *v11;
  MRSendCommandHandlerDialogAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRSendCommandHandlerDialogAction;
  v11 = -[MRSendCommandHandlerDialogAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_event, a5);
  }

  return v12;
}

- (MRSendCommandHandlerDialogAction)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  MRSendCommandHandlerEvent *v7;
  void *v8;
  MRSendCommandHandlerEvent *v9;
  MRSendCommandHandlerDialogAction *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v4, "type");
    v7 = [MRSendCommandHandlerEvent alloc];
    objc_msgSend(v4, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[MRSendCommandHandlerEvent initWithProtobuf:](v7, "initWithProtobuf:", v8);
    self = -[MRSendCommandHandlerDialogAction initWithTitle:type:commandEvent:](self, "initWithTitle:type:commandEvent:", v5, v6, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_MRSendCommandResultHandlerDialogActionProtobuf)protobuf
{
  _MRSendCommandResultHandlerDialogActionProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(_MRSendCommandResultHandlerDialogActionProtobuf);
  -[MRSendCommandHandlerDialogAction title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogActionProtobuf setTitle:](v3, "setTitle:", v4);

  -[_MRSendCommandResultHandlerDialogActionProtobuf setType:](v3, "setType:", -[MRSendCommandHandlerDialogAction type](self, "type"));
  -[MRSendCommandHandlerDialogAction event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogActionProtobuf setEvent:](v3, "setEvent:", v6);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MRSendCommandHandlerDialogAction title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  v8 = -[MRSendCommandHandlerDialogAction type](self, "type");
  -[MRSendCommandHandlerDialogAction event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  v11 = (void *)objc_msgSend(v5, "initWithTitle:type:commandEvent:", v7, v8, v10);

  return v11;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[MRSendCommandHandlerDialogAction type](self, "type");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_1E30C9988[v3];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[MRSendCommandHandlerDialogAction title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRSendCommandHandlerDialogAction event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ : %p {\n   title= %@\n   type= %@\n   event= %@\n}>\n"), v6, self, v7, v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (MRSendCommandHandlerEvent)event
{
  return self->_event;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
