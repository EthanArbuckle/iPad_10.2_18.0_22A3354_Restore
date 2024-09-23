@implementation MFOutgoingRichtextMessageContent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFOutgoingRichtextMessageContent;
  -[MFOutgoingMessageContent dealloc](&v3, sel_dealloc);
}

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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSArray)mixedContent
{
  return self->_mixedContent;
}

- (void)setMixedContent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
