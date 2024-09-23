@implementation DTXBlockCompressorLibCompression

- (void)dealloc
{
  unint64_t *p_lz4ScratchBuffer;
  void *v4;
  void *v5;
  objc_super v6;

  p_lz4ScratchBuffer = &self->_lz4ScratchBuffer;
  v4 = (void *)atomic_load(&self->_lz4ScratchBuffer);
  if (v4)
  {
    free(v4);
    atomic_store(0, p_lz4ScratchBuffer);
  }
  v5 = (void *)atomic_load(&self->_lzfseScratchBuffer);
  if (v5)
  {
    free(v5);
    atomic_store(0, &self->_lzfseScratchBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)DTXBlockCompressorLibCompression;
  -[DTXBlockCompressorLibCompression dealloc](&v6, sel_dealloc);
}

- (unint64_t)compressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 ofLength:(unint64_t)a6 usingCompressionType:(int)a7 withFinalCompressionType:(int *)a8
{
  int v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  size_t total_out_low;
  int v19;
  compression_algorithm v22;
  int v23;
  void *v24;
  z_stream strm;

  if (!a8 || !a4 || !a3 || !a5 || !a6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(strm.next_in) = 0;
      _os_log_impl(&dword_21DC85000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "invalid args", (uint8_t *)&strm, 2u);
    }
    return 0;
  }
  if ((a7 - 5) > 1)
  {
    v19 = a7 - 3;
    if ((a7 - 3) <= 7 && ((0xF3u >> v19) & 1) != 0)
    {
      v22 = dword_21DCA2110[v19];
      v23 = dword_21DCA20F0[v19];
      v24 = sub_21DC86D84(self, v22);
      *a8 = v23;
      total_out_low = compression_encode_buffer((uint8_t *)a5, a6, (const uint8_t *)a3, a4, v24, v22);
      sub_21DC86E28(self, v22, v24);
      return total_out_low;
    }
    return 0;
  }
  if ((a6 | a4) >> 32)
    return 0;
  *a8 = a7;
  memset(&strm.opaque, 0, 32);
  if (a7 == 5)
    v13 = 1;
  else
    v13 = -1;
  memset(&strm, 0, 80);
  v14 = deflateInit_(&strm, v13, "1.2.12", 112);
  if ((_DWORD)v14)
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v15, (uint64_t)CFSTR("DTXMessageCompressionException"), CFSTR("defaultInit() failed with error %d"), v14);
  strm.avail_in = a4;
  strm.next_in = (Bytef *)a3;
  strm.avail_out = a6;
  strm.next_out = (Bytef *)a5;
  v16 = deflate(&strm, 4);
  if ((_DWORD)v16 == 1)
  {
    total_out_low = LODWORD(strm.total_out);
  }
  else
  {
    objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v17, (uint64_t)CFSTR("DTXMessageCompressionException"), CFSTR("deflate() returned unexpected result %d"), v16);
    total_out_low = 0;
  }
  deflateEnd(&strm);
  return total_out_low;
}

- (BOOL)uncompressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 withKnownUncompressedLength:(unint64_t)a6 usingCompressionType:(int)a7
{
  uint64_t v11;
  const char *v12;
  int v13;
  uLong total_out;
  BOOL v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  int v19;
  compression_algorithm v21;
  void *v22;
  size_t v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  uLong v32;
  z_stream strm;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a6 || !a4 || !a3 || !a5)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(strm.next_in) = 0;
    v16 = MEMORY[0x24BDACB70];
    v17 = "invalid args";
    v18 = 2;
LABEL_14:
    _os_log_impl(&dword_21DC85000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&strm, v18);
    return 0;
  }
  if ((a7 - 5) <= 1)
  {
    if (!((a6 | a4) >> 32))
    {
      memset(&strm, 0, sizeof(strm));
      v11 = inflateInit_(&strm, "1.2.12", 112);
      if ((_DWORD)v11)
        objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], v12, (uint64_t)CFSTR("DTXMessageCompressionException"), CFSTR("inflateInit() failed with error %d"), v11);
      strm.avail_in = a4;
      strm.next_in = (Bytef *)a3;
      strm.avail_out = a6;
      strm.next_out = (Bytef *)a5;
      v13 = inflate(&strm, 4);
      if (v13 == 1)
      {
        total_out = strm.total_out;
        if (strm.total_out == a6)
        {
          v15 = 1;
LABEL_25:
          inflateEnd(&strm);
          return v15;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          v30 = a6;
          v31 = 2048;
          v32 = total_out;
          v25 = MEMORY[0x24BDACB70];
          v26 = "inflate() returned unexpected uncompressed size, expected %u but was %lu";
          v27 = 18;
          goto LABEL_23;
        }
      }
      else
      {
        v24 = v13;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v30 = v24;
          v25 = MEMORY[0x24BDACB70];
          v26 = "inflate() returned unexpected result %d";
          v27 = 8;
LABEL_23:
          _os_log_impl(&dword_21DC85000, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
        }
      }
      v15 = 0;
      goto LABEL_25;
    }
    return 0;
  }
  v19 = a7 - 3;
  if ((a7 - 3) > 7 || ((0xF3u >> v19) & 1) == 0)
    return 0;
  v21 = dword_21DCA2110[v19];
  v22 = sub_21DC86D84(self, v21);
  v23 = compression_decode_buffer((uint8_t *)a5, a6, (const uint8_t *)a3, a4, v22, v21);
  sub_21DC86E28(self, v21, v22);
  if (v23 != a6)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 0;
    LODWORD(strm.next_in) = 134218240;
    *(Bytef **)((char *)&strm.next_in + 4) = (Bytef *)a6;
    *((_WORD *)&strm.avail_in + 2) = 2048;
    *(_QWORD *)((char *)&strm.avail_in + 6) = v23;
    v16 = MEMORY[0x24BDACB70];
    v17 = "decompression: expected decompressed size to be %zu bytes in length but was %zu instead, probable data corrupt"
          "ion - please file a bug report";
    v18 = 22;
    goto LABEL_14;
  }
  return 1;
}

@end
