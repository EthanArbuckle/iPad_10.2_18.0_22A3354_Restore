@implementation BCSCallToActionItem

- (BCSCallToActionItem)initWithCallToAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BCSCallToActionItem *v10;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isDefault");

  v10 = -[BCSCallToActionItem initWithTitle:subtitle:language:body:isDefault:](self, "initWithTitle:subtitle:language:body:isDefault:", v5, v6, v7, v8, v9);
  return v10;
}

- (BCSCallToActionItem)initWithTitle:(id)a3 subtitle:(id)a4 language:(id)a5 body:(id)a6 isDefault:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BCSCallToActionItem *v16;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *subtitle;
  uint64_t v21;
  NSString *language;
  uint64_t v23;
  NSString *body;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)BCSCallToActionItem;
  v16 = -[BCSCallToActionItem init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    title = v16->_title;
    v16->_title = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    language = v16->_language;
    v16->_language = (NSString *)v21;

    v23 = objc_msgSend(v15, "copy");
    body = v16->_body;
    v16->_body = (NSString *)v23;

    v16->_isDefault = a7;
  }

  return v16;
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
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)BCSCallToActionItem;
  -[BCSCallToActionItem description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallToActionItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallToActionItem subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallToActionItem language](self, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSCallToActionItem body](self, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - title:%@ - subtitle:%@ - language:%@ - body:%@ - isDefault:%d"), v4, v5, v6, v7, v8, -[BCSCallToActionItem isDefault](self, "isDefault"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("BCSCallToActionTitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("BCSCallToActionSubtitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("BCSCallToActionLangaugeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_body, CFSTR("BCSCallToActionBodyKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefault, CFSTR("BCSCallToActionIsDefaultKey"));

}

- (BCSCallToActionItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BCSCallToActionItem *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSCallToActionTitleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSCallToActionSubtitleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSCallToActionLangaugeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSCallToActionBodyKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BCSCallToActionIsDefaultKey"));

  v10 = -[BCSCallToActionItem initWithTitle:subtitle:language:body:isDefault:](self, "initWithTitle:subtitle:language:body:isDefault:", v5, v6, v7, v8, v9);
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSCallToActionItem title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v7;

    -[BCSCallToActionItem subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    -[BCSCallToActionItem language](self, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v13;

    -[BCSCallToActionItem body](self, "body");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v16;

    *(_BYTE *)(v5 + 8) = -[BCSCallToActionItem isDefault](self, "isDefault");
  }
  return (id)v5;
}

- (NSString)language
{
  return self->_language;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
