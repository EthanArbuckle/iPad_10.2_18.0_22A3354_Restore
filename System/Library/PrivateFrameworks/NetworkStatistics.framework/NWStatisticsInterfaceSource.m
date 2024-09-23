@implementation NWStatisticsInterfaceSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  nstat_ifnet_descriptor *p_descriptor;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  char v22;

  if (a4 < 0xF8)
    return 1;
  p_descriptor = &self->_descriptor;
  if (!memcmp(&self->_descriptor, a3, 0xF8uLL))
  {
    -[NWStatisticsSource manager](self, "manager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mgrflags");

    if ((v22 & 4) != 0)
      return 1;
    else
      return 2;
  }
  else
  {
    v9 = *(_OWORD *)a3;
    v10 = *((_OWORD *)a3 + 1);
    v11 = *((_OWORD *)a3 + 3);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_min_latency = *((_OWORD *)a3 + 2);
    *(_OWORD *)&p_descriptor->link_status.u.wifi.ul_bytes_lost = v11;
    *(_OWORD *)&p_descriptor->threshold = v9;
    *(_OWORD *)&p_descriptor->link_status.u.cellular.valid_bitmask = v10;
    v12 = *((_OWORD *)a3 + 4);
    v13 = *((_OWORD *)a3 + 5);
    v14 = *((_OWORD *)a3 + 7);
    *(_OWORD *)&p_descriptor->type = *((_OWORD *)a3 + 6);
    *(_OWORD *)&p_descriptor->description[12] = v14;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.dl_min_latency = v12;
    *(_OWORD *)&p_descriptor->link_status.u.wifi.config_frequency = v13;
    v15 = *((_OWORD *)a3 + 8);
    v16 = *((_OWORD *)a3 + 9);
    v17 = *((_OWORD *)a3 + 11);
    *(_OWORD *)&p_descriptor->description[60] = *((_OWORD *)a3 + 10);
    *(_OWORD *)&p_descriptor->description[76] = v17;
    *(_OWORD *)&p_descriptor->description[28] = v15;
    *(_OWORD *)&p_descriptor->description[44] = v16;
    v18 = *((_OWORD *)a3 + 12);
    v19 = *((_OWORD *)a3 + 13);
    v20 = *((_OWORD *)a3 + 14);
    *(_QWORD *)&p_descriptor->name[12] = *((_QWORD *)a3 + 30);
    *(_OWORD *)&p_descriptor->description[108] = v19;
    *(_OWORD *)&p_descriptor->description[124] = v20;
    *(_OWORD *)&p_descriptor->description[92] = v18;
    return 3;
  }
}

- (id)_currentSnapshot
{
  return -[NWSInterfaceSnapshot initWithCounts:interfaceDescriptor:sourceIdent:seqno:]([NWSInterfaceSnapshot alloc], "initWithCounts:interfaceDescriptor:sourceIdent:seqno:", -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"), &self->_descriptor, -[NWStatisticsSource reference](self, "reference"), -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"));
}

- (id)description
{
  _printf_domain *v3;
  void *v4;
  char *__ret;

  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWSInterfaceSource %I", self->_descriptor.ifindex);
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

- (NWStatisticsInterfaceSource)initWithManager:(id)a3 interface:(int64_t)a4 threshold:(int64_t)a5
{
  unsigned int v6;
  id v8;
  NWStatisticsInterfaceSource *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NWStatisticsInterfaceSource *v19;
  NWStatisticsInterfaceSource *v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  int v30;
  __int128 v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWStatisticsInterfaceSource;
  v9 = -[NWStatisticsSource initWithManager:source:provider:](&v22, sel_initWithManager_source_provider_, v8, 0, 6);
  if (v9)
  {
    v31 = 0u;
    v32 = 6;
    v33 = a5;
    v34 = v6;
    v10 = objc_msgSend(v8, "addSource:request:length:", v9, &v31, 40);
    NStatGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v10)
        v12 = "Created";
      else
        v12 = "Failed to create";
      *(_DWORD *)buf = 134218754;
      v24 = v8;
      v25 = 2080;
      v26 = v12;
      v27 = 1024;
      v28 = v6;
      v29 = 1024;
      v30 = a5;
      _os_log_impl(&dword_211429000, v11, OS_LOG_TYPE_INFO, "Manager %p: %s source for interface index %d with threshold %d", buf, 0x22u);
    }

    if ((objc_msgSend(v8, "mgrflags") & 0x80) != 0)
      NStatMgrTraceF(v8, "%s Manager %p: %s source for interface %I index %d with threshold %d", v13, v14, v15, v16, v17, v18, (char)"-[NWStatisticsInterfaceSource initWithManager:interface:threshold:]");
    if (v10)
      v19 = v9;
    else
      v19 = 0;
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
