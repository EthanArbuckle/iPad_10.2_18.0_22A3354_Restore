@implementation IDSDatagramChannel

- (void)_startStatsTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *statsTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_source *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  uint8_t buf[4];
  OS_dispatch_source *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_statsTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_internal->_queue);
    statsTimer = self->_statsTimer;
    self->_statsTimer = v3;

    v5 = self->_statsTimer;
    v6 = dispatch_time(0, 4000000000);
    dispatch_source_set_timer(v5, v6, 0xEE6B2800uLL, 0x5F5E100uLL);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = self->_statsTimer;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = sub_1907B13D8;
    v13 = &unk_1E2C60B88;
    objc_copyWeak(&v14, &location);
    dispatch_source_set_event_handler(v7, &v10);
    dispatch_resume((dispatch_object_t)self->_statsTimer);
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels", v10, v11, v12, v13);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_statsTimer;
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "start stats timer %p.", buf, 0xCu);
    }

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_stopStatsTimer
{
  NSObject *statsTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  int v7;
  OS_dispatch_source *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  statsTimer = self->_statsTimer;
  if (statsTimer)
  {
    dispatch_source_cancel(statsTimer);
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_statsTimer;
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "stop stats timer %p.", (uint8_t *)&v7, 0xCu);
    }

    v6 = self->_statsTimer;
    self->_statsTimer = 0;

  }
}

- (id)_directConnectionsForLinkID:(char)a3
{
  int v3;
  uint64_t v5;
  IDSDataChannelsDirectConnections *v6;
  NSObject *v7;
  _DWORD v9[2];
  __int16 v10;
  IDSDataChannelsDirectConnections *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self->_internal->_directConnectionsByLinkID[a3];
  if (!v6)
  {
    v6 = objc_alloc_init(IDSDataChannelsDirectConnections);
    objc_storeStrong((id *)&self->_internal->_directConnectionsByLinkID[v5], v6);
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = v3;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "LinkID %d associated with direct connection %@", (uint8_t *)v9, 0x12u);
    }

  }
  return v6;
}

- (void)_setDirectConnections:(id)a3 forLinkID:(char)a4
{
  int v4;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v4 < 0)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[IDSDatagramChannel(DirectConnections) _setDirectConnections:forLinkID:]";
      v11 = 1024;
      v12 = v4;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "%s: Invalid LinkID %d", (uint8_t *)&v9, 0x12u);
    }

  }
  else
  {
    objc_storeStrong((id *)&self->_internal->_directConnectionsByLinkID[v4], a3);
  }

}

- (id)_directOrDaemonConnectionForLinkID:(char)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  OS_nw_connection *v9;
  char v10;
  OS_nw_connection *connection;
  OS_nw_connection *v12;

  v3 = a3;
  -[IDSDatagramChannel _underlyingLinkContextForLinkID:](self, "_underlyingLinkContextForLinkID:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDatagramChannel _directConnectionsForLinkID:](self, "_directConnectionsForLinkID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isQUICPod")
    && (objc_msgSend(v6, "qpodConnection"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    objc_msgSend(v6, "qpodConnection");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "udpConnection");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (OS_nw_connection *)v8;
  if (!v8 || (v10 = objc_msgSend(v5, "directConnectionReady"), connection = v9, (v10 & 1) == 0))
    connection = self->_internal->_connection;
  v12 = connection;

  return v12;
}

- (void)_removeDirectConnection:(id)a3
{
  id v4;
  __int128 v5;
  uint64_t v6;
  IDSDataChannelsDirectConnections *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  IDSDataChannelsDirectConnections **directConnectionsByLinkID;
  IDSDataChannelsDirectConnections *v13;
  __int128 v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v6 = 0;
    *(_QWORD *)&v5 = 67109378;
    v14 = v5;
    while (1)
    {
      v7 = self->_internal->_directConnectionsByLinkID[v6];
      -[IDSDataChannelsDirectConnections udpConnection](v7, "udpConnection");
      v8 = objc_claimAutoreleasedReturnValue();
      if ((id)v8 == v4)
        break;
      v9 = (void *)v8;
      -[IDSDataChannelsDirectConnections qpodConnection](v7, "qpodConnection");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 == v4)
        goto LABEL_7;
LABEL_10:

      if (++v6 == 256)
        goto LABEL_11;
    }

LABEL_7:
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v14;
      v16 = v6;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "LinkID %d unassociated with direct connection %@", buf, 0x12u);
    }

    directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
    v13 = directConnectionsByLinkID[v6];
    directConnectionsByLinkID[v6] = 0;

    goto LABEL_10;
  }
LABEL_11:

}

- (id)_underlyingLinkContextForLinkID:(char)a3
{
  void *v4;
  void *v5;

  -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isVirtualRelayLink"))
  {
    -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", objc_msgSend(v4, "delegatedLinkID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDirectConnectionReady:", objc_msgSend(v5, "directConnectionReady"));

  }
  return v4;
}

- (void)_dumpLinkContextConnectionsInfo
{
  double v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  uint8_t buf[4];
  IDSDatagramChannel *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ids_monotonic_time();
  if (v3 - *(double *)&qword_1EE1E2178 > 5.0)
  {
    qword_1EE1E2178 = *(_QWORD *)&v3;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "Dumping link contexts and direct connections", buf, 2u);
    }

    v5 = 0;
    *(_QWORD *)&v6 = 134218498;
    v11 = v6;
    do
    {
      -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v5, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();

      -[IDSDataChannelsDirectConnections description](self->_internal->_directConnectionsByLinkID[v5], "description");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9)
      {
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v11;
          v13 = self;
          v14 = 2112;
          v15 = v9;
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "<%p> -- connection %@ link context %@", buf, 0x20u);
        }

      }
      ++v5;
    }
    while (v5 != 256);
  }
}

- (void)invalidateDirectConnections
{
  uint64_t v3;
  __int128 v4;
  IDSDataChannelsDirectConnections *v5;
  IDSDataChannelsDirectConnections *v6;
  IDSDataChannelsDirectConnections *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  uint64_t v15;
  NSObject *v16;
  IDSDataChannelsDirectConnections *v17;
  void *v18;
  IDSDataChannelsDirectConnections *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  IDSDataChannelsDirectConnections **directConnectionsByLinkID;
  IDSDataChannelsDirectConnections *v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  IDSDataChannelsDirectConnections *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[IDSDatagramChannel _stopStatsTimer](self, "_stopStatsTimer");
  v3 = 0;
  *(_QWORD *)&v4 = 138412290;
  v26 = v4;
  do
  {
    -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v3, v26);
    v5 = (IDSDataChannelsDirectConnections *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (-[IDSDataChannelsDirectConnections isVirtualRelayLink](v5, "isVirtualRelayLink") & 1) == 0)
    {
      v7 = self->_internal->_directConnectionsByLinkID[v3];
      -[IDSDataChannelsDirectConnections udpConnection](v7, "udpConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[IDSDataChannelsDirectConnections udpConnection](v7, "udpConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSDatagramChannel _removeDirectConnection:](self, "_removeDirectConnection:", v9);

        -[IDSDataChannelsDirectConnections udpConnection](v7, "udpConnection");
        v10 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v10);
      }
      else
      {
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v29 = v6;
          _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "Found empty udp connection for link context %@", buf, 0xCu);
        }
      }

      -[IDSDataChannelsDirectConnections qpodConnection](v7, "qpodConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[IDSDataChannelsDirectConnections qpodConnection](v7, "qpodConnection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[IDSDatagramChannel _removeDirectConnection:](self, "_removeDirectConnection:", v12);

        -[IDSDataChannelsDirectConnections qpodConnection](v7, "qpodConnection");
        v13 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v13);
      }
      else
      {
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v26;
          v29 = v6;
          _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "Found empty udp connection for link context %@", buf, 0xCu);
        }
      }

    }
    ++v3;
  }
  while (v3 != 256);
  v15 = 0;
  *(_QWORD *)&v14 = 138412546;
  v27 = v14;
  do
  {
    if (self->_internal->_directConnectionsByLinkID[v15])
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->_internal->_directConnectionsByLinkID[v15];
        -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v27;
        v29 = v17;
        v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "Cleaning up left over connection %@ for link context %@", buf, 0x16u);

      }
      v19 = self->_internal->_directConnectionsByLinkID[v15];
      -[IDSDataChannelsDirectConnections udpConnection](v19, "udpConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[IDSDataChannelsDirectConnections udpConnection](v19, "udpConnection");
        v21 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v21);

      }
      -[IDSDataChannelsDirectConnections qpodConnection](v19, "qpodConnection", v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[IDSDataChannelsDirectConnections qpodConnection](v19, "qpodConnection");
        v23 = objc_claimAutoreleasedReturnValue();
        nw_connection_cancel(v23);

      }
      directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
      v25 = directConnectionsByLinkID[v15];
      directConnectionsByLinkID[v15] = 0;

    }
    -[IDSDatagramChannel _removeLinkContextWithID:](self, "_removeLinkContextWithID:", v15++, v27);
  }
  while (v15 != 256);
}

- (unint64_t)_translateParticipantID:(unint64_t)a3 forLinkID:(char)a4
{
  uint64_t v4;
  NSMutableDictionary *linkIDToParticipantMap;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  int v15;
  unint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
  linkIDToParticipantMap = self->_internal->_linkIDToParticipantMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](linkIDToParticipantMap, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v11, "unsignedLongLongValue");
  }
  else
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218498;
      v16 = a3;
      v17 = 1024;
      v18 = v4;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, " Warning ! Could not find mappedParticipant:%llu in linkID %d dictionary:%@", (uint8_t *)&v15, 0x1Cu);
    }

    v12 = 0;
  }
  os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);

  return v12;
}

- (void)_didReceivePacketOfSize:(unint64_t)a3 linkType:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6
{
  int v7;
  id v10;
  id v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[24];
  uint64_t v28;

  v7 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if ((objc_msgSend(v10, "hasReceivedPacket") & 1) == 0)
  {
    objc_msgSend(v10, "setHasReceivedPacket:", 1);
    -[IDSDatagramChannel reportEvent:forLinkID:](self, "reportEvent:forLinkID:", *MEMORY[0x1E0D34780], objc_msgSend(v10, "linkID"));
  }
  ids_monotonic_time();
  objc_msgSend(v10, "setLastPacketReceivedTime:");
  -[IDSDatagramChannel _reportLinkMetricsForLinkContext:](self, "_reportLinkMetricsForLinkContext:", v10);
  v12 = objc_msgSend(v10, "isVirtualRelayLink");
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if ((v12 & 1) != 0)
  {
    if (v14)
    {
      v15 = objc_msgSend(v10, "linkID");
      v16 = objc_msgSend(v10, "delegatedLinkID");
      objc_msgSend(v11, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 134219266;
      v21 = a3;
      v22 = 1024;
      v23 = v7;
      v24 = 1024;
      v25 = v15;
      v26 = 1024;
      *(_DWORD *)v27 = v16;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v17;
      *(_WORD *)&v27[14] = 2048;
      *(_QWORD *)&v27[16] = objc_msgSend(v11, "clientNWConnectionID");
      _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "DCR %zdB (%c %d/%d — %@ [C%llu])", (uint8_t *)&v20, 0x32u);

    }
  }
  else if (v14)
  {
    v18 = objc_msgSend(v10, "linkID");
    objc_msgSend(v11, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134219010;
    v21 = a3;
    v22 = 1024;
    v23 = v7;
    v24 = 1024;
    v25 = v18;
    v26 = 2112;
    *(_QWORD *)v27 = v19;
    *(_WORD *)&v27[8] = 2048;
    *(_QWORD *)&v27[10] = objc_msgSend(v11, "clientNWConnectionID");
    _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "DCR %zdB (%c %d — %@ [C%llu])", (uint8_t *)&v20, 0x2Cu);

  }
}

- (void)_reportLinkMetricsForLinkContext:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  ids_monotonic_time();
  v5 = v4;
  objc_msgSend(v10, "lastPacketReportedTime");
  if (v5 - v6 > 5.0)
  {
    objc_msgSend(v10, "lastPacketReceivedTime");
    v8 = v7;
    objc_msgSend(v10, "lastPacketSentTime");
    -[IDSDatagramChannel reportLastPacketReceivedTime:lastPacketSentTime:linkID:](self, "reportLastPacketReceivedTime:lastPacketSentTime:linkID:", objc_msgSend(v10, "linkID"), v8, v9);
    objc_msgSend(v10, "setLastPacketReportedTime:", v5);
  }

}

- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 linkContext:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  _IDSDataChannelLinkConnection *v11;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = objc_alloc_init(_IDSDataChannelLinkConnection);
  -[IDSDatagramChannel _processIncomingDatagram:datagramSize:linkID:DSCP:linkContext:connectionInfo:](self, "_processIncomingDatagram:datagramSize:linkID:DSCP:linkContext:connectionInfo:", a3, v7, v6, 0, v10, v11);

}

- (void)_processIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 linkID:(char)a5 DSCP:(unsigned __int8)a6 linkContext:(id)a7 connectionInfo:(id)a8
{
  uint64_t v9;
  uint64_t v11;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  int v20;
  int v21;
  uint64_t v22;
  NSMutableDictionary *localRemoteRelayLinkIDToVirtualLinkIDMap;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  NSMutableDictionary *v35;
  void *v36;
  char v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  unsigned int v60;
  char v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[16];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint8_t v76[128];
  uint8_t buf[16];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  unsigned __int16 v85;
  unsigned __int8 v86;
  unsigned int v87;
  _BYTE v88[64];
  int v89;
  unsigned __int16 v90;
  _BYTE v91[688];
  double v92;
  id v93;
  uint64_t v94;

  v9 = a6;
  v11 = *(_QWORD *)&a4;
  v94 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v15 = a8;
  v16 = v14;
  v63 = v15;
  v17 = v11;
  -[IDSDatagramChannel _logReceivingStats:](self, "_logReceivingStats:", v11);
  if (!objc_msgSend(v14, "RATType")
    || (v18 = objc_msgSend(v14, "RATType"), v11 < 4)
    || v18 == 9
    || *(_DWORD *)a3 != -272716322)
  {
    if (objc_msgSend(v14, "connectionType") == 1)
    {
      v84 = 0;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      *(_OWORD *)buf = 0u;
      -[IDSDatagramChannel _didReceivePacketOfSize:linkType:linkContext:connectionInfo:](self, "_didReceivePacketOfSize:linkType:linkContext:connectionInfo:", v11, 80, v14, v63);
      -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", a3, v11, a5 | (unint64_t)(v9 << 32), 0, buf);
      goto LABEL_78;
    }
    bzero(&buf[8], 0x500uLL);
    *(_QWORD *)buf = a3;
    *(_QWORD *)&v78 = v11;
    v86 = v9;
    if (objc_msgSend(v63, "isQUICPod") && objc_msgSend(v14, "connectionType") != 1)
      v20 = StunUtilProcessIncomingChannelDataWithoutChannelHeader();
    else
      v20 = StunUtilProcessIncomingChannelData();
    if (v20)
    {
      if (v89)
      {
        v21 = objc_msgSend(v14, "localRelayLinkID");
        v22 = v90 | (v21 << 16);
        localRemoteRelayLinkIDToVirtualLinkIDMap = self->_internal->_localRemoteRelayLinkIDToVirtualLinkIDMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](localRemoteRelayLinkIDToVirtualLinkIDMap, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          a5 = objc_msgSend(v25, "unsignedShortValue");
        }
        else
        {
          v61 = a5;
          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (v28)
          {
            v58 = v14;
            v29 = *(_QWORD *)v65;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                v31 = v25;
                if (*(_QWORD *)v65 != v29)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                v33 = objc_msgSend(v32, "localRelayLinkID");
                if ((objc_msgSend(v32, "remoteRelayLinkID") | (v33 << 16)) == (_DWORD)v22)
                {
                  v16 = v58;
                  v25 = v31;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", objc_msgSend(v32, "linkID"));
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v35 = self->_internal->_localRemoteRelayLinkIDToVirtualLinkIDMap;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v34, v36);

                  a5 = objc_msgSend(v32, "linkID");
                  goto LABEL_33;
                }
                v25 = v31;
              }
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
              if (v28)
                continue;
              break;
            }
            v16 = v58;
          }
          a5 = v61;
LABEL_33:

        }
      }
      -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", a5);
      v26 = objc_claimAutoreleasedReturnValue();
      v37 = a5;
      if (-[NSObject isVirtualRelayLink](v26, "isVirtualRelayLink"))
        v37 = -[NSObject delegatedLinkID](v26, "delegatedLinkID");
      -[NSObject setTotalPacketsReceivedOnLink:](v26, "setTotalPacketsReceivedOnLink:", -[NSObject totalPacketsReceivedOnLink](v26, "totalPacketsReceivedOnLink") + 1);
      -[IDSDatagramChannel _didReceivePacketOfSize:linkType:linkContext:connectionInfo:](self, "_didReceivePacketOfSize:linkType:linkContext:connectionInfo:", v17, 82, v26, v63);
      v38 = v87;
      if (v87 <= 1)
        v38 = 1;
      if (v38 >= 1)
      {
        v57 = v26;
        v59 = v16;
        v39 = 0;
        v62 = a5;
        v40 = 96 * v38;
        v60 = v37;
        while (1)
        {
          v41 = &buf[v39];
          v75 = 0;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          *(_OWORD *)v68 = 0u;
          v42 = v85;
          v43 = v86;
          v44 = *(_DWORD *)&v91[v39];
          if ((v44 & 1) != 0)
          {
            *(_DWORD *)v68 = 1;
            *(_QWORD *)&v68[8] = -[IDSDatagramChannel _translateParticipantID:forLinkID:](self, "_translateParticipantID:forLinkID:", *((_QWORD *)v41 + 61), v60);
          }
          if ((v44 & 0x10) != 0)
          {
            *(_DWORD *)v68 |= 0x10u;
            LOWORD(v69) = *(_WORD *)&v88[v39 + 42];
            if ((v44 & 8) == 0)
            {
LABEL_45:
              if ((v44 & 2) == 0)
                goto LABEL_51;
              goto LABEL_49;
            }
          }
          else if ((v44 & 8) == 0)
          {
            goto LABEL_45;
          }
          *(_DWORD *)v68 |= 8u;
          BYTE2(v69) = v88[v39 + 40];
          if ((v44 & 2) == 0)
            goto LABEL_51;
LABEL_49:
          *(_DWORD *)v68 |= 2u;
          v45 = *(unsigned int *)&v88[v39 + 4];
          BYTE3(v69) = *(_DWORD *)&v88[v39 + 4];
          if ((int)v45 >= 1)
            memcpy((char *)&v69 + 4, v41 + 464, 2 * v45);
LABEL_51:
          if ((v44 & 0x20) != 0)
          {
            *(_DWORD *)v68 |= 0x20u;
            BYTE12(v70) = v88[v39 + 44];
          }
          if ((v44 & 0x40) != 0)
          {
            *(_DWORD *)v68 |= 0x40u;
            HIWORD(v70) = *(_WORD *)&v88[v39 + 48];
            WORD4(v71) = *(_WORD *)&v88[v39 + 58];
            *(_QWORD *)&v71 = *(_QWORD *)&v88[v39 + 50];
          }
          if (v92 > 0.0)
          {
            *(double *)&v72 = v92;
            if ((v44 & 4) == 0)
            {
LABEL_57:
              if ((v44 & 0x80) == 0)
                goto LABEL_58;
              goto LABEL_65;
            }
          }
          else if ((v44 & 4) == 0)
          {
            goto LABEL_57;
          }
          *(_DWORD *)v68 |= 4u;
          if ((v44 & 0x80) == 0)
          {
LABEL_58:
            if ((v44 & 0x100) == 0)
              goto LABEL_59;
            goto LABEL_66;
          }
LABEL_65:
          *(_DWORD *)v68 |= 0x80u;
          if ((v44 & 0x100) == 0)
          {
LABEL_59:
            if ((v44 & 0x10000) == 0)
              goto LABEL_60;
            goto LABEL_67;
          }
LABEL_66:
          *(_DWORD *)v68 |= 0x100u;
          if ((v44 & 0x10000) == 0)
          {
LABEL_60:
            if ((v44 & 0x20000) == 0)
              goto LABEL_61;
            goto LABEL_68;
          }
LABEL_67:
          *(_DWORD *)v68 |= 0x10000u;
          LOBYTE(v75) = 1;
          if ((v44 & 0x20000) == 0)
          {
LABEL_61:
            if ((v44 & 0x400) != 0)
              goto LABEL_71;
            goto LABEL_69;
          }
LABEL_68:
          *(_DWORD *)v68 |= 0x20000u;
          BYTE1(v75) = 1;
          if ((v44 & 0x400) != 0)
          {
LABEL_71:
            *(_DWORD *)v68 |= 0x400u;
            LOBYTE(v73) = 1;
            v26 = v57;
            -[NSObject hbhDecryptionkey](v57, "hbhDecryptionkey", v92, v57);
            v16 = v59;
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            IDSHBHDecryptDataWithKey();
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              v48 = objc_retainAutorelease(v47);
              -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", objc_msgSend(v48, "bytes"), objc_msgSend(v48, "length"), (v43 << 32) | (v42 << 16) | v62, 0, v68);
            }
            else
            {
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                sub_1907FAE84(v49, v50, v51, v52, v53, v54, v55, v56);

            }
            break;
          }
LABEL_69:
          -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", *((_QWORD *)v41 + 56), *(unsigned __int16 *)&v88[v39], (v43 << 32) | (v42 << 16) | v62, 0, v68, v92, v57);
          v39 += 96;
          if (v40 == v39)
          {
            v26 = v57;
            v16 = v59;
            break;
          }
        }
      }
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "Error in _processIncomingDatagram: StunUtilProcessIncomingChannelData returned false.", v68, 2u);
      }
    }

    goto LABEL_78;
  }
  if (self->_internal->_verboseFunctionalLogging)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "received baseband notification packet.", buf, 2u);
    }

  }
  v84 = 0;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  *(_OWORD *)buf = 0u;
  -[IDSDatagramChannel handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:](self, "handleIncomingDatagram:datagramSize:datagramInfo:datagramOptions:", a3, v11, a5, 0, buf);
LABEL_78:

}

- (id)createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[IDSDatagramChannel _directConnectionsForLinkID:](self, "_directConnectionsForLinkID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSDatagramChannel _setLinkContext:forLinkID:](self, "_setLinkContext:forLinkID:", v6, v4);
    objc_msgSend(v7, "qpodConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "qpodConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v10;
        _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID child qpod connection already created previously: %@", (uint8_t *)&v20, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "connections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "qpod");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSDatagramChannel _createIfNecessaryDirectConnectionForLinkID:linkContext:connection:](self, "_createIfNecessaryDirectConnectionForLinkID:linkContext:connection:", v4, v6, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setQpodConnection:", v13);
    }
    objc_msgSend(v7, "udpConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "udpConnection");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v16;
        _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID child udp connection already created previously: %@", (uint8_t *)&v20, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "connections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "udp");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSDatagramChannel _createIfNecessaryDirectConnectionForLinkID:linkContext:connection:](self, "_createIfNecessaryDirectConnectionForLinkID:linkContext:connection:", v4, v6, v18);
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setUdpConnection:", v15);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_createIfNecessaryDirectConnectionForLinkID:(char)a3 linkContext:(id)a4 connection:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int is_null;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  NSObject *v26;
  _QWORD handler[4];
  NSObject *v28;
  id v29;
  IDSDatagramChannel *v30;
  id v31;
  char v32;
  uint8_t buf[4];
  _BYTE v34[14];
  __int16 v35;
  id v36;
  unsigned __int8 uu[8];
  uint64_t v38;
  uint64_t v39;

  v6 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "childConnectionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 <= 0)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: linkID has to be greater than 0.", buf, 2u);
      }

      v16 = 0;
      goto LABEL_33;
    }

    *(_QWORD *)uu = 0;
    v38 = 0;
    if (v11)
    {
      objc_msgSend(v11, "getUUIDBytes:", uu);
      is_null = uuid_is_null(uu);
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!is_null)
      {
        if (v14)
        {
          *(_DWORD *)buf = 67109634;
          if (objc_msgSend(v8, "connectionType") == 1)
            v18 = 80;
          else
            v18 = 82;
          *(_DWORD *)v34 = v18;
          *(_WORD *)&v34[4] = 2112;
          *(_QWORD *)&v34[6] = v11;
          v35 = 2112;
          v36 = v8;
          _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID create connection (%c) with client ID %@ for linkContext %@", buf, 0x1Cu);
        }

        v19 = nw_connection_create_with_client_id();
        v13 = v19;
        if (v19)
        {
          v20 = nw_connection_copy_current_path(v19);
          if (v20 && (nw_path_uses_nexus() & 1) == 0)
          {
            +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v34 = v20;
              _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: nexus is not supported for path :%@.", buf, 0xCu);
            }
            v16 = 0;
          }
          else
          {
            v21 = nw_connection_copy_parameters(v13);
            v26 = nw_parameters_copy_default_protocol_stack(v21);
            v22 = nw_protocol_stack_copy_internet_protocol(v26);
            nw_ip_options_set_disable_fragmentation(v22, 0);
            nw_connection_set_queue(v13, (dispatch_queue_t)self->_internal->_queue);
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = sub_1907B32A4;
            handler[3] = &unk_1E2C648F8;
            v23 = v13;
            v28 = v23;
            v29 = v8;
            v30 = self;
            v32 = v6;
            v24 = v10;
            v31 = v24;
            nw_connection_set_state_changed_handler(v23, handler);
            objc_msgSend(v24, "setClientNWConnectionID:", nw_connection_get_id());
            nw_connection_start(v23);
            v16 = v23;

          }
        }
        else
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID failed to create child connection", buf, 2u);
          }
          v16 = 0;
        }

        goto LABEL_32;
      }
      if (v14)
      {
        *(_WORD *)buf = 0;
        v15 = "addDirectConnectionForLinkID missing child connection ID - skip for now.";
LABEL_13:
        _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
      }
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v15 = "addDirectConnectionForLinkID missing child connection ID - skip for now";
        goto LABEL_13;
      }
    }
    v16 = 0;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v16 = 0;
LABEL_34:

  return v16;
}

- (void)addDirectConnectionForLinkID:(char)a3 linkContext:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  IDSDatagramChannel *v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218498;
    v14 = self;
    v15 = 1024;
    *(_DWORD *)v16 = v4;
    *(_WORD *)&v16[4] = 2112;
    *(_QWORD *)&v16[6] = v6;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "<%p> addDirectConnectionForLinkID linkID: %d %@", (uint8_t *)&v13, 0x1Cu);
  }

  -[IDSDatagramChannel _startStatsTimer](self, "_startStatsTimer");
  v8 = v4;
  if (objc_msgSend(v6, "isVirtualRelayLink"))
    v8 = objc_msgSend(v6, "delegatedLinkID");
  if ((objc_msgSend(v6, "isVirtualRelayLink") & 1) != 0)
  {
    -[IDSDatagramChannel _underlyingLinkContextForLinkID:](self, "_underlyingLinkContextForLinkID:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v6;
  }
  v10 = v9;
  -[IDSDatagramChannel createIfNecessaryDirectConnectionForLinkID:linkContext:](self, "createIfNecessaryDirectConnectionForLinkID:linkContext:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isVirtualRelayLink"))
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218754;
      v14 = self;
      v15 = 2112;
      *(_QWORD *)v16 = v11;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v8;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%p> addDirectConnectionForLinkID - associating connection %@ from linkID %d with virtual linkID %d", (uint8_t *)&v13, 0x22u);
    }

    -[IDSDatagramChannel _setLinkContext:forLinkID:](self, "_setLinkContext:forLinkID:", v6, v4);
    -[IDSDatagramChannel _setDirectConnections:forLinkID:](self, "_setDirectConnections:forLinkID:", v11, v4);
  }

}

- (void)removeDirectConnectionsForLinkID:(char)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  IDSDataChannelsDirectConnections **directConnectionsByLinkID;
  IDSDataChannelsDirectConnections *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  IDSDatagramChannel *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218240;
    v17 = self;
    v18 = 1024;
    v19 = v3;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%p> removeDirectConnectionForLinkID linkID: %d", (uint8_t *)&v16, 0x12u);
  }

  -[IDSDatagramChannel _directConnectionsForLinkID:](self, "_directConnectionsForLinkID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  directConnectionsByLinkID = self->_internal->_directConnectionsByLinkID;
  v8 = directConnectionsByLinkID[(int)v3];
  directConnectionsByLinkID[(int)v3] = 0;

  -[IDSDatagramChannel _underlyingLinkContextForLinkID:](self, "_underlyingLinkContextForLinkID:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isVirtualRelayLink") & 1) == 0 && v6)
  {
    objc_msgSend(v6, "udpConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "udpConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSDatagramChannel _removeDirectConnection:](self, "_removeDirectConnection:", v11);

      objc_msgSend(v6, "udpConnection");
      v12 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v12);

    }
    objc_msgSend(v6, "qpodConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "qpodConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSDatagramChannel _removeDirectConnection:](self, "_removeDirectConnection:", v14);

      objc_msgSend(v6, "qpodConnection");
      v15 = objc_claimAutoreleasedReturnValue();
      nw_connection_cancel(v15);

    }
    v6 = 0;
  }

}

- (BOOL)isDaemonConnection:(id)a3
{
  return self->_internal->_connection == a3;
}

- (id)connectionForLinkID:(char)a3
{
  _IDSDatagramChannel *internal;
  OS_nw_connection *v5;

  internal = self->_internal;
  if (internal->_preferredDataPathType != 1)
    goto LABEL_4;
  -[IDSDatagramChannel _directOrDaemonConnectionForLinkID:](self, "_directOrDaemonConnectionForLinkID:", a3);
  v5 = (OS_nw_connection *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    internal = self->_internal;
LABEL_4:
    v5 = internal->_connection;
  }
  return v5;
}

- (void)_readFromDirectConnection:(id)a3 linkID:(char)a4 linkContext:(id)a5 connectionInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  IDSDatagramChannel *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  if (self->_internal->_isInvalidated)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "Direct connection is invalidated. Skipping <%@> direct read.", buf, 0xCu);
    }

  }
  else
  {
    v13 = v10;
    v14 = v9;
    v15 = v11;
    nw_connection_receive_multiple();

  }
}

- ($988D82359F2BAE314798199717957CF0)_makeDirectPacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8 linkContext:(id)a9
{
  uint64_t v9;
  id v13;
  $988D82359F2BAE314798199717957CF0 *v14;
  NSObject *v15;
  uint64_t v16;
  size_t v17;
  NSObject *v18;
  unsigned int var0;
  uint64_t var4;
  unsigned __int16 *var5;
  unsigned __int16 *var3;
  unsigned __int16 v23;
  int v24;
  int v25;
  NSObject *v26;
  int64_t var2;
  int v28;
  NSObject *v29;
  void *v31;
  void *v32;
  unint64_t var1;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  id v50;
  $988D82359F2BAE314798199717957CF0 *v51;
  uint8_t buf[4];
  int64_t v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v9 = *(_QWORD *)&a7.var0;
  v58 = *MEMORY[0x1E0C80C00];
  v13 = a9;
  v14 = ($988D82359F2BAE314798199717957CF0 *)_IDSLinkPacketBufferCreate();
  v51 = v14;
  if (v14->var1 < a4)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = a4;
      _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: datagramSize is %u, and exceeds IDSLinkPacketBuffer limit", buf, 8u);
    }

    _IDSLinkPacketBufferRelease();
    goto LABEL_47;
  }
  v16 = (char)v9;
  v17 = a4;
  if (!a4)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: datagramSize has no data", buf, 2u);
    }

  }
  memcpy(v14->var0, a3, v17);
  v14->var2 = v17;
  if ((int)v16 < 1)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = (char)v9;
      _os_log_impl(&dword_1906E0000, v29, OS_LOG_TYPE_DEFAULT, "_makeDirectPacketBufferFromDatagram: wrong linkID %d.", buf, 8u);
    }

    goto LABEL_47;
  }
  v14->var24 = v9;
  if (WORD1(v9))
    v14->var20 = WORD1(v9);
  if (BYTE4(v9))
    v14->var21 = BYTE4(v9);
  if (objc_msgSend(v13, "connectionType") != 1)
  {
    if (!a8)
    {
LABEL_39:
      objc_msgSend(v13, "connectionType");
      objc_msgSend(v13, "channelNumber");
      v24 = StunUtilPrepareOutgoingChannelData();
      if (self->_internal->_verboseFunctionalLogging)
      {
        v25 = v24;
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          var2 = v51->var2;
          v28 = objc_msgSend(v13, "channelNumber");
          *(_DWORD *)buf = 134218496;
          v53 = var2;
          v54 = 1024;
          v55 = v25;
          v56 = 1024;
          v57 = v28;
          _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "QuickRelayHeaderDebug _makeDirectPacketBufferFromDatagram: packetBufferSize is %zd, result:%d, channel number:%d", buf, 0x18u);
        }

      }
      v14 = v51;
      goto LABEL_48;
    }
    var0 = a8->var0;
    if ((a8->var0 & 1) != 0)
    {
      v14->var23[0].var20 |= 1u;
      if (objc_msgSend(v13, "isVirtualRelayLink"))
        v16 = objc_msgSend(v13, "delegatedLinkID");
      v14->var23[0].var4 = -[IDSDatagramChannel _translateParticipantID:forLinkID:](self, "_translateParticipantID:forLinkID:", a8->var1, v16);
      var0 = a8->var0;
    }
    if ((var0 & 2) != 0)
    {
      v14->var23[0].var20 |= 2u;
      var4 = a8->var4;
      v14->var23[0].var2 = var4;
      if ((int)var4 >= 1)
      {
        var5 = a8->var5;
        var3 = v14->var23[0].var3;
        do
        {
          v23 = *var5++;
          *var3++ = v23;
          --var4;
        }
        while (var4);
      }
    }
    if ((var0 & 0x10) != 0)
    {
      v14->var23[0].var20 |= 0x10u;
      v14->var23[0].var6 = a8->var2;
      if ((var0 & 0x40) == 0)
      {
LABEL_26:
        if ((var0 & 8) == 0)
          goto LABEL_27;
        goto LABEL_51;
      }
    }
    else if ((var0 & 0x40) == 0)
    {
      goto LABEL_26;
    }
    v14->var23[0].var20 |= 0x40u;
    v14->var23[0].var10 = a8->var7;
    if ((var0 & 8) == 0)
    {
LABEL_27:
      if ((var0 & 0x20) == 0)
        goto LABEL_28;
      goto LABEL_52;
    }
LABEL_51:
    v14->var23[0].var20 |= 8u;
    v14->var23[0].var5 = a8->var3;
    if ((var0 & 0x20) == 0)
    {
LABEL_28:
      if ((var0 & 4) == 0)
        goto LABEL_29;
      goto LABEL_53;
    }
LABEL_52:
    v14->var23[0].var20 |= 0x20u;
    v14->var23[0].var7 = a8->var6;
    if ((var0 & 4) == 0)
    {
LABEL_29:
      if ((var0 & 0x400) == 0)
        goto LABEL_30;
      goto LABEL_54;
    }
LABEL_53:
    v14->var23[0].var20 |= 4u;
    v14->var23[0].var8 = 1;
    if ((var0 & 0x400) == 0)
    {
LABEL_30:
      if ((var0 & 0x100) == 0)
        goto LABEL_31;
      goto LABEL_63;
    }
LABEL_54:
    v14->var23[0].var20 |= 0x400u;
    v14->var23[0].var13 = 1;
    objc_msgSend(v13, "hbhEncryptionkey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    IDSHBHEncryptDataWithKey();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      var1 = v14->var1;
      if (var1 >= objc_msgSend(v32, "length"))
      {
        v14->var2 = objc_msgSend(v32, "length");
        v49 = v14->var0;
        v50 = objc_retainAutorelease(v32);
        memcpy(v49, (const void *)objc_msgSend(v50, "bytes"), v14->var2);

        var0 = a8->var0;
        if ((a8->var0 & 0x100) == 0)
        {
LABEL_31:
          if ((var0 & 0x80) == 0)
            goto LABEL_32;
          goto LABEL_64;
        }
LABEL_63:
        v14->var23[0].var20 |= 0x100u;
        v14->var23[0].var12 = 1;
        if ((var0 & 0x80) == 0)
        {
LABEL_32:
          if ((var0 & 0x10000) == 0)
            goto LABEL_33;
          goto LABEL_65;
        }
LABEL_64:
        v14->var23[0].var20 |= 0x80u;
        v14->var23[0].var9 = 1;
        if ((var0 & 0x10000) == 0)
        {
LABEL_33:
          if ((var0 & 0x20000) == 0)
          {
LABEL_35:
            if (objc_msgSend(v13, "isVirtualRelayLink"))
            {
              v14->var23[0].var20 |= 0x800u;
              v14->var23[0].var14 = 1;
              v14->var23[0].var15[0] = objc_msgSend(v13, "remoteRelayLinkID");
            }
            if ((a8->var0 & 0x8000) != 0)
              -[IDSDatagramChannel _sendSequenceNumberMetadataToDaemon:](self, "_sendSequenceNumberMetadataToDaemon:", a8->var12);
            goto LABEL_39;
          }
LABEL_34:
          v14->var23[0].var20 |= 0x20000u;
          v14->var23[0].var18 = 1;
          goto LABEL_35;
        }
LABEL_65:
        v14->var23[0].var20 |= 0x10000u;
        v14->var23[0].var17 = 1;
        if ((var0 & 0x20000) == 0)
          goto LABEL_35;
        goto LABEL_34;
      }
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_1907FAEE4(v34, v35, v36, v37, v38, v39, v40, v41);
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_1907FAEB4(v34, v42, v43, v44, v45, v46, v47, v48);
    }

    _IDSLinkPacketBufferRelease();
LABEL_47:
    v14 = 0;
  }
LABEL_48:

  return v14;
}

- (void)_sendStatsRequestViaDaemon
{
  os_unfair_lock_s *p_readLock;
  CFMutableDictionaryRef Mutable;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD *v9;
  __int128 v10;
  NSMutableArray *sendingMetadata;
  void *v12;
  __int128 v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  if (!self->_internal->_isInvalidated)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", Mutable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((unint64_t)objc_msgSend(v5, "length") <= 0x1000)
      {
        v8 = objc_retainAutorelease(v6);
        objc_msgSend(v8, "bytes");
        v9 = (_QWORD *)_IDSLinkPacketBufferCreate();
        v15 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v13 = v10;
        v14 = v10;
        IDSByteBufferInitForWriteWithAllocatedSpace();
        objc_msgSend(v8, "length", v13);
        IDSByteBufferWriteField();
        v9[2] = v14 - *v9;
        IDSByteBufferRelease();
        -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v9);
        os_unfair_lock_lock(&self->_internal->_writeLock);
        sendingMetadata = self->_internal->_sendingMetadata;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](sendingMetadata, "addObject:", v12);

        -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
        os_unfair_lock_unlock(&self->_internal->_writeLock);
        goto LABEL_11;
      }
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v13) = 134217984;
        *(_QWORD *)((char *)&v13 + 4) = objc_msgSend(v6, "length");
        _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "_sendStatsRequestViaDaemon: serialized metadata size: %lu, greater than max allowed sent size, return", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "_sendStatsRequestViaDaemon: invalid stats data, return", (uint8_t *)&v13, 2u);
      }
    }

LABEL_11:
  }
  os_unfair_lock_unlock(p_readLock);
}

- (void)_sendSequenceNumberMetadataToDaemon:(unint64_t)a3
{
  _QWORD *v4;
  __int128 v5;
  NSMutableArray *sendingMetadata;
  void *v7;
  __int128 v8;

  v4 = (_QWORD *)_IDSLinkPacketBufferCreate();
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8 = v5;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  IDSByteBufferWriteField();
  v4[2] = 0xAAAAAAAAAAAAAAAALL - *v4;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v4, v8);
  os_unfair_lock_assert_owner(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v7);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
}

- (void)_writeToDirectConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v15;
  void *v16;
  $988D82359F2BAE314798199717957CF0 *v17;
  uint64_t v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unsigned int var0;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD completion[4];
  id v40;
  IDSDatagramChannel *v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  $988D82359F2BAE314798199717957CF0 *v46;
  int v47;
  char v48;
  unsigned __int8 v49;

  v10 = a7;
  v11 = a6;
  v12 = *(_QWORD *)&a5;
  v37 = a3;
  v38 = (void *)objc_msgSend(a10, "copy");
  v15 = (void *)objc_msgSend(self->_internal->_writeHandler, "copy");
  -[IDSDatagramChannel _underlyingLinkContextForLinkID:](self, "_underlyingLinkContextForLinkID:", a8.var0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[IDSDatagramChannel _makeDirectPacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:linkContext:](self, "_makeDirectPacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:linkContext:", a4, v12, v11, v10, *(_QWORD *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9, v16);
  v18 = objc_msgSend(v16, "connectionType");
  v36 = v16;
  v19 = objc_msgSend(v16, "isQUICPod");
  if (v17)
  {
    v20 = v19;
    v21 = v38;
    if ((v19 & (v18 != 1)) != 0)
      v22 = 4;
    else
      v22 = 0;
    v35 = (void *)sub_19075017C(v17, v22);
    v23 = (id)*MEMORY[0x1E0CCECE8];
    v24 = v23;
    if ((a9->var0 & 0x40000) != 0
      || (a9->var0 & 0x200) != 0
      || (*(_DWORD *)&a8.var0 & 0xFFFF0000) != 0
      || (*(_QWORD *)&a8.var0 & 0xFF00000000) != 0)
    {
      v25 = nw_content_context_create("IDSDC packet metadata");

      var0 = a9->var0;
      if ((a9->var0 & 0x40000) != 0)
      {
        nw_content_context_set_packet_id();
        var0 = a9->var0;
      }
      if ((var0 & 0x200) != 0)
        nw_content_context_set_expiration_milliseconds(v25, a9->var10);
      sub_1907B4A90(a8.var1, a8.var2);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
        nw_content_context_set_metadata_for_protocol(v25, v28);

      v26 = v37;
      v21 = v38;
    }
    else
    {
      v25 = v23;
      v26 = v37;
    }
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = sub_1907B4BC8;
    completion[3] = &unk_1E2C64948;
    v47 = v12;
    v40 = v36;
    v41 = self;
    v48 = a8.var0;
    v49 = v20;
    v46 = v17;
    v42 = v26;
    v43 = v35;
    v44 = v21;
    v45 = v15;
    v29 = v36;
    v30 = v35;
    nw_connection_send(v42, v30, v25, 1, completion);

  }
  else
  {
    v31 = objc_alloc(MEMORY[0x1E0C99D80]);
    v32 = (void *)objc_msgSend(v31, "initWithObjectsAndKeys:", CFSTR("Not enough packet buffer space"), *MEMORY[0x1E0CB2D50], 0);
    v33 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = (void *)objc_msgSend(v33, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 6, v32);
    v21 = v38;
    sub_1907502EC(v38, v15, v34, v12);

    v29 = v36;
    v26 = v37;
  }

}

- (void)setLinkIDToParticipantMap:(id)a3
{
  uint64_t v4;
  _IDSDatagramChannel *internal;
  NSMutableDictionary *linkIDToParticipantMap;

  v4 = objc_msgSend(a3, "mutableCopy");
  internal = self->_internal;
  linkIDToParticipantMap = internal->_linkIDToParticipantMap;
  internal->_linkIDToParticipantMap = (NSMutableDictionary *)v4;

}

- (id)getNwProtocolMetaDataForTrafficClass:(unsigned __int16)a3
{
  return sub_1907B4A90(a3, 0);
}

- (id)getContext
{
  return self->_internal->_context;
}

- (id)getQueue
{
  return self->_internal->_queue;
}

- (id)getDispatchDataForPacketBuffer:(id *)a3
{
  return (id)sub_19075017C(a3, 0);
}

- (id)getIDSDataChannelsQueue
{
  if (qword_1EE1E3920 != -1)
    dispatch_once(&qword_1EE1E3920, &unk_1E2C5FD50);
  return (id)qword_1EE1E3928;
}

- (NSArray)connectedLinks
{
  void *v3;

  os_unfair_lock_lock(&self->_internal->_linkContextsLock);
  -[NSMutableDictionary allValues](self->_internal->_linkContexts, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_internal->_linkContextsLock);
  return (NSArray *)v3;
}

- (id)_linkContextsCopy
{
  void *v3;

  os_unfair_lock_lock(&self->_internal->_linkContextsLock);
  v3 = (void *)-[NSMutableDictionary copy](self->_internal->_linkContexts, "copy");
  os_unfair_lock_unlock(&self->_internal->_linkContextsLock);
  return v3;
}

- (void)_removeLinkContextWithID:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_linkContextsLock;
  NSMutableDictionary *linkContexts;
  void *v7;

  v3 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](linkContexts, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_linkContextsLock);
}

- (void)_setLinkContext:(id)a3 forLinkID:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  os_unfair_lock_s *p_linkContextsLock;
  NSMutableDictionary *linkContexts;
  void *v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](linkContexts, "setObject:forKey:", v6, v9);

  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109378;
    v11[1] = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "LinkID %d associated with LinkContext %@", (uint8_t *)v11, 0x12u);
  }

  os_unfair_lock_unlock(p_linkContextsLock);
}

- (id)_linkContextWithID:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_linkContextsLock;
  NSMutableDictionary *linkContexts;
  void *v7;
  void *v8;

  v3 = a3;
  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  linkContexts = self->_internal->_linkContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](linkContexts, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_linkContextsLock);
  return v8;
}

- (IDSDataChannelLinkContext)defaultLink
{
  os_unfair_lock_s *p_linkContextsLock;
  _IDSDatagramChannel *internal;
  NSMutableDictionary *linkContexts;
  void *v6;
  void *v7;
  IDSDataChannelLinkContext *v8;
  IDSDataChannelLinkContext *v9;

  p_linkContextsLock = &self->_internal->_linkContextsLock;
  os_unfair_lock_lock(p_linkContextsLock);
  internal = self->_internal;
  linkContexts = internal->_linkContexts;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", internal->_defaultLinkID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](linkContexts, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || self->_internal->_socketDescriptor < 1)
    v8 = v7;
  else
    v8 = -[IDSDataChannelLinkContext initWithDummyInformation]([IDSDataChannelLinkContext alloc], "initWithDummyInformation");
  v9 = v8;

  os_unfair_lock_unlock(p_linkContextsLock);
  return v9;
}

- (IDSDatagramChannel)initWithSocketDescriptor:(int)a3
{
  int v5;
  NSObject *v6;
  NSObject *v7;
  IDSDatagramChannel *v8;
  _IDSDatagramChannel *v9;
  _IDSDatagramChannel *internal;
  _IDSDatagramChannel *v11;
  NSMutableDictionary *v12;
  _IDSDatagramChannel *v13;
  NSMutableDictionary *linkContexts;
  uint64_t v15;
  _IDSDatagramChannel *v16;
  OS_nw_context *context;
  uint64_t v18;
  _IDSDatagramChannel *v19;
  OS_dispatch_queue *queue;
  objc_super v22;
  uint8_t buf[4];
  IDSDatagramChannel *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = _IDSRunningInDaemon();
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1907E9514();

    goto LABEL_5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v24 = self;
    v25 = 1024;
    v26 = a3;
    _os_log_impl(&dword_1906E0000, v7, OS_LOG_TYPE_DEFAULT, "<%p> Creating with socket %d", buf, 0x12u);
  }

  v22.receiver = self;
  v22.super_class = (Class)IDSDatagramChannel;
  self = -[IDSDatagramChannel init](&v22, sel_init);
  if (!self)
  {
LABEL_11:
    self = self;
    v8 = self;
    goto LABEL_12;
  }
  v9 = objc_alloc_init(_IDSDatagramChannel);
  internal = self->_internal;
  self->_internal = v9;

  v11 = self->_internal;
  if (v11)
  {
    v11->_socketDescriptor = a3;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = self->_internal;
    linkContexts = v13->_linkContexts;
    v13->_linkContexts = v12;

    self->_internal->_connected = 1;
    self->_internal->_operationMode = 0;
    IDSRealTimeContext();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = self->_internal;
    context = v16->_context;
    v16->_context = (OS_nw_context *)v15;

    -[IDSDatagramChannel getIDSDataChannelsQueue]_0();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = self->_internal;
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v18;

    goto LABEL_11;
  }
LABEL_5:
  v8 = 0;
LABEL_12:

  return v8;
}

- (IDSDatagramChannel)initWithDestination:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  _IDSDatagramChannel *v11;
  _IDSDatagramChannel *internal;
  _IDSDatagramChannel **p_internal;
  NSMutableDictionary *v14;
  NSMutableDictionary *linkContexts;
  NSMutableArray *v16;
  NSMutableArray *sendingMetadata;
  NSObject *v18;
  int64_t operationMode;
  uint64_t v20;
  _IDSDatagramChannel *v21;
  OS_nw_context *context;
  OS_dispatch_queue *v23;
  OS_dispatch_queue *queue;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _IDSDatagramChannel *v28;
  OS_nw_context *v29;
  NSObject *v30;
  OS_nw_context *v31;
  NSObject *v32;
  int64_t v33;
  _IDSDatagramChannel *v34;
  NSObject *v35;
  NSObject *v36;
  _IDSDatagramChannel *v37;
  const __CFString *v38;
  int64_t preferredDataPathType;
  int64_t v40;
  const __CFString *v41;
  NSObject *v42;
  id v43;
  pid_t v44;
  uint64_t v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  _IDSDatagramChannel *v49;
  _IDSDatagramChannel **v50;
  NSMutableDictionary *MKIArrivalTime;
  uint64_t v52;
  NSMutableDictionary *firstPacketArrivalTimeForMKI;
  uint64_t v54;
  NSMutableDictionary *probingDict;
  int64_t v56;
  dispatch_semaphore_t v57;
  NSObject *host;
  uint64_t evaluator_for_endpoint;
  _IDSDatagramChannel *v60;
  OS_nw_path_evaluator *pathEvaluator;
  void *v62;
  NSObject *connection;
  double v64;
  dispatch_time_t v65;
  NSObject *v66;
  int v67;
  _IDSDatagramChannel *v68;
  _BOOL4 connected;
  channel *osChannel;
  OS_nw_path_evaluator *v71;
  double v72;
  const __CFString *v73;
  _IDSDatagramChannel *v74;
  const __CFString *v75;
  int64_t v76;
  int64_t v77;
  _IDSDatagramChannel *v78;
  NSObject *v79;
  NSObject *v80;
  dispatch_queue_t v81;
  _IDSDatagramChannel *v82;
  OS_dispatch_queue *v83;
  nw_connection_t v84;
  _IDSDatagramChannel *v85;
  IDSDatagramChannel *v86;
  NSObject *v87;
  int64_t v88;
  int v89;
  NSObject *v90;
  NSObject *v91;
  const char *v92;
  NSObject *log;
  void *v95;
  IDSDatagramChannel *v96;
  void *v97;
  void *v98;
  xpc_object_t v99;
  xpc_object_t xarray;
  objc_super v101;
  _BYTE buf[62];
  __int16 v103;
  double v104;
  __int16 v105;
  int v106;
  __int16 v107;
  int v108;
  uint8_t v109[8];
  __int128 v110;
  char v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _IDSRunningInDaemon();
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1907FB0B8();

    goto LABEL_78;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Creating with destination %@", buf, 0x16u);
  }

  v101.receiver = self;
  v101.super_class = (Class)IDSDatagramChannel;
  self = -[IDSDatagramChannel init](&v101, sel_init);
  if (self)
  {
    v11 = objc_alloc_init(_IDSDatagramChannel);
    internal = self->_internal;
    self->_internal = v11;

    if (!self->_internal)
    {
LABEL_78:
      v86 = 0;
      goto LABEL_79;
    }
    self->_internal->_osChannelFD = -1;
    p_internal = &self->_internal;
    self->_internal->_socketDescriptor = -1;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    linkContexts = self->_internal->_linkContexts;
    (*p_internal)->_linkContexts = v14;

    (*p_internal)->_linkContextsLock._os_unfair_lock_opaque = 0;
    (*p_internal)->_linkIDToParticipantMapLock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sendingMetadata = self->_internal->_sendingMetadata;
    (*p_internal)->_sendingMetadata = v16;

    (*p_internal)->_hasMetadata = 1;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D345C0]);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      self->_internal->_operationMode = objc_msgSend(v98, "integerValue");
      if (self->_internal->_operationMode < 2uLL)
        goto LABEL_15;
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        operationMode = self->_internal->_operationMode;
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = operationMode;
        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "<%p> Invalid operation mode value %ld - defaulting to IDSDatagramChannelOperationModeFileDescriptor", buf, 0x16u);
      }

    }
    self->_internal->_operationMode = 0;
LABEL_15:
    IDSRealTimeContext();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = self->_internal;
    context = v21->_context;
    v21->_context = (OS_nw_context *)v20;

    -[IDSDatagramChannel getIDSDataChannelsQueue]_0();
    v23 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    queue = self->_internal->_queue;
    self->_internal->_queue = v23;

    v25 = *MEMORY[0x1E0D345B8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D345B8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v25);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = self->_internal;
      v29 = v28->_context;
      v28->_context = (OS_nw_context *)v27;

      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_internal->_context;
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "<%p> Got IDSDatagramChannelNWContextKey %@ from client.", buf, 0x16u);
      }

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D345C8]);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      self->_internal->_preferredDataPathType = objc_msgSend(v97, "integerValue");
      if (self->_internal->_preferredDataPathType < 2uLL)
      {
LABEL_25:
        v34 = self->_internal;
        if (!v34->_operationMode && v34->_preferredDataPathType == 1)
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "<%p> Shared direct data path not compatible with file descriptor mode - defaulting to IDSDatagramChannelDataPathThroughIDSDaemon", buf, 0xCu);
          }

          self->_internal->_preferredDataPathType = 0;
        }
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = self->_internal;
          v38 = CFSTR("Dispatch");
          v40 = v37->_operationMode;
          preferredDataPathType = v37->_preferredDataPathType;
          if (!v40)
            v38 = CFSTR("FileDescriptor");
          v41 = CFSTR("Direct");
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = self;
          if (!preferredDataPathType)
            v41 = CFSTR("Daemon");
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v38;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v40;
          *(_WORD *)&buf[28] = 2112;
          *(_QWORD *)&buf[30] = v41;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = preferredDataPathType;
          _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "<%p> Operation mode %@ (%d) preferred datapath %@ (%d)", buf, 0x2Cu);
        }

        v42 = nw_parameters_create();
        nw_parameters_set_indefinite();
        xarray = xpc_array_create(0, 0);
        v99 = xpc_array_create(0, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%u"), *MEMORY[0x1E0D34990], getuid());
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_array_set_string(xarray, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v43, "UTF8String"));

        xpc_array_set_string(v99, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend((id)*MEMORY[0x1E0D34988], "UTF8String"));
        nw_parameters_set_data_mode();
        nw_parameters_set_required_netagent_classes();
        nw_parameters_set_context();
        if (self->_internal->_preferredDataPathType == 1)
        {
          v44 = getpid();
          memset(buf, 0, 56);
          if (!proc_pidinfo(v44, 17, 1uLL, buf, 56))
          {
            v89 = *__error();
            +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
            v90 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v109 = 67109376;
              *(_DWORD *)&v109[4] = v44;
              LOWORD(v110) = 1024;
              *(_DWORD *)((char *)&v110 + 2) = v89;
              _os_log_impl(&dword_1906E0000, v90, OS_LOG_TYPE_DEFAULT, "proc_pidinfo for pid %d failed (errno: %d)", v109, 0xEu);
            }

            goto LABEL_77;
          }
          v45 = *(_QWORD *)&buf[16];
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v109 = 67109376;
            *(_DWORD *)&v109[4] = v44;
            LOWORD(v110) = 2048;
            *(_QWORD *)((char *)&v110 + 2) = v45;
            _os_log_impl(&dword_1906E0000, v46, OS_LOG_TYPE_DEFAULT, "proc_pidinfo for pid %d returned client unique PID %llu", v109, 0x12u);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v45);
          v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v47, "UTF8String");
          nw_parameters_set_account_id();

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v48 = objc_claimAutoreleasedReturnValue();
        v50 = &self->_internal;
        v49 = self->_internal;
        MKIArrivalTime = v49->_MKIArrivalTime;
        v49->_MKIArrivalTime = (NSMutableDictionary *)v48;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v52 = objc_claimAutoreleasedReturnValue();
        firstPacketArrivalTimeForMKI = self->_internal->_firstPacketArrivalTimeForMKI;
        (*v50)->_firstPacketArrivalTimeForMKI = (NSMutableDictionary *)v52;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v54 = objc_claimAutoreleasedReturnValue();
        probingDict = self->_internal->_probingDict;
        (*v50)->_probingDict = (NSMutableDictionary *)v54;

        (*v50)->_writeLock._os_unfair_lock_opaque = 0;
        (*v50)->_readLock._os_unfair_lock_opaque = 0;
        v56 = self->_internal->_operationMode;
        if (v56 == 1)
        {
          if (v26)
          {
            dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            v79 = objc_claimAutoreleasedReturnValue();
            dispatch_queue_attr_make_initially_inactive(v79);
            v80 = objc_claimAutoreleasedReturnValue();
            v81 = dispatch_queue_create("IDSDataChannelsRealTimeQueue", v80);
            v82 = self->_internal;
            v83 = v82->_queue;
            v82->_queue = (OS_dispatch_queue *)v81;

            nw_queue_context_target_dispatch_queue();
            dispatch_activate((dispatch_object_t)self->_internal->_queue);
          }
          host = nw_endpoint_create_host((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), "2");
          v84 = nw_connection_create(host, v42);
          v85 = self->_internal;
          connection = v85->_connection;
          v85->_connection = (OS_nw_connection *)v84;
          goto LABEL_60;
        }
        if (v56)
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            v88 = self->_internal->_operationMode;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v88;
            _os_log_impl(&dword_1906E0000, v87, OS_LOG_TYPE_DEFAULT, "invalid operation mode %d", buf, 8u);
          }

          -[IDSDatagramChannel close](self, "close");
          goto LABEL_77;
        }
        v57 = dispatch_semaphore_create(0);
        host = nw_endpoint_create_host((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), "3");
        *(_QWORD *)v109 = 0;
        *(_QWORD *)&v110 = v109;
        *((_QWORD *)&v110 + 1) = 0x2020000000;
        v111 = 0;
        uuid_clear(self->_internal->_nexus_instance);
        evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
        v60 = self->_internal;
        pathEvaluator = v60->_pathEvaluator;
        v60->_pathEvaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

        v62 = (void *)nw_path_evaluator_copy_path();
        v96 = self;
        connection = v57;
        if ((nw_path_evaluator_set_update_handler() & 1) != 0)
        {
          if ((nw_path_uses_nexus() & 1) != 0)
          {
            if ((nw_path_request_nexus() & 1) != 0)
            {
              v64 = sub_1907BC4B0();
              v65 = dispatch_time(0, 12000000000);
              dispatch_semaphore_wait(connection, v65);
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v66 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                log = v66;
                v95 = v62;
                v67 = *(unsigned __int8 *)(v110 + 24);
                v68 = self->_internal;
                connected = v68->_connected;
                v71 = v68->_pathEvaluator;
                osChannel = v68->_osChannel;
                v72 = sub_1907BC4B0();
                *(_DWORD *)buf = 138414338;
                v73 = CFSTR("YES");
                v74 = self->_internal;
                if (connected)
                  v75 = CFSTR("YES");
                else
                  v75 = CFSTR("NO");
                if (!v67)
                  v73 = CFSTR("NO");
                v76 = v74->_operationMode;
                v77 = v74->_preferredDataPathType;
                *(_QWORD *)&buf[4] = v73;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v75;
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = v71;
                *(_WORD *)&buf[32] = 2112;
                *(_QWORD *)&buf[34] = host;
                *(_WORD *)&buf[42] = 2112;
                *(_QWORD *)&buf[44] = v42;
                *(_WORD *)&buf[52] = 2048;
                *(_QWORD *)&buf[54] = osChannel;
                v103 = 2048;
                v104 = v72 - v64;
                v105 = 1024;
                v106 = v76;
                v107 = 1024;
                v108 = v77;
                v66 = log;
                _os_log_impl(&dword_1906E0000, log, OS_LOG_TYPE_DEFAULT, "osChannel create success %@ (connected: %@) for pathEvaluator %p with endpoint %@ parameters %@ osChannel %p creationTime %0.6lf operationMode %d preferredDataPathType %d", buf, 0x54u);
                v62 = v95;
              }

              if (*(_BYTE *)(v110 + 24))
              {
                v78 = self->_internal;
                if (v78->_pathEvaluator)
                {
                  if (v78->_osChannel)
                  {

                    _Block_object_dispose(v109, 8);
LABEL_60:

                    goto LABEL_61;
                  }
                }
              }
              -[IDSDatagramChannel close](v96, "close");
              goto LABEL_76;
            }
            +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
            v91 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v92 = "nw_path_request_nexus returned no";
              goto LABEL_74;
            }
LABEL_75:

            nw_path_evaluator_cancel();
LABEL_76:

            _Block_object_dispose(v109, 8);
LABEL_77:

            goto LABEL_78;
          }
          +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
          v91 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            goto LABEL_75;
          *(_WORD *)buf = 0;
          v92 = "nw_path_uses_nexus returned no";
        }
        else
        {
          +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
          v91 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            goto LABEL_75;
          *(_WORD *)buf = 0;
          v92 = "nw_path_evaluator_set_update_handler failed";
        }
LABEL_74:
        _os_log_impl(&dword_1906E0000, v91, OS_LOG_TYPE_DEFAULT, v92, buf, 2u);
        goto LABEL_75;
      }
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_internal->_operationMode;
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v33;
        _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_DEFAULT, "<%p> Invalid preferred data path value %ld - defaulting to IDSDatagramChannelDataPathThroughIDSDaemon", buf, 0x16u);
      }

    }
    self->_internal->_preferredDataPathType = 0;
    goto LABEL_25;
  }
LABEL_61:
  self = self;
  v86 = self;
LABEL_79:

  return v86;
}

- (id)cachedMetadata
{
  return self->_internal->_sendingMetadata;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  IDSDatagramChannel *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "-dealloc called for %@", buf, 0xCu);
  }

  IDSLinkPacketBufferCleanup();
  -[IDSDatagramChannel invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)IDSDatagramChannel;
  -[IDSDatagramChannel dealloc](&v4, sel_dealloc);
}

- (id)description
{
  _IDSDatagramChannel *internal;
  const __CFString *v3;
  const __CFString *v4;
  id eventHandler;
  id readHandler;
  id readHandlerWithOptions;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  internal = self->_internal;
  if (internal->_isInvalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p> IDSDataChannels has been invalidated"), self, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v3 = CFSTR("YES");
    if (internal->_connected)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    eventHandler = internal->_eventHandler;
    readHandler = internal->_readHandler;
    readHandlerWithOptions = internal->_readHandlerWithOptions;
    if (internal->_pathEvaluator)
    {
      if (!internal->_startCalled)
        v3 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p> channelFD %d connected %@ eventHandler %p readHandler %p withOptions %p auto %@"), self, internal->_osChannelFD, v4, eventHandler, readHandler, readHandlerWithOptions, v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p> socket %d connected %@ eventHandler %p readHandler %p withOptions %p"), self, internal->_socketDescriptor, v4, eventHandler, readHandler, readHandlerWithOptions, v14);
    }
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_logChecksum:(const void *)a3 length:(unint64_t)a4
{
  unint64_t result;

  if (!a4)
    return 0;
  result = crc32_z(0, (const Bytef *)a3, a4);
  if (!result || result % 0xB3)
    return 0;
  return result;
}

- (void)_logPendingSendingStats:(unint64_t)a3
{
  double v5;
  _IDSDatagramChannel *internal;
  double lastPendingOutgoingStatReport;
  NSObject *v8;
  double v9;
  unint64_t pendingOutgoingBytes;
  unint64_t pendingOutgoingPackets;
  NSObject *v12;
  int v13;
  IDSDatagramChannel *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  v5 = *(double *)&qword_1EE1E3940 * (double)mach_continuous_time();
  self->_internal->_pendingOutgoingBytes += a3;
  ++self->_internal->_pendingOutgoingPackets;
  internal = self->_internal;
  lastPendingOutgoingStatReport = internal->_lastPendingOutgoingStatReport;
  if (lastPendingOutgoingStatReport == 0.0)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2048;
      v16 = *(double *)&a3;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_lastPendingOutgoingStatReport = v5;
  }
  else
  {
    v9 = v5 - lastPendingOutgoingStatReport;
    if (v5 - lastPendingOutgoingStatReport > 3.0)
    {
      pendingOutgoingBytes = internal->_pendingOutgoingBytes;
      pendingOutgoingPackets = internal->_pendingOutgoingPackets;
      internal->_lastPendingOutgoingStatReport = v5;
      self->_internal->_pendingOutgoingBytes = 0;
      self->_internal->_pendingOutgoingPackets = 0;
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412802;
        v14 = self;
        v15 = 2048;
        v16 = (double)pendingOutgoingBytes / v9;
        v17 = 2048;
        v18 = (double)pendingOutgoingPackets / v9;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }

    }
  }
}

- (void)_logSendingStats:(unint64_t)a3
{
  double v5;
  _IDSDatagramChannel *internal;
  double lastOutgoingStatReport;
  NSObject *v8;
  double v9;
  unint64_t outgoingBytes;
  unint64_t outgoingPackets;
  NSObject *v12;
  int v13;
  IDSDatagramChannel *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  v5 = *(double *)&qword_1EE1E3940 * (double)mach_continuous_time();
  self->_internal->_outgoingBytes += a3;
  ++self->_internal->_outgoingPackets;
  internal = self->_internal;
  lastOutgoingStatReport = internal->_lastOutgoingStatReport;
  if (lastOutgoingStatReport == 0.0)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2048;
      v16 = *(double *)&a3;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "<%@> sent the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_lastOutgoingStatReport = v5;
  }
  else
  {
    v9 = v5 - lastOutgoingStatReport;
    if (v5 - lastOutgoingStatReport > 3.0)
    {
      outgoingBytes = internal->_outgoingBytes;
      outgoingPackets = internal->_outgoingPackets;
      internal->_lastOutgoingStatReport = v5;
      self->_internal->_outgoingBytes = 0;
      self->_internal->_outgoingPackets = 0;
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412802;
        v14 = self;
        v15 = 2048;
        v16 = (double)outgoingBytes / v9;
        v17 = 2048;
        v18 = (double)outgoingPackets / v9;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> TX %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }

    }
  }
}

- (void)_logReceivingStats:(unint64_t)a3
{
  double v5;
  _IDSDatagramChannel *internal;
  double lastIncomingStatReport;
  NSObject *v8;
  double v9;
  unint64_t incomingBytes;
  unint64_t incomingPackets;
  NSObject *v12;
  int v13;
  IDSDatagramChannel *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  v5 = *(double *)&qword_1EE1E3940 * (double)mach_continuous_time();
  self->_internal->_incomingBytes += a3;
  ++self->_internal->_incomingPackets;
  internal = self->_internal;
  lastIncomingStatReport = internal->_lastIncomingStatReport;
  if (lastIncomingStatReport == 0.0)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2048;
      v16 = *(double *)&a3;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "<%@> received the first data packet (size: %lu)", (uint8_t *)&v13, 0x16u);
    }

    self->_internal->_lastIncomingStatReport = v5;
  }
  else
  {
    v9 = v5 - lastIncomingStatReport;
    if (v5 - lastIncomingStatReport > 3.0)
    {
      incomingBytes = internal->_incomingBytes;
      incomingPackets = internal->_incomingPackets;
      internal->_lastIncomingStatReport = v5;
      self->_internal->_incomingBytes = 0;
      self->_internal->_incomingPackets = 0;
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412802;
        v14 = self;
        v15 = 2048;
        v16 = (double)incomingBytes / v9;
        v17 = 2048;
        v18 = (double)incomingPackets / v9;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> RX %f bytes/s %f packets/s", (uint8_t *)&v13, 0x20u);
      }

    }
  }
}

- (void)_logFinalStats
{
  double v3;
  _IDSDatagramChannel *internal;
  double v5;
  unint64_t pendingOutgoingBytes;
  unint64_t pendingOutgoingPackets;
  NSObject *v8;
  double v9;
  unint64_t outgoingBytes;
  unint64_t outgoingPackets;
  NSObject *v12;
  double v13;
  unint64_t incomingBytes;
  unint64_t incomingPackets;
  NSObject *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  v3 = *(double *)&qword_1EE1E3940 * (double)mach_continuous_time();
  internal = self->_internal;
  v5 = v3 - internal->_lastPendingOutgoingStatReport;
  if (v5 > 0.0)
  {
    pendingOutgoingBytes = internal->_pendingOutgoingBytes;
    pendingOutgoingPackets = internal->_pendingOutgoingPackets;
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = self;
      v19 = 2048;
      v20 = (double)pendingOutgoingBytes / v5;
      v21 = 2048;
      v22 = (double)pendingOutgoingPackets / v5;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "<%@> pending outgoing [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }

    internal = self->_internal;
  }
  v9 = v3 - internal->_lastOutgoingStatReport;
  if (v9 > 0.0)
  {
    outgoingBytes = internal->_outgoingBytes;
    outgoingPackets = internal->_outgoingPackets;
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = self;
      v19 = 2048;
      v20 = (double)outgoingBytes / v9;
      v21 = 2048;
      v22 = (double)outgoingPackets / v9;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> TX [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }

    internal = self->_internal;
  }
  v13 = v3 - internal->_lastIncomingStatReport;
  if (v13 > 0.0)
  {
    incomingBytes = internal->_incomingBytes;
    incomingPackets = internal->_incomingPackets;
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412802;
      v18 = self;
      v19 = 2048;
      v20 = (double)incomingBytes / v13;
      v21 = 2048;
      v22 = (double)incomingPackets / v13;
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "<%@> RX [Final] %f bytes/s %f packets/s", (uint8_t *)&v17, 0x20u);
    }

  }
}

- (int)underlyingFileDescriptor
{
  NSObject *v3;
  _IDSDatagramChannel *internal;
  uint64_t v5;
  int v7;
  IDSDatagramChannel *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "-underlyingFileDescriptor called for %@", (uint8_t *)&v7, 0xCu);
  }

  internal = self->_internal;
  if (internal->_operationMode)
    sub_1907FB138();
  v5 = 120;
  if (!internal->_pathEvaluator)
    v5 = 12;
  return *(_DWORD *)((char *)&internal->super.isa + v5);
}

- (void)sendEventConnectedWithDummyLinkInfo
{
  _IDSDatagramChannel *internal;
  _IDSDatagramChannel *v4;
  NSObject *v5;
  _IDSDatagramChannel *v6;
  IDSDataChannelLinkContext *v7;
  NSObject *v8;
  void (**eventHandler)(id, void *);
  void *v10;
  void *v11;
  IDSDataChannelLinkContext *v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  IDSDatagramChannel *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal->_socketDescriptor >= 1 && internal->_connected)
  {
    os_unfair_lock_lock(&internal->_writeLock);
    v4 = self->_internal;
    if (v4->_sentFirstReadLinkInfo)
    {
      os_unfair_lock_unlock(&v4->_writeLock);
    }
    else
    {
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@> first read, will send dummy link information", buf, 0xCu);
      }

      v6 = self->_internal;
      if (v6->_eventHandler)
      {
        v7 = -[IDSDataChannelLinkContext initWithDummyInformation]([IDSDataChannelLinkContext alloc], "initWithDummyInformation");
        +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = (IDSDatagramChannel *)v7;
          _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "<%@> dummy link information", buf, 0xCu);
        }

        eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
        v13[1] = CFSTR("connected-link");
        v14[0] = &unk_1E2CAE360;
        v12 = v7;
        v13[0] = CFSTR("event-type");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        eventHandler[2](eventHandler, v11);

        self->_internal->_sentFirstReadLinkInfo = 1;
        v6 = self->_internal;
      }
      os_unfair_lock_unlock(&v6->_writeLock);
    }
  }
}

- (void)removeIDSDataChannelLinkContext:(char)a3 linkUUID:(id)a4 reason:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  _IDSDatagramChannel *internal;
  void (**eventHandler)(id, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  IDSDatagramChannel *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  NSObject *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v5 = a5;
  v6 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (self->_internal->_isInvalidated)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "removeIDSDataChannelLinkContext: connection already closed", buf, 2u);
    }
  }
  else
  {
    -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
    v9 = objc_claimAutoreleasedReturnValue();
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v28 = self;
      v29 = 1024;
      v30 = v6;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "<%@>  removeIDSDataChannelLinkContext:%u, linkContexts %@", buf, 0x1Cu);
    }

    -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138413058;
        v28 = self;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = v9;
        v33 = 1024;
        v34 = v5;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventDisconnected, linkID %u, linkContexts %@, reason: %d", buf, 0x22u);
      }

      internal = self->_internal;
      eventHandler = (void (**)(id, void *))internal->_eventHandler;
      if (eventHandler)
      {
        v26[0] = &unk_1E2CAE348;
        v25[0] = CFSTR("event-type");
        v25[1] = CFSTR("disconnected-link");
        v24 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v21;
        v25[2] = CFSTR("disconnected-link-ids");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", objc_msgSend(v11, "linkID"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[2] = v16;
        v25[3] = CFSTR("disconnected-link-uuids");
        v22 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v26[3] = v17;
        v25[4] = CFSTR("disconnected-reason");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[4] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        eventHandler[2](eventHandler, v19);

        internal = self->_internal;
      }
      if (internal->_preferredDataPathType == 1)
        -[IDSDatagramChannel removeDirectConnectionsForLinkID:](self, "removeDirectConnectionsForLinkID:", v6);
      -[IDSDatagramChannel _removeLinkContextWithID:](self, "_removeLinkContextWithID:", v6);
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412802;
        v28 = self;
        v29 = 1024;
        v30 = v6;
        v31 = 2112;
        v32 = v9;
        _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "<%@> Can't find the linkContext of linkID %u, linkContexts %@", buf, 0x1Cu);
      }

    }
  }

}

- (void)addNewIDSDataChannelLinkWithAttributes:(char *)a3 linkAttributesLength:(unsigned __int16)a4
{
  int v4;
  __int128 v5;
  unint64_t v6;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char *v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  unsigned __int16 *v39;
  uint64_t v40;
  unsigned int v41;
  unsigned __int16 *v42;
  NSObject *v43;
  int v44;
  int v45;
  NSObject *v46;
  unsigned __int16 *v47;
  unsigned int v48;
  signed int v49;
  NSObject *v50;
  NSObject *v51;
  int v52;
  void *v53;
  int v54;
  const __CFString *v55;
  void *v56;
  int v57;
  void *v58;
  IDSDataChannelLinkContext *v59;
  IDSDataChannelLinkContext *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  void *v69;
  int v70;
  _QWORD *v71;
  __int128 v72;
  NSObject *v73;
  NSMutableArray *sendingMetadata;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void (**eventHandler)(id, void *);
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  const __CFString *v91;
  int v92;
  int v93;
  int v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *log;
  unsigned __int8 v105;
  _QWORD v106[2];
  _QWORD v107[2];
  uint8_t v108[4];
  int v109;
  _BYTE buf[32];
  _BYTE v111[10];
  __int16 v112;
  int v113;
  __int16 v114;
  int v115;
  __int16 v116;
  int v117;
  __int16 v118;
  int v119;
  __int16 v120;
  int v121;
  __int16 v122;
  int v123;
  __int16 v124;
  const __CFString *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  int v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  void *v133;
  __int16 v134;
  void *v135;
  __int16 v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  int v144;
  uint64_t v145;

  v4 = a4;
  v145 = *MEMORY[0x1E0C80C00];
  v144 = -1431655766;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v142 = v5;
  v143 = v5;
  v140 = v5;
  v141 = v5;
  v138 = v5;
  v139 = v5;
  v6 = 0x1E2C5D000uLL;
  if (a4 <= 0x63u)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels", a3);
    log = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1906E0000, log, OS_LOG_TYPE_DEFAULT, "invalid link attribute size (%u), too small.", buf, 8u);
    }
    goto LABEL_105;
  }
  v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", (char *)&v141 + 13);
  v9 = *((_OWORD *)a3 + 5);
  v142 = *((_OWORD *)a3 + 4);
  v143 = v9;
  v144 = *((_DWORD *)a3 + 24);
  v10 = *((_OWORD *)a3 + 1);
  v138 = *(_OWORD *)a3;
  v139 = v10;
  v11 = *((_OWORD *)a3 + 3);
  v12 = a3 + 100;
  v13 = v4 - 100;
  v140 = *((_OWORD *)a3 + 2);
  v141 = v11;
  if ((v4 - 100) < 2)
  {
    v103 = 0;
    log = 0;
    v98 = 0;
    v14 = 0;
    goto LABEL_27;
  }
  v14 = 0;
  v15 = __rev16(*((unsigned __int16 *)a3 + 50));
  if ((_DWORD)v15)
  {
    v98 = 0;
    if (v4 - 102 >= v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3 + 102, v15);
      v12 = &a3[v15 + 102];
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (v98)
      {
        JWDecodeDictionary();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
      if ((v4 - 102 - v15) < 2)
      {
        v103 = 0;
        log = 0;
LABEL_28:
        v95 = 0;
        v20 = 0;
        goto LABEL_29;
      }
      v13 = v4 - 102 - v15;
      v6 = 0x1E2C5D000;
    }
  }
  else
  {
    v98 = 0;
  }
  log = 0;
  v16 = __rev16(*(unsigned __int16 *)v12);
  if ((_DWORD)v16 && (v17 = v13 - 2 - v16, (int)(v13 - 2) >= (int)v16))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 2, v16);
    v12 += v16 + 2;
    log = objc_claimAutoreleasedReturnValue();
    if (log)
    {
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", log, 4);
    }
    else
    {
      v103 = 0;
      log = 0;
    }
    v6 = 0x1E2C5D000;
  }
  else
  {
    v17 = v13;
    v103 = 0;
  }
  if (v17 < 2)
  {
LABEL_27:
    v95 = 0;
    v20 = 0;
    goto LABEL_30;
  }
  v18 = __rev16(*(unsigned __int16 *)v12);
  if (!(_DWORD)v18)
    goto LABEL_28;
  if ((int)(v17 - 2) < (int)v18)
    goto LABEL_28;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 2, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v12 += v18 + 2;
  if (!v19)
    goto LABEL_28;
  v95 = (void *)v19;
  JWDecodeDictionary();
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_29:
  v6 = 0x1E2C5D000uLL;
LABEL_30:
  v100 = (void *)v20;
  if (BYTE2(v140) - 2 > 3)
  {
LABEL_37:
    v101 = 0;
    v102 = 0;
    v30 = 0;
    v27 = 0;
    v25 = 0;
    goto LABEL_73;
  }
  v21 = &a3[v4];
  if (v12 + 3 <= v21)
  {
    v32 = v12 + 1;
    v96 = *v12;
    v33 = (_DWORD)v21 - ((_DWORD)v12 + 1);
    if ((v33 & 0xFFFFFFFE) != 0)
    {
      v27 = 0;
      v34 = __rev16(*(unsigned __int16 *)(v12 + 1));
      if ((_DWORD)v34)
      {
        v35 = v33 - 2 - v34;
        if ((int)(v33 - 2) >= (int)v34)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12 + 3, v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = &v12[v34 + 3];
          v33 = v35;
        }
      }
    }
    else
    {
      v27 = 0;
    }
    v36 = v33 - 2;
    if (v33 < 2)
    {
      v30 = 0;
      v102 = 0;
    }
    else
    {
      v102 = 0;
      v37 = __rev16(*(unsigned __int16 *)v32);
      if (!(_DWORD)v37)
        goto LABEL_48;
      v38 = v36 - v37;
      if (v36 < (int)v37)
        goto LABEL_48;
      v39 = (unsigned __int16 *)(v32 + 2);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32 + 2, v37);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v38 - 2;
      if (v38 >= 2)
      {
        v32 = (char *)v39 + v37;
        v33 = v38;
LABEL_48:
        v30 = 0;
        v40 = __rev16(*(unsigned __int16 *)v32);
        if (!(_DWORD)v40)
        {
          v6 = 0x1E2C5D000uLL;
          goto LABEL_63;
        }
        v41 = v36 - v40;
        v6 = 0x1E2C5D000;
        if (v36 < (int)v40)
        {
LABEL_63:
          v48 = *(unsigned __int16 *)v32;
          v47 = (unsigned __int16 *)(v32 + 2);
          v49 = __rev16(v48);
          v25 = v96;
          if (v49 && (int)(v33 - 2) >= v49)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v101 = 0;
          }
          goto LABEL_68;
        }
        v42 = (unsigned __int16 *)(v32 + 2);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v32 + 2, v40);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41 >= 2)
        {
          v32 = (char *)v42 + v40;
          v33 = v41;
          goto LABEL_63;
        }
        v101 = 0;
LABEL_54:
        v25 = v96;
LABEL_68:
        objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&buf[4] = v25;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = objc_msgSend(v27, "length");
          *(_WORD *)&buf[14] = 1024;
          *(_DWORD *)&buf[16] = objc_msgSend(v102, "length");
          _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "Got relay server provider:%d, session token:%dB, session key:%dB", buf, 0x14u);
        }

        objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v101;
          _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "Got hbhEncryptionkey:%@ and hbhDecryptionkey:%@", buf, 0x16u);
        }
        goto LABEL_72;
      }
      v30 = 0;
    }
    v101 = 0;
    v6 = 0x1E2C5D000;
    goto LABEL_54;
  }
  if (!BYTE12(v141))
    goto LABEL_37;
  objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v140;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = BYTE13(v142);
    _os_log_impl(&dword_1906E0000, v22, OS_LOG_TYPE_DEFAULT, "This is a virtual relay link(%u). Copying over attributes from delegated link(%u)", buf, 0xEu);
  }

  -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", BYTE13(v142));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = -[NSObject relayServerProvider](v23, "relayServerProvider");
    -[NSObject relaySessionToken](v24, "relaySessionToken");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copy");

    -[NSObject relaySessionKey](v24, "relaySessionKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(v28, "copy");

    -[NSObject hbhEncryptionkey](v24, "hbhEncryptionkey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    -[NSObject hbhDecryptionkey](v24, "hbhDecryptionkey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = (void *)objc_msgSend(v31, "copy");

  }
  else
  {
    v101 = 0;
    v102 = 0;
    v30 = 0;
    v27 = 0;
    v25 = 0;
  }
  objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v27, "length");
    v45 = objc_msgSend(v102, "length");
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v25;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v44;
    v20 = (uint64_t)v100;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v45;
    _os_log_impl(&dword_1906E0000, v43, OS_LOG_TYPE_DEFAULT, "Copied relay server provider:%d, session token:%dB, session key:%dB", buf, 0x14u);
  }

  objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v101;
    _os_log_impl(&dword_1906E0000, v46, OS_LOG_TYPE_DEFAULT, "Copied hbhEncryptionkey:%@ and hbhDecryptionkey:%@", buf, 0x16u);
  }

LABEL_72:
LABEL_73:
  objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    v52 = v140;
    v53 = v27;
    v54 = BYTE1(v140);
    v85 = WORD3(v141);
    v86 = BYTE2(v140);
    v87 = BYTE3(v140);
    v88 = WORD4(v140);
    v92 = BYTE6(v140);
    v93 = WORD5(v140);
    v55 = CFSTR("YES");
    v56 = v14;
    v57 = HIDWORD(v140);
    v89 = v141;
    v90 = BYTE5(v140);
    if (!BYTE12(v141))
      v55 = CFSTR("NO");
    v91 = v55;
    v94 = WORD2(v141);
    -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138416898;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v52;
    v20 = (uint64_t)v100;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v54;
    v27 = v53;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v85;
    v6 = 0x1E2C5D000uLL;
    *(_WORD *)&buf[30] = 1024;
    *(_DWORD *)v111 = v86;
    *(_WORD *)&v111[4] = 1024;
    *(_DWORD *)&v111[6] = v87;
    v112 = 1024;
    v113 = v88;
    v114 = 1024;
    v115 = v57;
    v14 = v56;
    v116 = 1024;
    v117 = v90;
    v118 = 1024;
    v119 = v92;
    v120 = 1024;
    v121 = v93;
    v122 = 1024;
    v123 = v89;
    v124 = 2112;
    v125 = v91;
    v126 = 2112;
    v127 = v99;
    v128 = 1024;
    v129 = v94;
    v130 = 2112;
    v131 = v103;
    v132 = 2112;
    v133 = v56;
    v134 = 2112;
    v135 = v100;
    v136 = 2112;
    v137 = v58;
    _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "<%@> got connectedLinkID %d (link family:%u) (mtu:%u) (l-conn:%u) (l-RAT:%u) (l-flags:0x%x) (l-dataSoMask: %u) (r-conn:%u) (r-RAT:%u) (r-flags:0x%x) (r-datasoMask:%u) isVirtualRelayLink: %@, childConnectionID: %@, channelNumber: %04X, relayProtocolStack: %@, connections: %@, qrExperiments: %@, (Current LinkContexts %@", buf, 0x90u);

  }
  v59 = [IDSDataChannelLinkContext alloc];
  LOWORD(v84) = HIWORD(v143);
  v97 = v27;
  v60 = -[IDSDataChannelLinkContext initWithAttributes:maxBitrate:relayServerProvider:relaySessionToken:relaySessionKey:hbhEncryptionkey:hbhDecryptionkey:relayProtocolStackDescription:qrExperiments:estimatedPerPacketConstantOverhead:](v59, "initWithAttributes:maxBitrate:relayServerProvider:relaySessionToken:relaySessionKey:hbhEncryptionkey:hbhDecryptionkey:relayProtocolStackDescription:qrExperiments:estimatedPerPacketConstantOverhead:", &v138, 0xFFFFFFFFLL, v25, v27, v102, v30, v101, v103, v20, v84);
  if (v14)
    -[IDSDatagramChannel _addConnections:toLinkContext:](self, "_addConnections:toLinkContext:", v14, v60);
  -[IDSDatagramChannel _setLinkContext:forLinkID:](self, "_setLinkContext:forLinkID:", v60, v140);
  if (-[IDSDataChannelLinkContext RATType](v60, "RATType") && -[IDSDataChannelLinkContext RATType](v60, "RATType") != 9)
    objc_storeStrong((id *)&self->_internal->_cellularLink, v60);
  v61 = BYTE2(v140) - 5;
  -[IDSDataChannelLinkContext connections](v60, "connections");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "udp");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSDataChannelLinkContext connections](v60, "connections");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "qpod");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61 > 0xFFFFFFFD || self->_internal->_preferredDataPathType != 1)
    goto LABEL_99;
  v66 = v14;
  if (v65)
  {
    objc_msgSend(v65, "childConnectionID");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    memset(buf, 170, 16);
    objc_msgSend(v67, "getUUIDBytes:", buf);
    v68 = uuid_is_null(buf) != 0;

    if (!v63)
      goto LABEL_92;
  }
  else
  {
    v68 = 0;
    if (!v63)
    {
LABEL_92:
      if (-[IDSDataChannelLinkContext isVirtualRelayLink](v60, "isVirtualRelayLink"))
      {
        -[IDSDatagramChannel reportEvent:forLinkID:](self, "reportEvent:forLinkID:", *MEMORY[0x1E0D34768], -[IDSDataChannelLinkContext linkID](v60, "linkID"));
        -[IDSDatagramChannel addDirectConnectionForLinkID:linkContext:](self, "addDirectConnectionForLinkID:linkContext:", -[IDSDataChannelLinkContext linkID](v60, "linkID"), v60);
      }
      v71 = (_QWORD *)_IDSLinkPacketBufferCreate();
      *(_QWORD *)v111 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v72 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)buf = v72;
      *(_OWORD *)&buf[16] = v72;
      IDSByteBufferInitForWriteWithAllocatedSpace();
      v105 = -[IDSDataChannelLinkContext linkID](v60, "linkID");
      IDSByteBufferWriteField();
      v71[2] = *(_QWORD *)&buf[16] - *v71;
      IDSByteBufferRelease();
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v108 = 67109120;
        v109 = v105;
        _os_log_impl(&dword_1906E0000, v73, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: request child connectionID for linkID %d", v108, 8u);
      }

      -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v71);
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v71);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](sendingMetadata, "addObject:", v75);

      -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
      os_unfair_lock_unlock(&self->_internal->_writeLock);
      goto LABEL_98;
    }
  }
  objc_msgSend(v63, "childConnectionID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  memset(buf, 170, 16);
  objc_msgSend(v69, "getUUIDBytes:", buf);
  if (uuid_is_null(buf))
    v70 = 1;
  else
    v70 = v68;

  if (v70 == 1)
    goto LABEL_92;
  -[IDSDatagramChannel reportEvent:forLinkID:](self, "reportEvent:forLinkID:", *MEMORY[0x1E0D34768], -[IDSDataChannelLinkContext linkID](v60, "linkID"));
  -[IDSDatagramChannel addDirectConnectionForLinkID:linkContext:](self, "addDirectConnectionForLinkID:linkContext:", -[IDSDataChannelLinkContext linkID](v60, "linkID"), v60);
LABEL_98:
  v14 = v66;
LABEL_99:
  if (!self->_internal->_waitForPreConnectionDataForConnected)
  {
    objc_msgSend(*(id *)(v6 + 3944), "IDSDataChannels");
    v76 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
      v77 = v14;
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v78;
      _os_log_impl(&dword_1906E0000, v76, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);

      v14 = v77;
    }

    eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    if (eventHandler)
    {
      v106[0] = CFSTR("event-type");
      v106[1] = CFSTR("connected-link");
      v107[0] = &unk_1E2CAE360;
      -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
      v80 = v30;
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v81;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
      v82 = v14;
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v83);

      v14 = v82;
      v30 = v80;
    }
  }

LABEL_105:
}

- (void)selectDefaultLink:(char)a3
{
  int v3;
  void *v5;
  void *v6;
  void (**eventHandler)(id, void *);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->_internal->_defaultLinkID = a3;
  -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = v3;
      _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, "can't find link %d for the default", buf, 8u);
    }
    goto LABEL_6;
  }
  eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
  if (eventHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", objc_msgSend(v5, "linkID", CFSTR("event-type"), CFSTR("default-link"), CFSTR("default-link-id"), &unk_1E2CAE378, v5));
    v8 = objc_claimAutoreleasedReturnValue();
    v11[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    eventHandler[2](eventHandler, v9);

LABEL_6:
  }

}

- (void)sendMediaEncryptionInfoWithMKM:(id)a3 MKS:(id)a4 MKI:(id)a5 participantID:(unint64_t)a6 isLocallyGenerated:(BOOL)a7 shortKILength:(unsigned __int8)a8 encryptionSequenceNumber:(unint64_t)a9
{
  uint64_t v9;
  uint64_t v10;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  const __CFString *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unsigned int v33;
  unint64_t v34;
  IDSDatagramChannel *v35;
  _QWORD v36[8];
  _QWORD v37[8];
  _QWORD v38[7];
  _QWORD v39[7];
  _BYTE buf[22];
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v9 = a8;
  v10 = a7;
  v53 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v34 = a6;
    v35 = self;
    v19 = v15;
    v33 = v10;
    if ((_DWORD)v10)
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    v21 = v9;
    if (a9 == -1)
    {
      v22 = CFSTR("none");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a9);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414083;
    *(_QWORD *)&buf[4] = v35;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v19;
    v41 = 2113;
    v42 = v16;
    v43 = 2113;
    v44 = v17;
    v45 = 2113;
    v46 = v20;
    v47 = 2113;
    v48 = v22;
    v49 = 2113;
    v50 = v23;
    v51 = 2113;
    v52 = v24;
    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "<%@> sendMediaEncryptionEventInfo MKM:%{private}@, MKS:%{private}@, MKI:%{private}@ locally generated:%{private}@ encryptionSequenceNumber:%{private}@, participantID:%{private}@, shortKILength:%{private}@", buf, 0x52u);

    if (a9 != -1)
    v15 = v19;
    self = v35;
    v9 = v21;
    v10 = v33;
    a6 = v34;
  }

  memset(buf, 170, 16);
  objc_msgSend(v17, "getUUIDBytes:", buf);
  -[IDSDatagramChannel reportMKIArrival:isLocallyGenerated:](self, "reportMKIArrival:isLocallyGenerated:", v17, v10);
  if (self->_internal->_eventHandler)
  {
    v25 = *MEMORY[0x1E0D34AF8];
    if (a9 == -1)
    {
      v38[0] = CFSTR("event-type");
      v38[1] = v25;
      v39[0] = &unk_1E2CAE390;
      v39[1] = v15;
      v32 = *MEMORY[0x1E0D34AF0];
      v38[2] = *MEMORY[0x1E0D34B00];
      v38[3] = v32;
      v39[2] = v16;
      v39[3] = v17;
      v38[4] = *MEMORY[0x1E0D34B10];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39[4] = v27;
      v38[5] = *MEMORY[0x1E0D34AE8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[5] = v28;
      v38[6] = *MEMORY[0x1E0D34B18];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39[6] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36[0] = CFSTR("event-type");
      v36[1] = v25;
      v37[0] = &unk_1E2CAE390;
      v37[1] = v15;
      v26 = *MEMORY[0x1E0D34AF0];
      v36[2] = *MEMORY[0x1E0D34B00];
      v36[3] = v26;
      v37[2] = v16;
      v37[3] = v17;
      v36[4] = *MEMORY[0x1E0D34B10];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[4] = v27;
      v36[5] = *MEMORY[0x1E0D34AE8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[5] = v28;
      v36[6] = *MEMORY[0x1E0D34B08];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37[6] = v29;
      v36[7] = *MEMORY[0x1E0D34B18];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37[7] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*((void (**)(void))self->_internal->_eventHandler + 2))();

  }
}

- (void)sendMediaMembershipChangedInfo:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  void (**eventHandler)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];
  uint8_t buf[4];
  IDSDatagramChannel *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 1024;
    v14 = v3;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@> sendMediaMembershipChangedInfo membershipChanged:%u", buf, 0x12u);
  }

  eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
  if (eventHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3, CFSTR("event-type"), CFSTR("membership-changed-reason-key"), &unk_1E2CAE3A8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    eventHandler[2](eventHandler, v8);

  }
}

- (void)processMetadataForDatagram:(const char *)a3 size:(unint64_t)a4 datagramInfo:(id *)a5 options:(id *)a6
{
  __int128 v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  CFMutableDictionaryRef v20;
  _IDSDatagramChannel *v21;
  NSMutableDictionary *linkIDToParticipantMap;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSMutableDictionary *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void (**v38)(id, void *);
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void (**v52)(id, NSObject *);
  NSObject *v53;
  $1AF4AE5744D0566D2BCFD0852A296D31 *v54;
  unsigned int v55;
  unsigned int v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  void (**v60)(id, void *);
  void *v61;
  void *v62;
  NSObject *v63;
  void (**v64)(id, void *);
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  void (**v75)(id, NSObject *);
  NSObject *v76;
  uint64_t v77;
  uint64_t var4;
  unsigned __int8 *v79;
  unsigned __int16 *var5;
  unsigned int v81;
  NSObject *v82;
  void *v83;
  unint64_t v84;
  NSObject *v85;
  unsigned int v86;
  NSObject *v87;
  uint64_t v88;
  IDSDataChannelLinkContext *v89;
  unsigned int v90;
  NSObject *v91;
  uint64_t v92;
  NSObject *v93;
  void (**v94)(id, void *);
  void *v95;
  void *v96;
  NSObject *v97;
  int v98;
  int v99;
  int v100;
  unsigned int v101;
  void *v102;
  void *v103;
  void *v104;
  BOOL v105;
  NSObject *v106;
  void *v107;
  void (**v108)(id, void *);
  NSObject *v109;
  void *v110;
  unsigned __int8 *v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  void *v115;
  NSObject *v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  void *v120;
  int v121;
  unsigned __int8 *v122;
  unsigned int v123;
  uint64_t v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void (**v128)(id, void *);
  void *v129;
  NSObject *v130;
  NSObject *v131;
  unsigned int v132;
  NSObject *v133;
  uint64_t v134;
  NSObject *v135;
  void (**v136)(id, void *);
  void *v137;
  void *v138;
  double var9;
  uint64_t v140;
  NSObject *v141;
  IDSDataChannelLinkContext *cellularLink;
  unsigned __int8 *v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  void *v147;
  BOOL v148;
  NSObject *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (**v153)(id, void *);
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  void *v167;
  NSObject *v168;
  void (**v169)(id, NSObject *);
  NSObject *v170;
  uint64_t v171;
  NSObject *v172;
  uint64_t v173;
  unsigned __int8 *v174;
  int v175;
  NSObject *v176;
  uint64_t v177;
  NSObject *v178;
  id v179;
  uint64_t v180;
  NSObject *v181;
  NSObject *v182;
  NSObject *v183;
  unsigned int v184;
  NSObject *v185;
  unsigned __int8 *v186;
  signed __int8 v187;
  void *v188;
  void *v189;
  NSObject *v190;
  NSObject *v191;
  uint64_t v192;
  int v193;
  const __CFString *v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t i;
  void *v199;
  int v200;
  CFMutableDictionaryRef v201;
  void *v202;
  void *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  void *v211;
  NSObject *v212;
  __CFDictionary *v213;
  NSObject *v214;
  NSObject *v215;
  NSObject *v216;
  NSObject *v217;
  NSObject *v218;
  uint64_t v219;
  _IDSDatagramChannel *internal;
  void (**v221)(id, void *);
  void *v222;
  NSObject *v223;
  void *v224;
  BOOL v225;
  NSObject *v226;
  void *v227;
  void (**v228)(id, void *);
  void *v229;
  void *v230;
  CFMutableDictionaryRef v231;
  _IDSDatagramChannel *v232;
  NSMutableDictionary *v233;
  NSObject *v234;
  _BOOL4 v235;
  uint64_t v236;
  NSMutableDictionary *v237;
  void *v238;
  void *v239;
  id v240;
  NSMutableDictionary *v241;
  void *v242;
  void *v243;
  NSObject *v244;
  void (**v245)(id, void *);
  void *v246;
  void *v247;
  NSObject *v248;
  void (**eventHandler)(id, void *);
  void *v250;
  void *v251;
  uint64_t v252;
  unsigned int v253;
  int v254;
  unint64_t v255;
  unsigned int v256;
  unint64_t v257;
  unsigned int v258;
  void *v259;
  void *v260;
  void *v261;
  NSObject *v262;
  const char *v263;
  __CFDictionary *Mutable;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  id v269;
  NSMutableDictionary *probingDict;
  void *v271;
  _IDSDatagramChannel *v272;
  void *v273;
  NSObject *v274;
  uint64_t v275;
  void *v276;
  void (**v277)(id, void *);
  void *v278;
  NSObject *v279;
  void *v280;
  void (**v281)(id, void *);
  void *v282;
  uint64_t v283;
  uint64_t v284;
  int v285;
  unsigned int v286;
  unsigned int v287;
  unsigned int v288;
  unsigned int v289;
  id v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *key;
  uint64_t v296;
  uint64_t v297;
  unsigned int v298;
  uint64_t v299;
  unint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  NSObject *v304;
  char v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  int v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  id v323;
  id v324;
  id v325;
  __int128 v326;
  __int128 v327;
  unint64_t v328;
  unsigned __int16 v329;
  unsigned __int8 *v330;
  unsigned __int8 v331;
  _QWORD v332[3];
  _QWORD v333[3];
  _BYTE v334[128];
  _QWORD v335[2];
  _QWORD v336[2];
  _QWORD v337[2];
  _QWORD v338[2];
  _QWORD v339[2];
  _QWORD v340[2];
  _QWORD v341[2];
  _QWORD v342[2];
  _QWORD v343[2];
  _QWORD v344[2];
  _QWORD v345[2];
  _QWORD v346[2];
  _QWORD v347[2];
  _QWORD v348[2];
  const __CFString *v349;
  void *v350;
  _QWORD v351[2];
  _QWORD v352[2];
  _QWORD v353[2];
  _QWORD v354[2];
  _QWORD v355[2];
  _QWORD v356[2];
  _QWORD v357[2];
  _QWORD v358[2];
  uint8_t buf[4];
  _BYTE v360[28];
  _QWORD v361[2];
  _QWORD v362[3];
  _QWORD v363[2];
  _QWORD v364[2];
  _QWORD v365[2];
  _QWORD v366[2];
  _QWORD v367[2];
  _QWORD v368[2];
  _QWORD v369[2];
  _QWORD v370[5];

  v370[2] = *MEMORY[0x1E0C80C00];
  v331 = -86;
  v330 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v329 = -21846;
  v328 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v326 = v7;
  v327 = v7;
  if (a4 > 2)
  {
    v12 = __rev16(*(unsigned __int16 *)a3);
    if (v12 + 2 <= a4)
    {
      *(_WORD *)&a5->var4 = 0;
      *(_QWORD *)&a5->var0 = 0;
      *(_QWORD *)&a6->var14 = 0;
      *(_OWORD *)&a6->var11 = 0u;
      *(_OWORD *)a6->var13 = 0u;
      *(_OWORD *)&a6->var8.var0 = 0u;
      *(_OWORD *)&a6->var9 = 0u;
      *(_OWORD *)&a6->var2 = 0u;
      *(_OWORD *)&a6->var5[6] = 0u;
      *(_OWORD *)&a6->var0 = 0u;
      IDSByteBufferInitForRead();
      if (IDSByteBufferReadField())
      {
        v307 = 0;
        v308 = 0;
        v310 = 0;
        v311 = 0;
        v302 = 0;
        LOWORD(v303) = 0;
        v305 = 0;
        v306 = 0;
        v298 = 0;
        v299 = 0;
        v304 = 0;
        v315 = 0;
        v316 = 0;
        v313 = 0;
        v314 = 0;
        v301 = 0;
        v309 = 0;
        v312 = 0;
        v297 = *MEMORY[0x1E0CB2D68];
        key = (void *)*MEMORY[0x1E0D345A8];
        v296 = *MEMORY[0x1E0D34510];
        v294 = (void *)*MEMORY[0x1E0D34550];
        v293 = (void *)*MEMORY[0x1E0D34558];
        v292 = (void *)*MEMORY[0x1E0D34560];
        v291 = (void *)*MEMORY[0x1E0D34578];
        v300 = -1;
        while (1)
        {
          switch(v331)
          {
            case 1u:
              if (v329 != 1)
              {
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v14 = (char)*v330;
              LOBYTE(v310) = *v330;
              if (self->_internal->_verboseFunctionalLogging)
              {
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v14;
                  _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "got PacketLinkID %d", buf, 8u);
                }

              }
              LOBYTE(v307) = 1;
              goto LABEL_550;
            case 2u:
              -[IDSDatagramChannel addNewIDSDataChannelLinkWithAttributes:linkAttributesLength:](self, "addNewIDSDataChannelLinkWithAttributes:linkAttributesLength:", v330, v329);
              goto LABEL_550;
            case 3u:
              if (v329 != 18)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 18;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkDisconnected should be %d byte, not %u bytes, field: %u", buf, 0x14u);
                }
                goto LABEL_488;
              }
              v111 = v330;
              v112 = (char)*v330++;
              v113 = *v330;
              v330 = v111 + 2;
              v114 = objc_alloc(MEMORY[0x1E0CB3A28]);
              v115 = (void *)objc_msgSend(v114, "initWithUUIDBytes:", v330);
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v116 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v115, "UUIDString");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v360 = v112;
                *(_WORD *)&v360[4] = 2112;
                *(_QWORD *)&v360[6] = v117;
                *(_WORD *)&v360[14] = 1024;
                *(_DWORD *)&v360[16] = v113;
                _os_log_impl(&dword_1906E0000, v116, OS_LOG_TYPE_DEFAULT, "got disconnectedLinkID %d, linkUUID %@, reason: %d", buf, 0x18u);

              }
              -[IDSDatagramChannel removeIDSDataChannelLinkContext:linkUUID:reason:](self, "removeIDSDataChannelLinkContext:linkUUID:reason:", v112, v115, v113);

              goto LABEL_550;
            case 4u:
              if (v329 != 1)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DefaultLinkID should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v118 = (char)*v330;
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v119 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v118;
                _os_log_impl(&dword_1906E0000, v119, OS_LOG_TYPE_DEFAULT, "got defaultLinkID %d", buf, 8u);
              }

              -[IDSDatagramChannel selectDefaultLink:](self, "selectDefaultLink:", v118);
              goto LABEL_550;
            case 5u:
              if (v329 != 1)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RATChanged should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v140 = *v330;
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v141 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v140;
                _os_log_impl(&dword_1906E0000, v141, OS_LOG_TYPE_DEFAULT, "got ratType %u", buf, 8u);
              }

              cellularLink = self->_internal->_cellularLink;
              if (cellularLink)
              {
                -[IDSDataChannelLinkContext setRATType:](cellularLink, "setRATType:", v140);
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v248 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v248, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RATChanged requires the cellular link. something is wrong...", buf, 2u);
                }

              }
              eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
              if (eventHandler)
              {
                v369[0] = CFSTR("event-type");
                v369[1] = CFSTR("rat-changed");
                v370[0] = &unk_1E2CAE3C0;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v140);
                v250 = (void *)objc_claimAutoreleasedReturnValue();
                v370[1] = v250;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v370, v369, 2);
                v251 = (void *)objc_claimAutoreleasedReturnValue();
                eventHandler[2](eventHandler, v251);

              }
              goto LABEL_550;
            case 6u:
            case 7u:
            case 8u:
            case 9u:
            case 0xCu:
            case 0x12u:
            case 0x13u:
            case 0x15u:
            case 0x19u:
            case 0x1Au:
            case 0x1Bu:
            case 0x1Cu:
            case 0x1Du:
            case 0x29u:
            case 0x2Au:
            case 0x2Cu:
            case 0x35u:
            case 0x38u:
            case 0x39u:
            case 0x3Au:
            case 0x3Bu:
            case 0x40u:
            case 0x41u:
            case 0x42u:
            case 0x44u:
            case 0x4Du:
            case 0x4Eu:
            case 0x4Fu:
            case 0x50u:
            case 0x51u:
              goto LABEL_22;
            case 0xAu:
              if (v329 == 1)
              {
                v298 = *v330;
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v97 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v298;
                  _os_log_impl(&dword_1906E0000, v97, OS_LOG_TYPE_DEFAULT, "got preConnectionDataSize %u", buf, 8u);
                }
                goto LABEL_173;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataSizeKey should be 1 bytes, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0xBu:
              if ((v299 & 1) != 0)
              {
                if (v329 >= v298)
                {
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v298);
                  v219 = objc_claimAutoreleasedReturnValue();

                  internal = self->_internal;
                  v221 = (void (**)(id, void *))internal->_eventHandler;
                  if (v221)
                  {
                    v367[0] = CFSTR("event-type");
                    v367[1] = CFSTR("preconnection-data-key");
                    v368[0] = &unk_1E2CAE3D8;
                    v368[1] = v219;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v368, v367, 2);
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    v221[2](v221, v222);

                    internal = self->_internal;
                  }
                  internal->_receivedPreConnectionData = 1;
                  self->_internal->_waitForPreConnectionDataForConnected = 0;
                  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels", v283);
                  v223 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v223, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v223, OS_LOG_TYPE_DEFAULT, "got preConnectionData, called IDSDataChannelEventPreConnectionData event", buf, 2u);
                  }

                  -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  v225 = objc_msgSend(v224, "count") == 0;

                  if (!v225)
                  {
                    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                    v226 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
                    {
                      -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
                      v227 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = self;
                      *(_WORD *)&v360[8] = 2112;
                      *(_QWORD *)&v360[10] = v227;
                      _os_log_impl(&dword_1906E0000, v226, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);

                    }
                    v228 = (void (**)(id, void *))self->_internal->_eventHandler;
                    if (v228)
                    {
                      v365[0] = CFSTR("event-type");
                      v365[1] = CFSTR("connected-link");
                      v366[0] = &unk_1E2CAE360;
                      -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                      v229 = (void *)objc_claimAutoreleasedReturnValue();
                      v366[1] = v229;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v366, v365, 2);
                      v230 = (void *)objc_claimAutoreleasedReturnValue();
                      v228[2](v228, v230);

                    }
                  }
                  LOBYTE(v299) = 1;
                  v304 = v219;
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v97 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v360 = v298;
                    *(_WORD *)&v360[4] = 1024;
                    *(_DWORD *)&v360[6] = v329;
                    _os_log_impl(&dword_1906E0000, v97, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey got wrong size (%u > %u)", buf, 0xEu);
                  }
LABEL_173:

                  LOBYTE(v299) = 1;
                }
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v216 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v216, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PreConnectionDataKey should know its size", buf, 2u);
                }

                LOBYTE(v299) = 0;
              }
              goto LABEL_550;
            case 0xDu:
              if (v329 == 12)
              {
                v143 = v330;
                v144 = *(_DWORD *)v330;
                v330 += 4;
                v145 = *(_DWORD *)v330;
                v146 = *((_DWORD *)v143 + 2);
                v330 = v143 + 12;
                -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                v148 = objc_msgSend(v147, "count") == 0;

                if (!v148)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v149 = objc_claimAutoreleasedReturnValue();
                  v150 = bswap32(v144);
                  v151 = bswap32(v145);
                  v152 = bswap32(v146);
                  if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138413058;
                    *(_QWORD *)v360 = self;
                    *(_WORD *)&v360[8] = 1024;
                    *(_DWORD *)&v360[10] = v150;
                    *(_WORD *)&v360[14] = 1024;
                    *(_DWORD *)&v360[16] = v151;
                    *(_WORD *)&v360[20] = 1024;
                    *(_DWORD *)&v360[22] = v152;
                    _os_log_impl(&dword_1906E0000, v149, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventRSSI (%u, %u, %u)", buf, 0x1Eu);
                  }

                  v153 = (void (**)(id, void *))self->_internal->_eventHandler;
                  if (v153)
                  {
                    v363[0] = CFSTR("event-type");
                    v363[1] = CFSTR("rssi-key");
                    v364[0] = &unk_1E2CAE3F0;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v150);
                    v154 = (void *)objc_claimAutoreleasedReturnValue();
                    v362[0] = v154;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v151);
                    v155 = (void *)objc_claimAutoreleasedReturnValue();
                    v362[1] = v155;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v152);
                    v156 = (void *)objc_claimAutoreleasedReturnValue();
                    v362[2] = v156;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v362, 3);
                    v157 = (void *)objc_claimAutoreleasedReturnValue();
                    v364[1] = v157;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v364, v363, 2);
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    v153[2](v153, v158);

                  }
                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 12;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_QueryRSSI should be %u, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0xEu:
              if (v329 == 2)
              {
                LODWORD(v302) = __rev16(*(unsigned __int16 *)v330);
                v330 += 2;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                  v85 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v302;
                    _os_log_impl(&dword_1906E0000, v85, OS_LOG_TYPE_DEFAULT, "got trafficClass %u", buf, 8u);
                  }

                }
                BYTE4(v307) = 1;
                goto LABEL_550;
              }
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TrafficClassKey should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0xFu:
              if (v329 == 4)
              {
                v98 = *v330;
                v99 = v330[1];
                v100 = v330[2];
                v101 = v330[3];
                v330 += 4;
                -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", v310);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = v102;
                if (v102)
                {
                  objc_msgSend(v102, "setMaxBitrate:", (v98 << 24) | (v99 << 16) | (v100 << 8) | v101);
                  -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                  v104 = (void *)objc_claimAutoreleasedReturnValue();
                  v105 = objc_msgSend(v104, "count") == 0;

                  if (!v105)
                  {
                    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                    v106 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = self;
                      *(_WORD *)&v360[8] = 2112;
                      *(_QWORD *)&v360[10] = v107;
                      _os_log_impl(&dword_1906E0000, v106, OS_LOG_TYPE_DEFAULT, "<%@> sent IDSDataChannelEventConnected, current link contexts %@", buf, 0x16u);

                    }
                    v108 = (void (**)(id, void *))self->_internal->_eventHandler;
                    if (v108)
                    {
                      v356[0] = &unk_1E2CAE360;
                      v355[0] = CFSTR("event-type");
                      v355[1] = CFSTR("connected-link");
                      -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                      v109 = objc_claimAutoreleasedReturnValue();
                      v356[1] = v109;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v356, v355, 2);
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      v108[2](v108, v110);

                      goto LABEL_457;
                    }
                  }
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v109 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
                  {
                    -[IDSDatagramChannel _linkContextsCopy](self, "_linkContextsCopy");
                    v243 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)v360 = self;
                    *(_WORD *)&v360[8] = 1024;
                    *(_DWORD *)&v360[10] = (char)v310;
                    *(_WORD *)&v360[14] = 2112;
                    *(_QWORD *)&v360[16] = v243;
                    _os_log_impl(&dword_1906E0000, v109, OS_LOG_TYPE_DEFAULT, "<%@> Can't find the linkContext of linkID %u, linkContexts %@", buf, 0x1Cu);

                  }
LABEL_457:

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_MaxBitrateKey should be %u, not %u bytes, field: %u", buf, 0x14u);
              }
LABEL_488:

              goto LABEL_550;
            case 0x10u:
              if (v329 == 2)
              {
                v86 = *(unsigned __int16 *)v330;
                v330 += 2;
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v87 = objc_claimAutoreleasedReturnValue();
                v88 = __rev16(v86);
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v88;
                  _os_log_impl(&dword_1906E0000, v87, OS_LOG_TYPE_DEFAULT, "got MTU %u", buf, 8u);
                }

                v89 = self->_internal->_cellularLink;
                if (v89)
                {
                  -[IDSDataChannelLinkContext setMTU:](v89, "setMTU:", v88);
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v244 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v244, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CellularMTUChanged requires the cellular link. something is wrong...", buf, 2u);
                  }

                }
                v245 = (void (**)(id, void *))self->_internal->_eventHandler;
                if (v245)
                {
                  v354[0] = &unk_1E2CAE420;
                  v353[0] = CFSTR("event-type");
                  v353[1] = CFSTR("mtu-changed");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v88);
                  v246 = (void *)objc_claimAutoreleasedReturnValue();
                  v354[1] = v246;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v354, v353, 2);
                  v247 = (void *)objc_claimAutoreleasedReturnValue();
                  v245[2](v245, v247);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CellularMTUChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x11u:
              if (v329 >= 8u)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                if (v329 >= 8u)
                {
                  LOWORD(v121) = 0;
                  do
                  {
                    v122 = v330;
                    v123 = *(_DWORD *)v330;
                    v330 += 4;
                    v124 = bswap32(*(_DWORD *)v330);
                    v330 = v122 + 8;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v124, v283);
                    v125 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v123));
                    v126 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v120, "setObject:forKey:", v125, v126);

                    v121 = (unsigned __int16)(v121 + 8);
                  }
                  while (v121 <= v329 - 8);
                }
                if (self->_internal->_eventHandler)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v127 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v360 = v120;
                    _os_log_impl(&dword_1906E0000, v127, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_InfoReportKey report %@", buf, 0xCu);
                  }

                  v128 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v351[0] = CFSTR("event-type");
                  v351[1] = CFSTR("info-report-events-key");
                  v352[0] = &unk_1E2CAE438;
                  v352[1] = v120;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v352, v351, 2);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  v128[2](v128, v129);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_InfoReportKey should be bigger than %u bytes.", buf, 8u);
              }
              goto LABEL_488;
            case 0x14u:
              if (v329 == 1)
              {
                HIDWORD(v302) = *v330++;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                  v176 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = HIDWORD(v302);
                    _os_log_impl(&dword_1906E0000, v176, OS_LOG_TYPE_DEFAULT, "got DSCP %u", buf, 8u);
                  }

                }
                LOBYTE(v308) = 1;
                goto LABEL_550;
              }
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DSCPKey should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x16u:
              if (v329 == 8)
              {
                a6->var9 = *(double *)v330;
                if (!self->_internal->_verboseFunctionalLogging)
                  goto LABEL_550;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  var9 = a6->var9;
                  *(_DWORD *)buf = 134217984;
                  *(double *)v360 = var9;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "got arrivalTime %f", buf, 0xCu);
                }
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 8;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PacketArrivalTime should be %d bytes, not %u bytes, field: %u", buf, 0x14u);
                }
              }
              goto LABEL_488;
            case 0x17u:
              if (v329 == 1)
              {
                HIDWORD(v310) = *v330;
                if (!self->_internal->_verboseFunctionalLogging)
                  goto LABEL_550;
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = HIDWORD(v310);
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "got Channel Priority %u", buf, 8u);
                }
              }
              else
              {
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = v329;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_PriorityKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
                }
              }
              goto LABEL_488;
            case 0x18u:
              if (v329 == 8)
              {
                v311 = bswap64(*(_QWORD *)v330);
                v330 += 8;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                  v130 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)v360 = v311;
                    _os_log_impl(&dword_1906E0000, v130, OS_LOG_TYPE_DEFAULT, "got Participant ID %llu", buf, 0xCu);
                  }

                }
                if (!v311)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v131 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)v360 = 0;
                    _os_log_impl(&dword_1906E0000, v131, OS_LOG_TYPE_DEFAULT, "error: we received Participant ID %llu", buf, 0xCu);
                  }

                  v311 = 0;
                }
                v305 = 1;
                goto LABEL_550;
              }
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantID should be 8 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x1Eu:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v177 = objc_claimAutoreleasedReturnValue();

              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v178 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v360 = v177;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_1906E0000, v178, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKMKey got MKM %@ size %u", buf, 0x12u);
              }

              v316 = (void *)v177;
              goto LABEL_550;
            case 0x1Fu:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v171 = objc_claimAutoreleasedReturnValue();

              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v172 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v360 = v171;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_1906E0000, v172, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKSKey got MKS %@ size %u", buf, 0x12u);
              }

              v315 = (void *)v171;
              goto LABEL_550;
            case 0x20u:
              v179 = objc_alloc(MEMORY[0x1E0CB3A28]);
              v180 = objc_msgSend(v179, "initWithUUIDBytes:", v330);

              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v181 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v360 = v180;
                *(_WORD *)&v360[8] = 1024;
                *(_DWORD *)&v360[10] = v329;
                _os_log_impl(&dword_1906E0000, v181, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMKIKey got MKI %@ size %u", buf, 0x12u);
              }

              v314 = (void *)v180;
              goto LABEL_550;
            case 0x21u:
              if (v329 == 1)
              {
                BYTE4(v301) = *v330;
                BYTE4(v309) = 1;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionMembershipChangedKey should be 1 byte, not %u", buf, 8u);
              }
              goto LABEL_488;
            case 0x22u:
              if (v329 == 1)
              {
                if (self->_internal->_eventHandler)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v63, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionReinitiated - IDSDSession is reinitiated", buf, 2u);
                  }

                  v64 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v349 = CFSTR("event-type");
                  v350 = &unk_1E2CAE450;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v350, &v349, 1);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[2](v64, v65);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionReinitiated should be 1 byte, not %d", buf, 8u);
              }
              goto LABEL_488;
            case 0x23u:
              if (v329 != 1)
                goto LABEL_550;
              v184 = (char)*v330;
              if (v184 >= 0xD)
              {
                +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                v185 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v185, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v184;
                  _os_log_impl(&dword_1906E0000, v185, OS_LOG_TYPE_DEFAULT, "got invalid streamIDCount %d", buf, 8u);
                }

                a6->var4 = 0;
                goto LABEL_550;
              }
              if (!*v330)
                goto LABEL_550;
              a6->var4 = v184;
              if (!self->_internal->_verboseFunctionalLogging)
                goto LABEL_550;
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v184;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "got streamIDCount %d", buf, 8u);
              }
              goto LABEL_488;
            case 0x24u:
              if (a6->var4 < 1)
                goto LABEL_550;
              v77 = 2 * a6->var4;
              if (v329 == (_DWORD)v77)
              {
                var4 = a6->var4;
                a6->var0 |= 2u;
                v79 = v330;
                var5 = a6->var5;
                do
                {
                  v81 = *(unsigned __int16 *)v79;
                  v79 += 2;
                  *var5++ = bswap32(v81) >> 16;
                  v330 = v79;
                  --var4;
                }
                while (var4);
                if (self->_internal->_verboseFunctionalLogging)
                {
                  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
                  v82 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v330[-v77], v77);
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v360 = v83;
                    _os_log_impl(&dword_1906E0000, v82, OS_LOG_TYPE_DEFAULT, "got streamID bytes:%@", buf, 0xCu);

                  }
                }
                goto LABEL_550;
              }
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v77;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StreamIDsKey: size mismatch (%u != %u), ignore.", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x25u:
              if (v329 == 1)
              {
                if (self->_internal->_verboseFunctionalLogging)
                {
                  OSLogHandleForIDSCategory();
                  v182 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v182, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v182, OS_LOG_TYPE_DEFAULT, "got CT(packet counting) option", buf, 2u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                    _IDSLogV();
                }
                BYTE4(v306) = 1;
                goto LABEL_550;
              }
              OSLogHandleForIDSCategory();
              v217 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v217, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v217, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_CountPacketKey  should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                goto LABEL_379;
              goto LABEL_550;
            case 0x26u:
              if (v329 == 2)
              {
                v303 = __rev16(*(unsigned __int16 *)v330);
                v330 += 2;
                if (self->_internal->_verboseFunctionalLogging)
                {
                  OSLogHandleForIDSCategory();
                  v183 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v303;
                    _os_log_impl(&dword_1906E0000, v183, OS_LOG_TYPE_DEFAULT, "got probeGroupID %u", buf, 8u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    v283 = v303;
                    _IDSLogV();
                  }
                }
                LOBYTE(v306) = 1;
                goto LABEL_550;
              }
              OSLogHandleForIDSCategory();
              v218 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v218, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProbeGroupIDKey should be 2 bytes, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                goto LABEL_379;
              goto LABEL_550;
            case 0x27u:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v159 = (void *)MEMORY[0x1E0CB3710];
                v160 = (void *)MEMORY[0x1E0C99E60];
                v161 = objc_opt_class();
                v162 = objc_opt_class();
                v163 = objc_opt_class();
                v164 = objc_opt_class();
                v165 = objc_opt_class();
                objc_msgSend(v160, "setWithObjects:", v161, v162, v163, v164, v165, objc_opt_class(), 0);
                v166 = (void *)objc_claimAutoreleasedReturnValue();
                v325 = 0;
                objc_msgSend(v159, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v166, v40, &v325);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v325;

                if (v167)
                {
                  if (self->_internal->_eventHandler)
                  {
                    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                    v168 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v360 = v167;
                      _os_log_impl(&dword_1906E0000, v168, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - %@", buf, 0xCu);
                    }

                    v169 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                    v347[0] = CFSTR("event-type");
                    v347[1] = CFSTR("session-info-response-key");
                    v348[0] = &unk_1E2CAE468;
                    v348[1] = v167;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v348, v347, 2);
                    v170 = objc_claimAutoreleasedReturnValue();
                    v169[2](v169, v170);
                    goto LABEL_541;
                  }
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v170 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v360 = v40;
                    *(_WORD *)&v360[8] = 2112;
                    *(_QWORD *)&v360[10] = v50;
                    _os_log_impl(&dword_1906E0000, v170, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }
                  v167 = 0;
LABEL_541:

                }
                goto LABEL_549;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoKey - Couldn't get NSData from fieldBytes", buf, 2u);
              }
              goto LABEL_549;
            case 0x28u:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              if (v66)
              {
                v67 = (void *)MEMORY[0x1E0CB3710];
                v68 = (void *)MEMORY[0x1E0C99E60];
                v69 = objc_opt_class();
                v70 = objc_opt_class();
                v71 = objc_opt_class();
                objc_msgSend(v68, "setWithObjects:", v69, v70, v71, objc_opt_class(), 0);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v72, v66, 0);
                v73 = objc_claimAutoreleasedReturnValue();

                if (v73)
                {
                  if (!self->_internal->_eventHandler)
                    goto LABEL_532;
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v74 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v360 = v73;
                    _os_log_impl(&dword_1906E0000, v74, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - %@", buf, 0xCu);
                  }

                  v75 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                  v343[0] = CFSTR("event-type");
                  v343[1] = CFSTR("stat-response-key");
                  v344[0] = &unk_1E2CAE480;
                  v344[1] = v73;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v344, v343, 2);
                  v76 = objc_claimAutoreleasedReturnValue();
                  v75[2](v75, v76);
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v76 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v360 = v66;
                    _os_log_impl(&dword_1906E0000, v76, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - Couldn't decode NSData %@", buf, 0xCu);
                  }
                  v73 = 0;
                }

              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v73 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v73, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsKey - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }
LABEL_532:

              goto LABEL_550;
            case 0x2Bu:
              if (v329 == 1)
              {
                v54 = a6;
                a6->var6 = *v330;
                v55 = a6->var0 | 0x20;
                goto LABEL_193;
              }
              OSLogHandleForIDSCategory();
              v215 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v215, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GenerationCounterLSBKey should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
LABEL_379:
                v283 = v329;
                v284 = v331;
                _IDSLogV();
              }
              goto LABEL_550;
            case 0x2Du:
              if (v329 == 2)
              {
                a6->var7 = bswap32(*(unsigned __int16 *)v330) >> 16;
                BYTE4(v308) = 1;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsID should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x2Eu:
              if (v329 == 2)
              {
                a6->var8.var0 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsServerTimeStamp should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x2Fu:
              if (v329 == 2)
              {
                a6->var8.var1 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsServerPacketInterval should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x30u:
              if (v329 == 2)
              {
                a6->var8.var2 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsTotalServerPacketReceived should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x31u:
              if (v329 == 2)
              {
                a6->var8.var3 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsTotalServerPacketSent should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x32u:
              if (v329 == 2)
              {
                a6->var8.var4 = bswap32(*(unsigned __int16 *)v330) >> 16;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_StatsUplinkBandwidth should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x33u:
              if (v329 == 1)
              {
                v54 = a6;
                v55 = a6->var0 | 0x80;
                goto LABEL_193;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_OptOutPriorityFilter should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x34u:
              if (v329 == 1)
              {
                v54 = a6;
                v55 = a6->var0 | 0x100;
                goto LABEL_193;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = v329;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_TransitionPacketFlag should be 1 byte, not %u bytes, field: %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x36u:
              if (v329 == 4)
              {
                v27 = *v330;
                v28 = v330[1];
                v29 = v330[2];
                v30 = v330[3];
                v330 += 4;
                if (self->_internal->_eventHandler)
                {
                  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("IDS couldn't receive the response for the session info request."), v297, 0);
                  v32 = (v27 << 24) | (v28 << 16) | (v29 << 8) | v30;
                  v33 = v32 - 1;
                  v34 = v32 + 8;
                  if (v33 >= 5)
                    v35 = 14;
                  else
                    v35 = v34;
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v35;
                    _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoResponseErrorKey errorCode %u", buf, 8u);
                  }

                  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", v296, v35, v31);
                  v38 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v345[0] = CFSTR("event-type");
                  v345[1] = CFSTR("error-key");
                  v346[0] = &unk_1E2CAE468;
                  v346[1] = v37;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v346, v345, 2);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v38[2](v38, v39);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SessionInfoResponseErrorKey should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x37u:
              if (v329 == 1)
              {
                BYTE4(v299) = *v330 != 0;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionLocallyGeneratedInfoKey should be 1 byte, not %u", buf, 8u);
              }
              goto LABEL_488;
            case 0x3Cu:
              v173 = v329;
              if (v329)
              {
                v174 = v330;
                v175 = *v330;
                if (*v330)
                {
                  if (v329 > 1u)
                  {
                    if (v329 == 2)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - no valid linkID", buf, 2u);
                      }
                      goto LABEL_488;
                    }
                    v252 = (char)v330[2];
                    if (v329 < 7u)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid timestamp", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 9u)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid reorderedPackets", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xBu)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid probingRequests", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xDu)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid probingResponses", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    if (v329 < 0xFu)
                    {
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v18 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)v360 = v252;
                        _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid offsetAndRTTCount", buf, 8u);
                      }
                      goto LABEL_488;
                    }
                    v288 = *(unsigned __int16 *)(v330 + 7);
                    v289 = *(_DWORD *)(v330 + 3);
                    v287 = *(unsigned __int16 *)(v330 + 9);
                    v285 = v330[1];
                    v286 = *(unsigned __int16 *)(v330 + 11);
                    v253 = *(unsigned __int16 *)(v330 + 13);
                    v290 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    if (v253)
                    {
                      v254 = 0;
                      v255 = (unint64_t)&v174[v173];
                      v256 = __rev16(v253);
                      v257 = (unint64_t)(v174 + 19);
                      while (v257 - 2 <= v255)
                      {
                        if (v257 > v255)
                        {
                          +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                          v262 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 67109376;
                            *(_DWORD *)v360 = v252;
                            *(_WORD *)&v360[4] = 1024;
                            *(_DWORD *)&v360[6] = v254;
                            v263 = "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid rtt, i: %d";
LABEL_499:
                            _os_log_impl(&dword_1906E0000, v262, OS_LOG_TYPE_DEFAULT, v263, buf, 0xEu);
                          }
                          goto LABEL_500;
                        }
                        v258 = *(unsigned __int16 *)(v257 - 2);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(*(unsigned __int16 *)(v257 - 4)) >> 16);
                        v259 = (void *)objc_claimAutoreleasedReturnValue();
                        v361[0] = v259;
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v258) >> 16);
                        v260 = (void *)objc_claimAutoreleasedReturnValue();
                        v361[1] = v260;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v361, 2);
                        v261 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v290, "addObject:", v261);

                        ++v254;
                        v257 += 4;
                        if (v256 == v254)
                          goto LABEL_501;
                      }
                      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                      v262 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 67109376;
                        *(_DWORD *)v360 = v252;
                        *(_WORD *)&v360[4] = 1024;
                        *(_DWORD *)&v360[6] = v254;
                        v263 = "kClientChannelMetadataType_GetLinkStatusKey: linkID: %d, no valid requestOffset, i: %d";
                        goto LABEL_499;
                      }
LABEL_500:

                    }
LABEL_501:
                    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(v289));
                    v265 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v265)
                    {
                      CFDictionarySetValue(Mutable, key, v265);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = key;
                      *(_WORD *)&v360[8] = 2080;
                      *(_QWORD *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_1906E0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v288) >> 16);
                    v266 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v266)
                    {
                      CFDictionarySetValue(Mutable, v294, v266);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = v294;
                      *(_WORD *)&v360[8] = 2080;
                      *(_QWORD *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_1906E0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v287) >> 16);
                    v267 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v267)
                    {
                      CFDictionarySetValue(Mutable, v293, v267);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = v293;
                      *(_WORD *)&v360[8] = 2080;
                      *(_QWORD *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_1906E0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(v286) >> 16);
                    v268 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v268)
                    {
                      CFDictionarySetValue(Mutable, v292, v268);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = v292;
                      *(_WORD *)&v360[8] = 2080;
                      *(_QWORD *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_1906E0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    v269 = v290;
                    if (v269)
                    {
                      CFDictionarySetValue(Mutable, v291, v269);
                    }
                    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v360 = v291;
                      *(_WORD *)&v360[8] = 2080;
                      *(_QWORD *)&v360[10] = "linkStatus";
                      _os_log_error_impl(&dword_1906E0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
                    }

                    probingDict = self->_internal->_probingDict;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v252);
                    v271 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSMutableDictionary setObject:forKey:](probingDict, "setObject:forKey:", Mutable, v271);

                    if (v285 == v175)
                    {
                      v272 = self->_internal;
                      if (v272->_eventHandler)
                      {
                        v273 = (void *)-[NSMutableDictionary copy](v272->_probingDict, "copy");
                        +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                        v274 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v274, OS_LOG_TYPE_DEFAULT))
                        {
                          v275 = objc_msgSend(v273, "count");
                          objc_msgSend(v273, "allKeys");
                          v276 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 134218498;
                          *(_QWORD *)v360 = v275;
                          *(_WORD *)&v360[8] = 2112;
                          *(_QWORD *)&v360[10] = v276;
                          *(_WORD *)&v360[18] = 2112;
                          *(_QWORD *)&v360[20] = v273;
                          _os_log_impl(&dword_1906E0000, v274, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ProbingRequestOffsetKey - total size: %lu, all keys: %@, output: %@", buf, 0x20u);

                        }
                        v277 = (void (**)(id, void *))self->_internal->_eventHandler;
                        v357[0] = CFSTR("event-type");
                        v357[1] = CFSTR("probing-response-key");
                        v358[0] = &unk_1E2CAE408;
                        v358[1] = v273;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v358, v357, 2);
                        v278 = (void *)objc_claimAutoreleasedReturnValue();
                        v277[2](v277, v278);

                        v272 = self->_internal;
                      }
                      -[NSMutableDictionary removeAllObjects](v272->_probingDict, "removeAllObjects", v283);
                    }

                    goto LABEL_550;
                  }
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - no valid currentLinkIDCount", buf, 2u);
                  }
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v18 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - invalid totalLinkIDs: 0", buf, 2u);
                  }
                }
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_GetLinkStatusKey - invalid fieldBytesSize: 0", buf, 2u);
                }
              }
              goto LABEL_488;
            case 0x3Du:
              if (v329 == 4)
              {
                v56 = *(_DWORD *)v330;
                v330 += 4;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v57 = objc_claimAutoreleasedReturnValue();
                v58 = bswap32(v56);
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v58;
                  _os_log_impl(&dword_1906E0000, v57, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SoMaskChanged got SoMask: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v58;
                    _os_log_impl(&dword_1906E0000, v59, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_SoMaskChanged, SoMask: %u", buf, 8u);
                  }

                  v60 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v338[0] = &unk_1E2CAE4C8;
                  v337[0] = CFSTR("event-type");
                  v337[1] = CFSTR("somask-changed");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v58);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v338[1] = v61;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v338, v337, 2);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  v60[2](v60, v62);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 4;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_SoMaskChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x3Eu:
              if (v329 == 2)
              {
                v90 = *(unsigned __int16 *)v330;
                v330 += 2;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v91 = objc_claimAutoreleasedReturnValue();
                v92 = __rev16(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v92;
                  _os_log_impl(&dword_1906E0000, v91, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathWiFiFlagsChanged got wifiLocalAttributes: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v93 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v92;
                    _os_log_impl(&dword_1906E0000, v93, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_nwPathWiFiFlagsChanged, wifiLocalAttributes: %u", buf, 8u);
                  }

                  v94 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v342[0] = &unk_1E2CAE498;
                  v341[0] = CFSTR("event-type");
                  v341[1] = CFSTR("wifi-local-attributes-changed-key");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v92);
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  v342[1] = v95;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v342, v341, 2);
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  v94[2](v94, v96);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathWiFiFlagsChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x3Fu:
              if (v329 == 2)
              {
                v132 = *(unsigned __int16 *)v330;
                v330 += 2;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v133 = objc_claimAutoreleasedReturnValue();
                v134 = __rev16(v132);
                if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v134;
                  _os_log_impl(&dword_1906E0000, v133, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathCellularFlagsChanged got cellularLocalAttributes: %u", buf, 8u);
                }

                if (self->_internal->_eventHandler)
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v135 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v360 = v134;
                    _os_log_impl(&dword_1906E0000, v135, OS_LOG_TYPE_DEFAULT, "send event to client about kClientChannelMetadataType_nwPathCellularFlagsChanged, cellularLocalAttributes: %u", buf, 8u);
                  }

                  v136 = (void (**)(id, void *))self->_internal->_eventHandler;
                  v340[0] = &unk_1E2CAE4B0;
                  v339[0] = CFSTR("event-type");
                  v339[1] = CFSTR("cellular-local-attributes-changed-key");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v134);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  v340[1] = v137;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v340, v339, 2);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  v136[2](v136, v138);

                }
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v360 = 2;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                *(_WORD *)&v360[10] = 1024;
                *(_DWORD *)&v360[12] = v331;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_nwPathCellularFlagsChanged should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
              }
              goto LABEL_488;
            case 0x43u:
              if (v329 == 1)
              {
                LOBYTE(v309) = *v330 != 0;
                goto LABEL_550;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NeedsHBHEncryption should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x45u:
              if (v329 == 8)
              {
                v84 = *(_QWORD *)v330;
                v330 += 8;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                v300 = bswap64(v84);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v360 = v300;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionSequenceNumber got %llu (*Client <- IDSD)", buf, 0xCu);
                }
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v360 = 8;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  *(_WORD *)&v360[10] = 1024;
                  *(_DWORD *)&v360[12] = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionSequenceNumber should be %u bytes, not %u bytes, field: %u", buf, 0x14u);
                }
              }
              goto LABEL_488;
            case 0x46u:
              v201 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v202 = (void *)objc_claimAutoreleasedReturnValue();
              if (v202)
              {
                v203 = (void *)MEMORY[0x1E0CB3710];
                v204 = (void *)MEMORY[0x1E0C99E60];
                v205 = objc_opt_class();
                v206 = objc_opt_class();
                v207 = objc_opt_class();
                v208 = objc_opt_class();
                v209 = objc_opt_class();
                objc_msgSend(v204, "setWithObjects:", v205, v206, v207, v208, v209, objc_opt_class(), 0);
                v210 = (void *)objc_claimAutoreleasedReturnValue();
                v324 = 0;
                objc_msgSend(v203, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v210, v202, &v324);
                v211 = (void *)objc_claimAutoreleasedReturnValue();
                v212 = v324;

                if (v211)
                {
                  v213 = (__CFDictionary *)objc_msgSend(v211, "mutableCopy");

                  CFDictionarySetValue(v213, CFSTR("event-type"), &unk_1E2CAE4E0);
                  if (self->_internal->_eventHandler)
                  {
                    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                    v214 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v360 = v213;
                      _os_log_impl(&dword_1906E0000, v214, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - %@", buf, 0xCu);
                    }

                    (*((void (**)(void))self->_internal->_eventHandler + 2))();
                  }
                  v201 = v213;
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v279 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v279, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v360 = v202;
                    *(_WORD *)&v360[8] = 2112;
                    *(_QWORD *)&v360[10] = v212;
                    _os_log_impl(&dword_1906E0000, v279, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }

                  v211 = 0;
                }

              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v212 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v212, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v212, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_LinkSuggestion - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }

              goto LABEL_550;
            case 0x47u:
              if (v329 == 1)
              {
                v54 = a6;
                a6->var14 = *v330 != 0;
                v55 = a6->var0 | 0x10000;
                goto LABEL_193;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v360 = 1;
                *(_WORD *)&v360[4] = 1024;
                *(_DWORD *)&v360[6] = v329;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_RetransmittedPacket should be %u byte, not %u", buf, 0xEu);
              }
              goto LABEL_488;
            case 0x48u:
              if (v329 != 1)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = 1;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_NonRetransmittablePacket should be %u byte, not %u", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v54 = a6;
              a6->var15 = *v330 != 0;
              v55 = a6->var0 | 0x20000;
LABEL_193:
              v54->var0 = v55;
              goto LABEL_550;
            case 0x49u:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v41 = (void *)MEMORY[0x1E0CB3710];
                v42 = (void *)MEMORY[0x1E0C99E60];
                v43 = objc_opt_class();
                v44 = objc_opt_class();
                v45 = objc_opt_class();
                v46 = objc_opt_class();
                v47 = objc_opt_class();
                objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, v47, objc_opt_class(), 0);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v323 = 0;
                objc_msgSend(v41, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v48, v40, &v323);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v323;

                if (v49)
                {
                  if (self->_internal->_eventHandler)
                  {
                    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                    v51 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v360 = v49;
                      _os_log_impl(&dword_1906E0000, v51, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - %@", buf, 0xCu);
                    }

                    v52 = (void (**)(id, NSObject *))self->_internal->_eventHandler;
                    v335[0] = CFSTR("event-type");
                    v335[1] = CFSTR("reporting-blob-key");
                    v336[0] = &unk_1E2CAE4F8;
                    v336[1] = v49;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v336, v335, 2);
                    v53 = objc_claimAutoreleasedReturnValue();
                    v52[2](v52, v53);
                    goto LABEL_547;
                  }
                }
                else
                {
                  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                  v53 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)v360 = v40;
                    *(_WORD *)&v360[8] = 2112;
                    *(_QWORD *)&v360[10] = v50;
                    _os_log_impl(&dword_1906E0000, v53, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - Couldn't decode NSData %@ (error: %@)", buf, 0x16u);
                  }
                  v49 = 0;
LABEL_547:

                }
                goto LABEL_549;
              }
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EventReportingBlob - Couldn't get NSData from fieldBytes", buf, 2u);
              }
LABEL_549:

LABEL_550:
              if ((IDSByteBufferReadField() & 1) == 0)
                goto LABEL_553;
              break;
            case 0x4Au:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v19)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingReplacment - Couldn't get NSData from fieldBytes", buf, 2u);
                }
                goto LABEL_488;
              }
              os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
              if (!self->_internal->_linkIDToParticipantMap)
              {
                v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                v21 = self->_internal;
                linkIDToParticipantMap = v21->_linkIDToParticipantMap;
                v21->_linkIDToParticipantMap = (NSMutableDictionary *)v20;

              }
              -[IDSDatagramChannel _extractparticipantIDToHashedIDMappingFromData:](self, "_extractparticipantIDToHashedIDMappingFromData:", v19, v283, v284);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
              if (v23)
              {
                if (v25)
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v360 = (char)v310;
                  *(_WORD *)&v360[4] = 2112;
                  *(_QWORD *)&v360[6] = v23;
                  _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "linkID %d, got kClientChannelMetadataType_ParticipantMappingReplacment: %@", buf, 0x12u);
                }

                v26 = self->_internal->_linkIDToParticipantMap;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", (char)v310);
                v24 = objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v23, v24);
              }
              else if (v25)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingReplacment - Couldn't decode NSData.", buf, 2u);
              }

              os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);
LABEL_439:
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329, v283);
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              if (v188)
              {
                os_unfair_lock_lock(&self->_internal->_linkIDToParticipantMapLock);
                if (!self->_internal->_linkIDToParticipantMap)
                {
                  v231 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                  v232 = self->_internal;
                  v233 = v232->_linkIDToParticipantMap;
                  v232->_linkIDToParticipantMap = (NSMutableDictionary *)v231;

                }
                -[IDSDatagramChannel _extractparticipantIDToHashedIDMappingFromData:](self, "_extractparticipantIDToHashedIDMappingFromData:", v188);
                v190 = objc_claimAutoreleasedReturnValue();
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v234 = objc_claimAutoreleasedReturnValue();
                v235 = os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT);
                if (v190)
                {
                  v236 = (char)v310;
                  if (v235)
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v360 = (char)v310;
                    *(_WORD *)&v360[4] = 2112;
                    *(_QWORD *)&v360[6] = v190;
                    _os_log_impl(&dword_1906E0000, v234, OS_LOG_TYPE_DEFAULT, "linkID %d, got kClientChannelMetadataType_ParticipantMappingUpdate: %@", buf, 0x12u);
                  }

                  v237 = self->_internal->_linkIDToParticipantMap;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v236);
                  v238 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary objectForKeyedSubscript:](v237, "objectForKeyedSubscript:", v238);
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  v234 = objc_msgSend(v239, "mutableCopy");

                  -[NSObject addEntriesFromDictionary:](v234, "addEntriesFromDictionary:", v190);
                  v240 = -[NSObject copy](v234, "copy");
                  v241 = self->_internal->_linkIDToParticipantMap;
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v236);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v241, "setObject:forKeyedSubscript:", v240, v242);

                }
                else if (v235)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v234, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingUpdate - Couldn't decode NSData.", buf, 2u);
                }

                os_unfair_lock_unlock(&self->_internal->_linkIDToParticipantMapLock);
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v190 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v190, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1906E0000, v190, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ParticipantMappingUpdate - Couldn't get NSData from fieldBytes", buf, 2u);
                }
              }
              goto LABEL_261;
            case 0x4Bu:
              goto LABEL_439;
            case 0x4Cu:
              if (v329 < 2u)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v360 = 18;
                  *(_WORD *)&v360[4] = 1024;
                  *(_DWORD *)&v360[6] = v329;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_ChildConnectionID should be %u bytes, not %u bytes", buf, 0xEu);
                }
                goto LABEL_488;
              }
              v186 = v330 + 1;
              v187 = *v330;
              -[IDSDatagramChannel _linkContextWithID:](self, "_linkContextWithID:", *v330);
              v188 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v186, v329 - 1);
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              JWDecodeDictionary();
              v190 = objc_claimAutoreleasedReturnValue();

              -[IDSDatagramChannel _addConnections:toLinkContext:](self, "_addConnections:toLinkContext:", v190, v188);
              if (v190)
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v191 = objc_claimAutoreleasedReturnValue();
                v192 = v187;
                if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                {
                  v193 = objc_msgSend(v188, "isQUICPod");
                  v194 = CFSTR("NO");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v360 = v190;
                  if (v193)
                    v194 = CFSTR("YES");
                  *(_WORD *)&v360[8] = 1024;
                  *(_DWORD *)&v360[10] = v192;
                  *(_WORD *)&v360[14] = 2112;
                  *(_QWORD *)&v360[16] = v194;
                  _os_log_impl(&dword_1906E0000, v191, OS_LOG_TYPE_DEFAULT, "addDirectConnectionForLinkID: received child connections %@ for linkID %d, isQUICPod %@", buf, 0x1Cu);
                }

                -[IDSDatagramChannel addDirectConnectionForLinkID:linkContext:](self, "addDirectConnectionForLinkID:linkContext:", v192, v188);
                if ((objc_msgSend(v188, "isVirtualRelayLink") & 1) == 0)
                {
                  v321 = 0u;
                  v322 = 0u;
                  v319 = 0u;
                  v320 = 0u;
                  -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
                  v195 = (void *)objc_claimAutoreleasedReturnValue();
                  v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v319, v334, 16);
                  if (v196)
                  {
                    v197 = *(_QWORD *)v320;
                    do
                    {
                      for (i = 0; i != v196; ++i)
                      {
                        if (*(_QWORD *)v320 != v197)
                          objc_enumerationMutation(v195);
                        v199 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * i);
                        v200 = objc_msgSend(v199, "delegatedLinkID", v283);
                        if (v200 == objc_msgSend(v188, "linkID"))
                          -[IDSDatagramChannel addDirectConnectionForLinkID:linkContext:](self, "addDirectConnectionForLinkID:linkContext:", objc_msgSend(v199, "linkID"), v199);
                      }
                      v196 = objc_msgSend(v195, "countByEnumeratingWithState:objects:count:", &v319, v334, 16);
                    }
                    while (v196);
                  }

                }
              }
LABEL_261:

              goto LABEL_550;
            case 0x52u:
              if (v329 == 1)
              {
                LODWORD(v301) = *v330;
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v301;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionShortKILengthKey got shortKILength %u", buf, 8u);
                }
              }
              else
              {
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v329;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_EncryptionShortKILengthKey should be 1 byte, not %u", buf, 8u);
                }
              }
              goto LABEL_488;
            default:
              if (v331 == 253)
              {
                if (v329 == 1)
                {
                  v312 = *v330;
                  goto LABEL_550;
                }
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v329;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferTypeKey should be 1 byte, not %u", buf, 8u);
                }
                goto LABEL_488;
              }
              if (v331 != 254)
              {
LABEL_22:
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels", v283);
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v360 = v331;
                  _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "Unknown metadata type: %u", buf, 8u);
                }
                goto LABEL_488;
              }
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v330, v329);
              v16 = objc_claimAutoreleasedReturnValue();

              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v360 = v329;
                _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "kClientChannelMetadataType_DebugDataTransferKey got data size %u", buf, 8u);
              }

              v313 = (void *)v16;
              goto LABEL_550;
          }
        }
      }
      v308 = 0;
      v309 = 0;
      v313 = 0;
      v314 = 0;
      v312 = 0;
      v301 = 0;
      v302 = 0;
      v315 = 0;
      v316 = 0;
      BYTE4(v299) = 0;
      LOWORD(v303) = 0;
      v304 = 0;
      v306 = 0;
      v307 = 0;
      v310 = 0;
      v311 = 0;
      v305 = 0;
      v300 = -1;
LABEL_553:
      IDSByteBufferRelease();
      if (v316 && v315 && self->_internal->_eventHandler)
        -[IDSDatagramChannel sendMediaEncryptionInfoWithMKM:MKS:MKI:participantID:isLocallyGenerated:shortKILength:encryptionSequenceNumber:](self, "sendMediaEncryptionInfoWithMKM:MKS:MKI:participantID:isLocallyGenerated:shortKILength:encryptionSequenceNumber:", v316, v315, v314, v311, BYTE4(v299) & 1, v301, v300);
      if ((v309 & 0x100000000) != 0)
        -[IDSDatagramChannel sendMediaMembershipChangedInfo:](self, "sendMediaMembershipChangedInfo:", BYTE4(v301));
      v280 = v313;
      if ((v307 & 1) != 0)
        a5->var0 = v310;
      if ((v307 & 0x100000000) != 0)
        a5->var1 = v302;
      if ((v308 & 1) != 0)
        a5->var2 = BYTE4(v302);
      if ((v305 & 1) != 0)
      {
        a6->var0 |= 1u;
        a6->var1 = v311;
      }
      if ((v306 & 1) != 0)
      {
        a6->var0 |= 0x10u;
        a6->var2 = v303;
      }
      if ((v306 & 0x100000000) != 0)
        a6->var0 |= 4u;
      if (HIDWORD(v310))
      {
        a6->var0 |= 8u;
        a6->var3 = BYTE4(v310);
      }
      if ((v308 & 0x100000000) != 0)
        a6->var0 |= 0x40u;
      if ((v309 & 1) != 0)
      {
        a6->var11 = 1;
        a6->var0 |= 0x400u;
      }
      if (v312)
      {
        if (v313)
        {
          v281 = (void (**)(id, void *))self->_internal->_eventHandler;
          if (v281)
          {
            if (v312 == 2)
            {
              v332[0] = CFSTR("event-type");
              v332[1] = CFSTR("debug-data-type-key");
              v333[0] = &unk_1E2CAE510;
              v333[1] = &unk_1E2CAE528;
              v332[2] = CFSTR("debug-data-key");
              v333[2] = v313;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v333, v332, 3);
              v282 = (void *)objc_claimAutoreleasedReturnValue();
              v281[2](v281, v282);

              v280 = v313;
            }
          }
        }
      }

      v8 = v304;
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v360 = 2;
        *(_WORD *)&v360[4] = 2048;
        *(_QWORD *)&v360[6] = v12;
        *(_WORD *)&v360[14] = 2048;
        *(_QWORD *)&v360[16] = a4;
        v9 = "processMetadataForDatagram %d + metadataSize(%zd) > datagramSize(%zd) - returning";
        v10 = v8;
        v11 = 28;
        goto LABEL_7;
      }
    }
  }
  else
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v360 = a4;
      v9 = "processMetadataForDatagram datagramSize(%zd) <= kIDSClientChannelMetadataLengthSize - returning";
      v10 = v8;
      v11 = 12;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }

}

- (void)_addConnections:(id)a3 toLinkContext:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *p_linkContextsLock;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = *MEMORY[0x1E0D34798];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D34798]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D347A0];
    objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D347A0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSDatagramChannel _connectionInfoForDictionary:](self, "_connectionInfoForDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSDatagramChannel _connectionInfoForDictionary:](self, "_connectionInfoForDictionary:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    p_linkContextsLock = &self->_internal->_linkContextsLock;
    os_unfair_lock_lock(p_linkContextsLock);
    if (v12)
    {
      objc_msgSend(v12, "setIsQUICPod:", 1);
      objc_msgSend(v12, "setType:", v7);
      objc_msgSend(v6, "connections");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setQpod:", v12);

    }
    if (v11)
    {
      objc_msgSend(v11, "setIsQUICPod:", 0);
      objc_msgSend(v11, "setType:", v9);
      objc_msgSend(v6, "connections");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUdp:", v11);

    }
    os_unfair_lock_unlock(p_linkContextsLock);

  }
}

- (id)_connectionInfoForDictionary:(id)a3
{
  id v3;
  _IDSDataChannelLinkConnection *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(_IDSDataChannelLinkConnection);
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34750]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length") == 16)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v6), "bytes"));
      -[_IDSDataChannelLinkConnection setChildConnectionID:](v4, "setChildConnectionID:", v7);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34760]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSDataChannelLinkConnection setProtocolStack:](v4, "setProtocolStack:", v8);
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34758]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSDataChannelLinkConnection setNwConnectionToken:](v4, "setNwConnectionToken:", v9);
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34748]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_IDSDataChannelLinkConnection setAllowOutgoing:](v4, "setAllowOutgoing:", objc_msgSend(v10, "BOOLValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_extractparticipantIDToHashedIDMappingFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  NSObject *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v4, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v7, v3, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;

    if (!v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = sub_1907C4394;
        v16[3] = &unk_1E2C64B28;
        v17 = v10;
        v9 = v10;
        objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
        v11 = -[NSObject copy](v9, "copy");
        v12 = v17;
LABEL_10:

        goto LABEL_11;
      }
      v9 = 0;
    }
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v13;
      v14 = v13;
      _os_log_impl(&dword_1906E0000, v12, OS_LOG_TYPE_DEFAULT, "_extractDictionaryFromData - Couldn't decode NSData, error:%@, extractedDataType:%@", buf, 0x16u);

    }
    v11 = 0;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)processDatagram:(const char *)a3 datagramSize:(unint64_t)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void (**eventHandler)(id, void *);
  void *v25;
  void *v26;
  BOOL v27;
  _BOOL4 v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  unint64_t v43;
  unsigned __int16 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  IDSDatagramChannel *v48;
  __int16 v49;
  unint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  _QWORD v75[16];

  v75[15] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v44 = -21846;
  v43 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v75[8] = xmmword_19080AA70;
  memset(&v75[10], 170, 40);
  memset(v75, 170, 64);
  if (a4 < 2)
  {
    LODWORD(v13) = 0;
    LODWORD(v12) = 0;
    goto LABEL_10;
  }
  v12 = __rev16(*(unsigned __int16 *)a3);
  v13 = (v12 + 2);
  if (a4 < v13)
  {
LABEL_10:
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v18 = v12;
      v48 = self;
      v49 = 2048;
      v13 = v13;
      v50 = a4;
      v51 = 2048;
      v52 = v12;
      v53 = 2048;
      v54 = v13;
      _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "<%@> read sanity check failed: datagramSize %ld metadataSize %ld dataOffset %ld", buf, 0x2Au);
    }
    else
    {
      v18 = v12;
      v13 = v13;
    }

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("read sanity check failed: datagramSize %ld metadataSize %ld dataOffset %ld"), a4, v18, v13);
    v20 = objc_alloc(MEMORY[0x1E0C99D80]);
    v21 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", v19, *MEMORY[0x1E0CB2D50], 0);
    v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v23 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 3, v21);
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, 0, 0, v23);
    else
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, 0, 0, 0, v23);
    eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    if (eventHandler)
    {
      v45[0] = CFSTR("event-type");
      v45[1] = CFSTR("connected-link");
      v46[0] = &unk_1E2CAE348;
      -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v26);

    }
    -[IDSDatagramChannel close](self, "close");

    v27 = 0;
    goto LABEL_19;
  }
  -[IDSDatagramChannel processMetadataForDatagram:size:datagramInfo:options:](self, "processMetadataForDatagram:size:datagramInfo:options:", a3, a4, &v43, v75);
  v14 = (unsigned __int8 *)&a3[v13];
  v15 = a4 - v13;
  if (a4 == v13)
  {
    if ((v75[0] & 0x40) != 0)
    {
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v48) = HIWORD(v75[5]);
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "readFromNWConnection: _internal->_connection: Only has statsID: %x", buf, 8u);
      }

      if (v10)
        (*((void (**)(id, unsigned __int8 *, _QWORD, unint64_t, _QWORD, _QWORD))v10 + 2))(v10, v14, 0, v43, v44, 0);
      else
        (*((void (**)(id, unsigned __int8 *, _QWORD, unint64_t, _QWORD, _QWORD *, _QWORD))v11 + 2))(v11, v14, 0, v43, v44, v75, 0);
    }
  }
  else
  {
    -[IDSDatagramChannel _logReceivingStats:](self, "_logReceivingStats:", a4 - v13);
    if (v10)
      (*((void (**)(id, unsigned __int8 *, unint64_t, unint64_t, _QWORD, _QWORD))v10 + 2))(v10, v14, a4 - v13, v43, v44, 0);
    else
      (*((void (**)(id, unsigned __int8 *, unint64_t, unint64_t, _QWORD, _QWORD *, _QWORD))v11
       + 2))(v11, v14, a4 - v13, v43, v44, v75, 0);
  }
  if (!self->_internal->_verboseFunctionalLogging)
  {
    v27 = 1;
    goto LABEL_20;
  }
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v19 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v15 < 0xA)
  {
    if (v29)
    {
      *(_DWORD *)buf = 138413058;
      v48 = self;
      v49 = 2048;
      v50 = v15;
      v51 = 2048;
      v52 = v12;
      v53 = 2048;
      v54 = (v12 + 2);
      v40 = "<%@> read details: datagramSize %ld metadataSize %ld dataOffset %ld";
      v41 = v19;
      v42 = 42;
      goto LABEL_33;
    }
  }
  else if (v29)
  {
    v30 = *v14;
    v31 = v14[1];
    v32 = v14[2];
    v33 = v14[3];
    v34 = v14[4];
    v35 = v14[5];
    v36 = v14[6];
    v37 = v14[7];
    v38 = v14[8];
    v39 = v14[9];
    *(_DWORD *)buf = 138415618;
    v48 = self;
    v49 = 2048;
    v50 = v15;
    v51 = 2048;
    v52 = v12;
    v53 = 2048;
    v54 = (v12 + 2);
    v55 = 1024;
    v56 = v30;
    v57 = 1024;
    v58 = v31;
    v59 = 1024;
    v60 = v32;
    v61 = 1024;
    v62 = v33;
    v63 = 1024;
    v64 = v34;
    v65 = 1024;
    v66 = v35;
    v67 = 1024;
    v68 = v36;
    v69 = 1024;
    v70 = v37;
    v71 = 1024;
    v72 = v38;
    v73 = 1024;
    v74 = v39;
    v40 = "<%@> read details: datagramSize %ld metadataSize %ld dataOffset %ld [%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x ...]";
    v41 = v19;
    v42 = 102;
LABEL_33:
    _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, v40, buf, v42);
  }
  v27 = 1;
LABEL_19:

LABEL_20:
  return v27;
}

- (void)handleIncomingDatagram:(const char *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 datagramOptions:(id *)a6
{
  unsigned __int16 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  _IDSDatagramChannel *internal;
  id readHandler;
  id readHandlerWithOptions;
  _DWORD v18[2];
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v7 = *(_WORD *)&a5.var4;
  v8 = *(_QWORD *)&a5.var0;
  v9 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v12 = -[IDSDatagramChannel _logChecksum:length:](self, "_logChecksum:length:", a3, a4);
  if (v12)
  {
    v13 = v12;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109376;
      v18[1] = v9;
      v19 = 2048;
      v20 = v13;
      _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "Recv datagram checksum %uB/%lu", (uint8_t *)v18, 0x12u);
    }

  }
  internal = self->_internal;
  readHandler = internal->_readHandler;
  if (readHandler)
  {
    (*((void (**)(id, const char *, uint64_t, uint64_t, _QWORD, _QWORD))readHandler + 2))(readHandler, a3, v9, v8, v7, 0);
  }
  else
  {
    readHandlerWithOptions = internal->_readHandlerWithOptions;
    if (readHandlerWithOptions)
      (*((void (**)(id, const char *, uint64_t, uint64_t, _QWORD, $1AF4AE5744D0566D2BCFD0852A296D31 *, _QWORD))readHandlerWithOptions
       + 2))(readHandlerWithOptions, a3, v9, v8, v7, a6, 0);
  }
}

- (void)readFromNWConnection:(id)a3 maximumDatagrams:(unsigned int)a4 readHandler:(id)a5 readHandlerWithOptions:(id)a6
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _IDSDatagramChannel *internal;
  void (**eventHandler)(id, void *);
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (unint64_t)a5;
  v11 = (unint64_t)a6;
  if (v10 | v11)
  {
    v12 = (void *)objc_msgSend((id)v10, "copy");
    v13 = (void *)objc_msgSend((id)v11, "copy");
    v20 = v12;
    v21 = (id)v10;
    v22 = (id)v11;
    v19 = v9;
    v14 = v13;
    v15 = v12;
    nw_connection_read_multiple();

  }
  else
  {
    os_unfair_lock_lock(&self->_internal->_readLock);
    internal = self->_internal;
    eventHandler = (void (**)(id, void *))internal->_eventHandler;
    if (eventHandler)
    {
      v23 = CFSTR("event-type");
      v24[0] = &unk_1E2CAE540;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v18);

      internal = self->_internal;
    }
    os_unfair_lock_unlock(&internal->_readLock);
  }

}

- (void)readFromOSChannel:(channel *)a3 ring:(channel_ring_desc *)a4 maximumDatagrams:(unsigned int)a5 readHandler:(id)a6 readHandlerWithOptions:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *p_readLock;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  BOOL v21;
  __int128 v22;
  int v23;
  NSObject *v24;
  int v25;
  os_unfair_lock_s *lock;
  id v27;
  void (**v28)(void);
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = (void (**)(void))a6;
  v27 = a7;
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  lock = p_readLock;
  if (self->_internal->_isInvalidated)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "invalidating - not reading more";
LABEL_4:
      v16 = v14;
      v17 = 2;
LABEL_5:
      _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
LABEL_6:

    goto LABEL_7;
  }
  if (!a4)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v15 = "os_channel not yet ready to read";
    goto LABEL_4;
  }
  v18 = os_channel_available_slot_count();
  if (!v18)
  {
    -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    *(_WORD *)buf = 0;
    v15 = "os_channel_available_slot_count gave no slots to read";
    goto LABEL_4;
  }
  if (v18 >= a5)
    v19 = a5;
  else
    v19 = v18;
  if (!v19)
  {
LABEL_29:
    v23 = os_channel_advance_slot();
    if (v23)
    {
      -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v23;
        _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "os_channel_advance_slot failed for read %d", buf, 8u);
      }

    }
    v25 = os_channel_sync();
    if (!v25)
      goto LABEL_7;
    -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v25;
      v15 = "os_channel_sync for RX failed %d";
      v16 = v14;
      v17 = 8;
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  v20 = 0;
  v21 = 1;
  while (1)
  {
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v31 = v22;
    v32 = v22;
    *(_OWORD *)buf = v22;
    v30 = v22;
    os_channel_get_next_slot();
    if (!self->_internal->_hasMetadata)
    {
      -[IDSDatagramChannel _logReceivingStats:](self, "_logReceivingStats:", *(unsigned __int16 *)&buf[2]);
      if (v28)
      {
        v8 &= 0xFFFFFFFFFFFF0000;
        v28[2]();
      }
      else
      {
        v7 &= 0xFFFFFFFFFFFF0000;
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD))v27 + 2))(v27, v30, *(unsigned __int16 *)&buf[2], 0, v7, 0, 0);
      }
      goto LABEL_21;
    }
    if (!-[IDSDatagramChannel processDatagram:datagramSize:readHandler:readHandlerWithOptions:](self, "processDatagram:datagramSize:readHandler:readHandlerWithOptions:", (_QWORD)v30, *(unsigned __int16 *)&buf[2], v28, v27))break;
LABEL_21:
    v21 = ++v20 < v19;
    if (v19 == v20)
      goto LABEL_29;
  }
  if (!v21)
    goto LABEL_29;
LABEL_7:
  os_unfair_lock_unlock(lock);

}

- (void)readFromSocketDescriptorWithReadHandler:(id)a3 readHandlerWithOptions:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_readLock;
  _IDSDatagramChannel *internal;
  ssize_t v10;
  ssize_t v11;
  unsigned int v12;
  NSObject *v13;
  void (**eventHandler)(id, void *);
  void *v15;
  NSObject *v16;
  void *v17;
  void (**v18)(id, void *);
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void (**v23)(id, void *);
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  uint8_t buf[4];
  IDSDatagramChannel *v31;
  __int16 v32;
  _QWORD v33[3];
  _BYTE __b[2000];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_readLock = &self->_internal->_readLock;
  os_unfair_lock_lock(p_readLock);
  internal = self->_internal;
  if (internal->_socketDescriptor == -1)
  {
    eventHandler = (void (**)(id, void *))internal->_eventHandler;
    if (eventHandler)
    {
      v35 = CFSTR("event-type");
      v36[0] = &unk_1E2CAE540;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v15);

    }
  }
  else
  {
    -[IDSDatagramChannel sendEventConnectedWithDummyLinkInfo](self, "sendEventConnectedWithDummyLinkInfo");
    memset(__b, 170, sizeof(__b));
    v10 = read(self->_internal->_socketDescriptor, __b, 0x7D0uLL);
    v11 = v10;
    if (v10)
    {
      if (v10 == -1)
      {
        v12 = *__error();
        if (v12 <= 0x24 && ((1 << v12) & 0x1800000010) != 0)
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = self;
            v32 = 1024;
            LODWORD(v33[0]) = v12;
            _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "<%@> read nonfatal failure errno %d", buf, 0x12u);
          }

        }
        else
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = (void *)MEMORY[0x19400FE1C](self->_internal->_eventHandler);
            *(_DWORD *)buf = 138412802;
            v31 = self;
            v32 = 1024;
            LODWORD(v33[0]) = v12;
            WORD2(v33[0]) = 2048;
            *(_QWORD *)((char *)v33 + 6) = v22;
            _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "<%@> read failed errno %d calling event handler %p", buf, 0x1Cu);

          }
          v23 = (void (**)(id, void *))self->_internal->_eventHandler;
          if (v23)
          {
            v28[0] = CFSTR("event-type");
            v28[1] = CFSTR("connected-link");
            v29[0] = &unk_1E2CAE348;
            -[IDSDatagramChannel connectedLinks](self, "connectedLinks");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v29[1] = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v23[2](v23, v25);

          }
          -[IDSDatagramChannel close](self, "close");
        }
      }
      else
      {
        -[IDSDatagramChannel _logReceivingStats:](self, "_logReceivingStats:", v10);
        if (v6)
          (*((void (**)(id, _BYTE *, ssize_t, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, __b, v11, 0, 0, 0);
        else
          (*((void (**)(id, _BYTE *, ssize_t, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, __b, v11, 0, 0, 0, 0);
      }
    }
    else
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)MEMORY[0x19400FE1C](self->_internal->_eventHandler);
        *(_DWORD *)buf = 138412546;
        v31 = self;
        v32 = 2048;
        v33[0] = v17;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "<%@> read returned 0 bytes calling event handler %p", buf, 0x16u);

      }
      v18 = (void (**)(id, void *))self->_internal->_eventHandler;
      if (v18)
      {
        -[IDSDatagramChannel connectedLinks](self, "connectedLinks", CFSTR("event-type"), CFSTR("connected-link"), &unk_1E2CAE348);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18[2](v18, v20);

      }
      -[IDSDatagramChannel close](self, "close");
    }
  }
  os_unfair_lock_unlock(p_readLock);

}

- (void)readDatagramWithCompletionHandler:(id)a3
{
  id v4;
  _IDSDatagramChannel *internal;
  OS_nw_connection *connection;
  id v7;

  v4 = a3;
  internal = self->_internal;
  v7 = v4;
  if (internal->_pathEvaluator)
  {
    -[IDSDatagramChannel readFromOSChannel:ring:maximumDatagrams:readHandler:readHandlerWithOptions:](self, "readFromOSChannel:ring:maximumDatagrams:readHandler:readHandlerWithOptions:", internal->_osChannel, internal->_osChannelRXRing, 1, v4, 0);
  }
  else
  {
    connection = internal->_connection;
    if (connection)
      -[IDSDatagramChannel readFromNWConnection:maximumDatagrams:readHandler:readHandlerWithOptions:](self, "readFromNWConnection:maximumDatagrams:readHandler:readHandlerWithOptions:", connection, 1, v4, 0);
    else
      -[IDSDatagramChannel readFromSocketDescriptorWithReadHandler:readHandlerWithOptions:](self, "readFromSocketDescriptorWithReadHandler:readHandlerWithOptions:", v4, 0);
  }

}

- (void)readDatagramsWithCompletionHandler:(id)a3
{
  id v4;
  _IDSDatagramChannel *internal;
  OS_nw_connection *connection;
  id v7;

  v4 = a3;
  internal = self->_internal;
  v7 = v4;
  if (internal->_pathEvaluator)
  {
    -[IDSDatagramChannel readFromOSChannel:ring:maximumDatagrams:readHandler:readHandlerWithOptions:](self, "readFromOSChannel:ring:maximumDatagrams:readHandler:readHandlerWithOptions:", internal->_osChannel, internal->_osChannelRXRing, 256, 0, v4);
  }
  else
  {
    connection = internal->_connection;
    if (connection)
      -[IDSDatagramChannel readFromNWConnection:maximumDatagrams:readHandler:readHandlerWithOptions:](self, "readFromNWConnection:maximumDatagrams:readHandler:readHandlerWithOptions:", connection, 256, 0, v4);
    else
      -[IDSDatagramChannel readFromSocketDescriptorWithReadHandler:readHandlerWithOptions:](self, "readFromSocketDescriptorWithReadHandler:readHandlerWithOptions:", 0, v4);
  }

}

- (void)close
{
  NSObject *v3;
  _IDSDatagramChannel *internal;
  NSObject *connection;
  _IDSDatagramChannel *v6;
  OS_nw_connection *v7;
  int socketDescriptor;
  _IDSDatagramChannel *v9;
  _IDSDatagramChannel *v10;
  int osChannelFD;
  channel *osChannel;
  _IDSDatagramChannel *v13;
  OS_nw_path_evaluator *pathEvaluator;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  channel *v28;
  int v29;
  uint8_t v30[128];
  uint8_t buf[4];
  IDSDatagramChannel *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_internal->_writeLock);
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "-close called for %@", buf, 0xCu);
  }

  self->_internal->_connected = 0;
  internal = self->_internal;
  connection = internal->_connection;
  if (connection)
  {
    nw_connection_cancel(connection);
    v6 = self->_internal;
    v7 = v6->_connection;
    v6->_connection = 0;

    -[IDSDatagramChannel invalidateDirectConnections](self, "invalidateDirectConnections");
    internal = self->_internal;
  }
  socketDescriptor = internal->_socketDescriptor;
  if (socketDescriptor != -1)
  {
    close(socketDescriptor);
    self->_internal->_socketDescriptor = -1;
  }
  -[IDSDatagramChannel _logFinalStats](self, "_logFinalStats");
  v9 = self->_internal;
  if (v9->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    v10 = self->_internal;
    osChannelFD = v10->_osChannelFD;
    osChannel = v10->_osChannel;
    v10->_osChannelFD = -1;
    self->_internal->_osChannel = 0;
    if (self->_internal->_startCalled)
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = sub_1907C5B68;
      v27 = &unk_1E2C64B70;
      v29 = osChannelFD;
      v28 = osChannel;
      IDSTransportThreadAddBlock();
    }
    else if (osChannel)
    {
      os_channel_destroy();
    }
    v13 = self->_internal;
    pathEvaluator = v13->_pathEvaluator;
    v13->_pathEvaluator = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = self->_internal->_sendingMetadata;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19), "pointerValue", (_QWORD)v20);
          _IDSLinkPacketBufferRelease();
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
      }
      while (v17);
    }

    -[NSMutableArray removeAllObjects](self->_internal->_sendingMetadata, "removeAllObjects");
    v9 = self->_internal;
  }
  os_unfair_lock_unlock(&v9->_writeLock);
}

- (void)invalidate
{
  NSObject *v3;
  _IDSDatagramChannel *internal;
  NSData *preConnectionData;
  id eventHandler;
  id readHandler;
  id readHandlerWithOptions;
  id writeHandler;
  _IDSDatagramChannel *v10;
  NSMutableDictionary *linkContexts;
  int v12;
  IDSDatagramChannel *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock(&self->_internal->_readLock);
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = self;
    _os_log_impl(&dword_1906E0000, v3, OS_LOG_TYPE_DEFAULT, "-invalidate called for %@", (uint8_t *)&v12, 0xCu);
  }

  -[IDSDatagramChannel close](self, "close");
  os_unfair_lock_lock(&self->_internal->_writeLock);
  internal = self->_internal;
  preConnectionData = internal->_preConnectionData;
  if (preConnectionData)
  {
    internal->_preConnectionData = 0;

    internal = self->_internal;
  }
  eventHandler = internal->_eventHandler;
  if (eventHandler)
  {
    internal->_eventHandler = 0;

    internal = self->_internal;
  }
  readHandler = internal->_readHandler;
  if (readHandler)
  {
    internal->_readHandler = 0;

    internal = self->_internal;
  }
  readHandlerWithOptions = internal->_readHandlerWithOptions;
  if (readHandlerWithOptions)
  {
    internal->_readHandlerWithOptions = 0;

    internal = self->_internal;
  }
  writeHandler = internal->_writeHandler;
  if (writeHandler)
  {
    internal->_writeHandler = 0;

    internal = self->_internal;
  }
  os_unfair_lock_lock(&internal->_linkContextsLock);
  v10 = self->_internal;
  linkContexts = v10->_linkContexts;
  if (linkContexts)
  {
    v10->_linkContexts = 0;

    v10 = self->_internal;
  }
  os_unfair_lock_unlock(&v10->_linkContextsLock);
  IDSLinkPacketBufferCleanup();
  self->_internal->_isInvalidated = 1;
  os_unfair_lock_unlock(&self->_internal->_writeLock);
  os_unfair_lock_unlock(&self->_internal->_readLock);
}

- (void)setHasMetadata:(BOOL)a3
{
  self->_internal->_hasMetadata = a3;
}

- (void)startInternal
{
  _IDSDatagramChannel *internal;
  NSObject *queue;
  NSObject *v5;
  uint64_t v6;
  _IDSDatagramChannel *v7;
  OS_nw_connection *connection;
  _IDSDatagramChannel *v9;
  NSObject *v10;
  int socketDescriptor;
  _QWORD block[5];
  uint8_t buf[4];
  IDSDatagramChannel *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (!internal->_pathEvaluator)
  {
    if (internal->_connection)
    {
LABEL_5:
      -[IDSDatagramChannel start](self, "start");
      return;
    }
    if (internal->_socketDescriptor == -1)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@> cannot start datagram channel with no socket and no connection", buf, 0xCu);
      }
    }
    else
    {
      v5 = nw_parameters_create();
      nw_parameters_set_data_mode();
      nw_parameters_set_context();
      v6 = nw_connection_create_with_connected_socket_and_parameters();
      v7 = self->_internal;
      connection = v7->_connection;
      v7->_connection = (OS_nw_connection *)v6;

      v9 = self->_internal;
      if (v9->_connection)
      {
        v9->_operationMode = 1;

        goto LABEL_5;
      }
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        socketDescriptor = self->_internal->_socketDescriptor;
        *(_DWORD *)buf = 138412546;
        v14 = self;
        v15 = 1024;
        v16 = socketDescriptor;
        _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "<%@> nw_connection_create_with_connected_socket failed. socketDescriptor %d might be invalid.", buf, 0x12u);
      }

    }
    return;
  }
  queue = internal->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1907C5F40;
  block[3] = &unk_1E2C60550;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  _IDSDatagramChannel *internal;
  NSObject *v4;
  _IDSDatagramChannel *v5;
  NSObject *connection;
  _QWORD handler[5];
  uint8_t buf[4];
  IDSDatagramChannel *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (*(_OWORD *)&internal->_readHandler == 0)
    sub_1907FB160();
  if (!internal->_eventHandler)
    sub_1907FB188();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "-start called for %@", buf, 0xCu);
  }

  self->_internal->_startCalled = 1;
  v5 = self->_internal;
  if (v5->_operationMode != 1)
    sub_1907FB1B0();
  nw_connection_set_queue((nw_connection_t)v5->_connection, (dispatch_queue_t)v5->_queue);
  connection = self->_internal->_connection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1907C6354;
  handler[3] = &unk_1E2C64B98;
  handler[4] = self;
  nw_connection_set_state_changed_handler(connection, handler);
  nw_connection_start((nw_connection_t)self->_internal->_connection);
}

- (void)_writeToOSChannelDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  unsigned int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *p_var4;
  __int128 v24;
  unsigned int v25;
  size_t v26;
  unsigned __int8 *v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  char v59;
  void *__src[2];
  __int128 v64;
  unint64_t v65;
  uint8_t buf[4];
  size_t v67;
  __int16 v68;
  _BYTE v69[24];
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v11 = a8;
  if (self->_internal->_operationMode)
    sub_1907FB1D8();
  v12 = v11;
  v13 = os_channel_available_slot_count();
  v14 = (void *)objc_msgSend(self->_internal->_writeHandler, "copy");
  if (v13 < a7)
  {
    v15 = os_channel_sync();
    if (v15)
    {
      v16 = v15;
      -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v16;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
      }

    }
    v18 = os_channel_available_slot_count();
    if (!v18)
    {
      -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "have data to send to daemon but no slots in tx ring", buf, 2u);
      }

    }
    if (v18 < a7)
    {
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v67 = a7;
        v68 = 2048;
        *(_QWORD *)v69 = v18;
        _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "have %lu datagrams to send to daemon but only %lu slots", buf, 0x16u);
      }

      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("have %lu datagrams to send to daemon but only %lu slots"), a7, v18);
      v53 = objc_alloc(MEMORY[0x1E0C99D80]);
      v50 = (void *)objc_msgSend(v53, "initWithObjectsAndKeys:", v48, *MEMORY[0x1E0CB2D50], 0);
      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v55 = (void *)objc_msgSend(v54, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 5, v50);
      sub_1907502EC(v12, v14, v55, 0);

      goto LABEL_47;
    }
  }
  v56 = v14;
  v57 = v12;
  if (a7 < 1)
  {
    v22 = 0;
LABEL_38:
    v44 = os_channel_sync();
    v14 = v56;
    v12 = v57;
    if (v44)
    {
      v45 = v44;
      -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v45;
        _os_log_impl(&dword_1906E0000, v46, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
      }

    }
    sub_1907502EC(v57, v56, 0, v22);
    goto LABEL_48;
  }
  v21 = 0;
  v22 = 0;
  v58 = a7;
  p_var4 = &a5->var4;
  v59 = a7;
  while (1)
  {
    v65 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__src = v24;
    v64 = v24;
    IDSByteBufferInitForWrite();
    a5 = ($C835DF2C905B2D2BE81B7C33CDF61FEE *)((unint64_t)a5 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)p_var4);
    -[IDSDatagramChannel generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:](self, "generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:", *((_QWORD *)p_var4 - 1), a5, a6[v21], v21, a7, __src);
    v25 = v64 - LODWORD(__src[0]);
    os_channel_get_next_slot();
    v26 = a4[v21];
    if (v26 + (unsigned __int16)v25 + 2 > 0xAAAA)
      break;
    v27 = (unsigned __int8 *)a3[v21];
    if (self->_internal->_hasMetadata)
    {
      MEMORY[0xAAAAAAAAAAAAAAAA] = bswap32(v25) >> 16;
      if ((_WORD)v25)
        memcpy((void *)0xAAAAAAAAAAAAAAACLL, __src[0], (unsigned __int16)v25);
      if (!(_DWORD)v26)
        goto LABEL_24;
      v28 = (void *)((unsigned __int16)v25 - 0x5555555555555554);
    }
    else
    {
      v28 = (void *)0xAAAAAAAAAAAAAAAALL;
    }
    memcpy(v28, v27, v26);
LABEL_24:
    os_channel_set_slot_properties();
    v29 = os_channel_advance_slot();
    if (v29)
    {
      v30 = v29;
      -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = v30;
        _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "advance_slot failed for write %d", buf, 8u);
      }

    }
    -[IDSDatagramChannel _logSendingStats:](self, "_logSendingStats:", v26);
    if (self->_internal->_verboseFunctionalLogging)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v67 = (size_t)self;
        v68 = 1024;
        *(_DWORD *)v69 = v21;
        *(_WORD *)&v69[4] = 2048;
        *(_QWORD *)&v69[6] = v26;
        *(_WORD *)&v69[14] = 2048;
        *(_QWORD *)&v69[16] = (unsigned __int16)v25;
        _os_log_impl(&dword_1906E0000, v32, OS_LOG_TYPE_DEFAULT, "<%@> write details: datagramSize[%d] %ld metadataSize %ld", buf, 0x26u);
      }

      if (v26 >= 0xA)
      {
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *v27;
          v35 = v27[1];
          v36 = v27[2];
          v37 = v27[3];
          v38 = v27[4];
          v39 = v27[5];
          v40 = v27[6];
          v41 = v27[7];
          v42 = v27[8];
          v43 = v27[9];
          *(_DWORD *)buf = 138414850;
          v67 = (size_t)self;
          v68 = 1024;
          *(_DWORD *)v69 = v34;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v35;
          *(_WORD *)&v69[10] = 1024;
          *(_DWORD *)&v69[12] = v36;
          *(_WORD *)&v69[16] = 1024;
          *(_DWORD *)&v69[18] = v37;
          *(_WORD *)&v69[22] = 1024;
          v70 = v38;
          v71 = 1024;
          v72 = v39;
          v73 = 1024;
          v74 = v40;
          v75 = 1024;
          v76 = v41;
          v77 = 1024;
          v78 = v42;
          v79 = 1024;
          v80 = v43;
          _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "<%@> write details: datagramContents %02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", buf, 0x48u);
        }

      }
    }
    p_var4 += 10;
    v22 += v26;
    IDSByteBufferRelease();
    ++v21;
    LOBYTE(a7) = v59;
    if (v58 == v21)
      goto LABEL_38;
  }
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v67 = v26;
    v68 = 2048;
    *(_QWORD *)v69 = (unsigned __int16)v25;
    *(_WORD *)&v69[8] = 2048;
    *(_QWORD *)&v69[10] = 43690;
    _os_log_impl(&dword_1906E0000, v47, OS_LOG_TYPE_DEFAULT, "have data %lu metadata %lu to send to daemon but not enough bytes %lu in slot", buf, 0x20u);
  }

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("have data %lu to send to daemon but not enough bytes %lu in slot"), v26 + (unsigned __int16)v25 + 2, 43690);
  v49 = objc_alloc(MEMORY[0x1E0C99D80]);
  v50 = (void *)objc_msgSend(v49, "initWithObjectsAndKeys:", v48, *MEMORY[0x1E0CB2D50], 0);
  v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v52 = (void *)objc_msgSend(v51, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 5, v50);
  v14 = v56;
  v12 = v57;
  sub_1907502EC(v57, v56, v52, v22);

LABEL_47:
LABEL_48:

}

- ($988D82359F2BAE314798199717957CF0)_makePacketBufferFromDatagram:(const void *)a3 datagramSize:(unsigned int)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 datagramInfo:(id)a7 datagramOptions:(id *)a8
{
  unsigned __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $988D82359F2BAE314798199717957CF0 *v15;
  char *var0;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v8 = *(_WORD *)&a7.var4;
  v9 = *(_QWORD *)&a7.var0;
  v10 = a6;
  v11 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v15 = ($988D82359F2BAE314798199717957CF0 *)_IDSLinkPacketBufferCreate();
  var0 = v15->var0;
  IDSLinkPacketBufferAddBufferStart();
  IDSByteBufferInitForWriteWithAllocatedSpace();
  -[IDSDatagramChannel generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:](self, "generateMetadataWithDatagramInfo:options:currentDatagramCount:totalDatagramCount:byteBuffer:", v9, v8, a8, v11, v10, var0);
  v17 = *((_QWORD *)var0 + 2) - *(_QWORD *)var0;
  v15->var2 = (unsigned __int16)(*((_WORD *)var0 + 8) - *(_WORD *)var0);
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v15);
  v18 = (unsigned __int16)(v17 + 2);
  if (v15->var1 - v18 >= a4)
  {
    memcpy(&v15->var0[v18], a3, a4);
    v15->var2 += a4;
  }
  else
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v15->var1 - v18;
      v22 = 134218496;
      v23 = v20;
      v24 = 1024;
      v25 = a4;
      v26 = 1024;
      v27 = (unsigned __int16)v17;
      _os_log_impl(&dword_1906E0000, v19, OS_LOG_TYPE_DEFAULT, "Not enough packet buffer space. Space left %lu datagram size %u metadata size %u", (uint8_t *)&v22, 0x18u);
    }

    return 0;
  }
  return v15;
}

- (void)_writeToNWConnection:(id)a3 datagram:(const void *)a4 datagramSize:(unsigned int)a5 currentDatagramCount:(unsigned __int8)a6 totalDatagramCount:(unsigned __int8)a7 datagramInfo:(id)a8 datagramOptions:(id *)a9 completionHandler:(id)a10
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  double v16;
  NSObject *v17;
  $988D82359F2BAE314798199717957CF0 *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  _QWORD completion[5];
  id v36;
  id v37;
  double v38;
  double v39;
  int v40;
  $C835DF2C905B2D2BE81B7C33CDF61FEE v41;

  v10 = a7;
  v11 = a6;
  v12 = *(_QWORD *)&a5;
  v33 = a3;
  v34 = a10;
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  v15 = mach_continuous_time();
  v16 = *(double *)&qword_1EE1E3940;
  v17 = v33;
  if (-[IDSDatagramChannel isDaemonConnection:](self, "isDaemonConnection:", v33))
  {
    v32 = (void *)objc_msgSend(v34, "copy");
    v31 = (void *)objc_msgSend(self->_internal->_writeHandler, "copy");
    if (self->_internal->_hasMetadata)
    {
      v18 = -[IDSDatagramChannel _makePacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:](self, "_makePacketBufferFromDatagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:", a4, v12, v11, v10, *(_QWORD *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9);
      if (!v18)
      {
        v27 = objc_alloc(MEMORY[0x1E0C99D80]);
        v28 = (void *)objc_msgSend(v27, "initWithObjectsAndKeys:", CFSTR("Not enough packet buffer space"), *MEMORY[0x1E0CB2D50], 0);
        v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v30 = (void *)objc_msgSend(v29, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 6, v28);
        v23 = v31;
        v22 = v32;
        sub_1907502EC(v32, v31, v30, v12);

        v17 = v33;
LABEL_13:

        v20 = v34;
        goto LABEL_14;
      }
      v19 = sub_19075017C(v18, 0);
    }
    else
    {
      v19 = (uint64_t)dispatch_data_create(a4, v12, 0, 0);
    }
    v21 = v19;
    v23 = v31;
    v22 = v32;
    v17 = v33;
    v24 = v16 * (double)v15;
    if (qword_1EE1E3938 != -1)
      dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
    v25 = *(double *)&qword_1EE1E3940 * (double)mach_continuous_time();
    v26 = *MEMORY[0x1E0CCECE8];
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = sub_1907C72B4;
    completion[3] = &unk_1E2C64BC0;
    completion[4] = self;
    v41 = a8;
    v36 = v32;
    v38 = v25;
    v39 = v24;
    v40 = v12;
    v37 = v31;
    nw_connection_send(v33, v21, v26, 1, completion);

    goto LABEL_13;
  }
  v20 = v34;
  -[IDSDatagramChannel _writeToDirectConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToDirectConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v33, a4, v12, v11, v10, *(_QWORD *)&a8.var0, *(unsigned __int16 *)&a8.var4, a9, v34);
LABEL_14:

}

- (void)_writeToNWConnectionArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  id v14;
  _IDSDatagramChannel *internal;
  void *v16;
  uint64_t v17;
  void *v18;
  $C835DF2C905B2D2BE81B7C33CDF61FEE *v19;
  uint64_t v20;
  int var0;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  const void **v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v27;
  void *v28;
  void *v29;
  unsigned int *v30;
  _QWORD batch_block[5];
  id v32;
  id v33;
  const void **v34;
  unsigned int *v35;
  $C835DF2C905B2D2BE81B7C33CDF61FEE *v36;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v37;
  int v38;
  uint8_t buf[4];
  IDSDatagramChannel *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  internal = self->_internal;
  if (internal->_operationMode != 1)
    sub_1907FB200();
  v16 = v14;
  v17 = (a7 - 1);
  if (a7 == 1)
  {
    -[IDSDatagramChannel connectionForLinkID:](self, "connectionForLinkID:", a5->var0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSDatagramChannel _writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v18, *a3, *a4, 0, 1, *(_QWORD *)&a5->var0, *(unsigned __int16 *)&a5->var4, *a6, v16);

  }
  else if (a7 < 2)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = self;
      v41 = 1024;
      v42 = a7;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "<%@> _writeToNWConnectionArrayOfDatagrams given %d datagrams, which is < 1", buf, 0x12u);
    }

  }
  else if (internal->_preferredDataPathType == 1)
  {
    v19 = a5 + 1;
    v20 = a7 - 1;
    while (1)
    {
      var0 = v19->var0;
      ++v19;
      if (var0 != a5->var0)
        break;
      if (!--v20)
        goto LABEL_9;
    }
    v25 = 0;
    v30 = a4;
    v26 = a3;
    v27 = a6;
    do
    {
      -[IDSDatagramChannel connectionForLinkID:](self, "connectionForLinkID:", a5->var0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == v25)
        v29 = v16;
      else
        v29 = 0;
      a6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)((unint64_t)a6 & 0xFFFFFFFFFFFF0000 | *(unsigned __int16 *)&a5->var4);
      -[IDSDatagramChannel _writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:](self, "_writeToNWConnection:datagram:datagramSize:currentDatagramCount:totalDatagramCount:datagramInfo:datagramOptions:completionHandler:", v28, v26[v25], v30[v25], v25, a7, *(_QWORD *)&a5->var0, a6, v27[v25], v29);

      ++v25;
      ++a5;
    }
    while (v17 + 1 != v25);
  }
  else
  {
LABEL_9:
    -[IDSDatagramChannel connectionForLinkID:](self, "connectionForLinkID:", a5->var0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    batch_block[0] = MEMORY[0x1E0C809B0];
    batch_block[1] = 3221225472;
    batch_block[2] = sub_1907C7818;
    batch_block[3] = &unk_1E2C64BE8;
    v38 = a7;
    batch_block[4] = self;
    v32 = v22;
    v34 = a3;
    v35 = a4;
    v36 = a5;
    v37 = a6;
    v33 = v16;
    v23 = v22;
    nw_connection_batch(v23, batch_block);

  }
}

- (void)_writeToSocket:(int)a3 datagrams:(const void *)a4 datagramSizes:(unsigned int *)a5 datagramInfo:(id *)a6 datagramOptions:(id *)a7 datagramCount:(int)a8 completionHandler:(id)a9
{
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  ssize_t v20;
  ssize_t v21;
  uint64_t v22;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  int socketDescriptor;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint8_t buf[4];
  IDSDatagramChannel *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v13 = a9;
  v14 = objc_msgSend(self->_internal->_writeHandler, "copy");
  v15 = (void *)v14;
  if (a8 < 1)
  {
    v16 = 0;
    v25 = 0;
    goto LABEL_32;
  }
  v39 = (void *)v14;
  v40 = v13;
  v16 = 0;
  v17 = a8;
  while (1)
  {
    v19 = *a5++;
    v18 = v19;
    v20 = write(self->_internal->_socketDescriptor, *a4, v19);
    v16 += v20;
    if (v20 == v19)
    {
      -[IDSDatagramChannel _logSendingStats:](self, "_logSendingStats:", v18);
      goto LABEL_14;
    }
    v21 = v20;
    if (v20 >= 1)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v42 = self;
        v43 = 1024;
        v44 = v21;
        v45 = 1024;
        v46 = v18;
        _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "<%@> write failed to send all bytes %d < %d", buf, 0x18u);
      }
      v15 = v39;
      v13 = v40;

      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to send all bytes (%d < %d)"), v21, v18);
      goto LABEL_30;
    }
    if (!v20)
      break;
    v22 = *__error();
    if (v22 > 0x37 || ((1 << v22) & 0x80000800000010) == 0)
    {
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v42 = self;
        v43 = 1024;
        v44 = v22;
        _os_log_impl(&dword_1906E0000, v33, OS_LOG_TYPE_DEFAULT, "<%@> write failed errno %d", buf, 0x12u);
      }

      socketDescriptor = self->_internal->_socketDescriptor;
      v15 = v39;
      v13 = v40;
      if (socketDescriptor != -1)
      {
        close(socketDescriptor);
        self->_internal->_socketDescriptor = -1;
      }
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to send (errno %d)"), v22, v38);
LABEL_30:
      v31 = (void *)v27;
      v35 = objc_alloc(MEMORY[0x1E0C99D80]);
      v36 = (void *)objc_msgSend(v35, "initWithObjectsAndKeys:", v31, *MEMORY[0x1E0CB2D50], 0);
      v37 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v25 = (void *)objc_msgSend(v37, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 6, v36);

      goto LABEL_31;
    }
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = self;
      v43 = 1024;
      v44 = v22;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "<%@> write nonfatal failure errno %d", buf, 0x12u);
    }

LABEL_14:
    ++a4;
    if (!--v17)
    {
      v25 = 0;
      v15 = v39;
      v13 = v40;
      goto LABEL_32;
    }
  }
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl(&dword_1906E0000, v28, OS_LOG_TYPE_DEFAULT, "<%@> write returned 0 - connection terminated", buf, 0xCu);
  }

  v29 = self->_internal->_socketDescriptor;
  v15 = v39;
  v13 = v40;
  if (v29 != -1)
  {
    close(v29);
    self->_internal->_socketDescriptor = -1;
  }
  v30 = objc_alloc(MEMORY[0x1E0C99D80]);
  v31 = (void *)objc_msgSend(v30, "initWithObjectsAndKeys:", CFSTR("Connection terminated"), *MEMORY[0x1E0CB2D50], 0);
  v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v25 = (void *)objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 6, v31);
LABEL_31:

LABEL_32:
  sub_1907502EC(v13, v15, v25, v16);

}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  -[IDSDatagramChannel writeArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:](self, "writeArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:", a3, a4, a5, a7, *(_QWORD *)&a6, a8);
}

- (void)writeArrayOfDatagrams:(const void *)a3 datagramSizes:(unsigned int *)a4 datagramInfo:(id *)a5 datagramOptions:(id *)a6 datagramCount:(int)a7 completionHandler:(id)a8
{
  uint64_t v10;
  const void **v11;
  unsigned int *v12;
  unint64_t v13;
  unint64_t v14;
  NSObject *v15;
  unsigned int v16;
  _IDSDatagramChannel *internal;
  NSObject *v18;
  void *v19;
  _IDSDatagramChannel *v20;
  NSObject *v21;
  id v22;
  const __CFString *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  _IDSDatagramChannel *v36;
  uint64_t socketDescriptor;
  unsigned int v42;
  id v43;
  uint8_t buf[4];
  int v45;
  __int16 v46;
  unint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v43 = a8;
  os_unfair_lock_lock(&self->_internal->_writeLock);
  v42 = a7;
  if (a7 >= 1)
  {
    v10 = a7;
    v11 = a3;
    v12 = a4;
    do
    {
      -[IDSDatagramChannel _logPendingSendingStats:](self, "_logPendingSendingStats:", *v12);
      v13 = -[IDSDatagramChannel _logChecksum:length:](self, "_logChecksum:length:", *v11, *v12);
      if (v13)
      {
        v14 = v13;
        +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = *v12;
          *(_DWORD *)buf = 67109376;
          v45 = v16;
          v46 = 2048;
          v47 = v14;
          _os_log_impl(&dword_1906E0000, v15, OS_LOG_TYPE_DEFAULT, "Send datagram checksum %uB/%lu", buf, 0x12u);
        }

      }
      ++v11;
      ++v12;
      --v10;
    }
    while (v10);
  }
  internal = self->_internal;
  if (internal->_isInvalidated)
  {
    os_unfair_lock_unlock(&internal->_writeLock);
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "writeDatagrams: connection already closed", buf, 2u);
    }
    v19 = v43;
  }
  else
  {
    v18 = objc_msgSend(internal->_writeHandler, "copy");
    v20 = self->_internal;
    if (v20->_connected)
    {
      -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
      v19 = v43;
      if ((int)v42 <= 0)
      {
        +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1906E0000, v30, OS_LOG_TYPE_DEFAULT, "have no datagram to send to daemon", buf, 2u);
        }

        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = CFSTR("no datagram to send");
      }
      else
      {
        if (v42 < 9)
        {
          v36 = self->_internal;
          if (v36->_operationMode)
          {
            -[IDSDatagramChannel _writeToNWConnectionArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:](self, "_writeToNWConnectionArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:", a3, a4, a5, a6, v42, v43);
          }
          else
          {
            socketDescriptor = v36->_socketDescriptor;
            if ((_DWORD)socketDescriptor == -1)
              -[IDSDatagramChannel _writeToOSChannelDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:](self, "_writeToOSChannelDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:", a3, a4, a5, a6, v42, v43);
            else
              -[IDSDatagramChannel _writeToSocket:datagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:](self, "_writeToSocket:datagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:", socketDescriptor, a3, a4, a5, a6, v43);
          }
          os_unfair_lock_unlock(&self->_internal->_writeLock);
          goto LABEL_31;
        }
        +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v45 = 8;
          _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "we can't send more than %d datagrams using the compound channel", buf, 8u);
        }

        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        v23 = CFSTR("exceeded the maximum datagram count");
      }
      v31 = (void *)objc_msgSend(v22, "initWithFormat:", v23);
      v32 = objc_alloc(MEMORY[0x1E0C99D80]);
      v33 = (void *)objc_msgSend(v32, "initWithObjectsAndKeys:", v31, *MEMORY[0x1E0CB2D50], 0);
      v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v35 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 1, v33);
      sub_1907502EC(v43, v18, v35, 0);
      os_unfair_lock_unlock(&self->_internal->_writeLock);

      goto LABEL_31;
    }
    os_unfair_lock_unlock(&v20->_writeLock);
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v24 = objc_claimAutoreleasedReturnValue();
    v19 = v43;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906E0000, v24, OS_LOG_TYPE_DEFAULT, "writeDatagrams: not connected", buf, 2u);
    }

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("not connected"));
    v26 = objc_alloc(MEMORY[0x1E0C99D80]);
    v27 = (void *)objc_msgSend(v26, "initWithObjectsAndKeys:", v25, *MEMORY[0x1E0CB2D50], 0);
    v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v29 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 6, v27);
    sub_1907502EC(v43, v18, v29, 0);

  }
LABEL_31:

}

- (void)_writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  $1AF4AE5744D0566D2BCFD0852A296D31 *v7;
  unsigned int v8;
  const void *v9;
  $C835DF2C905B2D2BE81B7C33CDF61FEE v10;

  v10 = a5;
  v9 = a3;
  v8 = a4;
  v7 = a6;
  -[IDSDatagramChannel writeArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:](self, "writeArrayOfDatagrams:datagramSizes:datagramInfo:datagramOptions:datagramCount:completionHandler:", &v9, &v8, &v10, &v7, 1, a7);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
  MEMORY[0x1E0DE7D20](self, sel__writeDatagram_datagramSize_datagramInfo_options_completionHandler_);
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  MEMORY[0x1E0DE7D20](self, sel__writeDatagram_datagramSize_datagramInfo_options_completionHandler_);
}

- (void)setEventHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _IDSDatagramChannel *internal;
  id eventHandler;
  int v9;
  IDSDatagramChannel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "-setEventHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "copy");
  internal = self->_internal;
  eventHandler = internal->_eventHandler;
  internal->_eventHandler = (id)v6;

}

- (void)setReadHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _IDSDatagramChannel *internal;
  id readHandler;
  int v9;
  IDSDatagramChannel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "-setReadHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "copy");
  internal = self->_internal;
  readHandler = internal->_readHandler;
  internal->_readHandler = (id)v6;

}

- (void)setReadHandlerWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _IDSDatagramChannel *internal;
  id readHandlerWithOptions;
  int v9;
  IDSDatagramChannel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "-setReadHandlerWithOptions called for %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "copy");
  internal = self->_internal;
  readHandlerWithOptions = internal->_readHandlerWithOptions;
  internal->_readHandlerWithOptions = (id)v6;

}

- (void)setWriteCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  _IDSDatagramChannel *internal;
  id writeHandler;
  int v9;
  IDSDatagramChannel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "-setWriteCompletionHandler called for %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "copy");
  internal = self->_internal;
  writeHandler = internal->_writeHandler;
  internal->_writeHandler = (id)v6;

}

- (void)readyToRead
{
  _IDSDatagramChannel *internal;
  id readHandler;

  internal = self->_internal;
  if (internal->_operationMode)
    sub_1907FB278();
  readHandler = internal->_readHandler;
  if (!internal->_readHandlerWithOptions)
  {
    if (!readHandler)
      sub_1907FB228();
    if (internal->_eventHandler)
      goto LABEL_8;
LABEL_10:
    sub_1907FB250();
  }
  if (!internal->_eventHandler)
    goto LABEL_10;
  if (!readHandler)
  {
    MEMORY[0x1E0DE7D20](self, sel_readDatagramsWithCompletionHandler_);
    return;
  }
LABEL_8:
  MEMORY[0x1E0DE7D20](self, sel_readDatagramWithCompletionHandler_);
}

- (void)scheduleRead
{
  _IDSDatagramChannel *internal;
  NSObject *v4;
  int v5;
  IDSDatagramChannel *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal->_readHandler)
  {
    MEMORY[0x1E0DE7D20](self, sel_readDatagramWithCompletionHandler_);
  }
  else if (internal->_readHandlerWithOptions)
  {
    MEMORY[0x1E0DE7D20](self, sel_readDatagramsWithCompletionHandler_);
  }
  else
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1906E0000, v4, OS_LOG_TYPE_DEFAULT, "<%@> does not have readHandler!", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)sendMetadata
{
  _IDSDatagramChannel *internal;
  uint64_t v4;
  unint64_t v5;
  _IDSDatagramChannel *v6;
  unsigned int v7;
  __int128 v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  NSObject *v16;
  _IDSDatagramChannel *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *connection;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  int64_t v26;
  NSObject *v27;
  IDSDatagramChannel *v28;
  int v29;
  int v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  __int128 v37;
  _QWORD completion[5];
  uint8_t v39[4];
  IDSDatagramChannel *v40;
  __int16 v41;
  uint64_t v42;
  _BYTE buf[32];
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal->_hasMetadata)
  {
    v4 = -[NSMutableArray count](internal->_sendingMetadata, "count");
    if (v4)
    {
      v5 = v4;
      v6 = self->_internal;
      if (v6->_pathEvaluator)
      {
        v7 = os_channel_available_slot_count();
        if (v7)
        {
          if (v5 <= v7)
          {
            v9 = v5;
          }
          else
          {
            v9 = v7;
            +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218496;
              *(_QWORD *)&buf[4] = v5;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v9;
              *(_WORD *)&buf[22] = 2048;
              *(_QWORD *)&buf[24] = v9;
              _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but only %lu slots - sending just %lu", buf, 0x20u);
            }

          }
          v22 = 0;
          *(_QWORD *)&v8 = 138412546;
          v37 = v8;
          while (1)
          {
            -[NSMutableArray objectAtIndex:](self->_internal->_sendingMetadata, "objectAtIndex:", v22, v37);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "pointerValue");

            *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v44 = v25;
            v45 = v25;
            *(_OWORD *)buf = v25;
            *(_OWORD *)&buf[16] = v25;
            os_channel_get_next_slot();
            v26 = *(_QWORD *)(v24 + 16);
            if (v26 <= *(unsigned __int16 *)&buf[2])
            {
              *(_WORD *)buf = 0;
              *(_WORD *)&buf[2] = v26;
              memcpy(*(void **)&buf[16], *(const void **)v24, v26);
              os_channel_set_slot_properties();
              v29 = os_channel_advance_slot();
              if (v29)
              {
                v30 = v29;
                -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v39 = 67109120;
                  LODWORD(v40) = v30;
                  _os_log_impl(&dword_1906E0000, v31, OS_LOG_TYPE_DEFAULT, "advance_slot failed for metadata write %d", v39, 8u);
                }

              }
              if (!self->_internal->_verboseFunctionalLogging)
                goto LABEL_35;
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v32 = *(_QWORD *)(v24 + 16);
                *(_DWORD *)v39 = v37;
                v40 = self;
                v41 = 2048;
                v42 = v32;
                _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "<%@> write details: metadataSize %ld", v39, 0x16u);
              }
            }
            else
            {
              +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = *(IDSDatagramChannel **)(v24 + 16);
                *(_DWORD *)v39 = 134218240;
                v40 = v28;
                v41 = 2048;
                v42 = *(unsigned __int16 *)&buf[2];
                _os_log_impl(&dword_1906E0000, v27, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but not enough bytes %lu in slot", v39, 0x16u);
              }
            }

LABEL_35:
            _IDSLinkPacketBufferRelease();
            if (v9 == ++v22)
            {
              v33 = os_channel_sync();
              if (v33)
              {
                v34 = v33;
                -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
                +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v34;
                  _os_log_impl(&dword_1906E0000, v35, OS_LOG_TYPE_DEFAULT, "os_channel_sync for TX failed %d", buf, 8u);
                }

              }
              goto LABEL_43;
            }
          }
        }
        -[IDSDatagramChannel osChannelInfoLog](self, "osChannelInfoLog");
        +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v5;
          _os_log_impl(&dword_1906E0000, v21, OS_LOG_TYPE_DEFAULT, "have metadata %lu to send to daemon but no slots", buf, 0xCu);
        }

      }
      else
      {
        if (!v6->_connection)
        {
          LODWORD(v9) = 0;
          goto LABEL_43;
        }
        if (v6->_connected)
        {
          v11 = 0;
          v12 = *MEMORY[0x1E0CCECE8];
          v13 = MEMORY[0x1E0C809B0];
          do
          {
            -[NSMutableArray objectAtIndex:](self->_internal->_sendingMetadata, "objectAtIndex:", v11);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (_QWORD *)objc_msgSend(v14, "pointerValue");

            v16 = sub_19075017C(v15, 0);
            v17 = self->_internal;
            if (v17->_verboseFunctionalLogging)
            {
              +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v15[2];
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v19;
                _os_log_impl(&dword_1906E0000, v18, OS_LOG_TYPE_DEFAULT, "<%@> write details: metadataSize %ld", buf, 0x16u);
              }

              v17 = self->_internal;
            }
            connection = v17->_connection;
            completion[0] = v13;
            completion[1] = 3221225472;
            completion[2] = sub_1907C8C94;
            completion[3] = &unk_1E2C64C10;
            completion[4] = self;
            nw_connection_send(connection, v16, v12, 1, completion);

            ++v11;
          }
          while (v5 != v11);
          LODWORD(v9) = v5;
LABEL_43:
          -[NSMutableArray removeObjectsInRange:](self->_internal->_sendingMetadata, "removeObjectsInRange:", 0, v9);
        }
        else
        {
          +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = self;
            _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "<%@> sendMetadata: not connected yet - tearing down or waiting for -start", buf, 0xCu);
          }

        }
      }
    }
  }
}

- (void)_buildPacketBufferMetaData:(id *)a3
{
  int64_t var2;

  var2 = a3->var2;
  IDSLinkPacketBufferAddBufferStart();
  *a3->var0 = BYTE1(var2);
  a3->var0[1] = var2;
}

- (void)setChannelPreferences:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _IDSDatagramChannel *internal;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  _IDSDatagramChannel *v11;
  NSData *preConnectionData;
  uint64_t v13;
  _IDSDatagramChannel *v14;
  NSData *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  int v49;
  NSObject *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unsigned int v67;
  NSObject *v68;
  uint64_t v69;
  __int128 v70;
  void *v71;
  int v72;
  pid_t v73;
  NSObject *v74;
  NSObject *v75;
  unint64_t v76;
  char v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  size_t v82;
  unint64_t v83;
  _BYTE *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  int v90;
  void *v91;
  char v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  char v98;
  uint64_t v99;
  void *v100;
  NSObject *v101;
  unsigned __int8 v102;
  NSObject *v103;
  NSObject *v104;
  char v105;
  int v106;
  NSObject *v107;
  const __CFString *v108;
  int v109;
  NSObject *v110;
  NSObject *v111;
  void *v112;
  NSObject *v113;
  void *v114;
  NSObject *v115;
  id v116;
  _QWORD *v117;
  NSMutableArray *sendingMetadata;
  void *v119;
  _BYTE *v120;
  _QWORD *v121;
  int v122;
  void *v123;
  IDSDatagramChannel *v124;
  id v125;
  int v126;
  _QWORD *v127;
  int v128;
  uint64_t v129;
  int v130;
  int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  char v138;
  char v139;
  char v140;
  uint8_t v141[4];
  IDSDatagramChannel *v142;
  __int16 v143;
  _BYTE v144[10];
  int v145;
  uint64_t v146;
  __int16 v147;
  _BYTE buf[32];
  unint64_t v149;
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v140 = 0;
  v139 = -1;
  v138 = 0;
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@> setChannelPreferences dictionary: %@", buf, 0x16u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("preference-pre-connection-data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    internal = self->_internal;
    if (!internal->_receivedPreConnectionData)
      internal->_waitForPreConnectionDataForConnected = 1;
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-pre-connection-data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_internal->_waitForPreConnectionDataForConnected)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v10;
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferencePreConnectionDataKey - %@, _waitForPreConnectionDataForConnected? %@", buf, 0x20u);
    }

    v11 = self->_internal;
    if (!v11->_connected)
    {
      preConnectionData = v11->_preConnectionData;
      if (preConnectionData)
      {
        v11->_preConnectionData = 0;

      }
      v13 = objc_msgSend(v8, "copy");
      v14 = self->_internal;
      v15 = v14->_preConnectionData;
      v14->_preConnectionData = (NSData *)v13;

      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_1906E0000, v16, OS_LOG_TYPE_DEFAULT, "<%@> client channel connection is not ready. Wait to send preConnectionData", buf, 0xCu);
      }

      v17 = 0;
      v18 = 0;
      v19 = 0;
      goto LABEL_134;
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-needs-encryption-info"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-needs-force-update-encryption-info"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22 != 0;

  }
  if (v6)
    v23 = 1;
  else
    v23 = v21;
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-default-link-selection"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-default-link-selection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v25, "intValue");

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v140;
      _os_log_impl(&dword_1906E0000, v26, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceDefaultLinkSelectionKey - linkID:%d", buf, 0x12u);
    }

    v23 = 1;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-baseband-registration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (_QWORD *)MEMORY[0x1E0D34538];
  if (v27)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-baseband-registration"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    objc_msgSend(v29, "objectForKey:", *v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "intValue");

    objc_msgSend(v29, "objectForKey:", CFSTR("baseband-registration-key"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v136) = objc_msgSend(v33, "unsignedIntValue");

    objc_msgSend(v29, "objectForKey:", CFSTR("baseband-notification-operation-key"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntValue");

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = (char)v32;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v136;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v35;
      _os_log_impl(&dword_1906E0000, v36, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceBasebandRegistrationKey - linkID:%d, reg_key:%u registerOperation:%u", buf, 0x1Eu);
    }

    v23 = 1;
  }
  else
  {
    v30 = (_QWORD *)MEMORY[0x1E0D34538];
    LODWORD(v136) = 0;
    v32 = 0;
    v35 = 0;
  }
  LODWORD(v133) = v35;
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-baseband-queue-flush"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-baseband-queue-flush"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKey:", *v30);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v134) = objc_msgSend(v39, "intValue");

    objc_msgSend(v38, "objectForKey:", CFSTR("preference-baseband-queue-flush-payload"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v40;
      _os_log_impl(&dword_1906E0000, v41, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceBasebandQueueFlushKey - %@", buf, 0x16u);
    }

    v23 = 1;
  }
  else
  {
    v40 = 0;
    LODWORD(v134) = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-discard-link-ids"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-discard-link-ids"));
    v132 = objc_claimAutoreleasedReturnValue();
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v132;
      _os_log_impl(&dword_1906E0000, v43, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceDiscardLinkIDsKey - %@", buf, 0x16u);
    }

    v23 = 1;
  }
  else
  {
    v132 = 0;
  }
  LODWORD(v135) = v32;
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-update-qos"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = v40;
  if (v44)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-update-qos"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", *v30);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v46, "intValue");

    objc_msgSend(v45, "objectForKey:", CFSTR("preference-update-qos-is-good"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "unsignedIntValue");
    v49 = v48;

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      if (!v48)
        v51 = CFSTR("NO");
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = (char)v131;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v51;
      _os_log_impl(&dword_1906E0000, v50, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceUpdateQualityOfServiceKey - LinkID: %d, %@", buf, 0x1Cu);
    }

    v23 = 1;
  }
  else
  {
    v49 = 0;
    v131 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-query-information"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-query-information"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "unsignedIntValue");
    v55 = v54;
    v139 = v54;

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v55;
      _os_log_impl(&dword_1906E0000, v56, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceQueryInformationKey - queryType: %d", buf, 0x12u);
    }

    v23 = 1;
  }
  else
  {
    v55 = 255;
  }
  v128 = v55;
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-max-bitrate"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-max-bitrate"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectForKey:", *v30);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "intValue");

    objc_msgSend(v58, "objectForKey:", CFSTR("max-bitrate-key"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v61, "unsignedIntValue");

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v130;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = (char)v60;
      _os_log_impl(&dword_1906E0000, v62, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceSetMaxBitrateKey - maxBitrate: %u for LinkID: %d", buf, 0x18u);
    }

    v23 = 1;
  }
  else
  {
    v60 = 0;
    v130 = 100000;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("debug-data-type-key"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("debug-data-type-key"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v64, "intValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("debug-data-key"));
    v129 = objc_claimAutoreleasedReturnValue();
    v23 = 1;
  }
  else
  {
    v129 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-remote-device-version-key"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v126 = v49;
    objc_msgSend(v4, "objectForKey:", CFSTR("preference-remote-device-version-key"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "intValue");

    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v67;
      _os_log_impl(&dword_1906E0000, v68, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceRemoteDeviceVersionKey - remoteDeviceVersion: %u", buf, 0x12u);
    }

  }
  else
  {
    if (!v23)
    {
      v19 = v137;
      v18 = (void *)v132;
      v17 = (void *)v129;
      goto LABEL_134;
    }
    v126 = v49;
    v67 = 0;
  }
  v69 = _IDSLinkPacketBufferCreate();
  v149 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v70 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v70 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v70;
  *(_OWORD *)&buf[16] = v70;
  v127 = (_QWORD *)v69;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "isInternalInstall");

  if (v72 && (byte_1EE1E3930 & 1) == 0)
  {
    byte_1EE1E3930 = 1;
    v73 = getpid();
    LODWORD(v146) = bswap32(v73);
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412546;
      v142 = self;
      v143 = 1024;
      *(_DWORD *)v144 = v73;
      _os_log_impl(&dword_1906E0000, v74, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_ProcessIDKey - %d", v141, 0x12u);
    }

    IDSByteBufferWriteField();
  }
  if (v140)
    IDSByteBufferWriteField();
  if (v67)
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412546;
      v142 = self;
      v143 = 1024;
      *(_DWORD *)v144 = v67;
      _os_log_impl(&dword_1906E0000, v75, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_RemoteDeviceVersionKey remoteDeviceVersion: %u", v141, 0x12u);
    }

    *(_DWORD *)v141 = bswap32(v67);
    IDSByteBufferWriteField();
  }
  if ((_DWORD)v136)
  {
    v141[0] = v135;
    v141[1] = v133;
    v141[2] = BYTE3(v136);
    v141[3] = BYTE2(v136);
    LOBYTE(v142) = BYTE1(v136);
    BYTE1(v142) = v136;
    IDSByteBufferWriteField();
  }
  v19 = v137;
  v18 = (void *)v132;
  if (v137)
  {
    LOBYTE(v146) = 0;
    v76 = objc_msgSend(v137, "count");
    v77 = -1;
    if (v76 < 0xFF)
      v77 = v76;
    LOBYTE(v146) = v77;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412546;
      v142 = self;
      v143 = 1024;
      *(_DWORD *)v144 = v146;
      _os_log_impl(&dword_1906E0000, v78, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_BasebandQueueFlushPayloadSizeKey %u", v141, 0x12u);
    }

    v79 = IDSByteBufferWriteField();
    MEMORY[0x1E0C80A78](v79);
    v81 = (char *)&v120 - v80;
    memset((char *)&v120 - v80, 170, v82);
    *v81 = v134;
    if ((_BYTE)v146)
    {
      v121 = &v120;
      v122 = v60;
      v123 = v8;
      v124 = self;
      v125 = v4;
      v83 = 0;
      v120 = v81;
      v84 = v81 + 1;
      v136 = *MEMORY[0x1E0D34590];
      v135 = *MEMORY[0x1E0D34598];
      v134 = *MEMORY[0x1E0D34588];
      v133 = *MEMORY[0x1E0D345A0];
      v85 = *MEMORY[0x1E0D34580];
      do
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v83, v120, v121);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKey:", v136);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "intValue");

        objc_msgSend(v86, "objectForKey:", v135);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "intValue");

        objc_msgSend(v86, "objectForKey:", v134);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "intValue");

        objc_msgSend(v86, "objectForKey:", v133);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "intValue");

        objc_msgSend(v86, "objectForKey:", v85);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "intValue");

        *v84 = v88;
        v84[1] = HIBYTE(v90);
        v84[2] = BYTE2(v90);
        v84[3] = BYTE1(v90);
        v84[4] = v90;
        v19 = v137;
        v84[5] = v92;
        v84[6] = HIBYTE(v94);
        v84[7] = v94;
        v84[8] = HIBYTE(v96);
        v84[9] = v96;
        v84 += 10;

        ++v83;
      }
      while (v83 < v146);
      v4 = v125;
      self = v124;
      v8 = v123;
      v18 = (void *)v132;
      LOBYTE(v60) = v122;
    }
    IDSByteBufferWriteField();
  }
  v97 = v8;
  v98 = v60;
  if (v18)
  {
    v147 = 0;
    v146 = 0;
    if (objc_msgSend(v18, "count"))
    {
      v99 = 0;
      while (v99 != 10)
      {
        objc_msgSend(v18, "objectAtIndex:", v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)&v146 + v99) = objc_msgSend(v100, "intValue");

        if (objc_msgSend(v18, "count") <= (unint64_t)++v99)
          goto LABEL_102;
      }
      +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
      v101 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v141 = 138412546;
        v142 = self;
        v143 = 1024;
        *(_DWORD *)v144 = 10;
        _os_log_impl(&dword_1906E0000, v101, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_DiscardLinkIDsKey the maximum of links is %d", v141, 0x12u);
      }

    }
LABEL_102:
    IDSByteBufferWriteField();
  }
  if (v97)
  {
    v102 = objc_msgSend(v97, "length");
    LOBYTE(v146) = v102;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412546;
      v142 = self;
      v143 = 1024;
      *(_DWORD *)v144 = v102;
      _os_log_impl(&dword_1906E0000, v103, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_PreConnectionDataSizeKey %u", v141, 0x12u);
    }

    IDSByteBufferWriteField();
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412546;
      v142 = self;
      v143 = 2112;
      *(_QWORD *)v144 = v97;
      _os_log_impl(&dword_1906E0000, v104, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_PreConnectionDataKey %@", v141, 0x16u);
    }

    objc_msgSend(objc_retainAutorelease(v97), "bytes");
    IDSByteBufferWriteField();
  }
  v105 = v131;
  if ((_BYTE)v131)
  {
    LOBYTE(v146) = v131;
    v106 = v126;
    BYTE1(v146) = v126;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v107 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
    {
      v108 = CFSTR("YES");
      *(_DWORD *)v141 = 138412802;
      v142 = self;
      if (!v106)
        v108 = CFSTR("NO");
      v143 = 2112;
      *(_QWORD *)v144 = v108;
      *(_WORD *)&v144[8] = 1024;
      v145 = v105;
      _os_log_impl(&dword_1906E0000, v107, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_UpdateQoSIsGoodKey IsGood:%@ LinkID:%d", v141, 0x1Cu);
    }

    IDSByteBufferWriteField();
  }
  v109 = v130;
  if (!v128)
  {
    IDSByteBufferWriteField();
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412290;
      v142 = self;
      _os_log_impl(&dword_1906E0000, v110, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_QueryRSSI", v141, 0xCu);
    }

    IDSByteBufferWriteField();
  }
  if (v109 != 100000)
  {
    LOBYTE(v146) = v98;
    BYTE1(v146) = HIBYTE(v109);
    BYTE2(v146) = BYTE2(v109);
    BYTE3(v146) = BYTE1(v109);
    BYTE4(v146) = v109;
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412802;
      v142 = self;
      v143 = 1024;
      *(_DWORD *)v144 = v109;
      *(_WORD *)&v144[4] = 1024;
      *(_DWORD *)&v144[6] = v98;
      _os_log_impl(&dword_1906E0000, v111, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_MaxBitrateKey maxBitrate:%u LinkID:%d", v141, 0x18u);
    }

    IDSByteBufferWriteField();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-needs-encryption-info"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)v129;
  v8 = v97;
  if (v112)
  {
    LOBYTE(v146) = 1;
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412290;
      v142 = self;
      _os_log_impl(&dword_1906E0000, v113, OS_LOG_TYPE_DEFAULT, "<%@> IDSDataChannelPreferenceNeedsEncryptionInfoKey - we'll request the encryption info", v141, 0xCu);
    }

    IDSByteBufferWriteField();
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("preference-needs-force-update-encryption-info"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v115 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v141 = 138412290;
      v142 = self;
      _os_log_impl(&dword_1906E0000, v115, OS_LOG_TYPE_DEFAULT, "<%@> kClientChannelMetadataType_ForceUpdateEncryptionInfoKey - we'll update the encryption info.", v141, 0xCu);
    }

    v141[0] = 1;
    IDSByteBufferWriteField();
  }
  if (v17)
  {
    IDSByteBufferWriteField();
    v116 = objc_retainAutorelease(v17);
    objc_msgSend(v116, "bytes");
    objc_msgSend(v116, "length");
    IDSByteBufferWriteField();
  }
  v117 = v127;
  v127[2] = *(_QWORD *)&buf[16] - *v127;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v117);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v117);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v119);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_134:

}

- ($988D82359F2BAE314798199717957CF0)_setWiFiAssist:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  $988D82359F2BAE314798199717957CF0 *v7;
  __int128 v8;
  _BYTE buf[32];
  unint64_t v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@>: setWiFiAssist: %@", buf, 0x16u);
  }

  v7 = ($988D82359F2BAE314798199717957CF0 *)_IDSLinkPacketBufferCreate();
  v11 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v8;
  *(_OWORD *)&buf[16] = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  IDSByteBufferWriteField();
  if ((char *)*(_QWORD *)&buf[16] > v7->var0)
    v7->var2 = *(_QWORD *)&buf[16] - (unint64_t)v7->var0;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v7);
  return v7;
}

- (void)setWiFiAssist:(BOOL)a3
{
  $988D82359F2BAE314798199717957CF0 *v4;
  NSMutableArray *sendingMetadata;
  void *v6;

  v4 = -[IDSDatagramChannel _setWiFiAssist:](self, "_setWiFiAssist:", a3);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v6);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
}

- (void)startActiveProbingWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  _QWORD *v12;
  __int128 v13;
  NSObject *v14;
  NSMutableArray *sendingMetadata;
  void *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[32];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v8 = "<%@>: startActiveProbingWithOptions: invalid probing Data, return";
      v9 = v7;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1000)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      v8 = "<%@>: startActiveProbingWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  v12 = (_QWORD *)_IDSLinkPacketBufferCreate();
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: startActiveProbingWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v11, "length");
  IDSByteBufferWriteField();
  v12[2] = *(_QWORD *)&buf[16] - *v12;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v12);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v16);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:

}

- (void)stopActiveProbingWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  _QWORD *v12;
  __int128 v13;
  NSObject *v14;
  NSMutableArray *sendingMetadata;
  void *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[32];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v8 = "<%@>: stopActiveProbingWithOptions: invalid probing Data, return";
      v9 = v7;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1000)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      v8 = "<%@>: stopActiveProbingWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  v12 = (_QWORD *)_IDSLinkPacketBufferCreate();
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: stopActiveProbingWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v11, "length");
  IDSByteBufferWriteField();
  v12[2] = *(_QWORD *)&buf[16] - *v12;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v12);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v16);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:

}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  _QWORD *v12;
  __int128 v13;
  NSObject *v14;
  NSMutableArray *sendingMetadata;
  void *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[32];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v8 = "<%@>: flushLinkProbingStatusWithOptions: invalid probing options, return";
      v9 = v7;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1000)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      v8 = "<%@>: flushLinkProbingStatusWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  v12 = (_QWORD *)_IDSLinkPacketBufferCreate();
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: flushLinkProbingStatusWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v11, "length");
  IDSByteBufferWriteField();
  v12[2] = *(_QWORD *)&buf[16] - *v12;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v12);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v16);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:

}

- (void)queryStatusWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  _QWORD *v12;
  __int128 v13;
  NSObject *v14;
  NSMutableArray *sendingMetadata;
  void *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[32];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v8 = "<%@>: queryStatusWithOptions: invalid query options, return";
      v9 = v7;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1000)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      v8 = "<%@>: queryStatusWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  v12 = (_QWORD *)_IDSLinkPacketBufferCreate();
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: queryStatusWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v11, "length");
  IDSByteBufferWriteField();
  v12[2] = *(_QWORD *)&buf[16] - *v12;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v12);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v16);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:

}

- (void)setUPlusOneMode:(BOOL)a3 isInitiator:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  _QWORD *v7;
  __int128 v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  NSMutableArray *sendingMetadata;
  void *v13;
  __int128 v14;
  uint8_t buf[4];
  IDSDatagramChannel *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v4 = a4;
  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (_QWORD *)_IDSLinkPacketBufferCreate();
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels", v14);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v18 = v11;
    v17 = 2112;
    if (v4)
      v10 = CFSTR("YES");
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, "<%@>: setUPlusOneMode: %@ isInitiator: %@", buf, 0x20u);
  }

  buf[0] = v5;
  buf[1] = v4;
  IDSByteBufferWriteField();
  if (*v7 < 0xAAAAAAAAAAAAAAAALL)
    v7[2] = 0xAAAAAAAAAAAAAAAALL - *v7;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v7);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v13);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
}

- (void)startMKMRecoveryForParticipantIDs:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  __int128 v16;
  NSObject *v17;
  uint64_t v18;
  NSMutableArray *sendingMetadata;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE buf[12];
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    v27 = 2112;
    v28 = (uint64_t)v4;
    _os_log_impl(&dword_1906E0000, v5, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: %@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)buf = objc_msgSend(v12, "unsignedLongLongValue");
          -[NSObject appendBytes:length:](v6, "appendBytes:length:", buf, 8);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      }
      while (v9);
    }

    if ((unint64_t)-[NSObject length](v6, "length") <= 0x1000)
    {
      v6 = objc_retainAutorelease(v6);
      -[NSObject bytes](v6, "bytes");
      v15 = (_QWORD *)_IDSLinkPacketBufferCreate();
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v16;
      IDSByteBufferInitForWriteWithAllocatedSpace();
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels", v21);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[NSObject length](v6, "length");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = self;
        v27 = 2112;
        v28 = (uint64_t)v7;
        v29 = 2112;
        v30 = v6;
        v31 = 2048;
        v32 = v18;
        _os_log_impl(&dword_1906E0000, v17, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: %@, %@ size: %lu", buf, 0x2Au);
      }

      -[NSObject length](v6, "length");
      IDSByteBufferWriteField();
      v15[2] = 0xAAAAAAAAAAAAAAAALL - *v15;
      IDSByteBufferRelease();
      -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v15);
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](sendingMetadata, "addObject:", v20);

      -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
      os_unfair_lock_unlock(&self->_internal->_writeLock);
    }
    else
    {
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[NSObject length](v6, "length");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        v27 = 2048;
        v28 = v14;
        _os_log_impl(&dword_1906E0000, v13, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: metadata size: %lu, greater than max allowed sent size, return", buf, 0x16u);
      }

    }
  }
  else
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1906E0000, v6, OS_LOG_TYPE_DEFAULT, "<%@>: startMKMRecoveryForParticipantIDs: invalid participantIDs size", buf, 0xCu);
    }
  }

}

- (void)requestSessionInfoWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void (**eventHandler)(id, void *);
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  NSObject *v20;
  NSMutableArray *sendingMetadata;
  void *v22;
  uint8_t buf[4];
  IDSDatagramChannel *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "length") <= 0x1000)
    {
      v18 = objc_retainAutorelease(v6);
      objc_msgSend(v18, "bytes");
      v19 = (_QWORD *)_IDSLinkPacketBufferCreate();
      IDSByteBufferInitForWriteWithAllocatedSpace();
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412803;
        v24 = self;
        v25 = 2113;
        v26 = v4;
        v27 = 2048;
        v28 = objc_msgSend(v18, "length");
        _os_log_impl(&dword_1906E0000, v20, OS_LOG_TYPE_DEFAULT, "%@: requestSessionInfoWithOptions: %{private}@ size: %lu", buf, 0x20u);
      }

      objc_msgSend(v18, "length");
      IDSByteBufferWriteField();
      v19[2] = 0xAAAAAAAAAAAAAAAALL - *v19;
      IDSByteBufferRelease();
      -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v19);
      os_unfair_lock_lock(&self->_internal->_writeLock);
      sendingMetadata = self->_internal->_sendingMetadata;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](sendingMetadata, "addObject:", v22);

      -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
      os_unfair_lock_unlock(&self->_internal->_writeLock);
    }
    else if (self->_internal->_eventHandler)
    {
      v7 = objc_alloc(MEMORY[0x1E0C99D80]);
      v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("The serialized metadata was greater than the max slot size allowed to send over the channel"), *MEMORY[0x1E0CB2D68], 0);
      v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 8, v8);
      eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
      v29[0] = CFSTR("event-type");
      v29[1] = CFSTR("error-key");
      v30[0] = &unk_1E2CAE468;
      v30[1] = v10;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = v30;
      v14 = v29;
LABEL_7:
      objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      eventHandler[2](eventHandler, v17);

    }
  }
  else if (self->_internal->_eventHandler)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99D80]);
    v8 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", CFSTR("Could not serialize provided metadata."), *MEMORY[0x1E0CB2D68], 0);
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D34510], 8, v8);
    eventHandler = (void (**)(id, void *))self->_internal->_eventHandler;
    v31[0] = CFSTR("event-type");
    v31[1] = CFSTR("error-key");
    v32[0] = &unk_1E2CAE468;
    v32[1] = v10;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v32;
    v14 = v31;
    goto LABEL_7;
  }

}

- (void)requestStatsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  _QWORD *v12;
  __int128 v13;
  NSObject *v14;
  NSMutableArray *sendingMetadata;
  void *v16;
  int v17;
  IDSDatagramChannel *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  _BYTE buf[32];
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D34E88], "serializeSessionInfoMetadata:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = self;
      v8 = "<%@>: requestStatsWithOptions: invalid stats data, return";
      v9 = v7;
      v10 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v5, "length") > 0x1000)
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "length");
      v8 = "<%@>: requestStatsWithOptions: serialized metadata size: %lu, greater than max allowed sent size, return";
      v9 = v7;
      v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1906E0000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = objc_retainAutorelease(v6);
  objc_msgSend(v11, "bytes");
  v12 = (_QWORD *)_IDSLinkPacketBufferCreate();
  v24 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v13;
  *(_OWORD *)&buf[16] = v13;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412802;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    v21 = 2048;
    v22 = objc_msgSend(v11, "length");
    _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "<%@>: requestStatsWithOptions: %@ size: %lu", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(v11, "length");
  IDSByteBufferWriteField();
  v12[2] = *(_QWORD *)&buf[16] - *v12;
  IDSByteBufferRelease();
  -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v12);
  os_unfair_lock_lock(&self->_internal->_writeLock);
  sendingMetadata = self->_internal->_sendingMetadata;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](sendingMetadata, "addObject:", v16);

  -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
  os_unfair_lock_unlock(&self->_internal->_writeLock);
LABEL_12:

}

- (void)_reportDictionary:(id)a3 forKey:(unsigned __int8)a4
{
  id v6;
  _QWORD *v7;
  __int128 v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSMutableArray *sendingMetadata;
  void *v13;
  __int128 v14;

  v6 = a3;
  v7 = (_QWORD *)_IDSLinkPacketBufferCreate();
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = v8;
  IDSByteBufferInitForWriteWithAllocatedSpace();
  JWEncodeDictionary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length", v14) <= (unint64_t)(v7[1] - 3))
  {
    v11 = objc_retainAutorelease(v9);
    objc_msgSend(v11, "bytes");
    objc_msgSend(v11, "length");
    IDSByteBufferWriteField();
    v7[2] = 0xAAAAAAAAAAAAAAAALL - *v7;
    IDSByteBufferRelease();
    -[IDSDatagramChannel _buildPacketBufferMetaData:](self, "_buildPacketBufferMetaData:", v7);
    os_unfair_lock_lock(&self->_internal->_writeLock);
    sendingMetadata = self->_internal->_sendingMetadata;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](sendingMetadata, "addObject:", v13);

    -[IDSDatagramChannel sendMetadata](self, "sendMetadata");
    os_unfair_lock_unlock(&self->_internal->_writeLock);
  }
  else
  {
    +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1907FB2A0(a4, v10);

  }
}

- (void)reportMKIArrival:(id)a3 isLocallyGenerated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  objc_msgSend(v7, "numberWithDouble:", *(double *)&qword_1EE1E3940 * (double)mach_continuous_time());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1907CBF00;
  v12[3] = &unk_1E2C60CF0;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = a4;
  v10 = v8;
  v11 = v6;
  dispatch_async(v9, v12);

}

- (void)_reportMKIArrival:(id)a3 time:(id)a4 isLocallyGenerated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[3];
  uint8_t buf[4];
  IDSDatagramChannel *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(a3, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1906E0000, v10, OS_LOG_TYPE_DEFAULT, "%@: reportMKIArrival: mki %@ at %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5, *MEMORY[0x1E0D34540], *MEMORY[0x1E0D34548], *MEMORY[0x1E0D34520], v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSDatagramChannel _reportDictionary:forKey:](self, "_reportDictionary:forKey:", v12, 80);
}

- (void)reportFirstIncomingPacketTimeForMKI:(id)a3 participantID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  objc_msgSend(v8, "numberWithDouble:", *(double *)&qword_1EE1E3940 * (double)mach_continuous_time());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1907CC1BC;
  v14[3] = &unk_1E2C60C50;
  v14[4] = self;
  v15 = v6;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  dispatch_async(v10, v14);

}

- (void)_reportFirstIncomingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  IDSDatagramChannel *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v17 = self;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = objc_msgSend(v9, "unsignedLongLongValue");
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "%@: reportFirstIncomingPacketTimeForMKI: first incoming packet for mki %@ at %@ for participantID: %llu", buf, 0x2Au);
  }

  v12 = *MEMORY[0x1E0D34548];
  v14[0] = *MEMORY[0x1E0D34568];
  v14[1] = v12;
  v15[0] = v8;
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E0D34570];
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDatagramChannel _reportDictionary:forKey:](self, "_reportDictionary:forKey:", v13, 78);

}

- (void)reportFirstOutgoingPacketTimeForMKI:(id)a3 participantID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (qword_1EE1E3938 != -1)
    dispatch_once(&qword_1EE1E3938, &unk_1E2C64C30);
  objc_msgSend(v8, "numberWithDouble:", *(double *)&qword_1EE1E3940 * (double)mach_continuous_time());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1907CC478;
  v14[3] = &unk_1E2C60C50;
  v14[4] = self;
  v15 = v6;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  dispatch_async(v10, v14);

}

- (void)_reportFirstOutgoingPacketTimeForMKI:(id)a3 time:(id)a4 participantID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  IDSDatagramChannel *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IDSLogging IDSDataChannels](IDSLogging, "IDSDataChannels");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v17 = self;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = objc_msgSend(v9, "unsignedLongLongValue");
    _os_log_impl(&dword_1906E0000, v11, OS_LOG_TYPE_DEFAULT, "%@: reportFirstOutgoingPacketTimeForMKI: first outgoing packet for mki %@ at %@ for participantID: %llu", buf, 0x2Au);
  }

  v12 = *MEMORY[0x1E0D34548];
  v14[0] = *MEMORY[0x1E0D34568];
  v14[1] = v12;
  v15[0] = v8;
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E0D34570];
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSDatagramChannel _reportDictionary:forKey:](self, "_reportDictionary:forKey:", v13, 79);

}

- (void)reportEvent:(id)a3 forLinkID:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v4 = a4;
  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = *MEMORY[0x1E0D34538];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedChar:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = *MEMORY[0x1E0D34518];
  v11[0] = v8;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSDatagramChannel _reportDictionary:forKey:](self, "_reportDictionary:forKey:", v9, 81);
}

- (void)reportLastPacketReceivedTime:(double)a3 lastPacketSentTime:(double)a4 linkID:(unsigned __int8)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D34538];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v12[1] = *MEMORY[0x1E0D34528];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  v12[2] = *MEMORY[0x1E0D34530];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IDSDatagramChannel _reportDictionary:forKey:](self, "_reportDictionary:forKey:", v11, 83);
}

- (void)generateMetadataWithDatagramInfo:(id)a3 options:(id *)a4 currentDatagramCount:(unsigned __int8)a5 totalDatagramCount:(unsigned __int8)a6 byteBuffer:(id *)a7
{
  unsigned int var0;
  char *p_var4;
  uint64_t v10;
  unsigned __int16 *var5;
  uint8_t *v12;
  unsigned int v13;
  NSObject *v14;
  unint64_t var12;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4 || a3.var0)
  {
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    IDSByteBufferWriteField();
    if (a4)
    {
      var0 = a4->var0;
      if ((a4->var0 & 8) != 0)
      {
        IDSByteBufferWriteField();
        var0 = a4->var0;
        if ((a4->var0 & 1) == 0)
        {
LABEL_6:
          if ((var0 & 0x10) == 0)
            goto LABEL_7;
          goto LABEL_11;
        }
      }
      else if ((var0 & 1) == 0)
      {
        goto LABEL_6;
      }
      *(_QWORD *)buf = bswap64(a4->var1);
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x10) == 0)
      {
LABEL_7:
        if ((var0 & 2) == 0)
          goto LABEL_19;
        goto LABEL_12;
      }
LABEL_11:
      *(_WORD *)buf = bswap32(a4->var2) >> 16;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 2) == 0)
        goto LABEL_19;
LABEL_12:
      p_var4 = &a4->var4;
      if (a4->var4 >= 1)
      {
        if (a4->var4 >= 0xDu)
          *p_var4 = 12;
        IDSByteBufferWriteField();
        memset(buf, 170, sizeof(buf));
        if (*p_var4 >= 1)
        {
          v10 = *p_var4;
          var5 = a4->var5;
          v12 = buf;
          do
          {
            v13 = *var5++;
            *(_WORD *)v12 = bswap32(v13) >> 16;
            v12 += 2;
            --v10;
          }
          while (v10);
        }
        IDSByteBufferWriteField();
        var0 = a4->var0;
      }
LABEL_19:
      if ((var0 & 4) != 0)
      {
        buf[0] = 1;
        IDSByteBufferWriteField();
        var0 = a4->var0;
        if ((a4->var0 & 0x40) == 0)
        {
LABEL_21:
          if ((var0 & 0x80) == 0)
            goto LABEL_22;
          goto LABEL_33;
        }
      }
      else if ((var0 & 0x40) == 0)
      {
        goto LABEL_21;
      }
      *(_WORD *)buf = bswap32(a4->var7) >> 16;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x80) == 0)
      {
LABEL_22:
        if ((var0 & 0x100) == 0)
          goto LABEL_23;
        goto LABEL_34;
      }
LABEL_33:
      buf[0] = 1;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x100) == 0)
      {
LABEL_23:
        if ((var0 & 0x40000) == 0)
          goto LABEL_24;
        goto LABEL_35;
      }
LABEL_34:
      buf[0] = 1;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x40000) == 0)
      {
LABEL_24:
        if ((var0 & 0x200) == 0)
          goto LABEL_25;
        goto LABEL_36;
      }
LABEL_35:
      *(_OWORD *)buf = *(_OWORD *)a4->var13;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x200) == 0)
      {
LABEL_25:
        if ((var0 & 0x400) == 0)
          goto LABEL_26;
        goto LABEL_37;
      }
LABEL_36:
      *(_QWORD *)buf = bswap64(a4->var10);
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x400) == 0)
      {
LABEL_26:
        if ((var0 & 0x8000) == 0)
          goto LABEL_27;
        goto LABEL_38;
      }
LABEL_37:
      buf[0] = 1;
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x8000) == 0)
      {
LABEL_27:
        if ((var0 & 0x10000) == 0)
          goto LABEL_28;
        goto LABEL_41;
      }
LABEL_38:
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        var12 = a4->var12;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = var12;
        _os_log_impl(&dword_1906E0000, v14, OS_LOG_TYPE_DEFAULT, "storing encryption sequence number: %llu (*Client -> IDSD)", buf, 0xCu);
      }

      *(_QWORD *)buf = bswap64(a4->var12);
      IDSByteBufferWriteField();
      var0 = a4->var0;
      if ((a4->var0 & 0x10000) == 0)
      {
LABEL_28:
        if ((var0 & 0x20000) == 0)
          return;
        goto LABEL_29;
      }
LABEL_41:
      buf[0] = 1;
      IDSByteBufferWriteField();
      if ((a4->var0 & 0x20000) == 0)
        return;
LABEL_29:
      buf[0] = 1;
      IDSByteBufferWriteField();
    }
  }
}

- (void)osChannelInfoLog
{
  _IDSDatagramChannel *internal;
  int v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  channel_ring_desc *osChannelTXRing;
  channel_ring_desc *osChannelRXRing;
  int v12;
  _BYTE v13[10];
  channel_ring_desc *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (internal)
  {
    if (internal->_osChannelRXRing && internal->_osChannelTXRing)
    {
      v4 = os_channel_available_slot_count();
      v5 = os_channel_available_slot_count();
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 67109376;
        *(_DWORD *)v13 = v4;
        *(_WORD *)&v13[4] = 1024;
        *(_DWORD *)&v13[6] = v5;
        v7 = "osChannelInfoLog: os_channel rx slot count %u tx slot count %u";
        v8 = v6;
        v9 = 14;
LABEL_10:
        _os_log_impl(&dword_1906E0000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
    else
    {
      +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        osChannelTXRing = self->_internal->_osChannelTXRing;
        osChannelRXRing = self->_internal->_osChannelRXRing;
        v12 = 134218240;
        *(_QWORD *)v13 = osChannelRXRing;
        *(_WORD *)&v13[8] = 2048;
        v14 = osChannelTXRing;
        v7 = "osChannelInfoLog: os_channel ring is NULL (_osChannelRXRing %p, _osChannelTXRing %p)";
        v8 = v6;
        v9 = 22;
        goto LABEL_10;
      }
    }
  }
  else
  {
    +[IDSTransportLog IDSDataChannels](IDSTransportLog, "IDSDataChannels");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v7 = "osChannelInfoLog: _internal is NULL.";
      v8 = v6;
      v9 = 2;
      goto LABEL_10;
    }
  }

}

- (void)setPreferredDataPathType:(int64_t)a3
{
  self->_internal->_preferredDataPathType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statsTimer, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
