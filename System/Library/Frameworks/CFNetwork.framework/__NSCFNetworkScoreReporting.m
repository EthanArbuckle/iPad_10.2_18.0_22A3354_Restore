@implementation __NSCFNetworkScoreReporting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), 0);
}

@end
