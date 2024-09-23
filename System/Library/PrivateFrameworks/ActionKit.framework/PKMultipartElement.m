@implementation PKMultipartElement

- (void)updateLength
{
  id v3;

  -[PKMultipartElement setLength:](self, "setLength:", -[PKMultipartElement headersLength](self, "headersLength")+ -[PKMultipartElement bodyLength](self, "bodyLength")+ 2);
  -[PKMultipartElement body](self, "body");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "open");

}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 string:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKMultipartElement *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKMultipartElement;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PKMultipartElement init](&v17, sel_init);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n"),
    v8,
    v9,
    v17.receiver,
    v17.super_class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeaders:](v10, "setHeaders:", v12);

  -[PKMultipartElement headers](v10, "headers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeadersLength:](v10, "setHeadersLength:", objc_msgSend(v13, "length"));

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setBody:](v10, "setBody:", v15);

  -[PKMultipartElement setBodyLength:](v10, "setBodyLength:", objc_msgSend(v14, "length"));
  -[PKMultipartElement updateLength](v10, "updateLength");

  return v10;
}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKMultipartElement *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKMultipartElement;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PKMultipartElement init](&v20, sel_init);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
    v11,
    v12,
    v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dataUsingEncoding:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeaders:](v13, "setHeaders:", v15);

  -[PKMultipartElement headers](v13, "headers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeadersLength:](v13, "setHeadersLength:", objc_msgSend(v16, "length"));

  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setBody:](v13, "setBody:", v17);

  v18 = objc_msgSend(v10, "length");
  -[PKMultipartElement setBodyLength:](v13, "setBodyLength:", v18);
  -[PKMultipartElement updateLength](v13, "updateLength");
  return v13;
}

- (PKMultipartElement)initWithName:(id)a3 boundary:(id)a4 data:(id)a5 contentType:(id)a6 filename:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  PKMultipartElement *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKMultipartElement;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[PKMultipartElement init](&v23, sel_init);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
    v14,
    v15,
    v11,
    v12,
    v23.receiver,
    v23.super_class);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dataUsingEncoding:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeaders:](v16, "setHeaders:", v18);

  -[PKMultipartElement headers](v16, "headers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setHeadersLength:](v16, "setHeadersLength:", objc_msgSend(v19, "length"));

  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKMultipartElement setBody:](v16, "setBody:", v20);

  v21 = objc_msgSend(v13, "length");
  -[PKMultipartElement setBodyLength:](v16, "setBodyLength:", v21);
  -[PKMultipartElement updateLength](v16, "updateLength");
  return v16;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  PKMultipartElement *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "pathExtension");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  MIMETypeForExtension(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PKMultipartElement initWithName:filename:boundary:path:contentType:](self, "initWithName:filename:boundary:path:contentType:", v13, v12, v11, v10, v15);

  return v16;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 path:(id)a6 contentType:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKMultipartElement *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKMultipartElement;
  v17 = -[PKMultipartElement init](&v26, sel_init);
  if (v17)
  {
    if (!v13)
    {
      objc_msgSend(v15, "lastPathComponent");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
      v14,
      v12,
      v13,
      v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setHeaders:](v17, "setHeaders:", v19);

    -[PKMultipartElement headers](v17, "headers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setHeadersLength:](v17, "setHeadersLength:", objc_msgSend(v20, "length"));

    objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setBody:](v17, "setBody:", v21);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "attributesOfItemAtPath:error:", v15, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setBodyLength:](v17, "setBodyLength:", objc_msgSend(v24, "unsignedIntegerValue"));

    -[PKMultipartElement updateLength](v17, "updateLength");
  }

  return v17;
}

- (PKMultipartElement)initWithName:(id)a3 filename:(id)a4 boundary:(id)a5 stream:(id)a6 streamLength:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKMultipartElement *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKMultipartElement;
  v16 = -[PKMultipartElement init](&v24, sel_init);
  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "pathExtension");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    MIMETypeForExtension(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
      v14,
      v12,
      v13,
      v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setHeaders:](v16, "setHeaders:", v21);

    -[PKMultipartElement headers](v16, "headers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKMultipartElement setHeadersLength:](v16, "setHeadersLength:", objc_msgSend(v22, "length"));

    -[PKMultipartElement setBody:](v16, "setBody:", v15);
    -[PKMultipartElement setBodyLength:](v16, "setBodyLength:", a7);
    -[PKMultipartElement updateLength](v16, "updateLength");
  }

  return v16;
}

- (PKMultipartElement)initWithHeaders:(id)a3 string:(id)a4 boundary:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKMultipartElement *v11;
  PKMultipartElement *v12;
  uint64_t v13;
  NSData *headers;
  void *v15;
  uint64_t v16;
  NSInputStream *body;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKMultipartElement;
  v11 = -[PKMultipartElement init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PKMultipartElement makeHeadersDataFromHeadersDict:boundary:](v11, "makeHeadersDataFromHeadersDict:boundary:", v8, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    headers = v12->_headers;
    v12->_headers = (NSData *)v13;

    v12->_headersLength = -[NSData length](v12->_headers, "length");
    objc_msgSend(v9, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithData:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    body = v12->_body;
    v12->_body = (NSInputStream *)v16;

    v12->_bodyLength = objc_msgSend(v15, "length");
    -[PKMultipartElement updateLength](v12, "updateLength");

  }
  return v12;
}

- (PKMultipartElement)initWithHeaders:(id)a3 path:(id)a4 boundary:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKMultipartElement *v11;
  PKMultipartElement *v12;
  uint64_t v13;
  NSData *headers;
  uint64_t v15;
  NSInputStream *body;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKMultipartElement;
  v11 = -[PKMultipartElement init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PKMultipartElement makeHeadersDataFromHeadersDict:boundary:](v11, "makeHeadersDataFromHeadersDict:boundary:", v8, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    headers = v12->_headers;
    v12->_headers = (NSData *)v13;

    v12->_headersLength = -[NSData length](v12->_headers, "length");
    objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithFileAtPath:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    body = v12->_body;
    v12->_body = (NSInputStream *)v15;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributesOfItemAtPath:error:", v9, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDD0D08]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_bodyLength = objc_msgSend(v19, "unsignedIntegerValue");

    -[PKMultipartElement updateLength](v12, "updateLength");
  }

  return v12;
}

- (id)makeHeadersDataFromHeadersDict:(id)a3 boundary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("--%@"), v18);
  -[PKMultipartElement appendNewLine:](self, "appendNewLine:", v7);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@: %@"), v12, v14);
        objc_msgSend(v7, "appendString:", v15);

        -[PKMultipartElement appendNewLine:](self, "appendNewLine:", v7);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[PKMultipartElement appendNewLine:](self, "appendNewLine:", v7);
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)appendNewLine:(id)a3
{
  objc_msgSend(a3, "appendString:", CFSTR("\r\n"));
}

- (unint64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t i;
  unint64_t v15;
  unint64_t v16;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v7 = -[PKMultipartElement delivered](self, "delivered");
  if (v7 >= -[PKMultipartElement length](self, "length"))
    return 0;
  v8 = -[PKMultipartElement delivered](self, "delivered");
  v9 = -[PKMultipartElement headersLength](self, "headersLength");
  v10 = 0;
  if (!a4 || v8 >= v9)
    goto LABEL_10;
  v11 = -[PKMultipartElement headersLength](self, "headersLength");
  v12 = -[PKMultipartElement delivered](self, "delivered");
  if (v11 - v12 >= a4)
    v10 = a4;
  else
    v10 = v11 - v12;
  -[PKMultipartElement headers](self, "headers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getBytes:range:", a3, -[PKMultipartElement delivered](self, "delivered"), v10);

  for (i = -[PKMultipartElement delivered](self, "delivered") + v10;
        ;
        i = -[PKMultipartElement delivered](self, "delivered") + v19)
  {
    -[PKMultipartElement setDelivered:](self, "setDelivered:", i);
LABEL_10:
    v15 = -[PKMultipartElement delivered](self, "delivered");
    if (v15 < -[PKMultipartElement headersLength](self, "headersLength"))
      break;
    v16 = -[PKMultipartElement delivered](self, "delivered");
    if (v16 >= -[PKMultipartElement length](self, "length") - 2 || a4 <= v10)
      break;
    -[PKMultipartElement body](self, "body");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "read:maxLength:", &a3[v10], a4 - v10);

    if (!v19)
      break;
    v10 += v19;
  }
  v20 = -[PKMultipartElement delivered](self, "delivered");
  if (v20 >= -[PKMultipartElement length](self, "length") - 2 && v10 < a4)
  {
    v21 = -[PKMultipartElement delivered](self, "delivered");
    if (v21 == -[PKMultipartElement length](self, "length") - 2)
    {
      a3[v10++] = 13;
      -[PKMultipartElement setDelivered:](self, "setDelivered:", -[PKMultipartElement delivered](self, "delivered") + 1);
    }
    a3[v10++] = 10;
    -[PKMultipartElement setDelivered:](self, "setDelivered:", -[PKMultipartElement delivered](self, "delivered") + 1);
  }
  return v10;
}

- (NSData)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_headers, a3);
}

- (NSInputStream)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_storeStrong((id *)&self->_body, a3);
}

- (unint64_t)headersLength
{
  return self->_headersLength;
}

- (void)setHeadersLength:(unint64_t)a3
{
  self->_headersLength = a3;
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (void)setBodyLength:(unint64_t)a3
{
  self->_bodyLength = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)delivered
{
  return self->_delivered;
}

- (void)setDelivered:(unint64_t)a3
{
  self->_delivered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_headers, 0);
}

@end
