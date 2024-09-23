@implementation NBBloomFilterReader

- (NBBloomFilterReader)initWithData:(id)a3 hashFunctionCount:(unint64_t)a4
{
  id v6;
  NBBloomFilterReader *v7;
  NBObjCBloomFilterReader *v8;
  NBObjCBloomFilterReader *bloomFilterReader;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NBBloomFilterReader;
  v7 = -[NBBloomFilterReader init](&v11, sel_init);
  if (v7)
  {
    v8 = -[NBObjCBloomFilterReader initWithData:hashFunctionCount:]([NBObjCBloomFilterReader alloc], "initWithData:hashFunctionCount:", v6, a4);
    bloomFilterReader = v7->_bloomFilterReader;
    v7->_bloomFilterReader = v8;

  }
  return v7;
}

- (BOOL)maybeContainsString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[NBBloomFilterReader bloomFilterReader](self, "bloomFilterReader");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "maybeContainsString:", v4);

  return v6;
}

- (NBObjCBloomFilterReader)bloomFilterReader
{
  return self->_bloomFilterReader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bloomFilterReader, 0);
}

@end
