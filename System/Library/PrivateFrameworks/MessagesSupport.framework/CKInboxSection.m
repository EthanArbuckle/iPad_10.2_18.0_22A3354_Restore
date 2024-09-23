@implementation CKInboxSection

- (CKInboxSection)initWithHeader:(id)a3 footer:(id)a4 items:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKInboxSection *v11;
  NSUUID *v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *header;
  uint64_t v16;
  NSString *footer;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKInboxSection;
  v11 = -[CKInboxSection init](&v19, sel_init);
  if (v11)
  {
    v12 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    identifier = v11->_identifier;
    v11->_identifier = v12;

    v14 = objc_msgSend(v8, "copy");
    header = v11->_header;
    v11->_header = (NSString *)v14;

    v16 = objc_msgSend(v9, "copy");
    footer = v11->_footer;
    v11->_footer = (NSString *)v16;

    objc_storeStrong((id *)&v11->_items, a5);
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
