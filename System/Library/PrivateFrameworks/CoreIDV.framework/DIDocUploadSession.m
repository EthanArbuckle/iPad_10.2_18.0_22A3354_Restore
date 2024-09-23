@implementation DIDocUploadSession

- (DIDocUploadSession)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DIDocUploadSession *v11;
  DIDocUploadSessionClient *v12;
  objc_super v14;

  DIV_LOG_CLIENT_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[DIDocUploadSession init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v14.receiver = self;
  v14.super_class = (Class)DIDocUploadSession;
  v11 = -[DIDocUploadSession init](&v14, sel_init);
  v12 = objc_alloc_init(DIDocUploadSessionClient);
  -[DIDocUploadSession setClient:](v11, "setClient:", v12);

  return v11;
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  DIV_LOG_CLIENT_0();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[DIDocUploadSession uploadDocData:uploadSettings:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  -[DIDocUploadSession client](self, "client");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uploadDocData:uploadSettings:completion:", v10, v9, v8);

}

- (void)cancelUploads
{
  OUTLINED_FUNCTION_0(&dword_20A10F000, a1, a3, "DIDocUploadSession cancelUploads", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (DIDocUploadSessionClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_20A10F000, a1, a3, "DIDocUploadSession init called", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)uploadDocData:(uint64_t)a3 uploadSettings:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20A10F000, a1, a3, "DIDocUploadSession uploadDocData", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
