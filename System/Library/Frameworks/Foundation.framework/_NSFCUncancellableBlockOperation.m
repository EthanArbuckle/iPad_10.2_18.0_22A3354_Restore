@implementation _NSFCUncancellableBlockOperation

- (void)cancel
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A798 != -1)
    dispatch_once(&qword_1ECD0A798, &__block_literal_global_797);
  v2 = qword_1ECD0A6F8;
  if (os_log_type_enabled((os_log_t)qword_1ECD0A6F8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1817D9000, v2, OS_LOG_TYPE_INFO, "Refusing to cancel a File Coordination-originating operation", v3, 2u);
  }
}

@end
