@implementation HMDExtendedTypeWriter

- (HMDExtendedTypeWriter)initWithWriter:(id)a3 options:(unint64_t)a4
{
  id v7;
  HMDExtendedTypeWriter *v8;
  HMDExtendedTypeWriter *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDExtendedTypeWriter;
  v8 = -[HMDExtendedTypeWriter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_writer, a3);
    v9->_options = a4;
  }

  return v9;
}

- (id)error
{
  return -[HMDStructuredWriter error](self->_writer, "error");
}

- (void)failWithError:(id)a3
{
  -[HMDStructuredWriter failWithError:](self->_writer, "failWithError:", a3);
}

- (void)beginArrayOfSize:(unint64_t)a3
{
  -[HMDStructuredWriter beginArrayOfSize:](self->_writer, "beginArrayOfSize:", a3);
}

- (void)endArray
{
  -[HMDStructuredWriter endArray](self->_writer, "endArray");
}

- (void)beginDictionaryOfSize:(unint64_t)a3
{
  -[HMDStructuredWriter beginDictionaryOfSize:](self->_writer, "beginDictionaryOfSize:", a3);
}

- (void)writeDictionaryKey:(id)a3
{
  -[HMDStructuredWriter writeDictionaryKey:](self->_writer, "writeDictionaryKey:", a3);
}

- (void)endDictionary
{
  -[HMDStructuredWriter endDictionary](self->_writer, "endDictionary");
}

- (void)writeNull
{
  if ((self->_options & 1) != 0)
  {
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, CFSTR("$null"));
    -[HMDStructuredWriter writeString:](self->_writer, "writeString:", &stru_24E79DB48);
    -[HMDStructuredWriter endDictionary](self->_writer, "endDictionary");
  }
  else
  {
    -[HMDStructuredWriter writeNull](self->_writer, "writeNull");
  }
}

- (void)writeBoolean:(BOOL)a3
{
  -[HMDStructuredWriter writeBoolean:](self->_writer, "writeBoolean:", a3);
}

- (void)writeString:(id)a3
{
  -[HMDStructuredWriter writeString:](self->_writer, "writeString:", a3);
}

- (void)writeNumber:(id)a3
{
  -[HMDStructuredWriter writeNumber:](self->_writer, "writeNumber:", a3);
}

- (void)writeData:(id)a3
{
  HMDStructuredWriter *v4;
  id v5;
  HMDStructuredWriter *writer;
  void *v7;
  id v8;

  if ((self->_options & 2) != 0)
  {
    v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, CFSTR("$base64"));
    writer = self->_writer;
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDStructuredWriter writeString:](writer, "writeString:", v7);
    -[HMDStructuredWriter endDictionary](self->_writer, "endDictionary");
  }
  else
  {
    v4 = self->_writer;
    v8 = a3;
    -[HMDStructuredWriter writeData:](v4, "writeData:", v8);

  }
}

- (void)writeDate:(id)a3
{
  HMDStructuredWriter *v4;
  id v5;
  HMDStructuredWriter *writer;
  void *v7;
  void *v8;
  id v9;

  if ((self->_options & 4) != 0)
  {
    v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, CFSTR("$date"));
    writer = self->_writer;
    HMDExtendedTypeDateFormatter();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDStructuredWriter writeString:](writer, "writeString:", v8);
    -[HMDStructuredWriter endDictionary](self->_writer, "endDictionary");
  }
  else
  {
    v4 = self->_writer;
    v9 = a3;
    -[HMDStructuredWriter writeDate:](v4, "writeDate:", v9);

  }
}

- (void)writeUUID:(id)a3
{
  HMDStructuredWriter *v4;
  id v5;
  HMDStructuredWriter *writer;
  void *v7;
  id v8;

  if ((self->_options & 8) != 0)
  {
    v5 = a3;
    -[HMDExtendedTypeWriter _beginExtensionValueWithTag:]((uint64_t)self, CFSTR("$uuid"));
    writer = self->_writer;
    objc_msgSend(v5, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDStructuredWriter writeString:](writer, "writeString:", v7);
    -[HMDStructuredWriter endDictionary](self->_writer, "endDictionary");
  }
  else
  {
    v4 = self->_writer;
    v8 = a3;
    -[HMDStructuredWriter writeUUID:](v4, "writeUUID:", v8);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writer, 0);
}

- (void)_beginExtensionValueWithTag:(uint64_t)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    v3 = *(void **)(a1 + 16);
    v4 = a2;
    objc_msgSend(v3, "beginDictionaryOfSize:", 1);
    objc_msgSend(*(id *)(a1 + 16), "writeDictionaryKey:", v4);

  }
}

@end
