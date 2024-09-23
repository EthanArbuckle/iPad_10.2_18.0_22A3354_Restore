@implementation IMDSMSPart

- (void)addTextPart:(id)a3
{
  id v4;
  NSMutableArray *textParts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  textParts = self->_textParts;
  v8 = v4;
  if (!textParts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_textParts;
    self->_textParts = v6;

    v4 = v8;
    textParts = self->_textParts;
  }
  -[NSMutableArray addObject:](textParts, "addObject:", v4);

}

- (void)addAttachmentPart:(id)a3
{
  id v4;
  NSMutableArray *attachmentParts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attachmentParts = self->_attachmentParts;
  v8 = v4;
  if (!attachmentParts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attachmentParts;
    self->_attachmentParts = v6;

    v4 = v8;
    attachmentParts = self->_attachmentParts;
  }
  -[NSMutableArray addObject:](attachmentParts, "addObject:", v4);

}

- (NSArray)textParts
{
  return &self->_textParts->super;
}

- (NSArray)attachmentParts
{
  return &self->_attachmentParts->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentParts, 0);
  objc_storeStrong((id *)&self->_textParts, 0);
}

@end
