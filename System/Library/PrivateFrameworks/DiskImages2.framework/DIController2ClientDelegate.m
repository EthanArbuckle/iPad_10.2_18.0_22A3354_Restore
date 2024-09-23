@implementation DIController2ClientDelegate

- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, id);
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint8_t *v16;
  uint64_t v17;
  id v18[2];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = *__error();
  if (DIForwardLogs())
  {
    v18[1] = 0;
    getDIOSLog();
    v9 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v20 = 63;
    v21 = 2080;
    v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
    v23 = 2114;
    v24 = v6;
    LODWORD(v17) = 28;
    v16 = buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    getDIOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v20 = 63;
      v21 = 2080;
      v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Received: %{public}@", buf, 0x1Cu);
    }

  }
  *__error() = v8;
  objc_msgSend(v6, "xpcEndpoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v18[0] = 0;
    v13 = objc_msgSend(v6, "addToRefCountWithError:", v18);
    v14 = v18[0];
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      v7[2](v7, v14);

      goto LABEL_12;
    }

  }
  -[DIController2ClientDelegate setDeviceHandle:](self, "setDeviceHandle:", v6, v16, v17);
  v7[2](v7, 0);
LABEL_12:

}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

@end
