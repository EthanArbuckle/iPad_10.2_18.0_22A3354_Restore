@implementation TKSmartCardATR

- (TKSmartCardATR)initWithBytes:(NSData *)bytes
{
  NSData *v5;
  TKSmartCardATR *v6;
  TKSmartCardATR *v7;
  uint64_t v8;
  NSMutableArray *interfaces;
  NSData *v10;
  uint64_t v11;
  uint64_t v12;
  TKSmartCardATR *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v5 = bytes;
  v20.receiver = self;
  v20.super_class = (Class)TKSmartCardATR;
  v6 = -[TKSmartCardATR init](&v20, sel_init);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    interfaces = v7->_interfaces;
    v7->_interfaces = (NSMutableArray *)v8;

    objc_storeStrong((id *)&v7->_bytes, bytes);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v10 = objc_retainAutorelease(v5);
    v19 = -[NSData bytes](v10, "bytes");
    v11 = v17[3];
    v12 = -[NSData length](v10, "length");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __32__TKSmartCardATR_initWithBytes___block_invoke;
    v15[3] = &unk_1E708A280;
    v15[4] = &v16;
    v15[5] = v11 + v12;
    -[TKSmartCardATR parseFromSource:](v7, "parseFromSource:", v15);
    v13 = (TKSmartCardATR *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __32__TKSmartCardATR_initWithBytes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned __int8 *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(unsigned __int8 **)(v1 + 24);
  if ((unint64_t)v2 >= *(_QWORD *)(a1 + 40))
    return 0xFFFFFFFFLL;
  *(_QWORD *)(v1 + 24) = v2 + 1;
  return *v2;
}

- (TKSmartCardATR)initWithSource:(void *)source
{
  void *v4;
  TKSmartCardATR *v5;
  TKSmartCardATR *v6;
  uint64_t v7;
  NSMutableArray *interfaces;
  void *v9;
  id v10;
  TKSmartCardATR *v11;
  uint64_t v12;
  NSData *bytes;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  objc_super v21;

  v4 = source;
  v21.receiver = self;
  v21.super_class = (Class)TKSmartCardATR;
  v5 = -[TKSmartCardATR init](&v21, sel_init);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    interfaces = v6->_interfaces;
    v6->_interfaces = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __33__TKSmartCardATR_initWithSource___block_invoke;
    v18 = &unk_1E708A2A8;
    v20 = v4;
    v10 = v9;
    v19 = v10;
    -[TKSmartCardATR parseFromSource:](v6, "parseFromSource:", &v15);
    v11 = (TKSmartCardATR *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v10, v15, v16, v17, v18);
      v12 = objc_claimAutoreleasedReturnValue();
      bytes = v11->_bytes;
      v11->_bytes = (NSData *)v12;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __33__TKSmartCardATR_initWithSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v5;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    v5 = v2;
    objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", &v5, 1);
  }
  return v3;
}

- (id)parseFromSource:(id)a3
{
  uint64_t (**v4)(_QWORD);
  int v5;
  char v6;
  id v7;
  uint64_t v8;
  void *v9;
  TKSmartCardATRInterfaceGroup *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  int v14;
  NSData *v15;
  NSData *historicalBytes;
  TKSmartCardATR *v17;
  uint64_t v19;
  id v20;
  char v21;
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  if ((((uint64_t (*)(void))v4[2])() & 0x80000000) != 0 || (v5 = v4[2](v4), v5 < 0))
  {
    v17 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v22 = v5 & 0xF0;
    v8 = v5 & 0xF;
    v21 = 1;
    do
    {
      v9 = v7;
      v10 = -[TKSmartCardATRInterfaceGroup initWithProtocol:]([TKSmartCardATRInterfaceGroup alloc], "initWithProtocol:", v7);
      v20 = v7;
      -[TKSmartCardATRInterfaceGroup parseWithY:toProtocol:fromSource:hasNext:](v10, "parseWithY:toProtocol:fromSource:hasNext:", &v22, &v20, v4, &v21);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v20;

      if (!v11)
      {
        v17 = 0;
        goto LABEL_18;
      }
      -[NSMutableArray addObject:](self->_interfaces, "addObject:", v11);
      if (v7)
        v6 |= objc_msgSend(v7, "unsignedIntegerValue") != 1;

    }
    while (v21);
    if ((_DWORD)v8)
    {
      v12 = v8;
      v13 = (char *)&v19 - (((_BYTE)v8 + 15) & 0x10);
      while (1)
      {
        v14 = v4[2](v4);
        if (v14 < 0)
          break;
        *v13++ = v14;
        if (!--v12)
          goto LABEL_12;
      }
    }
    else
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&v19 - (((_BYTE)v8 + 15) & 0x10), v8);
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      historicalBytes = self->_historicalBytes;
      self->_historicalBytes = v15;

      if ((v6 & 1) == 0 || (v4[2](v4) & 0x80000000) == 0)
      {
        v17 = self;
        goto LABEL_18;
      }
    }
    v17 = 0;
LABEL_18:

  }
  return v17;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupAtIndex:(NSInteger)index
{
  void *v5;

  if (-[NSMutableArray count](self->_interfaces, "count") >= (unint64_t)index)
  {
    -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", index - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (TKSmartCardATRInterfaceGroup *)v5;
}

- (TKSmartCardATRInterfaceGroup)interfaceGroupForProtocol:(TKSmartCardProtocol)protocol
{
  unint64_t v5;
  NSMutableArray *i;
  void *v7;
  void *v8;
  uint64_t v9;

  if (protocol == 1)
    v5 = 1;
  else
    v5 = 2;
  for (i = self->_interfaces; v5 < -[NSMutableArray count](i, "count"); i = self->_interfaces)
  {
    -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if (v9 == protocol)
      return (TKSmartCardATRInterfaceGroup *)v7;

    ++v5;
  }
  v7 = 0;
  return (TKSmartCardATRInterfaceGroup *)v7;
}

- (NSArray)protocols
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_interfaces, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardATR interfaceGroupAtIndex:](self, "interfaceGroupAtIndex:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TA");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 1 << (objc_msgSend(v5, "unsignedCharValue") & 0xF));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = self->_interfaces;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "protocol", (_QWORD)v23);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)v13;
            objc_msgSend(v12, "protocol");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "unsignedIntegerValue");

            if (!(v16 >> 15))
            {
              objc_msgSend(v12, "protocol");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v3, "containsObject:", v17);

              if ((v18 & 1) == 0)
              {
                objc_msgSend(v12, "protocol");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "unsignedIntegerValue");

                objc_msgSend(v12, "protocol");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20 == 2)
                  objc_msgSend(v3, "insertObject:atIndex:", v21, 0);
                else
                  objc_msgSend(v3, "addObject:", v21);

              }
            }
          }
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    if (!objc_msgSend(v3, "count"))
      objc_msgSend(v3, "addObject:", &unk_1E70977F8);
  }

  return (NSArray *)v3;
}

- (id)_formatHexData:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v5, "length"))
  {
    v7 = 0;
    do
    {
      v8 = objc_retainAutorelease(v5);
      objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(objc_msgSend(v8, "bytes") + v7++));
    }
    while (v7 < objc_msgSend(v8, "length"));
  }

  return v6;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<TKSmartCardATR: %p %02x"), self, *(unsigned __int8 *)-[NSData bytes](self->_bytes, "bytes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_interfaces, "count"))
  {
    v4 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_interfaces, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v6);

      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_interfaces, "count"));
  }
  objc_msgSend(v3, "appendString:", CFSTR(";"));
  -[TKSmartCardATR historicalRecords](self, "historicalRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      v12 = "";
      do
      {
        for (i = 0; i != v10; ++i)
        {
          v14 = v3;
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "tag");
          objc_msgSend(v15, "value");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[TKSmartCardATR _formatHexData:to:](self, "_formatHexData:to:", v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v16;
          v3 = v14;
          objc_msgSend(v14, "appendFormat:", CFSTR("%s%x(%@)"), v12, v21, v18);

          v12 = " ";
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }
  }
  else
  {
    v19 = -[TKSmartCardATR _formatHexData:to:](self, "_formatHexData:to:", self->_historicalBytes, v3);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));

  return v3;
}

- (NSArray)historicalRecords
{
  unsigned __int8 *v3;
  NSUInteger v4;
  TKCompactTLVRecord *v5;
  unint64_t v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  TKCompactTLVRecord *v10;
  void *v11;
  void *v12;
  TKCompactTLVRecord *v13;
  TKCompactTLVRecord *v14;
  uint64_t v15;

  if (!-[NSData length](self->_historicalBytes, "length"))
    goto LABEL_5;
  v3 = -[NSData bytes](self->_historicalBytes, "bytes");
  v4 = -[NSData length](self->_historicalBytes, "length");
  v5 = 0;
  v6 = v4 - 1;
  v9 = *v3;
  v8 = v3 + 1;
  v7 = v9;
  if (v9 != 128)
  {
    if (v7)
      return (NSArray *)v5;
    if (v6 < 3)
    {
LABEL_5:
      v5 = 0;
      return (NSArray *)v5;
    }
    v6 = v4 - 4;
    v10 = [TKCompactTLVRecord alloc];
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v8[v6], 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TKCompactTLVRecord initWithTag:value:](v10, "initWithTag:value:", 8, v11);

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8, v6, 0);
  +[TKTLVRecord sequenceOfRecordsFromData:](TKCompactTLVRecord, "sequenceOfRecordsFromData:", v12);
  v13 = (TKCompactTLVRecord *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v5)
  {
    -[TKCompactTLVRecord arrayByAddingObject:](v13, "arrayByAddingObject:", v5);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (TKCompactTLVRecord *)v15;
  }

  v5 = v14;
  return (NSArray *)v5;
}

- (NSData)bytes
{
  return self->_bytes;
}

- (NSData)historicalBytes
{
  return self->_historicalBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalBytes, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end
