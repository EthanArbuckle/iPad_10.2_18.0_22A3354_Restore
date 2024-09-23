@implementation MPCAssistantSendCommandResult

- (MPCAssistantSendCommandResult)initWithReturnStatuses:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  MPCAssistantSendCommandResult *v8;
  uint64_t v9;
  NSArray *returnStatuses;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCAssistantSendCommandResult;
  v8 = -[MPCAssistantSendCommandResult init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    returnStatuses = v8->_returnStatuses;
    v8->_returnStatuses = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

- (MPCAssistantSendCommandResult)initWithCommandResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  MPCAssistantSendCommandResult *v8;
  void *v9;
  uint64_t v10;
  NSArray *returnStatuses;
  uint64_t v12;
  MRCommandResult *commandResult;
  NSError *v14;
  void *error;
  void *v16;
  uint64_t v17;
  NSArray *v18;
  void *v20;
  uint64_t v21;
  NSError *v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MPCAssistantSendCommandResult;
  v8 = -[MPCAssistantSendCommandResult init](&v23, sel_init);
  if (!v8)
    goto LABEL_11;
  objc_msgSend(v6, "handlerReturnStatuses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  returnStatuses = v8->_returnStatuses;
  v8->_returnStatuses = (NSArray *)v10;

  v12 = objc_msgSend(v6, "copy");
  commandResult = v8->_commandResult;
  v8->_commandResult = (MRCommandResult *)v12;

  if (v7)
  {
    v14 = (NSError *)v7;
LABEL_6:
    error = v8->_error;
    v8->_error = v14;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "sendError"))
  {
    MPCAssistantCreateSendCommandError(objc_msgSend(v6, "sendError"));
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v6, "error");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_8;
  objc_msgSend(v6, "error");
  error = (void *)objc_claimAutoreleasedReturnValue();
  MPCAssistantWrapError(error);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v8->_error;
  v8->_error = (NSError *)v21;

LABEL_7:
LABEL_8:
  -[NSArray msv_firstWhere:](v8->_returnStatuses, "msv_firstWhere:", &__block_literal_global_17205);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8->_error && !v16)
  {
    -[NSArray arrayByAddingObject:](v8->_returnStatuses, "arrayByAddingObject:", &unk_24CB16C68);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v8->_returnStatuses;
    v8->_returnStatuses = (NSArray *)v17;

  }
LABEL_11:

  return v8;
}

- (NSArray)returnStatuses
{
  return self->_returnStatuses;
}

- (NSError)error
{
  return self->_error;
}

- (MRCommandResult)commandResult
{
  return self->_commandResult;
}

- (NSNumber)devicesControlled
{
  return self->_devicesControlled;
}

- (void)setDevicesControlled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesControlled, 0);
  objc_storeStrong((id *)&self->_commandResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_returnStatuses, 0);
}

BOOL __61__MPCAssistantSendCommandResult_initWithCommandResult_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intValue") != 0;
}

@end
