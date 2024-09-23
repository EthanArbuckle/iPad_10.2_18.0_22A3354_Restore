@implementation WPXMLRPCEncoder

- (WPXMLRPCEncoder)initWithMethod:(id)a3 andParameters:(id)a4
{
  id v7;
  id v8;
  WPXMLRPCEncoder *v9;
  WPXMLRPCEncoder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPXMLRPCEncoder;
  v9 = -[WPXMLRPCEncoder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_method, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
  }

  return v10;
}

- (WPXMLRPCEncoder)initWithResponseParams:(id)a3
{
  id v5;
  WPXMLRPCEncoder *v6;
  WPXMLRPCEncoder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WPXMLRPCEncoder;
  v6 = -[WPXMLRPCEncoder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parameters, a3);
    v7->_isResponse = 1;
  }

  return v7;
}

- (WPXMLRPCEncoder)initWithResponseFaultCode:(id)a3 andString:(id)a4
{
  id v7;
  id v8;
  WPXMLRPCEncoder *v9;
  WPXMLRPCEncoder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WPXMLRPCEncoder;
  v9 = -[WPXMLRPCEncoder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_faultCode, a3);
    objc_storeStrong((id *)&v10->_faultString, a4);
    *(_WORD *)&v10->_isResponse = 257;
  }

  return v10;
}

- (WPXMLRPCEncoder)init
{

  return 0;
}

- (NSData)body
{
  return (NSData *)-[WPXMLRPCEncoder dataEncodedWithError:](self, "dataEncodedWithError:", 0);
}

- (id)dataEncodedWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[WPXMLRPCEncoder tmpFilePathForCache](self, "tmpFilePathForCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WPXMLRPCEncoder encodeToFile:error:](self, "encodeToFile:error:", v5, a3))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v5, 2, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v5, 0);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)encodeToFile:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSFileHandle *v11;
  NSFileHandle *streamingCacheFile;
  NSFileHandle *v13;

  v6 = (void *)MEMORY[0x24BDD1580];
  v7 = a3;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createFileAtPath:contents:attributes:", v7, 0, 0);
  v9 = (void *)MEMORY[0x24BDD1578];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fileHandleForWritingToURL:error:", v10, a4);
  v11 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
  streamingCacheFile = self->_streamingCacheFile;
  self->_streamingCacheFile = v11;

  v13 = self->_streamingCacheFile;
  if (v13)
    -[WPXMLRPCEncoder encodeForStreaming](self, "encodeForStreaming");

  return v13 != 0;
}

- (void)encodeForStreaming
{
  NSString *faultString;
  void *v4;
  const __CFString *v5;
  NSArray *parameters;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<?xml version=\"1.0\"?>"));
  if (self->_isResponse)
  {
    -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<methodResponse>"));
    if (self->_isFault)
    {
      -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<fault>"));
      v12[0] = CFSTR("faultCode");
      v12[1] = CFSTR("faultString");
      faultString = self->_faultString;
      v13[0] = self->_faultCode;
      v13[1] = faultString;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPXMLRPCEncoder encodeDictionary:](self, "encodeDictionary:", v4);

      v5 = CFSTR("</fault>");
    }
    else
    {
      v5 = CFSTR("<params>");
    }
  }
  else
  {
    -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<methodCall><methodName>"));
    -[WPXMLRPCEncoder encodeString:omitTag:](self, "encodeString:omitTag:", self->_method, 1);
    v5 = CFSTR("</methodName><params>");
  }
  -[WPXMLRPCEncoder appendString:](self, "appendString:", v5);
  parameters = self->_parameters;
  if (parameters)
  {
    -[NSArray objectEnumerator](parameters, "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      do
      {
        -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<param>"));
        -[WPXMLRPCEncoder encodeObject:](self, "encodeObject:", v9);
        -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</param>"));
        objc_msgSend(v7, "nextObject");
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v10;
      }
      while (v10);
    }

  }
  if (!self->_isResponse)
  {
    v11 = CFSTR("</methodCall>");
LABEL_15:
    -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</params>"));
    goto LABEL_16;
  }
  v11 = CFSTR("</methodResponse>");
  if (!self->_isFault)
    goto LABEL_15;
LABEL_16:
  -[WPXMLRPCEncoder appendString:](self, "appendString:", v11);
  -[NSFileHandle synchronizeFile](self->_streamingCacheFile, "synchronizeFile");
}

- (void)valueTag:(id)a3 value:(id)a4
{
  -[WPXMLRPCEncoder appendFormat:](self, "appendFormat:", CFSTR("<value><%@>%@</%@></value>"), a3, a4, a3);
}

- (void)encodeObject:(id)a3
{
  char isKindOfClass;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WPXMLRPCEncoder encodeArray:](self, "encodeArray:", v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[WPXMLRPCEncoder encodeDictionary:](self, "encodeDictionary:", v6);
      }
      else if ((id)*MEMORY[0x24BDBD270] == v6 || *MEMORY[0x24BDBD268] == (_QWORD)v6)
      {
        -[WPXMLRPCEncoder encodeBoolean:](self, "encodeBoolean:", v6);
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          -[WPXMLRPCEncoder encodeNumber:](self, "encodeNumber:", v6);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[WPXMLRPCEncoder encodeDate:](self, "encodeDate:", v6);
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[WPXMLRPCEncoder encodeData:](self, "encodeData:", v6);
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[WPXMLRPCEncoder encodeInputStream:](self, "encodeInputStream:", v6);
              goto LABEL_24;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[WPXMLRPCEncoder encodeFileHandle:](self, "encodeFileHandle:", v6);
              goto LABEL_24;
            }
          }
          -[WPXMLRPCEncoder encodeString:omitTag:](self, "encodeString:omitTag:", v6, 0);
        }
      }
    }
  }
LABEL_24:

}

- (void)encodeArray:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectEnumerator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<value><array><data>"));
  objc_msgSend(v7, "nextObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      -[WPXMLRPCEncoder encodeObject:](self, "encodeObject:", v5);
      objc_msgSend(v7, "nextObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
    }
    while (v6);
  }
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</data></array></value>"));

}

- (void)encodeDictionary:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<value><struct>"));
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<member>"));
      -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<name>"));
      -[WPXMLRPCEncoder encodeString:omitTag:](self, "encodeString:omitTag:", v6, 1);
      -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</name>"));
      objc_msgSend(v9, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPXMLRPCEncoder encodeObject:](self, "encodeObject:", v7);

      -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</member>"));
      objc_msgSend(v4, "nextObject");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);
  }
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</struct></value>"));

}

- (void)encodeBoolean:(__CFBoolean *)a3
{
  const __CFString *v3;

  if ((__CFBoolean *)*MEMORY[0x24BDBD270] == a3)
    v3 = CFSTR("1");
  else
    v3 = CFSTR("0");
  -[WPXMLRPCEncoder valueTag:value:](self, "valueTag:value:", CFSTR("BOOLean"), v3);
}

- (void)encodeNumber:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "stringWithCString:encoding:", objc_msgSend(v5, "objCType"), 4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v8, "isEqualToString:", CFSTR("d"));
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v4)
    v7 = CFSTR("double");
  else
    v7 = CFSTR("i4");
  -[WPXMLRPCEncoder valueTag:value:](self, "valueTag:value:", v7, v6);

}

- (void)encodeString:(id)a3 omitTag:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id v7;

  v4 = a4;
  +[WPStringUtils escapedStringWithString:](WPStringUtils, "escapedStringWithString:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v4)
    -[WPXMLRPCEncoder appendString:](self, "appendString:", v6);
  else
    -[WPXMLRPCEncoder valueTag:value:](self, "valueTag:value:", CFSTR("string"), v6);

}

- (void)encodeDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x24BDBCE48];
  v5 = a3;
  v6 = [v4 alloc];
  v10 = (id)objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTimeZone:", v7);

  objc_msgSend(v10, "components:fromDate:", 252, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.4ld%.2d%.2dT%.2d:%.2ld:%.2ld%@"), objc_msgSend(v8, "year"), objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "hour"), objc_msgSend(v8, "minute"), objc_msgSend(v8, "second"), CFSTR("Z"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPXMLRPCEncoder valueTag:value:](self, "valueTag:value:", CFSTR("dateTime.iso8601"), v9);

}

- (void)encodeData:(id)a3
{
  id v4;

  +[WPBase64Utils encodeData:](WPBase64Utils, "encodeData:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WPXMLRPCEncoder valueTag:value:](self, "valueTag:value:", CFSTR("base64"), v4);

}

- (void)encodeInputStream:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<value><base64>"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__WPXMLRPCEncoder_encodeInputStream___block_invoke;
  v5[3] = &unk_24F8B8248;
  v5[4] = self;
  +[WPBase64Utils encodeInputStream:withChunkHandler:](WPBase64Utils, "encodeInputStream:withChunkHandler:", v4, v5);

  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</base64></value>"));
}

- (void)encodeFileHandle:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("<value><base64>"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__WPXMLRPCEncoder_encodeFileHandle___block_invoke;
  v5[3] = &unk_24F8B8248;
  v5[4] = self;
  +[WPBase64Utils encodeFileHandle:withChunkHandler:](WPBase64Utils, "encodeFileHandle:withChunkHandler:", v4, v5);

  -[WPXMLRPCEncoder appendString:](self, "appendString:", CFSTR("</base64></value>"));
}

- (void)appendString:(id)a3
{
  NSFileHandle *streamingCacheFile;
  id v4;

  streamingCacheFile = self->_streamingCacheFile;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSFileHandle writeData:](streamingCacheFile, "writeData:", v4);

}

- (void)appendFormat:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[WPXMLRPCEncoder appendString:](self, "appendString:", v6);
}

- (id)tmpFilePathForCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "globallyUniqueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)method
{
  return self->_method;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faultString, 0);
  objc_storeStrong((id *)&self->_faultCode, 0);
  objc_storeStrong((id *)&self->_streamingCacheFile, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_method, 0);
}

uint64_t __36__WPXMLRPCEncoder_encodeFileHandle___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

uint64_t __37__WPXMLRPCEncoder_encodeInputStream___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", a2);
}

@end
