@implementation _NSHTTPAlternativeServicesClearEntry

- (BOOL)isEqual:(id)a3
{
  _NSHTTPAlternativeServicesClearEntry *v4;
  _NSHTTPAlternativeServicesClearEntry *v5;
  NSString *host;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int64_t port;
  int64_t v11;
  BOOL v12;

  v4 = (_NSHTTPAlternativeServicesClearEntry *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self)
        host = self->_host;
      else
        host = 0;
      v7 = host;
      v8 = v7;
      if (v5)
        v9 = v5->_host;
      else
        v9 = 0;
      if (!-[NSString isEqualToString:](v7, "isEqualToString:", v9))
      {
        v12 = 0;
        goto LABEL_15;
      }
      if (self)
      {
        port = self->_port;
        if (v5)
        {
LABEL_10:
          v11 = v5->_port;
LABEL_11:
          v12 = port == v11;
LABEL_15:

          goto LABEL_16;
        }
      }
      else
      {
        port = 0;
        if (v5)
          goto LABEL_10;
      }
      v11 = 0;
      goto LABEL_11;
    }
    v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t port;

  if (self)
  {
    v3 = -[NSString hash](self->_host, "hash");
    port = self->_port;
  }
  else
  {
    v3 = objc_msgSend(0, "hash");
    port = 0;
  }
  return port ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
}

@end
