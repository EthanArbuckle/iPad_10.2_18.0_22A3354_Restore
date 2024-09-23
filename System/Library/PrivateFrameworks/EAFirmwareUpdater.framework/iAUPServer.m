@implementation iAUPServer

- (id)initInstanceWithByteEscape:(BOOL)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)iAUPServer;
  v4 = -[iAUPServer init](&v6, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 7) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 32);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 4) = 0;
    v4[25] = a3;
    v4[26] = 0;
    *((_WORD *)v4 + 42) = 0;
    *(_WORD *)(v4 + 87) = 256;
    objc_msgSend(v4, "resetParser");
    objc_msgSend(v4, "setServerState:", 1);
    *((_DWORD *)v4 + 20) = 0;
    *((_DWORD *)v4 + 18) = 0;
    memset_pattern16(v4 + 64, &unk_22CD73990, 8uLL);
    NSLog(CFSTR("%s(): iAUPServer init byteEscape=%d serverState=%s parserState=%s\n"), "-[iAUPServer initInstanceWithByteEscape:]", v4[25], objc_msgSend(v4, "serverStateString:", *((unsigned int *)v4 + 4)), objc_msgSend(v4, "parserStateString:", *((unsigned int *)v4 + 5)));
  }
  return v4;
}

- (id)getNumberOfBytesDownloadedInCurrentSession
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_totalBytesDownloadedInCurrentSession);
}

- (void)dealloc
{
  objc_super v3;

  NSLog(CFSTR("%s(): iAUPServer dealloc\n"), a2, "-[iAUPServer dealloc]");

  self->_telegramDataIn = 0;
  v3.receiver = self;
  v3.super_class = (Class)iAUPServer;
  -[iAUPServer dealloc](&v3, sel_dealloc);
}

- (unsigned)supportedTargetProductIDCode
{
  return -[FirmwareBundle productIDCode](self->_firmwareBundle, "productIDCode");
}

- (void)resetParser
{
  uint64_t v3;

  self->_escapeInProgress = 0;
  -[NSMutableData setLength:](self->_telegramDataIn, "setLength:", 0);
  if (self->_byteEscape)
    v3 = 4294967294;
  else
    v3 = 0xFFFFFFFFLL;
  -[iAUPServer setParserState:](self, "setParserState:", v3);
}

- (void)setServerState:(int)a3
{
  NSLog(CFSTR("[iAUPv2 State]: %s -> %s"), -[iAUPServer serverStateString:](self, "serverStateString:", self->_serverState), -[iAUPServer serverStateString:](self, "serverStateString:", *(_QWORD *)&a3));
  self->_serverState = a3;
}

- (void)setParserState:(int)a3
{
  uint64_t v3;
  int v5;

  v3 = *(_QWORD *)&a3;
  v5 = -[iAUPServer parserState](self, "parserState");
  if ((int)v3 < 1 || v5 <= 0)
    NSLog(CFSTR("[Parser State]: %s -> %s"), -[iAUPServer parserStateString:](self, "parserStateString:", self->_parserState), -[iAUPServer parserStateString:](self, "parserStateString:", v3));
  self->_parserState = v3;
}

- (void)appendToLog:(id)a3
{
  -[iAUPServerDelegate logStatusString:](-[iAUPServer delegate](self, "delegate"), "logStatusString:", a3);
}

- (void)setFirmwareBundle:(id)a3
{
  FirmwareBundle *firmwareBundle;

  firmwareBundle = self->_firmwareBundle;
  if (firmwareBundle)
  {

    self->_firmwareBundle = 0;
  }
  self->_firmwareBundle = (FirmwareBundle *)a3;
  if (-[iAUPServer serverState](self, "serverState") != 1 && -[iAUPServer serverState](self, "serverState") != 7)
  {
    -[iAUPServer resetParser](self, "resetParser");
    -[iAUPServer setServerState:](self, "setServerState:", 6);
  }
}

- (void)logCommand:(unsigned __int8)a3 payload:(char *)a4 length:(unsigned int)a5
{
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  char *v11;
  char *v12;

  if ((int)a3 > 95)
  {
    if ((int)a3 <= 191)
    {
      if ((a3 - 128) >= 8)
      {
        if ((a3 - 96) >= 4)
          goto LABEL_30;
        goto LABEL_24;
      }
    }
    else
    {
      if (a3 == 192)
      {
        v7 = CFSTR("Bootloader entry command acknowledged");
        goto LABEL_27;
      }
      if (a3 == 193)
      {
        v7 = CFSTR("App re-entry command acknowledged");
        goto LABEL_27;
      }
      if (a3 != 194)
        goto LABEL_30;
    }
LABEL_20:
    v8 = (void *)MEMORY[0x24BDD17C8];
    v11 = (char *)a3;
    v12 = -[iAUPServer commandString:](self, "commandString:", a3, a4, *(_QWORD *)&a5);
    v9 = CFSTR("Command: 0x%X %s");
LABEL_25:
    v10 = objc_msgSend(v8, "stringWithFormat:", v9, v11, v12);
LABEL_26:
    v7 = (const __CFString *)v10;
    goto LABEL_27;
  }
  if ((int)a3 > 4)
  {
    v6 = (a3 - 6);
    if (v6 > 0x3C)
      goto LABEL_28;
    if (((1 << (a3 - 6)) & 0x3C000000) == 0)
    {
      if (((1 << (a3 - 6)) & 0x1400000000000003) == 0)
      {
        if (v6 == 59)
        {
          v7 = CFSTR("Setting app re-entry");
          goto LABEL_27;
        }
LABEL_28:
        if (a3 == 5)
        {
          v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Downloading [%d] block 0x%04X"), *a4, __rev16(*(unsigned __int16 *)(a4 + 1)));
          goto LABEL_26;
        }
LABEL_30:
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown command received (%02X)"), a3, v12);
        goto LABEL_26;
      }
      goto LABEL_20;
    }
LABEL_24:
    v8 = (void *)MEMORY[0x24BDD17C8];
    v11 = -[iAUPServer commandString:](self, "commandString:", a3, a4, *(_QWORD *)&a5);
    v9 = CFSTR("Command: %s");
    goto LABEL_25;
  }
  if ((a3 - 2) < 3 || !a3)
    goto LABEL_20;
  if (a3 != 1)
    goto LABEL_30;
  switch(*a4)
  {
    case 0:
      v7 = CFSTR("Bootloader initialized");
      break;
    case 1:
      v7 = CFSTR("Metadata received");
      break;
    case 2:
      v7 = CFSTR("Certificate received");
      break;
    case 3:
      v7 = CFSTR("Certificate validated");
      break;
    case 4:
      v7 = CFSTR("Hash received");
      break;
    case 5:
      v7 = CFSTR("Signature verified");
      break;
    case 6:
      v7 = CFSTR("Firmware mass erased");
      break;
    case 7:
      v7 = CFSTR("Firmware image installed");
      break;
    case 8:
      v7 = CFSTR("Firmware image validated");
      break;
    default:
      switch(*a4)
      {
        case -128:
          v7 = CFSTR("Bad product ID code!");
          break;
        case -127:
          v7 = CFSTR("Bad image start address!");
          break;
        case -126:
          v7 = CFSTR("Bad image end address!");
          break;
        case -125:
          v7 = CFSTR("Bad object size!");
          break;
        case -124:
          v7 = CFSTR("Cert validation failure!");
          break;
        case -123:
          v7 = CFSTR("Not an accessory update cert!");
          break;
        case -122:
          v7 = CFSTR("Signature verification failure!");
          break;
        case -121:
          v7 = CFSTR("FW image hash mismatch!");
          break;
        case -120:
          v7 = CFSTR("General update failure!");
          break;
        default:
          v7 = CFSTR("Process status unknown");
          break;
      }
      break;
  }
LABEL_27:
  -[iAUPServer appendToLog:](self, "appendToLog:", v7, a4, *(_QWORD *)&a5);
}

- (void)processDataFromAccessory:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, "bytes");
  if (objc_msgSend(a3, "length"))
  {
    v6 = 0;
    do
      -[iAUPServer processInByte:](self, "processInByte:", *(unsigned __int8 *)(v5 + v6++));
    while (objc_msgSend(a3, "length") > (unint64_t)v6);
  }
}

- (void)processInByte:(unsigned __int8)a3
{
  unsigned int v3;
  unsigned int parserState;
  char *v6;
  uint64_t v7;
  iAUPServer *v8;
  int v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v13 = a3;
  if (self->_byteEscape)
  {
    if (a3 == 125)
    {
      parserState = self->_parserState;
      v6 = -[iAUPServer parserStateString:](self, "parserStateString:", parserState);
      if (parserState < 0xFFFFFFFE)
      {
        NSLog(CFSTR("[Parser] escaping %s\n"), v6);
        self->_escapeInProgress = 1;
        return;
      }
      NSLog(CFSTR("[Parser] Invalid StartByte in %s & byteEscape=YES\n"), v6);
      goto LABEL_27;
    }
    if (self->_escapeInProgress)
    {
      if (self->_parserState >= 0xFFFFFFFE)
      {
        NSLog(CFSTR("[Parser] ??? %s when byteEscape=YES c=0x%02x\n"), -[iAUPServer parserStateString:](self, "parserStateString:"), a3);
LABEL_27:
        -[iAUPServer resetParser](self, "resetParser");
        return;
      }
      NSLog(CFSTR("[Parser] De-escaped [0x%02x -> 0x%02x] %s\n"), a3, a3 ^ 0x20u, -[iAUPServer parserStateString:](self, "parserStateString:"));
      v13 = v3 ^ 0x20;
      self->_escapeInProgress = 0;
      v3 ^= 0x20u;
    }
  }
  switch(self->_parserState)
  {
    case 0xFFFFFFFC:
      self->_telegramChecksum += v3;
      v7 = self->_telegramLength | v3;
      self->_telegramLength = v7;
      v8 = self;
      goto LABEL_24;
    case 0xFFFFFFFD:
      self->_telegramChecksum = v3;
      self->_telegramLength = v3 << 8;
      v8 = self;
      v7 = 4294967292;
      goto LABEL_24;
    case 0xFFFFFFFE:
      if (self->_byteEscape)
        v9 = 126;
      else
        v9 = 92;
      if (v3 == v9)
      {
        v8 = self;
        v7 = 4294967293;
        goto LABEL_24;
      }
      NSLog(CFSTR("[Parser] Invalid 0x%02x byte in %s & byteEscape=%d\n"), v3, -[iAUPServer parserStateString:](self, "parserStateString:", 4294967294), self->_byteEscape);
      goto LABEL_27;
    case 0xFFFFFFFF:
      if (self->_byteEscape)
      {
        NSLog(CFSTR("[Parser] %s when byteEscaping=YES. Why?\n"), -[iAUPServer parserStateString:](self, "parserStateString:", 0xFFFFFFFFLL), v11, v12);
        goto LABEL_27;
      }
      if (v3 != 255)
      {
        NSLog(CFSTR("[Parser] Invalid byte 0x%02x in %s\n"), v3, -[iAUPServer parserStateString:](self, "parserStateString:", 0xFFFFFFFFLL), v12);
        goto LABEL_27;
      }
      v8 = self;
      v7 = 4294967294;
LABEL_24:
      -[iAUPServer setParserState:](v8, "setParserState:", v7);
      break;
    case 0:
      v10 = self->_telegramChecksum + v3;
      self->_telegramChecksum = v10;
      if (v10)
        NSLog(CFSTR("[Parser] Invalid Checksum c=0x%02x\n"), v3, v11, v12);
      else
        -[iAUPServer processInTelegram](self, "processInTelegram");
      goto LABEL_27;
    default:
      -[NSMutableData appendBytes:length:](self->_telegramDataIn, "appendBytes:length:", &v13, 1);
      self->_telegramChecksum += v13;
      -[iAUPServer setParserState:](self, "setParserState:", -[iAUPServer parserState](self, "parserState") - 1);
      return;
  }
}

- (void)processInTelegram
{
  unsigned __int16 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const __CFString **v10;
  const __CFString **v11;
  unint64_t v12;
  iAUPServer *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int firmwareImageBaseTransferAddress;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  size_t v23;
  NSUInteger v24;
  NSData *v25;
  uint64_t v26;
  iAUPServer *v27;
  uint64_t v28;
  unsigned int v29;
  const void *v30;
  uint64_t v31;
  NSData *v32;
  uint64_t v33;
  unsigned int v34;
  _BYTE *v35;
  _BYTE *v36;
  __int16 v37;
  const void *v38;
  void *v39;
  size_t v40;
  iAUPServerDelegate *delegate;
  id v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  void *v46;
  unsigned __int8 v47;
  unsigned int v48;
  _QWORD v49[6];
  _QWORD v50[6];
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableData mutableBytes](self->_telegramDataIn, "mutableBytes");
  v4 = (unsigned __int8 *)v3 + 1;
  v5 = *(unsigned __int8 *)v3;
  v6 = -[NSMutableData length](self->_telegramDataIn, "length") - 1;
  -[iAUPServer logCommand:payload:length:](self, "logCommand:payload:length:", v5, (char *)v3 + 1, v6);
  if ((int)v5 > 31)
  {
    switch((int)v5)
    {
      case ' ':
        -[iAUPServer processIdentifyCommand:length:](self, "processIdentifyCommand:length:", v4, v6);
        break;
      case '!':
        -[iAUPServer processRequestDownloadCommand:length:](self, "processRequestDownloadCommand:length:", v4, v6);
        break;
      case '"':
        -[iAUPServer processDownloadCompleteCommand:length:](self, "processDownloadCompleteCommand:length:", v4, v6);
        break;
      case '#':
        -[iAUPServer processNotifyAccessoryErrorCommand:length:](self, "processNotifyAccessoryErrorCommand:length:", v4, v6);
        break;
      default:
        if ((_DWORD)v5 == 193)
        {
          if (self->_ackAppReentry)
LABEL_41:
            -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", 0, 0);
        }
        else if ((_DWORD)v5 == 194)
        {
          -[iAUPServer processPersonalizationInfo:length:](self, "processPersonalizationInfo:length:", v4, v6);
        }
        break;
    }
    return;
  }
  switch((int)v5)
  {
    case 0:
      v47 = *v4;
      if (v47 == 1)
        v7 = bswap32(-[FirmwareBundle productIDCode](self->_firmwareBundle, "productIDCode"));
      else
        v7 = 0;
      v48 = v7;
      v27 = self;
      v28 = 128;
      goto LABEL_62;
    case 1:
      if (*v4 == 136)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("ProcessAbort_GeneralFailure from accessory. Cleaning up."));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -1, 0);
        v65 = CFSTR("Event");
        v66[0] = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = (const __CFString **)v66;
        v11 = &v65;
        goto LABEL_89;
      }
      -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 129, v4, 1);
      if (*v4 == 8 && self->_iAUPVersion == 1)
      {
        -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 65, 0, 0);
        if (!self->_ackAppReentry)
          goto LABEL_41;
      }
      return;
    case 2:
      v12 = *v4;
      if (v12 > 3)
        return;
      self->objectBlockTransferSizes[v12] = bswap32(v3[1]) >> 16;
      v13 = self;
      v14 = 130;
      v15 = (char *)v3 + 1;
      v16 = 3;
      goto LABEL_35;
    case 3:
      v17 = bswap32(*(_DWORD *)v4);
      self->_firmwareImageBaseTransferAddress = v17;
      if (v17 < -[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress")
        || (firmwareImageBaseTransferAddress = self->_firmwareImageBaseTransferAddress,
            v19 = firmwareImageBaseTransferAddress
                - -[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress"),
            v19 >= -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize")))
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_SetBaseImageTransferAddress: Bound check failed"));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -2, 0);
        v63 = CFSTR("Event");
        v64 = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v64;
        v11 = &v63;
        goto LABEL_89;
      }
      v13 = self;
      v14 = 131;
      v15 = (char *)v3 + 1;
      v16 = 4;
LABEL_35:
      -[iAUPServer sendCommand:payload:payload_length:](v13, "sendCommand:payload:payload_length:", v14, v15, v16);
      return;
    case 4:
      v20 = *v4;
      if (*v4)
        goto LABEL_18;
      if (-[FirmwareBundle firmwareImage](self->_firmwareBundle, "firmwareImage")
        || -[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        goto LABEL_51;
      }
      v20 = *v4;
LABEL_18:
      if (v20 != 2)
        goto LABEL_21;
      if (-[FirmwareBundle hash](self->_firmwareBundle, "hash"))
        goto LABEL_51;
      v20 = *v4;
LABEL_21:
      if (v20 != 1)
        goto LABEL_24;
      if (!-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"))
      {
        v20 = *v4;
LABEL_24:
        if (v20 != 3 || !-[FirmwareBundle signature](self->_firmwareBundle, "signature"))
        {
          -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_GetObjectSize: request for empty object."));
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -4, 0);
          v61 = CFSTR("Event");
          v62 = CFSTR("com.apple.fud.updateFailed");
          v9 = (void *)MEMORY[0x24BDBCE70];
          v10 = &v62;
          v11 = &v61;
          goto LABEL_89;
        }
      }
LABEL_51:
      switch(*v4)
      {
        case 0u:
          v29 = bswap32(-[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"));
          break;
        case 1u:
          v32 = -[FirmwareBundle certificate](self->_firmwareBundle, "certificate");
          goto LABEL_60;
        case 2u:
          v32 = -[FirmwareBundle hash](self->_firmwareBundle, "hash");
          goto LABEL_60;
        case 3u:
          v32 = -[FirmwareBundle signature](self->_firmwareBundle, "signature");
LABEL_60:
          v29 = bswap32(-[NSData length](v32, "length"));
          break;
        default:
          v29 = 0;
          break;
      }
      v47 = *v4;
      v48 = v29;
      v27 = self;
      v28 = 132;
LABEL_62:
      -[iAUPServer sendCommand:payload:payload_length:](v27, "sendCommand:payload:payload_length:", v28, &v47, 5);
      return;
    case 5:
      v21 = *v4;
      if (v21 > 3)
        return;
      v22 = v3[1];
      LODWORD(v23) = self->objectBlockTransferSizes[v21];
      if (*v4)
      {
        if ((_DWORD)v21 == 1)
        {
          if (-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"))
          {
            v24 = -[NSData length](-[FirmwareBundle certificate](self->_firmwareBundle, "certificate"), "length");
            v25 = -[FirmwareBundle certificate](self->_firmwareBundle, "certificate");
            goto LABEL_67;
          }
        }
        else if ((_DWORD)v21 == 3)
        {
          if (-[FirmwareBundle signature](self->_firmwareBundle, "signature"))
          {
            v24 = -[NSData length](-[FirmwareBundle signature](self->_firmwareBundle, "signature"), "length");
            v25 = -[FirmwareBundle signature](self->_firmwareBundle, "signature");
            goto LABEL_67;
          }
        }
        else if ((_DWORD)v21 == 2 && -[FirmwareBundle hash](self->_firmwareBundle, "hash"))
        {
          v24 = -[NSData length](-[FirmwareBundle hash](self->_firmwareBundle, "hash"), "length");
          v25 = -[FirmwareBundle hash](self->_firmwareBundle, "hash");
LABEL_67:
          v31 = -[NSData bytes](v25, "bytes");
          goto LABEL_68;
        }
LABEL_73:
        -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_GetObjectBlock: request for empty object."));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -4, 0);
        v59 = CFSTR("Event");
        v60 = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v60;
        v11 = &v59;
        goto LABEL_89;
      }
      if (!-[FirmwareBundle firmwareImage](self->_firmwareBundle, "firmwareImage")
        && !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        goto LABEL_73;
      }
      v24 = -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize");
      v30 = -[NSData bytes](-[FirmwareBundle firmwareImage](self->_firmwareBundle, "firmwareImage"), "bytes")
          + self->_firmwareImageBaseTransferAddress;
      v31 = (uint64_t)v30 - -[FirmwareBundle firmwareImageBaseAddress](self->_firmwareBundle, "firmwareImageBaseAddress");
LABEL_68:
      if (!v31 && !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL") || !(_DWORD)v24)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("COMMAND_GetObjectBlock Failed, Invalid object_type (%c) or Image (object_total_size = %u)"), v21, v24));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -4, 0);
        v57 = CFSTR("Event");
        v58 = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v58;
        v11 = &v57;
        goto LABEL_89;
      }
      v33 = (bswap32(v22) >> 16) * v23;
      v34 = v24 - v33;
      if (v24 < v33)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_GetObjectBlock: bound check failed: block_offset * block_size > object_total_size"));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -2, 0);
        v55 = CFSTR("Event");
        v56 = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v56;
        v11 = &v55;
LABEL_89:
        -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1), v8);

        return;
      }
      if (v34 >= v23)
        v23 = v23;
      else
        v23 = v34;
      v35 = malloc_type_malloc((v23 + 3), 0x475BFE6EuLL);
      if (!v35)
      {
        -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_GetObjectBlock: malloc failed."));
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -3, 0);
        v53 = CFSTR("Event");
        v54 = CFSTR("com.apple.fud.updateFailed");
        v9 = (void *)MEMORY[0x24BDBCE70];
        v10 = &v54;
        v11 = &v53;
        goto LABEL_89;
      }
      v36 = v35;
      if ((_DWORD)v21 || !-[FirmwareBundle firmwareLocalURL](self->_firmwareBundle, "firmwareLocalURL"))
      {
        v37 = *(_WORD *)v4;
        v38 = (const void *)(v31 + v33);
        v36[2] = v4[2];
        *(_WORD *)v36 = v37;
        v39 = v36 + 3;
        v40 = v23;
      }
      else
      {
        v42 = -[FirmwareBundle getFirmwareDataInRange:error:](self->_firmwareBundle, "getFirmwareDataInRange:error:", v33, v23, 0);
        if (!v42)
        {
          -[iAUPServer appendToLog:](self, "appendToLog:", CFSTR("COMMAND_GetObjectBlock: Failed to read firmware data from file"));
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -4, 0);
          v51 = CFSTR("Event");
          v52 = CFSTR("com.apple.fud.updateFailed");
          -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1), v46);

          free(v36);
          return;
        }
        v43 = v42;
        v44 = *(_WORD *)v4;
        v36[2] = v4[2];
        *(_WORD *)v36 = v44;
        v45 = objc_msgSend(v42, "bytes");
        v40 = objc_msgSend(v43, "length");
        v39 = v36 + 3;
        v38 = (const void *)v45;
      }
      memcpy(v39, v38, v40);
      -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 133, v36, (unsigned __int16)(v23 + 3));
      free(v36);
      self->_totalBytesDownloadedInCurrentSession += v23;
      if ((self->_accessoryCapabilities & 1) == 0 && !self->_startEventSent)
      {
        v50[0] = CFSTR("com.apple.fud.updateStarted");
        v49[0] = CFSTR("Event");
        v49[1] = CFSTR("resumeCount");
        v50[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
        v49[2] = CFSTR("cumulativeUpdateTime");
        v50[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
        v49[3] = CFSTR("cumulativeCloakTime");
        v50[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
        v49[4] = CFSTR("totalBytesForCompleteUpdate");
        v50[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"));
        v49[5] = CFSTR("totalBytesDownloadedSoFar");
        v50[5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
        -[iAUPServerDelegate handleFirmwareUpdateStatus:](self->_delegate, "handleFirmwareUpdateStatus:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 6));
        self->_startEventSent = 1;
      }
      if (!(_DWORD)v21)
      {
        delegate = self->_delegate;
        if (delegate)
          -[iAUPServerDelegate updateProgress:](delegate, "updateProgress:", (double)(v23 + v33) / (double)v24 * 100.0);
      }
      return;
    case 6:
      v26 = *(unsigned __int16 *)v4;
      self->_accessoryCapabilities = v26;
      NSLog(CFSTR("_accessoryCapabilities set to 0x%x\n"), v26);
      v13 = self;
      v14 = 134;
      v15 = 0;
      v16 = 0;
      goto LABEL_35;
    case 7:
      -[iAUPServer setResumeInfo:length:](self, "setResumeInfo:length:", v4, v6);
      return;
    default:
      return;
  }
}

- (unsigned)appendByteWithEscaping:(unsigned __int8)a3 toObject:(id *)a4
{
  unsigned __int8 v5;
  _BYTE v7[2];
  unsigned __int8 v8;

  v8 = a3;
  if ((a3 - 125) > 1 || !self->_byteEscape)
  {
    objc_msgSend(*a4, "appendBytes:length:", &v8, 1);
    return v8;
  }
  else
  {
    v5 = a3;
    v7[0] = 125;
    v7[1] = a3 ^ 0x20;
    objc_msgSend(*a4, "appendBytes:length:", v7, 2);
  }
  return v5;
}

- (id)sendCommand:(unsigned __int8)a3 payload:(char *)a4 payload_length:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v7;
  void *v9;
  void *v10;
  char v11;
  int v12;
  int v13;
  int v14;
  unsigned int v15;
  void *v16;
  id v18;
  char v19;

  LODWORD(v5) = a5;
  v7 = a3;
  -[iAUPServer logCommand:payload:length:](self, "logCommand:payload:length:");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", (v5 + 4));
  v10 = v9;
  v18 = v9;
  if (self->_byteEscape)
  {
    v11 = 126;
  }
  else
  {
    v19 = -1;
    objc_msgSend(v9, "appendBytes:length:", &v19, 1);
    v11 = 92;
  }
  v19 = v11;
  objc_msgSend(v10, "appendBytes:length:", &v19, 1, v18);
  v12 = -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", ((unsigned __int16)(v5 + 1) >> 8), &v18);
  v13 = -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", (v5 + 1), &v18)+ v12;
  v14 = v13 + -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", v7, &v18);
  if ((_DWORD)v5)
  {
    v5 = v5;
    do
    {
      v15 = *a4++;
      v14 += -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", v15, &v18);
      --v5;
    }
    while (v5);
  }
  -[iAUPServer appendByteWithEscaping:toObject:](self, "appendByteWithEscaping:toObject:", -(char)v14, &v18);
  v16 = (void *)-[iAUPServerDelegate writeData:](self->_delegate, "writeData:", v18);

  return v16;
}

- (void)setBootloaderEntry
{
  -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 64, 0, 0);
}

- (id)processManifestProperties:(char *)a3 length:(unsigned int)a4
{
  uint64_t serverState;
  unsigned int v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  _BOOL4 v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
  _QWORD v28[9];
  _QWORD v29[11];

  v29[9] = *MEMORY[0x24BDAC8D0];
  serverState = self->_serverState;
  if ((_DWORD)serverState != 7)
  {
    NSLog(CFSTR("[ProcessManifest] Invalid State=%s\n"), -[iAUPServer serverStateString:](self, "serverStateString:", serverState, *(_QWORD *)&a4));
    return 0;
  }
  if (a4 - 1 <= 3)
  {
    NSLog(CFSTR("%s: Invalid payload length=%d\n"), "-[iAUPServer processManifestProperties:length:]", a4);
    return 0;
  }
  v7 = bswap32(*(_DWORD *)(a3 + 1));
  v8 = -[iAUPServerDelegate getWhitelistedPersonalizationFields](self->_delegate, "getWhitelistedPersonalizationFields");
  v9 = v7 & v8;
  if ((~(v7 & v8) & 0x5F) != 0)
  {
    NSLog(CFSTR("%s: Invalid personalization properties from accessory = %08x\n"), "-[iAUPServer processManifestProperties:length:]", v7 & v8);
    return 0;
  }
  if (a4 - 5 <= 3)
  {
    NSLog(CFSTR("%s: BoardId not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", a4 - 5);
    return 0;
  }
  v10 = bswap32(*(_DWORD *)(a3 + 5));
  if (!(_DWORD)v10)
  {
    NSLog(CFSTR("%s: Invalid boardID = %d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 - 9 <= 3)
  {
    NSLog(CFSTR("%s: ChipId not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", a4 - 9);
    return 0;
  }
  v11 = bswap32(*(_DWORD *)(a3 + 9));
  if (!(_DWORD)v11)
  {
    NSLog(CFSTR("%s: Invalid chipID = %d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 - 13 <= 7)
  {
    NSLog(CFSTR("%s: Ecid not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", a4 - 13);
    return 0;
  }
  v12 = bswap64(*(_QWORD *)(a3 + 13));
  if (!v12)
  {
    NSLog(CFSTR("%s: Invalid ecID = %llu\n"), "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 == 21)
  {
    NSLog(CFSTR("%s: SecurityDomain not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  if (a4 == 22)
  {
    NSLog(CFSTR("%s: ProductionMode not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
    return 0;
  }
  v13 = a3[21];
  v14 = a3[22];
  if ((v9 & 0x20) != 0)
  {
    if (a4 == 23)
    {
LABEL_46:
      NSLog(CFSTR("%s: SecurityMode not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
      return 0;
    }
    v15 = a3[23] != 0;
    v16 = 24;
  }
  else
  {
    v15 = 0;
    v16 = 23;
  }
  if (a4 - v16 <= 0x1F)
  {
    NSLog(CFSTR("%s: Nonce not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", a4 - v16);
    return 0;
  }
  v27 = v15;
  v17 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &a3[v16], 32);
  if (!v17)
  {
    NSLog(CFSTR("%s: Invalid nonce from accessory"), "-[iAUPServer processManifestProperties:length:]");
    return 0;
  }
  v18 = v17;
  v19 = v16 | 0x20;
  if ((v9 & 0x80) != 0)
  {
    if ((_DWORD)v19 == a4)
    {
      NSLog(CFSTR("%s: ChipEpoch not present in remaining bytes=%d\n"), "-[iAUPServer processManifestProperties:length:]", 0);
      return 0;
    }
    v22 = a3[v19];
    LODWORD(v19) = v16 + 33;
    v20 = v22;
    if ((v9 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_23;
  }
  v20 = 0;
  if ((v9 & 0x100) != 0)
  {
LABEL_23:
    if ((_DWORD)v19 != a4)
    {
      v21 = a3[v19] != 0;
      goto LABEL_25;
    }
    goto LABEL_46;
  }
LABEL_20:
  v21 = 0;
LABEL_25:
  v28[0] = CFSTR("BoardID");
  v29[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
  v28[1] = CFSTR("ChipID");
  v29[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
  v28[2] = CFSTR("ECID");
  v29[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
  v28[3] = CFSTR("securityDomain");
  v29[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
  v28[4] = CFSTR("productionMode");
  v29[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14 != 0);
  v28[5] = CFSTR("securityMode");
  if ((v9 & 0x20) != 0)
    v23 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
  else
    v23 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v29[5] = v23;
  v29[6] = v18;
  v28[6] = CFSTR("nonceHash");
  v28[7] = CFSTR("chipEpoch");
  if ((v9 & 0x80) != 0)
    v24 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v20);
  else
    v24 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v29[7] = v24;
  v28[8] = CFSTR("enableMixMatch");
  v29[8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
  v25 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 9);
  NSLog(CFSTR("manifest infoDict from accessory: %@"), v25);
  return v25;
}

- (void)processPersonalizationInfo:(char *)a3 length:(unsigned int)a4
{
  id v5;

  if (!a3 || !a4)
  {
    NSLog(CFSTR("[processPersonalizationInfo] Invalid payload length=%d\n"), a2, a4);
    goto LABEL_6;
  }
  if ((*a3 & 0xF) != 1)
  {
    NSLog(CFSTR("[processPersonalizationInfo] Unsupported infoType = %d\n"), a2, *a3);
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  v5 = -[iAUPServer processManifestProperties:length:](self, "processManifestProperties:length:");
LABEL_7:
  -[iAUPServerDelegate processPersonalizationInfoFromAccessory:](self->_delegate, "processPersonalizationInfoFromAccessory:", v5);
}

- (BOOL)personalizationComplete
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unsigned __int8 currentAsset;

  if (!self->_firmwareBundle)
  {
    NSLog(CFSTR("[personalizationComplete] Invalid state: firmwareBundle = NULL"), a2);
    goto LABEL_12;
  }
  if (self->_currentAsset != 1)
  {
    NSLog(CFSTR("[personalizationComplete] Invalid asset for processing personalization"), a2);
    goto LABEL_12;
  }
  if (-[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID") >= 0x10)
  {
    currentAsset = -[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID");
    NSLog(CFSTR("[RequestDownload] Sending COMMAND_GetPersonalizationInfo"));
    v4 = 1;
    if (!-[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 66, &currentAsset, 1))return v4;
    NSLog(CFSTR("[personalizationComplete] Failed to send next Personalization request"), v5);
LABEL_12:
    currentAsset = -1;
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 99, &currentAsset, 1);
    return 0;
  }
  currentAsset = self->_currentAsset;
  if (-[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 97, &currentAsset, 1))
  {
    NSLog(CFSTR("[personalizationComplete] Failed to send AckRequestDownload"), v3);
    goto LABEL_12;
  }
  -[iAUPServer setServerState:](self, "setServerState:", 6);
  return 1;
}

- (void)setResumeInfo:(char *)a3 length:(unsigned int)a4
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  if ((self->_accessoryCapabilities & 1) != 0)
  {
    if (self->_startEventSent)
    {
      NSLog(CFSTR("[setResumeInfo] Information already sent to delegate, skipping this\n"), a2, a3, *(_QWORD *)&a4);
    }
    else if (a4 == 18)
    {
      v6 = *(unsigned __int16 *)a3;
      v7 = *(_DWORD *)(a3 + 2);
      v8 = *(_DWORD *)(a3 + 6);
      v9 = bswap32(*(_DWORD *)(a3 + 10));
      if (v9 > -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize"))
      {
        v23 = -[FirmwareBundle firmwareImageSize](self->_firmwareBundle, "firmwareImageSize");
        NSLog(CFSTR("[setResumeInfo] Invalid totalBytesForCompleteUpdate = %lu, firmwareImageSize = %lu\n"), v20, v21, v22, v9, v23);
      }
      else
      {
        v13 = bswap32(*(_DWORD *)(a3 + 14));
        if (v13 >= v9)
        {
          NSLog(CFSTR("[setResumeInfo] Invalid totalBytesDownloadedSoFar = %lu, totalBytesForCompleteUpdate = %lu\n"), v10, v11, v12, v13, v9);
        }
        else
        {
          v14 = __rev16(v6);
          v15 = bswap32(v8);
          v16 = (void *)MEMORY[0x24BDBCED8];
          v24[0] = CFSTR("resumeCount");
          v25[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
          v24[1] = CFSTR("cumulativeUpdateTime");
          v25[1] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(v7));
          v24[2] = CFSTR("cumulativeCloakTime");
          v25[2] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
          v24[3] = CFSTR("totalBytesForCompleteUpdate");
          v25[3] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
          v24[4] = CFSTR("totalBytesDownloadedSoFar");
          v25[4] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
          v17 = (void *)objc_msgSend(v16, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 5));
          v18 = v17;
          if ((_DWORD)v14)
            v19 = CFSTR("com.apple.fud.updateResumed");
          else
            v19 = CFSTR("com.apple.fud.updateStarted");
          objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("Event"));
          -[iAUPServerDelegate handleFirmwareUpdateStatus:](self->_delegate, "handleFirmwareUpdateStatus:", v18);
          self->_startEventSent = 1;
          -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 135, 0, 0);
        }
      }
    }
    else
    {
      NSLog(CFSTR("[setResumeInfo] Invalid payload length=%d\n"), a2, a3, *(_QWORD *)&a4, a4);
    }
  }
  else
  {
    NSLog(CFSTR("[setResumeInfo] accessory capabilities not set to allow resume\n"), a2, a3, *(_QWORD *)&a4);
  }
}

- (void)processIdentifyCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  const char *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v4 = *(_QWORD *)&a4;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = "valid";
  if (!a3)
    v7 = "nil";
  NSLog(CFSTR("%s(): payload=%s length=%d \n"), a2, "-[iAUPServer processIdentifyCommand:length:]", v7, a4);
  if (self->_serverState == 1)
  {
    if ((_DWORD)v4 == 1)
    {
      if (*a3 == 2)
      {
        -[iAUPServer setIAUPVersion:](self, "setIAUPVersion:", 2);
        -[iAUPServer setServerState:](self, "setServerState:", 2);
        -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 96, 0, 0);
        -[iAUPServer setServerState:](self, "setServerState:", 3);
        return;
      }
      NSLog(CFSTR("[Identify] Invalid protocol version=%d\n"), *a3);
    }
    else
    {
      NSLog(CFSTR("[Identify] Invalid payload length=%d\n"), v4);
    }
  }
  else
  {
    NSLog(CFSTR("[Identify] Invalid State=%s\n"), -[iAUPServer serverStateString:](self, "serverStateString:"));
  }
  -[iAUPServer setIAUPVersion:](self, "setIAUPVersion:", 2);
  -[iAUPServer setServerState:](self, "setServerState:", 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -1, 0);
  v9 = CFSTR("Event");
  v10[0] = CFSTR("com.apple.fud.updateFailed");
  -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1), v8);

}

- (void)processRequestDownloadCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t serverState;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HSModel *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _BYTE v20[2];

  v4 = *(_QWORD *)&a4;
  v7 = "valid";
  if (!a3)
    v7 = "nil";
  NSLog(CFSTR("%s(): payload=%s length=%d \n"), a2, "-[iAUPServer processRequestDownloadCommand:length:]", v7, a4);
  if (!(_DWORD)v4)
  {
    NSLog(CFSTR("[RequestDownload] Invalid payload length=%d\n"), 0);
    return;
  }
  if (*a3 >= 2u)
  {
    NSLog(CFSTR("[RequestDownload] Unsupported asset type=%d\n"), *a3);
    return;
  }
  if (self->_serverState != 3)
  {
    NSLog(CFSTR("[RequestDownload] Invalid State=%s\n"), -[iAUPServer serverStateString:](self, "serverStateString:"));
    goto LABEL_27;
  }
  -[iAUPServer setServerState:](self, "setServerState:", 4);
  if (*a3 != 1)
  {
    if (!*a3)
    {
      if (v4 <= 5)
      {
        NSLog(CFSTR("[RequestDownload] Invalid HS Asset payload length=%d\n"), v4);
      }
      else
      {
        serverState = self->_serverState;
        v9 = a3[1];
        v10 = a3[2];
        v11 = a3[3];
        v12 = a3[4];
        v13 = a3[5];
        v14 = objc_alloc_init(HSModel);
        self->_hsModel = v14;
        if (v14)
        {
          -[HSModel setDelegate:](v14, "setDelegate:", self);
          -[iAUPServer setServerState:](self, "setServerState:", 5);
          -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 0);
          if (-[HSModel getHSModelForEngineMajorVersion:minorVersion:numHSModels:modelBuffer:length:](self->_hsModel, "getHSModelForEngineMajorVersion:minorVersion:numHSModels:modelBuffer:length:", v10 | (v9 << 8), v12 | (v11 << 8), v13, a3 + 6, (v4 - 6)))
          {
            return;
          }
          NSLog(CFSTR("[RequestDownload] Failed to create HS Model instance\n"));
          -[iAUPServer setServerState:](self, "setServerState:", serverState);
        }
        else
        {
          NSLog(CFSTR("[RequestDownload] Failed to create HS Model instance\n"), v18);
        }
      }
    }
    goto LABEL_27;
  }
  if (-[iAUPServer iAUPVersion](self, "iAUPVersion") <= 1)
  {
    NSLog(CFSTR("[RequestDownload] RequestDownload not supported in this protocol version"), v18);
    goto LABEL_27;
  }
  if (-[iAUPServer iAUPVersion](self, "iAUPVersion") != 2)
  {
LABEL_27:
    v16 = 0;
    v17 = 0;
    goto LABEL_28;
  }
  if (-[iAUPServerDelegate updateRequiresPersonalization](self->_delegate, "updateRequiresPersonalization"))
  {
    v19 = -[iAUPServerDelegate getPersonalizationID](self->_delegate, "getPersonalizationID");
    NSLog(CFSTR("[RequestDownload] Sending COMMAND_GetPersonalizationInfo"));
    if (!-[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 66, &v19, 1))
    {
      v15 = 7;
LABEL_19:
      -[iAUPServer setServerState:](self, "setServerState:", v15);
      -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 1);
      return;
    }
    v16 = CFSTR("Failed to send Personalization Request");
    v17 = 4294967291;
  }
  else
  {
    v19 = 1;
    if (!-[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 97, &v19, 1))
    {
      v15 = 6;
      goto LABEL_19;
    }
    NSLog(CFSTR("[RequestDownload] Failed to send AckRequestDownload"));
    v17 = 0;
    v16 = 0;
  }
LABEL_28:
  -[iAUPServer setCurrentAsset:](self, "setCurrentAsset:", 4);
  if (*a3 == 1)
  {
    v20[0] = -1;
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 99, v20, 1);
    -[iAUPServerDelegate handleSessionError:message:](self->_delegate, "handleSessionError:message:", v17, v16);
  }
  else if (!*a3)
  {
    -[iAUPServer setServerState:](self, "setServerState:", 3);
    v20[0] = *a3;
    v20[1] = 0;
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 97, v20, 2);

    self->_hsModel = 0;
  }
}

- (void)processDownloadCompleteCommand:(char *)a3 length:(unsigned int)a4
{
  uint64_t v4;
  const char *v7;
  int serverState;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)&a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = "valid";
  if (!a3)
    v7 = "nil";
  NSLog(CFSTR("%s(): payload=%s length=%d \n"), a2, "-[iAUPServer processDownloadCompleteCommand:length:]", v7, a4);
  serverState = self->_serverState;
  if (serverState != 3 && serverState != 6)
  {
    NSLog(CFSTR("[DownloadComplete] Invalid State=%s\n"), -[iAUPServer serverStateString:](self, "serverStateString:"));
LABEL_11:
    -[iAUPServer setServerState:](self, "setServerState:", 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -1, 0);
    v13 = CFSTR("Event");
    v14 = CFSTR("com.apple.fud.updateFailed");
    -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1), v12);

    return;
  }
  if ((_DWORD)v4 != 2)
  {
    NSLog(CFSTR("[DownloadComplete] Invalid payload length=%d\n"), v4);
    goto LABEL_11;
  }
  v10 = a3[1];
  self->_restartRequired |= v10 >> 7;
  self->_sleepWakeRequired |= (a3[1] & 0x40) != 0;
  v11 = (a3[1] >> 5) & 1 | self->_urgentUpdate;
  self->_urgentUpdate |= (a3[1] & 0x20) != 0;
  NSLog(CFSTR("[DownloadComplete] downloadStatus=%d noMoreDownloads=%d urgentUpdateRequest=%d\n"), *a3, v10 & 1, v11);
  if ((v10 & 1) != 0)
  {
    -[iAUPServer setServerState:](self, "setServerState:", 0);
    v15 = CFSTR("Event");
    v16[0] = CFSTR("com.apple.fud.updateCompleted");
    -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1), 0);
  }
  else
  {
    -[iAUPServer setServerState:](self, "setServerState:", 3);
    -[iAUPServer sendCommand:payload:payload_length:](self, "sendCommand:payload:payload_length:", 98, 0, 0);
  }
  self->_currentAsset = 4;

  self->_firmwareBundle = 0;
}

- (void)processNotifyAccessoryErrorCommand:(char *)a3 length:(unsigned int)a4
{
  const char *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v6 = "valid";
  if (!a3)
    v6 = "nil";
  NSLog(CFSTR("%s(): payload=%s length=%d \n"), a2, "-[iAUPServer processNotifyAccessoryErrorCommand:length:]", v6, a4);
  NSLog(CFSTR("[NotifyAccessoryError] Accessory notified error reason=%d\n"), *a3);
  -[iAUPServer setServerState:](self, "setServerState:", 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("com.apple.iAUPServer.ErrorDomain"), -1, 0);
  v8 = CFSTR("Event");
  v9[0] = CFSTR("com.apple.fud.updateFailed");
  -[iAUPServerDelegate firmwareUpdateComplete:error:](self->_delegate, "firmwareUpdateComplete:error:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1), v7);

  self->_firmwareBundle = 0;
}

- (void)accessoryDisconnected
{
  HSModel *hsModel;

  NSLog(CFSTR("%s()\n"), a2, "-[iAUPServer accessoryDisconnected]");
  hsModel = self->_hsModel;
  if (hsModel)
  {
    -[HSModel setDelegate:](hsModel, "setDelegate:", 0);

    self->_hsModel = 0;
  }
}

- (void)setHSModel:(id)a3 fallbackModel:(id)a4 error:(id)a5
{
  NSObject *dispatchQ;
  _QWORD v6[8];

  dispatchQ = self->_dispatchQ;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__iAUPServer_setHSModel_fallbackModel_error___block_invoke;
  v6[3] = &unk_24F78C2B0;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = self;
  dispatch_async(dispatchQ, v6);
}

- (char)commandString:(int)a3
{
  char *result;

  if (a3 <= 65)
  {
    switch(a3)
    {
      case 0:
        result = "COMMAND_GetMetadata";
        break;
      case 1:
        result = "COMMAND_NotifyProcessStatus";
        break;
      case 2:
        result = "COMMAND_SetBlockTransferSize";
        break;
      case 3:
        result = "COMMAND_SetBaseImageTransferAddress";
        break;
      case 4:
        result = "COMMAND_GetObjectSize";
        break;
      case 5:
        result = "COMMAND_GetObjectBlock";
        break;
      case 6:
        result = "COMMAND_SetAccessoryCapabilities";
        break;
      case 7:
        result = "COMMAND_SetResumeInfo";
        break;
      default:
        result = "COMMAND_iAUPv2_Identify";
        switch(a3)
        {
          case ' ':
            return result;
          case '!':
            result = "COMMAND_iAUPv2_RequestDownload";
            break;
          case '"':
            result = "COMMAND_iAUPv2_DownloadComplete";
            break;
          case '#':
            result = "COMMAND_iAUPv2_NotifyAccessoryError";
            break;
          default:
LABEL_31:
            result = "unknown";
            break;
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 128:
        result = "COMMAND_RetMetadata";
        break;
      case 129:
        result = "COMMAND_AckNotifyProcessStatus";
        break;
      case 130:
        result = "COMMAND_AckSetBlockTransferSize";
        break;
      case 131:
        result = "COMMAND_AckSetBaseImageTransferAddress";
        break;
      case 132:
        result = "COMMAND_RetObjectSize";
        break;
      case 133:
        result = "COMMAND_RetObjectBlock";
        break;
      case 134:
        result = "COMMAND_AckAccessoryCapabilities";
        break;
      case 135:
        result = "COMMAND_AckResumeInfo";
        break;
      default:
        switch(a3)
        {
            result = "COMMAND_iAUPv2_AckIdentify";
            break;
          case 'a':
            result = "COMMAND_iAUPv2_AckRequestDownload";
            break;
          case 'b':
            result = "COMMAND_iAUPv2_AckDownloadComplete";
            break;
          case 'c':
            result = "COMMAND_iAUPv2_NotifyDeviceError";
            break;
          default:
            if (a3 != 66)
              goto LABEL_31;
            result = "COMMAND_GetPersonalizationInfo";
            break;
        }
        break;
    }
  }
  return result;
}

- (char)assetTypeString:(int)a3
{
  if (a3 > 2)
    return "unknown";
  else
    return off_24F78C2D0[a3];
}

- (char)serverStateString:(int)a3
{
  if (a3 > 7)
    return "Unknown";
  else
    return off_24F78C2E8[a3];
}

- (char)parserStateString:(int)a3
{
  if (a3 != 0 && a3 < 0xFFFFFFFC)
    return "PayloadCountdown";
  else
    return off_24F78C328[a3 + 4];
}

- (iAUPServerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (iAUPServerDelegate *)a3;
}

- (FirmwareBundle)firmwareBundle
{
  return self->_firmwareBundle;
}

- (BOOL)byteEscape
{
  return self->_byteEscape;
}

- (void)setByteEscape:(BOOL)a3
{
  self->_byteEscape = a3;
}

- (int)serverState
{
  return self->_serverState;
}

- (int)parserState
{
  return self->_parserState;
}

- (BOOL)restartRequired
{
  return self->_restartRequired;
}

- (BOOL)sleepWakeRequired
{
  return self->_sleepWakeRequired;
}

- (BOOL)urgentUpdate
{
  return self->_urgentUpdate;
}

- (BOOL)ackAppReentry
{
  return self->_ackAppReentry;
}

- (void)setAckAppReentry:(BOOL)a3
{
  self->_ackAppReentry = a3;
}

- (OS_dispatch_queue)dispatchQ
{
  return self->_dispatchQ;
}

- (void)setDispatchQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (unsigned)iAUPVersion
{
  return self->_iAUPVersion;
}

- (void)setIAUPVersion:(unsigned __int8)a3
{
  self->_iAUPVersion = a3;
}

- (unsigned)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(unsigned __int8)a3
{
  self->_currentAsset = a3;
}

@end
