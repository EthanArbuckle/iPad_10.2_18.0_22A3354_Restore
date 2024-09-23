@implementation SimplePing

- (SimplePing)initWithHostName:(id)a3
{
  id v4;
  SimplePing *v5;
  uint64_t v6;
  NSString *hostName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SimplePing;
  v5 = -[SimplePing init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hostName = v5->_hostName;
    v5->_hostName = (NSString *)v6;

    v5->_identifier = arc4random();
  }

  return v5;
}

- (void)dealloc
{
  __assert_rtn("-[SimplePing dealloc]", "SimplePing.m", 144, "self->_host == NULL");
}

- (unsigned)hostAddressFamily
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  unsigned __int8 v8;

  -[SimplePing hostAddress](self, "hostAddress");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[SimplePing hostAddress](self, "hostAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6 < 0x10)
    return 0;
  -[SimplePing hostAddress](self, "hostAddress");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = *(_BYTE *)(objc_msgSend(v7, "bytes") + 1);

  return v8;
}

- (void)didFailWithError:(id)a3
{
  SimplePing *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
    -[SimplePing didFailWithError:].cold.1();
  v4 = self;
  CFAutorelease(v4);
  -[SimplePing stop](v4, "stop");
  -[SimplePing delegate](v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "simplePing:didFailWithError:", v4, v6);

}

- (void)didFailWithHostStreamError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3.var0 == *MEMORY[0x24BDB76D8])
  {
    v7 = *MEMORY[0x24BDB7688];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3.var1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB7680], 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SimplePing didFailWithError:](self, "didFailWithError:", v6);

}

- (id)pingPacketWithType:(unsigned __int8)a3 payload:(id)a4 requiresChecksum:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  unsigned __int16 *v14;
  unint64_t v15;
  int v16;
  int v17;

  v5 = a5;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v8, "length") + 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    -[SimplePing pingPacketWithType:payload:requiresChecksum:].cold.1();
  v10 = objc_retainAutorelease(v9);
  v11 = objc_msgSend(v10, "mutableBytes");
  *(_BYTE *)v11 = a3;
  *(_BYTE *)(v11 + 1) = 0;
  *(_WORD *)(v11 + 2) = 0;
  *(_WORD *)(v11 + 4) = __rev16(-[SimplePing identifier](self, "identifier"));
  *(_WORD *)(v11 + 6) = __rev16(-[SimplePing nextSequenceNumber](self, "nextSequenceNumber"));
  v12 = objc_retainAutorelease(v8);
  memcpy((void *)(v11 + 8), (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  if (v5)
  {
    v13 = objc_retainAutorelease(v10);
    v14 = (unsigned __int16 *)objc_msgSend(v13, "bytes");
    v15 = objc_msgSend(v13, "length");
    if (v15 < 2)
    {
      v16 = 0;
      if (!v15)
        goto LABEL_8;
    }
    else
    {
      v16 = 0;
      do
      {
        v17 = *v14++;
        v16 += v17;
        v15 -= 2;
      }
      while (v15 > 1);
      if (!v15)
        goto LABEL_8;
    }
    v16 += *(unsigned __int8 *)v14;
LABEL_8:
    *(_WORD *)(v11 + 2) = ~(HIWORD(v16) + v16 + (((v16 >> 16) + (unsigned __int16)v16) >> 16));
  }

  return v10;
}

- (void)setupTimer:(id)a3 currentSequenceNumber:(unsigned __int16)a4
{
  id v6;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  dispatch_time_t v15;
  _QWORD handler[5];
  id v17;
  unsigned __int16 v18;

  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v7);
  timeoutTimer = self->timeoutTimer;
  self->timeoutTimer = v8;

  v10 = self->timeoutTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __47__SimplePing_setupTimer_currentSequenceNumber___block_invoke;
  handler[3] = &unk_24C991668;
  handler[4] = self;
  v11 = v6;
  v17 = v11;
  v18 = a4;
  dispatch_source_set_event_handler(v10, handler);
  -[SimplePing hostAddress](self, "hostAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->timeoutTimer;
  if (v12)
    v14 = 1000000000;
  else
    v14 = 5000000000;
  v15 = dispatch_time(0, v14);
  dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_cancel_handler((dispatch_source_t)self->timeoutTimer, &__block_literal_global_2);

}

uint64_t __47__SimplePing_setupTimer_currentSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  if (v3 && !dispatch_source_testcancel(*(dispatch_source_t *)(v2 + 8)))
  {
    dispatch_source_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 8);
  }
  *(_QWORD *)(v2 + 8) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "timeOutHandler:sequenceNumber:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48));
}

- (void)sendPingWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  int v9;
  SimplePing *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CFSocketNativeHandle Native;
  id v16;
  const void *v17;
  size_t v18;
  id v19;
  const sockaddr *v20;
  void *v21;
  ssize_t v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  _QWORD v27[2];

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = -[SimplePing nextSequenceNumber](self, "nextSequenceNumber");
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%28zd bottles of beer on the wall"), (unsigned __int16)(100 * (v7 / 0x64u) - v7 + 99));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataUsingEncoding:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[SimplePing sendPingWithData:].cold.1();
    if (objc_msgSend(v5, "length") != 56)
      -[SimplePing sendPingWithData:].cold.4();
  }
  v9 = -[SimplePing hostAddressFamily](self, "hostAddressFamily");
  if (v9 == 30)
  {
    v10 = self;
    v11 = 128;
    v12 = v5;
    v13 = 0;
  }
  else
  {
    if (v9 != 2)
      -[SimplePing sendPingWithData:].cold.2();
    v10 = self;
    v11 = 8;
    v12 = v5;
    v13 = 1;
  }
  -[SimplePing pingPacketWithType:payload:requiresChecksum:](v10, "pingPacketWithType:payload:requiresChecksum:", v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    -[SimplePing sendPingWithData:].cold.3();
  if (-[SimplePing socket](self, "socket"))
  {
    Native = CFSocketGetNative(self->_socket);
    v27[0] = 0;
    v27[1] = 1000000;
    setsockopt(Native, 0xFFFF, 4101, v27, 0x10u);
    v16 = objc_retainAutorelease(v14);
    v17 = (const void *)objc_msgSend(v16, "bytes");
    v18 = objc_msgSend(v16, "length");
    -[SimplePing hostAddress](self, "hostAddress");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const sockaddr *)objc_msgSend(v19, "bytes");
    -[SimplePing hostAddress](self, "hostAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = sendto(Native, v17, v18, 0, v20, objc_msgSend(v21, "length"));

    v23 = 0;
    if (v22 < 0)
      v23 = *__error();
  }
  else
  {
    v23 = 9;
    v22 = -1;
  }
  -[SimplePing delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 >= 1 && v22 == objc_msgSend(v14, "length"))
  {
    -[SimplePing setupTimer:currentSequenceNumber:](self, "setupTimer:currentSequenceNumber:", v4, self->_nextSequenceNumber);
    dispatch_activate((dispatch_object_t)self->timeoutTimer);
    if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "simplePing:didSendPacket:sequenceNumber:", self, v14, -[SimplePing nextSequenceNumber](self, "nextSequenceNumber"));
  }
  else
  {
    if (v23)
      v25 = v23;
    else
      v25 = 55;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "simplePing:didFailToSendPacket:sequenceNumber:error:", self, v14, -[SimplePing nextSequenceNumber](self, "nextSequenceNumber"), v26);

  }
  -[SimplePing setNextSequenceNumber:](self, "setNextSequenceNumber:", (unsigned __int16)(-[SimplePing nextSequenceNumber](self, "nextSequenceNumber") + 1));
  if (!-[SimplePing nextSequenceNumber](self, "nextSequenceNumber"))
    -[SimplePing setNextSequenceNumberHasWrapped:](self, "setNextSequenceNumberHasWrapped:", 1);

}

- (void)timeOutHandler:(id)a3 sequenceNumber:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ping timed out"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SimplePing hostAddress](self, "hostAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ping host resolution timed out"));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  objc_msgSend(v7, "setValue:forKey:", v6, *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.NPTKit"), 1, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SimplePing delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "simplePing:didTimeOut:sequenceNumber:error:", self, v12, v4, v10);

}

+ (unint64_t)icmpHeaderOffsetInIPv4Packet:(id)a3
{
  id v3;
  id v4;
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x1C
    && (v4 = objc_retainAutorelease(v3), v5 = (_BYTE *)objc_msgSend(v4, "bytes"), (*v5 & 0xF0) == 0x40))
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5[9] == 1)
    {
      v7 = 4 * (*v5 & 0xF);
      if (objc_msgSend(v4, "length") >= (unint64_t)(v7 + 8))
        v6 = v7;
    }
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)validateSequenceNumber:(unsigned __int16)a3
{
  unsigned int v3;
  _BOOL4 v5;
  unsigned int v6;

  v3 = a3;
  v5 = -[SimplePing nextSequenceNumberHasWrapped](self, "nextSequenceNumberHasWrapped");
  v6 = -[SimplePing nextSequenceNumber](self, "nextSequenceNumber");
  if (v5)
    return (unsigned __int16)(v6 - v3) < 0x78u;
  else
    return v6 > v3;
}

- (BOOL)validatePing4ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned __int16 *v10;
  int v11;
  unint64_t v12;
  int v13;
  unsigned __int16 *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  BOOL v18;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "icmpHeaderOffsetInIPv4Packet:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_13;
  v8 = v7;
  v9 = objc_retainAutorelease(v6);
  v10 = (unsigned __int16 *)(objc_msgSend(v9, "mutableBytes") + v8);
  v11 = v10[1];
  v10[1] = 0;
  v12 = objc_msgSend(v9, "length") - v8;
  if (v12 < 2)
  {
    v13 = 0;
    v14 = v10;
    if (!v12)
      goto LABEL_7;
    goto LABEL_6;
  }
  v13 = 0;
  v14 = v10;
  do
  {
    v15 = *v14++;
    v13 += v15;
    v12 -= 2;
  }
  while (v12 > 1);
  if (v12)
LABEL_6:
    v13 += *(unsigned __int8 *)v14;
LABEL_7:
  v10[1] = v11;
  if (v11 != (unsigned __int16)~(HIWORD(v13) + v13 + (((v13 >> 16) + (unsigned __int16)v13) >> 16))
    || *(_BYTE *)v10
    || *((_BYTE *)v10 + 1)
    || (v16 = bswap32(v10[2]), -[SimplePing identifier](self, "identifier") != HIWORD(v16))
    || (v17 = bswap32(v10[3]) >> 16, !-[SimplePing validateSequenceNumber:](self, "validateSequenceNumber:", v17)))
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v9, "replaceBytesInRange:withBytes:length:", 0, v8, 0, 0);
  *a4 = v17;
  v18 = 1;
LABEL_14:

  return v18;
}

- (BOOL)validatePing6ResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") >= 8
    && (v7 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), *v7 == 129)
    && (v8 = v7, !v7[1])
    && (v9 = bswap32(*((unsigned __int16 *)v7 + 2)), -[SimplePing identifier](self, "identifier") == HIWORD(v9))
    && (v10 = bswap32(*((unsigned __int16 *)v8 + 3)) >> 16,
        -[SimplePing validateSequenceNumber:](self, "validateSequenceNumber:", v10)))
  {
    *a4 = v10;
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)validatePingResponsePacket:(id)a3 sequenceNumber:(unsigned __int16 *)a4
{
  id v6;
  int v7;
  BOOL v8;
  BOOL v9;

  v6 = a3;
  v7 = -[SimplePing hostAddressFamily](self, "hostAddressFamily");
  if (v7 == 30)
  {
    v8 = -[SimplePing validatePing6ResponsePacket:sequenceNumber:](self, "validatePing6ResponsePacket:sequenceNumber:", v6, a4);
  }
  else
  {
    if (v7 != 2)
      -[SimplePing validatePingResponsePacket:sequenceNumber:].cold.1();
    v8 = -[SimplePing validatePing4ResponsePacket:sequenceNumber:](self, "validatePing4ResponsePacket:sequenceNumber:", v6, a4);
  }
  v9 = v8;

  return v9;
}

- (void)readData
{
  __assert_rtn("-[SimplePing readData]", "SimplePing.m", 576, "packet != nil");
}

- (void)startWithHostAddress
{
  __assert_rtn("-[SimplePing startWithHostAddress]", "SimplePing.m", 689, "rls != NULL");
}

- (void)hostResolutionDone
{
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  Boolean hasBeenResolved;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  hasBeenResolved = 0;
  CFHostGetAddressing(-[SimplePing host](self, "host"), &hasBeenResolved);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (hasBeenResolved)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    hasBeenResolved = 0;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i));
          v12 = objc_msgSend(v11, "bytes", (_QWORD)v15);
          if ((unint64_t)objc_msgSend(v11, "length") >= 0x10)
          {
            v13 = *(unsigned __int8 *)(v12 + 1);
            if (v13 == 30)
            {
              if (-[SimplePing addressStyle](self, "addressStyle") != 1)
                goto LABEL_20;
            }
            else if (v13 == 2 && -[SimplePing addressStyle](self, "addressStyle") != 2)
            {
LABEL_20:
              -[SimplePing setHostAddress:](self, "setHostAddress:", v11);
              hasBeenResolved = 1;
              goto LABEL_21;
            }
          }
          if (hasBeenResolved)
            goto LABEL_21;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_21:

  }
  -[SimplePing stopHostResolution](self, "stopHostResolution", (_QWORD)v15);
  if (hasBeenResolved)
  {
    -[SimplePing startWithHostAddress](self, "startWithHostAddress");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB7680], 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SimplePing didFailWithError:](self, "didFailWithError:", v14);

  }
}

- (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__SimplePing_start__block_invoke;
  block[3] = &unk_24C990F78;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __19__SimplePing_start__block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  CFHostRef v4;
  __CFHost *v5;
  __CFRunLoop *Current;
  CFStreamError v7;
  CFHostClientContext clientContext;

  memset(&clientContext, 0, sizeof(clientContext));
  clientContext.info = *(void **)(a1 + 32);
  objc_msgSend(clientContext.info, "hostAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else if (!objc_msgSend(*(id *)(a1 + 32), "host"))
  {
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "stop");
LABEL_5:
  if (objc_msgSend(*(id *)(a1 + 32), "host"))
    __19__SimplePing_start__block_invoke_cold_3();
  objc_msgSend(*(id *)(a1 + 32), "hostAddress");
  if (objc_claimAutoreleasedReturnValue())
    __19__SimplePing_start__block_invoke_cold_2();
  objc_msgSend(*(id *)(a1 + 32), "hostName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = CFHostCreateWithName(0, v3);
  objc_msgSend(*(id *)(a1 + 32), "setHost:", CFAutorelease(v4));

  if (!objc_msgSend(*(id *)(a1 + 32), "host"))
    __19__SimplePing_start__block_invoke_cold_1();
  v7.domain = 0;
  *(_QWORD *)&v7.error = 0;
  CFHostSetClient((CFHostRef)objc_msgSend(*(id *)(a1 + 32), "host"), (CFHostClientCallBack)HostResolveCallback, &clientContext);
  v5 = (__CFHost *)objc_msgSend(*(id *)(a1 + 32), "host");
  Current = CFRunLoopGetCurrent();
  CFHostScheduleWithRunLoop(v5, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  if (!CFHostStartInfoResolution((CFHostRef)objc_msgSend(*(id *)(a1 + 32), "host"), kCFHostAddresses, &v7))
    objc_msgSend(*(id *)(a1 + 32), "didFailWithHostStreamError:", v7.domain, *(_QWORD *)&v7.error);
  objc_msgSend(*(id *)(a1 + 32), "setupTimer:currentSequenceNumber:", 0, 0);
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)stopHostResolution
{
  __CFHost *v3;
  __CFRunLoop *Current;

  if (-[SimplePing host](self, "host"))
  {
    CFHostSetClient(-[SimplePing host](self, "host"), 0, 0);
    v3 = -[SimplePing host](self, "host");
    Current = CFRunLoopGetCurrent();
    CFHostUnscheduleFromRunLoop(v3, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
    -[SimplePing setHost:](self, "setHost:", 0);
  }
}

- (void)stopSocket
{
  if (-[SimplePing socket](self, "socket"))
  {
    CFSocketInvalidate(-[SimplePing socket](self, "socket"));
    -[SimplePing setSocket:](self, "setSocket:", 0);
  }
}

- (void)stop
{
  NSObject *timeoutTimer;

  timeoutTimer = self->timeoutTimer;
  if (timeoutTimer && !dispatch_source_testcancel((dispatch_source_t)self->timeoutTimer))
    dispatch_source_cancel(timeoutTimer);
  -[SimplePing stopHostResolution](self, "stopHostResolution");
  -[SimplePing stopSocket](self, "stopSocket");
  -[SimplePing setHostAddress:](self, "setHostAddress:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SimplePing *v4;
  void *v5;
  SimplePing *v6;

  v4 = +[SimplePing allocWithZone:](SimplePing, "allocWithZone:", a3);
  -[SimplePing hostName](self, "hostName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SimplePing initWithHostName:](v4, "initWithHostName:", v5);

  -[SimplePing setAddressStyle:](v6, "setAddressStyle:", -[SimplePing addressStyle](self, "addressStyle"));
  return v6;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (SimplePingDelegate)delegate
{
  return (SimplePingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)addressStyle
{
  return self->_addressStyle;
}

- (void)setAddressStyle:(int64_t)a3
{
  self->_addressStyle = a3;
}

- (NSData)hostAddress
{
  return self->_hostAddress;
}

- (void)setHostAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (unsigned)nextSequenceNumber
{
  return self->_nextSequenceNumber;
}

- (void)setNextSequenceNumber:(unsigned __int16)a3
{
  self->_nextSequenceNumber = a3;
}

- (BOOL)nextSequenceNumberHasWrapped
{
  return self->_nextSequenceNumberHasWrapped;
}

- (void)setNextSequenceNumberHasWrapped:(BOOL)a3
{
  self->_nextSequenceNumberHasWrapped = a3;
}

- (__CFHost)host
{
  return self->_host;
}

- (void)setHost:(__CFHost *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (__CFSocket)socket
{
  return self->_socket;
}

- (void)setSocket:(__CFSocket *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->timeoutTimer, 0);
}

- (void)didFailWithError:.cold.1()
{
  __assert_rtn("-[SimplePing didFailWithError:]", "SimplePing.m", 165, "error != nil");
}

- (void)pingPacketWithType:payload:requiresChecksum:.cold.1()
{
  __assert_rtn("-[SimplePing pingPacketWithType:payload:requiresChecksum:]", "SimplePing.m", 214, "packet != nil");
}

- (void)sendPingWithData:.cold.1()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 270, "payload != nil");
}

- (void)sendPingWithData:.cold.2()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 286, "NO");
}

- (void)sendPingWithData:.cold.3()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 289, "packet != nil");
}

- (void)sendPingWithData:.cold.4()
{
  __assert_rtn("-[SimplePing sendPingWithData:]", "SimplePing.m", 275, "[payload length] == 56");
}

- (void)validatePingResponsePacket:sequenceNumber:.cold.1()
{
  __assert_rtn("-[SimplePing validatePingResponsePacket:sequenceNumber:]", "SimplePing.m", 527, "NO");
}

void __19__SimplePing_start__block_invoke_cold_1()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 805, "self.host != NULL");
}

void __19__SimplePing_start__block_invoke_cold_2()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 802, "self.hostAddress == nil");
}

void __19__SimplePing_start__block_invoke_cold_3()
{
  __assert_rtn("-[SimplePing start]_block_invoke", "SimplePing.m", 801, "self.host == NULL");
}

@end
