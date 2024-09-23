@implementation CDXClientSession

- (CDXClientSession)initWithCDXClient:(id)a3 ticket:(id)a4 sessionKey:(id)a5
{
  CDXClientSession *v8;
  unsigned __int16 *v9;
  NSData *v10;
  NSData *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v16;
  _BYTE md[22];
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)CDXClientSession;
  v8 = -[CDXClientSession init](&v16, sel_init);
  if (v8)
  {
    v8->CDXClient_ = (CDXClient *)a3;
    v9 = (unsigned __int16 *)malloc_type_malloc(2 * objc_msgSend(a4, "CDXTicketPCNT"), 0xACD95CE2uLL);
    v8->ack_ = v9;
    bzero(v9, 2 * objc_msgSend(a4, "CDXTicketPCNT"));
    v8->ticket_ = (NSData *)objc_msgSend(a4, "copyWithZone:", -[CDXClientSession zone](v8, "zone"));
    v10 = (NSData *)objc_msgSend(a5, "copyWithZone:", -[CDXClientSession zone](v8, "zone"));
    v11 = v10;
    v8->sessionKey_ = v10;
    memset(md, 170, 16);
    if (v10 && -[NSData length](v10, "length") != 16)
    {
      CC_MD5(-[NSData bytes](v11, "bytes"), -[NSData length](v11, "length"), md);
      v11 = (NSData *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", md, 16);
    }
    v8->sessionKeyPrepped_ = v11;
    v8->pid_ = -[NSData CDXTicketPID](v8->ticket_, "CDXTicketPID");
    if (!v8->sessionKey_ && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend((id)-[CDXClientSession description](v8, "description"), "UTF8String");
        *(_DWORD *)md = 136315906;
        *(_QWORD *)&md[4] = v12;
        *(_WORD *)&md[12] = 2080;
        *(_QWORD *)&md[14] = "-[CDXClientSession initWithCDXClient:ticket:sessionKey:]";
        v18 = 1024;
        v19 = 293;
        v20 = 2080;
        v21 = v14;
        _os_log_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: No session key provided. Contents of CDX session will be unencrypted!", md, 0x26u);
      }
    }
  }
  return v8;
}

- (void)stopRetransmitTimer
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)OUTLINED_FUNCTION_8_0(v0, *MEMORY[0x24BDAC8D0]), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d %s: Turning off retransmit timer.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_215C5C000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (BOOL)retransmitEvent
{
  CDXClientSession *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int64_t retransmitAttempts;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  float v18;
  float v19;
  float v20;
  NSObject *retransmitTimer;
  double v22;
  dispatch_time_t v23;
  BOOL v24;
  _BYTE v26[24];
  __int128 v27;
  CDXClientSession *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  if ((CDXClientSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x24BDFDC28];
      v7 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          retransmitAttempts = self->retransmitAttempts_;
          *(_DWORD *)v26 = 136315906;
          *(_QWORD *)&v26[4] = v5;
          *(_WORD *)&v26[12] = 2080;
          *(_QWORD *)&v26[14] = "-[CDXClientSession retransmitEvent]";
          *(_WORD *)&v26[22] = 1024;
          LODWORD(v27) = 338;
          WORD2(v27) = 1024;
          *(_DWORD *)((char *)&v27 + 6) = retransmitAttempts;
          v9 = "CDXClient [%s] %s:%d retransmitAttempts = %d";
          v10 = v6;
          v11 = 34;
LABEL_13:
          _os_log_impl(&dword_215C5C000, v10, OS_LOG_TYPE_DEFAULT, v9, v26, v11);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[CDXClientSession retransmitEvent].cold.1(v5);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[CDXClientSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_24D466D90;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x24BDFDC28];
    v14 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->retransmitAttempts_;
        *(_DWORD *)v26 = 136316418;
        *(_QWORD *)&v26[4] = v12;
        *(_WORD *)&v26[12] = 2080;
        *(_QWORD *)&v26[14] = "-[CDXClientSession retransmitEvent]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 338;
        WORD2(v27) = 2112;
        *(_QWORD *)((char *)&v27 + 6) = v4;
        HIWORD(v27) = 2048;
        v28 = self;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v15;
        v9 = "CDXClient [%s] %s:%d %@(%p) retransmitAttempts = %d";
        v10 = v13;
        v11 = 54;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = self->retransmitAttempts_;
      *(_DWORD *)v26 = 136316418;
      *(_QWORD *)&v26[4] = v12;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[CDXClientSession retransmitEvent]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 338;
      WORD2(v27) = 2112;
      *(_QWORD *)((char *)&v27 + 6) = v4;
      HIWORD(v27) = 2048;
      v28 = self;
      LOWORD(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 2) = v16;
      _os_log_debug_impl(&dword_215C5C000, v13, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d %@(%p) retransmitAttempts = %d", v26, 0x36u);
    }
  }
LABEL_18:
  if (-[NSMutableIndexSet count](self->participantsInFlight_, "count", *(_OWORD *)v26, *(_QWORD *)&v26[16], v27, v28, v29, v30)&& -[CDXClientSession sendRaw:toParticipants:](self, "sendRaw:toParticipants:", self->lastSent_, self->participantsInFlight_)&& (v17 = self->retransmitAttempts_, self->retransmitAttempts_ = v17 + 1, v17 <= 65))
  {
    v18 = pow(1.33333333, (double)((int)v17 + 1)) * 0.1;
    if (v18 <= 1.0)
      v19 = v18;
    else
      v19 = 1.0;
    v20 = ((float)((float)(arc4random() & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v19;
    retransmitTimer = self->retransmitTimer_;
    v22 = v20 * 1000000000.0;
    v23 = dispatch_time(0, (uint64_t)v22);
    dispatch_source_set_timer(retransmitTimer, v23, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v22);
    v24 = 1;
  }
  else
  {
    -[CDXClientSession stopRetransmitTimer](self, "stopRetransmitTimer");
    v24 = 0;
  }

  return v24;
}

- (void)resetRetransmitTimer
{
  OS_dispatch_queue *v3;
  OS_dispatch_source *v4;
  uint64_t v5;
  NSObject *retransmitTimer;
  float v7;
  NSObject *v8;
  double v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  _QWORD handler[5];

  if (!self->retransmitTimer_)
  {
    v3 = -[CDXClient queue](self->CDXClient_, "queue");
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v3);
    v5 = MEMORY[0x24BDAC760];
    self->retransmitTimer_ = v4;
    handler[0] = v5;
    handler[1] = 3221225472;
    handler[2] = __40__CDXClientSession_resetRetransmitTimer__block_invoke;
    handler[3] = &unk_24D466170;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
    retransmitTimer = self->retransmitTimer_;
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __40__CDXClientSession_resetRetransmitTimer__block_invoke_2;
    v11[3] = &unk_24D466170;
    v11[4] = self;
    dispatch_source_set_cancel_handler(retransmitTimer, v11);
    dispatch_resume((dispatch_object_t)self->retransmitTimer_);
  }
  self->retransmitAttempts_ = 0;
  v7 = ((float)((float)(arc4random() & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * 0.100000001;
  v8 = self->retransmitTimer_;
  v9 = v7 * 1000000000.0;
  v10 = dispatch_time(0, (uint64_t)v9);
  dispatch_source_set_timer(v8, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v9);
}

uint64_t __40__CDXClientSession_resetRetransmitTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retransmitEvent");
}

void __40__CDXClientSession_resetRetransmitTimer__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CDXClientSession invalidate](self, "invalidate");

  free(self->ack_);
  v3.receiver = self;
  v3.super_class = (Class)CDXClientSession;
  -[CDXClientSession dealloc](&v3, sel_dealloc);
}

- (void)setTicket:(id)a3
{
  NSData *ticket;

  if (objc_msgSend(a3, "CDXTicketWellFormed"))
  {
    if (-[NSData CDXTicketIsRelatedToTicket:](self->ticket_, "CDXTicketIsRelatedToTicket:", a3))
    {
      ticket = self->ticket_;
      self->ticket_ = (NSData *)objc_msgSend(a3, "copyWithZone:", -[CDXClientSession zone](self, "zone"));

    }
  }
}

- (id)decrypt:(id)a3 ticket:(id)a4
{
  id v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  CDXClient *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  size_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  _QWORD iv[3];

  v4 = a3;
  iv[2] = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  if (self->sessionKey_)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(a3, "length") + 16);
    iv[0] = *(_QWORD *)(objc_msgSend(a4, "bytes") + 4);
    iv[1] = *(_QWORD *)(objc_msgSend(a4, "bytes") + 4);
    LOBYTE(iv[0]) |= objc_msgSend(a4, "CDXTicketPID");
    v8 = CCCrypt(1u, 0, 1u, -[NSData bytes](self->sessionKeyPrepped_, "bytes"), -[NSData length](self->sessionKeyPrepped_, "length"), iv, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), (void *)objc_msgSend(v7, "mutableBytes"), objc_msgSend(v7, "length"), &v18);
    if ((_DWORD)v8)
    {
      v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          v17 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          v22 = v10;
          v23 = 2080;
          v24 = "-[CDXClientSession decrypt:ticket:]";
          v25 = 1024;
          v26 = 471;
          v27 = 2080;
          v28 = v17;
          v29 = 1024;
          v30 = v9;
          _os_log_error_impl(&dword_215C5C000, v11, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %s: Decryption failed: CCCrypt() returned error %d", buf, 0x2Cu);
        }
      }
      v12 = -[CDXClientSession CDXClient](self, "CDXClient");
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = *MEMORY[0x24BDD1100];
      v19[0] = *MEMORY[0x24BDD0FC8];
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Decryption failed. (CCCrypt error %d)"), v9);
      v19[1] = CFSTR("CDXTicket");
      v20[0] = v15;
      v20[1] = a4;
      -[CDXClient setError:](v12, "setError:", objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, (int)v9, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2)));
      return 0;
    }
    else
    {
      objc_msgSend(v7, "setLength:", v18);
      return v7;
    }
  }
  return v4;
}

- (id)encrypt:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  CDXClient *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  size_t v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  _QWORD iv[3];

  v3 = a3;
  iv[2] = *MEMORY[0x24BDAC8D0];
  v16 = 0;
  if (self->sessionKey_)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(a3, "length") + 16);
    iv[0] = *(_QWORD *)(-[NSData bytes](self->ticket_, "bytes") + 4);
    iv[1] = *(_QWORD *)(-[NSData bytes](self->ticket_, "bytes") + 4);
    LOBYTE(iv[0]) |= -[NSData CDXTicketPID](self->ticket_, "CDXTicketPID");
    v6 = CCCrypt(0, 0, 1u, -[NSData bytes](self->sessionKeyPrepped_, "bytes"), -[NSData length](self->sessionKeyPrepped_, "length"), iv, (const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), (void *)objc_msgSend(v5, "mutableBytes"), objc_msgSend(v5, "length"), &v16);
    if ((_DWORD)v6)
    {
      v7 = v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        {
          v15 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          v20 = v8;
          v21 = 2080;
          v22 = "-[CDXClientSession encrypt:]";
          v23 = 1024;
          v24 = 531;
          v25 = 2080;
          v26 = v15;
          v27 = 1024;
          v28 = v7;
          _os_log_error_impl(&dword_215C5C000, v9, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %s: Encryption failed: CCCrypt() returned error %d", buf, 0x2Cu);
        }
      }
      v10 = -[CDXClientSession CDXClient](self, "CDXClient");
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD1100];
      v17[0] = *MEMORY[0x24BDD0FC8];
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Encryption failed. (CCCrypt error %d)"), v7);
      v17[1] = CFSTR("CDXTicket");
      v18[0] = v13;
      v18[1] = -[CDXClientSession ticket](self, "ticket");
      -[CDXClient setError:](v10, "setError:", objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, (int)v7, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2)));
      return 0;
    }
    else
    {
      objc_msgSend(v5, "setLength:", v16);
      return v5;
    }
  }
  return v3;
}

- (BOOL)sendRaw:(id)a3 toParticipants:(id)a4
{
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  _BYTE *v13;
  int v14;
  size_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  CDXClientSession *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v8 = -[CDXClientSession encrypt:](self, "encrypt:", a3);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, "appendData:", self->ticket_);
    if (a4)
    {
      v10 = objc_msgSend(v7, "mutableBytes");
      v11 = (void *)(v10 + objc_msgSend(v7, "length"));
      v12 = -[NSData CDXTicketPCNT](self->ticket_, "CDXTicketPCNT");
      v13 = (_BYTE *)objc_msgSend(v7, "mutableCDXTicket");
      *v13 |= 2u;
      v14 = v12 + 7;
      if (v12 < -7)
        v14 = v12 + 14;
      v15 = (uint64_t)v14 >> 3;
      objc_msgSend(v7, "increaseLengthBy:", v15);
      bzero(v11, v15);
      if (v12 >= 1)
      {
        for (i = 0; i != v12; ++i)
        {
          if (objc_msgSend(a4, "containsIndex:", i))
            *((_BYTE *)v11 + (i >> 3)) |= 0x80u >> (i & 7);
        }
      }
    }
    objc_msgSend(v7, "appendData:", v9);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x24BDFDC28];
      v19 = *MEMORY[0x24BDFDC28];
      if (*MEMORY[0x24BDFDC18])
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 136315906;
          v26 = v17;
          v27 = 2080;
          v28 = "-[CDXClientSession sendRaw:toParticipants:]";
          v29 = 1024;
          v30 = 583;
          v31 = 2048;
          v32 = objc_msgSend(v7, "length");
          _os_log_impl(&dword_215C5C000, v18, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d packet length before CDXClientSession sendData. length=%lu", (uint8_t *)&v25, 0x26u);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[CDXClientSession sendRaw:toParticipants:].cold.2();
      }
    }
    if ((unint64_t)objc_msgSend(v7, "length") >= 0x5DC)
    {
      if ((CDXClientSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
            -[CDXClientSession sendRaw:toParticipants:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v20 = (const __CFString *)-[CDXClientSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v20 = &stru_24D466D90;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x24BDFDC28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          {
            v23 = objc_msgSend(v7, "length");
            v25 = 136316674;
            v26 = v21;
            v27 = 2080;
            v28 = "-[CDXClientSession sendRaw:toParticipants:]";
            v29 = 1024;
            v30 = 585;
            v31 = 2112;
            v32 = (uint64_t)v20;
            v33 = 2048;
            v34 = self;
            v35 = 2048;
            v36 = v23;
            v37 = 1024;
            v38 = 1500;
            _os_log_error_impl(&dword_215C5C000, v22, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) packet length is over kCDXMTU_SIZE when CDXClientSession sendData. length=%lu. Data will not be sent! kCDXMTU_SIZE=%d", (uint8_t *)&v25, 0x40u);
          }
        }
      }
    }
    LOBYTE(v8) = (unint64_t)objc_msgSend(v7, "length") <= 0x5DB
              && -[CDXClient sendRaw:](self->CDXClient_, "sendRaw:", v7);
  }
  return (char)v8;
}

- (BOOL)sendData:(id)a3
{
  return -[CDXClientSession sendData:toParticipants:](self, "sendData:toParticipants:", a3, 0);
}

- (BOOL)sendData:(id)a3 toParticipants:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned __int16 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  unsigned __int16 *ack;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSData *v24;
  NSMutableIndexSet *participantsInFlight;
  NSMutableIndexSet *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  _BYTE v41[18];
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
LABEL_40:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (a4)
  {
    v7 = objc_msgSend(a4, "count");
    if (!v7)
      return v7;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  objc_msgSend(v8, "increaseLengthBy:", 8);
  objc_msgSend(v8, "appendData:", a3);
  v9 = objc_msgSend(v8, "mutableBytes");
  *(_WORD *)v9 = 512;
  v10 = self->seq_ + 1;
  self->seq_ = v10;
  *(_DWORD *)(v9 + 4) = v10;
  *(_WORD *)(v9 + 2) = bswap32(objc_msgSend(v8, "length") - 8) >> 16;
  if (!a4)
    self->ack_[self->pid_] = self->seq_;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v32 = 136315650;
      v33 = v11;
      v34 = 2080;
      v35 = "-[CDXClientSession sendData:toParticipants:]";
      v36 = 1024;
      v37 = 626;
      _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d send-data", (uint8_t *)&v32, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x24BDFDC28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
      v16 = *(unsigned __int16 *)(v9 + 4);
      if (a4)
        v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v17 = "everyone-who-isn't-me";
      v32 = 136316418;
      v33 = v13;
      v34 = 2080;
      v35 = "-[CDXClientSession sendData:toParticipants:]";
      v36 = 1024;
      v37 = 628;
      v38 = 2080;
      v39 = v15;
      v40 = 1024;
      *(_DWORD *)v41 = v16;
      *(_WORD *)&v41[4] = 2080;
      *(_QWORD *)&v41[6] = v17;
      _os_log_impl(&dword_215C5C000, v14, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Sending out packet seq=%d. toParticipants:%s", (uint8_t *)&v32, 0x36u);
    }
  }
  if (objc_msgSend(a4, "count") == 1)
  {
    v18 = objc_msgSend(a4, "firstIndex");
    if (v18 < -[NSData CDXTicketPCNT](self->ticket_, "CDXTicketPCNT"))
    {
      *(_BYTE *)(v9 + 1) |= 1u;
      ack = self->ack_;
      *(_WORD *)(v9 + 6) = ack[objc_msgSend(a4, "firstIndex")];
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x24BDFDC28];
    v22 = *MEMORY[0x24BDFDC28];
    if (*MEMORY[0x24BDFDC18])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(v8, "length");
        v32 = 136315906;
        v33 = v20;
        v34 = 2080;
        v35 = "-[CDXClientSession sendData:toParticipants:]";
        v36 = 1024;
        v37 = 637;
        v38 = 2048;
        v39 = v23;
        _os_log_impl(&dword_215C5C000, v21, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d data length before CDXClient sendData. length=%lu", (uint8_t *)&v32, 0x26u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[CDXClientSession sendData:toParticipants:].cold.2();
    }
  }
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x5DC)
  {
    if ((CDXClientSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v7)
          return v7;
        -[CDXClientSession sendData:toParticipants:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)-[CDXClientSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v27 = &stru_24D466D90;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x24BDFDC28];
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v7)
          return v7;
        v30 = objc_msgSend(v8, "length");
        v32 = 136316674;
        v33 = v28;
        v34 = 2080;
        v35 = "-[CDXClientSession sendData:toParticipants:]";
        v36 = 1024;
        v37 = 638;
        v38 = 2112;
        v39 = (uint64_t)v27;
        v40 = 2048;
        *(_QWORD *)v41 = self;
        *(_WORD *)&v41[8] = 2048;
        *(_QWORD *)&v41[10] = v30;
        v42 = 1024;
        v43 = 1500;
        _os_log_error_impl(&dword_215C5C000, v29, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) MTU LIMIT HIT! data length is over kCDXMTU_SIZE while CDXClient sendData. length=%lu. Data will not be sent. kCDXMTU_SIZE=%d", (uint8_t *)&v32, 0x40u);
      }
    }
    goto LABEL_40;
  }
  v24 = self->lastSent_;
  self->lastSent_ = (NSData *)objc_msgSend(v8, "copyWithZone:", -[CDXClientSession zone](self, "zone"));
  -[CDXClientSession resetRetransmitTimer](self, "resetRetransmitTimer");
  participantsInFlight = self->participantsInFlight_;
  if (a4)
    v26 = (NSMutableIndexSet *)objc_msgSend(a4, "mutableCopyWithZone:", -[CDXClientSession zone](self, "zone"));
  else
    v26 = (NSMutableIndexSet *)(id)objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, -[NSData CDXTicketPCNT](self->ticket_, "CDXTicketPCNT"));
  self->participantsInFlight_ = v26;

  LOBYTE(v7) = -[CDXClientSession sendRaw:toParticipants:](self, "sendRaw:toParticipants:", v8, a4);
  return v7;
}

- (void)recvRaw:(id)a3 ticket:(id)a4
{
  unsigned __int8 v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  const char *Name;
  int v20;
  int seq;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  unint64_t v26;
  unsigned int v27;
  unsigned __int16 *ack;
  uint64_t v29;
  void (**inboundHandler)(id, _QWORD, void *);
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unsigned __int16 v46;
  unsigned __int16 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  _BYTE v57[10];
  int v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = objc_msgSend(a4, "CDXTicketPID");
  v9 = -[CDXClientSession decrypt:ticket:](self, "decrypt:ticket:", a3, a4);
  if (v9)
  {
    v10 = v9;
    if ((unint64_t)objc_msgSend(v9, "length") >= 8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x24BDFDC28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
        {
          if (self)
            v13 = (const char *)objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          else
            v13 = "<nil>";
          *(_DWORD *)buf = 136316674;
          v49 = v11;
          v50 = 2080;
          v51 = "-[CDXClientSession recvRaw:ticket:]";
          v52 = 1024;
          v53 = 671;
          v54 = 2080;
          v55 = (uint64_t)v13;
          v56 = 2080;
          *(_QWORD *)v57 = sel_getName(a2);
          *(_WORD *)&v57[8] = 1024;
          v58 = v8;
          v59 = 2080;
          v60 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
          _os_log_impl(&dword_215C5C000, v12, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s PID=%d, %s", buf, 0x40u);
        }
      }
      v14 = (_BYTE *)objc_msgSend(v10, "bytes");
      if (!*v14)
      {
        v15 = v14;
        if ((v14[1] & 1) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              if (self)
                v18 = (const char *)objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
              else
                v18 = "<nil>";
              Name = sel_getName(a2);
              v20 = *((unsigned __int16 *)v15 + 3);
              seq = self->seq_;
              *(_DWORD *)buf = 136316674;
              v49 = v16;
              v50 = 2080;
              v51 = "-[CDXClientSession recvRaw:ticket:]";
              v52 = 1024;
              v53 = 679;
              v54 = 2080;
              v55 = (uint64_t)v18;
              v56 = 2080;
              *(_QWORD *)v57 = Name;
              *(_WORD *)&v57[8] = 1024;
              v58 = v20;
              v59 = 1024;
              LODWORD(v60) = seq;
              _os_log_impl(&dword_215C5C000, v17, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s  Received ACK. header->ack=%d, seq_=%d", buf, 0x3Cu);
            }
          }
          if (*((unsigned __int16 *)v15 + 3) == self->seq_)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v22 = VRTraceErrorLogLevelToCSTR();
              v23 = *MEMORY[0x24BDFDC28];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
              {
                v24 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                v25 = sel_getName(a2);
                *(_DWORD *)buf = 136316418;
                v49 = v22;
                v50 = 2080;
                v51 = "-[CDXClientSession recvRaw:ticket:]";
                v52 = 1024;
                v53 = 681;
                v54 = 2080;
                v55 = v24;
                v56 = 2080;
                *(_QWORD *)v57 = v25;
                *(_WORD *)&v57[8] = 1024;
                v58 = v8;
                _os_log_impl(&dword_215C5C000, v23, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s Removing %d from in-flight list", buf, 0x36u);
              }
            }
            -[NSMutableIndexSet removeIndex:](self->participantsInFlight_, "removeIndex:", v8);
            if (!-[NSMutableIndexSet count](self->participantsInFlight_, "count"))
              -[CDXClientSession stopRetransmitTimer](self, "stopRetransmitTimer");
          }
        }
        if ((v15[1] & 2) != 0)
        {
          v26 = (bswap32(*((unsigned __int16 *)v15 + 1)) >> 16) + 8;
          if (v26 <= objc_msgSend(v10, "length"))
          {
            v27 = *((unsigned __int16 *)v15 + 2);
            ack = self->ack_;
            v29 = v8;
            if (v27 <= ack[v8])
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                v35 = VRTraceErrorLogLevelToCSTR();
                v36 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v37 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  v38 = *((unsigned __int16 *)v15 + 2);
                  *(_DWORD *)buf = 136316418;
                  v49 = v35;
                  v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  v52 = 1024;
                  v53 = 705;
                  v54 = 2080;
                  v55 = v37;
                  v56 = 1024;
                  *(_DWORD *)v57 = v38;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v8;
                  _os_log_impl(&dword_215C5C000, v36, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Received DUPLICATE packet %d from participant %d.", buf, 0x32u);
                }
              }
            }
            else
            {
              ack[v8] = v27;
              inboundHandler = (void (**)(id, _QWORD, void *))self->inboundHandler_;
              if (inboundHandler)
                inboundHandler[2](inboundHandler, v8, v10);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                v31 = VRTraceErrorLogLevelToCSTR();
                v32 = *MEMORY[0x24BDFDC28];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
                {
                  v33 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  v34 = *((unsigned __int16 *)v15 + 2);
                  *(_DWORD *)buf = 136316418;
                  v49 = v31;
                  v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  v52 = 1024;
                  v53 = 702;
                  v54 = 2080;
                  v55 = v33;
                  v56 = 1024;
                  *(_DWORD *)v57 = v34;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v8;
                  _os_log_impl(&dword_215C5C000, v32, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Received packet %d from participant %d.", buf, 0x32u);
                }
              }
              -[CDXClientSessionDelegate CDXClientSession:receivedData:from:](self->delegate_, "CDXClientSession:receivedData:from:", self, objc_msgSend(v10, "subdataWithRange:", 8, objc_msgSend(v10, "length") - 8), v8);
            }
            v45 = 256;
            v46 = self->seq_;
            v47 = self->ack_[v8];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              v39 = VRTraceErrorLogLevelToCSTR();
              v40 = *MEMORY[0x24BDFDC28];
              v41 = *MEMORY[0x24BDFDC28];
              if (*MEMORY[0x24BDFDC18])
              {
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  v42 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  *(_DWORD *)buf = 136316162;
                  v49 = v39;
                  v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  v52 = 1024;
                  v53 = 714;
                  v54 = 2080;
                  v55 = v42;
                  v56 = 1024;
                  *(_DWORD *)v57 = v8;
                  _os_log_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Sending ACK to %d.", buf, 0x2Cu);
                }
              }
              else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                v44 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                *(_DWORD *)buf = 136316162;
                v49 = v39;
                v50 = 2080;
                v51 = "-[CDXClientSession recvRaw:ticket:]";
                v52 = 1024;
                v53 = 714;
                v54 = 2080;
                v55 = v44;
                v56 = 1024;
                *(_DWORD *)v57 = v8;
                _os_log_debug_impl(&dword_215C5C000, v40, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d %s: Sending ACK to %d.", buf, 0x2Cu);
              }
            }
            v43 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", &v45, 8, 0);
            -[CDXClientSession sendRaw:toParticipants:](self, "sendRaw:toParticipants:", v43, objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v29));
          }
        }
      }
    }
  }
}

- (CDXClient)CDXClient
{
  return self->CDXClient_;
}

- (CDXClientSessionDelegate)delegate
{
  return self->delegate_;
}

- (void)setDelegate:(id)a3
{
  self->delegate_ = (CDXClientSessionDelegate *)a3;
}

- (NSData)ticket
{
  return self->ticket_;
}

- (NSData)sessionKey
{
  return self->sessionKey_;
}

- (NSIndexSet)participantsInFlight
{
  return &self->participantsInFlight_->super;
}

- (id)inboundHandler
{
  return self->inboundHandler_;
}

- (void)setInboundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)retransmitEvent
{
  __int16 v1;
  int v2;
  os_log_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  OUTLINED_FUNCTION_4();
  v7 = 338;
  v8 = v1;
  v9 = v2;
  _os_log_debug_impl(&dword_215C5C000, v3, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d retransmitAttempts = %d", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_12();
}

- (void)sendRaw:toParticipants:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d packet length is over kCDXMTU_SIZE when CDXClientSession sendData. length=%lu. Data will not be sent! kCDXMTU_SIZE=%d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_14();
}

- (void)sendRaw:toParticipants:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d packet length before CDXClientSession sendData. length=%lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

- (void)sendData:toParticipants:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d MTU LIMIT HIT! data length is over kCDXMTU_SIZE while CDXClient sendData. length=%lu. Data will not be sent. kCDXMTU_SIZE=%d", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_14();
}

- (void)sendData:toParticipants:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9(v0, *MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_0_0(&dword_215C5C000, v1, v2, "CDXClient [%s] %s:%d data length before CDXClient sendData. length=%lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2();
}

@end
