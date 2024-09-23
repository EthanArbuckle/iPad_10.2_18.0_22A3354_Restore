@implementation DAMailMessage

- (id)to
{
  return 0;
}

- (id)cc
{
  return 0;
}

- (id)from
{
  return 0;
}

- (id)replyTo
{
  return 0;
}

- (id)date
{
  return 0;
}

- (id)subject
{
  return 0;
}

- (id)displayTo
{
  return 0;
}

- (int)importance
{
  return 1;
}

- (BOOL)read
{
  return 0;
}

- (BOOL)flagged
{
  return 0;
}

- (id)body
{
  return 0;
}

- (int)bodyType
{
  return 2;
}

- (int)bodySize
{
  return 0;
}

- (int)bodyTruncated
{
  return 0;
}

- (id)messageClass
{
  return 0;
}

- (id)attachments
{
  return 0;
}

- (id)meetingRequestUUID
{
  return 0;
}

- (id)meetingRequestMetaData
{
  return 0;
}

- (BOOL)meetingRequestIsActionable
{
  return 0;
}

- (id)threadTopic
{
  return 0;
}

- (id)conversationId
{
  return 0;
}

- (id)conversationIndex
{
  return 0;
}

- (id)remoteID
{
  return 0;
}

- (id)longID
{
  return 0;
}

- (id)folderID
{
  return 0;
}

- (int)lastVerb
{
  return 0;
}

- (id)sender
{
  return 0;
}

- (id)bcc
{
  return 0;
}

- (BOOL)isDraft
{
  return 0;
}

- (id)clientID
{
  return 0;
}

- (id)instanceID
{
  return 0;
}

- (id)preview
{
  return 0;
}

- (BOOL)readIsSet
{
  return 0;
}

- (BOOL)flaggedIsSet
{
  return 0;
}

- (BOOL)verbIsSet
{
  return 0;
}

- (int)smimeType
{
  return 0;
}

- (id)rfc822Data
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[DAMailMessage from](self, "from");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddressListForSender:", v5);

  -[DAMailMessage date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWithCalendarFormat:timeZone:", CFSTR("%a, %d %b %Y %H:%M:%S %z"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "setHeader:forKey:", v6, *MEMORY[0x1E0D45EF8]);
  -[DAMailMessage to](self, "to");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddressListForTo:", v9);

  -[DAMailMessage cc](self, "cc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddressListForCc:", v10);

  -[DAMailMessage bcc](self, "bcc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddressListForBcc:", v11);

  -[DAMailMessage replyTo](self, "replyTo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddressList:forKey:", v12, *MEMORY[0x1E0D45FD8]);

  -[DAMailMessage subject](self, "subject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeader:forKey:", v13, *MEMORY[0x1E0D45F20]);

  objc_msgSend(v4, "encodedHeaders");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v3, "appendData:", v14);
  -[DAMailMessage body](self, "body");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    -[DAMailMessage body](self, "body");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "appendData:", v18);
  }

  return v3;
}

- (DAMailMessage)initWithCoder:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t v7[16];

  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C1CD1000, v4, v5, "DAMailMessage initWithCoder: should be called on a subclass only", v7, 2u);
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];

  DALoggingwithCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C1CD1000, v3, v4, "DAMailMessage encodeWithCoder: should be called on a subclass only", v5, 2u);
  }

}

@end
