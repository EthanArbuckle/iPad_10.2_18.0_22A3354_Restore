@implementation CNCardLinkedCardsGroupItem

- (CNCardLinkedCardsGroupItem)initWithContact:(id)a3
{
  id v5;
  CNCardLinkedCardsGroupItem *v6;
  CNCardLinkedCardsGroupItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNCardLinkedCardsGroupItem;
  v6 = -[CNCardLinkedCardsGroupItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contact, a3);

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
