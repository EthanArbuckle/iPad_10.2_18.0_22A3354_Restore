@implementation AACFNotificationCallback

void ___AACFNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v2;
    _os_log_impl(&dword_19EACA000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing notification for key: %@", (uint8_t *)&v7, 0xCu);
  }

  _AANotificationHandlerMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  _AANotificationHandlerMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v2);

  if (v5)
    v5[2](v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));

}

@end
