@implementation NWStatisticsRouteSource

- (id)_currentSnapshot
{
  return -[NWSRouteSnapshot initWithCounts:routeDescriptor:sourceIdent:seqno:]([NWSRouteSnapshot alloc], "initWithCounts:routeDescriptor:sourceIdent:seqno:", -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"), &self->_descriptor, -[NWStatisticsSource reference](self, "reference"), -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"));
}

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  nstat_route_descriptor *p_descriptor;
  __int128 v9;
  __int128 v10;
  sockaddr v11;
  __int128 v12;
  sockaddr_in v13;
  __int128 v14;
  void *v15;
  char v16;

  if (a4 < 0x78)
    return 1;
  p_descriptor = &self->_descriptor;
  if (!memcmp(&self->_descriptor, a3, 0x78uLL))
  {
    -[NWStatisticsSource manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mgrflags");

    if ((v16 & 4) != 0)
      return 1;
    else
      return 2;
  }
  else
  {
    v9 = *(_OWORD *)a3;
    v10 = *((_OWORD *)a3 + 1);
    v11 = (sockaddr)*((_OWORD *)a3 + 3);
    *(_OWORD *)&p_descriptor->dst.sa.sa_data[6] = *((_OWORD *)a3 + 2);
    *(sockaddr *)((char *)&p_descriptor->dst.sa + 24) = v11;
    *(_OWORD *)&p_descriptor->id = v9;
    *(_OWORD *)&p_descriptor->gateway_id = v10;
    v12 = *((_OWORD *)a3 + 4);
    v13 = (sockaddr_in)*((_OWORD *)a3 + 5);
    v14 = *((_OWORD *)a3 + 6);
    *(_QWORD *)&p_descriptor->flags = *((_QWORD *)a3 + 14);
    p_descriptor->gateway.v4 = v13;
    *((_OWORD *)&p_descriptor->gateway.sa + 1) = v14;
    *(_OWORD *)&p_descriptor->mask.sa.sa_data[10] = v12;
    return 3;
  }
}

- (id)description
{
  nstat_route_descriptor *p_descriptor;
  uint64_t v3;
  _printf_domain *v4;
  const char *v5;
  _printf_domain *v6;
  const char *v7;
  void *v8;
  char *__ret;

  __ret = 0;
  p_descriptor = &self->_descriptor;
  if ((self->_descriptor.flags & 4) != 0)
  {
    v6 = (_printf_domain *)printf_domain();
    v7 = "Scoped ";
    if ((p_descriptor->flags & 0x1000000) == 0)
      v7 = "";
    asxprintf(&__ret, v6, 0, "NWSRouteSource %s%N->%I->%N", v7, &p_descriptor->dst, p_descriptor->ifindex, &p_descriptor->gateway);
  }
  else
  {
    v3 = maskLeadingBitsCount(&self->_descriptor.mask.v4.sin_len);
    v4 = (_printf_domain *)printf_domain();
    if ((p_descriptor->flags & 0x1000000) != 0)
      v5 = "Scoped ";
    else
      v5 = "";
    if (v3)
      asxprintf(&__ret, v4, 0, "NWSRouteSource %s%N/%d->%I->%N", v5, &p_descriptor->dst, v3, p_descriptor->ifindex, &p_descriptor->gateway);
    else
      asxprintf(&__ret, v4, 0, "NWSRouteSource %sDefault->%I->%N", v5, p_descriptor->ifindex, &p_descriptor->gateway);
  }
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v8;
}

- (NWStatisticsRouteSource)initWithManager:(id)a3 destination:(const sockaddr *)a4 mask:(const sockaddr *)a5 interface:(unsigned int)a6
{
  id v10;
  NWStatisticsRouteSource *v11;
  NWStatisticsRouteSource *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  int sa_family;
  const char *v17;
  const char *v18;
  int sa_len;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NWStatisticsRouteSource *v27;
  objc_super v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const sockaddr *v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const sockaddr *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unsigned int v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NWStatisticsRouteSource;
  v11 = -[NWStatisticsSource initWithManager:source:provider:](&v29, sel_initWithManager_source_provider_, v10, 0, 1);
  if (!v11)
    goto LABEL_5;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0u;
  LODWORD(v47) = 1;
  if (a4->sa_len > 0x1CuLL)
    goto LABEL_5;
  __memcpy_chk();
  if (a5)
  {
    if (a5->sa_len > 0x1CuLL)
    {
LABEL_5:
      v12 = 0;
      goto LABEL_26;
    }
    __memcpy_chk();
  }
  v51 = a6;
  v13 = objc_msgSend(v10, "addSource:request:length:", v11, &v46, 84);
  NStatGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    if (v13)
      v15 = "Created";
    else
      v15 = "Failed to create";
    sa_family = a4->sa_family;
    v17 = "Unknown-protocol";
    if (sa_family == 30)
      v17 = "IPv6";
    if (sa_family == 2)
      v18 = "IPv4";
    else
      v18 = v17;
    sa_len = a4->sa_len;
    if (a5)
      v20 = a5->sa_len;
    else
      v20 = 0;
    *(_DWORD *)buf = 134219778;
    v31 = v10;
    v32 = 2080;
    v33 = v15;
    v34 = 2080;
    v35 = v18;
    v36 = 1040;
    v37 = sa_len;
    v38 = 2096;
    v39 = a4;
    v40 = 1024;
    v41 = a6;
    v42 = 1040;
    v43 = v20;
    v44 = 2096;
    v45 = a5;
    _os_log_impl(&dword_211429000, v14, OS_LOG_TYPE_INFO, "Manager %p: %s %s route source to %{network:sockaddr}.*P  interface index %d, mask  %{network:sockaddr}.*P", buf, 0x46u);
  }

  if ((objc_msgSend(v10, "mgrflags") & 0x80) != 0)
    NStatMgrTraceF(v10, "%s Manager %p: %s %s route source to %N on interface %I index %d, mask %N", v21, v22, v23, v24, v25, v26, (char)"-[NWStatisticsRouteSource initWithManager:destination:mask:interface:]");
  if (v13)
    v27 = v11;
  else
    v27 = 0;
  v12 = v27;
LABEL_26:

  return v12;
}

- (NSData)destination
{
  return (NSData *)objc_getProperty(self, a2, 296, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
