@implementation MRSendCommandResultStatus

+ (id)successStatus
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MRSendCommandResultStatus_successStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (successStatus_onceToken != -1)
    dispatch_once(&successStatus_onceToken, block);
  return (id)successStatus_successStatus;
}

void __42__MRSendCommandResultStatus_successStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 1, 0, 0, 0, 0, 0);
  v2 = (void *)successStatus_successStatus;
  successStatus_successStatus = v1;

}

+ (id)statusWithCode:(unsigned int)a3
{
  void *v3;

  if (a3)
  {
    v3 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 1, *(_QWORD *)&a3, 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(a1, "successStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)statusWithCode:(unsigned int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 3, v4, 0, 0, 0, v6);

  return v7;
}

+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 2, v4, v6, 0, 0, 0);

  return v7;
}

+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4 error:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 2, v6, v9, 0, 0, v8);

  return v10;
}

+ (id)statusWithCode:(unsigned int)a3 customData:(id)a4 type:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStatusType:statusCode:dialog:customData:customDataType:error:", 999, v6, 0, v9, v8, 0);

  return v10;
}

- (MRSendCommandResultStatus)initWithStatusType:(int64_t)a3 statusCode:(unsigned int)a4 dialog:(id)a5 customData:(id)a6 customDataType:(id)a7 error:(id)a8
{
  id v15;
  id v16;
  id v17;
  MRSendCommandResultStatus *v18;
  MRSendCommandResultStatus *v19;
  id v21;
  objc_super v22;

  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MRSendCommandResultStatus;
  v18 = -[MRSendCommandResultStatus init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_statusType = a3;
    v18->_statusCode = a4;
    objc_storeStrong((id *)&v18->_dialog, a5);
    objc_storeStrong((id *)&v19->_customData, a6);
    objc_storeStrong((id *)&v19->_customDataType, a7);
    objc_storeStrong((id *)&v19->_commandError, a8);
  }

  return v19;
}

- (MRSendCommandResultStatus)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  MRSendCommandResultStatus *v9;
  MRSendCommandHandlerDialog *v10;
  void *v11;
  MRSendCommandHandlerDialog *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "type");
    v7 = objc_msgSend(v5, "statusCode");
    v8 = v7;
    if (v6 != 1 || (_DWORD)v7)
    {
      v19 = v6;
      v10 = [MRSendCommandHandlerDialog alloc];
      objc_msgSend(v5, "dialog");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[MRSendCommandHandlerDialog initWithProtobuf:](v10, "initWithProtobuf:", v11);
      objc_msgSend(v5, "customData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "customDataType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v5, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "mr_initWithProtobuf:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[MRSendCommandResultStatus initWithStatusType:statusCode:dialog:customData:customDataType:error:](self, "initWithStatusType:statusCode:dialog:customData:customDataType:error:", v19, v8, v12, v13, v14, v17);

      v9 = self;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "successStatus");
      v9 = (MRSendCommandResultStatus *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_MRSendCommandResultStatusProtobuf)protobuf
{
  _MRSendCommandResultStatusProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(_MRSendCommandResultStatusProtobuf);
  -[_MRSendCommandResultStatusProtobuf setType:](v3, "setType:", -[MRSendCommandResultStatus statusType](self, "statusType"));
  -[_MRSendCommandResultStatusProtobuf setStatusCode:](v3, "setStatusCode:", -[MRSendCommandResultStatus statusCode](self, "statusCode"));
  -[MRSendCommandResultStatus dialog](self, "dialog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultStatusProtobuf setDialog:](v3, "setDialog:", v5);

  -[MRSendCommandResultStatus customData](self, "customData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultStatusProtobuf setCustomData:](v3, "setCustomData:", v6);

  -[MRSendCommandResultStatus customDataType](self, "customDataType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultStatusProtobuf setCustomDataType:](v3, "setCustomDataType:", v7);

  -[MRSendCommandResultStatus commandError](self, "commandError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mr_protobuf");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultStatusProtobuf setError:](v3, "setError:", v9);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MRSendCommandResultStatus *v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  objc_msgSend((id)objc_opt_class(), "successStatus");
  v4 = (MRSendCommandResultStatus *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    return self;
  v17 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[MRSendCommandResultStatus statusType](self, "statusType");
  v6 = -[MRSendCommandResultStatus statusCode](self, "statusCode");
  -[MRSendCommandResultStatus dialog](self, "dialog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyWithZone:", a3);
  -[MRSendCommandResultStatus customData](self, "customData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copyWithZone:", a3);
  -[MRSendCommandResultStatus customDataType](self, "customDataType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[MRSendCommandResultStatus commandError](self, "commandError");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  v15 = (void *)objc_msgSend(v17, "initWithStatusType:statusCode:dialog:customData:customDataType:error:", v5, v6, v8, v10, v12, v14);

  return v15;
}

- (id)description
{
  __CFString *v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = (__CFString *)MRMediaRemoteCopyCommandHandlerStatusDescription(-[MRSendCommandResultStatus statusCode](self, "statusCode"));
  v4 = -[MRSendCommandResultStatus statusType](self, "statusType");
  switch(v4)
  {
    case 0:
      v5 = CFSTR("StatusTypeUnknown");
      goto LABEL_11;
    case 1:
      v5 = CFSTR("StatusTypeCode");
      goto LABEL_11;
    case 2:
      -[MRSendCommandResultStatus dialog](self, "dialog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("StatusTypeDialog");
      goto LABEL_8;
    case 3:
      -[MRSendCommandResultStatus commandError](self, "commandError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("StatusTypeError");
      goto LABEL_8;
    default:
      if (v4 == 999)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        -[MRSendCommandResultStatus customDataType](self, "customDataType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRSendCommandResultStatus customData](self, "customData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ - %@"), v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = CFSTR("StatusTypeCustom");
LABEL_8:

        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = objc_opt_class();
        if (v9)
        {
          MRCreateIndentedDebugDescriptionFromObject(v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p {\n   code=%@\n   type=%@\n   %@%@}>"), v11, self, v3, v5, v12, CFSTR("\n"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      else
      {
        v5 = 0;
LABEL_11:
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = objc_opt_class();
      }
      objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p {\n   code=%@\n   type=%@\n   %@%@}>"), v11, self, v3, v5, &stru_1E30D5AF8, &stru_1E30D5AF8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      return v13;
  }
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (MRSendCommandHandlerDialog)dialog
{
  return self->_dialog;
}

- (NSError)commandError
{
  return self->_commandError;
}

- (NSData)customData
{
  return self->_customData;
}

- (NSString)customDataType
{
  return self->_customDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDataType, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_commandError, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
}

@end
