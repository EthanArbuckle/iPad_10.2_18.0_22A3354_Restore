@implementation HMDStructuredWriter

+ (id)extendedTypeWriterWithWriter:(id)a3 options:(unint64_t)a4
{
  id v5;
  void *v6;
  HMDExtendedTypeWriter *v7;
  HMDExtendedTypeWriter *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
    v7 = -[HMDExtendedTypeWriter initWithWriter:options:]([HMDExtendedTypeWriter alloc], "initWithWriter:options:", v5, a4);
  else
    v7 = (HMDExtendedTypeWriter *)v5;
  v8 = v7;

  return v8;
}

+ (id)writerIntoOPACKData:(id)a3
{
  id v4;
  HMDStructuredDataOPACKWriter *v5;
  id v6;
  void *v7;
  id *v8;
  void *v10;
  SEL v11;
  id v12;
  objc_super v13;

  v4 = a3;
  v5 = [HMDStructuredDataOPACKWriter alloc];
  v6 = v4;
  v7 = v6;
  if (!v5)
    goto LABEL_5;
  if (v6)
  {
    v13.receiver = v5;
    v13.super_class = (Class)HMDStructuredDataOPACKWriter;
    v8 = objc_msgSendSuper2(&v13, sel_init);
    v5 = (HMDStructuredDataOPACKWriter *)v8;
    if (v8)
      objc_storeStrong(v8 + 6, a3);
LABEL_5:

    return v5;
  }
  v10 = (void *)_HMFPreconditionFailure();
  return +[HMDStructuredReader readerFromOPACKData:](v10, v11, v12);
}

- (void)writeLogicalValue:(id)a3
{
  -[HMDStructuredWriter writeLogicalValue:validateAndCopy:](self, "writeLogicalValue:validateAndCopy:", a3, 1);
}

- (void)writeLogicalValue:(id)a3 validateAndCopy:(BOOL)a4
{
  void *v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _Unwind_Exception *v15;
  id v16;

  v6 = a3;
  if (!v6)
  {
    v15 = (_Unwind_Exception *)_HMFPreconditionFailure();

    _Unwind_Resume(v15);
  }
  v16 = v6;
  v7 = +[HMDStructuredDataFoundationReader tokenForValue:]((uint64_t)HMDStructuredDataFoundationReader, v6);
  v9 = v7;
  v10 = v8;
  if ((unint64_t)(v7 - 6) >= 7)
  {
    if (v7 == -2)
    {
      -[HMDStructuredWriter failWithError:](self, "failWithError:", v8);
      goto LABEL_9;
    }
    v12 = -[HMDStructuredDataFoundationReader initWithInput:]([HMDStructuredDataFoundationReader alloc], v16);
    objc_msgSend(v12, "copyLogicalValueToWriter:", self);
    objc_msgSend(v12, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDStructuredWriter failWithError:](self, "failWithError:", v14);

    }
    goto LABEL_6;
  }
  v11 = v8;
  if (!self)
  {
    v12 = v11;
LABEL_6:

    goto LABEL_9;
  }
  -[HMDStructuredWriter writeToken:](self, "writeToken:", v9, v10);
LABEL_9:

}

+ (id)writerIntoObject:(id *)a3
{
  return -[HMDStructuredDataFoundationOutputPointerWriter initWithOutput:]([HMDStructuredDataFoundationOutputPointerWriter alloc], a3);
}

+ (id)writerIntoObject:(id *)a3 extendedTypeOptions:(unint64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "writerIntoObject:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extendedTypeWriterWithWriter:options:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)error
{
  return self->_error;
}

- (void)failWithError:(id)a3
{
  id v4;
  NSError *v5;
  NSError *error;
  id v7;

  v4 = a3;
  if (!self->_error)
  {
    v7 = v4;
    if (v4)
    {
      v5 = (NSError *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      v5 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    error = self->_error;
    self->_error = v5;

    v4 = v7;
  }

}

- (void)beginArrayOfSize:(unint64_t)a3
{
  id v4;

  if (a3 == -1)
  {
    v4 = 0;
    if (self)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      -[HMDStructuredWriter writeToken:](self, "writeToken:", 1, v4);
      return;
    }
  }

}

- (void)endArray
{
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 2, 0);
}

- (void)beginDictionaryOfSize:(unint64_t)a3
{
  id v4;

  if (a3 == -1)
  {
    v4 = 0;
    if (self)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (self)
    {
LABEL_3:
      -[HMDStructuredWriter writeToken:](self, "writeToken:", 3, v4);
      return;
    }
  }

}

- (void)writeDictionaryKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 5, v4);
  else

}

- (void)endDictionary
{
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 4, 0);
}

- (void)writeNull
{
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 6, 0);
}

- (void)writeBoolean:(BOOL)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 7, v4);
  else

}

- (void)writeString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 8, v4);
  else

}

- (void)writeNumber:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 9, v4);
  else

}

- (void)writeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 10, v4);
  else

}

- (void)writeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 11, v4);
  else

}

- (void)writeUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self)
    -[HMDStructuredWriter writeToken:](self, "writeToken:", 12, v4);
  else

}

- (void)writeToken:(_HMDStructuredDataToken)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id value;

  value = a3.value;
  switch(a3.type)
  {
    case 1:
      if (a3.value)
        v4 = objc_msgSend(a3.value, "unsignedIntegerValue");
      else
        v4 = -1;
      -[HMDStructuredWriter beginArrayOfSize:](self, "beginArrayOfSize:", v4);
      break;
    case 2:
      -[HMDStructuredWriter endArray](self, "endArray");
      break;
    case 3:
      if (a3.value)
        v5 = objc_msgSend(a3.value, "unsignedIntegerValue");
      else
        v5 = -1;
      -[HMDStructuredWriter beginDictionaryOfSize:](self, "beginDictionaryOfSize:", v5);
      break;
    case 4:
      -[HMDStructuredWriter endDictionary](self, "endDictionary");
      break;
    case 5:
      -[HMDStructuredWriter writeDictionaryKey:](self, "writeDictionaryKey:", a3.value);
      break;
    case 6:
      -[HMDStructuredWriter writeNull](self, "writeNull");
      break;
    case 7:
      -[HMDStructuredWriter writeBoolean:](self, "writeBoolean:", objc_msgSend(a3.value, "BOOLValue"));
      break;
    case 8:
      -[HMDStructuredWriter writeString:](self, "writeString:", a3.value);
      break;
    case 9:
      -[HMDStructuredWriter writeNumber:](self, "writeNumber:", a3.value);
      break;
    case 0xALL:
      -[HMDStructuredWriter writeData:](self, "writeData:", a3.value);
      break;
    case 0xBLL:
      -[HMDStructuredWriter writeDate:](self, "writeDate:", a3.value);
      break;
    case 0xCLL:
      -[HMDStructuredWriter writeUUID:](self, "writeUUID:", a3.value);
      break;
    default:
      v6 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid token type (%zd)"), a3.type);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v7, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
