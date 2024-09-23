@implementation ENTBinaryProtocol

- (ENTBinaryProtocol)initWithTransport:(id)a3
{
  return -[ENTBinaryProtocol initWithTransport:strictRead:strictWrite:](self, "initWithTransport:strictRead:strictWrite:", a3, 0, 0);
}

- (ENTBinaryProtocol)initWithTransport:(id)a3 strictRead:(BOOL)a4 strictWrite:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  ENTBinaryProtocol *v9;
  ENTBinaryProtocol *v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENTBinaryProtocol;
  v9 = -[ENTBinaryProtocol init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[ENTBinaryProtocol setTransport:](v9, "setTransport:", v8);
    -[ENTBinaryProtocol setStrictRead:](v10, "setStrictRead:", v6);
    -[ENTBinaryProtocol setStrictWrite:](v10, "setStrictWrite:", v5);
  }

  return v10;
}

- (id)readStringBody:(int)a3
{
  uint64_t v3;
  _BYTE *v5;
  _BYTE *v6;
  void *v7;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = malloc_type_malloc(a3 + 1, 0x1CBC71DBuLL);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to allocate memory in %s, size: %i"), "-[ENTBinaryProtocol readStringBody:]", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENTException exceptionWithName:reason:](ENTProtocolException, "exceptionWithName:reason:", CFSTR("TProtocolException"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }
  v6 = v5;
  -[ENTBinaryProtocol transport](self, "transport");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readAll:offset:length:", v6, 0, v3);

  v6[(int)v3] = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, (int)v3, 4, 1);
}

- (void)readMessageBeginReturningName:(id *)a3 type:(int *)a4 sequenceID:(int *)a5
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  const __CFString *v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v9 = -[ENTBinaryProtocol readI32](self, "readI32");
  v10 = v9;
  if ((v9 & 0x80000000) == 0)
  {
    if (-[ENTBinaryProtocol strictRead](self, "strictRead"))
    {
      v13 = CFSTR("Missing version in readMessageBegin, old client?");
    }
    else
    {
      if (-[ENTBinaryProtocol messageSizeLimit](self, "messageSizeLimit") < 1
        || (int)v10 <= -[ENTBinaryProtocol messageSizeLimit](self, "messageSizeLimit"))
      {
        -[ENTBinaryProtocol readStringBody:](self, "readStringBody:", v10);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (a3)
          *a3 = objc_retainAutorelease(v17);
        v11 = -[ENTBinaryProtocol readByte](self, "readByte");
        if (a4)
          *a4 = v11;
        goto LABEL_14;
      }
      if ((_DWORD)v10 != 1013478509 && (_DWORD)v10 != 1008813135)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Message too big.  Size limit is: %d Message size is: %d"), -[ENTBinaryProtocol messageSizeLimit](self, "messageSizeLimit"), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[ENTException exceptionWithName:reason:](ENTProtocolException, "exceptionWithName:reason:", CFSTR("TProtocolException"), v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v16);
      }
      v13 = CFSTR("Service did not return a Thrift structure");
    }
LABEL_22:
    +[ENTException exceptionWithName:reason:](ENTProtocolException, "exceptionWithName:reason:", CFSTR("TProtocolException"), v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  if ((VERSION_MASK & v9) != VERSION_1)
  {
    v13 = CFSTR("Bad version in readMessageBegin");
    goto LABEL_22;
  }
  if (a4)
    *a4 = (VERSION_MASK & v9);
  -[ENTBinaryProtocol readString](self, "readString");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = objc_retainAutorelease(v17);
LABEL_14:
  v12 = -[ENTBinaryProtocol readI32](self, "readI32");
  if (a5)
    *a5 = v12;

}

- (void)readStructBeginReturningName:(id *)a3
{
  if (a3)
    *a3 = 0;
}

- (void)readFieldBeginReturningName:(id *)a3 type:(int *)a4 fieldID:(int *)a5
{
  int v8;
  int v9;

  if (a3)
    *a3 = 0;
  v8 = -[ENTBinaryProtocol readByte](self, "readByte");
  if (a4)
    *a4 = v8;
  if (v8)
  {
    v9 = -[ENTBinaryProtocol readI16](self, "readI16");
    if (a5)
      *a5 = v9;
  }
}

- (int)readI32
{
  void *v2;
  unsigned int v4;

  -[ENTBinaryProtocol transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readAll:offset:length:", &v4, 0, 4);

  return bswap32(v4);
}

- (id)readString
{
  return -[ENTBinaryProtocol readStringBody:](self, "readStringBody:", -[ENTBinaryProtocol readI32](self, "readI32"));
}

- (BOOL)readBool
{
  return -[ENTBinaryProtocol readByte](self, "readByte") == 1;
}

- (unsigned)readByte
{
  void *v2;
  unsigned __int8 v4;

  v4 = 0;
  -[ENTBinaryProtocol transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readAll:offset:length:", &v4, 0, 1);

  return v4;
}

- (signed)readI16
{
  void *v2;
  unsigned __int16 v5;

  -[ENTBinaryProtocol transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readAll:offset:length:", &v5, 0, 2);

  return (int)bswap32(v5) >> 16;
}

- (int64_t)readI64
{
  void *v2;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  -[ENTBinaryProtocol transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readAll:offset:length:", v4, 0, 8);

  return bswap64(v4[0]);
}

- (double)readDouble
{
  return COERCE_DOUBLE(-[ENTBinaryProtocol readI64](self, "readI64"));
}

- (id)readBinary
{
  size_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  id v9;

  v3 = -[ENTBinaryProtocol readI32](self, "readI32");
  v4 = malloc_type_malloc(v3, 0x83998C40uLL);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Out of memory.  Unable to allocate %d bytes trying to read binary data."), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ENTException exceptionWithName:reason:](ENTProtocolException, "exceptionWithName:reason:", CFSTR("TProtocolException"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v9);
  }
  v5 = v4;
  -[ENTBinaryProtocol transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readAll:offset:length:", v5, 0, v3);

  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5, v3, 1);
}

- (void)readMapBeginReturningKeyType:(int *)a3 valueType:(int *)a4 size:(int *)a5
{
  int v9;
  int v10;
  int v11;

  v9 = -[ENTBinaryProtocol readByte](self, "readByte");
  v10 = -[ENTBinaryProtocol readByte](self, "readByte");
  v11 = -[ENTBinaryProtocol readI32](self, "readI32");
  if (a3)
    *a3 = v9;
  if (a4)
    *a4 = v10;
  if (a5)
    *a5 = v11;
}

- (void)readSetBeginReturningElementType:(int *)a3 size:(int *)a4
{
  int v7;
  int v8;

  v7 = -[ENTBinaryProtocol readByte](self, "readByte");
  v8 = -[ENTBinaryProtocol readI32](self, "readI32");
  if (a3)
    *a3 = v7;
  if (a4)
    *a4 = v8;
}

- (void)readListBeginReturningElementType:(int *)a3 size:(int *)a4
{
  int v7;
  int v8;

  v7 = -[ENTBinaryProtocol readByte](self, "readByte");
  v8 = -[ENTBinaryProtocol readI32](self, "readI32");
  if (a3)
    *a3 = v7;
  if (a4)
    *a4 = v8;
}

- (void)writeByte:(unsigned __int8)a3
{
  void *v3;
  unsigned __int8 v4;

  v4 = a3;
  -[ENTBinaryProtocol transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "write:offset:length:", &v4, 0, 1);

}

- (void)writeMessageBeginWithName:(id)a3 type:(int)a4 sequenceID:(int)a5
{
  uint64_t v5;
  id v8;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  if (-[ENTBinaryProtocol strictWrite](self, "strictWrite"))
  {
    -[ENTBinaryProtocol writeI32:](self, "writeI32:", VERSION_1 | a4);
    -[ENTBinaryProtocol writeString:](self, "writeString:", v8);
  }
  else
  {
    -[ENTBinaryProtocol writeString:](self, "writeString:", v8);
    -[ENTBinaryProtocol writeByte:](self, "writeByte:", a4);
  }
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", v5);

}

- (void)writeFieldBeginWithName:(id)a3 type:(int)a4 fieldID:(int)a5
{
  __int16 v5;

  v5 = a5;
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", a4);
  -[ENTBinaryProtocol writeI16:](self, "writeI16:", v5);
}

- (void)writeI32:(int)a3
{
  void *v3;
  unsigned int v4;

  v4 = bswap32(a3);
  -[ENTBinaryProtocol transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "write:offset:length:", &v4, 0, 4);

}

- (void)writeI16:(signed __int16)a3
{
  void *v3;
  __int16 v4;

  v4 = bswap32(a3) >> 16;
  -[ENTBinaryProtocol transport](self, "transport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "write:offset:length:", &v4, 0, 2);

}

- (void)writeI64:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  -[ENTBinaryProtocol transport](self, "transport", bswap64(a3), *MEMORY[0x24BDAC8D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "write:offset:length:", &v4, 0, 8);

}

- (void)writeDouble:(double)a3
{
  -[ENTBinaryProtocol writeI64:](self, "writeI64:", *(_QWORD *)&a3);
}

- (void)writeString:(id)a3
{
  const char *v4;
  size_t v5;
  id v6;

  if (a3)
  {
    v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
    v5 = strlen(v4);
    -[ENTBinaryProtocol writeI32:](self, "writeI32:", v5);
    -[ENTBinaryProtocol transport](self, "transport");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "write:offset:length:", v4, 0, v5);

  }
  else
  {
    -[ENTBinaryProtocol writeI32:](self, "writeI32:");
  }
}

- (void)writeBinary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", objc_msgSend(v4, "length"));
  -[ENTBinaryProtocol transport](self, "transport");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");

  objc_msgSend(v8, "write:offset:length:", v6, 0, v7);
}

- (void)writeFieldStop
{
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", 0);
}

- (void)writeMapBeginWithKeyType:(int)a3 valueType:(int)a4 size:(int)a5
{
  uint64_t v5;
  unsigned __int8 v6;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", a3);
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", v6);
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", v5);
}

- (void)writeSetBeginWithElementType:(int)a3 size:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", a3);
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", v4);
}

- (void)writeListBeginWithElementType:(int)a3 size:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[ENTBinaryProtocol writeByte:](self, "writeByte:", a3);
  -[ENTBinaryProtocol writeI32:](self, "writeI32:", v4);
}

- (ENTTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (BOOL)strictRead
{
  return self->_strictRead;
}

- (void)setStrictRead:(BOOL)a3
{
  self->_strictRead = a3;
}

- (BOOL)strictWrite
{
  return self->_strictWrite;
}

- (void)setStrictWrite:(BOOL)a3
{
  self->_strictWrite = a3;
}

- (int)messageSizeLimit
{
  return self->_messageSizeLimit;
}

- (void)setMessageSizeLimit:(int)a3
{
  self->_messageSizeLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
}

@end
