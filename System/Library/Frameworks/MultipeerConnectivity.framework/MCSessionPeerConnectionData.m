@implementation MCSessionPeerConnectionData

- (MCSessionPeerConnectionData)initWithConnectionDataBlob:(id)a3
{
  MCSessionPeerConnectionData *v4;
  MCSessionPeerConnectionData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MCSessionPeerConnectionData;
  v4 = -[MCSessionPeerConnectionData init](&v7, sel_init);
  v5 = v4;
  if (v4 && !-[MCSessionPeerConnectionData parseConnectionDataBlob:](v4, "parseConnectionDataBlob:", a3))
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCSessionPeerConnectionData;
  -[MCSessionPeerConnectionData dealloc](&v3, sel_dealloc);
}

+ (id)connectionDataSegmentWithEncryptionPreference:(int64_t)a3 identitySet:(BOOL)a4 gckSessionConnectionDataBytes:(void *)a5 gckSessionConnectionDataLength:(unint64_t)a6
{
  char v8;
  void *v9;
  _BYTE v11[2];
  __int16 v12;

  v11[0] = 0x80;
  v8 = a3 & 3;
  if (a4)
    v8 = a3 & 3 | 4;
  v11[1] = v8;
  v12 = bswap32(a6 + 4) >> 16;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:");
  objc_msgSend(v9, "appendBytes:length:", v11, 4);
  objc_msgSend(v9, "appendBytes:length:", a5, a6);
  return v9;
}

- (BOOL)parseConnectionDataSegmentWithBytes:(char *)a3 withLength:(unint64_t)a4
{
  NSObject *v7;

  -[MCSessionPeerConnectionData setEncryptionPreference:](self, "setEncryptionPreference:", a3[1] & 3);
  -[MCSessionPeerConnectionData setHasIdentitySet:](self, "setHasIdentitySet:", (a3[1] >> 2) & 1);
  if (a4 <= 3)
  {
    v7 = mcs_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MCSessionPeerConnectionData parseConnectionDataSegmentWithBytes:withLength:].cold.1();
  }
  else
  {
    -[MCSessionPeerConnectionData setGckSessionConnectionData:](self, "setGckSessionConnectionData:", objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3 + 4, a4 - 4));
  }
  return a4 > 3;
}

- (BOOL)parseConnectionDataBlob:(id)a3
{
  unint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  char v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "length");
  LOBYTE(v6) = 0;
  if (a3 && v5)
  {
    v7 = objc_msgSend(a3, "bytes");
    v8 = 0;
    while (1)
    {
      if (v5 - v8 <= 3)
      {
        v14 = mcs_log();
        v6 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (!v6)
          return v6;
        -[MCSessionPeerConnectionData parseConnectionDataBlob:].cold.1(v5 - v8, v14, v15);
        goto LABEL_18;
      }
      v9 = bswap32(*(unsigned __int16 *)(v7 + 2));
      v10 = HIWORD(v9);
      if (v5 - v8 < v10)
        break;
      v11 = *(_BYTE *)v7;
      v12 = *(_BYTE *)v7 & 0x7F;
      if ((*(_BYTE *)v7 & 0x7F) != 0)
      {
        v13 = mcs_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v19 = v12;
          _os_log_impl(&dword_20DC1A000, v13, OS_LOG_TYPE_DEFAULT, "Unrecognized segmentID [%d] in connection data blob.", buf, 8u);
        }
        if (v11 < 0)
          goto LABEL_18;
      }
      else if (!-[MCSessionPeerConnectionData parseConnectionDataSegmentWithBytes:withLength:](self, "parseConnectionDataSegmentWithBytes:withLength:", v7, HIWORD(v9)))
      {
        goto LABEL_18;
      }
      v8 += v10;
      v7 += v10;
      if (v8 >= v5)
      {
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    v16 = mcs_log();
    v6 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (!v6)
      return v6;
    -[MCSessionPeerConnectionData parseConnectionDataBlob:].cold.2();
LABEL_18:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (NSData)gckSessionConnectionData
{
  return self->_gckSessionConnectionData;
}

- (void)setGckSessionConnectionData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (int64_t)encryptionPreference
{
  return self->_encryptionPreference;
}

- (void)setEncryptionPreference:(int64_t)a3
{
  self->_encryptionPreference = a3;
}

- (BOOL)hasIdentitySet
{
  return self->_hasIdentitySet;
}

- (void)setHasIdentitySet:(BOOL)a3
{
  self->_hasIdentitySet = a3;
}

- (void)parseConnectionDataSegmentWithBytes:withLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_21();
  v3 = 4;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v0, v1, "Data segment length [%ld] is smaller than the data segment header size [%ld].", v2);
  OUTLINED_FUNCTION_6();
}

- (void)parseConnectionDataBlob:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = 4;
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, a2, a3, "SegmentLengthSize [%ld] is larger then buffer length [%ld].", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)parseConnectionDataBlob:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_21();
  v3 = v0;
  OUTLINED_FUNCTION_16(&dword_20DC1A000, v1, (uint64_t)v1, "SegmentLength [%ld] is larger then buffer length [%ld].", v2);
  OUTLINED_FUNCTION_6();
}

@end
