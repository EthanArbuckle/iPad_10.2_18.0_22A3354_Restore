@implementation MRSendCommandHandlerEvent

+ (id)eventWithCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCommand:options:", v4, v6);

  return v7;
}

- (MRSendCommandHandlerEvent)initWithCommand:(unsigned int)a3 options:(id)a4
{
  id v7;
  MRSendCommandHandlerEvent *v8;
  MRSendCommandHandlerEvent *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRSendCommandHandlerEvent;
  v8 = -[MRSendCommandHandlerEvent init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_command = a3;
    objc_storeStrong((id *)&v8->_options, a4);
  }

  return v9;
}

- (MRSendCommandHandlerEvent)initWithProtobuf:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  MRSendCommandHandlerEvent *v8;

  if (a3)
  {
    v4 = a3;
    v5 = MRMediaRemoteCommandFromProtobuf(objc_msgSend(v4, "command"));
    objc_msgSend(v4, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    MRMediaRemoteCommandOptionsFromProtobuf(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MRSendCommandHandlerEvent initWithCommand:options:](self, "initWithCommand:options:", v5, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)commandDescription
{
  return (NSString *)MRMediaRemoteCopyCommandDescription(-[MRSendCommandHandlerEvent command](self, "command"));
}

- (_MRSendCommandMessageProtobuf)protobuf
{
  _MRSendCommandMessageProtobuf *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRSendCommandMessageProtobuf);
  -[_MRSendCommandMessageProtobuf setCommand:](v3, "setCommand:", MRMediaRemoteCommandToProtobuf(-[MRSendCommandHandlerEvent command](self, "command")));
  -[MRSendCommandHandlerEvent options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRMediaRemoteCommandOptionsToProtobuf(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandMessageProtobuf setOptions:](v3, "setOptions:", v5);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[MRSendCommandHandlerEvent command](self, "command");
  -[MRSendCommandHandlerEvent options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  v9 = (void *)objc_msgSend(v5, "initWithCommand:options:", v6, v8);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRSendCommandHandlerEvent commandDescription](self, "commandDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRSendCommandHandlerEvent options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p {\n   command= %@\n   options= %@\n}>\n"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)command
{
  return self->_command;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
