@implementation APRotationRequestor

- (void)rotate:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v5, (uint64_t)&unk_1E8C47F10, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rotate_(v12, v7, (uint64_t)v4, v8);

  objc_msgSend_finished(self, v9, v10, v11);
}

- (id)remoteObjectInterface
{
  return &unk_1EFB8F9E0;
}

- (void)connectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory(0x2AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CF251000, v2, OS_LOG_TYPE_INFO, "Connection for Promoted Content Rotation in Daemon was interrupted.", v3, 2u);
  }

}

- (void)connectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  APLogForCategory(0x2AuLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1CF251000, v2, OS_LOG_TYPE_INFO, "Connection for Promoted Content Rotation in Daemon was invalidated.", v3, 2u);
  }

}

+ (BOOL)canShareConnection
{
  return 1;
}

+ (id)machService
{
  return CFSTR("com.apple.ap.promotedcontent.signing");
}

@end
