@implementation NWStatisticsUDPSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  nstat_udp_descriptor *p_descriptor;
  void *v9;
  char v10;

  if (a4 < 0x118)
    return 1;
  if (self->_eventFlags != a5)
  {
    self->_eventFlags = a5;
    p_descriptor = &self->_descriptor;
    goto LABEL_7;
  }
  if (memcmp(&self->_descriptor, a3, 0x118uLL))
  {
    p_descriptor = &self->_descriptor;
LABEL_7:
    memcpy(p_descriptor, a3, sizeof(nstat_udp_descriptor));
    return 3;
  }
  -[NWStatisticsSource manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mgrflags");

  if ((v10 & 4) != 0)
    return 1;
  else
    return 2;
}

- (id)_currentSnapshot
{
  return -[NWSUDPSnapshot initWithCounts:UDPDescriptor:sourceIdent:events:seqno:provider:]([NWSUDPSnapshot alloc], "initWithCounts:UDPDescriptor:sourceIdent:events:seqno:provider:", -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"), &self->_descriptor, -[NWStatisticsSource reference](self, "reference"), self->_eventFlags, -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"), -[NWStatisticsSource provider](self, "provider"));
}

- (id)description
{
  _printf_domain *v3;
  void *v4;
  char *__ret;

  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWSUDPSource %N<->%N@%I", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex);
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWStatisticsUDPSource)initWithManager:(id)a3 local:(const sockaddr *)a4 remote:(const sockaddr *)a5
{
  id v8;
  NWStatisticsUDPSource *v9;
  NWStatisticsUDPSource *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  int sa_len;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NWStatisticsUDPSource *v22;
  objc_super v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const sockaddr *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const sockaddr *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWStatisticsUDPSource;
  v9 = -[NWStatisticsSource initWithManager:source:provider:](&v24, sel_initWithManager_source_provider_, v8, 0, 4);
  if (!v9)
    goto LABEL_5;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  LODWORD(v38) = 4;
  if (a4->sa_len > 0x1CuLL)
    goto LABEL_5;
  __memcpy_chk();
  if (a5)
  {
    if (a5->sa_len > 0x1CuLL)
    {
LABEL_5:
      v10 = 0;
      goto LABEL_22;
    }
    __memcpy_chk();
  }
  else
  {
    BYTE5(v40) = a4->sa_family;
    BYTE4(v40) = BYTE5(v40);
  }
  v11 = objc_msgSend(v8, "addSource:request:length:", v9, &v37, 80);
  NStatGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    if (v11)
      v13 = "Created";
    else
      v13 = "Failed to create";
    sa_len = a4->sa_len;
    if (a5)
      v15 = a5->sa_len;
    else
      v15 = 0;
    *(_DWORD *)buf = 134219266;
    v26 = v8;
    v27 = 2080;
    v28 = v13;
    v29 = 1040;
    v30 = sa_len;
    v31 = 2096;
    v32 = a4;
    v33 = 1040;
    v34 = v15;
    v35 = 2096;
    v36 = a5;
    _os_log_impl(&dword_211429000, v12, OS_LOG_TYPE_INFO, "Manager %p: %s UDP source for local address %{network:sockaddr}.*P, remote address %{network:sockaddr}.*P", buf, 0x36u);
  }

  if ((objc_msgSend(v8, "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(v8, "%s Manager %p: %s UDP source for local address %N, remote address %N", v16, v17, v18, v19, v20, v21, (char)"-[NWStatisticsUDPSource initWithManager:local:remote:]");
  if (v11)
    v22 = v9;
  else
    v22 = 0;
  v10 = v22;
LABEL_22:

  return v10;
}

@end
