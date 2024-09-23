@implementation _AAURLSessionConfigurationTask

- (_AAURLSessionConfigurationTask)init
{
  -[_AAURLSessionConfigurationTask doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_AAURLSessionConfigurationTask)initWithSession:(id)a3 request:(id)a4 completion:(id)a5
{
  id v10;
  id v11;
  id v12;
  _AAURLSessionConfigurationTask *v13;
  _AAURLSessionConfigurationTask *v14;
  uint64_t v15;
  id completion;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionConfigurationTask.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionConfigurationTask.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("session"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionConfigurationTask.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)_AAURLSessionConfigurationTask;
  v13 = -[_AAURLSessionConfigurationTask init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_session, a3);
    objc_storeStrong((id *)&v14->_originalRequest, a4);
    v15 = MEMORY[0x1A1AED7A0](v12);
    completion = v14->_completion;
    v14->_completion = (id)v15;

    v14->_unfairLock._os_unfair_lock_opaque = 0;
    *(_BYTE *)&v14->_flags &= 0xFCu;
  }

  return v14;
}

- (void)_unfairLock_initiateConfigurationTask
{
  void *v3;
  _QWORD v4[5];

  os_unfair_lock_assert_owner(&self->_unfairLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    +[AARemoteServer sharedServer](AARemoteServer, "sharedServer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __71___AAURLSessionConfigurationTask__unfairLock_initiateConfigurationTask__block_invoke;
    v4[3] = &unk_1E4170E88;
    v4[4] = self;
    objc_msgSend(v3, "configurationWithCompletion:", v4);

    *(_BYTE *)&self->_flags |= 2u;
  }
}

- (void)_initiateSessionTaskWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AAURLSession *session;
  AAURLSessionTaskProtocol *v11;
  AAURLSessionTaskProtocol *sessionTask;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionConfigurationTask.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  -[NSURLRequest URL](self->_originalRequest, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "urlForEndpoint:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)-[NSURLRequest mutableCopy](self->_originalRequest, "mutableCopy");
      objc_msgSend(v9, "setURL:", v8);
      session = self->_session;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72___AAURLSessionConfigurationTask__initiateSessionTaskWithConfiguration___block_invoke;
      v17[3] = &unk_1E416EA38;
      v17[4] = self;
      -[AAURLSession dataTaskWithRequest:completion:](session, "dataTaskWithRequest:completion:", v9, v17);
      v11 = (AAURLSessionTaskProtocol *)objc_claimAutoreleasedReturnValue();
      sessionTask = self->_sessionTask;
      self->_sessionTask = v11;

      -[AAURLSessionTaskProtocol resume](self->_sessionTask, "resume");
    }
    else
    {
      _AALogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_AAURLSessionConfigurationTask _initiateSessionTaskWithConfiguration:].cold.2((uint64_t)v7, v14, v15);

      objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4401);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_AAURLSessionConfigurationTask _invokeCompletionWithData:response:error:](self, "_invokeCompletionWithData:response:error:", 0, 0, v9);
    }

  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_AAURLSessionConfigurationTask _initiateSessionTaskWithConfiguration:].cold.1((id *)&self->_originalRequest, v13);

    objc_msgSend(MEMORY[0x1E0CB35C8], "aa_errorWithCode:", -4401);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_AAURLSessionConfigurationTask _invokeCompletionWithData:response:error:](self, "_invokeCompletionWithData:response:error:", 0, 0, v8);
  }

}

- (void)_invokeCompletionWithData:(id)a3 response:(id)a4 error:(id)a5
{
  os_unfair_lock_s *p_unfairLock;
  id v10;
  id v11;
  id v12;
  id completion;
  void *v14;
  void (**v15)(id, id, id, id);

  p_unfairLock = &self->_unfairLock;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  os_unfair_lock_lock(p_unfairLock);
  if (!self->_completion)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AAURLSessionConfigurationTask.m"), 120, CFSTR("Attempted to call completion twice!"));

  }
  v15 = (void (**)(id, id, id, id))MEMORY[0x1A1AED7A0]();
  completion = self->_completion;
  self->_completion = 0;

  os_unfair_lock_unlock(p_unfairLock);
  v15[2](v15, v12, v11, v10);

}

- (void)suspend
{
  os_unfair_lock_s *p_unfairLock;
  _QWORD v3[6];

  p_unfairLock = &self->_unfairLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41___AAURLSessionConfigurationTask_suspend__block_invoke;
  v3[3] = &unk_1E4170EB0;
  v3[4] = self;
  v3[5] = a2;
  os_unfair_lock_lock(&self->_unfairLock);
  __41___AAURLSessionConfigurationTask_suspend__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)resume
{
  os_unfair_lock_s *p_unfairLock;
  _QWORD v3[5];

  p_unfairLock = &self->_unfairLock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40___AAURLSessionConfigurationTask_resume__block_invoke;
  v3[3] = &unk_1E416E3A8;
  v3[4] = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __40___AAURLSessionConfigurationTask_resume__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_unfairLock);
}

- (void)cancel
{
  *(_BYTE *)&self->_flags |= 1u;
}

- (NSString)description
{
  os_unfair_lock_s *p_unfairLock;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  __CFString *(*v12)(uint64_t);
  void *v13;
  _AAURLSessionConfigurationTask *v14;

  p_unfairLock = &self->_unfairLock;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __45___AAURLSessionConfigurationTask_description__block_invoke;
  v13 = &unk_1E4170ED8;
  v14 = self;
  os_unfair_lock_lock(&self->_unfairLock);
  __45___AAURLSessionConfigurationTask_description__block_invoke((uint64_t)&v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p {taskDescription: %@}>"), v7, self, v4, v10, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSession:request:completion:", self->_session, self->_originalRequest, self->_completion);
}

- (AAURLSession)session
{
  return self->_session;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sessionTask, 0);
  objc_storeStrong((id *)&self->_configurationTask, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)_initiateSessionTaskWithConfiguration:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, a2, v4, "Failed to find endpoint in URL: %{private}@", (uint8_t *)&v5);

}

- (void)_initiateSessionTaskWithConfiguration:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_19EACA000, a2, a3, "Failed to find URL for endpoint: %{private}@", (uint8_t *)&v3);
}

@end
