@implementation ATXDuetCallbackGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletionHandlers, 0);
}

@end
