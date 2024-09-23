@implementation BCSBusinessLinkContentItemModel

- (BCSBusinessLinkContentItemModel)initWithBusinessLinkContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BCSBusinessLinkContentItemModel *v9;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isDefault");

  v9 = (BCSBusinessLinkContentItemModel *)-[BCSBusinessLinkContentItemModel initWithTitle:subtitle:language:isDefault:](self, v5, v6, v7, v8);
  return v9;
}

- (id)initWithTitle:(void *)a3 subtitle:(void *)a4 language:(char)a5 isDefault:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BCSBusinessLinkContentItemModel;
    a1 = objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      v12 = objc_msgSend(v9, "copy");
      v13 = (void *)*((_QWORD *)a1 + 1);
      *((_QWORD *)a1 + 1) = v12;

      v14 = objc_msgSend(v10, "copy");
      v15 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v14;

      v16 = objc_msgSend(v11, "copy");
      v17 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v16;

      *((_BYTE *)a1 + 32) = a5;
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("BCSBusinessLinkContentItemModelTitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("BCSBusinessLinkContentItemModelSubtitleKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("BCSBusinessLinkContentItemModelLangaugeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isDefault, CFSTR("BCSBusinessLinkContentItemModelIsDefaultKey"));

}

- (BCSBusinessLinkContentItemModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  BCSBusinessLinkContentItemModel *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSBusinessLinkContentItemModelTitleKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSBusinessLinkContentItemModelSubtitleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BCSBusinessLinkContentItemModelLangaugeKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BCSBusinessLinkContentItemModelIsDefaultKey"));

  v9 = (BCSBusinessLinkContentItemModel *)-[BCSBusinessLinkContentItemModel initWithTitle:subtitle:language:isDefault:](self, v5, v6, v7, v8);
  return v9;
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
  BOOL isDefault;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[BCSBusinessLinkContentItemModel title](self, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyWithZone:", a3);
    v8 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v7;

    -[BCSBusinessLinkContentItemModel subtitle](self, "subtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v10;

    -[BCSBusinessLinkContentItemModel language](self, "language");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copyWithZone:", a3);
    v14 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v13;

    if (self)
      isDefault = self->_isDefault;
    else
      isDefault = 0;
    *(_BYTE *)(v5 + 32) = isDefault;
  }
  return (id)v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BCSBusinessLinkContentItemModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_title, CFSTR("title"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_subtitle, CFSTR("subtitle"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_language, CFSTR("language"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_isDefault, CFSTR("isDefault"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BCSBusinessLinkContentItemModel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)language
{
  return self->_language;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
