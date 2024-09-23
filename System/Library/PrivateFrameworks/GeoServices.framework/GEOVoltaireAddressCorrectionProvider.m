@implementation GEOVoltaireAddressCorrectionProvider

+ (id)acInitURL
{
  return GEOGetURLWithSource(19, 0);
}

+ (BOOL)acInitNeedsProxy
{
  return GEOURLNeedsAuthForURLType(19);
}

+ (id)acUpdateURL
{
  return GEOGetURLWithSource(20, 0);
}

+ (BOOL)acUpdateNeedsProxy
{
  return GEOURLNeedsAuthForURLType(20);
}

- (GEOVoltaireAddressCorrectionProvider)init
{
  GEOVoltaireAddressCorrectionProvider *v2;
  uint64_t v3;
  GEOProtobufSession *protobufSession;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVoltaireAddressCorrectionProvider;
  v2 = -[GEOVoltaireAddressCorrectionProvider init](&v6, sel_init);
  if (v2)
  {
    +[GEOProtobufSession sharedProtobufSession](GEOProtobufSession, "sharedProtobufSession");
    v3 = objc_claimAutoreleasedReturnValue();
    protobufSession = v2->_protobufSession;
    v2->_protobufSession = (GEOProtobufSession *)v3;

  }
  return v2;
}

- (void)startInitRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[GEOVoltaireAddressCorrectionProvider setInitFinishedHandler:](self, "setInitFinishedHandler:", a4);
  -[GEOVoltaireAddressCorrectionProvider setInitErrorHandler:](self, "setInitErrorHandler:", v8);

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCounterTicketForType:auditToken:traits:", 2848, v11, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "acInitURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend((id)objc_opt_class(), "acInitNeedsProxy");
  -[GEOVoltaireAddressCorrectionProvider protobufSession](self, "protobufSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 8;
  if (!(_DWORD)v11)
    v16 = 0;
  objc_msgSend(v13, "taskWithRequestKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:traits:delegate:delegateQueue:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2848, v9, v12, 0, 0, 0, self, v14, v19, 0, 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOVoltaireAddressCorrectionProvider setInitializationTask:](self, "setInitializationTask:", v17);
  -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");

}

- (void)startUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[GEOVoltaireAddressCorrectionProvider setUpdateFinishedHandler:](self, "setUpdateFinishedHandler:", a4);
  -[GEOVoltaireAddressCorrectionProvider setUpdateErrorHandler:](self, "setUpdateErrorHandler:", v8);

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCounterTicketForType:auditToken:traits:", 2849, v11, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "acUpdateURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend((id)objc_opt_class(), "acUpdateNeedsProxy");
  -[GEOVoltaireAddressCorrectionProvider protobufSession](self, "protobufSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 8;
  if (!(_DWORD)v11)
    v16 = 0;
  objc_msgSend(v13, "taskWithRequestKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:traits:delegate:delegateQueue:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2849, v9, v12, 0, 0, 0, self, v14, v19, 0, 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOVoltaireAddressCorrectionProvider setUpdateTask:](self, "setUpdateTask:", v17);
  -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");

}

- (void)cancelRequest
{
  void *v3;
  id v4;

  -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (GEOProtobufSession)protobufSession
{
  return self->_protobufSession;
}

- (GEOProtobufSessionTask)initializationTask
{
  return self->_initializationTask;
}

- (void)setInitializationTask:(id)a3
{
  objc_storeStrong((id *)&self->_initializationTask, a3);
}

- (GEOProtobufSessionTask)updateTask
{
  return self->_updateTask;
}

- (void)setUpdateTask:(id)a3
{
  objc_storeStrong((id *)&self->_updateTask, a3);
}

- (id)initFinishedHandler
{
  return self->_initFinishedHandler;
}

- (void)setInitFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)initErrorHandler
{
  return self->_initErrorHandler;
}

- (void)setInitErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)updateFinishedHandler
{
  return self->_updateFinishedHandler;
}

- (void)setUpdateFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)updateErrorHandler
{
  return self->_updateErrorHandler;
}

- (void)setUpdateErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateErrorHandler, 0);
  objc_storeStrong(&self->_updateFinishedHandler, 0);
  objc_storeStrong(&self->_initFinishedHandler, 0);
  objc_storeStrong(&self->_initErrorHandler, 0);
  objc_storeStrong((id *)&self->_updateTask, 0);
  objc_storeStrong((id *)&self->_initializationTask, 0);
  objc_storeStrong((id *)&self->_protobufSession, 0);
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[GEOVoltaireAddressCorrectionProvider didCompleteInitTask](self, "didCompleteInitTask");
    goto LABEL_5;
  }
  -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[GEOVoltaireAddressCorrectionProvider didCompleteUpdateTask](self, "didCompleteUpdateTask");
LABEL_5:
    v7 = v8;
  }

}

- (void)didCompleteInitTask
{
  void *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completedAsCancelled");

  if (v4)
  {
    -[GEOVoltaireAddressCorrectionProvider initErrorHandler](self, "initErrorHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[GEOVoltaireAddressCorrectionProvider cancelError](self, "cancelError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
  }
  else
  {
    -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEOVoltaireAddressCorrectionProvider initFinishedHandler](self, "initFinishedHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);
    }
    else
    {
      -[GEOVoltaireAddressCorrectionProvider initErrorHandler](self, "initErrorHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GEOVoltaireAddressCorrectionProvider initializationTask](self, "initializationTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    }
  }

  -[GEOVoltaireAddressCorrectionProvider setInitializationTask:](self, "setInitializationTask:", 0);
  -[GEOVoltaireAddressCorrectionProvider setInitFinishedHandler:](self, "setInitFinishedHandler:", 0);
  -[GEOVoltaireAddressCorrectionProvider setInitErrorHandler:](self, "setInitErrorHandler:", 0);
}

- (void)didCompleteUpdateTask
{
  void *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completedAsCancelled");

  if (v4)
  {
    -[GEOVoltaireAddressCorrectionProvider updateErrorHandler](self, "updateErrorHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[GEOVoltaireAddressCorrectionProvider cancelError](self, "cancelError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
  }
  else
  {
    -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEOVoltaireAddressCorrectionProvider updateFinishedHandler](self, "updateFinishedHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);
    }
    else
    {
      -[GEOVoltaireAddressCorrectionProvider updateErrorHandler](self, "updateErrorHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GEOVoltaireAddressCorrectionProvider updateTask](self, "updateTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    }
  }

  -[GEOVoltaireAddressCorrectionProvider setUpdateTask:](self, "setUpdateTask:", 0);
  -[GEOVoltaireAddressCorrectionProvider setUpdateFinishedHandler:](self, "setUpdateFinishedHandler:", 0);
  -[GEOVoltaireAddressCorrectionProvider setUpdateErrorHandler:](self, "setUpdateErrorHandler:", 0);
}

- (id)cancelError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
}

@end
