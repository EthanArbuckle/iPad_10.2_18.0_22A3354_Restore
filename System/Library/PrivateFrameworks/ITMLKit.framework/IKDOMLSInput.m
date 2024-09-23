@implementation IKDOMLSInput

- (id)byteStream
{
  return self->_byteStream;
}

- (void)setByteStream:(id)a3
{
  objc_storeStrong(&self->_byteStream, a3);
}

- (NSString)stringData
{
  return self->_stringData;
}

- (void)setStringData:(id)a3
{
  objc_storeStrong((id *)&self->_stringData, a3);
}

- (NSString)encoding
{
  return self->_encoding;
}

- (void)setEncoding:(id)a3
{
  objc_storeStrong((id *)&self->_encoding, a3);
}

- (BOOL)certifiedText
{
  return self->_certifiedText;
}

- (void)setCertifiedText:(BOOL)a3
{
  self->_certifiedText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_stringData, 0);
  objc_storeStrong(&self->_byteStream, 0);
}

@end
