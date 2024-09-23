@implementation __CFN_SocksHandshake

- (BOOL)parse:(const char *)a3 len:(int64_t)a4 completion:(id)a5
{
  id v5;

  v5 = a5;
  __assert_rtn("-[__CFN_SocksHandshake parse:len:completion:]", "SocksHandshake.m", 317, "false");
}

- (id)finish:(int)a3
{
  __assert_rtn("-[__CFN_SocksHandshake finish:]", "SocksHandshake.m", 322, "false");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
