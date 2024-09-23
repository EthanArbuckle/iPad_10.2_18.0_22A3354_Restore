@implementation CNUIFamilyMemberContactItem

- (CNUIFamilyMemberContactItem)init
{
  CNUIFamilyMemberContactItem *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3
{
  return -[CNUIFamilyMemberContactItem initWithLabel:detailLabel:unreachable:](self, "initWithLabel:detailLabel:unreachable:", a3, 0, 0);
}

- (CNUIFamilyMemberContactItem)initWithLabel:(id)a3 detailLabel:(id)a4 unreachable:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  CNUIFamilyMemberContactItem *v13;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNUIFamilyMemberContactItem initWithContactIdentifier:label:detailLabel:unreachable:](self, "initWithContactIdentifier:label:detailLabel:unreachable:", v12, v10, v9, v5);

  return v13;
}

- (CNUIFamilyMemberContactItem)initWithContactIdentifier:(id)a3 label:(id)a4 detailLabel:(id)a5 unreachable:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  CNUIFamilyMemberContactItem *v14;
  CNUIFamilyMemberContactItem *v15;
  CNUIFamilyMemberContactItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNUIFamilyMemberContactItem;
  v14 = -[CNUIFamilyMemberContactItem init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactIdentifier, a3);
    objc_storeStrong((id *)&v15->_label, a4);
    objc_storeStrong((id *)&v15->_detailLabel, a5);
    v15->_unreachable = a6;
    v16 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  CNUIFamilyMemberContactItem *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v4 = (CNUIFamilyMemberContactItem *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((v5 = (unint64_t)-[CNUIFamilyMemberContactItem contactIdentifier](self, "contactIdentifier"),
           v6 = (unint64_t)-[CNUIFamilyMemberContactItem contactIdentifier](v4, "contactIdentifier"),
           !(v5 | v6))
       || objc_msgSend((id)v5, "isEqual:", v6))
      && ((v7 = (unint64_t)-[CNUIFamilyMemberContactItem label](self, "label"),
           v8 = (unint64_t)-[CNUIFamilyMemberContactItem label](v4, "label"),
           !(v7 | v8))
       || objc_msgSend((id)v7, "isEqual:", v8))
      && ((v9 = (unint64_t)-[CNUIFamilyMemberContactItem detailLabel](self, "detailLabel"),
           v10 = (unint64_t)-[CNUIFamilyMemberContactItem detailLabel](v4, "detailLabel"),
           !(v9 | v10))
       || objc_msgSend((id)v9, "isEqual:", v10)))
    {
      v11 = -[CNUIFamilyMemberContactItem isUnreachable](self, "isUnreachable");
      v12 = v11 ^ -[CNUIFamilyMemberContactItem isUnreachable](v4, "isUnreachable") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0D13A78];
  -[CNUIFamilyMemberContactItem contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "objectHash:", v4);

  v6 = (void *)MEMORY[0x1E0D13A78];
  -[CNUIFamilyMemberContactItem label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "objectHash:", v7) - v5 + 32 * v5;

  v9 = (void *)MEMORY[0x1E0D13A78];
  -[CNUIFamilyMemberContactItem detailLabel](self, "detailLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 31 * (objc_msgSend(v9, "objectHash:", v10) - v8 + 32 * v8);

  return v11 + -[CNUIFamilyMemberContactItem isUnreachable](self, "isUnreachable") + 15699857;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (BOOL)isUnreachable
{
  return self->_unreachable;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)familyMemberContactItemFromCoreFamilyMemberContactItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "typeLabelStringFromContactType:", objc_msgSend(v4, "contactType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)a1);
  objc_msgSend(v4, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formattedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isUnreachable");

  v10 = (void *)objc_msgSend(v6, "initWithContactIdentifier:label:detailLabel:unreachable:", v7, v8, v5, v9);
  return v10;
}

+ (id)typeLabelStringFromContactType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 2)
  {
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ME");
  }
  else
  {
    if (a3 != 1)
    {
      v6 = 0;
      return v6;
    }
    CNContactsUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("PARENT_OR_GUARDIAN");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
