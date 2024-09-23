@implementation MRTransactionPacket

- (MRTransactionPacket)initWithData:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  MRTransactionPacket *v9;
  MRTransactionPacket *v10;
  uint64_t v11;
  NSMutableData *data;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MRTransactionPacket;
  v9 = -[MRTransactionPacket init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a4);
    v11 = objc_msgSend(v7, "mutableCopy");
    data = v10->_data;
    v10->_data = (NSMutableData *)v11;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;

    v16 = -[NSMutableData length](v10->_data, "length");
    v10->_totalLength = v16;
    v10->_writeLength = v16;
    if (!v10->_key || !v10->_identifier || !v10->_data)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("MRTransaction.m"), 33, CFSTR("Required Info for Transaction Packet Not Available"));

    }
  }

  return v10;
}

- (MRTransactionPacket)initWithPackets:(id)a3
{
  id v5;
  MRTransactionPacket *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _MRTransactionKeyProtobuf *key;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  uint64_t v14;
  NSMutableData *data;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  NSMutableData *v24;
  void *v25;
  void *v26;
  void *v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MRTransactionPacket;
  v6 = -[MRTransactionPacket init](&v34, sel_init);
  if (v6)
  {
    v29 = a2;
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "key");
      v9 = objc_claimAutoreleasedReturnValue();
      key = v6->_key;
      v6->_key = (_MRTransactionKeyProtobuf *)v9;

      objc_msgSend(v8, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v11;

      v13 = objc_msgSend(v8, "totalLength");
      v6->_totalLength = v13;
      v6->_writeLength = v13;
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v6->_totalLength);
    data = v6->_data;
    v6->_data = (NSMutableData *)v14;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v5;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v6->_identifier);

          if ((v23 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v29, v6, CFSTR("MRTransaction.m"), 53, CFSTR("Appending packets with different properties"));

          }
          v24 = v6->_data;
          objc_msgSend(v21, "data");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableData appendData:](v24, "appendData:", v25);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v18);
    }

    if (!v6->_key || !v6->_identifier || !v6->_data)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v29, v6, CFSTR("MRTransaction.m"), 57, CFSTR("Required Info for Transaction Packet Not Available"));

    }
  }

  return v6;
}

- (MRTransactionPacket)initWithProtobuf:(id)a3
{
  id v5;
  MRTransactionPacket *v6;
  uint64_t v7;
  _MRTransactionKeyProtobuf *key;
  void *v9;
  uint64_t v10;
  NSMutableData *data;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  void *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRTransactionPacket;
  v6 = -[MRTransactionPacket init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "key");
    v7 = objc_claimAutoreleasedReturnValue();
    key = v6->_key;
    v6->_key = (_MRTransactionKeyProtobuf *)v7;

    objc_msgSend(v5, "packetData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    data = v6->_data;
    v6->_data = (NSMutableData *)v10;

    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    v6->_totalLength = objc_msgSend(v5, "totalLength");
    v6->_writeLength = -[NSMutableData length](v6->_data, "length");
    v6->_totalWritePosition = objc_msgSend(v5, "totalWritePosition");
    if (!v6->_key || !v6->_identifier || !v6->_data)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MRTransaction.m"), 74, CFSTR("Required Info for Transaction Packet Not Available"));

    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_data);
    objc_storeStrong((id *)(v5 + 16), self->_key);
    objc_storeStrong((id *)(v5 + 40), self->_identifier);
    *(_QWORD *)(v5 + 48) = self->_totalLength;
    *(_QWORD *)(v5 + 32) = self->_writePosition;
    *(_QWORD *)(v5 + 24) = self->_writeLength;
    *(_QWORD *)(v5 + 56) = self->_totalWritePosition;
  }
  return (id)v5;
}

- (_MRTransactionPacketProtobuf)protobuf
{
  _MRTransactionPacketProtobuf *v4;
  unint64_t writePosition;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(_MRTransactionPacketProtobuf);
  writePosition = self->_writePosition;
  if (writePosition > -[MRTransactionPacket actualLength](self, "actualLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 101, CFSTR("Write Position: %lu greater than data length %lu"), self->_writePosition, -[MRTransactionPacket actualLength](self, "actualLength"));

  }
  v6 = self->_writeLength + self->_writePosition;
  if (v6 > -[MRTransactionPacket actualLength](self, "actualLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 103, CFSTR("Next Write Pos: %lu greater than data length %lu"), self->_writePosition, -[MRTransactionPacket actualLength](self, "actualLength"));

  }
  v7 = -[NSMutableData bytes](self->_data, "bytes") + self->_writePosition;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, self->_writeLength);
  -[_MRTransactionPacketProtobuf setPacketData:](v4, "setPacketData:", v8);
  -[_MRTransactionPacketProtobuf setKey:](v4, "setKey:", self->_key);
  -[_MRTransactionPacketProtobuf setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[_MRTransactionPacketProtobuf setTotalLength:](v4, "setTotalLength:", self->_totalLength);
  -[_MRTransactionPacketProtobuf setTotalWritePosition:](v4, "setTotalWritePosition:", self->_totalWritePosition);

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key = %@, Identifier = %@, TotalLength = %lu, ActualLength = %lu,"), self->_key, self->_identifier, self->_totalLength, -[NSMutableData length](self->_data, "length"));
}

- (void)writeComplete
{
  unint64_t writeLength;
  unint64_t v5;
  void *v6;
  id v7;

  writeLength = self->_writeLength;
  v5 = self->_writePosition + writeLength;
  self->_writePosition = v5;
  self->_totalWritePosition += writeLength;
  if (v5 > -[NSMutableData length](self->_data, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 128, CFSTR("Write Position: %lu greater than data length %lu"), self->_writePosition, -[NSMutableData length](self->_data, "length"));

  }
  if (self->_totalWritePosition > self->_totalLength)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 130, CFSTR("Total Write Position: %lu greater than total length %lu"), self->_totalWritePosition, self->_totalLength);

  }
}

- (void)setWriteLength:(unint64_t)a3
{
  unint64_t v5;
  id v6;

  self->_writeLength = a3;
  v5 = self->_writePosition + a3;
  if (v5 > -[NSMutableData length](self->_data, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 137, CFSTR("Write Position %lu + Write Length %lu greater than data length %lu"), self->_writePosition, self->_writeLength, -[NSMutableData length](self->_data, "length"));

  }
}

- (unint64_t)actualLength
{
  return -[NSMutableData length](self->_data, "length");
}

- (BOOL)isReadComplete
{
  unint64_t totalLength;

  totalLength = self->_totalLength;
  return totalLength == -[MRTransactionPacket actualLength](self, "actualLength");
}

- (BOOL)isWriteComplete
{
  unint64_t v4;
  unint64_t v5;
  void *v7;

  v4 = self->_writeLength + self->_writePosition;
  if (v4 > -[MRTransactionPacket actualLength](self, "actualLength"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 152, CFSTR("Length and Postion will cause overflow"));

  }
  v5 = self->_writeLength + self->_writePosition;
  return v5 == -[MRTransactionPacket actualLength](self, "actualLength");
}

- (NSData)data
{
  return &self->_data->super;
}

- (_MRTransactionKeyProtobuf)key
{
  return self->_key;
}

- (unint64_t)writeLength
{
  return self->_writeLength;
}

- (unint64_t)writePosition
{
  return self->_writePosition;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)totalLength
{
  return self->_totalLength;
}

- (unint64_t)totalWritePosition
{
  return self->_totalWritePosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
