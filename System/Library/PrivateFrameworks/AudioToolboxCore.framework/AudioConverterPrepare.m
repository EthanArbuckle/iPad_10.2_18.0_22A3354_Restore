@implementation AudioConverterPrepare

uint64_t __AudioConverterPrepare_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_queue_s *v4;
  _QWORD *v5;
  swix::connection *v6;
  int v7;
  NSObject *v8;
  uint64_t result;
  _QWORD *v10;
  _BYTE v11[8];
  xpc_object_t v12;
  uint8_t buf[4];
  _BYTE object[14];
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  AudioConverterLog();
  v2 = AudioConverterLog(void)::gLog;
  if (os_log_type_enabled((os_log_t)AudioConverterLog(void)::gLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)object = "AudioConverterOOP.cpp";
    *(_WORD *)&object[8] = 1024;
    *(_DWORD *)&object[10] = 840;
    _os_log_impl(&dword_18EE07000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Preparing AudioConverterService", buf, 0x12u);
  }
  remoteAudioConverterClientWithActivatedEndpoint(&v10, v3, v4);
  v5 = v10;
  MEMORY[0x193FFDBA8](v11, 74777826);
  v6 = (swix::connection *)v5[1];
  if (!v6)
    std::terminate();
  swix::connection::send_and_await_reply(v6, (const swix::encode_message *)v11);
  v7 = swix::coder<int>::decode(*(void **)&object[4], ".error");
  xpc_release(*(xpc_object_t *)&object[4]);
  xpc_release(v12);
  AudioConverterLog();
  v8 = AudioConverterLog(void)::gLog;
  if ((unint64_t)(v7 == 0) << 32 || !v7)
  {
    if (os_log_type_enabled((os_log_t)AudioConverterLog(void)::gLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)object = "AudioConverterOOP.cpp";
      *(_WORD *)&object[8] = 1024;
      *(_DWORD *)&object[10] = 844;
      _os_log_impl(&dword_18EE07000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d AudioConverterService prepared", buf, 0x12u);
    }
    v7 = 0;
  }
  else if (os_log_type_enabled((os_log_t)AudioConverterLog(void)::gLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)object = "AudioConverterOOP.cpp";
    *(_WORD *)&object[8] = 1024;
    *(_DWORD *)&object[10] = 847;
    v15 = 1024;
    v16 = v7;
    _os_log_impl(&dword_18EE07000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to prepare AudioConverterService: %d", buf, 0x18u);
  }
  result = (*(uint64_t (**)(_QWORD *))(*v5 + 8))(v5);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  return result;
}

uint64_t __AudioConverterPrepare_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  return result;
}

OpaqueAudioComponent *__AudioConverterPrepare_block_invoke_2()
{
  OpaqueAudioComponent *result;
  AudioComponentDescription v1;

  result = 0;
  *(_OWORD *)&v1.componentType = xmmword_18F117060;
  v1.componentFlagsMask = 0;
  do
    result = AudioComponentFindNext(result, &v1);
  while (result);
  return result;
}

@end
