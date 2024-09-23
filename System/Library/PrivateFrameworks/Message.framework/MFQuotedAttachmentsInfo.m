@implementation MFQuotedAttachmentsInfo

- (MFQuotedAttachmentsInfo)initWithContentIDs:(id)a3
{
  id v5;
  MFQuotedAttachmentsInfo *v6;
  MFQuotedAttachmentsInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFQuotedAttachmentsInfo;
  v6 = -[MFQuotedAttachmentsInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentIDs, a3);

  return v7;
}

- (NSArray)contentIDs
{
  return self->_contentIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIDs, 0);
}

@end
