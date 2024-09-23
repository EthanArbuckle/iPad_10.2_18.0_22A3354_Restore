@implementation CNPropertyGroupNoteItem

- (id)displayLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  CNContactsUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97200];
  -[CNPropertyGroupItem property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("NOTES_LABEL"), v6, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "labeledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") && objc_msgSend(v9, "length"))
    v10 = objc_msgSend(v7, "isEqualToString:", v9);
  else
    v10 = 1;

  return v10;
}

- (BOOL)canRemove
{
  return 0;
}

@end
