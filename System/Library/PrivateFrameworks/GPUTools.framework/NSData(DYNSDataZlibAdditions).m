@implementation NSData(DYNSDataZlibAdditions)

+ (uint64_t)dy_dataByCompressingData:()DYNSDataZlibAdditions error:
{
  return objc_msgSend(MEMORY[0x24BDBCE50], "dy_dataByCompressingData:level:error:", a3, 2, a4);
}

+ (id)dy_dataByCompressingData:()DYNSDataZlibAdditions level:error:
{
  int v7;
  uint64_t v8;
  DYZlibError *v9;
  id result;
  uInt v11;
  void *v12;
  id v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  z_stream v18;

  memset(&v18, 0, sizeof(v18));
  if ((a4 - 1) >= 3)
  {
    if (a5)
    {
      v8 = -2;
      goto LABEL_7;
    }
  }
  else
  {
    v7 = deflateInit_(&v18, dword_23C6C1CB4[a4 - 1], "1.2.12", 112);
    if (v7)
    {
      if (a5)
      {
        v8 = v7;
LABEL_7:
        v9 = +[DYZlibError errorWithDomain:code:userInfo:](DYZlibError, "errorWithDomain:code:userInfo:", CFSTR("ZlibErrorDomain"), v8, 0, v18.next_in);
        result = 0;
        *a5 = v9;
        return result;
      }
    }
    else
    {
      v11 = deflateBound(&v18, objc_msgSend(a3, "length", *(_OWORD *)&v18.next_in, *(_OWORD *)&v18.total_in, *(_QWORD *)&v18.avail_out));
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v11);
      v13 = a3;
      v18.avail_in = objc_msgSend(a3, "length", objc_msgSend(a3, "bytes"));
      v18.next_out = (Bytef *)objc_msgSend(v12, "mutableBytes");
      v18.avail_out = v11;
      v14 = deflate(&v18, 4);
      if (!v14)
      {
        do
        {
          objc_msgSend(v12, "increaseLengthBy:", (unint64_t)objc_msgSend(a3, "length") >> 2);
          v15 = objc_msgSend(a3, "length");
          v18.avail_out += v15 >> 2;
          v16 = deflate(&v18, 4);
        }
        while (!v16);
        v14 = v16;
      }
      v17 = deflateEnd(&v18);

      if (v14 == 1 && !v17)
      {
        objc_msgSend(v12, "setLength:", v18.total_out);
        return v12;
      }

      if (a5)
      {
        v8 = v14;
        goto LABEL_7;
      }
    }
  }
  return 0;
}

+ (id)dy_dataByDecompressingData:()DYNSDataZlibAdditions error:
{
  void *v6;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 4096);
  if (objc_msgSend(MEMORY[0x24BDBCE50], "dy_decompressData:inMutableData:error:", a3, v6, a4))
    return v6;

  return 0;
}

+ (BOOL)dy_decompressData:()DYNSDataZlibAdditions inMutableData:error:
{
  int v8;
  DYZlibError *v9;
  _BOOL8 v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  z_stream strm;
  _BYTE v18[4096];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(&strm.avail_in, 0, 104);
  strm.next_in = (Bytef *)objc_msgSend(a3, "bytes");
  strm.avail_in = objc_msgSend(a3, "length");
  v8 = inflateInit_(&strm, "1.2.12", 112);
  if (v8)
  {
    if (!a5)
      return 0;
    v9 = +[DYZlibError errorWithDomain:code:userInfo:](DYZlibError, "errorWithDomain:code:userInfo:", CFSTR("ZlibErrorDomain"), v8, 0);
    v10 = 0;
    goto LABEL_20;
  }
  do
  {
    strm.next_out = v18;
    strm.avail_out = 4096;
    v11 = inflate(&strm, 2);
    v12 = v11;
    if (strm.avail_out)
      v13 = v11 == 1;
    else
      v13 = 1;
    if (v13)
      objc_msgSend(a4, "appendBytes:length:", v18, 4096 - strm.avail_out);
  }
  while (!v12);
  v14 = inflateEnd(&strm);
  objc_opt_self();
  v10 = v12 == 1 && v14 == 0;
  if (a5 && !v10)
  {
    v9 = +[DYZlibError errorWithDomain:code:userInfo:](DYZlibError, "errorWithDomain:code:userInfo:", CFSTR("ZlibErrorDomain"), v12, 0);
LABEL_20:
    *a5 = v9;
  }
  return v10;
}

+ (uint64_t)dy_decompressData:()DYNSDataZlibAdditions inBuffer:bufferSize:error:
{
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t result;
  DYZlibError *v14;
  z_stream v15;

  memset(&v15.avail_in, 0, 104);
  v15.avail_in = objc_msgSend(a3, "length", objc_msgSend(a3, "bytes"));
  v9 = inflateInit_(&v15, "1.2.12", 112);
  if (v9)
  {
    if (a6)
    {
      v10 = v9;
LABEL_9:
      v14 = +[DYZlibError errorWithDomain:code:userInfo:](DYZlibError, "errorWithDomain:code:userInfo:", CFSTR("ZlibErrorDomain"), v10, 0);
      result = 0;
      *a6 = v14;
      return result;
    }
  }
  else
  {
    v15.next_out = a4;
    v15.avail_out = a5;
    v11 = inflate(&v15, 4);
    v12 = inflateEnd(&v15);
    if (v11 == 1 && !v12)
    {
      objc_opt_self();
      return 1;
    }
    if (a6)
    {
      v10 = v11;
      goto LABEL_9;
    }
  }
  return 0;
}

+ (id)dy_dataWithContentsOfGzipFileAtPath:()DYNSDataZlibAdditions error:
{
  gzFile v5;
  gzFile_s *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id result;
  __objc2_class *v11;
  const __CFString *v12;
  __objc2_class *v13;
  const __CFString *v14;
  int errnum;
  _BYTE buf[8192];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = gzopen((const char *)objc_msgSend(a3, "fileSystemRepresentation"), "rb");
  if (v5)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 4096);
    while (!gzeof(v6))
    {
      v8 = gzread(v6, buf, 0x2000u);
      if (v8 == -1)
      {
        errnum = 0;
        gzerror(v6, &errnum);
        if (errnum == -1)
        {
          if (a4)
          {
            v13 = (__objc2_class *)MEMORY[0x24BDD1540];
            v14 = (const __CFString *)*MEMORY[0x24BDD1128];
            __error();
            v11 = v13;
            v12 = v14;
LABEL_14:
            *a4 = -[__objc2_class errorWithDomain:code:userInfo:](v11, "errorWithDomain:code:userInfo:", v12);
          }
        }
        else if (a4)
        {
          v11 = DYZlibError;
          v12 = CFSTR("ZlibErrorDomain");
          goto LABEL_14;
        }

        v7 = 0;
        break;
      }
      objc_msgSend(v7, "appendBytes:length:", buf, v8);
    }
    gzclose(v6);
    return v7;
  }
  else if (a4)
  {
    v9 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uLong)dy_crc32
{
  uLong v2;

  v2 = crc32(0, 0, 0);
  return crc32(v2, (const Bytef *)objc_msgSend(a1, "bytes"), objc_msgSend(a1, "length"));
}

@end
