@implementation MCPeerID

- (unint64_t)pid64
{
  return -[MCPeerIDInternal pid64](self->_internal, "pid64");
}

- (id)idString
{
  return (id)-[NSString copy](-[MCPeerIDInternal idString](self->_internal, "idString"), "copy");
}

- (unsigned)pid
{
  return -[MCPeerIDInternal pid64](self->_internal, "pid64") & 0x7FFFFFFF;
}

- (NSString)displayName
{
  return (NSString *)(id)-[NSString copy](-[MCPeerIDInternal displayName](self->_internal, "displayName"), "copy");
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p DisplayName = %@>"), NSStringFromClass(v4), self, -[MCPeerID displayName](self, "displayName"));
}

- (id)internalDescription
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> idString[%@] pid64[%016llX] displayName[%@]"), NSStringFromClass(v4), self, -[MCPeerIDInternal idString](self->_internal, "idString"), -[MCPeerIDInternal pid64](self->_internal, "pid64"), -[MCPeerIDInternal displayName](self->_internal, "displayName"));
}

- (id)displayNameAndPID
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@,%08X"), -[MCPeerID displayName](self, "displayName"), -[MCPeerID pid](self, "pid"));
}

- (MCPeerID)initWithPID:(unsigned int)a3 displayName:(id)a4
{
  MCPeerID *v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)MCPeerID;
  v6 = -[MCPeerID init](&v13, sel_init);
  if (v6)
  {
    v7 = makebase36string(a3);
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    free(v7);
    v6->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", v8, a3, a4);
    v9 = mcpid_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[MCPeerID idString](v6, "idString");
      v11 = -[MCPeerID displayNameAndPID](v6, "displayNameAndPID");
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_20DC1A000, v9, OS_LOG_TYPE_DEFAULT, "Created new peerID with idString [%@], displayNameAndPID [%@].", buf, 0x16u);
    }
  }
  return v6;
}

- (MCPeerID)initWithIDString:(id)a3 displayName:(id)a4
{
  MCPeerID *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MCPeerID;
  v6 = -[MCPeerID init](&v8, sel_init);
  if (v6)
    v6->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", a3, strtoull((const char *)objc_msgSend(a3, "UTF8String"), 0, 36), a4);
  return v6;
}

- (MCPeerID)initWithCoder:(id)a3
{
  MCPeerID *v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCPeerID;
  v4 = -[MCPeerID init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("id"));
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = makebase36string(v5);
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
    free(v7);
    v4->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", v8, v5, v6);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[MCPeerIDInternal displayName](self->_internal, "displayName"), CFSTR("name"));
  objc_msgSend(a3, "encodeInt64:forKey:", -[MCPeerIDInternal pid64](self->_internal, "pid64"), CFSTR("id"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCPeerID;
  -[MCPeerID dealloc](&v3, sel_dealloc);
}

- (MCPeerID)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCPeerID;
  -[MCPeerID doesNotRecognizeSelector:](&v3, sel_doesNotRecognizeSelector_, a2);
  return 0;
}

- (MCPeerID)initWithDisplayName:(NSString *)myDisplayName
{
  MCPeerID *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  const __CFUUID *v8;
  CFUUIDBytes v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)MCPeerID;
  v4 = -[MCPeerID init](&v17, sel_init);
  if (v4)
  {
    if (!myDisplayName
      || !-[NSString length](myDisplayName, "length")
      || -[NSString lengthOfBytesUsingEncoding:](myDisplayName, "lengthOfBytesUsingEncoding:", 4) >= 0x40)
    {
      v5 = (void *)MEMORY[0x24BDBCE88];
      v6 = *MEMORY[0x24BDBCAB8];
      v7 = (objc_class *)objc_opt_class();
      objc_msgSend(v5, "raise:format:", v6, CFSTR("Invalid displayName passed to %@"), NSStringFromClass(v7));
    }
    v8 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x24BDBD240]);
    v9 = CFUUIDGetUUIDBytes(v8);
    v10 = bswap64(*(_QWORD *)&v9.byte0 ^ *(_QWORD *)&v9.byte8);
    v11 = makebase36string(v10);
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    free(v11);
    CFRelease(v8);
    v4->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", v12, v10, myDisplayName);
    v13 = mcpid_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[MCPeerID idString](v4, "idString");
      v15 = -[MCPeerID displayNameAndPID](v4, "displayNameAndPID");
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Created new peerID with idString [%@], displayNameAndPID [%@].", buf, 0x16u);
    }
  }
  return v4;
}

- (MCPeerID)initWithSerializedRepresentation:(id)a3
{
  MCPeerID *v4;
  unint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  NSString *v25;
  objc_super v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)MCPeerID;
  v4 = -[MCPeerID init](&v26, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "length");
    v6 = (uint64_t *)MEMORY[0x24BDBCAB8];
    if (v5 <= 9)
    {
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = *MEMORY[0x24BDBCAB8];
      v9 = (objc_class *)objc_opt_class();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("Invalid serialized representation passed to %@"), NSStringFromClass(v9));
    }
    v10 = objc_msgSend(a3, "bytes");
    v11 = bswap64(*(_QWORD *)v10);
    v12 = *(unsigned __int8 *)(v10 + 8);
    if (v5 < v12 + 9)
    {
      v13 = (void *)MEMORY[0x24BDBCE88];
      v14 = *MEMORY[0x24BDBCAB8];
      v15 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v15);
      v16 = v14;
      v6 = (uint64_t *)MEMORY[0x24BDBCAB8];
      objc_msgSend(v13, "raise:format:", v16, CFSTR("Invalid serialized representation passed to %@"), v25);
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v10 + 9, v12, 4);
    if (v5 < v12 + 9)
    {
      v18 = (void *)MEMORY[0x24BDBCE88];
      v19 = *v6;
      v20 = (objc_class *)objc_opt_class();
      objc_msgSend(v18, "raise:format:", v19, CFSTR("Invalid serialized representation passed to %@"), NSStringFromClass(v20));
    }
    v21 = makebase36string(v11);
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v21);
    free(v21);
    v4->_internal = -[MCPeerIDInternal initWithIDString:pid64:displayName:]([MCPeerIDInternal alloc], "initWithIDString:pid64:displayName:", v22, v11, v17);

    v23 = mcpid_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v28 = a3;
      v29 = 2112;
      v30 = v22;
      v31 = 2048;
      v32 = v5 - v12 - 9;
      _os_log_impl(&dword_20DC1A000, v23, OS_LOG_TYPE_DEFAULT, "Created peerID from data[%@], idString[%@], leftover[%lu].", buf, 0x20u);
    }
  }
  return v4;
}

- (id)serializedRepresentation
{
  const char *v3;
  size_t v4;
  _BYTE *v5;
  _BYTE *v6;

  v3 = -[NSString UTF8String](-[MCPeerIDInternal displayName](self->_internal, "displayName"), "UTF8String");
  v4 = -[NSString lengthOfBytesUsingEncoding:](-[MCPeerIDInternal displayName](self->_internal, "displayName"), "lengthOfBytesUsingEncoding:", 4);
  v5 = malloc_type_malloc(v4 + 9, 0x43BE824AuLL);
  if (!v5)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB70], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not enough memory %lu"), v4 + 9), 0));
  v6 = v5;
  *v5 = -[MCPeerIDInternal pid64](self->_internal, "pid64") >> 56;
  v6[1] = -[MCPeerIDInternal pid64](self->_internal, "pid64") >> 48;
  v6[2] = (unsigned __int16)(-[MCPeerIDInternal pid64](self->_internal, "pid64") >> 32) >> 8;
  v6[3] = -[MCPeerIDInternal pid64](self->_internal, "pid64") >> 32;
  v6[4] = -[MCPeerIDInternal pid64](self->_internal, "pid64") >> 24;
  v6[5] = -[MCPeerIDInternal pid64](self->_internal, "pid64") >> 16;
  v6[6] = (unsigned __int16)-[MCPeerIDInternal pid64](self->_internal, "pid64") >> 8;
  v6[7] = -[MCPeerIDInternal pid64](self->_internal, "pid64");
  v6[8] = v4;
  memcpy(v6 + 9, v3, v4);
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, v4 + 9, 1);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[MCPeerIDInternal pid64](self->_internal, "pid64");
  return v5 == objc_msgSend(*((id *)a3 + 1), "pid64");
}

- (unint64_t)hash
{
  return -[MCPeerIDInternal pid64](self->_internal, "pid64");
}

@end
