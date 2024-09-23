@implementation MFOutgoingRichtextMessageContent

- (id)copy
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFOutgoingRichtextMessageContent;
  v3 = -[MFOutgoingMessageContent copy](&v5, sel_copy);
  objc_msgSend(v3, "setPlaintextAlternative:", self->_plaintextAlternative);
  objc_msgSend(v3, "setMixedContent:", self->_mixedContent);
  return v3;
}

- (BOOL)textPartsAreHTML
{
  return self->_textPartsAreHTML;
}

- (void)setTextPartsAreHTML:(BOOL)a3
{
  self->_textPartsAreHTML = a3;
}

- (MFPlainTextDocument)plaintextAlternative
{
  return self->_plaintextAlternative;
}

- (void)setPlaintextAlternative:(id)a3
{
  objc_storeStrong((id *)&self->_plaintextAlternative, a3);
}

- (NSArray)mixedContent
{
  return self->_mixedContent;
}

- (void)setMixedContent:(id)a3
{
  objc_storeStrong((id *)&self->_mixedContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedContent, 0);
  objc_storeStrong((id *)&self->_plaintextAlternative, 0);
}

@end
