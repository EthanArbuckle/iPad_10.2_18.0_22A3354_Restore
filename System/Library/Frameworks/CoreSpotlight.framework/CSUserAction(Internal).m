@implementation CSUserAction(Internal)

- (void)initWithXPCDict:()Internal .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_18C42F000, log, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);

}

@end
