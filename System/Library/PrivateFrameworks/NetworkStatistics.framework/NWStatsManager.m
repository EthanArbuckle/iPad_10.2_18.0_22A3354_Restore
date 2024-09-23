@implementation NWStatsManager

- (void)_sendMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  NSObject *v7;
  void *v8;

  -[NWStatsManager clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[NWStatsManager readSource](self, "readSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    a3->length = a4;
    a3->flags |= 1u;
    if (self->_interfaceTraceFd >= 1 && self->_iftracebuf)
      -[NWStatsManager _traceMemoryBuf:length:tag:](self, "_traceMemoryBuf:length:tag:", a3, a4, "Output");
    if (send(-[NWStatsManager sockfd](self, "sockfd"), a3, a4, 0) != a4)
    {
      if (a3->context)
        -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
    }
  }
}

- (void)_handleReads:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  int64_t v7;
  ssize_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  unint64_t v12;

  v5 = (void *)MEMORY[0x212BD9F2C](self, a2);
  v6 = 0;
  if (a3 <= 1)
    v7 = 1;
  else
    v7 = a3;
  do
  {
    v8 = recv(-[NWStatsManager sockfd](self, "sockfd"), -[NWStatsManager readBuffer](self, "readBuffer"), -[NWStatsManager readBufferSize](self, "readBufferSize"), 0);
    if (v8 < 1)
      break;
    v9 = v8;
    v10 = -[NWStatsManager readBuffer](self, "readBuffer");
    if (v9 >= 0x10)
    {
      v11 = v10;
      do
      {
        v12 = *((unsigned __int16 *)v11 + 6);
        if (v12 < 0x10 || (uint64_t)v9 < (uint64_t)v12)
          break;
        if (self->_interfaceTraceFd >= 1 && self->_iftracebuf)
          -[NWStatsManager _traceMemoryBuf:length:tag:](self, "_traceMemoryBuf:length:tag:", v11, *((unsigned __int16 *)v11 + 6), "Input");
        v9 -= v12;
        -[NWStatsManager _handleMessage:length:](self, "_handleMessage:length:", v11, v12);
        v11 += v12;
      }
      while (v9 > 0xF);
    }
    ++v6;
  }
  while (v6 != v7);
  objc_autoreleasePoolPop(v5);
}

- (char)readBuffer
{
  return self->_readBuffer;
}

- (int)sockfd
{
  return self->_sockfd;
}

- (OS_dispatch_source)readSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 584, 1);
}

- (void)_sendUpdateRequestMessage:(unint64_t)a3
{
  NSObject *v5;
  __int128 v6;
  unint64_t v7;

  -[NWStatsManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[NWStatsManager isInvalidated](self, "isInvalidated"))
  {
    v6 = xmmword_211459AD0;
    DWORD2(v6) = 1007;
    v7 = a3;
    -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v6, 24);
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)_handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  NSObject *v7;
  unsigned int type;
  int v9;
  NSObject *v10;
  const char *v11;
  unint64_t currentPollReference;
  void *v13;
  unsigned int v14;
  unint64_t context;
  int flags;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  provider_counts *providerCounts;
  unsigned __int16 v28;
  int v29;
  _QWORD *p_numUpdatesOnClose;
  uint64_t v31;
  uint64_t p_numUpdatesOnEvent;
  uint64_t v33;
  void *v34;
  __objc2_class *v35;
  unsigned __int16 v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void (**v52)(_QWORD, _QWORD);
  _BOOL4 v53;
  id v54;
  uint8_t buf[4];
  int64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[NWStatsManager clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  type = a3->type;
  switch(type)
  {
    case 0x2711u:
      if ((unint64_t)a4 >= 0x20)
      {
        v14 = a3[1].type;
        if (v14 <= 0xA)
        {
          ++self->_providerCounts[v14].numSrcsAdded;
          if (v14 == 6 || self->_eagerInstantiate)
            -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", a3[1].context);
        }
      }
      return;
    case 0x2712u:
      if ((unint64_t)a4 < 0x18)
        return;
      context = a3[1].context;
      flags = a3->flags;
      -[NWStatsManager internalSources](self, "internalSources");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", context);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (flags == 8)
      {
        NStatGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v56 = context;
          v57 = 2112;
          v58 = (uint64_t)v19;
          _os_log_impl(&dword_211429000, v20, OS_LOG_TYPE_ERROR, "NSTAT_MSG_TYPE_SRC_REMOVED received reports drop, source ref %lld source %@", buf, 0x16u);
        }

        -[NWStatsManager _adaptAfterDrop](self, "_adaptAfterDrop");
      }
      if (v19)
      {
        -[NWStatsManager _removeSourceInternal:](self, "_removeSourceInternal:", context);
        if (flags)
        {
          if (flags == 16)
          {
            v21 = 560;
          }
          else
          {
            if (flags != 8)
              goto LABEL_74;
            v21 = 552;
          }
        }
        else
        {
          v21 = 544;
        }
      }
      else if (flags)
      {
        if (flags == 16)
        {
          v21 = 536;
        }
        else
        {
          if (flags != 8)
            goto LABEL_74;
          v21 = 528;
        }
      }
      else
      {
        v21 = 520;
      }
      ++*(Class *)((char *)&self->super.isa + v21);
LABEL_74:

      return;
    case 0x2713u:
    case 0x2715u:
      return;
    case 0x2714u:
      if ((unint64_t)a4 >= 0x90)
        -[NWStatsManager _handleCounts:](self, "_handleCounts:", a3);
      return;
    case 0x2716u:
    case 0x2717u:
      if ((unint64_t)a4 < 0x98)
        return;
      v9 = a3[9].context;
      if ((v9 & 0xFFFFFFFE) != 2)
      {
        switch(v9)
        {
          case 4:
          case 5:
          case 10:
            if ((unint64_t)a4 > 0x1AF)
              goto LABEL_49;
            NStatGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 134218240;
            v56 = a4;
            v57 = 2048;
            v58 = 432;
            v11 = "UDP update message with size %ld below minimum %ld\n";
            goto LABEL_77;
          case 6:
            if ((unint64_t)a4 >= 0x190)
              -[NWStatsManager _noteInterfaceSrcRef:forInterface:threshold:](self, "_noteInterfaceSrcRef:forInterface:threshold:", a3[1].context, LODWORD(a3[10].context), *(_QWORD *)&a3[9].type);
            return;
          case 8:
            if ((unint64_t)a4 > 0x1EF)
              goto LABEL_49;
            NStatGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 134218240;
            v56 = a4;
            v57 = 2048;
            v58 = 496;
            v11 = "QUIC update message with size %ld below minimum %ld\n";
            goto LABEL_77;
          case 9:
            if ((unint64_t)a4 > 0x15F)
              goto LABEL_49;
            NStatGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 134218240;
            v56 = a4;
            v57 = 2048;
            v58 = 352;
            v11 = "Userland connection update message with size %ld below minimum %ld\n";
            goto LABEL_77;
          default:
            NStatGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              goto LABEL_79;
            *(_DWORD *)buf = 67109120;
            LODWORD(v56) = v9;
            v11 = "update message for unknown provider %d\n";
            v22 = v10;
            v23 = 8;
            goto LABEL_78;
        }
      }
      if ((unint64_t)a4 > 0x1EF)
      {
LABEL_49:
        -[NWStatsManager delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3[1].context);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWStatsManager internalSources](self, "internalSources");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v25);
        v54 = (id)objc_claimAutoreleasedReturnValue();

        providerCounts = self->_providerCounts;
        v28 = a3->flags;
        if ((v28 & 4) != 0)
        {
          v53 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnClose;
          v31 = 2;
          v29 = 1;
        }
        else if (a3->context == 1)
        {
          v53 = 0;
          v29 = 0;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnOpen;
          v31 = 1;
        }
        else
        {
          p_numUpdatesOnEvent = (uint64_t)&providerCounts[v9].numUpdatesOnEvent;
          v33 = *(_QWORD *)&a3[1].type;
          p_numUpdatesOnClose = &providerCounts[v9].numUpdatesOnPoll;
          if (v33)
            p_numUpdatesOnClose = (_QWORD *)p_numUpdatesOnEvent;
          v53 = v33 == 0;
          v29 = 1;
          if (v33)
            v31 = 4;
          else
            v31 = 3;
        }
        ++*p_numUpdatesOnClose;
        if (v54)
        {
          if ((v29 & (objc_msgSend(v54, "removing") ^ 1)) == 1)
          {
            -[NWStatsManager statsMonitor](self, "statsMonitor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v54, "updateWithUpdate:length:monitor:", a3, a4, v34) & 1) != 0)
            {

LABEL_68:
              objc_msgSend(v54, "createSnapshot:firstOccurrence:", v31, 0);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if ((a3->flags & 4) == 0)
                goto LABEL_87;
              -[NWStatsManager internalSources](self, "internalSources");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "removeObjectForKey:", v25);
              goto LABEL_86;
            }
            v36 = a3->flags;

            if ((v36 & 4) != 0)
              goto LABEL_68;
          }
          v37 = 0;
        }
        else
        {
          if ((v9 & 0xFFFFFFFE) == 2)
          {
            v35 = NWStatsTCPSource;
          }
          else
          {
            switch(v9)
            {
              case 4:
              case 5:
              case 10:
                v35 = NWStatsUDPSource;
                break;
              case 8:
                v35 = NWStatsQUICSource;
                break;
              case 9:
                v35 = NWStatsConnSource;
                break;
              default:
                -[NWStatsManager _handleMessage:length:].cold.2();
            }
          }
          v39 = [v35 alloc];
          -[NWStatsManager statsMonitor](self, "statsMonitor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (id)objc_msgSend(v39, "initWithUpdate:length:monitor:", a3, a4, v40);

          if (v54)
          {
            objc_msgSend(v54, "createSnapshot:firstOccurrence:", v31, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v28 & 4) != 0)
              goto LABEL_87;
            -[NWStatsManager internalSources](self, "internalSources");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKey:", v54, v25);
LABEL_86:

LABEL_87:
            if (v37)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41 = v37;
                v42 = v41;
                if (self->_trafficDeltaAdjustmentFactor > 0.0)
                  objc_msgSend(v41, "applyTrafficAdjustmentFactor:");
                if (self->_checkNESessionManagerVPNs)
                {
                  v43 = objc_msgSend(v42, "interfaceIndex");
                  +[NWStatsInterfaceRegistry sharedInstance](NWStatsInterfaceRegistry, "sharedInstance");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "addInterfaceIndexToRegistry:", v43);
                  if (objc_msgSend(v44, "isTrackingInterfaceIndex:", v43))
                    objc_msgSend(v42, "donateBytesToAccumulator");
                  objc_msgSend(v42, "euuid");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v44, "machOUUIDBelongsToVPNProvider:", v45);

                  if (v46)
                    objc_msgSend(v42, "removeBytesFromAccumulator");

                }
              }
              if (!v53)
                goto LABEL_102;
              -[NWStatsManager activePoll](self, "activePoll");
              v47 = objc_claimAutoreleasedReturnValue();
              if (!v47)
                goto LABEL_102;
              v48 = (void *)v47;
              -[NWStatsManager activePoll](self, "activePoll");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "deliveryBlock");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v50)
              {
                -[NWStatsManager activePoll](self, "activePoll");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "deliveryBlock");
                v52 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v52)[2](v52, v37);

              }
              else
              {
LABEL_102:
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  objc_msgSend(v24, "statsManager:didReceiveNWSnapshot:", self, v37);
              }
            }
            goto LABEL_105;
          }
          v37 = 0;
          v54 = 0;
        }
LABEL_105:

        goto LABEL_106;
      }
      NStatGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v56 = a4;
        v57 = 2048;
        v58 = 496;
        v11 = "TCP update message with size %ld below minimum %ld\n";
LABEL_77:
        v22 = v10;
        v23 = 22;
LABEL_78:
        _os_log_impl(&dword_211429000, v22, OS_LOG_TYPE_ERROR, v11, buf, v23);
      }
LABEL_79:

      return;
    default:
      if (!type)
      {
        currentPollReference = self->_currentPollReference;
        if (currentPollReference)
        {
          if (currentPollReference == a3->context)
          {
            if ((a3->flags & 2) != 0 && self->_continuationCount <= 0x27)
            {
              -[NWStatsManager activePoll](self, "activePoll");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
                -[NWStatsManager _handleMessage:length:].cold.1();

              -[NWStatsManager activePoll](self, "activePoll");
              v54 = (id)objc_claimAutoreleasedReturnValue();
              -[NWStatsManager _restartPoll:](self, "_restartPoll:");
LABEL_106:

            }
            else
            {
              -[NWStatsManager _handleCompletion:](self, "_handleCompletion:");
            }
          }
        }
      }
      return;
  }
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592, 1);
}

- (NSMutableDictionary)internalSources
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 600, 1);
}

- (NWStatsManagerDelegate)delegate
{
  return (NWStatsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NWStatsMonitor)statsMonitor
{
  return (NWStatsMonitor *)objc_getProperty(self, a2, 616, 1);
}

- (NWStatsPollHandler)activePoll
{
  return (NWStatsPollHandler *)objc_getProperty(self, a2, 664, 1);
}

- (void)_handleCompletion:(unint64_t)a3
{
  void *v5;
  void (**v6)(void);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t currentPollReference;
  id v11;
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3 && self->_currentPollReference == a3)
  {
    self->_currentPollReference = 0;
    self->_continuationCount = 0;
    -[NWStatsManager activePoll](self, "activePoll");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NWStatsManager setActivePoll:](self, "setActivePoll:", 0);
    if (v11)
    {
      if ((objc_msgSend(v11, "synchronous") & 1) == 0)
      {
        objc_msgSend(v11, "completionBlock");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          objc_msgSend(v11, "completionBlock");
          v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v6[2]();

        }
      }
    }
    -[NWStatsManager queuedPolls](self, "queuedPolls");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[NWStatsManager _startQueuedPoll](self, "_startQueuedPoll");

  }
  else
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      currentPollReference = self->_currentPollReference;
      *(_DWORD *)buf = 134218240;
      v13 = currentPollReference;
      v14 = 2048;
      v15 = a3;
      _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_ERROR, "mismatch, _currentPollReference %lld supplied reference %lld", buf, 0x16u);
    }

  }
}

- (void)setActivePoll:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSMutableArray)queuedPolls
{
  return (NSMutableArray *)objc_getProperty(self, a2, 656, 1);
}

- (void)ignoreSource:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[NWStatsManager internalSources](self, "internalSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRemoving:", 1);
    -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", a3);
    v7 = v8;
  }

}

- (BOOL)configured
{
  return self->_configured;
}

- (void)_startPoll:(id)a3
{
  NSObject *v4;
  unint64_t nextPollReference;
  id v6;

  v6 = a3;
  -[NWStatsManager clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[NWStatsManager activePoll](self, "activePoll");
  if (objc_claimAutoreleasedReturnValue())
    -[NWStatsManager _startPoll:].cold.1();
  -[NWStatsManager setActivePoll:](self, "setActivePoll:", v6);
  nextPollReference = self->_nextPollReference;
  self->_currentPollReference = nextPollReference;
  self->_nextPollReference = nextPollReference + 1;
  objc_msgSend(v6, "setNtstatContext:");
  -[NWStatsManager _sendPoll](self, "_sendPoll");

}

- (void)_sendRemoveSource:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[3];

  -[NWStatsManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6[0] = 0;
  v6[1] = 1003;
  v6[2] = a3;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", v6, 24);
}

- (void)_sendPoll
{
  unint64_t currentPollReference;
  __int128 v3;

  currentPollReference = self->_currentPollReference;
  v3 = xmmword_211459AE0;
  LODWORD(v3) = 1007;
  WORD3(v3) = 2;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &currentPollReference, 24);
}

- (void)_removeSourceInternal:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NWStatsManager internalSources](self, "internalSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "setRemoved:", 1);
    -[NWStatsManager internalSources](self, "internalSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    -[NWStatsManager _handleRemoveForSource:](self, "_handleRemoveForSource:", v5);
  }

}

- (int)_refreshUsingBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NWStatsPollHandler *v14;
  NWStatsPollHandler *v15;
  void *v16;
  void *v17;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NWStatsManager queuedPolls](self, "queuedPolls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 < 4)
  {
    if (-[NWStatsManager configured](self, "configured"))
    {
      if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
      {
        NStatGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v19[0]) = 0;
          _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as manager was invalidated", (uint8_t *)v19, 2u);
        }

        v11 = 6;
      }
      else
      {
        v14 = objc_alloc_init(NWStatsPollHandler);
        v15 = v14;
        if (v14)
        {
          -[NWStatsPollHandler setDeliveryBlock:](v14, "setDeliveryBlock:", v6);
          -[NWStatsPollHandler setCompletionBlock:](v15, "setCompletionBlock:", v7);
          -[NWStatsPollHandler setManager:](v15, "setManager:", self);
          -[NWStatsPollHandler setSynchronous:](v15, "setSynchronous:", 0);
          -[NWStatsManager activePoll](self, "activePoll");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[NWStatsManager queuedPolls](self, "queuedPolls");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v15);

          }
          else
          {
            -[NWStatsManager _startPoll:](self, "_startPoll:", v15);
          }
          v11 = 0;
        }
        else
        {
          v11 = 12;
        }

      }
    }
    else
    {
      NStatGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19[0]) = 0;
        _os_log_impl(&dword_211429000, v13, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as manager not yet configured", (uint8_t *)v19, 2u);
      }

      v11 = 19;
    }
  }
  else
  {
    NStatGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v19[0] = 67109120;
      v19[1] = v9;
      _os_log_impl(&dword_211429000, v10, OS_LOG_TYPE_ERROR, "_refreshUsingBlock skipped as current outstanding is %d", (uint8_t *)v19, 8u);
    }

    v11 = 35;
  }

  return v11;
}

- (void)_handleRemoveForSource:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NWStatsManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "createSnapshot:firstOccurrence:", 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statsManager:didReceiveNWSnapshot:", self, v5);

  }
}

- (void)_traceMemoryBuf:(char *)a3 length:(int64_t)a4 tag:(char *)a5
{
  size_t v9;
  size_t v10;
  timeval v11;

  if (self->_interfaceTraceFd >= 1 && self->_iftracebuf)
  {
    v11.tv_sec = 0;
    *(_QWORD *)&v11.tv_usec = 0;
    gettimeofday(&v11, 0);
    snprintf(self->_iftracebuf, 0x1100uLL, "%ld.%06d %s len %zu\n", v11.tv_sec, v11.tv_usec, a5, a4);
    v9 = strlen(self->_iftracebuf) + 1;
    v10 = v9 + a4;
    if ((v9 + a4) >> 8 <= 0x10)
    {
      memcpy(&self->_iftracebuf[v9], a3, a4);
      write(self->_interfaceTraceFd, self->_iftracebuf, v10);
    }
  }
}

- (void)_trace:(char *)a3
{
  if (a3)
  {
    if (self->_interfaceTraceFd >= 1)
      -[NWStatsManager _traceMemoryBuf:length:tag:](self, "_traceMemoryBuf:length:tag:", a3, strlen(a3) + 1, "Trace");
  }
}

- (void)_restartPoll:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[NWStatsManager clientQueue](self, "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[NWStatsManager activePoll](self, "activePoll");
  if ((id)objc_claimAutoreleasedReturnValue() != v5)
    -[NWStatsManager _restartPoll:].cold.1();

  -[NWStatsManager _sendPoll](self, "_sendPoll");
}

- (void)_adaptAfterDrop
{
  double v3;
  double v4;
  int currentRcvBufSize;
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  int numAdaptiveRcvBufIncrements;
  uint32_t v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v4 = v3;
  if (v3 - self->_currentRcvBufTimestamp > 5.0)
  {
    currentRcvBufSize = self->_currentRcvBufSize;
    if (currentRcvBufSize < 0x80000)
    {
      if (-[NWStatsManager setRcvBufsize:](self, "setRcvBufsize:", (currentRcvBufSize + 0x10000)))
      {
        ++self->_numAdaptiveRcvBufIncrements;
        NStatGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v11 = self->_currentRcvBufSize;
          numAdaptiveRcvBufIncrements = self->_numAdaptiveRcvBufIncrements;
          v15 = 67109376;
          v16 = v11;
          v17 = 1024;
          v18 = numAdaptiveRcvBufIncrements;
          v8 = "_adaptAfterDrop: updated buffer size to %d, adaptation count %d";
          v9 = v6;
          v10 = OS_LOG_TYPE_DEFAULT;
          v13 = 14;
LABEL_11:
          _os_log_impl(&dword_211429000, v9, v10, v8, (uint8_t *)&v15, v13);
        }
      }
      else
      {
        NStatGetLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_currentRcvBufSize;
          v15 = 67109120;
          v16 = v14;
          v8 = "_adaptAfterDrop: unable to update buffer size from %d";
          v9 = v6;
          v10 = OS_LOG_TYPE_ERROR;
          goto LABEL_10;
        }
      }
    }
    else
    {
      NStatGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_currentRcvBufSize;
        v15 = 67109120;
        v16 = v7;
        v8 = "_adaptAfterDrop: skip buffer size update as already at maximum %d";
        v9 = v6;
        v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        v13 = 8;
        goto LABEL_11;
      }
    }

    self->_currentRcvBufTimestamp = v4;
  }
}

- (void)_drainReadBuffer
{
  ssize_t v3;
  ssize_t i;
  char *v5;
  char *v6;
  unint64_t v7;

  v3 = recv(-[NWStatsManager sockfd](self, "sockfd"), -[NWStatsManager readBuffer](self, "readBuffer"), -[NWStatsManager readBufferSize](self, "readBufferSize"), 0);
  if (v3 >= 1)
  {
    for (i = v3;
          i > 0;
          i = recv(-[NWStatsManager sockfd](self, "sockfd"), -[NWStatsManager readBuffer](self, "readBuffer"), -[NWStatsManager readBufferSize](self, "readBufferSize"), 0))
    {
      v5 = -[NWStatsManager readBuffer](self, "readBuffer");
      if ((unint64_t)i >= 0x10)
      {
        v6 = v5;
        do
        {
          v7 = *((unsigned __int16 *)v6 + 6);
          if (v7 < 0x10 || i < (uint64_t)v7)
            break;
          if (self->_interfaceTraceFd >= 1)
          {
            if (self->_iftracebuf)
              -[NWStatsManager _traceMemoryBuf:length:tag:](self, "_traceMemoryBuf:length:tag:", v6, *((unsigned __int16 *)v6 + 6), "Input");
          }
          v6 += v7;
          i -= v7;
        }
        while ((unint64_t)i > 0xF);
      }
    }
  }
}

- (void)_startQueuedPoll
{
  __assert_rtn("-[NWStatsManager _startQueuedPoll]", "NWStatsManager.m", 1266, "self.activePoll == nil");
}

- (void)_addAllForProvider:(int)a3 filter:(unint64_t)a4 events:(unint64_t)a5
{
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3 > 0xA || ((1 << a3) & 0x73C) == 0)
    -[NWStatsManager _addAllForProvider:filter:events:].cold.1();
  v8 = 0u;
  v5 = 0u;
  v9 = 0;
  DWORD2(v5) = 1002;
  LODWORD(v8) = a3;
  v6 = a4;
  v7 = a5;
  -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v5, 56);
}

- (void)_handleCounts:(nstat_msg_src_counts *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  unint64_t var1;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  unint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "srcRef") == a3->var1)
        {
          -[NWStatsManager delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v10, "ifIndex");
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "statsManager:thresholdReachedOn:", self, v14);

          return;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v7)
        continue;
      break;
    }
  }

  NStatGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    var1 = a3->var1;
    *(_DWORD *)buf = 134217984;
    v20 = var1;
    _os_log_impl(&dword_211429000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected counts message on source ref %lld", buf, 0xCu);
  }

  -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", a3->var1);
}

- (void)_noteInterfaceSrcRef:(unint64_t)a3 forInterface:(unsigned int)a4 threshold:(unint64_t)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unsigned int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", a3, *(_QWORD *)&a4, a5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "ifIndex") == a4)
        {
          if (objc_msgSend(v13, "srcRef"))
          {
            if (objc_msgSend(v13, "srcRef") != a3)
            {
              NStatGetLog();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                v16 = objc_msgSend(v13, "srcRef");
                *(_DWORD *)buf = 134218496;
                v23 = v16;
                v24 = 2048;
                v25 = a3;
                v26 = 1024;
                v27 = a4;
                _os_log_impl(&dword_211429000, v15, OS_LOG_TYPE_DEFAULT, "Replace source ref %lld with %lld for monitoring interface %u", buf, 0x1Cu);
              }

              -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", objc_msgSend(v13, "srcRef"));
              objc_msgSend(v13, "setSrcRef:", a3);
            }
          }
          else
          {
            objc_msgSend(v13, "setSrcRef:", a3);
            NStatGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              v23 = a3;
              v24 = 1024;
              LODWORD(v25) = a4;
              _os_log_impl(&dword_211429000, v17, OS_LOG_TYPE_DEFAULT, "Adopt source ref %lld to monitor interface %u", buf, 0x12u);
            }

          }
          return;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v10)
        continue;
      break;
    }
  }

  NStatGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v23 = a3;
    v24 = 1024;
    LODWORD(v25) = a4;
    _os_log_impl(&dword_211429000, v14, OS_LOG_TYPE_DEFAULT, "Discard source ref %lld for interface %u", buf, 0x12u);
  }

  -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", a3);
}

- (void)_setThreshold:(unint64_t)a3 onInterface:(unsigned int)a4
{
  uint64_t v4;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NWStatsInterfaceSource *v11;
  uint64_t v12;
  uint64_t v13;
  NWStatsInterfaceSource *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x24BDAC8D0];
  -[NWStatsManager clientQueue](self, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
LABEL_3:
    v13 = 0;
    v14 = v11;
    while (1)
    {
      if (*(_QWORD *)v18 != v12)
        objc_enumerationMutation(v8);
      v11 = (NWStatsInterfaceSource *)*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13);

      if (-[NWStatsInterfaceSource ifIndex](v11, "ifIndex") == (_DWORD)v4)
        break;
      ++v13;
      v14 = v11;
      if (v10 == v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
        if (v10)
          goto LABEL_3;

        goto LABEL_10;
      }
    }

    if (a3)
      goto LABEL_13;
    if (-[NWStatsInterfaceSource srcRef](v11, "srcRef"))
      -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", -[NWStatsInterfaceSource srcRef](v11, "srcRef"));
    -[NWStatsManager interfaceSources](self, "interfaceSources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObject:", v11);

  }
  else
  {
LABEL_10:

    if (a3)
    {
      v11 = objc_alloc_init(NWStatsInterfaceSource);
      -[NWStatsInterfaceSource setIfIndex:](v11, "setIfIndex:", v4);
      -[NWStatsInterfaceSource setThreshold:](v11, "setThreshold:", 0);
      -[NWStatsInterfaceSource setSrcRef:](v11, "setSrcRef:", 0);
      -[NWStatsManager interfaceSources](self, "interfaceSources");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v11);

LABEL_13:
      if (-[NWStatsInterfaceSource threshold](v11, "threshold") != a3)
      {
        if (-[NWStatsInterfaceSource srcRef](v11, "srcRef"))
        {
          -[NWStatsManager _sendRemoveSource:](self, "_sendRemoveSource:", -[NWStatsInterfaceSource srcRef](v11, "srcRef"));
          -[NWStatsInterfaceSource setSrcRef:](v11, "setSrcRef:", 0);
        }
        v22 = 0u;
        v27 = 0u;
        v26 = 0u;
        v25 = 0u;
        v21 = 0;
        LODWORD(v22) = 1001;
        DWORD2(v22) = 6;
        v24 = v4;
        v23 = a3;
        -[NWStatsInterfaceSource setThreshold:](v11, "setThreshold:", a3);
        -[NWStatsManager _sendMessage:length:](self, "_sendMessage:length:", &v21, 40);
      }
    }
    else
    {
      v11 = 0;
    }
  }

}

- (int)_setThresholds:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  objc_class *v18;
  void *v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  NSObject *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v17 = 0;
    goto LABEL_21;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v7)
  {
    v17 = 0;
    goto LABEL_20;
  }
  v8 = v7;
  v9 = *(_QWORD *)v26;
  v24 = v5;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NStatGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          v31 = 2112;
          v32 = v19;
          _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_ERROR, "Incorrect key format for configuring thresholds, %@ has class %@", buf, 0x16u);

        }
        goto LABEL_19;
      }
      v12 = v11;
      objc_msgSend(v6, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NStatGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v30 = v13;
          v31 = 2112;
          v32 = v22;
          v33 = 2112;
          v34 = v12;
          _os_log_impl(&dword_211429000, v20, OS_LOG_TYPE_ERROR, "Incorrect threshold format %@ of class %@ for configuring interface %@", buf, 0x20u);

        }
LABEL_19:
        v5 = v24;

        v17 = 22;
        goto LABEL_20;
      }
      v14 = v13;
      v15 = objc_msgSend(v14, "unsignedLongLongValue");
      v16 = -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue");

      -[NWStatsManager _setThreshold:onInterface:](self, "_setThreshold:onInterface:", v15, v16);
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    v17 = 0;
    v5 = v24;
    if (v8)
      continue;
    break;
  }
LABEL_20:

LABEL_21:
  return v17;
}

- (void)_setInterfaceTraceFd:(int)a3
{
  char *v5;
  int interfaceTraceFd;

  if (!self->_iftracebuf)
  {
    v5 = (char *)malloc_type_malloc(0x1100uLL, 0xA172743EuLL);
    if (!v5)
    {
      __break(1u);
      return;
    }
    self->_iftracebuf = v5;
  }
  interfaceTraceFd = self->_interfaceTraceFd;
  if (interfaceTraceFd >= 1)
    close(interfaceTraceFd);
  self->_interfaceTraceFd = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char *iftracebuf;

  -[NWStatsManager readSource](self, "readSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NWStatsManager readSource](self, "readSource");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NWStatsManager setReadSource:](self, "setReadSource:", 0);
  }
  -[NWStatsManager activePoll](self, "activePoll");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NWStatsManager setActivePoll:](self, "setActivePoll:", 0);
  -[NWStatsManager setQueuedPolls:](self, "setQueuedPolls:", 0);
  while (1)
  {
    -[NWStatsManager internalSources](self, "internalSources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      break;
    -[NWStatsManager internalSources](self, "internalSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatsManager _removeSourceInternal:](self, "_removeSourceInternal:", objc_msgSend(v10, "unsignedLongLongValue"));

  }
  -[NWStatsManager setInternalSources:](self, "setInternalSources:", 0);
  if (self->_interfaceTraceFd >= 1)
  {
    self->_interfaceTraceFd = 0;
    iftracebuf = self->_iftracebuf;
    if (iftracebuf)
    {
      free(iftracebuf);
      self->_iftracebuf = 0;
    }
  }
  -[NWStatsManager setInvalidated:](self, "setInvalidated:", 1);
}

- (void)dealloc
{
  NSObject *readSource;
  OS_dispatch_source *v4;
  char *readBuffer;
  objc_super v6;

  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_source_cancel(readSource);
    v4 = self->_readSource;
    self->_readSource = 0;

  }
  readBuffer = self->_readBuffer;
  if (readBuffer)
  {
    free(readBuffer);
    self->_readBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)NWStatsManager;
  -[NWStatsManager dealloc](&v6, sel_dealloc);
}

- (BOOL)setRcvBufsize:(int)a3
{
  double v4;
  NSObject *v6;
  int currentRcvBufSize;
  int v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_currentRcvBufSize == a3)
    return 1;
  if (setsockopt(self->_sockfd, 0xFFFF, 4098, &v8, 4u) != -1)
  {
    self->_currentRcvBufSize = v8;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_currentRcvBufTimestamp = v4;
    return 1;
  }
  NStatGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    currentRcvBufSize = self->_currentRcvBufSize;
    *(_DWORD *)buf = 67109376;
    v10 = currentRcvBufSize;
    v11 = 1024;
    v12 = v8;
    _os_log_impl(&dword_211429000, v6, OS_LOG_TYPE_ERROR, "Unable to increment rcv buf size from %d to %d", buf, 0xEu);
  }

  return 0;
}

- (NWStatsManager)initWithQueue:(id)a3
{
  id v5;
  NWStatsManager *v6;
  int v7;
  int v8;
  NSObject *v9;
  NWStatsManager *v10;
  int v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *internalSources;
  NSMutableArray *v14;
  NSMutableArray *queuedPolls;
  NSMutableSet *v16;
  NSMutableSet *interfaceSources;
  NWStatsMonitor *v18;
  NWStatsMonitor *statsMonitor;
  NSObject *v21;
  NSObject *v22;
  objc_super v23;
  uint8_t v24[16];
  _BYTE v25[20];
  uint64_t v26;
  int v27;
  int buf;
  _BYTE buf_4[44];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NWStatsManager;
  v6 = -[NWStatsManager init](&v23, sel_init);
  if (!v6)
    goto LABEL_15;
  v7 = socket(32, 2, 2);
  if (v7 == -1)
  {
LABEL_6:
    v6->_sockfd = -1;
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_ERROR, "Unable to allocate a kernel control socket", (uint8_t *)&buf, 2u);
    }

    goto LABEL_9;
  }
  v8 = v7;
  buf = 0;
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  *(_OWORD *)&buf_4[28] = 0u;
  v30 = 0u;
  strcpy(buf_4, "com.apple.network.statistics");
  if (ioctl(v7, 0xC0644E03uLL, &buf) == -1
    || (v26 = 0,
        *(_QWORD *)&v25[12] = 0,
        v27 = 0,
        *(_DWORD *)v25 = 139296,
        *(_DWORD *)&v25[4] = buf,
        *(_DWORD *)&v25[8] = 0,
        connect(v8, (const sockaddr *)v25, 0x20u)))
  {
LABEL_5:
    close(v8);
    goto LABEL_6;
  }
  v11 = fcntl(v8, 3, 0);
  if (fcntl(v8, 4, v11 | 4u) == -1)
  {
    NStatGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_211429000, v21, OS_LOG_TYPE_ERROR, "Unable to set non-blocking", v24, 2u);
    }

    goto LABEL_5;
  }
  v6->_sockfd = v8;
  if (-[NWStatsManager setRcvBufsize:](v6, "setRcvBufsize:", 0x20000))
  {
    objc_storeStrong((id *)&v6->_clientQueue, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    internalSources = v6->_internalSources;
    v6->_internalSources = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    queuedPolls = v6->_queuedPolls;
    v6->_queuedPolls = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    interfaceSources = v6->_interfaceSources;
    v6->_interfaceSources = v16;

    v18 = -[NWStatsMonitor initWithQueue:]([NWStatsMonitor alloc], "initWithQueue:", v5);
    statsMonitor = v6->_statsMonitor;
    v6->_statsMonitor = v18;

    v6->_nextPollReference = 2;
    if (v6->_clientQueue && v6->_internalSources && v6->_statsMonitor)
    {
LABEL_15:
      v10 = v6;
      goto LABEL_16;
    }
    NStatGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_211429000, v22, OS_LOG_TYPE_ERROR, "Unable to initialize Sources / queue / monitor", (uint8_t *)&buf, 2u);
    }

  }
  close(v6->_sockfd);
LABEL_9:
  v10 = 0;
LABEL_16:

  return v10;
}

- (int)initialConfigure:(id)a3
{
  id v4;
  uint64_t currentRcvBufSize;
  void *v6;
  void *v7;
  char isKindOfClass;
  NWStatsTargetSelector *v9;
  NWStatsTargetSelector *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  _BOOL4 eagerInstantiate;
  uint64_t v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  char v65;
  void *v66;
  size_t v67;
  char *v68;
  OS_dispatch_source *v69;
  OS_dispatch_source *readSource;
  NSObject *v71;
  uint64_t v72;
  int sockfd;
  NSObject *v74;
  int v75;
  void *v76;
  char v78;
  _QWORD v79[5];
  _QWORD v80[4];
  int v81;
  _QWORD handler[5];
  uint8_t buf[4];
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  currentRcvBufSize = self->_currentRcvBufSize;
  self->_consecutiveReadLimit = 20;
  self->_checkNESessionManagerVPNs = 1;
  -[NWStatsManager setReadBufferSize:](self, "setReadBufferSize:", 4096);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTargetSelector"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTargetSelector"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_7;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTargetSelector"));
    v9 = (NWStatsTargetSelector *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = -[NWStatsTargetSelector initWithSelection:]([NWStatsTargetSelector alloc], "initWithSelection:", v4);
  }
  v10 = v9;
  if (v9)
  {
    v11 = -[NWStatsTargetSelector filter](v9, "filter");
    v12 = -[NWStatsTargetSelector connFilter](v10, "connFilter");
    v13 = -[NWStatsTargetSelector events](v10, "events");
    v14 = 0;
    goto LABEL_10;
  }
LABEL_7:
  NStatGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211429000, v15, OS_LOG_TYPE_ERROR, "initialConfigure: unexpected class for kNWStatsParameterTargetSelector", buf, 2u);
  }

  v10 = 0;
  v13 = 0;
  v12 = 0;
  v11 = 0;
  v14 = 1;
LABEL_10:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTraceFD"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTraceFD"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");

    if ((_DWORD)v18)
      -[NWStatsManager _setInterfaceTraceFd:](self, "_setInterfaceTraceFd:", v18);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterDomainInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterDomainInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "BOOLValue"))
    {
      v11 |= 0x20000000000uLL;
      v12 |= 0x20000000000uLL;
      NStatGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v84 = v11;
        _os_log_impl(&dword_211429000, v21, OS_LOG_TYPE_DEFAULT, "initialConfigure set NSTAT_EXTENSION_FILTER_DOMAIN_INFO, filter now 0x%llx", buf, 0xCu);
      }

      currentRcvBufSize = (currentRcvBufSize + 0x10000);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownInbound"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownInbound"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "BOOLValue"))
      v11 |= 0x4000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownOutbound"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownOutbound"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "BOOLValue"))
      v11 |= 0x8000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownListener"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectKnownListener"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "BOOLValue"))
      v11 |= 0x2000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterNECPClientTLV"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v14;
  if (v28)
  {
    v11 |= 0x40000000000uLL;
    v12 |= 0x40000000000uLL;
    NStatGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v84 = v11;
      _os_log_impl(&dword_211429000, v29, OS_LOG_TYPE_DEFAULT, "initialConfigure set NSTAT_EXTENSION_FILTER_NECP_TLV, filter now 0x%llx", buf, 0xCu);
    }
    v30 = currentRcvBufSize;

  }
  else
  {
    v30 = currentRcvBufSize;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterNECPAncestralClientTLV"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
    v32 = v12 | 0x80000000000;
  else
    v32 = v12;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnHasNetAccess"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectConnHasNetAccess"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "BOOLValue"))
      v32 |= 0x1000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnRefresh"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnRefresh"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "BOOLValue"))
      v32 |= 0x20000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsTuneMaxConsecutiveReads"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsTuneMaxConsecutiveReads"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v39 = objc_opt_isKindOfClass();

    if ((v39 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsTuneMaxConsecutiveReads"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      self->_consecutiveReadLimit = objc_msgSend(v40, "intValue");

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnClose"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectTuneSkipNoChangeConnOnClose"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "BOOLValue"))
      v32 |= 0x10000000uLL;

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsOptimizeFrequentRefresh"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsOptimizeFrequentRefresh"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "BOOLValue"))
    {
      -[NWStatsManager setReadBufferSize:](self, "setReadBufferSize:", 0x4000);
      v11 |= 0x2000000000uLL;
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectHasTrafficDelta"));
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v46 = (void *)v45;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectHasTrafficDelta"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    if ((v48 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsSelectHasTrafficDelta"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v49, "BOOLValue"))
        v11 |= 0x800000uLL;

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterReportOpen"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterReportOpen"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");
    self->_eagerInstantiate = v52;
    if (v52)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterExperiment"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterExperiment"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "BOOLValue"))
        {
          v32 |= 0x200000uLL;
          v11 |= 0x200000uLL;
        }

      }
    }

    eagerInstantiate = self->_eagerInstantiate;
  }
  else
  {
    eagerInstantiate = 0;
    self->_eagerInstantiate = 0;
  }
  if (eagerInstantiate)
    v56 = v32;
  else
    v56 = v32 | 0x100000;
  if (!eagerInstantiate)
    v11 |= 0x100000uLL;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTrafficDeltaAdjustmentFactor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTrafficDeltaAdjustmentFactor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v59 = objc_opt_isKindOfClass();

    if ((v59 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTrafficDeltaAdjustmentFactor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      self->_trafficDeltaAdjustmentFactor = v61;

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterCheckNESessionManagerVPNs"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v30;
  if (v62)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterCheckNESessionManagerVPNs"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = objc_opt_isKindOfClass();

    if ((v65 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterCheckNESessionManagerVPNs"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      self->_checkNESessionManagerVPNs = objc_msgSend(v66, "BOOLValue");

    }
  }
  v67 = -[NWStatsManager readBufferSize](self, "readBufferSize");
  if (!v67 || (v68 = (char *)malloc_type_malloc(v67, 0xA172743EuLL)) == 0)
    __break(1u);
  self->_readBuffer = v68;
  v69 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA00], self->_sockfd, 0, (dispatch_queue_t)self->_clientQueue);
  readSource = self->_readSource;
  self->_readSource = v69;

  v71 = self->_readSource;
  if (!v71)
  {
    close(self->_sockfd);
    v75 = 55;
    goto LABEL_106;
  }
  v72 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __35__NWStatsManager_initialConfigure___block_invoke;
  handler[3] = &unk_24CBD27A8;
  handler[4] = self;
  dispatch_source_set_event_handler(v71, handler);
  sockfd = self->_sockfd;
  v74 = self->_readSource;
  v80[0] = v72;
  v80[1] = 3221225472;
  v80[2] = __35__NWStatsManager_initialConfigure___block_invoke_2;
  v80[3] = &__block_descriptor_36_e5_v8__0l;
  v81 = sockfd;
  dispatch_source_set_cancel_handler(v74, v80);
  dispatch_resume((dispatch_object_t)self->_readSource);
  -[NWStatsManager _sendUpdateRequestMessage:](self, "_sendUpdateRequestMessage:", -1);
  if ((v78 & 1) != 0)
  {
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 2, v11, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
  }
  else
  {
    if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 2))
    {
      -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 2, v11, v13);
      -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    }
    if (!-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 4))
    {
LABEL_93:
      if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 3))
      {
        -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 3, v11, v13);
        -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
      }
      if (!-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 5))
        goto LABEL_97;
      goto LABEL_96;
    }
  }
  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 4, v11, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
  if ((v78 & 1) == 0)
    goto LABEL_93;
  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 3, v11, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
LABEL_96:
  -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 5, v11, v13);
  -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
  if ((v78 & 1) != 0)
  {
LABEL_98:
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 8, v11, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    goto LABEL_99;
  }
LABEL_97:
  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 8))
    goto LABEL_98;
LABEL_99:
  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 10))
  {
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 10, v11, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    v63 = (v30 + 0x8000);
  }
  if (-[NWStatsTargetSelector shouldAddProvider:](v10, "shouldAddProvider:", 9))
  {
    -[NWStatsManager _addAllForProvider:filter:events:](self, "_addAllForProvider:filter:events:", 9, v56 | 0x120000000000, v13);
    -[NWStatsManager _drainReadBuffer](self, "_drainReadBuffer");
    v63 = (v63 + 0x8000);
  }
  -[NWStatsManager setRcvBufsize:](self, "setRcvBufsize:", v63);
  -[NWStatsManager setConfigured:](self, "setConfigured:", 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterThresholds"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = -[NWStatsManager _setThresholds:](self, "_setThresholds:", v76);

  if (self->_eagerInstantiate || self->_trafficDeltaAdjustmentFactor > 0.0)
  {
    v79[0] = v72;
    v79[1] = 3221225472;
    v79[2] = __35__NWStatsManager_initialConfigure___block_invoke_3;
    v79[3] = &unk_24CBD27A8;
    v79[4] = self;
    -[NWStatsManager _refreshUsingBlock:completionBlock:](self, "_refreshUsingBlock:completionBlock:", 0, v79);
  }
LABEL_106:

  return v75;
}

uint64_t __35__NWStatsManager_initialConfigure___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "_handleReads:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 28));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 58) = 0;
  return result;
}

uint64_t __35__NWStatsManager_initialConfigure___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __35__NWStatsManager_initialConfigure___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  NStatGetLog();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_211429000, v1, OS_LOG_TYPE_DEFAULT, "Initial update for opens completed", v2, 2u);
  }

}

- (int)reconfigure:(id)a3
{
  id v4;
  void *v5;
  int interfaceTraceFd;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTraceFD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    interfaceTraceFd = self->_interfaceTraceFd;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTraceFD"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if (interfaceTraceFd != v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterTraceFD"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWStatsManager _setInterfaceTraceFd:](self, "_setInterfaceTraceFd:", objc_msgSend(v9, "intValue"));

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kNWStatsParameterThresholds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NWStatsManager _setThresholds:](self, "_setThresholds:", v10);

  return v11;
}

- (int)configure:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const __CFAllocator *Default;
  __SecTask *v8;
  __SecTask *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_ERROR, "configure skipped as manager was invalidated", (uint8_t *)v18, 2u);
    }

    v6 = 6;
  }
  else
  {
    Default = CFAllocatorGetDefault();
    v8 = SecTaskCreateFromSelf(Default);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)SecTaskCopyValueForEntitlement(v8, CFSTR("com.apple.private.network.statistics"), 0);
      v11 = objc_msgSend(v10, "BOOLValue");
      v12 = (void *)SecTaskCopyValueForEntitlement(v9, CFSTR("com.apple.private.coreservices.canmapbundleidtouuid"), 0);

      v13 = objc_msgSend(v12, "BOOLValue");
      CFRelease(v9);

      if (v11 && v13)
      {
        -[NWStatsManager statsMonitor](self, "statsMonitor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configure:", v4);

        if (-[NWStatsManager configured](self, "configured"))
        {
          v6 = -[NWStatsManager reconfigure:](self, "reconfigure:", v4);
        }
        else
        {
          v6 = -[NWStatsManager initialConfigure:](self, "initialConfigure:", v4);
          -[NWStatsManager setConfigured:](self, "setConfigured:", 1);
        }
        goto LABEL_16;
      }
    }
    else
    {
      NStatGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18[0]) = 0;
        _os_log_impl(&dword_211429000, v15, OS_LOG_TYPE_ERROR, "NWStatsManager configure: unable to get task ref for entitlement check", (uint8_t *)v18, 2u);
      }

      v11 = 0;
      v13 = 0;
    }
    NStatGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18[0] = 67109376;
      v18[1] = v11;
      v19 = 1024;
      v20 = v13;
      _os_log_impl(&dword_211429000, v16, OS_LOG_TYPE_FAULT, "NWStatsManager configure: entitlements not held, netstats %d, mapping %d", (uint8_t *)v18, 0xEu);
    }

    -[NWStatsManager invalidate](self, "invalidate");
    v6 = 1;
  }
LABEL_16:

  return v6;
}

- (int)statsRefreshCurrentUsage
{
  void *v3;
  unint64_t v4;
  void *v5;
  _BOOL4 v6;

  -[NWStatsManager queuedPolls](self, "queuedPolls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
    return 1;
  if (v4)
  {
    if (v4 < 4)
      return 2;
    else
      return 3;
  }
  else
  {
    -[NWStatsManager activePoll](self, "activePoll");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  return v6;
}

- (int)refresh:(id)a3
{
  return -[NWStatsManager _refreshUsingBlock:completionBlock:](self, "_refreshUsingBlock:completionBlock:", 0, a3);
}

- (int)_refreshSyncUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NWStatsPollHandler *v9;
  NWStatsPollHandler *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];
  uint8_t buf[16];
  uint8_t v17[16];

  v4 = a3;
  if (-[NWStatsManager configured](self, "configured"))
  {
    if (-[NWStatsManager isInvalidated](self, "isInvalidated"))
    {
      NStatGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock skipped as manager was invalidated", buf, 2u);
      }

      v6 = 6;
    }
    else if (self->_handlingSocketReads)
    {
      NStatGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock abort to prevent deadlock", v15, 2u);
      }

      v6 = 11;
    }
    else
    {
      v9 = objc_alloc_init(NWStatsPollHandler);
      v10 = v9;
      if (v9)
      {
        -[NWStatsPollHandler setDeliveryBlock:](v9, "setDeliveryBlock:", v4);
        -[NWStatsPollHandler setCompletionBlock:](v10, "setCompletionBlock:", 0);
        -[NWStatsPollHandler setManager:](v10, "setManager:", self);
        -[NWStatsPollHandler setSynchronous:](v10, "setSynchronous:", 1);
        -[NWStatsManager activePoll](self, "activePoll");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[NWStatsManager queuedPolls](self, "queuedPolls");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v10);

        }
        else
        {
          -[NWStatsManager _startPoll:](self, "_startPoll:", v10);
        }
        self->_handlingSocketReads = 1;
        while (1)
        {
          -[NWStatsManager activePoll](self, "activePoll");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
            break;
          -[NWStatsManager _handleReads:](self, "_handleReads:", 1);
        }
        v6 = 0;
        self->_handlingSocketReads = 0;
      }
      else
      {
        v6 = 12;
      }

    }
  }
  else
  {
    NStatGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_211429000, v7, OS_LOG_TYPE_ERROR, "_refreshSyncUsingBlock skipped as manager not yet configured", v17, 2u);
    }

    v6 = 19;
  }

  return v6;
}

- (int)refreshSync
{
  return -[NWStatsManager _refreshSyncUsingBlock:](self, "_refreshSyncUsingBlock:", 0);
}

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v6 = a3;
  -[NWStatsManager statsMonitor](self, "statsMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NWStatsManager statsMonitor](self, "statsMonitor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifierForUUID:derivation:", v6, a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("unavailable");
  }

  return v9;
}

- (id)stateDictionary
{
  void *v2;
  void *v3;

  -[NWStatsManager statsMonitor](self, "statsMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getState
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t *p_numUpdatesOnClose;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id obj;
  NWStatsManager *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NWStatsManager internalSources](self, "internalSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("NWStatsManager %p: Current num sources %d current buf size %d after %d adaptations"), self, objc_msgSend(v5, "count"), self->_currentRcvBufSize, self->_numAdaptiveRcvBufIncrements);
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsManager %p: Source removes %lld after filter %lld after drop %lld"), self, self->_combinedCounts.numRemoveSources, self->_combinedCounts.numRemoveSourcesAfterFilter, self->_combinedCounts.numRemoveSourcesAfterDrop);
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsManager %p: No-source removes %lld after filter %lld after drop %lld"), self, self->_combinedCounts.numRemoves, self->_combinedCounts.numRemovesAfterFilter, self->_combinedCounts.numRemovesAfterDrop);
  objc_msgSend(v3, "addObject:", v8);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[NWStatsManager queuedPolls](self, "queuedPolls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v44 = self;
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v54;
    do
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v54 != v13)
          objc_enumerationMutation(v9);
        v12 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * v14);

        objc_msgSend(v12, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v11);

    self = v44;
  }

  v17 = 0;
  p_numUpdatesOnClose = &self->_providerCounts[1].numUpdatesOnClose;
  do
  {
    if (*(p_numUpdatesOnClose - 4)
      || *(p_numUpdatesOnClose - 3)
      || *(p_numUpdatesOnClose - 2)
      || *(p_numUpdatesOnClose - 1)
      || *p_numUpdatesOnClose)
    {
      if (v17 >= 0xA)
      {
        self = v44;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("unknown-%d"), v17 + 1);
      }
      else
      {
        v19 = *(&off_24CBD2C80 + v17);
      }
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsManager %p: %@ src-add %lld updates open %lld poll %lld event %lld close %lld"), self, v19, *(p_numUpdatesOnClose - 4), *(p_numUpdatesOnClose - 3), *(p_numUpdatesOnClose - 2), *(p_numUpdatesOnClose - 1), *p_numUpdatesOnClose);
      objc_msgSend(v3, "addObject:", v20);

    }
    ++v17;
    p_numUpdatesOnClose += 5;
  }
  while (v17 != 10);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[NWStatsManager interfaceSources](self, "interfaceSources");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v50 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("NWStatsManager %p: monitoring interface %d with srcref %lld threshold %lld"), v44, objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "ifIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "srcRef"), objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "threshold"));
        objc_msgSend(v3, "addObject:", v26);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v23);
  }

  -[NWStatsManager internalSources](v44, "internalSources");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v28;
  objc_msgSend(v28, "sortedArrayUsingSelector:", sel_compare_);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v34 = objc_alloc(MEMORY[0x24BDD17C8]);
        v35 = objc_msgSend(v33, "longLongValue");
        -[NWStatsManager internalSources](v44, "internalSources");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v33);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR(" ref %6lld --> %@"), v35, v37);
        objc_msgSend(v3, "addObject:", v38);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v30);
  }
  if (v44->_checkNESessionManagerVPNs)
  {
    +[NWStatsInterfaceRegistry sharedInstance](NWStatsInterfaceRegistry, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "getState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v40);

  }
  return v3;
}

- (void)dumpState
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[4];
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[NWStatsManager getState](self, "getState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        NStatGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v14 = v7;
          _os_log_impl(&dword_211429000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v4);
  }

}

- (void)setReadSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (void)setClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (void)setSockfd:(int)a3
{
  self->_sockfd = a3;
}

- (void)setInternalSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (NSMutableSet)interfaceSources
{
  return (NSMutableSet *)objc_getProperty(self, a2, 608, 1);
}

- (void)setInterfaceSources:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (void)setStatsMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (unint64_t)currentQueryAllReference
{
  return self->_currentQueryAllReference;
}

- (void)setCurrentQueryAllReference:(unint64_t)a3
{
  self->_currentQueryAllReference = a3;
}

- (unint64_t)querySequenceNumber
{
  return self->_querySequenceNumber;
}

- (void)setQuerySequenceNumber:(unint64_t)a3
{
  self->_querySequenceNumber = a3;
}

- (void)setReadBuffer:(char *)a3
{
  self->_readBuffer = a3;
}

- (unint64_t)readBufferSize
{
  return self->_readBufferSize;
}

- (void)setReadBufferSize:(unint64_t)a3
{
  self->_readBufferSize = a3;
}

- (void)setQueuedPolls:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePoll, 0);
  objc_storeStrong((id *)&self->_queuedPolls, 0);
  objc_storeStrong((id *)&self->_statsMonitor, 0);
  objc_storeStrong((id *)&self->_interfaceSources, 0);
  objc_storeStrong((id *)&self->_internalSources, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_startPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _startPoll:]", "NWStatsManager.m", 864, "self.activePoll == nil");
}

- (void)_restartPoll:.cold.1()
{
  __assert_rtn("-[NWStatsManager _restartPoll:]", "NWStatsManager.m", 877, "self.activePoll == currentPoll");
}

- (void)_handleMessage:length:.cold.1()
{
  __assert_rtn("-[NWStatsManager _handleMessage:length:]", "NWStatsManager.m", 925, "self.activePoll");
}

- (void)_handleMessage:length:.cold.2()
{
  __assert_rtn("-[NWStatsManager _handleMessage:length:]", "NWStatsManager.m", 1132, "provider == NSTAT_PROVIDER_CONN_USERLAND");
}

- (void)_addAllForProvider:filter:events:.cold.1()
{
  __assert_rtn("-[NWStatsManager _addAllForProvider:filter:events:]", "NWStatsManager.m", 1321, "(provider == NSTAT_PROVIDER_TCP_KERNEL) || (provider == NSTAT_PROVIDER_TCP_USERLAND) || (provider == NSTAT_PROVIDER_UDP_KERNEL) || (provider == NSTAT_PROVIDER_UDP_USERLAND) || (provider == NSTAT_PROVIDER_QUIC_USERLAND) || (provider == NSTAT_PROVIDER_CONN_USERLAND) || (provider == NSTAT_PROVIDER_UDP_SUBFLOW)");
}

@end
