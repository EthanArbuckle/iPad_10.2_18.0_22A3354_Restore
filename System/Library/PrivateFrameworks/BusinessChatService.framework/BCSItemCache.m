@implementation BCSItemCache

- (BCSItemCache)init
{
  BCSItemCache *v2;
  BCSLinkItemPersistentStore *v3;
  BCSLinkItemPersistentStore *linkItemStore;
  uint64_t v5;
  BCSBusinessItemMemoryCache *chatSuggestItemStore;
  BCSBusinessCallerPersistentStore *v7;
  BCSBusinessCallerPersistentStore *businessCallerStore;
  BCSBusinessEmailPersistentStore *v9;
  BCSBusinessEmailPersistentStore *businessEmailStore;
  uint64_t v11;
  BCSUserDefaultsProviding *userDefaults;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BCSItemCache;
  v2 = -[BCSItemCache init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(BCSLinkItemPersistentStore);
    linkItemStore = v2->_linkItemStore;
    v2->_linkItemStore = v3;

    +[BCSBusinessItemMemoryCache sharedCache]();
    v5 = objc_claimAutoreleasedReturnValue();
    chatSuggestItemStore = v2->_chatSuggestItemStore;
    v2->_chatSuggestItemStore = (BCSBusinessItemMemoryCache *)v5;

    v7 = objc_alloc_init(BCSBusinessCallerPersistentStore);
    businessCallerStore = v2->_businessCallerStore;
    v2->_businessCallerStore = v7;

    v9 = objc_alloc_init(BCSBusinessEmailPersistentStore);
    businessEmailStore = v2->_businessEmailStore;
    v2->_businessEmailStore = v9;

    +[BCSUserDefaults sharedDefaults](BCSUserDefaults, "sharedDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (BCSUserDefaultsProviding *)v11;

  }
  return v2;
}

- (id)itemMatching:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      if (!self)
        goto LABEL_14;
      v5 = 8;
      goto LABEL_11;
    case 2:
      if (!self)
        goto LABEL_14;
      v5 = 16;
      goto LABEL_11;
    case 3:
      if (!self)
        goto LABEL_14;
      v5 = 24;
      goto LABEL_11;
    case 4:
      if (self)
      {
        v5 = 32;
LABEL_11:
        v7 = *(Class *)((char *)&self->super.isa + v5);
      }
      else
      {
LABEL_14:
        v7 = 0;
      }
      objc_msgSend(v7, "itemMatching:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      return v6;
    default:
      v6 = 0;
      goto LABEL_13;
  }
}

- (void)updateItem:(id)a3 withItemIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      if (!self)
        goto LABEL_13;
      v7 = 8;
      goto LABEL_10;
    case 2:
      if (!self)
        goto LABEL_13;
      v7 = 16;
      goto LABEL_10;
    case 3:
      if (!self)
        goto LABEL_13;
      v7 = 24;
      goto LABEL_10;
    case 4:
      if (self)
      {
        v7 = 32;
LABEL_10:
        v8 = *(Class *)((char *)&self->super.isa + v7);
      }
      else
      {
LABEL_13:
        v8 = 0;
      }
      objc_msgSend(v8, "updateItem:withItemIdentifier:", v9, v6);
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)deleteItemMatching:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  switch(objc_msgSend(v6, "type"))
  {
    case 1:
      if (!self)
        goto LABEL_13;
      v4 = 8;
      goto LABEL_10;
    case 2:
      if (!self)
        goto LABEL_13;
      v4 = 16;
      goto LABEL_10;
    case 3:
      if (!self)
        goto LABEL_13;
      v4 = 24;
      goto LABEL_10;
    case 4:
      if (self)
      {
        v4 = 32;
LABEL_10:
        v5 = *(Class *)((char *)&self->super.isa + v4);
      }
      else
      {
LABEL_13:
        v5 = 0;
      }
      objc_msgSend(v5, "deleteItemMatching:", v6);
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)deleteItemsOfType:(int64_t)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
      if (self)
        self = (BCSItemCache *)self->_chatSuggestItemStore;
      v3 = 1;
      goto LABEL_5;
    case 2:
      if (self)
        self = (BCSItemCache *)self->_linkItemStore;
      v3 = 2;
      goto LABEL_5;
    case 3:
      if (self)
        self = (BCSItemCache *)self->_businessCallerStore;
      v3 = 3;
      goto LABEL_5;
    case 4:
      if (self)
        self = (BCSItemCache *)self->_businessEmailStore;
      v3 = 4;
LABEL_5:
      -[BCSItemCache deleteItemsOfType:](self, "deleteItemsOfType:", v3);
      break;
    default:
      return;
  }
}

- (void)deleteExpiredItemsOfType:(int64_t)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
      if (self)
        self = (BCSItemCache *)self->_chatSuggestItemStore;
      v3 = 1;
      goto LABEL_5;
    case 2:
      if (self)
        self = (BCSItemCache *)self->_linkItemStore;
      v3 = 2;
      goto LABEL_5;
    case 3:
      if (self)
        self = (BCSItemCache *)self->_businessCallerStore;
      v3 = 3;
      goto LABEL_5;
    case 4:
      if (self)
        self = (BCSItemCache *)self->_businessEmailStore;
      v3 = 4;
LABEL_5:
      -[BCSItemCache deleteExpiredItemsOfType:](self, "deleteExpiredItemsOfType:", v3);
      break;
    default:
      return;
  }
}

- (void)deleteLinkItemsWithBundleID:(id)a3
{
  if (self)
    self = (BCSItemCache *)self->_linkItemStore;
  -[BCSItemCache deleteLinkItemsWithBundleID:](self, "deleteLinkItemsWithBundleID:", a3);
}

- (void)beginBatch
{
  if (self)
    self = (BCSItemCache *)self->_linkItemStore;
  -[BCSItemCache beginBatch](self, "beginBatch");
}

- (void)endBatch
{
  if (self)
    self = (BCSItemCache *)self->_linkItemStore;
  -[BCSItemCache endBatch](self, "endBatch");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_businessEmailStore, 0);
  objc_storeStrong((id *)&self->_businessCallerStore, 0);
  objc_storeStrong((id *)&self->_linkItemStore, 0);
  objc_storeStrong((id *)&self->_chatSuggestItemStore, 0);
}

@end
