@implementation OSLogEventDecomposedMessage

- (unint64_t)state
{
  return self->_messageState;
}

- (OSLogEventDecomposedMessage)initWithEventProxy:(id)a3
{
  OSLogEventDecomposedMessage *v4;
  OSLogEventDecomposedMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OSLogEventDecomposedMessage;
  v4 = -[OSLogEventDecomposedMessage init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_proxy = (OSLogEventProxy *)a3;
    -[OSLogEventDecomposedMessage _populateFields](v4, "_populateFields");
  }
  return v5;
}

- (void)_populateFields
{
  OSLogEventProxy *proxy;
  unint64_t unique_pid;
  unint64_t v5;
  char *buffer;
  uint64_t v7;
  os_log_fmt_hdr_s *hdr_buffer;
  uint64_t v9;
  char *v10;
  unsigned __int8 *var2;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char *v15;
  _BYTE *v16;
  const os_log_fmt_hdr_s *hdr;
  const os_log_fmt_hdr_s *pubdata;
  const char *message;
  unint64_t v21;
  unint64_t v22;

  if (self->_hasPopulatedFields)
    return;
  self->_hasPopulatedFields = 1;
  proxy = self->_proxy;
  if ((proxy->_efv & 3) == 1)
  {
    _resolve_uuid_slow((uint64_t)self->_proxy);
    proxy = self->_proxy;
  }
  if (!proxy->_eint.var0.activity_create.creator_aid && !proxy->_eint.common.message)
  {
LABEL_33:
    v5 = 2;
    goto LABEL_9;
  }
  self->_messageState = 0;
  unique_pid = proxy->_eint.var0.activity_create.unique_pid;
  if (unique_pid >> 16 || proxy->_eint.var0.log_message.privdata_sz >= 0x10000)
    goto LABEL_8;
  if (proxy->_eint.type == 768)
  {
    if (unique_pid - 1733 >= 0xFFFFFFFFFFFFF93CLL)
    {
      buffer = proxy->_eint.var0.log_message.buffer;
      v7 = buffer[unique_pid - 1];
      if ((_WORD)unique_pid + ~(_WORD)v7 + 2 * (_WORD)v7 != 0xFFFE)
      {
        hdr_buffer = (os_log_fmt_hdr_s *)self->_hdr_buffer;
        if (!hdr_buffer)
        {
          hdr_buffer = (os_log_fmt_hdr_s *)malloc_type_malloc(0x6C4uLL, 0x477AFD56uLL);
          self->_hdr_buffer = hdr_buffer;
          buffer = proxy->_eint.var0.log_message.buffer;
          unique_pid = proxy->_eint.var0.activity_create.unique_pid;
          v7 = buffer[unique_pid - 1];
        }
        hdr_buffer->var0 = 0;
        hdr_buffer->var1 = v7;
        if ((_DWORD)v7)
        {
          v9 = -v7;
          v10 = &buffer[unique_pid + ~v7];
          var2 = hdr_buffer->var2;
          v12 = (uint64_t)&buffer[unique_pid - 1];
          while (1)
          {
            v13 = *(_BYTE *)(v12 + v9);
            v14 = v13 & 0x3F;
            v15 = &buffer[v14];
            if (&buffer[v14] > v10)
              break;
            *var2 = 0;
            var2[1] = v14;
            v16 = var2 + 2;
            memcpy(var2 + 2, buffer, v13 & 0x3F);
            var2 = &v16[v14];
            buffer = v15;
            if (__CFADD__(v9++, 1))
              goto LABEL_21;
          }
          self->_hdr = 0;
          goto LABEL_8;
        }
LABEL_21:
        self->_hdr = hdr_buffer;
        goto LABEL_25;
      }
    }
LABEL_8:
    v5 = 1;
LABEL_9:
    self->_messageState = v5;
    return;
  }
  hdr = proxy->_eint.var0.log_message.hdr;
  if (hdr)
  {
    self->_hdr = hdr;
    self->_pubdata = proxy->_eint.var0.log_message.pubdata;
    self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
    goto LABEL_25;
  }
  pubdata = (const os_log_fmt_hdr_s *)os_log_fmt_extract_pubdata(proxy->_eint.var0.log_message.buffer, (unsigned __int16)proxy->_eint.var0.activity_create.unique_pid, &proxy->_eint.var0.timesync.continuous_time, &proxy->_eint.var0.log_message.pubdata_sz);
  proxy->_eint.var0.timesync.flags = (unint64_t)pubdata;
  self->_hdr = pubdata;
  self->_pubdata = proxy->_eint.var0.log_message.pubdata;
  self->_pubsize = proxy->_eint.var0.log_message.pubdata_sz;
  if (!pubdata)
    goto LABEL_8;
LABEL_25:
  message = proxy->_eint.common.message;
  if (!message)
  {
    message = _os_log_resolve_format((__n128 *)proxy->_eint.common.image_uuid, proxy->_eint.common.trace_id, proxy->_eint.common.format_offset, 0);
    proxy->_eint.common.message = (char *)message;
  }
  self->_fmt = message;
  self->_privdata = proxy->_eint.var0.log_message.privdata;
  self->_privsize = proxy->_eint.var0.log_message.privdata_sz;
  v21 = 1;
  if (proxy->_eint.type != 768)
    v21 = 2;
  self->_variant = v21;
  self->_placeholderCount = 0;
  if (!message)
    goto LABEL_33;
  v22 = 4;
  if ((proxy->_eint.common.opaque_flags & 1) == 0)
    v22 = 8;
  self->_sizeof_long = v22;
  -[OSLogEventDecomposedMessage _initializePlaceholders](self, "_initializePlaceholders");
}

- (void)_initializePlaceholders
{
  const char *fmt;
  const os_log_fmt_hdr_s *hdr;
  unint64_t v5;
  unsigned int v6;
  char *v7;
  os_log_fmt_raw_placeholder *rawPlaceholders;
  uint64_t v9;
  char *v10;
  char *v11;
  int8x8_t v12;
  unsigned __int16 v13;
  unsigned __int8 *v14;
  char data;
  os_log_fmt_raw_placeholder *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned __int16 var1;
  unsigned __int8 *var2;

  if (!self->_messageState)
  {
    if (!self->_rawPlaceholders)
      self->_rawPlaceholders = (os_log_fmt_raw_placeholder *)malloc_type_calloc(0x60uLL, 0x68uLL, 0x10D004083089DD7uLL);
    fmt = self->_fmt;
    hdr = self->_hdr;
    var2 = hdr->var2;
    var1 = hdr->var1;
    v18 = (hdr->var0 >> 5) & 3;
    v5 = 0;
    if (-[OSLogEventProxy _shouldIncludeSensitive](self->_proxy, "_shouldIncludeSensitive"))
      v6 = 3;
    else
      v6 = 1;
    do
    {
      v7 = (char *)&fmt[strcspn(fmt, "%")];
      if (!*v7)
        return;
      if (v7[1] != 37)
      {
        rawPlaceholders = self->_rawPlaceholders;
        v9 = (uint64_t)&rawPlaceholders->var1 + 104 * v5;
        v10 = os_log_fmt_delimit(v7, self->_variant, v9);
        if (v10)
        {
          if ((*(&rawPlaceholders->var1.var1 + 52 * v5) & 1) != 0)
          {
            self->_messageState = 3;
            return;
          }
          v11 = v10;
          ++self->_placeholderCount;
          os_log_fmt_read_aster_if_necessary(v9, &var1, &var2);
          v13 = var1;
          if (var1)
          {
            v14 = var2;
            v13 = --var1;
            var2 += var2[1] + 2;
          }
          else
          {
            v14 = 0;
          }
          data = os_log_fmt_get_data(v9, v18, v6, v14, v13, self->_sizeof_long, (unsigned __int8 **)self->_rawPlaceholders + 13 * v5, (_WORD *)&self->_rawPlaceholders[1].var0 + 52 * v5 + 1, v12, (BOOL *)&self->_rawPlaceholders[1].var1.var1 + 104 * v5, (uint64_t)self->_pubdata, self->_pubsize, (uint64_t)self->_privdata, self->_privsize);
          v16 = self->_rawPlaceholders;
          *((_BYTE *)&v16[1].var0 + 104 * v5) = data;
          if (v14)
          {
            *((_BYTE *)&v16[1].var0 + 104 * v5 + 1) = *v14 >> 4;
            if ((*v14 & 1) != 0)
            {
              v17 = 2;
LABEL_22:
              *((_QWORD *)&v16[1].var1.var0 + 13 * v5) = v17;
            }
            else if ((*v14 & 2) != 0)
            {
              v17 = 1;
              goto LABEL_22;
            }
          }
          fmt = &v11[(_QWORD)v7];
          ++v5;
          continue;
        }
        if (!v7[1])
          return;
      }
      fmt = v7 + 2;
    }
    while (v5 < 0x60);
  }
}

- (id)argumentAtIndex:(unint64_t)a3
{
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") <= a3)
    return 0;
  else
    return -[OSLogEventMessageArgument initWithProxy:index:]([OSLogEventMessageArgument alloc], "initWithProxy:index:", self, a3);
}

- (unint64_t)sizeOfLong
{
  return self->_sizeof_long;
}

- (os_log_fmt_raw_placeholder)_rawPlaceholderForIndex:(unsigned __int16)a3
{
  uint64_t v5;

  v5 = a3;
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount", a3, a4, a5) <= a3)
    return 0;
  else
    return (os_log_fmt_raw_placeholder *)((char *)self->_rawPlaceholders + 104 * v5);
}

- (id)placeholderAtIndex:(unint64_t)a3
{
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") > a3 && self->_rawPlaceholders)
    return -[OSLogMessagePlaceholder initWithPlaceholderStruct:]([OSLogMessagePlaceholder alloc], "initWithPlaceholderStruct:", (char *)&self->_rawPlaceholders->var1 + 104 * a3);
  else
    return 0;
}

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  os_log_fmt_raw_placeholder *rawPlaceholders;
  char **v7;
  const char *v8;
  int64_t v9;
  id v10;
  const char *fmt;

  if (self->_messageState || !self->_fmt)
    return 0;
  if (!(-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") | a3))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", self->_fmt, 4);
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") < a3 || !self->_rawPlaceholders)
    return 0;
  if (-[OSLogEventDecomposedMessage placeholderCount](self, "placeholderCount") > a3)
  {
    rawPlaceholders = self->_rawPlaceholders;
    v7 = &rawPlaceholders->var1.var0 + 13 * a3;
    if (a3)
    {
      v8 = (const char *)(*((_QWORD *)&rawPlaceholders[-1] + 13 * a3 - 2)
                        + *((unsigned __int16 *)&rawPlaceholders[-1] + 52 * a3 - 2));
      v9 = *v7 - v8;
      goto LABEL_13;
    }
    v9 = *v7 - self->_fmt;
    goto LABEL_17;
  }
  if (!a3)
  {
    v9 = strlen(self->_fmt);
LABEL_17:
    if (v9 >= 1)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      fmt = self->_fmt;
      return (id)objc_msgSend(v10, "initWithBytes:length:encoding:", fmt, v9, 4);
    }
    return 0;
  }
  v8 = (const char *)(*((_QWORD *)&self->_rawPlaceholders[-1] + 13 * a3 - 2)
                    + *((unsigned __int16 *)&self->_rawPlaceholders[-1] + 52 * a3 - 2));
  v9 = strlen(v8);
LABEL_13:
  if (v9 < 1)
    return 0;
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  fmt = v8;
  return (id)objc_msgSend(v10, "initWithBytes:length:encoding:", fmt, v9, 4);
}

- (unint64_t)placeholderCount
{
  if (self->_messageState)
    return 0;
  else
    return self->_placeholderCount;
}

- (void)_unmake
{
  self->_hasPopulatedFields = 0;
}

- (void)dealloc
{
  void *hdr_buffer;
  os_log_fmt_raw_placeholder *rawPlaceholders;
  objc_super v5;

  hdr_buffer = self->_hdr_buffer;
  if (hdr_buffer)
    free(hdr_buffer);
  rawPlaceholders = self->_rawPlaceholders;
  if (rawPlaceholders)
    free(rawPlaceholders);
  v5.receiver = self;
  v5.super_class = (Class)OSLogEventDecomposedMessage;
  -[OSLogEventDecomposedMessage dealloc](&v5, sel_dealloc);
}

- (OSLogEventProxy)proxy
{
  return self->_proxy;
}

@end
