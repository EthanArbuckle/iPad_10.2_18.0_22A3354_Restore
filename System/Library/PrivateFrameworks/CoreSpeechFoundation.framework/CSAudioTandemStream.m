@implementation CSAudioTandemStream

- (CSAudioTandemStream)initWithMasterAudioStream:(id)a3 name:(id)a4
{
  CSAudioTandemStream *v4;
  id v6;
  CSAudioTandemStream *v7;
  void *v8;
  CSAudioStreamRequest *v9;
  void *v10;
  id v11;
  CSAudioTandemStream *v12;

  v4 = (CSAudioTandemStream *)a3;
  if (a3)
  {
    v6 = a4;
    v7 = v4;
    -[CSAudioTandemStream setPrimaryStream:](self, "setPrimaryStream:", v7);
    -[CSAudioStream streamProvider](v7, "streamProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [CSAudioStreamRequest alloc];
    -[CSAudioStream streamRequest](v7, "streamRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[CSAudioStreamRequest initTandemWithRequest:](v9, "initTandemWithRequest:", v10);
    v12 = -[CSAudioStream initWithAudioStreamProvider:streamName:streamRequest:](self, "initWithAudioStreamProvider:streamName:streamRequest:", v8, v6, v11);

    self = v12;
    v4 = self;
  }

  return v4;
}

- (void)attachToPrimaryStreamWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[CSAudioTandemStream primaryStream](self, "primaryStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSAudioTandemStream attachToPrimaryStreamWithCompletion:]";
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, "%s primaryStream already torn down", (uint8_t *)&v11, 0xCu);
      if (!v4)
        goto LABEL_6;
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 963, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v10);

    goto LABEL_6;
  }
  -[CSAudioTandemStream primaryStream](self, "primaryStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAudioTandemStream primaryStream](self, "primaryStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachTandemStream:toPrimaryStream:completion:", self, v8, v4);

LABEL_6:
}

- (BOOL)prepareAudioStreamSyncWithRequest:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  __assert_rtn("-[CSAudioTandemStream prepareAudioStreamSyncWithRequest:error:]", "CSAudioTandemStream.m", 46, "NO");
}

- (void)prepareAudioStreamWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSAudioTandemStream prepareAudioStreamWithRequest:completion:]", "CSAudioTandemStream.m", 51, "NO");
}

- (void)startAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSAudioTandemStream startAudioStreamWithOption:completion:]", "CSAudioTandemStream.m", 58, "NO");
}

- (void)stopAudioStreamWithOption:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[CSAudioTandemStream stopAudioStreamWithOption:completion:]", "CSAudioTandemStream.m", 65, "NO");
}

- (BOOL)isStreaming
{
  void *v2;
  char v3;

  -[CSAudioTandemStream primaryStream](self, "primaryStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStreaming");

  return v3;
}

- (CSAudioStream)primaryStream
{
  return (CSAudioStream *)objc_loadWeakRetained((id *)&self->_primaryStream);
}

- (void)setPrimaryStream:(id)a3
{
  objc_storeWeak((id *)&self->_primaryStream, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryStream);
}

@end
