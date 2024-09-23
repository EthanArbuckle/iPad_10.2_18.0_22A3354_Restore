@implementation CTLazuliSystemCapablities

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLazuliSystemCapablities exploderUri](self, "exploderUri");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", exploderUri = %@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(", autoAcceptChat = %d"), -[CTLazuliSystemCapablities autoAcceptChat](self, "autoAcceptChat"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", autoAcceptGroupChat = %d"), -[CTLazuliSystemCapablities autoAcceptGroupChat](self, "autoAcceptGroupChat"));
  -[CTLazuliSystemCapablities maxGroupSize](self, "maxGroupSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxGroupSize = %@"), v5);

  -[CTLazuliSystemCapablities fileTransferUrl](self, "fileTransferUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fileTransferUrl = %@"), v6);

  -[CTLazuliSystemCapablities fileTransferMaxRecipients](self, "fileTransferMaxRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", fileTransferMaxRecipients = %@"), v7);

  -[CTLazuliSystemCapablities maxFileTransferSize](self, "maxFileTransferSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", maxFileTransferSize = %@"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR(", fileTransferAutoAccept = %d"), -[CTLazuliSystemCapablities fileTransferAutoAccept](self, "fileTransferAutoAccept"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqualToCTLazuliSystemCapablities:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v8 = a3;
  -[CTLazuliSystemCapablities exploderUri](self, "exploderUri");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 || (objc_msgSend(v8, "exploderUri"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemCapablities exploderUri](self, "exploderUri");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exploderUri");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqual:", v5))
    {
      LOBYTE(v11) = 0;
LABEL_10:

      goto LABEL_11;
    }
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  v12 = -[CTLazuliSystemCapablities autoAcceptChat](self, "autoAcceptChat");
  if (v12 != objc_msgSend(v8, "autoAcceptChat")
    || (v13 = -[CTLazuliSystemCapablities autoAcceptGroupChat](self, "autoAcceptGroupChat"),
        v13 != objc_msgSend(v8, "autoAcceptGroupChat")))
  {
    LOBYTE(v11) = 0;
    if (!v10)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[CTLazuliSystemCapablities maxGroupSize](self, "maxGroupSize");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 || (objc_msgSend(v8, "maxGroupSize"), (v32 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemCapablities maxGroupSize](self, "maxGroupSize");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v38, "longValue");
    objc_msgSend(v8, "maxGroupSize");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 != objc_msgSend(v37, "longValue"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_48;
    }
    v34 = 1;
  }
  else
  {
    v32 = 0;
    v34 = 0;
  }
  -[CTLazuliSystemCapablities fileTransferUrl](self, "fileTransferUrl");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 || (objc_msgSend(v8, "fileTransferUrl"), (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemCapablities fileTransferUrl](self, "fileTransferUrl");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileTransferUrl");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v36, "isEqual:"))
    {
      LOBYTE(v11) = 0;
      goto LABEL_45;
    }
    v30 = 1;
  }
  else
  {
    v27 = 0;
    v30 = 0;
  }
  -[CTLazuliSystemCapablities fileTransferMaxRecipients](self, "fileTransferMaxRecipients");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31
    || (objc_msgSend(v8, "fileTransferMaxRecipients"), (v23 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[CTLazuliSystemCapablities fileTransferMaxRecipients](self, "fileTransferMaxRecipients");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v28, "longValue");
    objc_msgSend(v8, "fileTransferMaxRecipients");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 != objc_msgSend(v29, "longValue"))
    {
      LOBYTE(v11) = 0;
      v18 = v29;
      goto LABEL_42;
    }
    v25 = 1;
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  -[CTLazuliSystemCapablities maxFileTransferSize](self, "maxFileTransferSize");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(v8, "maxFileTransferSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v22 = 0;
      v20 = 0;
LABEL_38:
      v21 = -[CTLazuliSystemCapablities fileTransferAutoAccept](self, "fileTransferAutoAccept");
      v11 = v21 ^ objc_msgSend(v8, "fileTransferAutoAccept") ^ 1;
      if (!v20)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  -[CTLazuliSystemCapablities maxFileTransferSize](self, "maxFileTransferSize");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v24, "longValue");
  objc_msgSend(v8, "maxFileTransferSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 == objc_msgSend(v6, "longValue"))
  {
    v20 = 1;
    goto LABEL_38;
  }
  LOBYTE(v11) = 0;
LABEL_39:

LABEL_40:
  v18 = v29;
  if (v26)
  {

    if (!v25)
      goto LABEL_43;
    goto LABEL_42;
  }

  if ((v25 & 1) != 0)
  {
LABEL_42:

  }
LABEL_43:
  if (v31)
  {

    if (!v30)
      goto LABEL_46;
    goto LABEL_45;
  }

  if ((v30 & 1) != 0)
  {
LABEL_45:

  }
LABEL_46:
  if (v35)
  {

    if (!v34)
      goto LABEL_49;
    goto LABEL_48;
  }

  if ((v34 & 1) != 0)
  {
LABEL_48:

  }
LABEL_49:
  if (!v15)

  if ((v10 & 1) != 0)
    goto LABEL_10;
LABEL_11:
  if (!v9)

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CTLazuliSystemCapablities *v4;
  CTLazuliSystemCapablities *v5;
  BOOL v6;

  v4 = (CTLazuliSystemCapablities *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CTLazuliSystemCapablities isEqualToCTLazuliSystemCapablities:](self, "isEqualToCTLazuliSystemCapablities:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CTLazuliSystemCapablities *v4;

  v4 = +[CTLazuliSystemCapablities allocWithZone:](CTLazuliSystemCapablities, "allocWithZone:", a3);
  -[CTLazuliSystemCapablities setExploderUri:](v4, "setExploderUri:", self->_exploderUri);
  -[CTLazuliSystemCapablities setAutoAcceptChat:](v4, "setAutoAcceptChat:", self->_autoAcceptChat);
  -[CTLazuliSystemCapablities setAutoAcceptGroupChat:](v4, "setAutoAcceptGroupChat:", self->_autoAcceptGroupChat);
  -[CTLazuliSystemCapablities setMaxGroupSize:](v4, "setMaxGroupSize:", self->_maxGroupSize);
  -[CTLazuliSystemCapablities setFileTransferUrl:](v4, "setFileTransferUrl:", self->_fileTransferUrl);
  -[CTLazuliSystemCapablities setFileTransferMaxRecipients:](v4, "setFileTransferMaxRecipients:", self->_fileTransferMaxRecipients);
  -[CTLazuliSystemCapablities setMaxFileTransferSize:](v4, "setMaxFileTransferSize:", self->_maxFileTransferSize);
  -[CTLazuliSystemCapablities setFileTransferAutoAccept:](v4, "setFileTransferAutoAccept:", self->_fileTransferAutoAccept);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_exploderUri, CFSTR("kExploderUriKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_autoAcceptChat, CFSTR("kAutoAcceptChatKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_autoAcceptGroupChat, CFSTR("kAutoAcceptGroupChatKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxGroupSize, CFSTR("kMaxGroupSizeKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileTransferUrl, CFSTR("kFileTransferUrlKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fileTransferMaxRecipients, CFSTR("kFileTransferMaxRecipientsKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_maxFileTransferSize, CFSTR("kMaxFileTransferSizeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_fileTransferAutoAccept, CFSTR("kFileTransferAutoAcceptKey"));

}

- (CTLazuliSystemCapablities)initWithCoder:(id)a3
{
  id v4;
  CTLazuliSystemCapablities *v5;
  uint64_t v6;
  NSURL *exploderUri;
  uint64_t v8;
  NSNumber *maxGroupSize;
  uint64_t v10;
  NSURL *fileTransferUrl;
  uint64_t v12;
  NSNumber *fileTransferMaxRecipients;
  uint64_t v14;
  NSNumber *maxFileTransferSize;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTLazuliSystemCapablities;
  v5 = -[CTLazuliSystemCapablities init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kExploderUriKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    exploderUri = v5->_exploderUri;
    v5->_exploderUri = (NSURL *)v6;

    v5->_autoAcceptChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoAcceptChatKey"));
    v5->_autoAcceptGroupChat = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAutoAcceptGroupChatKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMaxGroupSizeKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    maxGroupSize = v5->_maxGroupSize;
    v5->_maxGroupSize = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileTransferUrlKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    fileTransferUrl = v5->_fileTransferUrl;
    v5->_fileTransferUrl = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kFileTransferMaxRecipientsKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
    v5->_fileTransferMaxRecipients = (NSNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMaxFileTransferSizeKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    maxFileTransferSize = v5->_maxFileTransferSize;
    v5->_maxFileTransferSize = (NSNumber *)v14;

    v5->_fileTransferAutoAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kFileTransferAutoAcceptKey"));
  }

  return v5;
}

- (CTLazuliSystemCapablities)initWithReflection:(const void *)a3
{
  CTLazuliSystemCapablities *v4;
  CTLazuliSystemCapablities *v5;
  void *v6;
  void *v7;
  int v8;
  const void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  uint64_t v13;
  NSURL *exploderUri;
  uint64_t v15;
  NSNumber *maxGroupSize;
  char *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  NSURL *fileTransferUrl;
  uint64_t v26;
  NSNumber *fileTransferMaxRecipients;
  uint64_t v28;
  NSNumber *maxFileTransferSize;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CTLazuliSystemCapablities;
  v4 = -[CTLazuliSystemCapablities init](&v31, sel_init);
  v5 = v4;
  if (v4)
  {
    if (*((_BYTE *)a3 + 24))
    {
      v6 = (void *)MEMORY[0x1E0C99E98];
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = *((char *)a3 + 23);
      v9 = *(const void **)a3;
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v8 >= 0)
        v11 = a3;
      else
        v11 = v9;
      objc_msgSend(v7, "stringWithCString:encoding:", v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      exploderUri = v5->_exploderUri;
      v5->_exploderUri = (NSURL *)v13;

    }
    else
    {
      v12 = v4->_exploderUri;
      v4->_exploderUri = 0;
    }

    v5->_autoAcceptChat = *((_BYTE *)a3 + 32);
    v5->_autoAcceptGroupChat = *((_BYTE *)a3 + 33);
    if (*((_BYTE *)a3 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 5));
      v15 = objc_claimAutoreleasedReturnValue();
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = (NSNumber *)v15;
    }
    else
    {
      maxGroupSize = v5->_maxGroupSize;
      v5->_maxGroupSize = 0;
    }

    if (*((_BYTE *)a3 + 80))
    {
      v17 = (char *)*((_QWORD *)a3 + 7);
      v18 = (void *)MEMORY[0x1E0C99E98];
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = *((char *)a3 + 79);
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
      if (v20 >= 0)
        v22 = (char *)a3 + 56;
      else
        v22 = v17;
      objc_msgSend(v19, "stringWithCString:encoding:", v22, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLWithString:", v23);
      v24 = objc_claimAutoreleasedReturnValue();
      fileTransferUrl = v5->_fileTransferUrl;
      v5->_fileTransferUrl = (NSURL *)v24;

    }
    else
    {
      v23 = v5->_fileTransferUrl;
      v5->_fileTransferUrl = 0;
    }

    if (*((_BYTE *)a3 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 11));
      v26 = objc_claimAutoreleasedReturnValue();
      fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
      v5->_fileTransferMaxRecipients = (NSNumber *)v26;
    }
    else
    {
      fileTransferMaxRecipients = v5->_fileTransferMaxRecipients;
      v5->_fileTransferMaxRecipients = 0;
    }

    if (*((_BYTE *)a3 + 112))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)a3 + 13));
      v28 = objc_claimAutoreleasedReturnValue();
      maxFileTransferSize = v5->_maxFileTransferSize;
      v5->_maxFileTransferSize = (NSNumber *)v28;
    }
    else
    {
      maxFileTransferSize = v5->_maxFileTransferSize;
      v5->_maxFileTransferSize = 0;
    }

    v5->_fileTransferAutoAccept = *((_BYTE *)a3 + 120);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)exploderUri
{
  return self->_exploderUri;
}

- (void)setExploderUri:(id)a3
{
  objc_storeStrong((id *)&self->_exploderUri, a3);
}

- (BOOL)autoAcceptChat
{
  return self->_autoAcceptChat;
}

- (void)setAutoAcceptChat:(BOOL)a3
{
  self->_autoAcceptChat = a3;
}

- (BOOL)autoAcceptGroupChat
{
  return self->_autoAcceptGroupChat;
}

- (void)setAutoAcceptGroupChat:(BOOL)a3
{
  self->_autoAcceptGroupChat = a3;
}

- (NSNumber)maxGroupSize
{
  return self->_maxGroupSize;
}

- (void)setMaxGroupSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxGroupSize, a3);
}

- (NSURL)fileTransferUrl
{
  return self->_fileTransferUrl;
}

- (void)setFileTransferUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferUrl, a3);
}

- (NSNumber)fileTransferMaxRecipients
{
  return self->_fileTransferMaxRecipients;
}

- (void)setFileTransferMaxRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferMaxRecipients, a3);
}

- (NSNumber)maxFileTransferSize
{
  return self->_maxFileTransferSize;
}

- (void)setMaxFileTransferSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxFileTransferSize, a3);
}

- (BOOL)fileTransferAutoAccept
{
  return self->_fileTransferAutoAccept;
}

- (void)setFileTransferAutoAccept:(BOOL)a3
{
  self->_fileTransferAutoAccept = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxFileTransferSize, 0);
  objc_storeStrong((id *)&self->_fileTransferMaxRecipients, 0);
  objc_storeStrong((id *)&self->_fileTransferUrl, 0);
  objc_storeStrong((id *)&self->_maxGroupSize, 0);
  objc_storeStrong((id *)&self->_exploderUri, 0);
}

@end
