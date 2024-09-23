@implementation MPCPlayerCommandStatus

- (MPCPlayerCommandStatus)initWithMPStatus:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  MPCPlayerCommandStatus *v9;
  MPCPlayerCommandStatus *v10;
  MPCPlayerCommandDialog *v11;
  void *v12;
  uint64_t v13;
  MPCPlayerCommandDialog *dialog;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlayerCommandStatus;
  v9 = -[MPCPlayerCommandStatus init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a4);
    objc_storeStrong((id *)&v10->_status, a3);
    if (-[MPCPlayerCommandStatus type](v10, "type") == 3)
    {
      v11 = [MPCPlayerCommandDialog alloc];
      -[MPRemoteCommandStatus dialog](v10->_status, "dialog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[MPCPlayerCommandDialog initWithMPDialog:request:](v11, "initWithMPDialog:request:", v12, v8);
      dialog = v10->_dialog;
      v10->_dialog = (MPCPlayerCommandDialog *)v13;

    }
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  -[MPRemoteCommandStatus mediaRemoteType](self->_status, "mediaRemoteType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusCode");
  v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  v5 = -[MPCPlayerCommandStatus type](self, "type");
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p status=%@ unknown>"), objc_opt_class(), self, v4, v16);
      goto LABEL_11;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p status=%@>"), objc_opt_class(), self, v4, v16);
      goto LABEL_11;
    case 2:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = objc_opt_class();
      -[MPCPlayerCommandStatus error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p status=%@ error=%@>"), v12, self, v4, v8);
      goto LABEL_8;
    case 3:
      v13 = (void *)MEMORY[0x24BDD17C8];
      v14 = objc_opt_class();
      -[MPCPlayerCommandStatus dialog](self, "dialog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p status=%@ dialog=%@>"), v14, self, v4, v8);
LABEL_8:
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      if (v5 == 999)
      {
        v6 = (void *)MEMORY[0x24BDD17C8];
        v7 = objc_opt_class();
        -[MPCPlayerCommandStatus customDataType](self, "customDataType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCPlayerCommandStatus customData](self, "customData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p status=%@ customData=%@/%lu bytes"), v7, self, v4, v8, objc_msgSend(v9, "length"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p status=%@ unknown/type=%ld>"), objc_opt_class(), self, v4, -[MPCPlayerCommandStatus type](self, "type"));
LABEL_11:
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v10;
  }
}

- (int64_t)type
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  int64_t v5;

  v2 = -[MPRemoteCommandStatus type](self->_status, "type");
  v3 = 2;
  if (v2 == 999)
    v4 = 999;
  else
    v4 = 0;
  if (v2 != 3)
    v3 = v4;
  v5 = 3;
  if (v2 != 2)
    v5 = 0;
  if (v2 == 1)
    v5 = 1;
  if (v2 <= 2)
    return v5;
  else
    return v3;
}

- (int64_t)statusCode
{
  return -[MPRemoteCommandStatus statusCode](self->_status, "statusCode");
}

- (NSError)error
{
  return (NSError *)-[MPRemoteCommandStatus error](self->_status, "error");
}

- (NSData)customData
{
  return (NSData *)-[MPRemoteCommandStatus customData](self->_status, "customData");
}

- (NSString)customDataType
{
  return (NSString *)-[MPRemoteCommandStatus customDataType](self->_status, "customDataType");
}

- (MPCPlayerCommandRequest)request
{
  return self->_request;
}

- (MPCPlayerCommandDialog)dialog
{
  return self->_dialog;
}

- (MPRemoteCommandStatus)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
