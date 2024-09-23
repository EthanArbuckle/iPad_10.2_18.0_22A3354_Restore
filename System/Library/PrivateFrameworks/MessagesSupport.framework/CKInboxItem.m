@implementation CKInboxItem

- (CKInboxItem)initWithTitle:(id)a3 subtitle:(id)a4 systemImage:(id)a5 accessoryText:(id)a6 filterMode:(id)a7 action:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CKInboxItem *v20;
  NSUUID *v21;
  NSUUID *identifier;
  uint64_t v23;
  id action;
  uint64_t v25;
  NSNumber *filterMode;
  CKInboxItemSwift *v27;
  CKInboxItemSwift *inboxItemSwift;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)CKInboxItem;
  v20 = -[CKInboxItem init](&v30, sel_init);
  if (v20)
  {
    v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v20->_identifier;
    v20->_identifier = v21;

    v23 = objc_msgSend(v19, "copy");
    action = v20->_action;
    v20->_action = (id)v23;

    v25 = objc_msgSend(v18, "copy");
    filterMode = v20->_filterMode;
    v20->_filterMode = (NSNumber *)v25;

    v27 = -[CKInboxItemSwift initWithIdentifier:title:subtitle:systemImage:accessoryText:]([CKInboxItemSwift alloc], "initWithIdentifier:title:subtitle:systemImage:accessoryText:", v20->_identifier, v14, v15, v16, v17);
    inboxItemSwift = v20->_inboxItemSwift;
    v20->_inboxItemSwift = v27;

  }
  return v20;
}

- (void)updateAccessory:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKInboxItem inboxItemSwift](self, "inboxItemSwift");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithAccessoryText:", v4);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CKInboxItem i:%@, swift:%@>"), self->_identifier, self->_inboxItemSwift);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)filterMode
{
  return self->_filterMode;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKInboxItemSwift)inboxItemSwift
{
  return self->_inboxItemSwift;
}

- (void)setInboxItemSwift:(id)a3
{
  objc_storeStrong((id *)&self->_inboxItemSwift, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inboxItemSwift, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_filterMode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
