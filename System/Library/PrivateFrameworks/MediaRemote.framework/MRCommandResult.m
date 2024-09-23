@implementation MRCommandResult

+ (id)commandResultWithSendError:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithHandlerStatuses:sendError:", 0, *(_QWORD *)&a3);
}

+ (id)commandResultWithSendError:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWithSendError:description:", v4, v6);

  return v7;
}

- (MRCommandResult)initWithWithSendError:(unsigned int)a3 description:(id)a4
{
  uint64_t v4;
  id v6;
  MRCommandResult *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[MRCommandResult initWithHandlerStatuses:sendError:](self, "initWithHandlerStatuses:sendError:", 0, v4);
  -[MRCommandResult setSendErrorDescription:](v7, "setSendErrorDescription:", v6);

  return v7;
}

- (MRCommandResult)initWithHandlerStatuses:(id)a3 sendError:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  MRCommandResult *v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(a3, "msv_map:", &__block_literal_global_61);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRCommandResult initWithResultStatuses:sendError:playerPath:](self, "initWithResultStatuses:sendError:playerPath:", v6, v4, 0);

  return v7;
}

MRSendCommandResultStatus *__53__MRCommandResult_initWithHandlerStatuses_sendError___block_invoke(uint64_t a1, void *a2)
{
  return +[MRSendCommandResultStatus statusWithCode:error:](MRSendCommandResultStatus, "statusWithCode:error:", objc_msgSend(a2, "unsignedIntValue"), 0);
}

- (MRCommandResult)initWithResultStatuses:(id)a3 sendError:(unsigned int)a4 playerPath:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  MRCommandResult *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRCommandResult;
  v10 = -[MRCommandResult init](&v14, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    -[MRCommandResult setResultStatuses:](v10, "setResultStatuses:", v11);

    -[MRCommandResult setSendError:](v10, "setSendError:", v6);
    v12 = (void *)objc_msgSend(v9, "copy");
    -[MRCommandResult setPlayerPath:](v10, "setPlayerPath:", v12);

  }
  return v10;
}

- (MRCommandResult)initWithData:(id)a3
{
  id v4;
  _MRSendCommandResultProtobuf *v5;
  MRCommandResult *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRSendCommandResultProtobuf initWithData:]([_MRSendCommandResultProtobuf alloc], "initWithData:", v4);

    self = -[MRCommandResult initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRCommandResult)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MRPlayerPath *v8;
  void *v9;
  MRPlayerPath *v10;
  MRCommandResult *v11;
  void *v12;
  MRCommandResult *v13;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "statuses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "msv_map:", &__block_literal_global_3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "sendError");
    v8 = [MRPlayerPath alloc];
    objc_msgSend(v4, "playerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MRPlayerPath initWithProtobuf:](v8, "initWithProtobuf:", v9);
    v11 = -[MRCommandResult initWithResultStatuses:sendError:playerPath:](self, "initWithResultStatuses:sendError:playerPath:", v6, v7, v10);

    objc_msgSend(v4, "sendErrorDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[MRCommandResult setSendErrorDescription:](v11, "setSendErrorDescription:", v12);
    self = v11;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

MRSendCommandResultStatus *__36__MRCommandResult_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRSendCommandResultStatus *v3;

  v2 = a2;
  v3 = -[MRSendCommandResultStatus initWithProtobuf:]([MRSendCommandResultStatus alloc], "initWithProtobuf:", v2);

  return v3;
}

- (MRCommandResult)initWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  MRCommandResult *v7;

  v4 = a3;
  if (objc_msgSend(v4, "mr_isMediaRemoteError") && (objc_msgSend(v4, "isInformational") & 1) == 0)
  {
    v6 = MRMediaRemoteSendErrorFromError(v4, 0);
    objc_msgSend(v4, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  v7 = -[MRCommandResult initWithWithSendError:description:](self, "initWithWithSendError:description:", v6, v5);

  return v7;
}

- (id)copyWithPlayerPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[MRCommandResult copy](self, "copy");
  objc_msgSend(v5, "setPlayerPath:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[MRCommandResult resultStatuses](self, "resultStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setResultStatuses:", v7);

  objc_msgSend(v5, "setSendError:", -[MRCommandResult sendError](self, "sendError"));
  -[MRCommandResult error](self, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setError:", v9);

  -[MRCommandResult sendErrorDescription](self, "sendErrorDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setSendErrorDescription:", v11);

  -[MRCommandResult playerPath](self, "playerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setPlayerPath:", v13);

  objc_msgSend(v5, "setStartQOS:", -[MRCommandResult startQOS](self, "startQOS"));
  objc_msgSend(v5, "setEndQOS:", -[MRCommandResult endQOS](self, "endQOS"));
  return v5;
}

- (id)protobuf
{
  _MRSendCommandResultProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(_MRSendCommandResultProtobuf);
  -[_MRSendCommandResultProtobuf setSendError:](v3, "setSendError:", -[MRCommandResult sendError](self, "sendError"));
  -[MRCommandResult playerPath](self, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultProtobuf setPlayerPath:](v3, "setPlayerPath:", v5);

  -[MRCommandResult resultStatuses](self, "resultStatuses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_map:", &__block_literal_global_6_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[_MRSendCommandResultProtobuf setStatuses:](v3, "setStatuses:", v8);

  -[MRCommandResult sendErrorDescription](self, "sendErrorDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultProtobuf setSendErrorDescription:](v3, "setSendErrorDescription:", v9);

  return v3;
}

uint64_t __27__MRCommandResult_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (id)data
{
  void *v2;
  void *v3;

  -[MRCommandResult protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)resultStatuses
{
  if (self->_resultStatuses)
    return self->_resultStatuses;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)handlerReturnStatuses
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[MRCommandResult resultStatuses](self, "resultStatuses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_7_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

uint64_t __40__MRCommandResult_handlerReturnStatuses__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a2, "statusCode"));
}

- (NSString)sendErrorDescription
{
  NSString **p_sendErrorDescription;
  NSError *error;
  void *v6;
  int v7;
  NSError *v8;
  id obj;

  p_sendErrorDescription = &self->_sendErrorDescription;
  if (!self->_sendErrorDescription)
  {
    error = self->_error;
    if (error)
    {
      -[NSError domain](error, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("kMRMediaRemoteFrameworkErrorDomain"));

      if (v7)
      {
        v8 = self->_error;
        obj = 0;
        MRMediaRemoteSendErrorFromError(v8, &obj);
        objc_storeStrong((id *)p_sendErrorDescription, obj);
      }
    }
  }
  return *p_sendErrorDescription;
}

- (id)description
{
  id v3;
  uint64_t v4;
  MRPlayerPath *playerPath;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  playerPath = self->_playerPath;
  -[MRCommandResult error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ : %p playerPath=%@, error=%@>"), v4, self, playerPath, v6);

  return v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t startQOS;
  uint64_t endQOS;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v14 = objc_opt_class();
  -[MRCommandResult playerPath](self, "playerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRCommandResult error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromObject(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  startQOS = self->_startQOS;
  endQOS = self->_endQOS;
  MRMediaRemoteSendCommandErrorDescription(-[MRCommandResult sendError](self, "sendError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRCommandResult sendErrorDescription](self, "sendErrorDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRCommandResult resultStatuses](self, "resultStatuses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MRCreateIndentedDebugDescriptionFromArray(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<%@ : %p {\n   playerPath = %@\n   effectiveError = %@\n   qos = %d -> %d\n   sendError = %@ (%@)\n   %@\n}>\n"), v14, self, v3, v5, startQOS, endQOS, v8, v9, v11);

  return v12;
}

- (NSError)error
{
  NSError *v3;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v3 = self->_error;
  if (!v3)
  {
    MRMediaRemoteErrorFromCommandStatuses(-[MRCommandResult sendError](self, "sendError"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_6;
    v3 = (NSError *)v5;
    -[MRCommandResult sendErrorDescription](self, "sendErrorDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v8 = -[NSError code](v3, "code");
      -[MRCommandResult sendErrorDescription](self, "sendErrorDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "initWithMRError:description:", v8, v9);

      v3 = (NSError *)v10;
      if (!v10)
      {
LABEL_6:
        -[MRCommandResult resultStatuses](self, "resultStatuses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "msv_firstWhere:", &__block_literal_global_15_1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "commandError");
        v3 = (NSError *)objc_claimAutoreleasedReturnValue();

        if (!v3)
        {
          v13 = -[MRCommandResult sendError](self, "sendError");
          -[MRCommandResult handlerReturnStatuses](self, "handlerReturnStatuses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          MRMediaRemoteErrorFromCommandStatuses(v13, v14);
          v3 = (NSError *)objc_claimAutoreleasedReturnValue();

          if (!v3)
          {
            -[MRCommandResult resultStatuses](self, "resultStatuses");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "count");

            if (v16)
              v3 = 0;
            else
              v3 = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 44);
          }
        }
      }
    }
  }
  return v3;
}

BOOL __24__MRCommandResult_error__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "commandError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setResultStatuses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)sendError
{
  return self->_sendError;
}

- (void)setSendError:(unsigned int)a3
{
  self->_sendError = a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setSendErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_sendErrorDescription, a3);
}

- (unsigned)startQOS
{
  return self->_startQOS;
}

- (void)setStartQOS:(unsigned int)a3
{
  self->_startQOS = a3;
}

- (unsigned)endQOS
{
  return self->_endQOS;
}

- (void)setEndQOS:(unsigned int)a3
{
  self->_endQOS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendErrorDescription, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_resultStatuses, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
