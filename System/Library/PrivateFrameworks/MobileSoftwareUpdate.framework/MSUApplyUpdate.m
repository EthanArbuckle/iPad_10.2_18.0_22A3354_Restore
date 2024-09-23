@implementation MSUApplyUpdate

uint64_t __MSUApplyUpdate_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (*)(uint64_t, _QWORD))a1[5];
  if (v4)
  {
    v5 = v4(a2, a1[6]);
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      if ((_DWORD)v5 == -1)
      {
        v8 = CFSTR("ClientSendError");
      }
      else if ((_DWORD)v5 == 2)
      {
        v8 = CFSTR("Cancel");
      }
      else if ((_DWORD)v5)
      {
        v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MSUOperation(%d)"), v5);
      }
      else
      {
        v8 = CFSTR("Continue");
      }
      *(_DWORD *)buf = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = a2;
      _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | ApplyUpdate | PROGRESS (%@) | state:%@", buf, 0x20u);
    }
  }
  else
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v5 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = CFSTR("Continue");
      v16 = 2112;
      v17 = a2;
      _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | ApplyUpdate | PROGRESS (no progress handler - %@) | state:%@", buf, 0x20u);
      return 0;
    }
  }
  return v5;
}

@end
