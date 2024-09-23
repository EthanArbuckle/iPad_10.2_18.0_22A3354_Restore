@implementation ASTInstructionalPrompt

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 imageLocators:(id)a5 instructions:(id)a6 options:(id)a7
{
  return -[ASTInstructionalPrompt initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:](self, "initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:", a3, a4, 0, 0, 0, a5, a6, 0, a7);
}

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 options:(id)a10
{
  return -[ASTInstructionalPrompt initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:](self, "initWithID:type:iconLocator:localizedTitle:localizedSubtitle:imageLocators:instructions:instructionsStyle:options:", a3, a4, a5, a6, a7, a8, a9, 0, a10);
}

- (ASTInstructionalPrompt)initWithID:(id)a3 type:(int64_t)a4 iconLocator:(id)a5 localizedTitle:(id)a6 localizedSubtitle:(id)a7 imageLocators:(id)a8 instructions:(id)a9 instructionsStyle:(int64_t)a10 options:(id)a11
{
  id v17;
  id v18;
  ASTInstructionalPrompt *v19;
  ASTInstructionalPrompt *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v17 = a3;
  v27 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v18 = a11;
  v28.receiver = self;
  v28.super_class = (Class)ASTInstructionalPrompt;
  v19 = -[ASTInstructionalPrompt init](&v28, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_type = a4;
    objc_storeStrong((id *)&v20->_iconLocator, a5);
    objc_storeStrong((id *)&v20->_localizedTitle, a6);
    objc_storeStrong((id *)&v20->_localizedSubtitle, a7);
    objc_storeStrong((id *)&v20->_imageLocators, a8);
    objc_storeStrong((id *)&v20->_instructions, a9);
    v20->_instructionsStyle = a10;
    objc_storeStrong((id *)&v20->_options, a11);
  }

  return v20;
}

- (ASTInstructionalPrompt)initWithCoder:(id)a3
{
  id v4;
  ASTInstructionalPrompt *v5;
  uint64_t v6;
  NSNumber *identifier;
  uint64_t v8;
  NSString *iconLocator;
  uint64_t v10;
  NSString *localizedTitle;
  uint64_t v12;
  NSString *localizedSubtitle;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *imageLocators;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSArray *instructions;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSArray *options;

  v4 = a3;
  v5 = -[ASTInstructionalPrompt init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSNumber *)v6;

    v5->_type = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconLocator"));
    v8 = objc_claimAutoreleasedReturnValue();
    iconLocator = v5->_iconLocator;
    v5->_iconLocator = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("imageLocators"));
    v17 = objc_claimAutoreleasedReturnValue();
    imageLocators = v5->_imageLocators;
    v5->_imageLocators = (NSArray *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("instructions"));
    v22 = objc_claimAutoreleasedReturnValue();
    instructions = v5->_instructions;
    v5->_instructions = (NSArray *)v22;

    v5->_instructionsStyle = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("instructionsStyle"));
    v24 = (void *)MEMORY[0x24BDBCF20];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("options"));
    v28 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSArray *)v28;

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
  void *v10;
  id v11;

  v4 = a3;
  -[ASTInstructionalPrompt identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeInt:forKey:", -[ASTInstructionalPrompt type](self, "type"), CFSTR("type"));
  -[ASTInstructionalPrompt iconLocator](self, "iconLocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("iconLocator"));

  -[ASTInstructionalPrompt localizedTitle](self, "localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedTitle"));

  -[ASTInstructionalPrompt localizedSubtitle](self, "localizedSubtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedSubtitle"));

  -[ASTInstructionalPrompt imageLocators](self, "imageLocators");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("imageLocators"));

  -[ASTInstructionalPrompt instructions](self, "instructions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("instructions"));

  objc_msgSend(v4, "encodeInt:forKey:", -[ASTInstructionalPrompt instructionsStyle](self, "instructionsStyle"), CFSTR("instructionsStyle"));
  -[ASTInstructionalPrompt options](self, "options");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("options"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)iconLocator
{
  return self->_iconLocator;
}

- (void)setIconLocator:(id)a3
{
  objc_storeStrong((id *)&self->_iconLocator, a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSubtitle, a3);
}

- (NSArray)imageLocators
{
  return self->_imageLocators;
}

- (void)setImageLocators:(id)a3
{
  objc_storeStrong((id *)&self->_imageLocators, a3);
}

- (NSArray)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_instructions, a3);
}

- (int64_t)instructionsStyle
{
  return self->_instructionsStyle;
}

- (void)setInstructionsStyle:(int64_t)a3
{
  self->_instructionsStyle = a3;
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_imageLocators, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_iconLocator, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
