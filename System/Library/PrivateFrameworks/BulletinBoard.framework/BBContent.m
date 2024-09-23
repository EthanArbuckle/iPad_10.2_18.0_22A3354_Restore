@implementation BBContent

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 attributedMessage:(id)a6 summary:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BBContent *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(BBContent);
  -[BBContent setTitle:](v16, "setTitle:", v15);

  -[BBContent setSubtitle:](v16, "setSubtitle:", v14);
  -[BBContent setMessage:](v16, "setMessage:", v13);

  -[BBContent setAttributedMessage:](v16, "setAttributedMessage:", v12);
  -[BBContent setSummary:](v16, "setSummary:", v11);

  return v16;
}

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5 summary:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "contentWithTitle:subtitle:message:attributedMessage:summary:", v12, v11, v10, 0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (BBContent *)v13;
}

+ (BBContent)contentWithTitle:(id)a3 subtitle:(id)a4 message:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "contentWithTitle:subtitle:message:attributedMessage:summary:", v9, v8, v7, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (BBContent *)v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[BBContent title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BBContent subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[BBContent message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[BBContent attributedMessage](self, "attributedMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[BBContent summary](self, "summary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  BBContent *v4;
  BOOL v5;

  v4 = (BBContent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[BBContent isEqualToContent:](self, "isEqualToContent:", v4);
  }

  return v5;
}

- (BOOL)isEqualToContent:(id)a3
{
  id v4;
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
  char v15;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)BBLogBulletinLife;
  if (os_log_type_enabled((os_log_t)BBLogBulletinLife, OS_LOG_TYPE_DEBUG))
    -[BBContent isEqualToContent:].cold.1(v5, self, v4);
  -[BBContent title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualObjects())
  {
    -[BBContent subtitle](self, "subtitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSEqualObjects())
    {
      -[BBContent message](self, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "message");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[BBContent attributedMessage](self, "attributedMessage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attributedMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (BSEqualObjects())
        {
          -[BBContent summary](self, "summary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "summary");
          v18 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = BSEqualObjects();

          v12 = v18;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBContent)initWithCoder:(id)a3
{
  id v4;
  BBContent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BBContent;
  v5 = -[BBContent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBContent setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBContent setSubtitle:](v5, "setSubtitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBContent setMessage:](v5, "setMessage:", v8);

    v9 = (void *)MEMORY[0x24BDD1458];
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_bb_attributedStringWithRTFDData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBContent setAttributedMessage:](v5, "setAttributedMessage:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBContent setSummary:](v5, "setSummary:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[BBContent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[BBContent subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("subtitle"));

  -[BBContent message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("message"));

  -[BBContent attributedMessage](self, "attributedMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_bb_RTFDData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("attributedMessage"));

  -[BBContent summary](self, "summary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("summary"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BBContent title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBContent subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBContent message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBContent attributedMessage](self, "attributedMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBContent summary](self, "summary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ title = '%@' : subtitle = '%@' : message = '%@' : attributedMessage = '%@', summary = '%@' }"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void)setAttributedMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)isEqualToContent:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "summary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BSEqualObjects();
  objc_msgSend(a2, "summary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 67109378;
  v11[1] = v8;
  v12 = 2112;
  v13 = v10;
  _os_log_debug_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEBUG, "KTH_DEBUG-isEqualToContent %d %@", (uint8_t *)v11, 0x12u);

}

@end
