@implementation NFNdefRecord

+ (id)emptyRecord
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setTypeNameFormat:", 0);
  objc_msgSend(v2, "setShortRecord:", 1);
  objc_msgSend(v2, "setIdentifier:", 0);
  return v2;
}

+ (id)recordWithText:(id)a3 lang:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v13;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTypeNameFormat:", 1);
  objc_msgSend(CFSTR("T"), "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setType:", v8);

  v9 = (void *)objc_opt_new();
  v13 = objc_msgSend(v5, "length");
  objc_msgSend(v9, "appendBytes:length:", &v13, 1);
  objc_msgSend(v5, "dataUsingEncoding:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendData:", v10);
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendData:", v11);
  objc_msgSend(v7, "setPayload:", v9);

  return v7;
}

+ (id)recordWithURI:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v11 = 0;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("https://www.")))
  {
    v11 = 2;
    v5 = CFSTR("https://www.");
LABEL_13:
    objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v5, "length"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("http://www.")))
  {
    v11 = 1;
    v5 = CFSTR("http://www.");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("https://")))
  {
    v11 = 4;
    v5 = CFSTR("https://");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("http://")))
  {
    v11 = 3;
    v5 = CFSTR("http://");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("tel:")))
  {
    v11 = 5;
    v5 = CFSTR("tel:");
    goto LABEL_13;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("mailto:")))
  {
    v11 = 6;
    v5 = CFSTR("mailto:");
    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(v4, "setTypeNameFormat:", 1);
  objc_msgSend(CFSTR("U"), "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v7);

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "appendBytes:length:", &v11, 1);
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v9);

  objc_msgSend(v4, "setPayload:", v8);
  return v4;
}

+ (id)recordWithTelephone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTypeNameFormat:", 1);
  objc_msgSend(CFSTR("U"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v5);

  v6 = (void *)objc_opt_new();
  v9 = 5;
  objc_msgSend(v6, "appendBytes:length:", &v9, 1);
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendData:", v7);
  objc_msgSend(v4, "setPayload:", v6);

  return v4;
}

+ (id)recordsFromBytes:(const void *)a3 length:(unsigned int)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0DE78D0], "recordsFromBytes:length:", a3, *(_QWORD *)&a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__NFNdefRecord_recordsFromBytes_length___block_invoke;
  v8[3] = &unk_1E3B53348;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __40__NFNdefRecord_recordsFromBytes_length___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NFNdefRecord *v4;

  v3 = a2;
  v4 = -[NFNdefRecord initWithNDEFRecord:]([NFNdefRecord alloc], "initWithNDEFRecord:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (NFNdefRecord)init
{
  NFNdefRecord *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NFNdefRecord;
  result = -[NFNdefRecord init](&v3, sel_init);
  if (result)
    result->_firstOctet = 0;
  return result;
}

- (NFNdefRecord)initWithBytes:(const void *)a3 length:(unsigned int)a4
{
  NFNdefRecord *v4;
  NFNdefRecord *v5;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  NSData *type;
  NSData *v10;
  NSData *identifier;
  NSData *v12;
  NSData *payload;
  id v15;
  id v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NFNdefRecord;
  v4 = -[NFNdefRecord init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_firstOctet = 0;
    NFDataCreateWithBytesNoCopy();
    v16 = 0;
    v17 = 0;
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0DE78D0], "parseRecordUsingScanner:header:type:identifier:payload:", NFDataScannerCreateWithData(), &v5->_firstOctet, &v17, &v16, &v15);
    v6 = (NSData *)v17;
    v7 = (NSData *)v16;
    v8 = (NSData *)v15;
    type = v5->_type;
    v5->_type = v6;
    v10 = v6;

    identifier = v5->_identifier;
    v5->_identifier = v7;
    v12 = v7;

    payload = v5->_payload;
    v5->_payload = v8;

    NFDataRelease();
    NFDataScannerRelease();

  }
  return v5;
}

- (NFNdefRecord)initWithNDEFRecord:(id)a3
{
  id v4;
  NFNdefRecord *v5;
  uint64_t v6;
  NSData *identifier;
  uint64_t v8;
  NSData *type;
  uint64_t v10;
  NSData *payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecord;
  v5 = -[NFNdefRecord init](&v13, sel_init);
  if (v5)
  {
    v5->_firstOctet = objc_msgSend(v4, "header");
    objc_msgSend(v4, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v6;

    objc_msgSend(v4, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSData *)v8;

    objc_msgSend(v4, "payload");
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

  }
  return v5;
}

- (unsigned)header
{
  return self->_firstOctet;
}

- (void)setHeader:(unsigned __int8)a3
{
  self->_firstOctet = a3;
}

- (BOOL)messageBegin
{
  return self->_firstOctet >> 7;
}

- (void)setMessageBegin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  self->_firstOctet = v3 & 0x80 | self->_firstOctet & 0x7F;
}

- (BOOL)messageEnd
{
  return (self->_firstOctet >> 6) & 1;
}

- (void)setMessageEnd:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xBF | v3;
}

- (BOOL)chunked
{
  return (self->_firstOctet >> 5) & 1;
}

- (void)setChunked:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xDF | v3;
}

- (BOOL)shortRecord
{
  return (self->_firstOctet >> 4) & 1;
}

- (void)setShortRecord:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xEF | v3;
}

- (unsigned)typeNameFormat
{
  return self->_firstOctet & 7;
}

- (void)setTypeNameFormat:(unsigned __int8)a3
{
  self->_firstOctet = self->_firstOctet & 0xF8 | a3 & 7;
}

- (NSData)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  NSData *v4;
  NSData *identifier;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[NFNdefRecord _setIdLengthPresent:](self, "_setIdLengthPresent:", 1);
    v4 = (NSData *)v6;
  }
  else
  {
    -[NFNdefRecord _setIdLengthPresent:](self, "_setIdLengthPresent:", 0);
    v4 = 0;
  }
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_payload, a3);
  -[NFNdefRecord setShortRecord:](self, "setShortRecord:", -[NSData length](self->_payload, "length") < 0x100);

}

- (BOOL)isURIRecord
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[NFNdefRecord typeNameFormat](self, "typeNameFormat") == 1)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFNdefRecord type](self, "type");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "bytes");
    -[NFNdefRecord type](self, "type");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithBytes:length:encoding:", v5, objc_msgSend((id)v6, "length"), 4);

    LOBYTE(v6) = objc_msgSend(v7, "isEqualToString:", CFSTR("U"));
    if ((v6 & 1) != 0)
      return 1;
  }
  else if (-[NFNdefRecord typeNameFormat](self, "typeNameFormat") == 3)
  {
    return 1;
  }
  return 0;
}

- (BOOL)_idLengthPresent
{
  return (self->_firstOctet >> 3) & 1;
}

- (void)_setIdLengthPresent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_firstOctet = self->_firstOctet & 0xF7 | v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BOOL8 v23;
  _BOOL8 v24;
  _BOOL8 v25;
  _BOOL8 v26;
  id v27;
  void *v28;
  objc_super v29;

  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  v29.receiver = self;
  v29.super_class = (Class)NFNdefRecord;
  -[NFNdefRecord description](&v29, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[NFNdefRecord messageBegin](self, "messageBegin");
  v25 = -[NFNdefRecord messageEnd](self, "messageEnd");
  v24 = -[NFNdefRecord chunked](self, "chunked");
  v23 = -[NFNdefRecord shortRecord](self, "shortRecord");
  -[NFNdefRecord identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v28, "length");
  v20 = -[NFNdefRecord typeNameFormat](self, "typeNameFormat");
  -[NFNdefRecord type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NFNdefRecord type](self, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");
  }
  else
  {
    v19 = 0;
  }
  -[NFNdefRecord type](self, "type");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[NFNdefRecord type](self, "type");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_opt_new();
  }
  v6 = (void *)v5;
  -[NFNdefRecord identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NFNdefRecord identifier](self, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_opt_new();
  }
  v9 = (void *)v8;
  -[NFNdefRecord payload](self, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[NFNdefRecord payload](self, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v17, "length");
  }
  else
  {
    v11 = 0;
  }
  -[NFNdefRecord payload](self, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NFNdefRecord payload](self, "payload");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v15 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@ { MB=%d ME=%d CF=%d SR=%d IL=%d TNF=%d Type Length=%d Type=%@ ID=%@ Payload Length=%d Payload=%@ }"), v3, v26, v25, v24, v23, v21, v20, v19, v6, v9, v11, v13);

  if (v10)
  if (v4)

  return (NSString *)v15;
}

- (id)asData
{
  return (id)objc_msgSend(MEMORY[0x1E0DE78D0], "dataFromRecord:", self);
}

- (id)decode
{
  return (id)objc_msgSend(MEMORY[0x1E0DE78D0], "decodeFromRecord:", self);
}

- (NFNdefRecord)initWithCoder:(id)a3
{
  id v4;
  NFNdefRecord *v5;
  uint64_t v6;
  NSData *type;
  uint64_t v8;
  NSData *identifier;
  uint64_t v10;
  NSData *payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFNdefRecord;
  v5 = -[NFNdefRecord init](&v13, sel_init);
  if (v5)
  {
    v5->_firstOctet = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("firstOctet"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v10 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *type;
  NSData *identifier;
  NSData *payload;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeInt32:forKey:", self->_firstOctet, CFSTR("firstOctet"));
  type = self->_type;
  if (type)
    objc_msgSend(v8, "encodeObject:forKey:", type, CFSTR("type"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v8, "encodeObject:forKey:", identifier, CFSTR("id"));
  payload = self->_payload;
  v7 = v8;
  if (payload)
  {
    objc_msgSend(v8, "encodeObject:forKey:", payload, CFSTR("payload"));
    v7 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
