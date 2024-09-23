@implementation WKGrant

- (void)invalidateGrant
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1ECE71C68;
  if (os_log_type_enabled((os_log_t)qword_1ECE71C68, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_196BCC000, v2, OS_LOG_TYPE_FAULT, "-[WKGrant invalidateGrant] should never be called", v3, 2u);
  }
}

@end
