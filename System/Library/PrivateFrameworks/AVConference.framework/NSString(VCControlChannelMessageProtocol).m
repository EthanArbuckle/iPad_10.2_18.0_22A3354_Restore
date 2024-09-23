@implementation NSString(VCControlChannelMessageProtocol)

- (size_t)VCCCLength
{
  return strlen((const char *)objc_msgSend(a1, "UTF8String"));
}

- (BOOL)VCCCGetBytes:()VCControlChannelMessageProtocol size:
{
  size_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  _BYTE v26[10];
  __CFString *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = -[__CFString VCCCLength](a1, "VCCCLength");
  if (a4 >= v7)
  {
    memcpy(a3, (const void *)-[__CFString UTF8String](a1, "UTF8String"), v7);
    if (a4 > v7)
      bzero(&a3[v7], a4 - v7);
    return a4 >= v7;
  }
  if ((__CFString *)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return a4 >= v7;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return a4 >= v7;
    v17 = 136316418;
    v18 = v9;
    v19 = 2080;
    v20 = "-[NSString(VCControlChannelMessageProtocol) VCCCGetBytes:size:]";
    v21 = 1024;
    v22 = 61;
    v23 = 2112;
    v24 = a1;
    v25 = 1024;
    *(_DWORD *)v26 = -[__CFString VCCCLength](a1, "VCCCLength");
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a4;
    v11 = " [%s] %s:%d message '%@' is too long for given buffer (%d > %d)";
    v12 = v10;
    v13 = 50;
LABEL_15:
    _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, v13);
    return a4 >= v7;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)-[__CFString performSelector:](a1, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v17 = 136316930;
      v18 = v14;
      v19 = 2080;
      v20 = "-[NSString(VCControlChannelMessageProtocol) VCCCGetBytes:size:]";
      v21 = 1024;
      v22 = 61;
      v23 = 2112;
      v24 = v8;
      v25 = 2048;
      *(_QWORD *)v26 = a1;
      *(_WORD *)&v26[8] = 2112;
      v27 = a1;
      v28 = 1024;
      v29 = -[__CFString VCCCLength](a1, "VCCCLength");
      v30 = 1024;
      v31 = a4;
      v11 = " [%s] %s:%d %@(%p) message '%@' is too long for given buffer (%d > %d)";
      v12 = v15;
      v13 = 70;
      goto LABEL_15;
    }
  }
  return a4 >= v7;
}

- (uint64_t)VCCCData
{
  return objc_msgSend(a1, "dataUsingEncoding:", 4);
}

- (const)VCCCPayloadKey
{
  return CFSTR("EncryptedMessage");
}

@end
