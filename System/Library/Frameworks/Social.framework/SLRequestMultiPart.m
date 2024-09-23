@implementation SLRequestMultiPart

+ (id)multiPartWithName:(id)a3 payload:(id)a4 type:(id)a5 multiPartBoundary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  objc_msgSend(v14, "setName:", v13);

  objc_msgSend(v14, "setPayload:", v12);
  objc_msgSend(v14, "setType:", v11);

  objc_msgSend(v14, "setMultiPartBoundary:", v10);
  return v14;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;
  const __CFAllocator *Default;
  const __CFUUID *v5;
  const __CFAllocator *v6;
  __CFString *v7;
  NSString *v8;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    Default = CFAllocatorGetDefault();
    v5 = CFUUIDCreate(Default);
    v6 = CFAllocatorGetDefault();
    v7 = (__CFString *)CFUUIDCreateString(v6, v5);
    v8 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = &v7->isa;

    CFRelease(v5);
    uniqueIdentifier = self->_uniqueIdentifier;
  }
  return uniqueIdentifier;
}

- (id)partData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[SLRequestMultiPart payloadPreamble](self, "payloadPreamble");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  -[SLRequestMultiPart payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v5);

  -[SLRequestMultiPart payloadEpilogue](self, "payloadEpilogue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v6);

  return v3;
}

- (id)multiPartHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SLRequestMultiPart name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"%@\"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[SLRequestMultiPart filename](self, "filename");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[SLRequestMultiPart type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commonPrefixWithString:options:", CFSTR("image"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      -[SLRequestMultiPart setFilename:](self, "setFilename:", CFSTR("image.jpg"));
  }
  -[SLRequestMultiPart filename](self, "filename");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SLRequestMultiPart filename](self, "filename");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("; filename=\"./%@\"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  objc_msgSend(v3, "addObject:", CFSTR("\r\n"));
  -[SLRequestMultiPart type](self, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    -[SLRequestMultiPart type](self, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Content-Type: %@\r\n"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  objc_msgSend(v3, "addObject:", CFSTR("\r\n"));
  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E7592238);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)payloadPreamble
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLRequestMultiPart multiPartBoundary](self, "multiPartBoundary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("--%@\r\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLRequestMultiPart multiPartHeader](self, "multiPartHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)payloadEpilogue
{
  return (id)objc_msgSend(CFSTR("\r\n"), "dataUsingEncoding:", 4);
}

- (unint64_t)length
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SLRequestMultiPart payloadPreamble](self, "payloadPreamble");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  -[SLRequestMultiPart payload](self, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") + v4;
  -[SLRequestMultiPart payloadEpilogue](self, "payloadEpilogue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + objc_msgSend(v7, "length");

  return v8;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)multiPartBoundary
{
  return self->_multiPartBoundary;
}

- (void)setMultiPartBoundary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_multiPartBoundary, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
