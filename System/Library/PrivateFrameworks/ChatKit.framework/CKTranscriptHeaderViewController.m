@implementation CKTranscriptHeaderViewController

- (CKTranscriptHeaderViewController)initWithConversation:(id)a3
{
  id v4;
  CKTranscriptHeaderViewController *v5;
  CKTranscriptHeaderViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptHeaderViewController;
  v5 = -[CKTranscriptHeaderViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[CKTranscriptHeaderViewController setConversation:](v5, "setConversation:", v4);

  return v6;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (BOOL)shouldInvalidateOnAddressBookChange
{
  return self->_shouldInvalidateOnAddressBookChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
