@implementation CDPUICustodianInstructionsViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  CDPUICustodianInstructionsViewModel *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *subtitle;
  uint64_t v9;
  NSString *instructionHeader;
  uint64_t v11;
  NSString *instructions;
  uint64_t v13;
  NSString *footerText;

  v4 = -[CDPUICustodianInstructionsViewModel init](+[CDPUICustodianInstructionsViewModel allocWithZone:](CDPUICustodianInstructionsViewModel, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v5;

  v7 = -[NSString copy](self->_subtitle, "copy");
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v7;

  v9 = -[NSString copy](self->_instructionHeader, "copy");
  instructionHeader = v4->_instructionHeader;
  v4->_instructionHeader = (NSString *)v9;

  v11 = -[NSString copy](self->_instructions, "copy");
  instructions = v4->_instructions;
  v4->_instructions = (NSString *)v11;

  v13 = -[NSString copy](self->_footerText, "copy");
  footerText = v4->_footerText;
  v4->_footerText = (NSString *)v13;

  objc_storeStrong((id *)&v4->_escapeOffer, self->_escapeOffer);
  objc_storeStrong((id *)&v4->_continueOption, self->_continueOption);
  return v4;
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

- (NSString)instructionHeader
{
  return self->_instructionHeader;
}

- (void)setInstructionHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CDPRemoteValidationEscapeOffer)escapeOffer
{
  return self->_escapeOffer;
}

- (void)setEscapeOffer:(id)a3
{
  objc_storeStrong((id *)&self->_escapeOffer, a3);
}

- (CDPEscapeOption)continueOption
{
  return self->_continueOption;
}

- (void)setContinueOption:(id)a3
{
  objc_storeStrong((id *)&self->_continueOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueOption, 0);
  objc_storeStrong((id *)&self->_escapeOffer, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_instructionHeader, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
