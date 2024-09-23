@implementation FSBlockDeviceBufferResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FSBlockDeviceBufferResource;
  -[FSBlockDeviceResource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_buffer, CFSTR("FSResource.buffer"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_headerLength, CFSTR("FSResource.headerLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_footerLength, CFSTR("FSResource.footerLength"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_size, CFSTR("FSResource.size"));

}

- (FSBlockDeviceBufferResource)initWithCoder:(id)a3
{
  id v4;
  FSBlockDeviceBufferResource *v5;
  uint64_t v6;
  NSMutableData *buffer;
  id v9;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)FSBlockDeviceBufferResource;
  v5 = -[FSBlockDeviceResource initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("FSResource.buffer"));
    v6 = objc_claimAutoreleasedReturnValue();
    buffer = v5->_buffer;
    v5->_buffer = (NSMutableData *)v6;

    v5->_headerLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.headerLength"));
    v5->_footerLength = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.footerLength"));
    v5->_size = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.size"));
  }

  return v5;
}

- (id)initBufferFromResource:(id)a3
{
  id v4;
  FSBlockDeviceBufferResource *v5;
  FSBlockDeviceBufferResource *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableData *buffer;
  uint64_t v11;
  uint64_t v12;
  uint64_t headerLength;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int64_t footerLength;
  int64_t v20;
  FSBlockDeviceBufferResource *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)FSBlockDeviceBufferResource;
  v5 = -[FSBlockDeviceResource initWithResource:](&v31, sel_initWithResource_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_13;
  v7 = 0x100000 / -[FSBlockDeviceResource blockSize](v5, "blockSize");
  v8 = -[FSBlockDeviceResource blockSize](v6, "blockSize") + v7;
  v6->_headerLength = v8 * -[FSBlockDeviceResource blockSize](v6, "blockSize");
  v6->_footerLength = -[FSBlockDeviceResource blockSize](v6, "blockSize") * v8;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v6->_footerLength + v6->_headerLength);
  buffer = v6->_buffer;
  v6->_buffer = (NSMutableData *)v9;

  v11 = -[FSBlockDeviceResource blockSize](v6, "blockSize");
  v12 = -[FSBlockDeviceResource blockCount](v6, "blockCount") * v11;
  v6->_size = v12;
  headerLength = v6->_headerLength;
  if (headerLength > v12 || v6->_footerLength + headerLength > v12)
  {
    v6->_headerLength = v12;
    v6->_footerLength = 0;
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  v14 = -[NSMutableData mutableBytes](v6->_buffer, "mutableBytes");
  v15 = v6->_headerLength;
  v16 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __54__FSBlockDeviceBufferResource_initBufferFromResource___block_invoke;
  v24[3] = &unk_250C32808;
  v24[4] = &v25;
  objc_msgSend(v4, "synchronousReadInto:startingAt:length:replyHandler:", v14, 0, v15, v24);
  if (!v26[5])
  {
    v18 = (uint64_t)(-[NSMutableData mutableBytes](v6->_buffer, "mutableBytes") + v6->_headerLength);
    footerLength = v6->_footerLength;
    v20 = v6->_size - footerLength;
    v23[0] = v16;
    v23[1] = 3221225472;
    v23[2] = __54__FSBlockDeviceBufferResource_initBufferFromResource___block_invoke_218;
    v23[3] = &unk_250C32808;
    v23[4] = &v25;
    objc_msgSend(v4, "synchronousReadInto:startingAt:length:replyHandler:", v18, v20, footerLength, v23);
    if (v26[5])
    {
      fskit_std_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FSBlockDeviceBufferResource initBufferFromResource:].cold.1();
      goto LABEL_11;
    }
    _Block_object_dispose(&v25, 8);

LABEL_13:
    v21 = v6;
    goto LABEL_14;
  }
  fskit_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[FSBlockDeviceBufferResource initBufferFromResource:].cold.2();
LABEL_11:

  _Block_object_dispose(&v25, 8);
  v21 = 0;
LABEL_14:

  return v21;
}

void __54__FSBlockDeviceBufferResource_initBufferFromResource___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __54__FSBlockDeviceBufferResource_initBufferFromResource___block_invoke_218(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

+ (id)bufferFromResource:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[FSBlockDeviceBufferResource initBufferFromResource:]([FSBlockDeviceBufferResource alloc], "initBufferFromResource:", v3);

  return v4;
}

- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  void *v15;
  int64_t v16;
  unint64_t v17;

  v10 = a6;
  -[FSBlockDeviceResource fsExecQueue](self, "fsExecQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__FSBlockDeviceBufferResource_readInto_startingAt_length_replyHandler___block_invoke;
  v13[3] = &unk_250C32830;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "enqueue:", v13);

}

uint64_t __71__FSBlockDeviceBufferResource_readInto_startingAt_length_replyHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "synchronousReadInto:startingAt:length:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
}

- (void)synchronousReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  FSBlockDeviceBufferResource *v10;
  void *v11;
  unint64_t headerLength;
  int v13;
  unint64_t size;
  int64_t v15;
  void *v16;
  void (**v17)(id, unint64_t, _QWORD);

  v17 = (void (**)(id, unint64_t, _QWORD))a6;
  v10 = self;
  objc_sync_enter(v10);
  if (!-[FSBlockDeviceResource isTerminated](v10, "isTerminated"))
  {
    objc_sync_exit(v10);

    if (a3)
    {
      headerLength = v10->_headerLength;
      if ((uint64_t)headerLength <= a4)
      {
        size = v10->_size;
        v15 = size - v10->_footerLength;
        if (v15 < a4 && a5 + a4 <= size)
        {
          a4 = headerLength + a4 - v15;
LABEL_13:
          memcpy(a3, -[NSMutableData mutableBytes](v10->_buffer, "mutableBytes") + a4, a5);
          v17[2](v17, a5, 0);
          goto LABEL_14;
        }
      }
      else if (a5 + a4 <= headerLength)
      {
        goto LABEL_13;
      }
      v13 = 22;
    }
    else
    {
      v13 = 14;
    }
    fs_errorForPOSIXError(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, unint64_t, void *))v17)[2](v17, 0, v16);

    goto LABEL_14;
  }
  fs_errorForPOSIXError(5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, unint64_t, void *))v17)[2](v17, 0, v11);

  objc_sync_exit(v10);
LABEL_14:

}

- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (void)synchronousWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))a6 + 2))(v7, 0, v8);

}

- (void)synchronousMetadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)synchronousMetadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7 replyHandler:(id)a8
{
  id v9;
  id v10;

  v9 = a8;
  fs_errorForPOSIXError(45);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v9, v10);

}

- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)synchronousMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  id v7;
  id v8;

  v7 = a6;
  fs_errorForPOSIXError(45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);

}

- (void)synchronousMetadataClear:(id)a3 wait:(BOOL)a4 replyHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  fs_errorForPOSIXError(45);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)synchronousMetadataPurge:(id)a3 replyHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  fs_errorForPOSIXError(45);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 128, 1);
}

- (int64_t)headerLength
{
  return self->_headerLength;
}

- (int64_t)footerLength
{
  return self->_footerLength;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

- (void)initBufferFromResource:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9_0(&dword_23B2A6000, v0, v1, "%s: Can't read the footer of the resource (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initBufferFromResource:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9_0(&dword_23B2A6000, v0, v1, "%s: Can't read the header of the resource (%@)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
