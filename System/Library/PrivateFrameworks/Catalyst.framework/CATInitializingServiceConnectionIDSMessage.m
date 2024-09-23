@implementation CATInitializingServiceConnectionIDSMessage

- (CATInitializingServiceConnectionIDSMessage)initWithInvitationIdentifier:(id)a3 content:(id)a4
{
  id v7;
  id v8;
  CATInitializingServiceConnectionIDSMessage *v9;
  CATInitializingServiceConnectionIDSMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATInitializingServiceConnectionIDSMessage;
  v9 = -[CATInitializingServiceConnectionIDSMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_content, a4);
    objc_storeStrong((id *)&v10->_invitationIdentifier, a3);
  }

  return v10;
}

- (int64_t)messageType
{
  return 101;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("Content");
  -[CATInitializingServiceConnectionIDSMessage content](self, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("ContentType");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CATInitializingServiceConnectionIDSMessage content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "contentType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("InvitationIdentifier");
  -[CATInitializingServiceConnectionIDSMessage invitationIdentifier](self, "invitationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ContentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "cat_uuidForKey:", CFSTR("InvitationIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v11)
  {
    if (v7 && v10 != 0)
    {
      v14 = objc_msgSend(v7, "integerValue");
      if ((unint64_t)(v14 - 1) <= 3
        && (-[__objc2_class instanceWithDictionary:](*off_24C1C63B8[v14 - 1], "instanceWithDictionary:", v10),
            (v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v16 = (void *)v15;
        v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInvitationIdentifier:content:", v11, v15);

      }
      else
      {
        v12 = 0;
      }
    }
  }

  return v12;
}

- (NSUUID)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (CATInitializingIDSServiceConnectionMessageContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
}

@end
