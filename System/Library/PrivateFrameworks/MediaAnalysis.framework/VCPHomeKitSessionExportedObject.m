@implementation VCPHomeKitSessionExportedObject

- (void)processResults:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[VCPHomeKitSessionExportedObject weakSession](self, "weakSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "processResults:withReply:", v6, v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No VCPHomeKitAnalysisSession; cannot process message"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);

  }
}

- (VCPHomeKitAnalysisSession)weakSession
{
  return (VCPHomeKitAnalysisSession *)objc_loadWeakRetained((id *)&self->_weakSession);
}

- (void)setWeakSession:(id)a3
{
  objc_storeWeak((id *)&self->_weakSession, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakSession);
}

@end
