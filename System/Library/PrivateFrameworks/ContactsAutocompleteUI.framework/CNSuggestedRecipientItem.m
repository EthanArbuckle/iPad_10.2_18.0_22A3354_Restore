@implementation CNSuggestedRecipientItem

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global);
  return (id)os_log_cn_once_object_1;
}

void __34__CNSuggestedRecipientItem_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.autocomplete.ui", "suggestions");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

- (CNSuggestedRecipientItem)initWithRecipient:(id)a3
{
  id v5;
  CNSuggestedRecipientItem *v6;
  CNSuggestedRecipientItem *v7;
  uint64_t v8;
  NSString *title;
  NSMutableSet *v10;
  NSMutableSet *handles;
  CNSuggestedRecipientItem *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNSuggestedRecipientItem;
  v6 = -[CNSuggestedRecipientItem init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recipient, a3);
    objc_msgSend(v5, "compositeName");
    v8 = objc_claimAutoreleasedReturnValue();
    title = v7->_title;
    v7->_title = (NSString *)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    handles = v7->_handles;
    v7->_handles = v10;

    -[CNSuggestedRecipientItem loadHandles](v7, "loadHandles");
    v12 = v7;
  }

  return v7;
}

- (void)loadHandles
{
  CNComposeRecipient *recipient;
  _BOOL4 v4;
  NSMutableSet *handles;
  CNComposeRecipient *v6;
  void *v7;
  id v8;

  recipient = self->_recipient;
  if (recipient)
  {
    v4 = -[CNComposeRecipient isGroup](recipient, "isGroup");
    handles = self->_handles;
    v6 = self->_recipient;
    if (v4)
    {
      -[CNComposeRecipient children](v6, "children");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_cn_map:", &__block_literal_global_4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObjectsFromArray:](handles, "addObjectsFromArray:", v7);

    }
    else
    {
      -[CNComposeRecipient normalizedAddress](v6, "normalizedAddress");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](handles, "addObject:");
    }

  }
}

- (BOOL)isSelectedForHandles:(id)a3
{
  id v4;
  char v5;
  void *v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if ((-[NSMutableSet isSubsetOfSet:](self->_handles, "isSubsetOfSet:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else if (-[CNComposeRecipient isGroup](self->_recipient, "isGroup"))
  {
    -[CNComposeRecipient children](self->_recipient, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__CNSuggestedRecipientItem_isSelectedForHandles___block_invoke;
    v9[3] = &unk_1E62BEE78;
    v10 = v4;
    v7 = objc_msgSend(v6, "_cn_any:", v9);

    v5 = v7 ^ 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __49__CNSuggestedRecipientItem_isSelectedForHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "normalizedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "unifiedHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "intersectsSet:", v8) ^ 1;

  }
  return v6;
}

- (BOOL)shouldDeselectForHandles:(id)a3
{
  id v4;
  char v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if ((-[NSMutableSet intersectsSet:](self->_handles, "intersectsSet:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else if (-[CNComposeRecipient isGroup](self->_recipient, "isGroup"))
  {
    -[CNComposeRecipient children](self->_recipient, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__CNSuggestedRecipientItem_shouldDeselectForHandles___block_invoke;
    v8[3] = &unk_1E62BEE78;
    v9 = v4;
    v5 = objc_msgSend(v6, "_cn_any:", v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __53__CNSuggestedRecipientItem_shouldDeselectForHandles___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "normalizedAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "unifiedHandles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "intersectsSet:", v8);

  }
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CNSuggestedRecipientItem recipient](self, "recipient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocompleteResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = -[CNSuggestedRecipientItem hash](self, "hash");
    v9 = v8 == objc_msgSend(v7, "hash");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("title"), self->_title);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("handles"), self->_handles);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("recipient"), self->_recipient);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
  objc_storeStrong((id *)&self->_handles, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
}

@end
