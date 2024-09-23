@implementation NEIKEv2TransportClient

- (id)description
{
  const char *v3;
  id v4;
  id v5;
  SEL v6;
  id v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    v5 = objc_getProperty(self, v3, 8, 1);
    v7 = objc_getProperty(self, v6, 16, 1);
    self = (NEIKEv2TransportClient *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  v8 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("[NEIKEv2TransportClient %@-%@ %@]"), v5, v7, self);

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteSPI, 0);
  objc_storeStrong((id *)&self->_clientSPI, 0);
}

@end
