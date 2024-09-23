@implementation AudioSessionDestroyCoreMXSession

void __AudioSessionDestroyCoreMXSession_block_invoke(uint64_t a1)
{
  _OWORD *v2;
  _OWORD **v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  _OWORD v10[2];
  char v11;
  audit_token_t atoken;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (_OWORD **)(a1 + 40);
  v2 = *(_OWORD **)(a1 + 40);
  v4 = v2[1];
  *(_OWORD *)atoken.val = *v2;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_pid(&atoken);
  v5 = (*v3)[1];
  v10[0] = **v3;
  v10[1] = v5;
  v11 = 1;
  if (sSessionServer)
  {
    v6 = *(unsigned int *)(a1 + 48);
    AudioSessionServerInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[NSObject destroySession:auditToken:](v7, "destroySession:auditToken:", v6, v10);
  }
  else
  {
    v7 = MEMORY[0x1E0C81028];
    v9 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "AudioSessionServerImp.mm";
      v15 = 1024;
      v16 = 912;
      _os_log_impl(&dword_1A0F4D000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioSessionServer has not been initialized", buf, 0x12u);
    }
    v8 = -1;
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
}

@end
