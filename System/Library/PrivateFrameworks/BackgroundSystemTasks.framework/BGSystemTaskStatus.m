@implementation BGSystemTaskStatus

- (int64_t)status
{
  return self->_status;
}

- (NSSet)blockingReasons
{
  return self->_blockingReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockingReasons, 0);
}

@end
