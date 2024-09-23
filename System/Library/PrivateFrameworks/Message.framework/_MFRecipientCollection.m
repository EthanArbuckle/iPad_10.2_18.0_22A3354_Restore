@implementation _MFRecipientCollection

- (_MFRecipientCollection)init
{
  _MFRecipientCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *to;
  NSMutableArray *v5;
  NSMutableArray *cc;
  NSMutableArray *v7;
  NSMutableArray *bcc;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_MFRecipientCollection;
  v2 = -[_MFRecipientCollection init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    to = v2->_to;
    v2->_to = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cc = v2->_cc;
    v2->_cc = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bcc = v2->_bcc;
    v2->_bcc = v7;

  }
  return v2;
}

- (NSArray)toRecipients
{
  return (NSArray *)self->_to;
}

- (NSArray)toRecipientStrings
{
  return (NSArray *)-[NSMutableArray valueForKey:](self->_to, "valueForKey:", CFSTR("fullAddress"));
}

- (void)addToRecipient:(id)a3
{
  -[NSMutableArray addObject:](self->_to, "addObject:", a3);
}

- (void)addToRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v6;
  _MFEmailAddress *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[_MFEmailAddress initWithAddress:displayName:]([_MFEmailAddress alloc], "initWithAddress:displayName:", v8, v6);
  -[_MFRecipientCollection addToRecipient:](self, "addToRecipient:", v7);

}

- (NSArray)ccRecipients
{
  return (NSArray *)self->_cc;
}

- (NSArray)ccRecipientStrings
{
  return (NSArray *)-[NSMutableArray valueForKey:](self->_cc, "valueForKey:", CFSTR("fullAddress"));
}

- (void)addCCRecipient:(id)a3
{
  -[NSMutableArray addObject:](self->_cc, "addObject:", a3);
}

- (void)addCCRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v6;
  _MFEmailAddress *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[_MFEmailAddress initWithAddress:displayName:]([_MFEmailAddress alloc], "initWithAddress:displayName:", v8, v6);
  -[_MFRecipientCollection addCCRecipient:](self, "addCCRecipient:", v7);

}

- (NSArray)bccRecipients
{
  return (NSArray *)self->_bcc;
}

- (NSArray)bccRecipientStrings
{
  return (NSArray *)-[NSMutableArray valueForKey:](self->_bcc, "valueForKey:", CFSTR("fullAddress"));
}

- (void)addBCCRecipient:(id)a3
{
  -[NSMutableArray addObject:](self->_bcc, "addObject:", a3);
}

- (void)addBCCRecipientWithAddress:(id)a3 displayName:(id)a4
{
  id v6;
  _MFEmailAddress *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[_MFEmailAddress initWithAddress:displayName:]([_MFEmailAddress alloc], "initWithAddress:displayName:", v8, v6);
  -[_MFRecipientCollection addBCCRecipient:](self, "addBCCRecipient:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bcc, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
}

@end
