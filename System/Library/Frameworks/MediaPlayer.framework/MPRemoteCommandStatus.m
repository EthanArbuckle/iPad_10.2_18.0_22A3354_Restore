@implementation MPRemoteCommandStatus

- (MPRemoteCommandStatus)initWithMediaRemoteType:(id)a3
{
  id v5;
  MPRemoteCommandStatus *v6;
  MPRemoteCommandStatus *v7;
  MPRemoteCommandHandlerDialog *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MPRemoteCommandHandlerDialog *dialog;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MPRemoteCommandStatus;
  v6 = -[MPRemoteCommandStatus init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaRemoteType, a3);
    if (-[MPRemoteCommandStatus type](v7, "type") == 2)
    {
      v8 = [MPRemoteCommandHandlerDialog alloc];
      -[MPRemoteCommandStatus mediaRemoteType](v7, "mediaRemoteType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dialog");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[MPRemoteCommandHandlerDialog initWithMediaRemoteType:](v8, "initWithMediaRemoteType:", v10);
      dialog = v7->_dialog;
      v7->_dialog = (MPRemoteCommandHandlerDialog *)v11;

    }
  }

  return v7;
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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusCode");
  v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  v5 = -[MPRemoteCommandStatus type](self, "type");
  switch(v5)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p status=%@ unknown>"), objc_opt_class(), self, v4, v16);
      goto LABEL_11;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p status=%@>"), objc_opt_class(), self, v4, v16);
      goto LABEL_11;
    case 2:
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      -[MPRemoteCommandStatus dialog](self, "dialog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p status=%@ dialog=%@>"), v11, self, v4, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_opt_class();
      -[MPRemoteCommandStatus error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p status=%@ error=%@>"), v14, self, v4, v9, v17);
      goto LABEL_8;
    default:
      if (v5 == 999)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = objc_opt_class();
        -[MPRemoteCommandStatus customDataType](self, "customDataType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPRemoteCommandStatus customData](self, "customData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p status=%@ customData=%@/%lu bytes"), v7, self, v4, v8, objc_msgSend(v9, "length"));
LABEL_8:
        v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p status=%@ unknown/type=%ld>"), objc_opt_class(), self, v4, -[MPRemoteCommandStatus type](self, "type"));
LABEL_11:
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithZone:", a3);

  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMediaRemoteType:", v5);
  return v6;
}

- (int64_t)statusCode
{
  void *v2;
  int64_t v3;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MPRemoteCommandHandlerStatusFromMRMediaRemoteCommandHandlerStatus(objc_msgSend(v2, "statusCode"));

  return v3;
}

- (int64_t)type
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusType");
  if (v3 == 999)
    v4 = 999;
  else
    v4 = 0;
  if (v3 == 3)
    v4 = 3;
  if (v3 == 2)
    v5 = 2;
  else
    v5 = 0;
  if (v3 == 1)
    v5 = 1;
  if (v3 <= 2)
    v6 = v5;
  else
    v6 = v4;

  return v6;
}

- (MPRemoteCommandHandlerDialog)dialog
{
  return self->_dialog;
}

- (NSError)error
{
  void *v2;
  void *v3;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v3;
}

- (NSData)customData
{
  void *v2;
  void *v3;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)customDataType
{
  void *v2;
  void *v3;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customDataType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)analyticSignature
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;

  -[MPRemoteCommandStatus mediaRemoteType](self, "mediaRemoteType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusCode");
  v4 = (void *)MRMediaRemoteCopyCommandHandlerStatusDescription();

  v5 = -[MPRemoteCommandStatus type](self, "type");
  if (v5 > 2)
  {
    if (v5 == 3)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = -[MPRemoteCommandStatus statusCode](self, "statusCode");
      -[MPRemoteCommandStatus error](self, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "msv_analyticSignature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("error-%lld|%@|%@"), v11, v4, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v5 != 999)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld|%@"), -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4);
        goto LABEL_10;
      }
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = -[MPRemoteCommandStatus statusCode](self, "statusCode");
      -[MPRemoteCommandStatus customDataType](self, "customDataType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("custom-%lld|%@|%@"), v7, v4, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("code-%lld|%@"), -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4);
    goto LABEL_10;
  }
  if (v5 != 2)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dialog-%lld|%@"), -[MPRemoteCommandStatus statusCode](self, "statusCode"), v4);
LABEL_10:
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v9;
}

- (MRSendCommandResultStatus)mediaRemoteType
{
  return self->_mediaRemoteType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_mediaRemoteType, 0);
}

+ (MPRemoteCommandStatus)successStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MPRemoteCommandStatus_successStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (successStatus_onceToken != -1)
    dispatch_once(&successStatus_onceToken, block);
  return (MPRemoteCommandStatus *)(id)successStatus___success;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D4C630], "statusWithCode:", MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v4);

  return (MPRemoteCommandStatus *)v5;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D4C630], "statusWithCode:error:", MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v7);
  return (MPRemoteCommandStatus *)v8;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3);
  v8 = (void *)MEMORY[0x1E0D4C630];
  objc_msgSend(v6, "mediaRemoteType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "statusWithCode:dialog:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v10);
  return (MPRemoteCommandStatus *)v11;
}

+ (MPRemoteCommandStatus)statusWithCode:(int64_t)a3 dialog:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3);
  v11 = (void *)MEMORY[0x1E0D4C630];
  objc_msgSend(v9, "mediaRemoteType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "statusWithCode:dialog:error:", v10, v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v13);
  return (MPRemoteCommandStatus *)v14;
}

+ (id)statusWithCode:(int64_t)a3 customData:(id)a4 type:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D4C630], "statusWithCode:customData:type:", MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus(a3), v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMediaRemoteType:", v10);
  return v11;
}

void __38__MPRemoteCommandStatus_successStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusWithCode:", 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)successStatus___success;
  successStatus___success = v1;

}

@end
