@implementation MFMixedMessageFragment

- (MFMixedMessageFragment)initWithMarkupString:(id)a3 baseURL:(id)a4
{
  id v7;
  id v8;
  MFMixedMessageFragment *v9;
  MFMixedMessageFragment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMixedMessageFragment;
  v9 = -[MFMixedMessageFragment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_markupString, a3);
    objc_storeStrong((id *)&v10->_baseURL, a4);
  }

  return v10;
}

- (MFMixedMessageFragment)initWithMarkupData:(id)a3 textEncodingName:(id)a4 baseURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFMixedMessageFragment *v12;
  MFMixedMessageFragment *v13;
  NSString *mimeType;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MFMixedMessageFragment;
  v12 = -[MFMixedMessageFragment init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_markupData, a3);
    objc_storeStrong((id *)&v13->_textEncodingName, a4);
    mimeType = v13->_mimeType;
    v13->_mimeType = (NSString *)CFSTR("text/html");

    objc_storeStrong((id *)&v13->_baseURL, a5);
  }

  return v13;
}

- (id)markupString
{
  return self->_markupString;
}

- (id)markupData
{
  return self->_markupData;
}

- (id)mimeType
{
  return self->_mimeType;
}

- (id)encodingName
{
  return self->_textEncodingName;
}

- (id)baseURL
{
  return self->_baseURL;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p: %@> (string length: %lu) (data length: %lu) (mime type: %@) (encoding: %@)"), self, objc_opt_class(), -[NSString length](self->_markupString, "length"), -[NSData length](self->_markupData, "length"), self->_mimeType, self->_textEncodingName);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_markupData, 0);
  objc_storeStrong((id *)&self->_markupString, 0);
}

@end
