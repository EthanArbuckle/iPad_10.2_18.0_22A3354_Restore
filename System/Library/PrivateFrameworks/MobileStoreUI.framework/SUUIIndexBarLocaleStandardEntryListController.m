@implementation SUUIIndexBarLocaleStandardEntryListController

- (SUUIIndexBarLocaleStandardEntryListController)initWithSUUIIndexBarEntryListViewElement:(id)a3
{
  id v5;
  SUUIIndexBarLocaleStandardEntryListController *v6;
  SUUIIndexBarLocaleStandardEntryListController *v7;
  uint64_t v8;
  NSSet *requiredVisibilitySet;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIIndexBarLocaleStandardEntryListController;
  v6 = -[SUUIIndexBarLocaleStandardEntryListController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entryListViewElement, a3);
    SUUIRequiredVisibilitySetForLocalizedIndexedCollation();
    v8 = objc_claimAutoreleasedReturnValue();
    requiredVisibilitySet = v7->_requiredVisibilitySet;
    v7->_requiredVisibilitySet = (NSSet *)v8;

  }
  return v7;
}

- (int64_t)numberOfEntryDescriptors
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIndexTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIndexTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v7);
  v9 = objc_msgSend(v8, "length");
  SUUIViewElementFontWithStyle(self->_style);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v10, 0, v9);
  SUUIViewElementPlainColorWithStyle(self->_style, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x24BEBB368], v11, 0, v9);
  +[SUUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:](SUUIIndexBarEntryDescriptor, "entryDescriptorWithAttributedString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](self->_requiredVisibilitySet, "containsObject:", v7))
    objc_msgSend(v12, "setVisibilityPriority:", 1000);

  return v12;
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
    *a4 = 0;
  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionForSectionIndexTitleAtIndex:", a3);

  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("systemBucketID-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)reloadViewElementData
{
  IKViewElementStyle *v3;
  IKViewElementStyle *style;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIIndexBarLocaleStandardEntryListController;
  -[SUUIIndexBarEntryListController reloadViewElementData](&v5, sel_reloadViewElementData);
  -[SUUIIndexBarEntryListViewElement style](self->_entryListViewElement, "style");
  v3 = (IKViewElementStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  if (style != v3 && (-[IKViewElementStyle isEqual:](style, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, v3);
    -[SUUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_requiredVisibilitySet, 0);
  objc_storeStrong((id *)&self->_entryListViewElement, 0);
}

@end
