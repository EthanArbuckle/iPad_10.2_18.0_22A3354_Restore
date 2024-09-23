@implementation OSLogEventProxy

- (NSString)subsystem
{
  if ((self->_eint.type | 0x200) == 0x600 && self->_eint.var0.log_message.subsystem)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    return 0;
}

- (timeval)unixDate
{
  return &self->_eint.common.tv_gmt;
}

- (int)processIdentifier
{
  return self->_eint.pid;
}

- (NSString)category
{
  if ((self->_eint.type | 0x200) == 0x600 && self->_eint.var0.log_message.category)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  else
    return 0;
}

- (timezone)unixTimeZone
{
  return &self->_eint.common.tz;
}

- (unint64_t)threadIdentifier
{
  return self->_eint.common.thread;
}

- (unint64_t)creatorProcessUniqueIdentifier
{
  if (self->_eint.type == 513)
    return self->_eint.var0.activity_create.unique_pid;
  else
    return 0;
}

- (unint64_t)signpostType
{
  if (self->_eint.type == 1536)
    return self->_eint.var0.log_message.signpost_type;
  else
    return 0;
}

- (unint64_t)signpostScope
{
  if (self->_eint.type == 1536)
    return self->_eint.var0.log_message.signpost_scope;
  else
    return 0;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  return self->_eint.common.timestamp * self->_eint.common.timebase.numer / self->_eint.common.timebase.denom;
}

- (unint64_t)signpostIdentifier
{
  if (self->_eint.type == 1536)
    return self->_eint.var0.log_message.signpost_id;
  else
    return 0;
}

- (NSUUID)processImageUUID
{
  if (self->_eint.proc_imageuuid)
    return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_eint.proc_imageuuid);
  else
    return 0;
}

- (NSUUID)senderImageUUID
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }
  if (self->_eint.common.image_uuid)
    return (NSUUID *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", self->_eint.common.image_uuid);
  else
    return 0;
}

- (NSUUID)bootUUID
{
  $50621B071C59F2DFF7E12E16168F5878 *event;
  unsigned int var0;
  id v5;
  $0A19AC97FB2BC9020DE6FF1FB943227E *p_var5;

  event = self->_event;
  if (!event)
    return 0;
  var0 = event->var0;
  if (var0 == 1 || var0 == 2)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
    p_var5 = &self->_event->var5;
    return (NSUUID *)(id)objc_msgSend(v5, "initWithUUIDBytes:", p_var5);
  }
  if (var0 != 3)
    return 0;
  v5 = objc_alloc(MEMORY[0x1E0CB3A28]);
  p_var5 = ($0A19AC97FB2BC9020DE6FF1FB943227E *)&self->_event->var5.var0.var0->var1.var10[128];
  return (NSUUID *)(id)objc_msgSend(v5, "initWithUUIDBytes:", p_var5);
}

- (OSLogEventDecomposedMessage)decomposedMessage
{
  unint64_t type;
  OSLogEventDecomposedMessage *decomposedMessage;

  type = self->_eint.type;
  if (type != 768 && type != 1536 && (type != 1024 || (self->_eint.common.opaque_flags & 2) != 0))
    return 0;
  decomposedMessage = self->_decomposedMessage;
  if (!decomposedMessage)
  {
    decomposedMessage = -[OSLogEventDecomposedMessage initWithEventProxy:]([OSLogEventDecomposedMessage alloc], "initWithEventProxy:", self);
    self->_decomposedMessage = decomposedMessage;
  }
  -[OSLogEventDecomposedMessage _populateFields](decomposedMessage, "_populateFields");
  return self->_decomposedMessage;
}

- (void)set_unreliableIdentifier:(BOOL)a3
{
  self->_unreliableIdentifier = a3;
}

- (BOOL)_shouldIncludeSensitive
{
  return self->_sensitive;
}

- (OSLogEventBacktrace)backtrace
{
  OSLogEventBacktrace *result;
  _WORD *pubdata;
  uint64_t v5;
  uint64_t v6;
  _WORD *v7;

  result = self->_backtrace;
  if (!result)
  {
    if ((self->_eint.type | 0x200) != 0x600 || !self->_eint.var0.log_message.has_context_data)
      goto LABEL_15;
    if (!self->_eint.var0.timesync.flags)
      self->_eint.var0.timesync.flags = (unint64_t)os_log_fmt_extract_pubdata(self->_eint.var0.log_message.buffer, LOWORD(self->_eint.var0.loss.start.tv_gmt.tv_sec), &self->_eint.var0.timesync.continuous_time, &self->_eint.var0.log_message.pubdata_sz);
    pubdata = self->_eint.var0.log_message.pubdata;
    if (pubdata
      && (*pubdata & 1) != 0
      && (v6 = self->_eint.var0.log_message.pubdata_sz - 2,
          v7 = pubdata + 1,
          (v5 = os_log_backtrace_create_from_buffer()) != 0))
    {
      self->_backtrace = -[OSLogEventBacktrace initWithBacktrace:]([OSLogEventBacktrace alloc], "initWithBacktrace:", v5, v6, v7);
      os_log_backtrace_destroy();
    }
    else
    {
LABEL_15:
      if (-[OSLogEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes", v6, v7))
      {
        result = -[OSLogEventBacktrace initWithSingleFrame:]([OSLogEventBacktrace alloc], "initWithSingleFrame:", -[OSLogEventBacktraceFrame initWithUUIDBytes:andOffset:]([OSLogEventBacktraceFrame alloc], "initWithUUIDBytes:andOffset:", -[OSLogEventProxy senderImageUUIDBytes](self, "senderImageUUIDBytes"), -[OSLogEventProxy senderImageOffset](self, "senderImageOffset")));
        self->_backtrace = result;
        return result;
      }
    }
    return self->_backtrace;
  }
  return result;
}

- (const)senderImageUUIDBytes
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }
  return self->_eint.common.image_uuid;
}

- (unint64_t)senderImageOffset
{
  if ((self->_efv & 3) == 1
    && self->_eint.type != 2560
    && (self->_eint.common.opaque_flags & 2) == 0
    && (*((_WORD *)self->_event->var5.var0.var3 + 1) & 6 | 8) == 0xC)
  {
    _resolve_uuid_slow((uint64_t)self);
  }
  return self->_eint.common.offset;
}

- (NSString)senderImagePath
{
  if ((self->_efv & 3) == 1)
    _resolve_uuid_slow((uint64_t)self);
  return self->_senderImagePath;
}

- (NSString)process
{
  return -[NSString lastPathComponent](-[OSLogEventProxy processImagePath](self, "processImagePath"), "lastPathComponent");
}

- (NSString)processImagePath
{
  if ((self->_efv & 3) == 1)
    _resolve_uuid_slow((uint64_t)self);
  return self->_processImagePath;
}

- (unint64_t)type
{
  return self->_eint.type;
}

- (void)_assertBalanced
{
  if (self->_retainCount)
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
}

- (BOOL)_setLogEvent:(id *)a3 rangeUUIDIndex:(unint64_t)a4 machTimebase:(mach_timebase_info *)a5
{
  $50621B071C59F2DFF7E12E16168F5878 *event;
  NSString *processImagePath;
  NSString *senderImagePath;
  OSLogEventBacktrace *backtrace;
  NSString *logMessage;
  OSLogEventDecomposedMessage *decomposedMessage;
  unsigned int var0;
  _firehose_unaligned_tracepoint_s *var3;
  _firehose_unaligned_chunk_s *var1;
  tracev3_chunk_s *v16;
  catalog_procinfo_s *v17;
  unsigned int var5;
  unsigned int var4;
  unsigned int v20;
  tracev3_chunk_s *v21;
  unint64_t v22;
  mach_timebase_info *v23;
  tracev3_chunk_s *v24;
  _os_timesync_db_s *v25;
  unint64_t v26;
  __darwin_time_t v27;
  int v28;
  unint64_t v29;
  unint64_t var2;
  _os_timesync_db_s *tsdb;
  unint64_t v32;
  tracev3_chunk_s *v33;
  unint64_t var6;
  mach_timebase_info *v35;
  tracev3_chunk_s *v36;
  _os_timesync_db_s *v37;
  unint64_t v38;
  __darwin_time_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  mach_timebase_info *v43;
  tracev3_chunk_s *v44;
  _os_timesync_db_s *v45;
  unint64_t v46;
  __darwin_time_t v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unsigned int v54;
  unint64_t v55;
  BOOL result;
  int v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t denom;
  uint64_t numer;
  unint64_t v65;
  unint64_t v66;
  tracev3_chunk_s *v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  $50621B071C59F2DFF7E12E16168F5878 *v73;
  uint64_t v74;
  uint64_t v75;
  objc_class *v76;
  uint64_t v77;

  event = a3;
  self->_uuidi = a4;
  self->_tracepoint_id = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s-%llu-%llu"), a3->var2, a3->var3, a3->var4);
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0;
  }
  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0;
  }
  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0;
  }
  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0;
  }
  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage)
    -[OSLogEventDecomposedMessage _unmake](decomposedMessage, "_unmake");
  *(_OWORD *)&self->_eint.type = 0u;
  *(_QWORD *)&self->_eint.statedump.ttl = 0;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 88) = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 104) = 0u;
  *(_OWORD *)&self->_eint.var0.loss.end.tz.tz_minuteswest = 0u;
  *(_OWORD *)(&self->_eint.var0.loss + 1) = 0u;
  *(_OWORD *)&self->_eint.var0.loss.start.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.end.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.sz = 0u;
  self->_eint.var0.loss.start.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.offset = 0u;
  *(_OWORD *)&self->_eint.common.opaque_flags = 0u;
  *(_OWORD *)&self->_eint.common.image_path = 0u;
  *(_OWORD *)&self->_eint.common.tv_gmt.tv_usec = 0u;
  *(_OWORD *)&self->_eint.common.thread = 0u;
  *(_OWORD *)&self->_eint.common.dsc_uuid = 0u;
  *(_OWORD *)&self->_eint.activity_id = 0u;
  *(_OWORD *)&self->_eint.common.trace_id = 0u;
  *(_OWORD *)&self->_eint.proc_id = 0u;
  *(_OWORD *)&self->_eint.proc_imageuuid = 0u;
  self->_event = event;
  self->_efv = 0;
  var0 = event->var0;
  if (event->var0 == 1)
  {
    self->_eint.var0.activity_create = *($4BF962EE7E2B2B120654451D05F5F741 *)&event->var5.var0.var0;
    self->_eint.type = 1280;
    self->_eint.var0.timesync.continuous_time = event->var5.var1.var1.var1;
    self->_eint.var0.timesync.wallclock_nsec = event->var5.var1.var1.var2;
    self->_eint.common.timestamp = event->var5.var1.var1.var1;
    self->_eint.common.timebase = *a5;
    self->_eint.common.tz = (timezone)event->var5.var0.var2.var2.iov_len;
    var2 = event->var5.var1.var1.var2;
    self->_eint.common.tv_gmt.tv_sec = var2 / 0x3B9ACA00;
    self->_eint.common.tv_gmt.tv_usec = var2 % 0x3B9ACA00 / 0x3E8;
LABEL_29:
    LOBYTE(logMessage) = 1;
    return logMessage & 1;
  }
  if (var0 == 2)
  {
    self->_eint.var0.activity_create = *($4BF962EE7E2B2B120654451D05F5F741 *)&event->var5.var0.var0;
    self->_eint.type = 1280;
    self->_eint.var0.timesync.flags = 1;
    self->_eint.var0.timesync.ttl = event->var5.var2.var1;
    self->_eint.common.timebase = *a5;
    if (event->var5.var2.var2)
      self->_eint.var0.timesync.flags = 3;
    tsdb = self->_tsdb;
    if (tsdb)
    {
      v32 = _timesync_continuous_to_wall_time((uint64_t)tsdb, &self->_eint.var0.activity_create.creator_aid, event->var1, &self->_eint.common.tz);
      self->_eint.common.tv_gmt.tv_sec = v32 / 0x3B9ACA00;
      self->_eint.common.tv_gmt.tv_usec = v32 % 0x3B9ACA00 / 0x3E8;
    }
    goto LABEL_29;
  }
  if (var0 != 3)
    return logMessage & 1;
  var3 = event->var5.var0.var3;
  var1 = event->var5.var0.var2.var1;
  v16 = event->var5.var0.var2.var0;
  v17 = event->var5.var0.var2.var3;
  if (v17)
  {
    var4 = v17->var4;
    var5 = v17->var5;
    self->_eint.pid = v17->var2;
    self->_eint.uid = var5;
    self->_eint.proc_id = v17->var3;
    self->_eint.pidversion = var4;
    self->_eint.proc_imageuuid = (char *)v17->var6;
    if ((v17->var1 & 1) != 0)
      self->_eint.common.opaque_flags = 1;
  }
  v20 = v16->var0.var0;
  if (v20 == 24580)
  {
    v33 = event->var5.var0.var2.var0;
    if (v33->var0.var0 == 24580 && !v33->var0.var1 && v33->var0.var2 >= 0x49)
    {
      self->_eint.type = 1024;
      self->_eint.common.opaque_flags = 2;
      self->_eint.activity_id = 0;
      var6 = v33->var1.var2.var6;
      v35 = (mach_timebase_info *)event->var5.var0.var0;
      self->_eint.common.timestamp = var6;
      self->_eint.common.timebase = v35[2];
      v36 = event->var5.var0.var0;
      v37 = self->_tsdb;
      if (v37)
      {
        v38 = _timesync_continuous_to_wall_time((uint64_t)v37, &v36->var1.var10[128], var6, &self->_eint.common.tz);
        v39 = v38 / 0x3B9ACA00;
        v40 = v38 % 0x3B9ACA00 / 0x3E8;
        event = self->_event;
        v41 = self->_efv | 1;
      }
      else
      {
        v39 = v36->var1.var0.var2;
        v40 = v36->var1.var0.var3;
        self->_eint.common.tz = self->_tz;
        v62 = v36->var1.var0.var8.var0;
        if (v62 != var6)
        {
          numer = v36->var1.var0.var0.numer;
          denom = v36->var1.var0.var0.denom;
          if (v62 >= var6)
          {
            v70 = (v62 - var6) * numer / denom;
            v39 -= v70 / 0x3B9ACA00;
            v40 -= v70 % 0x3B9ACA00 / 0x3E8;
            if (v40 < 0)
            {
              --v39;
              v40 += 1000000;
            }
          }
          else
          {
            v65 = (var6 - v62) * numer / denom;
            v39 += v65 / 0x3B9ACA00;
            v40 += v65 % 0x3B9ACA00 / 0x3E8;
            if (v40 > 999999)
            {
              ++v39;
              v40 -= 1000000;
            }
          }
        }
        v41 = 1;
      }
      self->_eint.common.tv_gmt.tv_sec = v39;
      *(_QWORD *)&self->_eint.common.tv_gmt.tv_usec = v40;
      self->_eint.common.dsc_uuid = (char *)v33->var1.var9.var9;
      self->_eint.common.image_uuid = (char *)&v33->var1.var8.var6[8];
      v71 = v33->var1.var8.var5;
      self->_eint.common.offset = v33->var1.var9.var7;
      self->_eint.common.thread = v71;
      self->_efv = v41;
      self->_eint.var0.log_message.ttl = v33->var1.var3.var2;
      v72 = _simple_support_validate_payload((uint64_t)event->var5.var0.var2.var0, &self->_eint.common.sz);
      self->_eint.common.trace_id = (unint64_t)v33->var1.var3.var3[0] << 8;
      v73 = self->_event;
      v74 = (uint64_t)v73->var5.var0.var2.var0;
      if (*(_DWORD *)v74 != 24580)
        goto LABEL_81;
      if (!*(_DWORD *)(v74 + 4)
        && *(_QWORD *)(v74 + 8) >= 0x49uLL
        && (v75 = _simple_support_validate_payload(v74, 0)) != 0
        && *(_DWORD *)(v75 + 4))
      {
        self->_eint.var0.log_message.subsystem = (char *)(v75 + 12);
        v76 = (objc_class *)&_CTF_NULLSTR;
        v77 = 256;
      }
      else
      {
LABEL_81:
        v76 = 0;
        v77 = 248;
      }
      *(Class *)((char *)&self->super.isa + v77) = v76;
      if (v72)
      {
        logMessage = (NSString *)v73->var5.var0.var2.var3;
        goto LABEL_84;
      }
    }
LABEL_85:
    LOBYTE(logMessage) = 0;
    return logMessage & 1;
  }
  if (v20 == 24579)
  {
    v21 = event->var5.var0.var2.var0;
    if (v21->var0.var0 == 24579 && !v21->var0.var1 && v21->var0.var2 >= 0x31)
    {
      self->_eint.type = 2560;
      v22 = v21->var1.var2.var6;
      self->_eint.activity_id = v21->var1.var8.var5;
      v23 = (mach_timebase_info *)event->var5.var0.var0;
      self->_eint.common.timestamp = v22;
      self->_eint.common.timebase = v23[2];
      v24 = event->var5.var0.var0;
      v25 = self->_tsdb;
      if (v25)
      {
        v26 = _timesync_continuous_to_wall_time((uint64_t)v25, &v24->var1.var10[128], v22, &self->_eint.common.tz);
        v27 = v26 / 0x3B9ACA00;
        v28 = v26 % 0x3B9ACA00 / 0x3E8;
        event = self->_event;
        v29 = self->_efv | 1;
      }
      else
      {
        v27 = v24->var1.var0.var2;
        v28 = v24->var1.var0.var3;
        self->_eint.common.tz = self->_tz;
        v58 = v24->var1.var0.var8.var0;
        if (v58 != v22)
        {
          v60 = v24->var1.var0.var0.numer;
          v59 = v24->var1.var0.var0.denom;
          if (v58 >= v22)
          {
            v66 = (v58 - v22) * v60 / v59;
            v27 -= v66 / 0x3B9ACA00;
            v28 -= v66 % 0x3B9ACA00 / 0x3E8;
            if (v28 < 0)
            {
              --v27;
              v28 += 1000000;
            }
          }
          else
          {
            v61 = (v22 - v58) * v60 / v59;
            v27 += v61 / 0x3B9ACA00;
            v28 += v61 % 0x3B9ACA00 / 0x3E8;
            if (v28 > 999999)
            {
              ++v27;
              v28 -= 1000000;
            }
          }
        }
        v29 = 1;
      }
      self->_eint.common.tv_gmt.tv_sec = v27;
      *(_QWORD *)&self->_eint.common.tv_gmt.tv_usec = v28;
      self->_eint.common.image_uuid = (char *)v21->var1.var8.var6;
      self->_efv = v29;
      self->_eint.statedump.ttl = v21->var1.var3.var2;
      v67 = event->var5.var0.var2.var0;
      v68 = v67->var0.var2;
      if (v68 - 48 >= 0xC8)
      {
        v69 = *(unsigned int *)&v67->var1.var10[52];
        if (v68 - 248 >= v69)
        {
          self->_eint.common.sz = v69;
          logMessage = (NSString *)event->var5.var0.var2.var3;
LABEL_84:
          LOBYTE(logMessage) = logMessage != 0;
          return logMessage & 1;
        }
      }
    }
    goto LABEL_85;
  }
  v42 = (*((_QWORD *)var3 + 2) & 0xFFFFFFFFFFFFLL) + *((_QWORD *)var1 + 1);
  v43 = (mach_timebase_info *)event->var5.var0.var0;
  self->_eint.common.timestamp = v42;
  self->_eint.common.timebase = v43[2];
  v44 = event->var5.var0.var0;
  v45 = self->_tsdb;
  if (v45)
  {
    v46 = _timesync_continuous_to_wall_time((uint64_t)v45, &v44->var1.var10[128], v42, &self->_eint.common.tz);
    v47 = v46 / 0x3B9ACA00;
    v48 = v46 % 0x3B9ACA00 / 0x3E8;
  }
  else
  {
    v47 = v44->var1.var0.var2;
    v48 = v44->var1.var0.var3;
    self->_eint.common.tz = self->_tz;
    v49 = v44->var1.var0.var8.var0;
    if (v49 != v42)
    {
      v51 = v44->var1.var0.var0.numer;
      v50 = v44->var1.var0.var0.denom;
      if (v49 >= v42)
      {
        v53 = (v49 - v42) * v51 / v50;
        v47 -= v53 / 0x3B9ACA00;
        v48 -= v53 % 0x3B9ACA00 / 0x3E8;
        if (v48 < 0)
        {
          --v47;
          v48 += 1000000;
        }
      }
      else
      {
        v52 = (v42 - v49) * v51 / v50;
        v47 += v52 / 0x3B9ACA00;
        v48 += v52 % 0x3B9ACA00 / 0x3E8;
        if (v48 > 999999)
        {
          ++v47;
          v48 -= 1000000;
        }
      }
    }
  }
  self->_eint.common.tv_gmt.tv_sec = v47;
  *(_QWORD *)&self->_eint.common.tv_gmt.tv_usec = v48;
  self->_eint.common.sz = *((unsigned __int16 *)var3 + 11);
  self->_eint.common.trace_id = *(_QWORD *)var3;
  self->_eint.common.thread = *((_QWORD *)var3 + 1);
  v54 = *(_QWORD *)var3;
  if (v54 <= 6 && ((1 << v54) & 0x58) != 0)
    v55 = (unint64_t)*(_QWORD *)var3 << 8;
  else
    v55 = bswap32(*(_QWORD *)var3) >> 16;
  self->_eint.type = v55;
  if (!v17)
    goto LABEL_85;
  LOBYTE(logMessage) = 0;
  switch(*(_BYTE *)var3)
  {
    case 2:
      v57 = *((unsigned __int8 *)var3 + 1);
      switch(v57)
      {
        case 1:
          result = _parse_activity_create((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        case 3:
          result = _parse_activity_useraction((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        case 2:
          result = _parse_activity_swap((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
        default:
LABEL_49:
          result = _parse_log_message((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
          break;
      }
      break;
    case 3:
      return _parse_trace((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
    case 4:
    case 6:
      goto LABEL_49;
    case 7:
      return _parse_loss((uint64_t)self, (uint64_t)self->_event->var5.var0.var3);
    default:
      return logMessage & 1;
  }
  return result;
}

- (void)release
{
  unint64_t thread;

  thread = self->_thread;
  if (!thread)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _thread is not set on OSLogEventProxy";
    qword_1EE52EA88 = 0;
    __break(1u);
LABEL_5:
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }
  if (thread != *(_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)))
    goto LABEL_5;
  --self->_retainCount;
}

- (OSLogEventProxy)retain
{
  unint64_t thread;

  thread = self->_thread;
  if (!thread)
  {
    qword_1EE52EA58 = (uint64_t)"BUG IN LIBTRACE: _thread is not set on OSLogEventProxy";
    qword_1EE52EA88 = 0;
    __break(1u);
LABEL_5:
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  }
  if (thread != *(_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)))
    goto LABEL_5;
  ++self->_retainCount;
  return self;
}

- (unint64_t)machContinuousTimestamp
{
  return self->_eint.common.timestamp;
}

- (unint64_t)_timesyncRangeUUIDIndex
{
  return self->_uuidi;
}

- (NSString)signpostName
{
  void *v3;
  char *v5;

  if (self->_eint.type != 1536)
    return 0;
  if ((self->_efv & 3) == 1)
    _resolve_uuid_slow((uint64_t)self);
  if (self->_eint.var0.log_message.signpost_name)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    return (NSString *)objc_msgSend(v3, "stringWithUTF8String:");
  }
  if (!self->_eint.common.message)
    return 0;
  v5 = strchr(self->_eint.common.message, 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (!v5)
    return (NSString *)objc_msgSend(v3, "stringWithUTF8String:");
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", self->_eint.common.message, v5 - self->_eint.common.message, 4);
}

- (NSString)composedMessage
{
  NSString *result;
  int64_t type;
  os_log_fmt_hdr_s *hdr;
  char *v6;
  NSString *v7;
  unsigned int count;
  const char *v9;
  void *v10;
  char *v11;
  unsigned int ttl;
  const char *v13;
  const char *v14;
  char *v15;
  char out[40];
  char __str[256];
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x1E0C80C00];
  type = self->_eint.type;
  if (type <= 1023)
  {
    if (type > 514)
    {
      if (type != 515)
      {
        if (type != 768)
          return result;
        goto LABEL_18;
      }
    }
    else if (type != 513)
    {
      if (type == 514)
        return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transition to 0x%llx"), self->_eint.var0.activity_create.creator_aid & 0xFFFFFFFFFFFFFFLL);
      return result;
    }
    if ((self->_efv & 3) == 1)
      _resolve_uuid_slow((uint64_t)self);
    if (self->_eint.common.message)
      return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    return 0;
  }
  if (type <= 1535)
  {
    if (type == 1024)
    {
LABEL_18:
      result = self->_logMessage;
      if (!result)
        return (NSString *)_compose_log_message((uint64_t)self);
      return result;
    }
    if (type != 1280)
      return result;
    hdr = self->_eint.var0.log_message.hdr;
    if ((hdr & 1) == 0)
    {
      if (self->_eint.var0.timesync.continuous_time)
      {
        v6 = "=== system wallclock time adjusted";
LABEL_41:
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = v6;
        return (NSString *)objc_msgSend(v10, "stringWithUTF8String:", v11);
      }
      memset(out, 0, 37);
      uuid_unparse_upper((const unsigned __int8 *)&self->_eint.var0, out);
      v15 = out;
      v14 = "=== system boot: %s";
LABEL_40:
      v6 = __str;
      snprintf(__str, 0x80uLL, v14, v15);
      goto LABEL_41;
    }
    if ((hdr & 2) == 0)
    {
      ttl = self->_eint.var0.timesync.ttl;
      if (ttl <= 6)
      {
        if (ttl == 1)
        {
          v13 = "TTL less than 1 day";
          goto LABEL_38;
        }
        if (ttl == 3)
        {
          v13 = "TTL less than 3 days";
          goto LABEL_38;
        }
      }
      else
      {
        switch(ttl)
        {
          case 7u:
            v13 = "TTL less than 7 days";
            goto LABEL_38;
          case 0xEu:
            v13 = "TTL less than 14 days";
            goto LABEL_38;
          case 0x1Eu:
            v13 = "TTL more than 14 days";
LABEL_38:
            v15 = (char *)v13;
            v14 = "=== log class: %s begins";
            goto LABEL_40;
        }
      }
      v13 = "persist";
      goto LABEL_38;
    }
    v13 = "in-memory";
    goto LABEL_38;
  }
  if (type != 2560)
  {
    if (type != 1792)
    {
      if (type != 1536)
        return result;
      goto LABEL_18;
    }
    count = self->_eint.var0.loss.count;
    v9 = (const char *)&_CTF_NULLSTR;
    if (count == 63)
      v9 = ">=";
    snprintf(__str, 0x100uLL, "lost %s%u unreliable messages from %llu-%llu (Mach continuous exact start-approx. end)", v9, count, self->_eint.var0.activity_create.creator_aid, self->_eint.var0.timesync.wallclock_nsec);
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = __str;
    return (NSString *)objc_msgSend(v10, "stringWithUTF8String:", v11);
  }
  result = (NSString *)_state_support_create_message((uint64_t)self->_event->var5.var0.var2.var0, &self->_eint.statedump.message_size);
  if (result)
  {
    v7 = result;
    result = (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, strlen((const char *)v7), 4, 1);
    if (!result)
    {
      free(v7);
      return 0;
    }
  }
  return result;
}

- (void)_unmake
{
  NSString *processImagePath;
  NSString *senderImagePath;
  OSLogEventBacktrace *backtrace;
  NSString *logMessage;
  OSLogEventDecomposedMessage *decomposedMessage;

  if (self->_retainCount)
    __LOGEVENTPROXY_RETAINED_OUTSIDE_OF_ITERATION__();
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0;
  }
  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0;
  }
  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0;
  }
  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0;
  }
  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage)
  {

    self->_decomposedMessage = 0;
  }
  _os_activity_map_destroy((uint64_t)self->_aid_map);
  NSDeallocateObject(self);
}

- (void)_setUUIDDBFileDescriptor:(int)a3
{
  self->_uuiddbfd = a3;
}

- (void)_setTimesyncDatabase:(_os_timesync_db_s *)a3
{
  self->_tsdb = a3;
}

- (void)_setIncludeSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (void)_setDoNotTrackActivites:(BOOL)a3
{
  self->_trackActivities = !a3;
}

+ (id)_make
{
  id result;

  result = NSAllocateObject((Class)a1, 0, 0);
  *((_QWORD *)result + 46) = *(_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  *((_QWORD *)result + 47) = 0;
  *((_BYTE *)result + 365) = 1;
  *((_BYTE *)result + 424) = 0;
  *((_QWORD *)result + 39) = 0;
  *(_OWORD *)((char *)result + 248) = 0u;
  *(_OWORD *)((char *)result + 232) = 0u;
  *(_OWORD *)((char *)result + 216) = 0u;
  *(_OWORD *)((char *)result + 200) = 0u;
  *(_OWORD *)((char *)result + 184) = 0u;
  *(_OWORD *)((char *)result + 168) = 0u;
  *(_OWORD *)((char *)result + 152) = 0u;
  *(_OWORD *)((char *)result + 136) = 0u;
  *(_OWORD *)((char *)result + 120) = 0u;
  *(_OWORD *)((char *)result + 104) = 0u;
  *(_OWORD *)((char *)result + 88) = 0u;
  *(_OWORD *)((char *)result + 72) = 0u;
  *(_OWORD *)((char *)result + 56) = 0u;
  *(_OWORD *)((char *)result + 40) = 0u;
  *(_OWORD *)((char *)result + 24) = 0u;
  *((_QWORD *)result + 55) = 0;
  *(_OWORD *)((char *)result + 8) = 0u;
  *(_OWORD *)((char *)result + 280) = 0u;
  *(_OWORD *)((char *)result + 296) = 0u;
  *(_OWORD *)((char *)result + 264) = 0u;
  return result;
}

- (OSLogEventProxy)init
{
  qword_1EE52EA58 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OSLogEventProxy should not be created";
  __break(1u);
  return self;
}

- (void)_setThreadCrumb
{
  self->_thread = *(_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
}

- (void)_setFallbackTimezone
{
  int tm_isdst;
  unint64_t v4;
  tm v5;
  time_t v6;

  v6 = time(0);
  memset(&v5, 0, sizeof(v5));
  localtime_r(&v6, &v5);
  tm_isdst = v5.tm_isdst;
  self->_tz.tz_dsttime = v5.tm_isdst;
  v4 = ((unsigned __int128)(v5.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v5.tm_gmtoff;
  self->_tz.tz_minuteswest = (v4 >> 5) + (v4 >> 63) + 60 * tm_isdst;
}

- (void)_setBuffer:(const void *)a3 size:(unint64_t)a4 privateBuffer:(const void *)a5 privateSize:(unint64_t)a6
{
  if (self->_eint.var0.timesync.flags)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    self->_eint.var0.activity_create.creator_aid = (unint64_t)a3;
    self->_eint.var0.activity_create.unique_pid = a4;
    self->_eint.var0.loss.end.tv_gmt.tv_sec = (__darwin_time_t)a5;
    self->_eint.var0.log_message.privdata_sz = a6;
    self->_eint.common.sz += a6 + a4;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  NSString *v3;

  v3 = NSStringFromSelector(a3);
  NSLog(CFSTR("%@"), v3);
  return 0;
}

- (void)_fillFromXPCEventObject:(id)a3
{
  NSString *processImagePath;
  NSString *senderImagePath;
  OSLogEventBacktrace *backtrace;
  NSString *logMessage;
  OSLogEventDecomposedMessage *decomposedMessage;
  $DA4C1B646FE8418CD340FF29DC0114B3 *p_eint;
  char *string;
  char *proc_imageuuid;
  uint64_t uint64;
  int v14;
  char **p_image_uuid;
  char **p_image_path;
  char *v17;
  char *v18;
  __n128 *v19;
  uint64_t type;

  if (_fillFromXPCEventObject__onceToken != -1)
    dispatch_once(&_fillFromXPCEventObject__onceToken, &__block_literal_global_207);
  processImagePath = self->_processImagePath;
  if (processImagePath)
  {

    self->_processImagePath = 0;
  }
  senderImagePath = self->_senderImagePath;
  if (senderImagePath)
  {

    self->_senderImagePath = 0;
  }
  backtrace = self->_backtrace;
  if (backtrace)
  {

    self->_backtrace = 0;
  }
  logMessage = self->_logMessage;
  if (logMessage)
  {

    self->_logMessage = 0;
  }
  decomposedMessage = self->_decomposedMessage;
  if (decomposedMessage)
    -[OSLogEventDecomposedMessage _unmake](decomposedMessage, "_unmake");
  *(_OWORD *)&self->_eint.type = 0u;
  p_eint = &self->_eint;
  *(_QWORD *)&self->_eint.statedump.ttl = 0;
  *(_OWORD *)&self->_eint.var0.loss.end.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.end.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.var0.loss.start.tz.tz_minuteswest = 0u;
  self->_eint.var0.loss.start.tv_gmt = 0u;
  *(_OWORD *)&self->_eint.common.sz = 0u;
  *(_OWORD *)&self->_eint.common.opaque_flags = 0u;
  *(_OWORD *)&self->_eint.common.offset = 0u;
  *(_OWORD *)&self->_eint.common.tv_gmt.tv_usec = 0u;
  *(_OWORD *)&self->_eint.common.image_path = 0u;
  *(_OWORD *)&self->_eint.common.dsc_uuid = 0u;
  *(_OWORD *)&self->_eint.common.thread = 0u;
  *(_OWORD *)&self->_eint.common.trace_id = 0u;
  *(_OWORD *)&self->_eint.activity_id = 0u;
  *(_OWORD *)&self->_eint.proc_imageuuid = 0u;
  *(_OWORD *)&self->_eint.proc_id = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 88) = 0u;
  *(_OWORD *)((char *)&self->_eint.var0.loss + 104) = 0u;
  *(_OWORD *)(&self->_eint.var0.loss + 1) = 0u;
  self->_event = 0;
  self->_efv = 0;
  self->_eint.pid = xpc_dictionary_get_uint64(a3, "pid");
  self->_eint.proc_id = xpc_dictionary_get_uint64(a3, "procid");
  self->_eint.uid = xpc_dictionary_get_uint64(a3, "uid");
  self->_eint.proc_imageuuid = (char *)xpc_dictionary_get_uuid(a3, "procuuid");
  string = (char *)xpc_dictionary_get_string(a3, "procpath");
  self->_eint.proc_imagepath = string;
  if (!string)
  {
    proc_imageuuid = self->_eint.proc_imageuuid;
    if (proc_imageuuid)
      uuidpath_lookup_fd(-3, proc_imageuuid, &self->_eint.proc_imagepath);
  }
  self->_eint.activity_id = xpc_dictionary_get_uint64(a3, "aid");
  self->_eint.parent_id = xpc_dictionary_get_uint64(a3, "paid");
  self->_eint.type = xpc_dictionary_get_uint64(a3, "type");
  self->_eint.common.tz.tz_dsttime = xpc_dictionary_get_int64(a3, "timezoneDSTflag");
  self->_eint.common.tz.tz_minuteswest = xpc_dictionary_get_int64(a3, "timezoneMinutesWest");
  self->_eint.common.tv_gmt.tv_sec = xpc_dictionary_get_int64(a3, "timeGMTsec");
  self->_eint.common.tv_gmt.tv_usec = xpc_dictionary_get_int64(a3, "timeGMTusec");
  if (xpc_dictionary_get_BOOL(a3, "32bits"))
    self->_eint.common.opaque_flags = 1;
  uint64 = xpc_dictionary_get_uint64(a3, "traceid");
  v14 = uint64;
  self->_eint.common.trace_id = uint64;
  self->_eint.common.thread = xpc_dictionary_get_uint64(a3, "thread");
  self->_eint.common.timestamp = xpc_dictionary_get_uint64(a3, "timestamp");
  self->_eint.common.offset = xpc_dictionary_get_uint64(a3, "offset");
  self->_eint.common.format_offset = xpc_dictionary_get_uint64(a3, "formatoffset");
  self->_eint.common.image_uuid = (char *)xpc_dictionary_get_uuid(a3, "imageuuid");
  p_image_uuid = &self->_eint.common.image_uuid;
  self->_eint.common.image_path = (char *)xpc_dictionary_get_string(a3, "imagepath");
  p_image_path = &self->_eint.common.image_path;
  self->_eint.common.timebase = (mach_timebase_info)_fillFromXPCEventObject__timebase;
  v17 = (char *)xpc_dictionary_get_string(a3, "formatstring");
  self->_eint.common.message = v17;
  if (!v17 && (v18 = (char *)xpc_dictionary_get_string(a3, "name"), (self->_eint.common.message = v18) == 0)
    || !*p_image_path)
  {
    v19 = (__n128 *)*p_image_uuid;
    if (*p_image_uuid)
    {
      if ((BYTE2(v14) & 6 | 8) == 0xC)
        uuidpath_sharedcache_resolve_fd(0xFFFFFFFFLL, v19, self->_eint.common.format_offset, self->_eint.common.offset, 0, (const char **)&self->_eint.common.message, 0, &self->_eint.common.image_uuid, (unint64_t)&self->_eint.common.image_path, 0, 0);
      else
        uuidpath_resolve(0, v19, self->_eint.common.format_offset, 0, (const char **)&self->_eint.common.message, 0, &self->_eint.common.image_path, 0);
    }
  }
  type = p_eint->type;
  if ((uint64_t)p_eint->type > 1023)
  {
    if (type != 1024)
    {
      if (type != 1536)
        goto LABEL_36;
      self->_eint.var0.log_message.signpost_id = xpc_dictionary_get_uint64(a3, "signpostid");
      self->_eint.var0.log_message.signpost_name = (char *)xpc_dictionary_get_string(a3, "signpostname");
      self->_eint.var0.log_message.signpost_type = BYTE1(v14) & 0x3F;
      self->_eint.var0.log_message.signpost_scope = BYTE1(v14) & 0xC0;
    }
    if ((self->_eint.common.opaque_flags & 2) == 0)
    {
      self->_eint.var0.activity_create.creator_aid = (unint64_t)xpc_dictionary_get_data(a3, "buffer", &self->_eint.var0.activity_create.unique_pid);
      self->_eint.var0.loss.end.tv_gmt.tv_sec = (__darwin_time_t)xpc_dictionary_get_data(a3, "privdata", &self->_eint.var0.log_message.privdata_sz);
      self->_eint.var0.log_message.category = (char *)xpc_dictionary_get_string(a3, "category");
      self->_eint.var0.log_message.subsystem = (char *)xpc_dictionary_get_string(a3, "subsystem");
      self->_eint.var0.log_message.persisted = xpc_dictionary_get_BOOL(a3, "persisted");
      if ((v14 & 0x10000000) != 0)
        self->_eint.var0.log_message.has_context_data = 1;
    }
  }
  else if (type == 515)
  {
    self->_eint.var0.useraction.persisted = xpc_dictionary_get_BOOL(a3, "persisted");
  }
  else if (type == 768)
  {
    xpc_dictionary_get_value(a3, "payload");
    self->_eint.var0.activity_create.creator_aid = (unint64_t)xpc_dictionary_get_data(a3, "buffer", &self->_eint.var0.activity_create.unique_pid);
  }
LABEL_36:
  if (self->_eint.proc_imagepath)
    self->_processImagePath = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  if (*p_image_path)
    self->_senderImagePath = (NSString *)(id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %p, %02x, %d, %s>"), NSStringFromClass(v4), self, self->_event, self->_eint.type, self->_eint.pid, self->_eint.common.message);
}

- (unsigned)_oversizeIdentifier
{
  return self->_eint.var0.log_message.oversize_id;
}

- (unint64_t)logType
{
  unint64_t type;
  $50621B071C59F2DFF7E12E16168F5878 *event;

  type = self->_eint.type;
  if (type != 1024 && type != 768)
    return 0;
  event = self->_event;
  if (!event || (self->_eint.common.opaque_flags & 2) != 0)
    return BYTE1(self->_eint.common.trace_id);
  else
    return *((unsigned __int8 *)event->var5.var0.var3 + 1);
}

- (unint64_t)size
{
  return self->_eint.common.sz;
}

- (unint64_t)traceIdentifier
{
  return self->_eint.common.trace_id;
}

- (unint64_t)timeToLive
{
  unint64_t v2;
  __int128 v3;

  *((_QWORD *)&v3 + 1) = self->_eint.type;
  *(_QWORD *)&v3 = *((_QWORD *)&v3 + 1) - 768;
  v2 = v3 >> 8;
  if (v2 >= 2)
  {
    if (v2 == 7)
      return self->_eint.statedump.ttl;
    if (v2 != 3)
      return 0;
  }
  return self->_eint.var0.log_message.ttl;
}

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)self->_eint.common.tv_gmt.tv_usec / 1000000.0 + (double)self->_eint.common.tv_gmt.tv_sec);
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 3600 * self->_eint.common.tz.tz_dsttime + -60 * self->_eint.common.tz.tz_minuteswest);
}

- (unsigned)processIdentifierVersion
{
  return self->_eint.pidversion;
}

- (unsigned)userIdentifier
{
  return self->_eint.uid;
}

- (unint64_t)activityIdentifier
{
  return self->_eint.activity_id & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)parentActivityIdentifier
{
  return self->_eint.parent_id & 0xFFFFFFFFFFFFFFLL;
}

- (unint64_t)transitionActivityIdentifier
{
  if (self->_eint.type == 514)
    return self->_eint.var0.activity_create.creator_aid & 0xFFFFFFFFFFFFFFLL;
  else
    return 0;
}

- (unint64_t)processUniqueIdentifier
{
  return self->_eint.proc_id;
}

- (const)processImageUUIDBytes
{
  return self->_eint.proc_imageuuid;
}

- (NSString)sender
{
  return -[NSString lastPathComponent](-[OSLogEventProxy senderImagePath](self, "senderImagePath"), "lastPathComponent");
}

- (NSString)formatString
{
  unint64_t type;
  void *v4;
  char *message;

  type = self->_eint.type;
  if (type == 768)
  {
LABEL_8:
    if ((self->_efv & 3) == 1)
      _resolve_uuid_slow((uint64_t)self);
    if (self->_eint.common.message)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      return (NSString *)objc_msgSend(v4, "stringWithUTF8String:");
    }
    return 0;
  }
  if (type == 1024)
    goto LABEL_7;
  if (type != 1536)
    return 0;
  if ((self->_efv & 3) == 1)
    _resolve_uuid_slow((uint64_t)self);
  if (self->_eint.var0.log_message.signpost_name)
  {
LABEL_7:
    if ((self->_eint.common.opaque_flags & 2) != 0)
      return 0;
    goto LABEL_8;
  }
  message = self->_eint.common.message;
  if (message)
  {
    strchr(message, 32);
    v4 = (void *)MEMORY[0x1E0CB3940];
    return (NSString *)objc_msgSend(v4, "stringWithUTF8String:");
  }
  return 0;
}

- (unint64_t)creatorActivityIdentifier
{
  if (self->_eint.type == 513)
    return self->_eint.var0.activity_create.creator_aid;
  else
    return 0;
}

- (unint64_t)lossStartMachContinuousTimestamp
{
  if (self->_eint.type == 1792)
    return self->_eint.var0.activity_create.creator_aid;
  else
    return 0;
}

- (timeval)lossStartUnixDate
{
  if (self->_eint.type == 1792)
    return &self->_eint.var0.loss.start.tv_gmt;
  else
    return 0;
}

- (timezone)lossStartUnixTimeZone
{
  if (self->_eint.type == 1792)
    return &self->_eint.var0.loss.start.tz;
  else
    return 0;
}

- (unint64_t)lossEndMachContinuousTimestamp
{
  if (self->_eint.type == 1792)
    return self->_eint.var0.timesync.wallclock_nsec;
  else
    return 0;
}

- (timeval)lossEndUnixDate
{
  if (self->_eint.type == 1792)
    return &self->_eint.var0.loss.end.tv_gmt;
  else
    return 0;
}

- (timezone)lossEndUnixTimeZone
{
  if (self->_eint.type == 1792)
    return &self->_eint.var0.loss.end.tz;
  else
    return 0;
}

- ($8814E4F230000EB768D7E307C62B5F7C)lossCount
{
  if (self->_eint.type == 1792)
    return ($8814E4F230000EB768D7E307C62B5F7C)(self->_eint.var0.loss.count | ((unint64_t)(self->_eint.var0.loss.count == 63) << 32));
  else
    return ($8814E4F230000EB768D7E307C62B5F7C)0;
}

- (void)set_timesyncRangeUUIDIndex:(unint64_t)a3
{
  self->_uuidi = a3;
}

- (NSString)_tracepoint_id
{
  return self->_tracepoint_id;
}

- (void)set_tracepoint_id:(id)a3
{
  self->_tracepoint_id = (NSString *)a3;
}

- (BOOL)_unreliableIdentifier
{
  return self->_unreliableIdentifier;
}

uint64_t __43__OSLogEventProxy__fillFromXPCEventObject___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_fillFromXPCEventObject__timebase);
}

@end
