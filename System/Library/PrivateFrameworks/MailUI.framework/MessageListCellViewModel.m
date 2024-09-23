@implementation MessageListCellViewModel

- (NSDictionary)hintsBySnippetZone
{
  return self->_hintsBySnippetZone;
}

- (BOOL)subjectIsPresent
{
  return self->_subjectIsPresent;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void)setRecipientType:(int64_t)a3
{
  self->_recipientType = a3;
}

- (void)setHintsBySnippetZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setEmailAddresses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setAttributedAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setAddressList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (MessageListCellViewModel)initWithBuilder:(id)a3
{
  void (**v5)(id, MessageListCellViewModel *);
  MessageListCellViewModel *v6;
  MessageListCellViewModel *v7;
  void *v9;
  objc_super v10;

  v5 = (void (**)(id, MessageListCellViewModel *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageListCellViewModel.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v10.receiver = self;
  v10.super_class = (Class)MessageListCellViewModel;
  v6 = -[MessageListCellViewModel init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[MessageListCellViewModel setSubjectIsPresent:](v6, "setSubjectIsPresent:", 1);
    -[MessageListCellViewModel setAddressIsPresent:](v7, "setAddressIsPresent:", 1);
    v5[2](v5, v7);
  }

  return v7;
}

- (void)setSubjectIsPresent:(BOOL)a3
{
  self->_subjectIsPresent = a3;
}

- (void)setAddressIsPresent:(BOOL)a3
{
  self->_addressIsPresent = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)subject
{
  return self->_subject;
}

- (int64_t)recipientType
{
  return self->_recipientType;
}

- (NSAttributedString)attributedAddress
{
  return self->_attributedAddress;
}

- (NSString)address
{
  return self->_address;
}

- (BOOL)addressIsPresent
{
  return self->_addressIsPresent;
}

- (MessageListCellViewModel)initWithItemBuilder:(id)a3
{
  id v5;

  v5 = a3;
  -[MessageListCellViewModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MessageListCellViewModel initWithItemBuilder:]", "MessageListCellViewModel.m", 41, "0");
}

- (NSArray)addressList
{
  return self->_addressList;
}

- (BOOL)hideFollowUp
{
  return self->_hideFollowUp;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_addressList, 0);
  objc_storeStrong((id *)&self->_attributedAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_hintsBySnippetZone, 0);
}

@end
