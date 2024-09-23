@implementation DKDAAPWriter

- (void)close
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_state == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPWriter.m"), 70, CFSTR("Cannot close a writer that has already been closed"));

  }
  while (-[NSMutableArray count](self->_containerStack, "count"))
  {
    -[NSMutableArray firstObject](self->_containerStack, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKDAAPWriter endContainerWithCode:](self, "endContainerWithCode:", objc_msgSend(v5, "code"));

  }
  -[DKDAAPWriter outputStream](self, "outputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  if (self->_state == 1)
    self->_state = 2;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)writeUInt32:(unsigned int)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  unsigned int v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt32_withCode___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)_performWriteWithBuffer:(id)a3
{
  NSMutableArray *containerStack;
  void (**v5)(id, id);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  containerStack = self->_containerStack;
  v5 = (void (**)(id, id))a3;
  -[NSMutableArray firstObject](containerStack, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;

  v5[2](v5, v12);
  -[NSMutableArray firstObject](self->_containerStack, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childData");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v11)
    -[DKDAAPWriter _writeDataToOutputStream:](self, "_writeDataToOutputStream:", v12);

}

void __37__DKDAAPWriter_writeUInt32_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x4000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = bswap32(*(_DWORD *)(a1 + 36));
  objc_msgSend(v3, "appendBytes:length:", &v4, 4);

}

- (void)_writeDataToOutputStream:(id)a3
{
  id v5;
  unint64_t state;
  NSOutputStream *outputStream;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  NSError *v12;
  NSError *error;
  void *v14;
  void *v15;
  NSError *v16;
  NSError *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  state = self->_state;
  if (state)
  {
    if (state != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPWriter.m"), 230, CFSTR("Attempting to write to an output stream that is not open."));

    }
  }
  else
  {
    -[NSOutputStream open](self->_outputStream, "open");
    self->_state = 1;
  }
  while (1)
  {
    outputStream = self->_outputStream;
    v8 = objc_retainAutorelease(v5);
    v9 = -[NSOutputStream write:maxLength:](outputStream, "write:maxLength:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    if (v9 == objc_msgSend(v8, "length"))
      break;
    if (!v9)
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v19 = *MEMORY[0x24BDD0BA0];
      v20[0] = CFSTR("Encountered EOF while writing to output stream.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("DKDAAPWriterErrorDomain"), 2, v11);
      v12 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v12;

      self->_state = 3;
      break;
    }
    if (v9 == -1)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", CFSTR("Failed to write to output stream."), *MEMORY[0x24BDD0BA0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOutputStream streamError](self->_outputStream, "streamError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DKDAAPWriterErrorDomain"), 1, v14);
      v16 = (NSError *)objc_claimAutoreleasedReturnValue();
      v17 = self->_error;
      self->_error = v16;

      self->_state = 3;
      break;
    }
    if (v9 < objc_msgSend(v8, "length"))
    {
      objc_msgSend(v8, "subdataWithRange:", v9, objc_msgSend(v8, "length") - v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

- (DKDAAPWriter)initWithStream:(id)a3
{
  id v5;
  DKDAAPWriter *v6;
  DKDAAPWriter *v7;
  uint64_t v8;
  NSMutableArray *containerStack;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKDAAPWriter;
  v6 = -[DKDAAPWriter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputStream, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    containerStack = v7->_containerStack;
    v7->_containerStack = (NSMutableArray *)v8;

    v7->_state = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)startContainerWithCode:(unsigned int)a3
{
  NSMutableArray *containerStack;
  DKDAAPWriterContainer *v4;

  containerStack = self->_containerStack;
  v4 = -[DKDAAPWriterContainer initWithCode:]([DKDAAPWriterContainer alloc], "initWithCode:", *(_QWORD *)&a3);
  -[NSMutableArray insertObject:atIndex:](containerStack, "insertObject:atIndex:", v4, 0);

}

- (void)endContainerWithCode:(unsigned int)a3
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!-[NSMutableArray count](self->_containerStack, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPWriter.m"), 87, CFSTR("Cannot end a container (currently not in any container)"));

  }
  -[NSMutableArray firstObject](self->_containerStack, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "code") == a3)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_containerStack, "removeObjectAtIndex:", 0);
    if (-[NSMutableArray count](self->_containerStack, "count"))
    {
      v6 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "childData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDAAPWriter writeData:withCode:](self, "writeData:withCode:", v7, v6);

    }
    else
    {
      objc_msgSend(v10, "formattedOutputData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DKDAAPWriter _writeDataToOutputStream:](self, "_writeDataToOutputStream:", v8);

    }
  }
  else
  {
    NSLog(CFSTR("Cannot end a container other than the current container (%d)!"), objc_msgSend(v10, "code"));
  }

}

- (void)writeData:(id)a3 withCode:(unsigned int)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unsigned int v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__DKDAAPWriter_writeData_withCode___block_invoke;
  v8[3] = &unk_24C2F2D30;
  v10 = a4;
  v9 = v6;
  v7 = v6;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v8);

}

- (void)writeUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  unsigned __int8 v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__DKDAAPWriter_writeUInt8_withCode___block_invoke;
  v4[3] = &__block_descriptor_37_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeSInt8:(char)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__DKDAAPWriter_writeSInt8_withCode___block_invoke;
  v4[3] = &__block_descriptor_37_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeUInt16:(unsigned __int16)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  unsigned __int16 v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt16_withCode___block_invoke;
  v4[3] = &__block_descriptor_38_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeSInt16:(signed __int16)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  signed __int16 v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt16_withCode___block_invoke;
  v4[3] = &__block_descriptor_38_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeSInt32:(int)a3 withCode:(unsigned int)a4
{
  _QWORD v4[4];
  unsigned int v5;
  int v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt32_withCode___block_invoke;
  v4[3] = &__block_descriptor_40_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v6 = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeUInt64:(unint64_t)a3 withCode:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeUInt64_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v4[4] = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeSInt64:(int64_t)a3 withCode:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__DKDAAPWriter_writeSInt64_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  v5 = a4;
  v4[4] = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeString:(id)a3 withCode:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  if (!-[NSMutableArray count](self->_containerStack, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DKDAAPWriter.m"), 185, CFSTR("Cannot write data (currently not in any container)"));

  }
  v9 = objc_retainAutorelease(v7);
  -[DKDAAPWriter writeCString:withCode:](self, "writeCString:withCode:", objc_msgSend(v9, "cStringUsingEncoding:", 4), v4);

}

- (void)writeCString:(const char *)a3 withCode:(unsigned int)a4
{
  _QWORD v4[5];
  unsigned int v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__DKDAAPWriter_writeCString_withCode___block_invoke;
  v4[3] = &__block_descriptor_44_e23_v16__0__NSMutableData_8l;
  v4[4] = a3;
  v5 = a4;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v4);
}

- (void)writeBytes:(char *)a3 ofLength:(unsigned int)a4 withCode:(unsigned int)a5
{
  _QWORD v5[5];
  unsigned int v6;
  unsigned int v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__DKDAAPWriter_writeBytes_ofLength_withCode___block_invoke;
  v5[3] = &__block_descriptor_48_e23_v16__0__NSMutableData_8l;
  v6 = a5;
  v7 = a4;
  v5[4] = a3;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v5);
}

- (void)writeContainerData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__DKDAAPWriter_writeContainerData___block_invoke;
  v6[3] = &unk_24C2F2DF8;
  v7 = v4;
  v5 = v4;
  -[DKDAAPWriter _performWriteWithBuffer:](self, "_performWriteWithBuffer:", v6);

}

- (unint64_t)state
{
  return self->_state;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableArray)containerStack
{
  return self->_containerStack;
}

uint64_t __35__DKDAAPWriter_writeContainerData___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appendData:", *(_QWORD *)(a1 + 32));
}

void __45__DKDAAPWriter_writeBytes_ofLength_withCode___block_invoke(int8x8_t *a1, void *a2)
{
  id v3;
  int8x8_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4 = vrev32_s8(a1[5]);
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", &v4, 8);
  objc_msgSend(v3, "appendBytes:length:", *(_QWORD *)&a1[4], a1[5].u32[1], *(_QWORD *)&v4, v5);

}

void __38__DKDAAPWriter_writeCString_withCode___block_invoke(uint64_t a1, void *a2)
{
  size_t v4;
  id v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = strlen(*(const char **)(a1 + 32));
  v6[0] = bswap32(*(_DWORD *)(a1 + 40));
  v6[1] = bswap32(v4);
  v5 = a2;
  objc_msgSend(v5, "appendBytes:length:", v6, 8);
  objc_msgSend(v5, "appendBytes:length:", *(_QWORD *)(a1 + 32), v4);

}

void __37__DKDAAPWriter_writeSInt64_withCode___block_invoke(unsigned int *a1, void *a2)
{
  id v3;
  unsigned int v4;
  _DWORD v5[2];
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = bswap32(a1[10]);
  v6[1] = 0x8000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v6, 8);
  v4 = bswap32(a1[8]);
  v5[0] = bswap32(a1[9]);
  v5[1] = v4;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);

}

void __37__DKDAAPWriter_writeUInt64_withCode___block_invoke(unsigned int *a1, void *a2)
{
  id v3;
  unsigned int v4;
  _DWORD v5[2];
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6[0] = bswap32(a1[10]);
  v6[1] = 0x8000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v6, 8);
  v4 = bswap32(a1[8]);
  v5[0] = bswap32(a1[9]);
  v5[1] = v4;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);

}

void __37__DKDAAPWriter_writeSInt32_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x4000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = bswap32(*(_DWORD *)(a1 + 36));
  objc_msgSend(v3, "appendBytes:length:", &v4, 4);

}

void __37__DKDAAPWriter_writeSInt16_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int16 v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x2000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = bswap32(*(unsigned __int16 *)(a1 + 36)) >> 16;
  objc_msgSend(v3, "appendBytes:length:", &v4, 2);

}

void __37__DKDAAPWriter_writeUInt16_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int16 v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x2000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = bswap32(*(unsigned __int16 *)(a1 + 36)) >> 16;
  objc_msgSend(v3, "appendBytes:length:", &v4, 2);

}

void __36__DKDAAPWriter_writeSInt8_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x1000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = *(_BYTE *)(a1 + 36);
  objc_msgSend(v3, "appendBytes:length:", &v4, 1);

}

void __36__DKDAAPWriter_writeUInt8_withCode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5[0] = bswap32(*(_DWORD *)(a1 + 32));
  v5[1] = 0x1000000;
  v3 = a2;
  objc_msgSend(v3, "appendBytes:length:", v5, 8);
  v4 = *(_BYTE *)(a1 + 36);
  objc_msgSend(v3, "appendBytes:length:", &v4, 1);

}

void __35__DKDAAPWriter_writeData_withCode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  LODWORD(v5) = bswap32(*(_DWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  HIDWORD(v5) = bswap32(objc_msgSend(v3, "length", v5, v6));
  objc_msgSend(v4, "appendBytes:length:", &v5, 8);
  objc_msgSend(v4, "appendData:", *(_QWORD *)(a1 + 32));

}

@end
