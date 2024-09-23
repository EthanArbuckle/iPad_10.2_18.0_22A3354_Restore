@implementation PTPOperationResponsePacket

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 numParameters:(unsigned int)a5 parameters:(unsigned int *)a6
{
  PTPOperationResponsePacket *result;
  unsigned int *parameters;
  uint64_t v12;
  unsigned int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v14, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_numParameters = a5;
    if (a5)
    {
      parameters = result->_parameters;
      v12 = a5;
      do
      {
        v13 = *a6++;
        *parameters++ = v13;
        --v12;
      }
      while (v12);
    }
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4
{
  PTPOperationResponsePacket *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v7, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_numParameters = 0;
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5
{
  PTPOperationResponsePacket *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v9, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_numParameters = 1;
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6
{
  PTPOperationResponsePacket *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v11, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_numParameters = 2;
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7
{
  PTPOperationResponsePacket *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v13, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_parameters[2] = a7;
    result->_numParameters = 3;
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7 parameter4:(unsigned int)a8
{
  PTPOperationResponsePacket *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v15, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_parameters[2] = a7;
    result->_parameters[3] = a8;
    result->_numParameters = 4;
  }
  return result;
}

- (PTPOperationResponsePacket)initWithResponseCode:(unsigned __int16)a3 transactionID:(unsigned int)a4 parameter1:(unsigned int)a5 parameter2:(unsigned int)a6 parameter3:(unsigned int)a7 parameter4:(unsigned int)a8 parameter5:(unsigned int)a9
{
  PTPOperationResponsePacket *result;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PTPOperationResponsePacket;
  result = -[PTPOperationResponsePacket init](&v16, sel_init);
  if (result)
  {
    result->_responseCode = a3;
    result->_transactionID = a4;
    result->_parameters[0] = a5;
    result->_parameters[1] = a6;
    result->_parameters[2] = a7;
    result->_parameters[3] = a8;
    result->_parameters[4] = a9;
    result->_numParameters = 5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[PTPOperationResponsePacket responseCode](self, "responseCode");
  v6 = -[PTPOperationResponsePacket transactionID](self, "transactionID");
  v7 = -[PTPOperationResponsePacket parameter1](self, "parameter1");
  v8 = -[PTPOperationResponsePacket parameter2](self, "parameter2");
  v9 = -[PTPOperationResponsePacket parameter3](self, "parameter3");
  v10 = -[PTPOperationResponsePacket parameter4](self, "parameter4");
  LODWORD(v13) = -[PTPOperationResponsePacket parameter5](self, "parameter5");
  v11 = (void *)objc_msgSend(v4, "initWithResponseCode:transactionID:parameter1:parameter2:parameter3:parameter4:parameter5:", v5, v6, v7, v8, v9, v10, v13);
  objc_msgSend(v11, "setNumParameters:", -[PTPOperationResponsePacket numParameters](self, "numParameters"));
  return v11;
}

- (PTPOperationResponsePacket)initWithTCPBuffer:(void *)a3
{
  int v3;
  PTPOperationResponsePacket *v5;
  PTPOperationResponsePacket *v7;
  uint64_t v8;
  char *v10;
  objc_super v11;

  v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 35) >= 0xFFFFFFEB && *((_DWORD *)a3 + 1) == 7)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPOperationResponsePacket;
    v7 = -[PTPOperationResponsePacket init](&v11, sel_init);
    if (v7)
    {
      v10 = (char *)a3 + 8;
      v7->_responseCode = ReadUInt16(&v10);
      v7->_transactionID = ReadUInt32(&v10);
      v7->_numParameters = (v3 - 14) >> 2;
      if ((v3 - 14) >= 4)
      {
        v8 = 0;
        do
          v7->_parameters[v8++] = ReadUInt32(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PTPOperationResponsePacket)initWithUSBBuffer:(void *)a3
{
  int v3;
  PTPOperationResponsePacket *v5;
  PTPOperationResponsePacket *v7;
  uint64_t v8;
  char *v10;
  objc_super v11;

  v3 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 33) >= 0xFFFFFFEB && *((_WORD *)a3 + 2) == 3)
  {
    v11.receiver = self;
    v11.super_class = (Class)PTPOperationResponsePacket;
    v7 = -[PTPOperationResponsePacket init](&v11, sel_init);
    if (v7)
    {
      v10 = (char *)a3 + 6;
      v7->_responseCode = ReadUInt16(&v10);
      v7->_transactionID = ReadUInt32(&v10);
      v7->_numParameters = (v3 - 12) >> 2;
      if ((v3 - 12) >= 4)
      {
        v8 = 0;
        do
          v7->_parameters[v8++] = ReadUInt32(&v10);
        while (v8 < v7->_numParameters);
      }
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)contentForTCP
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _WORD *v7;

  v3 = (4 * self->_numParameters + 14);
  +[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_WORD *)objc_msgSend(v4, "mutableBytes");
  WriteUInt32((_DWORD **)&v7, v3);
  WriteUInt32((_DWORD **)&v7, 7);
  WriteUInt16(&v7, self->_responseCode);
  WriteUInt32((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v5 = 0;
    do
      WriteUInt32((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  objc_msgSend(v4, "setLength:", v3);
  return v4;
}

- (id)contentForUSB
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _WORD *v7;

  v3 = (4 * self->_numParameters + 12);
  +[PTPWrappedBytes wrappedBytesWithCapacity:](PTPWrappedBytes, "wrappedBytesWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_WORD *)objc_msgSend(v4, "mutableBytes");
  WriteUInt32((_DWORD **)&v7, v3);
  WriteUInt16(&v7, 3);
  WriteUInt16(&v7, self->_responseCode);
  WriteUInt32((_DWORD **)&v7, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v5 = 0;
    do
      WriteUInt32((_DWORD **)&v7, self->_parameters[v5++]);
    while (v5 < self->_numParameters);
  }
  objc_msgSend(v4, "setLength:", v3);
  return v4;
}

- (id)contentForUSBUsingBuffer:(void *)a3 capacity:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  _WORD *v9;

  v4 = (4 * self->_numParameters + 12);
  if (v4 > a4)
    return 0;
  v9 = a3;
  +[PTPWrappedBytes wrappedBytesWithBytes:capacity:](PTPWrappedBytes, "wrappedBytesWithBytes:capacity:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WriteUInt32((_DWORD **)&v9, v4);
  WriteUInt16(&v9, 3);
  WriteUInt16(&v9, self->_responseCode);
  WriteUInt32((_DWORD **)&v9, self->_transactionID);
  if (self->_numParameters >= 1)
  {
    v8 = 0;
    do
      WriteUInt32((_DWORD **)&v9, self->_parameters[v8++]);
    while (v8 < self->_numParameters);
  }
  objc_msgSend(v7, "setLength:", v4);
  return v7;
}

- (id)description
{
  void *v2;
  uint64_t transactionID;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  transactionID = self->_transactionID;
  stringForResponseCode(self->_responseCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(" <-[%lu] %@\n"), transactionID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(unsigned __int16)a3
{
  self->_responseCode = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_transactionID = a3;
}

- (int)numParameters
{
  return self->_numParameters;
}

- (void)setNumParameters:(unsigned int)a3
{
  if (a3 <= 4)
    self->_numParameters = a3;
}

- (unsigned)parameterAtIndex:(unsigned int)a3
{
  if (a3 > 3)
    return 0;
  else
    return self->_parameters[a3];
}

- (void)setPparameter:(unsigned int)a3 atIndex:(unsigned int)a4
{
  if (a4 <= 3)
    self->_parameters[a4] = a3;
}

- (unsigned)parameter1
{
  return self->_parameters[0];
}

- (void)setParameter1:(unsigned int)a3
{
  self->_parameters[0] = a3;
}

- (unsigned)parameter2
{
  return self->_parameters[1];
}

- (void)setParameter2:(unsigned int)a3
{
  self->_parameters[1] = a3;
}

- (unsigned)parameter3
{
  return self->_parameters[2];
}

- (void)setParameter3:(unsigned int)a3
{
  self->_parameters[2] = a3;
}

- (unsigned)parameter4
{
  return self->_parameters[3];
}

- (void)setParameter4:(unsigned int)a3
{
  self->_parameters[3] = a3;
}

- (unsigned)parameter5
{
  return self->_parameters[4];
}

- (void)setParameter5:(unsigned int)a3
{
  self->_parameters[4] = a3;
}

@end
