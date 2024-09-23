@implementation ICTTTodo(ICTTTodoPersistenceAdditions)

- (void)initWithData:()ICTTTodoPersistenceAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "ICTTTodo protobuf corrupt.", v1, 2u);
}

@end
