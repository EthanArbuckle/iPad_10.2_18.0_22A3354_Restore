@implementation NWStatisticsSource

- (id)currentSnapshot
{
  NWStatisticsSource *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NWStatisticsSource _currentSnapshot](v2, "_currentSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)snapshotRevision
{
  return self->_descriptorSeqno + self->_countsSeqno;
}

- (unint64_t)reference
{
  return self->_reference;
}

- (const)_nstat_counts
{
  return &self->_last_counts;
}

- (BOOL)handleCounts:(const nstat_counts *)a3
{
  void *v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  BOOL v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  char v19;

  -[NWStatisticsSource manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[NWStatisticsSource countsSeqno](self, "countsSeqno"))
  {
    if (!memcmp(a3, &self->_last_counts, 0x70uLL))
    {
      -[NWStatisticsSource manager](self, "manager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mgrflags");

      return (v19 & 2) == 0;
    }
    else
    {
      v7 = *(_OWORD *)&a3->nstat_rxpackets;
      v8 = *(_OWORD *)&a3->nstat_cell_rxbytes;
      *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
      *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v8;
      *(_OWORD *)&self->_last_counts.nstat_rxpackets = v7;
      v9 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
      v10 = *(_OWORD *)&a3->nstat_wired_rxbytes;
      v11 = *(_OWORD *)&a3->nstat_connectsuccesses;
      *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
      *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v11;
      *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v9;
      *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v10;
      -[NWStatisticsSource setCountsSeqno:](self, "setCountsSeqno:", -[NWStatisticsSource countsSeqno](self, "countsSeqno") + 1);
      return 1;
    }
  }
  else
  {
    v12 = 1;
    -[NWStatisticsSource setCountsSeqno:](self, "setCountsSeqno:", 1);
    v13 = *(_OWORD *)&a3->nstat_rxpackets;
    v14 = *(_OWORD *)&a3->nstat_cell_rxbytes;
    *(_OWORD *)&self->_last_counts.nstat_txpackets = *(_OWORD *)&a3->nstat_txpackets;
    *(_OWORD *)&self->_last_counts.nstat_cell_rxbytes = v14;
    *(_OWORD *)&self->_last_counts.nstat_rxpackets = v13;
    v15 = *(_OWORD *)&a3->nstat_wifi_rxbytes;
    v16 = *(_OWORD *)&a3->nstat_wired_rxbytes;
    v17 = *(_OWORD *)&a3->nstat_connectsuccesses;
    *(_OWORD *)&self->_last_counts.nstat_rxduplicatebytes = *(_OWORD *)&a3->nstat_rxduplicatebytes;
    *(_OWORD *)&self->_last_counts.nstat_connectsuccesses = v17;
    *(_OWORD *)&self->_last_counts.nstat_wifi_rxbytes = v15;
    *(_OWORD *)&self->_last_counts.nstat_wired_rxbytes = v16;
  }
  return v12;
}

- (unint64_t)countsSeqno
{
  return self->_countsSeqno;
}

- (BOOL)handleMessage:(nstat_msg_hdr *)a3 length:(int64_t)a4
{
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  unsigned int type;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  NWStatisticsSource *v24;
  BOOL v25;
  NWStatisticsSource *v26;
  _BOOL4 v27;
  int v28;
  NWStatisticsSource *v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  NWStatisticsSource *v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[NWStatisticsSource manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mgrflags");

  if ((v8 & 0x10) != 0)
  {
    NStatGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NWStatisticsSource reference](self, "reference");
      type = a3->type;
      *(_DWORD *)buf = 134218752;
      v32 = v10;
      v33 = 2048;
      v34 = self;
      v35 = 2048;
      v36 = v11;
      v37 = 1024;
      v38 = type;
      _os_log_impl(&dword_211429000, v9, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu  message type %d", buf, 0x26u);

    }
  }
  -[NWStatisticsSource manager](self, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mgrflags");

  if (v14 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF(v15, "%s Manager %p: Entry for source %p, ref %llu  message type %d", v17, v18, v19, v20, v21, v22, (char)"-[NWStatisticsSource handleMessage:length:]");

  }
  v23 = a3->type;
  if (v23 != 10006)
  {
    if (v23 == 10004)
    {
      if ((unint64_t)a4 >= 0x90)
      {
        v29 = self;
        objc_sync_enter(v29);
        v25 = -[NWStatisticsSource handleCounts:](v29, "handleCounts:", &a3[2]);
        goto LABEL_16;
      }
    }
    else if (v23 == 10003 && (unint64_t)a4 >= 0x29)
    {
      v24 = self;
      objc_sync_enter(v24);
      v25 = -[NWStatisticsSource _handleDescriptor:length:events:](v24, "_handleDescriptor:length:events:", &a3[2].type, a4 - 40, 0);
LABEL_16:
      LOBYTE(v28) = v25;
      goto LABEL_17;
    }
LABEL_18:
    LOBYTE(v28) = 0;
    return v28;
  }
  if ((unint64_t)a4 < 0x99)
    goto LABEL_18;
  v26 = self;
  objc_sync_enter(v26);
  v27 = -[NWStatisticsSource _handleDescriptor:length:events:](v26, "_handleDescriptor:length:events:", &a3[9].type, a4 - 152, *(_QWORD *)&a3[1].type);
  v28 = -[NWStatisticsSource handleCounts:](v26, "handleCounts:", &a3[2]) || v27;
LABEL_17:
  objc_sync_exit(self);

  return v28;
}

- (NWStatisticsManager)manager
{
  return (NWStatisticsManager *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCountsSeqno:(unint64_t)a3
{
  self->_countsSeqno = a3;
}

- (BOOL)removing
{
  return self->_removing;
}

- (NWStatisticsSourceDelegate)delegate
{
  return (NWStatisticsSourceDelegate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)_handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  void *v9;
  NSObject *v10;
  int v11;

  -[NWStatisticsSource manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "internalQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = -[NWStatisticsSource handleDescriptor:length:events:](self, "handleDescriptor:length:events:", a3, a4, a5);
  if (v11 == 3)
    -[NWStatisticsSource setDescriptorSeqno:](self, "setDescriptorSeqno:", -[NWStatisticsSource descriptorSeqno](self, "descriptorSeqno") + 1);
  return v11 != 1;
}

- (NWStatisticsSource)init
{

  return 0;
}

+ (id)createSourceForProvider:(unsigned int)a3 srcRef:(unint64_t)a4 manager:(id)a5
{
  uint64_t v6;
  id v7;
  __objc2_class **v8;
  void *v9;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  if ((v6 - 1) > 7)
    v8 = off_24CBD20D8;
  else
    v8 = off_24CBD29F0[(int)v6 - 1];
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithManager:source:provider:", v7, a4, v6);

  return v9;
}

- (unint64_t)sourceIdentifier
{
  return self->_reference;
}

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  return 1;
}

- (NWStatisticsSource)initWithManager:(id)a3 source:(unint64_t)a4 provider:(unsigned int)a5
{
  id v9;
  NWStatisticsSource *v10;
  NWStatisticsSource *v11;
  NWStatisticsSource *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NWStatisticsSource;
  v10 = -[NWStatisticsSource init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_manager, a3);
    v11->_reference = a4;
    v11->_provider = a5;
    v12 = v11;
  }

  return v11;
}

- (void)queryCounts
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NWStatisticsSource *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[NWStatisticsSource manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mgrflags");

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      v21 = v6;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);

    }
  }
  -[NWStatisticsSource manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mgrflags");

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryCounts]");

  }
  -[NWStatisticsSource manager](self, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "internalQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsSource_queryCounts__block_invoke;
  block[3] = &unk_24CBD27A8;
  block[4] = self;
  dispatch_async(v18, block);

}

void __33__NWStatisticsSource_queryCounts__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1004, objc_msgSend(*(id *)(a1 + 32), "reference"));

}

- (void)queryDescription
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NWStatisticsSource *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[NWStatisticsSource manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mgrflags");

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      v21 = v6;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);

    }
  }
  -[NWStatisticsSource manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mgrflags");

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryDescription]");

  }
  -[NWStatisticsSource manager](self, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "internalQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__NWStatisticsSource_queryDescription__block_invoke;
  block[3] = &unk_24CBD27A8;
  block[4] = self;
  dispatch_async(v18, block);

}

void __38__NWStatisticsSource_queryDescription__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1005, objc_msgSend(*(id *)(a1 + 32), "reference"));

}

- (void)queryUpdate
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  NWStatisticsSource *v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[NWStatisticsSource manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mgrflags");

  if ((v4 & 0x10) != 0)
  {
    NStatGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NWStatisticsSource manager](self, "manager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218496;
      v21 = v6;
      v22 = 2048;
      v23 = self;
      v24 = 2048;
      v25 = -[NWStatisticsSource reference](self, "reference");
      _os_log_impl(&dword_211429000, v5, OS_LOG_TYPE_DEBUG, "Manager %p: Entry for source %p, ref %llu", buf, 0x20u);

    }
  }
  -[NWStatisticsSource manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mgrflags");

  if (v8 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource reference](self, "reference");
    NStatMgrTraceF(v9, "%s Manager %p: Entry for source %p, ref %llu", v11, v12, v13, v14, v15, v16, (char)"-[NWStatisticsSource queryUpdate]");

  }
  -[NWStatisticsSource manager](self, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "internalQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__NWStatisticsSource_queryUpdate__block_invoke;
  block[3] = &unk_24CBD27A8;
  block[4] = self;
  dispatch_async(v18, block);

}

void __33__NWStatisticsSource_queryUpdate__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendRequestMessage:sourceRef:", 1007, objc_msgSend(*(id *)(a1 + 32), "reference"));

}

- (id)_currentSnapshot
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  NStatGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    -[NWStatisticsSource manager](self, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v17 = v4;
    _os_log_impl(&dword_211429000, v3, OS_LOG_TYPE_ERROR, "Manager %p: Subclasses must provide an implementation for _currentSnapshot", buf, 0xCu);

  }
  -[NWStatisticsSource manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mgrflags");

  if (v6 < 0)
  {
    -[NWStatisticsSource manager](self, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWStatisticsSource manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NStatMgrTraceF(v7, "%s Manager %p: Subclasses must provide an implementation for _currentSnapshot", v8, v9, v10, v11, v12, v13, (char)"-[NWStatisticsSource _currentSnapshot]");

  }
  __assert_rtn("-[NWStatisticsSource _currentSnapshot]", "NWStatisticsSource.m", 241, "0");
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void)setReference:(unint64_t)a3
{
  self->_reference = a3;
}

- (void)setRemoving:(BOOL)a3
{
  self->_removing = a3;
}

- (unint64_t)descriptorSeqno
{
  return self->_descriptorSeqno;
}

- (void)setDescriptorSeqno:(unint64_t)a3
{
  self->_descriptorSeqno = a3;
}

- (unsigned)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
