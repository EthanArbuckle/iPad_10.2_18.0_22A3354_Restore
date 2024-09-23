@implementation DMCProfileInfoSection

- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 text:(id)a5
{
  id v8;
  id v9;
  id v10;
  DMCProfileInfoSection *v11;
  uint64_t v12;
  NSString *sectionTitle;
  uint64_t v14;
  NSString *sectionFooter;
  uint64_t v16;
  NSString *sectionText;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMCProfileInfoSection;
  v11 = -[DMCProfileInfoSection init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sectionTitle = v11->_sectionTitle;
    v11->_sectionTitle = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    sectionFooter = v11->_sectionFooter;
    v11->_sectionFooter = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    sectionText = v11->_sectionText;
    v11->_sectionText = (NSString *)v16;

  }
  return v11;
}

- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 attributedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  DMCProfileInfoSection *v12;
  uint64_t v13;
  NSAttributedString *sectionAttributedText;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DMCProfileInfoSection initWithSectionTitle:footer:text:](self, "initWithSectionTitle:footer:text:", v10, v9, v11);

  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    sectionAttributedText = v12->_sectionAttributedText;
    v12->_sectionAttributedText = (NSAttributedString *)v13;

  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[DMCProfileInfoSection sectionTitle](self, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionTitle"));

  -[DMCProfileInfoSection sectionFooter](self, "sectionFooter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionFooter"));

  -[DMCProfileInfoSection sectionText](self, "sectionText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sectionText"));

  -[DMCProfileInfoSection sectionAttributedText](self, "sectionAttributedText");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sectionAttributedText"));

}

- (DMCProfileInfoSection)initWithCoder:(id)a3
{
  id v4;
  DMCProfileInfoSection *v5;
  void *v6;
  uint64_t v7;
  NSString *sectionTitle;
  void *v9;
  uint64_t v10;
  NSString *sectionFooter;
  void *v12;
  uint64_t v13;
  NSString *sectionText;
  void *v15;
  uint64_t v16;
  NSAttributedString *sectionAttributedText;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMCProfileInfoSection;
  v5 = -[DMCProfileInfoSection init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sectionTitle"));
    v7 = objc_claimAutoreleasedReturnValue();
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sectionFooter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("sectionText"));
    v13 = objc_claimAutoreleasedReturnValue();
    sectionText = v5->_sectionText;
    v5->_sectionText = (NSString *)v13;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("sectionAttributedText"));
    v16 = objc_claimAutoreleasedReturnValue();
    sectionAttributedText = v5->_sectionAttributedText;
    v5->_sectionAttributedText = (NSAttributedString *)v16;

  }
  return v5;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sectionText
{
  return self->_sectionText;
}

- (void)setSectionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)sectionAttributedText
{
  return self->_sectionAttributedText;
}

- (void)setSectionAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionAttributedText, 0);
  objc_storeStrong((id *)&self->_sectionText, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end
