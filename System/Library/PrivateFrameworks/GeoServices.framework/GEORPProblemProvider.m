@implementation GEORPProblemProvider

- (GEORPProblemProvider)init
{
  GEORPProblemProvider *v2;
  uint64_t v3;
  GEOProtobufSession *protobufSession;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemProvider;
  v2 = -[GEORPProblemProvider init](&v6, sel_init);
  if (v2)
  {
    +[GEOProtobufSession sharedProtobufSession](GEOProtobufSession, "sharedProtobufSession");
    v3 = objc_claimAutoreleasedReturnValue();
    protobufSession = v2->_protobufSession;
    v2->_protobufSession = (GEOProtobufSession *)v3;

  }
  return v2;
}

- (void)startSubmissionRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[GEORPProblemProvider setSubmissionFinishedHandler:](self, "setSubmissionFinishedHandler:", a4);
  -[GEORPProblemProvider setSubmissionErrorHandler:](self, "setSubmissionErrorHandler:", v8);

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCounterTicketForType:auditToken:traits:", 2816, v11, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[GEORPProblemProvider protobufSession](self, "protobufSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetURLWithSource(10, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = GEOURLNeedsAuthForURLType(10);
  v16 = 8;
  if (!v15)
    v16 = 0;
  objc_msgSend(v12, "taskWithRequestKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:traits:delegate:delegateQueue:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2816, v9, v13, 0, 0, 0, self, v14, v19, 0, 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORPProblemProvider setSubmissionTask:](self, "setSubmissionTask:", v17);
  -[GEORPProblemProvider submissionTask](self, "submissionTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");

}

- (void)startStatusRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[GEORPProblemProvider setStatusFinishedHandler:](self, "setStatusFinishedHandler:", a4);
  -[GEORPProblemProvider setStatusErrorHandler:](self, "setStatusErrorHandler:", v8);

  +[GEORequestCounter sharedCounter](GEORequestCounter, "sharedCounter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestCounterTicketForType:auditToken:traits:", 2817, v11, 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[GEORPProblemProvider protobufSession](self, "protobufSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GEOGetURLWithSource(11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOProtobufSession sharedDelegateQueue](GEOProtobufSession, "sharedDelegateQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = GEOURLNeedsAuthForURLType(11);
  v16 = 8;
  if (!v15)
    v16 = 0;
  objc_msgSend(v12, "taskWithRequestKind:protobufRequest:URL:additionalHTTPHeaders:auditToken:traits:delegate:delegateQueue:requestCounterTicket:multipathServiceType:multipathAlternatePort:throttleToken:options:", 2817, v9, v13, 0, 0, 0, self, v14, v19, 0, 0, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEORPProblemProvider setStatusTask:](self, "setStatusTask:", v17);
  -[GEORPProblemProvider statusTask](self, "statusTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "start");

}

- (void)cancelRequest
{
  void *v3;
  id v4;

  -[GEORPProblemProvider submissionTask](self, "submissionTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[GEORPProblemProvider statusTask](self, "statusTask");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

}

- (GEOProtobufSession)protobufSession
{
  return self->_protobufSession;
}

- (GEOProtobufSessionTask)submissionTask
{
  return self->_submissionTask;
}

- (void)setSubmissionTask:(id)a3
{
  objc_storeStrong((id *)&self->_submissionTask, a3);
}

- (GEOProtobufSessionTask)statusTask
{
  return self->_statusTask;
}

- (void)setStatusTask:(id)a3
{
  objc_storeStrong((id *)&self->_statusTask, a3);
}

- (id)submissionErrorHandler
{
  return self->_submissionErrorHandler;
}

- (void)setSubmissionErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)submissionFinishedHandler
{
  return self->_submissionFinishedHandler;
}

- (void)setSubmissionFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)statusErrorHandler
{
  return self->_statusErrorHandler;
}

- (void)setStatusErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)statusFinishedHandler
{
  return self->_statusFinishedHandler;
}

- (void)setStatusFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusFinishedHandler, 0);
  objc_storeStrong(&self->_statusErrorHandler, 0);
  objc_storeStrong(&self->_submissionFinishedHandler, 0);
  objc_storeStrong(&self->_submissionErrorHandler, 0);
  objc_storeStrong((id *)&self->_statusTask, 0);
  objc_storeStrong((id *)&self->_submissionTask, 0);
  objc_storeStrong((id *)&self->_protobufSession, 0);
}

- (void)protobufSession:(id)a3 didCompleteTask:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  -[GEORPProblemProvider submissionTask](self, "submissionTask");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[GEORPProblemProvider didCompleteSubmissionTask](self, "didCompleteSubmissionTask");
    goto LABEL_5;
  }
  -[GEORPProblemProvider statusTask](self, "statusTask");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[GEORPProblemProvider didCompleteStatusTask](self, "didCompleteStatusTask");
LABEL_5:
    v7 = v8;
  }

}

- (void)didCompleteSubmissionTask
{
  void *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  -[GEORPProblemProvider submissionTask](self, "submissionTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completedAsCancelled");

  if (v4)
  {
    -[GEORPProblemProvider submissionErrorHandler](self, "submissionErrorHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[GEORPProblemProvider cancelError](self, "cancelError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
  }
  else
  {
    -[GEORPProblemProvider submissionTask](self, "submissionTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEORPProblemProvider submissionFinishedHandler](self, "submissionFinishedHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);
    }
    else
    {
      -[GEORPProblemProvider submissionErrorHandler](self, "submissionErrorHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GEORPProblemProvider submissionTask](self, "submissionTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    }
  }

  -[GEORPProblemProvider setSubmissionTask:](self, "setSubmissionTask:", 0);
  -[GEORPProblemProvider setSubmissionFinishedHandler:](self, "setSubmissionFinishedHandler:", 0);
  -[GEORPProblemProvider setSubmissionErrorHandler:](self, "setSubmissionErrorHandler:", 0);
}

- (void)didCompleteStatusTask
{
  void *v3;
  int v4;
  void (**v5)(_QWORD, _QWORD);
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;

  -[GEORPProblemProvider statusTask](self, "statusTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "completedAsCancelled");

  if (v4)
  {
    -[GEORPProblemProvider statusErrorHandler](self, "statusErrorHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[GEORPProblemProvider cancelError](self, "cancelError");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);
  }
  else
  {
    -[GEORPProblemProvider statusTask](self, "statusTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "response");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEORPProblemProvider statusFinishedHandler](self, "statusFinishedHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, v5);
    }
    else
    {
      -[GEORPProblemProvider statusErrorHandler](self, "statusErrorHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[GEORPProblemProvider statusTask](self, "statusTask");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v9);

    }
  }

  -[GEORPProblemProvider setStatusTask:](self, "setStatusTask:", 0);
  -[GEORPProblemProvider setStatusFinishedHandler:](self, "setStatusFinishedHandler:", 0);
  -[GEORPProblemProvider setStatusErrorHandler:](self, "setStatusErrorHandler:", 0);
}

- (id)cancelError
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -2);
}

@end
