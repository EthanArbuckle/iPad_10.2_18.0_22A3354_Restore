@implementation CNSafeChangeHistoryEventVisitorWrapper

- (CNSafeChangeHistoryEventVisitorWrapper)initWithChangeHistoryEventVisitor:(id)a3
{
  id v5;
  CNSafeChangeHistoryEventVisitorWrapper *v6;
  CNSafeChangeHistoryEventVisitorWrapper *v7;
  CNSafeChangeHistoryEventVisitorWrapper *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNSafeChangeHistoryEventVisitorWrapper;
  v6 = -[CNSafeChangeHistoryEventVisitorWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visitor, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNSafeChangeHistoryEventVisitorWrapper visitor](self, "visitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("visitor"), v4);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)visitDropEverythingEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitDropEverythingEvent:](self->_visitor, "visitDropEverythingEvent:", v4);

}

- (void)visitAddContactEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitAddContactEvent:](self->_visitor, "visitAddContactEvent:", v4);

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitUpdateContactEvent:](self->_visitor, "visitUpdateContactEvent:", v4);

}

- (void)visitDeleteContactEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitDeleteContactEvent:](self->_visitor, "visitDeleteContactEvent:", v4);

}

- (void)visitAddGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitAddGroupEvent:](self->_visitor, "visitAddGroupEvent:", v4);

}

- (void)visitUpdateGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitUpdateGroupEvent:](self->_visitor, "visitUpdateGroupEvent:", v4);

}

- (void)visitDeleteGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitDeleteGroupEvent:](self->_visitor, "visitDeleteGroupEvent:", v4);

}

- (void)visitAddMemberToGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitAddMemberToGroupEvent:](self->_visitor, "visitAddMemberToGroupEvent:", v4);

}

- (void)visitRemoveMemberFromGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitRemoveMemberFromGroupEvent:](self->_visitor, "visitRemoveMemberFromGroupEvent:", v4);

}

- (void)visitAddSubgroupToGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitAddSubgroupToGroupEvent:](self->_visitor, "visitAddSubgroupToGroupEvent:", v4);

}

- (void)visitRemoveSubgroupFromGroupEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitRemoveSubgroupFromGroupEvent:](self->_visitor, "visitRemoveSubgroupFromGroupEvent:", v4);

}

- (void)visitDifferentMeCardEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitDifferentMeCardEvent:](self->_visitor, "visitDifferentMeCardEvent:", v4);

}

- (void)visitLinkContactsEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitLinkContactsEvent:](self->_visitor, "visitLinkContactsEvent:", v4);

}

- (void)visitUnlinkContactEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitUnlinkContactEvent:](self->_visitor, "visitUnlinkContactEvent:", v4);

}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitPreferredContactForNameEvent:](self->_visitor, "visitPreferredContactForNameEvent:", v4);

}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CNChangeHistoryEventVisitor visitPreferredContactForImageEvent:](self->_visitor, "visitPreferredContactForImageEvent:", v4);

}

- (CNChangeHistoryEventVisitor)visitor
{
  return self->_visitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitor, 0);
}

@end
