@implementation AVMessageParser

- (AVMessageParser)initWithLineSeparator:(id)a3 headerBodySeparator:(id)a4 bodyLengthKey:(id)a5 compressionMethodKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVMessageParser *v14;
  AVMessageParser *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AVMessageParser;
  v14 = -[AVMessageParser init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[AVMessageParser setLineSeparator:](v14, "setLineSeparator:", v10);
    -[AVMessageParser setHeaderBodySeparator:](v15, "setHeaderBodySeparator:", v11);
    -[AVMessageParser setBodyLengthKey:](v15, "setBodyLengthKey:", v12);
    -[AVMessageParser setCompressionMethodKey:](v15, "setCompressionMethodKey:", v13);
  }

  return v15;
}

- (AVMessageParser)init
{
  AVMessageParser *v2;
  AVMessageParser *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVMessageParser;
  v2 = -[AVMessageParser init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AVMessageParser setLineSeparator:](v2, "setLineSeparator:", CFSTR("\n"));
    -[AVMessageParser setHeaderBodySeparator:](v3, "setHeaderBodySeparator:", CFSTR("\n\n"));
  }
  return v3;
}

- (void)setLineSeparator:(id)a3
{
  id v4;
  NSString *v5;
  NSString *lineSeparator;
  id v7;

  if (self->_lineSeparator != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    lineSeparator = self->_lineSeparator;
    self->_lineSeparator = v5;

    objc_msgSend(v4, "dataUsingEncoding:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[AVMessageParser setLineSeparatorData:](self, "setLineSeparatorData:", v7);
  }
}

- (void)setHeaderBodySeparator:(id)a3
{
  id v4;
  NSString *v5;
  NSString *headerBodySeparator;
  id v7;

  if (self->_headerBodySeparator != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    headerBodySeparator = self->_headerBodySeparator;
    self->_headerBodySeparator = v5;

    objc_msgSend(v4, "dataUsingEncoding:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[AVMessageParser setHeaderBodySeparatorData:](self, "setHeaderBodySeparatorData:", v7);
  }
}

- (id)partsWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[AVMessageParser lineSeparator](self, "lineSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMessageParser lineSeparatorData](self, "lineSeparatorData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMessageParser headerBodySeparator](self, "headerBodySeparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMessageParser headerBodySeparatorData](self, "headerBodySeparatorData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVMessageParser bodyLengthKey](self, "bodyLengthKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVAirMessageParts messagePartsWithData:lineSeparator:data:headerBodySeparator:data:bodyLengthKey:](AVAirMessageParts, "messagePartsWithData:lineSeparator:data:headerBodySeparator:data:bodyLengthKey:", v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVMessageParser compressionMethodKey](self, "compressionMethodKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    objc_msgSend(v10, "uniqueHeaders");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVMessageParser compressionMethodKey](self, "compressionMethodKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length"))
    {
      objc_msgSend(v10, "decompressBodyUsingNamedAlgorithm:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUncompressedBodyData:", v16);

    }
  }
  return v10;
}

- (NSString)lineSeparator
{
  return self->_lineSeparator;
}

- (NSString)headerBodySeparator
{
  return self->_headerBodySeparator;
}

- (NSString)bodyLengthKey
{
  return self->_bodyLengthKey;
}

- (void)setBodyLengthKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)compressionMethodKey
{
  return self->_compressionMethodKey;
}

- (void)setCompressionMethodKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)lineSeparatorData
{
  return self->_lineSeparatorData;
}

- (void)setLineSeparatorData:(id)a3
{
  objc_storeStrong((id *)&self->_lineSeparatorData, a3);
}

- (NSData)headerBodySeparatorData
{
  return self->_headerBodySeparatorData;
}

- (void)setHeaderBodySeparatorData:(id)a3
{
  objc_storeStrong((id *)&self->_headerBodySeparatorData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerBodySeparatorData, 0);
  objc_storeStrong((id *)&self->_lineSeparatorData, 0);
  objc_storeStrong((id *)&self->_compressionMethodKey, 0);
  objc_storeStrong((id *)&self->_bodyLengthKey, 0);
  objc_storeStrong((id *)&self->_headerBodySeparator, 0);
  objc_storeStrong((id *)&self->_lineSeparator, 0);
}

+ (AVMessageParser)airMessageParser
{
  if (airMessageParser_onceToken != -1)
    dispatch_once(&airMessageParser_onceToken, &__block_literal_global_19109);
  return (AVMessageParser *)(id)airMessageParser__shared;
}

uint64_t __50__AVMessageParser_AVAirMessages__airMessageParser__block_invoke()
{
  AVMessageParser *v0;
  void *v1;

  v0 = objc_alloc_init(AVMessageParser);
  v1 = (void *)airMessageParser__shared;
  airMessageParser__shared = (uint64_t)v0;

  objc_msgSend((id)airMessageParser__shared, "setLineSeparator:", CFSTR("\n"));
  objc_msgSend((id)airMessageParser__shared, "setHeaderBodySeparator:", CFSTR("\n\n"));
  objc_msgSend((id)airMessageParser__shared, "setBodyLengthKey:", CFSTR("length"));
  return objc_msgSend((id)airMessageParser__shared, "setCompressionMethodKey:", CFSTR("compression"));
}

@end
