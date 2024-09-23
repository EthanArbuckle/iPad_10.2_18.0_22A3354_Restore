@implementation MEMessage

- (MEMessage)initWithState:(int64_t)a3 encryptionState:(int64_t)a4 signatureState:(int64_t)a5 subject:(id)a6 recipients:(id)a7 from:(id)a8 dataSent:(id)a9 dateReceived:(id)a10 headers:(id)a11 rawData:(id)a12 senderMetadata:(id)a13
{
  id v17;
  MEMessage *v18;
  MEMessage *v19;
  uint64_t v20;
  NSDictionary *headers;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v32 = a6;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v17 = a11;
  v27 = a12;
  v26 = a13;
  v33.receiver = self;
  v33.super_class = (Class)MEMessage;
  v18 = -[MEMessage init](&v33, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_state = a3;
    v18->_encryptionState = a4;
    v18->_signatureState = a5;
    objc_storeStrong((id *)&v18->_subject, a6);
    objc_storeStrong((id *)&v19->_fromAddress, a8);
    -[MEMessage _sanitaizedHeadersForHeaders:](v19, "_sanitaizedHeadersForHeaders:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    headers = v19->_headers;
    v19->_headers = (NSDictionary *)v20;

    objc_storeStrong((id *)&v19->_recipients, a7);
    objc_storeStrong((id *)&v19->_dateSent, a9);
    objc_storeStrong((id *)&v19->_dateReceived, a10);
    objc_storeStrong((id *)&v19->_rawData, a12);
    objc_storeStrong((id *)&v19->_senderMetadata, a13);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)allRecipientAddresses
{
  return -[MEMessageRecipients allRecipients](self->_recipients, "allRecipients");
}

- (NSArray)toAddresses
{
  return -[MEMessageRecipients to](self->_recipients, "to");
}

- (NSArray)ccAddresses
{
  return -[MEMessageRecipients cc](self->_recipients, "cc");
}

- (NSArray)bccAddresses
{
  return -[MEMessageRecipients bcc](self->_recipients, "bcc");
}

- (NSArray)replyToAddresses
{
  return -[MEMessageRecipients replyTo](self->_recipients, "replyTo");
}

- (MEMessage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *dateSent;
  NSDate *v15;
  NSDate *v16;
  NSDate *dateReceived;
  NSDate *v18;
  NSData *v19;
  NSData *rawData;
  NSData *v21;
  void *v22;
  MEMessage *v23;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_state"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_encryptionState"));
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_signatureState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_subject"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_recipients"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_fromAddress"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("EFPropertyKey_headers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_dateSent"));
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateSent = self->_dateSent;
  self->_dateSent = v13;

  v15 = v13;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_dateReceived"));
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateReceived = self->_dateReceived;
  self->_dateReceived = v16;

  v18 = v16;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_rawData"));
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();
  rawData = self->_rawData;
  self->_rawData = v19;

  v21 = v19;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_senderMetadata"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MEMessage initWithState:encryptionState:signatureState:subject:recipients:from:dataSent:dateReceived:headers:rawData:senderMetadata:](self, "initWithState:encryptionState:signatureState:subject:recipients:from:dataSent:dateReceived:headers:rawData:senderMetadata:", v5, v6, v7, v27, v26, v25, v15, v18, v12, v21, v22);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "encodeInteger:forKey:", self->_state, CFSTR("EFPropertyKey_state"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_encryptionState, CFSTR("EFPropertyKey_encryptionState"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_signatureState, CFSTR("EFPropertyKey_signatureState"));
  -[MEMessage subject](self, "subject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_subject"));

  -[MEMessage recipients](self, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_recipients"));

  -[MEMessage fromAddress](self, "fromAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_fromAddress"));

  -[MEMessage dateSent](self, "dateSent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_dateSent"));

  -[MEMessage dateReceived](self, "dateReceived");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("EFPropertyKey_dateReceived"));

  -[MEMessage headers](self, "headers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("EFPropertyKey_headers"));

  -[MEMessage rawData](self, "rawData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("EFPropertyKey_rawData"));

  -[MEMessage senderMetadata](self, "senderMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("EFPropertyKey_senderMetadata"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  MEMessageState v7;
  MEMessageEncryptionState v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  if ((objc_msgSend(v5, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    v6 = v4;
    v7 = -[MEMessage state](self, "state");
    if (v7 == objc_msgSend(v6, "state")
      && (v8 = -[MEMessage encryptionState](self, "encryptionState"), v8 == objc_msgSend(v6, "encryptionState")))
    {
      -[MEMessage subject](self, "subject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[MEMessage recipients](self, "recipients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recipients");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[MEMessage fromAddress](self, "fromAddress");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "fromAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "isEqual:", v13))
          {
            -[MEMessage senderMetadata](self, "senderMetadata");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "senderMetadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (EFObjectsAreEqual())
            {
              -[MEMessage headers](self, "headers");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "headers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = EFObjectsAreEqual();

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  MEMessageState v3;
  MEMessageEncryptionState v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  v3 = -[MEMessage state](self, "state");
  v4 = -[MEMessage encryptionState](self, "encryptionState");
  -[MEMessage subject](self, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MEMessage recipients](self, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[MEMessage fromAddress](self, "fromAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[MEMessage senderMetadata](self, "senderMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  -[MEMessage headers](self, "headers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 33 * (33 * (33 * (33 * (33 * (33 * v3 + v4) + v6) + v8) + v10) + v12)
      + objc_msgSend(v13, "hash")
      + 0x9EC41D4E1;

  return v14;
}

- (id)_sanitaizedHeadersForHeaders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v13;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v13);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = objc_alloc_init(MEMORY[0x24BDBCE30]);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v9;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          objc_msgSend(v9, "ef_filter:", &__block_literal_global_5);
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v11 = (void *)v10;

        v8 = v11;
LABEL_11:
        if (objc_msgSend(v8, "count"))
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);
  }

  return v14;
}

uint64_t __42__MEMessage__sanitaizedHeadersForHeaders___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x24BE2E648], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E558]), "initWithStyle:", 2);
    -[MEMessage recipients](self, "recipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BE2E550];
    v29 = (void *)v9;
    -[MEMessage fromAddress](self, "fromAddress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rawString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emailAddressWithString:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ef_publicDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "to");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ef_compactMap:", &__block_literal_global_33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromEmailAddressList:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "ef_compactMap:", &__block_literal_global_33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromEmailAddressList:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bcc");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ef_compactMap:", &__block_literal_global_33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromEmailAddressList:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BE2E670];
    -[MEMessage subject](self, "subject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "partiallyRedactedStringForString:maximumUnredactedLength:", v13, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p>\nfromAddress: %@\nto: %@\ncc: %@\nbcc: %@\nsubject: %@\nstate: %ld"), v29, self, v25, v22, v19, v11, v14, -[MEMessage state](self, "state"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[MEMessage description](self, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v15;
}

id __33__MEMessage_ef_publicDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE2E550];
  objc_msgSend(a2, "rawString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emailAddressWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_protectedHeaders
{
  if (_protectedHeaders_onceToken != -1)
    dispatch_once(&_protectedHeaders_onceToken, &__block_literal_global_40);
  return (id)_protectedHeaders_protectedHeaders;
}

void __30__MEMessage__protectedHeaders__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[39];

  v23[38] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BE2E510];
  v23[0] = *MEMORY[0x24BE2E480];
  v23[1] = v1;
  v2 = *MEMORY[0x24BE2E4D8];
  v23[2] = *MEMORY[0x24BE2E430];
  v23[3] = v2;
  v3 = *MEMORY[0x24BE2E4F0];
  v23[4] = *MEMORY[0x24BE2E428];
  v23[5] = v3;
  v4 = *MEMORY[0x24BE2E4E0];
  v23[6] = *MEMORY[0x24BE2E500];
  v23[7] = v4;
  v5 = *MEMORY[0x24BE2E508];
  v23[8] = *MEMORY[0x24BE2E4C8];
  v23[9] = v5;
  v6 = *MEMORY[0x24BE2E490];
  v23[10] = *MEMORY[0x24BE2E478];
  v23[11] = v6;
  v7 = *MEMORY[0x24BE2E498];
  v23[12] = *MEMORY[0x24BE2E4B8];
  v23[13] = v7;
  v8 = *MEMORY[0x24BE2E4A8];
  v23[14] = *MEMORY[0x24BE2E4A0];
  v23[15] = v8;
  v9 = *MEMORY[0x24BE2E4F8];
  v23[16] = *MEMORY[0x24BE2E4E8];
  v23[17] = v9;
  v10 = *MEMORY[0x24BE2E4B0];
  v23[18] = *MEMORY[0x24BE2E4C0];
  v23[19] = v10;
  v11 = *MEMORY[0x24BE2E460];
  v23[20] = *MEMORY[0x24BE2E468];
  v23[21] = v11;
  v12 = *MEMORY[0x24BE2E440];
  v23[22] = *MEMORY[0x24BE2E438];
  v23[23] = v12;
  v13 = *MEMORY[0x24BE2E450];
  v23[24] = *MEMORY[0x24BE2E448];
  v23[25] = v13;
  v14 = *MEMORY[0x24BE2E538];
  v23[26] = *MEMORY[0x24BE2E458];
  v23[27] = v14;
  v15 = *MEMORY[0x24BE2E518];
  v23[28] = *MEMORY[0x24BE2E528];
  v23[29] = v15;
  v16 = *MEMORY[0x24BE2E530];
  v23[30] = *MEMORY[0x24BE2E540];
  v23[31] = v16;
  v17 = *MEMORY[0x24BE2E520];
  v23[32] = *MEMORY[0x24BE2E420];
  v23[33] = v17;
  v18 = *MEMORY[0x24BE2E488];
  v23[34] = *MEMORY[0x24BE2E4D0];
  v23[35] = v18;
  v19 = *MEMORY[0x24BE2E470];
  v23[36] = *MEMORY[0x24BE2E418];
  v23[37] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)_protectedHeaders_protectedHeaders;
  _protectedHeaders_protectedHeaders = v21;

}

+ (BOOL)extensionCanSetHeaderKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_protectedHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6 ^ 1;
}

- (MEMessageState)state
{
  return self->_state;
}

- (MEMessageEncryptionState)encryptionState
{
  return self->_encryptionState;
}

- (NSString)subject
{
  return self->_subject;
}

- (MEEmailAddress)fromAddress
{
  return self->_fromAddress;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (MEMessageRecipients)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (int64_t)signatureState
{
  return self->_signatureState;
}

- (void)setSignatureState:(int64_t)a3
{
  self->_signatureState = a3;
}

- (MEMessageSenderMetadata)senderMetadata
{
  return self->_senderMetadata;
}

- (void)setSenderMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_senderMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderMetadata, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_fromAddress, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

@end
