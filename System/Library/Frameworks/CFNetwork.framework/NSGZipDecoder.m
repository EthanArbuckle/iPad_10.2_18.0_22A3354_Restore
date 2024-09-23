@implementation NSGZipDecoder

- (NSGZipDecoder)init
{
  char *v2;
  compression_status v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSGZipDecoder;
  v2 = -[NSGZipDecoder init](&v5, sel_init);
  v3 = compression_stream_init((compression_stream *)(v2 + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB);
  if (v3)
  {
    NSLog(CFSTR("failed to initialize compression, error %ld"), v3);

    return 0;
  }
  else
  {
    v2[67] = 0;
    v2[64] = 1;
  }
  return (NSGZipDecoder *)v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_streamInitialized)
    compression_stream_destroy((compression_stream *)&self->_stream);

  v3.receiver = self;
  v3.super_class = (Class)NSGZipDecoder;
  -[NSGZipDecoder dealloc](&v3, sel_dealloc);
}

- (id)decodeData:(id)a3
{
  signed int v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  compression_status v12;
  unint64_t dst_size;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 v22;
  int v23;
  void *v24;
  _BYTE v25[16384];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a3)
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 922, "data");
  if (!objc_msgSend(a3, "length"))
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 923, "[data length]");
  if (!self->_streamInitialized)
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 924, "_streamInitialized");
  if (self->_decodedHeader)
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_opt_self();
  v7 = objc_msgSend(a3, "length");
  if (v7 < 10)
    return 0;
  v8 = objc_msgSend(a3, "bytes");
  if (*(_BYTE *)v8 != 31)
    return 0;
  v9 = v8;
  if (*(unsigned __int8 *)(v8 + 1) != 139)
    return 0;
  if (*(_BYTE *)(v8 + 2) != 8)
    return 0;
  v10 = *(unsigned __int8 *)(v8 + 3);
  if (v10 > 0x1F)
    return 0;
  if ((v10 & 4) != 0)
  {
    if (v7 < 0xC)
      return 0;
    v5 = *(unsigned __int16 *)(v8 + 10) + 12;
    if (v5 > v7)
      return 0;
  }
  else
  {
    v5 = 10;
  }
  if ((v10 & 8) != 0)
  {
    v16 = v5;
    v15 = v8 + v5;
    if (v5 <= v7)
      v17 = v7;
    else
      v17 = v5;
    while (v17 != v16)
    {
      v5 = v16 + 1;
      if (!*(unsigned __int8 *)(v8 + v16++))
        goto LABEL_35;
    }
    return 0;
  }
  v15 = 0;
LABEL_35:
  if ((v10 & 0x10) != 0)
  {
    v19 = v5;
    if (v5 <= v7)
      v20 = v7;
    else
      v20 = v5;
    while (v20 != v19)
    {
      v5 = v19 + 1;
      if (!*(unsigned __int8 *)(v8 + v19++))
        goto LABEL_41;
    }
    return 0;
  }
LABEL_41:
  if ((v10 & 2) != 0)
  {
    if (v5 + 2 <= v7)
    {
      v22 = crc32(0, (const Bytef *)v8, v5);
      v6 = 0;
      v23 = *(unsigned __int16 *)(v9 + v5);
      v5 += 2;
      if (v23 != v22)
        return v6;
      goto LABEL_44;
    }
    return 0;
  }
LABEL_44:
  self->_modificationTime = *(int *)(v9 + 4);
  if (v15)
    v24 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, CFStringConvertEncodingToNSStringEncoding(0x500u));
  else
    v24 = 0;
  if (self->_filename)
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 939, "!_filename");
  self->_filename = (NSString *)objc_msgSend(v24, "copy");
  self->_decodedHeader = 1;
LABEL_6:
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  if (self->_finishedInflating)
  {
    if ((unint64_t)objc_msgSend(a3, "length") >= 9)
      NSLog(CFSTR("got more than 8 bytes of trailer, %ld"), objc_msgSend(a3, "length"));
  }
  else
  {
    self->_stream.src_ptr = (char *)(objc_msgSend(a3, "bytes") + v5);
    v11 = objc_msgSend(a3, "length");
    self->_stream.src_size = v11 - v5;
    if (v11 != v5)
    {
      while (1)
      {
        self->_stream.dst_ptr = v25;
        self->_stream.dst_size = 0x4000;
        v12 = compression_stream_process((compression_stream *)&self->_stream, 0);
        dst_size = self->_stream.dst_size;
        objc_msgSend(v6, "appendBytes:length:", v25, 0x4000 - dst_size);
        if (v12 == COMPRESSION_STATUS_ERROR)
        {
          NSLog(CFSTR("got error from inflate, %ld"), -1);
          return 0;
        }
        if (v12 == COMPRESSION_STATUS_END)
          break;
        if (dst_size && !self->_stream.src_size)
          return v6;
      }
      self->_finishedInflating = 1;
    }
  }
  return v6;
}

- (BOOL)decodeDownloadData:(id)a3 dataForkData:(id *)a4 resourceForkData:(id *)a5
{
  id v6;

  if (!a3)
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 995, "data");
  if (!a4)
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 996, "dataForkData");
  if (!a5)
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 997, "resourceForkData");
  *a5 = 0;
  v6 = -[NSGZipDecoder decodeData:](self, "decodeData:");
  *a4 = v6;
  return v6 != 0;
}

- (BOOL)isFinishedDecoding
{
  _BOOL4 finishedInflating;
  _BOOL4 v3;

  if (!self->_streamInitialized)
    __assert_rtn("-[NSGZipDecoder isFinishedDecoding]", "NSURLDownload.mm", 1005, "_streamInitialized");
  finishedInflating = self->_finishedInflating;
  if (self->_stream.src_size)
  {
    v3 = self->_finishedInflating;
LABEL_5:
    LOBYTE(v3) = v3;
    return v3;
  }
  v3 = 1;
  if (finishedInflating)
    goto LABEL_5;
  return v3;
}

- (id)fileAttributes
{
  unint64_t modificationTime;
  void *v3;
  uint64_t v4;

  if (!self->_decodedHeader)
    __assert_rtn("-[NSGZipDecoder fileAttributes]", "NSURLDownload.mm", 1022, "_decodedHeader");
  modificationTime = self->_modificationTime;
  if (!modificationTime)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)modificationTime);
  return (id)objc_msgSend(v3, "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0CB2A88]);
}

- (id)filenameWithOriginalFilename:(id)a3
{
  id v4;
  void *v6;
  const __CFString *v7;

  if (!self->_decodedHeader)
    __assert_rtn("-[NSGZipDecoder filenameWithOriginalFilename:]", "NSURLDownload.mm", 1032, "_decodedHeader");
  v4 = (id)-[NSString copy](self->_filename, "copy");
  if (objc_msgSend(v4, "length"))
    return v4;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("gz")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("gzip")))
  {
    return (id)objc_msgSend(a3, "stringByDeletingPathExtension");
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("tgz")) & 1) != 0)
  {
    v7 = CFSTR("tar");
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("cpgz")))
      return a3;
    v7 = CFSTR("cpio");
  }
  return (id)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v7);
}

@end
