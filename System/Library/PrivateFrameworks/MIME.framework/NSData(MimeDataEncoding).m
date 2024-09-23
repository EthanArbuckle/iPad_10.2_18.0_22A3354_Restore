@implementation NSData(MimeDataEncoding)

- (id)mf_decodeQuotedPrintableForText:()MimeDataEncoding
{
  MFBufferedDataConsumer *v5;
  MFQuotedPrintableDecoder *v6;
  void *v7;

  v5 = objc_alloc_init(MFBufferedDataConsumer);
  v6 = -[MFBaseFilterDataConsumer initWithConsumer:]([MFQuotedPrintableDecoder alloc], "initWithConsumer:", v5);
  -[MFQuotedPrintableDecoder setForTextPart:](v6, "setForTextPart:", a3);
  _EnDecodeData(v5, v6, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mf_decodeBase64
{
  return _decodeBase64Data(a1, 0, 0);
}

- (id)mf_decodeBase64InRange:()MimeDataEncoding
{
  return _decodeBase64Data(a1, 0, a3);
}

- (id)mf_decodeModifiedBase64
{
  return _decodeBase64Data(a1, 1, 0);
}

- (id)mf_encodeBase64WithoutLineBreaks
{
  return _encodeBase64Data(a1, 0, 1, 61);
}

- (id)mf_encodeBase64
{
  return _encodeBase64Data(a1, 1, 1, 61);
}

- (id)mf_encodeModifiedBase64
{
  return _encodeBase64Data(a1, 0, 0, 0);
}

- (id)mf_encodeBase64HeaderData
{
  return _encodeBase64Data(a1, 0, 1, 61);
}

@end
