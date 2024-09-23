@implementation HMDStructuredReader

+ (id)extendedTypeReaderWithReader:(id)a3
{
  id v3;
  HMDExtendedTypeReader *v4;

  v3 = a3;
  v4 = -[HMDExtendedTypeReader initWithReader:]([HMDExtendedTypeReader alloc], "initWithReader:", v3);

  return v4;
}

+ (id)readerFromOPACKData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = (void *)OPACKDecodeData();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDStructuredReader readerWithError:]((uint64_t)a1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDStructuredReader readerWithError:]((uint64_t)a1, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (HMDTokenBasedStructuredReader)readerWithError:(uint64_t)a1
{
  id v2;
  HMDTokenBasedStructuredReader *v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(HMDTokenBasedStructuredReader);
  -[HMDTokenBasedStructuredReader failWithError:](v3, "failWithError:", v2);

  return v3;
}

- (id)readLogicalValueAsObject
{
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  id result;
  void *v10;

  v3 = 0;
  switch(-[HMDStructuredReader tokenType](self, "tokenType"))
  {
    case -2:
      goto LABEL_13;
    case 6:
      -[HMDStructuredReader readNull](self, "readNull");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDStructuredReader readBoolean](self, "readBoolean"));
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8:
      -[HMDStructuredReader readString](self, "readString");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      -[HMDStructuredReader readNumber](self, "readNumber");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 10:
      -[HMDStructuredReader readData](self, "readData");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 11:
      -[HMDStructuredReader readDate](self, "readDate");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 12:
      -[HMDStructuredReader readUUID](self, "readUUID");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v3 = (void *)v4;
LABEL_13:
      result = v3;
      break;
    default:
      v10 = 0;
      v5 = -[HMDStructuredDataFoundationOutputPointerWriter initWithOutput:]([HMDStructuredDataFoundationOutputPointerWriter alloc], &v10);
      -[HMDStructuredReader copyLogicalValueToWriter:](self, "copyLogicalValueToWriter:", v5);
      -[HMDStructuredDataStream error](self, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      if (v6)
        v7 = 0;
      v8 = v7;

      result = v8;
      break;
  }
  return result;
}

+ (id)readerFromObject:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v7;
  SEL v8;
  id v9;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[HMDStructuredDataFoundationReader initWithInput:]([HMDStructuredDataFoundationReader alloc], v3);

    return v5;
  }
  else
  {
    v7 = (void *)_HMFPreconditionFailure();
    return +[HMDStructuredReader readerFromObjectWithExtendedTypes:](v7, v8, v9);
  }
}

+ (id)readerFromObjectWithExtendedTypes:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "readerFromObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDStructuredReader extendedTypeReaderWithReader:](HMDStructuredReader, "extendedTypeReaderWithReader:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)tokenType
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (unint64_t)beginArray
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)endArray
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (unint64_t)beginDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readDictionaryKey
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)endDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)readNull
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)readBoolean
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readNumber
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readData
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readDate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)readUUID
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (_HMDStructuredDataToken)readToken
{
  int64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  int64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _HMDStructuredDataToken result;

  v3 = -[HMDStructuredReader tokenType](self, "tokenType");
  v4 = 0;
  v5 = -1;
  switch(v3)
  {
    case -2:
      -[HMDStructuredDataStream error](self, "error");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = -2;
      break;
    case -1:
      break;
    case 1:
      v6 = -[HMDStructuredReader beginArray](self, "beginArray");
      if (v6 != -1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 1;
        goto LABEL_8;
      }
      v4 = 0;
      v5 = 1;
      break;
    case 2:
      -[HMDStructuredReader endArray](self, "endArray");
      v4 = 0;
      v5 = 2;
      break;
    case 3:
      v7 = -[HMDStructuredReader beginDictionary](self, "beginDictionary");
      if (v7 == -1)
      {
        v4 = 0;
        v5 = 3;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        v5 = 3;
LABEL_8:

      }
      break;
    case 4:
      -[HMDStructuredReader endDictionary](self, "endDictionary");
      v4 = 0;
      v5 = 4;
      break;
    case 5:
      -[HMDStructuredReader readDictionaryKey](self, "readDictionaryKey");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 5;
      break;
    case 6:
      -[HMDStructuredReader readNull](self, "readNull");
      v4 = 0;
      v5 = 6;
      break;
    case 7:
      v8 = -[HMDStructuredReader readBoolean](self, "readBoolean");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 7;
      break;
    case 8:
      -[HMDStructuredReader readString](self, "readString");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 8;
      break;
    case 9:
      -[HMDStructuredReader readNumber](self, "readNumber");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 9;
      break;
    case 10:
      -[HMDStructuredReader readData](self, "readData");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 10;
      break;
    case 11:
      -[HMDStructuredReader readDate](self, "readDate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 11;
      break;
    case 12:
      -[HMDStructuredReader readUUID](self, "readUUID");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 12;
      break;
    default:
      v11 = (void *)MEMORY[0x24BDBCE88];
      v12 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid token type (%zd)"), v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v14);
  }
  v9 = v5;
  v10 = v4;
  result.value = v10;
  result.type = v9;
  return result;
}

- (void)skipToken
{
  id v2;

  -[HMDStructuredReader readToken](self, "readToken");

}

- (void)skipLogicalValue
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __39__HMDStructuredReader_skipLogicalValue__block_invoke;
  v2[3] = &unk_24E79C240;
  v2[4] = self;
  -[HMDStructuredReader _processLogicalValueWithBlock:](self, v2);
}

- (void)copyLogicalValueToWriter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HMDStructuredReader *v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__HMDStructuredReader_copyLogicalValueToWriter___block_invoke;
  v6[3] = &unk_24E79C0A8;
  v9 = v10;
  v5 = v4;
  v7 = v5;
  v8 = self;
  -[HMDStructuredReader _processLogicalValueWithBlock:](self, v6);

  _Block_object_dispose(v10, 8);
}

void __48__HMDStructuredReader_copyLogicalValueToWriter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "skipToken");
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3 = objc_msgSend(*(id *)(a1 + 40), "readToken");
    if (v2)
      objc_msgSend(v2, "writeToken:", v3, v4);
    else

    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v5 != 0;

  }
}

- (void)_processLogicalValueWithBlock:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void);

  v6 = a2;
  if (a1)
  {
    v3 = 0;
    while (1)
    {
      while (1)
      {
        v4 = objc_msgSend(a1, "tokenType");
        if (v4 != 5)
          break;
        v6[2]();
      }
      switch(v4)
      {
        case -2:
          goto LABEL_12;
        case -1:
          goto LABEL_11;
        case 1:
        case 3:
          ++v3;
          goto LABEL_9;
        case 2:
        case 4:
          if (!v3)
          {
LABEL_11:
            HMDStructuredDataTokenTypeAsString(v4);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "failWithReason:", CFSTR("Unexpected <%@>"), v5);

            goto LABEL_12;
          }
          --v3;
LABEL_9:
          v6[2]();
          if (!v3)
            goto LABEL_12;
          break;
        default:
          goto LABEL_9;
      }
    }
  }
LABEL_12:

}

uint64_t __39__HMDStructuredReader_skipLogicalValue__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "skipToken");
}

@end
