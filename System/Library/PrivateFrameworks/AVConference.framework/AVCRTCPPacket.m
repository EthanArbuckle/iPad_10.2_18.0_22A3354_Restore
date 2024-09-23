@implementation AVCRTCPPacket

+ (id)newPacketWithRTCPPacket:(tagRTCPPACKET *)a3 packetLength:(unint64_t)a4
{
  tagRTCPCOMMON var0;
  id result;
  __objc2_class *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  switch(*(unsigned int *)&var0 >> 8)
  {
    case 0xC8u:
      if (24 * (unint64_t)(*(_BYTE *)&var0 & 0x1F) + 28 > a4)
        goto LABEL_2;
      v8 = AVCRTCPSenderReport;
      goto LABEL_9;
    case 0xC9u:
      if (24 * (*(_BYTE *)&var0 & 0x1Fu) + 8 > a4)
        goto LABEL_2;
      v8 = AVCRTCPReceiverReport;
      goto LABEL_9;
    case 0xCAu:
      if (a3->var0.var4 - 67 < 0xFFFFFFBE)
        goto LABEL_2;
      v8 = AVCRTCPSourceDescription;
LABEL_9:
      result = (id)objc_msgSend([v8 alloc], "initWithRTCPPacket:", a3);
      break;
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
      goto LABEL_2;
    default:
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v12 = *((unsigned __int8 *)&a3->var0 + 1);
            v13 = 136316418;
            v14 = v10;
            v15 = 2080;
            v16 = "+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]";
            v17 = 1024;
            v18 = 54;
            v19 = 2112;
            v20 = v9;
            v21 = 2048;
            v22 = a1;
            v23 = 1024;
            v24 = v12;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid packet type: %d", (uint8_t *)&v13, 0x36u);
          }
        }
      }
LABEL_2:
      result = 0;
      break;
  }
  return result;
}

- (AVCRTCPPacket)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  AVCRTCPPacket *v4;
  AVCRTCPPacket *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  AVCRTCPPacket *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVCRTCPPacket;
  v4 = -[AVCRTCPPacket init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v6 = *((unsigned __int8 *)&a3->var0 + 1);
      if (v6 == 202 || v6 == 201 || v6 == 200)
      {
        v4->_packetType = v6;
        v4->_SSRC = a3->var1.var0.var0;
        return v5;
      }
      if ((AVCRTCPPacket *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCRTCPPacket initWithRTCPPacket:].cold.2();
        }
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[AVCRTCPPacket performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v16 = VRTraceErrorLogLevelToCSTR(),
            v17 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_26:

        return 0;
      }
      v19 = *((unsigned __int8 *)&a3->var0 + 1);
      *(_DWORD *)buf = 136316418;
      v22 = v16;
      v23 = 2080;
      v24 = "-[AVCRTCPPacket initWithRTCPPacket:]";
      v25 = 1024;
      v26 = 85;
      v27 = 2112;
      v28 = v8;
      v29 = 2048;
      v30 = v5;
      v31 = 1024;
      v32 = v19;
      v13 = " [%s] %s:%d %@(%p) Invalid packet type: %d";
      v14 = v17;
      v15 = 54;
    }
    else
    {
      if ((AVCRTCPPacket *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCRTCPPacket initWithRTCPPacket:].cold.1(v9, v10);
        }
        goto LABEL_26;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[AVCRTCPPacket performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_26;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 136316162;
      v22 = v11;
      v23 = 2080;
      v24 = "-[AVCRTCPPacket initWithRTCPPacket:]";
      v25 = 1024;
      v26 = 66;
      v27 = 2112;
      v28 = v7;
      v29 = 2048;
      v30 = v5;
      v13 = " [%s] %s:%d %@(%p) RTPC Packet is nil";
      v14 = v12;
      v15 = 48;
    }
    _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_26;
  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("packetType:%u, SSRC:%u"), -[AVCRTCPPacket packetType](self, "packetType"), -[AVCRTCPPacket SSRC](self, "SSRC"));
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned __int8)a3
{
  self->_packetType = a3;
}

- (unsigned)SSRC
{
  return self->_SSRC;
}

- (void)setSSRC:(unsigned int)a3
{
  self->_SSRC = a3;
}

+ (void)newPacketWithRTCPPacket:packetLength:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid packet type: %d", v2, *(const char **)v3, (unint64_t)"+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]" >> 16, 54);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTCPPacket:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[AVCRTCPPacket initWithRTCPPacket:]";
  v6 = 1024;
  v7 = 66;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d RTPC Packet is nil", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)initWithRTCPPacket:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[AVCRTCPPacket initWithRTCPPacket:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid packet type: %d", v2, *(const char **)v3, (unint64_t)"-[AVCRTCPPacket initWithRTCPPacket:]" >> 16, 85);
  OUTLINED_FUNCTION_3();
}

@end
