@implementation NSError(MessageContentView)

- (id)mf_messageFragment
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  messageForFragment(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "ef_publicDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSError(MessageContentView) mf_messageFragment].cold.1(v4, buf, v3);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGE_CAUSED_PROBLEM"), &stru_1E9A04480, CFSTR("Main"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "mf_stringByEscapingHTMLCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", CFSTR("<html dir=auto><body><i><font color=#888>%@</font></i></body></html>"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC68E0]), "initWithMarkupString:baseURL:", v8, 0);
  return v9;
}

- (void)mf_messageFragment
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D56AF000, log, OS_LOG_TYPE_ERROR, "Failed to find a message for error: %{public}@", buf, 0xCu);

}

@end
