@implementation AudioSessionCreateCMSession

void __AudioSessionCreateCMSession_block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _BYTE v4[12];
  __int16 v5;
  _BYTE v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (sSessionServer)
  {
    AudioSessionServerInstance();
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject createCoreMXSessionForPID:](v2, "createCoreMXSessionForPID:", *(unsigned int *)(a1 + 40));
    if (*(_QWORD *)v4)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = *(_QWORD *)v4;
      CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52) = *(_DWORD *)&v6[2];
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = 0;
    }
  }
  else
  {
    v2 = MEMORY[0x1E0C81028];
    v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v4 = 136315394;
      *(_QWORD *)&v4[4] = "AudioSessionServerImp.mm";
      v5 = 1024;
      *(_DWORD *)v6 = 1001;
      _os_log_impl(&dword_1A0F4D000, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioSessionServer has not been initialized", v4, 0x12u);
    }
  }

}

@end
