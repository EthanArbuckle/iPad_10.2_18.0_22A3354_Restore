@implementation UARPSuperBinaryAssetTLV

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt8:(unsigned __int8)a4
{
  UARPSuperBinaryAssetTLV *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val8 = a4;
    result->_valueType = 0;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt16:(unsigned __int16)a4
{
  UARPSuperBinaryAssetTLV *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val16 = a4;
    result->_valueType = 1;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt32:(unsigned int)a4
{
  UARPSuperBinaryAssetTLV *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val32 = a4;
    result->_valueType = 2;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 unsignedInt64:(unint64_t)a4
{
  UARPSuperBinaryAssetTLV *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_val64 = a4;
    result->_valueType = 3;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 dataValue:(id)a4
{
  id v7;
  UARPSuperBinaryAssetTLV *v8;
  UARPSuperBinaryAssetTLV *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UARPSuperBinaryAssetTLV;
  v8 = -[UARPSuperBinaryAssetTLV init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_data, a4);
    v9->_valueType = 4;
  }

  return v9;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 stringValue:(id)a4
{
  id v6;
  UARPSuperBinaryAssetTLV *v7;
  UARPSuperBinaryAssetTLV *v8;
  uint64_t v9;
  NSString *string;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 5;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tagValue:(id)a4
{
  id v6;
  UARPSuperBinaryAssetTLV *v7;
  UARPSuperBinaryAssetTLV *v8;
  uint64_t v9;
  NSString *string;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    string = v8->_string;
    v8->_string = (NSString *)v9;

    v8->_valueType = 7;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 urlValue:(id)a4
{
  id v6;
  UARPSuperBinaryAssetTLV *v7;
  UARPSuperBinaryAssetTLV *v8;
  uint64_t v9;
  NSURL *url;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetTLV;
  v7 = -[UARPSuperBinaryAssetTLV init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    v8->_valueType = 6;
  }

  return v8;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 version:(UARPVersion *)a4
{
  UARPSuperBinaryAssetTLV *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_version = *a4;
    result->_valueType = 8;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 versionInfo:(uarpPayloadVersionInfo *)a4
{
  UARPSuperBinaryAssetTLV *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UARPSuperBinaryAssetTLV;
  result = -[UARPSuperBinaryAssetTLV init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    v7 = *(_OWORD *)&a4->tag.char1;
    v8 = *(_OWORD *)&a4->activeVersion.build;
    result->_versionInfo.stagedVersion.build = a4->stagedVersion.build;
    *(_OWORD *)&result->_versionInfo.activeVersion.build = v8;
    *(_OWORD *)&result->_versionInfo.tag.char1 = v7;
    result->_valueType = 9;
  }
  return result;
}

- (UARPSuperBinaryAssetTLV)initWithType:(unint64_t)a3 tlvLength:(unint64_t)a4 tlvValue:(void *)a5
{
  UARPSuperBinaryAssetTLV *v8;
  uint64_t v9;
  uint64_t v10;
  UARPSuperBinaryAssetTLV *v11;
  void *v12;
  void *v13;
  _BYTE v15[20];
  __int128 v16;

  if (!a5)
    goto LABEL_41;
  if ((uint64_t)a3 <= 2293403905)
  {
    if ((uint64_t)a3 <= 1155952128)
    {
      if ((uint64_t)a3 <= 272691968)
      {
        switch(a3)
        {
          case 0x488E200uLL:
          case 0x488E203uLL:
            goto LABEL_19;
          case 0x488E201uLL:
          case 0x488E202uLL:
            goto LABEL_44;
          case 0x488E207uLL:
            goto LABEL_38;
          default:
            goto LABEL_50;
        }
      }
      if ((uint64_t)a3 > 538280448)
      {
        if (a3 != 538280449)
        {
          if (a3 != 1155952128)
          {
LABEL_50:
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a4);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = -[UARPSuperBinaryAssetTLV initWithType:dataValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:dataValue:", a3, v12);
LABEL_48:

            goto LABEL_49;
          }
          v16 = 0u;
          *(_OWORD *)&v15[4] = 0u;
          *(_DWORD *)v15 = *(_DWORD *)a5;
          uarpVersionEndianSwap((unsigned int *)a5 + 1, &v15[4]);
          uarpVersionEndianSwap((unsigned int *)a5 + 5, &v16);
          v8 = -[UARPSuperBinaryAssetTLV initWithType:versionInfo:]([UARPSuperBinaryAssetTLV alloc], "initWithType:versionInfo:", 1155952128, v15);
          goto LABEL_37;
        }
LABEL_35:
        if (a4 == 4)
        {
          v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt32:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt32:", a3, uarpHtonl(*(_DWORD *)a5));
          goto LABEL_37;
        }
        goto LABEL_41;
      }
      if (a3 - 272691969 >= 2)
      {
        v10 = 538280448;
LABEL_43:
        if (a3 != v10)
          goto LABEL_50;
      }
    }
    else
    {
      if ((uint64_t)a3 > 2158597887)
      {
        if (a3 - 2158597888u >= 3)
          goto LABEL_50;
        goto LABEL_44;
      }
      if (a3 - 1619725824 <= 8)
      {
        if (((1 << a3) & 0x109) != 0)
        {
LABEL_19:
          if (a4 == 2)
          {
            v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt16:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt16:", a3, uarpHtons(*(unsigned __int16 *)a5));
            goto LABEL_37;
          }
LABEL_41:
          v11 = 0;
          goto LABEL_49;
        }
        if (((1 << a3) & 6) != 0)
          goto LABEL_44;
        if (a3 == 1619725831)
        {
LABEL_38:
          *(_QWORD *)v15 = 0;
          *(_QWORD *)&v15[8] = 0;
          uarpVersionEndianSwap((unsigned int *)a5, v15);
          v8 = -[UARPSuperBinaryAssetTLV initWithType:version:]([UARPSuperBinaryAssetTLV alloc], "initWithType:version:", a3, v15);
          goto LABEL_37;
        }
      }
      if (a3 != 1155952129)
      {
        v9 = 1483412481;
LABEL_34:
        if (a3 != v9)
          goto LABEL_50;
        goto LABEL_35;
      }
    }
LABEL_44:
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a5, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
    if (v13)
      v11 = -[UARPSuperBinaryAssetTLV initWithType:stringValue:]([UARPSuperBinaryAssetTLV alloc], "initWithType:stringValue:", a3, v13);
    else
      v11 = 0;

    goto LABEL_48;
  }
  if ((uint64_t)a3 <= 3291140105)
  {
    switch(a3)
    {
      case 0x88B29102uLL:
      case 0x88B29115uLL:
      case 0x88B29116uLL:
      case 0x88B29117uLL:
      case 0x88B29119uLL:
      case 0x88B2911AuLL:
      case 0x88B29123uLL:
      case 0x88B29124uLL:
        goto LABEL_19;
      case 0x88B29103uLL:
      case 0x88B29112uLL:
      case 0x88B2911FuLL:
      case 0x88B29134uLL:
      case 0x88B29136uLL:
        goto LABEL_44;
      case 0x88B29104uLL:
      case 0x88B29105uLL:
      case 0x88B29109uLL:
      case 0x88B2910AuLL:
      case 0x88B2910BuLL:
      case 0x88B2911DuLL:
      case 0x88B2911EuLL:
      case 0x88B29120uLL:
      case 0x88B29125uLL:
        goto LABEL_35;
      case 0x88B29106uLL:
      case 0x88B2911BuLL:
        if (a4 != 8)
          goto LABEL_41;
        v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt64:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt64:", a3, uarpHtonll(*(_QWORD *)a5));
        goto LABEL_37;
      case 0x88B29107uLL:
      case 0x88B29108uLL:
      case 0x88B2910CuLL:
      case 0x88B2910DuLL:
      case 0x88B2910EuLL:
      case 0x88B2910FuLL:
      case 0x88B29110uLL:
      case 0x88B29111uLL:
      case 0x88B29113uLL:
      case 0x88B29114uLL:
      case 0x88B2911CuLL:
      case 0x88B29129uLL:
      case 0x88B2912AuLL:
      case 0x88B2912BuLL:
      case 0x88B2912CuLL:
      case 0x88B2912DuLL:
      case 0x88B2912EuLL:
      case 0x88B2912FuLL:
      case 0x88B29130uLL:
      case 0x88B29135uLL:
        goto LABEL_50;
      case 0x88B29118uLL:
      case 0x88B29121uLL:
      case 0x88B29122uLL:
      case 0x88B29126uLL:
      case 0x88B29127uLL:
      case 0x88B29128uLL:
      case 0x88B29131uLL:
      case 0x88B29132uLL:
      case 0x88B29133uLL:
        goto LABEL_5;
      default:
        if (a3 == 3291140096)
          goto LABEL_35;
        v9 = 3291140105;
        goto LABEL_34;
    }
  }
  if ((uint64_t)a3 <= 4042160639)
  {
    switch(a3)
    {
      case 0xCCD28104uLL:
      case 0xCCD2810CuLL:
      case 0xCCD2810FuLL:
      case 0xCCD28119uLL:
        goto LABEL_35;
      case 0xCCD28105uLL:
      case 0xCCD28106uLL:
      case 0xCCD28107uLL:
      case 0xCCD28108uLL:
      case 0xCCD28109uLL:
      case 0xCCD2810AuLL:
      case 0xCCD28113uLL:
      case 0xCCD28115uLL:
      case 0xCCD28116uLL:
      case 0xCCD28118uLL:
        goto LABEL_50;
      case 0xCCD2810BuLL:
      case 0xCCD2810DuLL:
      case 0xCCD2810EuLL:
      case 0xCCD28110uLL:
      case 0xCCD28112uLL:
      case 0xCCD28117uLL:
        goto LABEL_19;
      case 0xCCD28111uLL:
      case 0xCCD28114uLL:
        goto LABEL_44;
      case 0xCCD2811AuLL:
        goto LABEL_5;
      default:
        v10 = 3291140106;
        goto LABEL_43;
    }
  }
  if (a3 - 4042160640u < 2)
    goto LABEL_44;
  if (a3 != 4042160643)
    goto LABEL_50;
LABEL_5:
  if (a4 != 1)
    goto LABEL_41;
  v8 = -[UARPSuperBinaryAssetTLV initWithType:unsignedInt8:]([UARPSuperBinaryAssetTLV alloc], "initWithType:unsignedInt8:", a3, *(unsigned __int8 *)a5);
LABEL_37:
  v11 = v8;
LABEL_49:

  return v11;
}

- (NSString)valueAsString
{
  if (self->_valueType == 5)
    return self->_string;
  else
    return (NSString *)0;
}

- (NSURL)valueAsURL
{
  if (self->_valueType == 6)
    return self->_url;
  else
    return (NSURL *)0;
}

- (NSNumber)valueAsNumber
{
  void *v2;
  NSNumber *result;

  switch(self->_valueType)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_val8);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_val16);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_val32);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_val64);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      result = v2;
      break;
    default:
      result = (NSNumber *)0;
      break;
  }
  return result;
}

- (NSData)valueAsData
{
  if (self->_valueType == 4)
    return self->_data;
  else
    return (NSData *)0;
}

- (UARPAssetVersion)valueAsVersion
{
  UARPAssetVersion *v2;

  if (self->_valueType == 8)
    v2 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", self->_version.major, self->_version.minor, self->_version.release, self->_version.build);
  else
    v2 = 0;
  return v2;
}

- (NSArray)valueAsTLVs
{
  void *v2;
  void *v3;

  if (self->_valueType == 4)
  {
    +[UARPSuperBinaryAssetTLV decomposeTLVs:](UARPSuperBinaryAssetTLV, "decomposeTLVs:", self->_data);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSArray *)v3;
}

- (id)generateTLV:(id *)a3
{
  id v4;
  unsigned __int8 *p_val8;
  void *v6;
  NSUInteger v7;
  id v8;
  id result;
  const char *v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  _BYTE v15[20];
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  LODWORD(v17) = uarpHtonl(self->_type);
  switch(self->_valueType)
  {
    case 0:
      HIDWORD(v17) = uarpHtonl(1u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      p_val8 = &self->_val8;
      v6 = v4;
      v7 = 1;
      goto LABEL_15;
    case 1:
      HIDWORD(v17) = uarpHtonl(2u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      *(_WORD *)v15 = uarpHtons(self->_val16);
      p_val8 = v15;
      v6 = v4;
      v7 = 2;
      goto LABEL_15;
    case 2:
      HIDWORD(v17) = uarpHtonl(4u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      *(_DWORD *)v15 = uarpHtonl(self->_val32);
      goto LABEL_12;
    case 3:
      HIDWORD(v17) = uarpHtonl(8u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      *(_QWORD *)v15 = uarpHtonll(self->_val64);
      p_val8 = v15;
      v6 = v4;
      v7 = 8;
      goto LABEL_15;
    case 4:
      HIDWORD(v17) = uarpHtonl(-[NSData length](self->_data, "length"));
      v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v8, "appendBytes:length:", &v17, 8);
      objc_msgSend(v8, "appendData:", self->_data);
      return v8;
    case 5:
      HIDWORD(v17) = uarpHtonl(-[NSString length](self->_string, "length"));
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      v10 = -[NSString UTF8String](self->_string, "UTF8String");
      v7 = -[NSString length](self->_string, "length");
      v6 = v4;
      p_val8 = (unsigned __int8 *)v10;
      goto LABEL_15;
    case 6:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", self->_url, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HIDWORD(v17) = uarpHtonl(objc_msgSend(v11, "length"));
      v12 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v12, "appendBytes:length:", &v17, 8);
      v13 = objc_retainAutorelease(v11);
      objc_msgSend(v12, "appendBytes:length:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      return v12;
    case 7:
      v14 = -[NSString UTF8String](self->_string, "UTF8String");
      if (-[NSString length](self->_string, "length") != 4)
        goto LABEL_13;
      *(_DWORD *)v15 = uarpPayloadTagPack((unsigned int *)v14);
      HIDWORD(v17) = uarpHtonl(4u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8, *(_QWORD *)v15);
LABEL_12:
      p_val8 = v15;
      v6 = v4;
      v7 = 4;
LABEL_15:
      objc_msgSend(v6, "appendBytes:length:", p_val8, v7, *(_QWORD *)v15);
      result = v4;
      break;
    case 8:
      HIDWORD(v17) = uarpHtonl(0x10u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      *(_OWORD *)v15 = 0uLL;
      uarpVersionEndianSwap(&self->_version.major, v15);
      p_val8 = v15;
      v6 = v4;
      v7 = 16;
      goto LABEL_15;
    case 9:
      HIDWORD(v17) = uarpHtonl(0x24u);
      v4 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v4, "appendBytes:length:", &v17, 8);
      v16 = 0u;
      *(_OWORD *)&v15[4] = 0u;
      *(UARP4ccTag *)v15 = self->_versionInfo.tag;
      uarpVersionEndianSwap(&self->_versionInfo.activeVersion.major, &v15[4]);
      uarpVersionEndianSwap(&self->_versionInfo.stagedVersion.major, &v16);
      p_val8 = v15;
      v6 = v4;
      v7 = 36;
      goto LABEL_15;
    default:
LABEL_13:
      result = 0;
      break;
  }
  return result;
}

+ (id)decomposeTLVs:(id)a3
{
  id v3;
  void *v4;
  __int128 v5;
  unint64_t v6;
  NSObject *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  UARPSuperBinaryAssetTLV *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  UARPSuperBinaryAssetTLV *v16;
  __int128 v18;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v20 = 0;
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v3, "length"))
  {
    v6 = 0;
    v7 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v5 = 67109634;
    v18 = v5;
    while (1)
    {
      objc_msgSend(v3, "getBytes:range:", &v20, v6, 8, v18);
      LODWORD(v20) = uarpHtonl(v20);
      v8 = uarpHtonl(HIDWORD(v20));
      HIDWORD(v20) = v8;
      if (!(v20 | v8))
        break;
      v9 = v6 + 8;
      v10 = v8;
      objc_msgSend(v3, "subdataWithRange:", v9, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [UARPSuperBinaryAssetTLV alloc];
      v13 = v20;
      v14 = HIDWORD(v20);
      v15 = objc_retainAutorelease(v11);
      v16 = -[UARPSuperBinaryAssetTLV initWithType:tlvLength:tlvValue:](v12, "initWithType:tlvLength:tlvValue:", v13, v14, objc_msgSend(v15, "bytes"));
      if (v16)
      {
        objc_msgSend(v4, "addObject:", v16);
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v18;
        v22 = v20;
        v23 = 1024;
        v24 = HIDWORD(v20);
        v25 = 2112;
        v26 = a1;
        _os_log_error_impl(&dword_212D08000, v7, OS_LOG_TYPE_ERROR, "attempting to add a nil tlv (T=0x%08x, L=%u) to superbinary %@", buf, 0x18u);
      }
      v6 = v9 + v10;

      if (v6 >= objc_msgSend(v3, "length"))
        goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[UARPSuperBinaryAssetTLV decomposeTLVs:].cold.1();
  }
LABEL_12:

  return v4;
}

- (id)description
{
  id v3;
  NSData *data;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("TLV - "));
  objc_msgSend(v3, "appendFormat:", CFSTR("Type = 0x%08x"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  switch(self->_valueType)
  {
    case 0:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 1);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %hhu"), self->_val8, v8, v9, v10);
      return v3;
    case 1:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 2);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %hu"), self->_val16, v8, v9, v10);
      return v3;
    case 2:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 4);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %u"), self->_val32, v8, v9, v10);
      return v3;
    case 3:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 8);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %llu"), self->_val64, v8, v9, v10);
      return v3;
    case 4:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), -[NSData length](self->_data, "length"));
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      data = self->_data;
      goto LABEL_11;
    case 5:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), -[NSString length](self->_string, "length"));
      goto LABEL_10;
    case 6:
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", self->_url, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), objc_msgSend(v5, "length"));
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %@"), self->_url);

      return v3;
    case 7:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = 4"), v7);
LABEL_10:
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      data = (NSData *)self->_string;
LABEL_11:
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %@"), data, v8, v9, v10);
      break;
    case 8:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 16);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Value = %d.%d.%d.%d"), self->_version.major, self->_version.minor, self->_version.release, self->_version.build);
      break;
    case 9:
      objc_msgSend(v3, "appendFormat:", CFSTR("Length = %lu"), 36);
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
      objc_msgSend(v3, "appendFormat:", CFSTR("Payload Tag = %c%c%c%c, "), self->_versionInfo.tag.char1, self->_versionInfo.tag.char2, self->_versionInfo.tag.char3, self->_versionInfo.tag.char4);
      objc_msgSend(v3, "appendFormat:", CFSTR("Active Firmware Version = %d.%d.%d.%d, "), self->_versionInfo.activeVersion.major, self->_versionInfo.activeVersion.minor, self->_versionInfo.activeVersion.release, self->_versionInfo.activeVersion.build);
      objc_msgSend(v3, "appendFormat:", CFSTR("Staged Firmware Version = %d.%d.%d.%d,"), self->_versionInfo.stagedVersion.major, self->_versionInfo.stagedVersion.minor, self->_versionInfo.stagedVersion.release, self->_versionInfo.stagedVersion.build);
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)findTLVWithType:(unint64_t)a3 tlvs:(id)a4
{
  void *v4;
  void *v5;

  +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVsWithType:tlvs:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)findTLVsWithType:(unint64_t)a3 tlvs:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (_QWORD)v15) == a3)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (void)decomposeTLVs:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "TLV type and length both equal to zero", v0, 2u);
}

@end
