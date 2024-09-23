@implementation NWStatisticsQUICSource

- (int)handleDescriptor:(void *)a3 length:(unint64_t)a4 events:(unint64_t)a5
{
  nstat_tcp_descriptor *p_descriptor;
  void *v9;
  char v10;

  if (a4 < 0x158)
    return 1;
  if (self->_eventFlags != a5)
  {
    self->_eventFlags = a5;
    p_descriptor = &self->_descriptor;
    goto LABEL_7;
  }
  if (memcmp(&self->_descriptor, a3, 0x158uLL))
  {
    p_descriptor = &self->_descriptor;
LABEL_7:
    memcpy(p_descriptor, a3, sizeof(nstat_tcp_descriptor));
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
  return -[NWSQUICSnapshot initWithCounts:QUICDescriptor:sourceIdent:events:seqno:provider:]([NWSQUICSnapshot alloc], "initWithCounts:QUICDescriptor:sourceIdent:events:seqno:provider:", -[NWStatisticsSource _nstat_counts](self, "_nstat_counts"), &self->_descriptor, -[NWStatisticsSource reference](self, "reference"), self->_eventFlags, -[NWStatisticsSource snapshotRevision](self, "snapshotRevision"), -[NWStatisticsSource provider](self, "provider"));
}

- (id)description
{
  _printf_domain *v3;
  void *v4;
  char *__ret;

  __ret = 0;
  v3 = (_printf_domain *)printf_domain();
  asxprintf(&__ret, v3, 0, "NWSQUICSource %N<->%N@%I", &self->_descriptor.local, &self->_descriptor.remote, self->_descriptor.ifindex);
  if (!__ret)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", __ret, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(__ret);
  return v4;
}

@end
