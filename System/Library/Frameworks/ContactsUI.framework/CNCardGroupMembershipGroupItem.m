@implementation CNCardGroupMembershipGroupItem

- (CNCardGroupMembershipGroupItem)initWithGroup:(id)a3
{
  id v5;
  CNCardGroupMembershipGroupItem *v6;
  CNCardGroupMembershipGroupItem *v7;
  CNCardGroupMembershipGroupItem *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNCardGroupMembershipGroupItem;
  v6 = -[CNCardGroupMembershipGroupItem init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_group, a3);
    v8 = v7;
  }

  return v7;
}

- (CNGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
