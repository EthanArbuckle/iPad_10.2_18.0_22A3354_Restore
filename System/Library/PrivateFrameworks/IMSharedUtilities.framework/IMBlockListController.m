@implementation IMBlockListController

- (IMBlockListController)init
{
  IMBlockListController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)IMBlockListController;
  v2 = -[IMBlockListController init](&v13, sel_init);
  if (v2)
  {
    location = 0;
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D13278];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = sub_19E25CE14;
    v10 = &unk_1E3FB4F58;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBlockListController setCmfBlockListUpdatedObserver:](v2, "setCmfBlockListUpdatedObserver:", v5, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[IMBlockListController cmfBlockListUpdatedObserver](self, "cmfBlockListUpdatedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBlockListController cmfBlockListUpdatedObserver](self, "cmfBlockListUpdatedObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

  }
  -[IMBlockListController removeCNNotifications](self, "removeCNNotifications");
  v6.receiver = self;
  v6.super_class = (Class)IMBlockListController;
  -[IMBlockListController dealloc](&v6, sel_dealloc);
}

+ (id)sharedBlockList
{
  void *v2;
  IMBlockListController *v3;
  void *v4;

  v2 = (void *)qword_1EE503A20;
  if (!qword_1EE503A20)
  {
    v3 = objc_alloc_init(IMBlockListController);
    v4 = (void *)qword_1EE503A20;
    qword_1EE503A20 = (uint64_t)v3;

    v2 = (void *)qword_1EE503A20;
  }
  return v2;
}

- (id)blockListItems
{
  NSOrderedSet *imBlockItemList;

  imBlockItemList = self->_imBlockItemList;
  if (!imBlockItemList)
  {
    -[IMBlockListController _buildBlockList](self, "_buildBlockList");
    imBlockItemList = self->_imBlockItemList;
  }
  return imBlockItemList;
}

- (void)listenToCNNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[IMBlockListController cnDatabaseChangedExternallyObserver](self, "cnDatabaseChangedExternallyObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    location = 0;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C96870];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = sub_19E25D0B0;
    v10 = &unk_1E3FB4F58;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, 0, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBlockListController setCnDatabaseChangedExternallyObserver:](self, "setCnDatabaseChangedExternallyObserver:", v6, v7, v8, v9, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)removeCNNotifications
{
  void *v3;
  void *v4;
  void *v5;

  -[IMBlockListController cnDatabaseChangedExternallyObserver](self, "cnDatabaseChangedExternallyObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMBlockListController cnDatabaseChangedExternallyObserver](self, "cnDatabaseChangedExternallyObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    -[IMBlockListController setCnDatabaseChangedExternallyObserver:](self, "setCnDatabaseChangedExternallyObserver:", 0);
  }
}

- (BOOL)itemIsBlocked:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 0;
  objc_msgSend(0, "cmfItem", v3, v4);
  return CMFBlockListIsItemBlocked() != 0;
}

- (BOOL)addressIsBlocked:(id)a3
{
  id v3;
  void *v4;
  const void *v5;
  BOOL v6;

  v3 = a3;
  if (v3
    && (v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:](IMBlockListController, "_createCMFItemRefWithUnsanitizedAddress:", v3)) != 0)
  {
    v5 = v4;
    v6 = CMFBlockListIsItemBlocked() != 0;
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)blockItem:(id)a3
{
  objc_msgSend(a3, "cmfItem");
  return MEMORY[0x1E0DE7D20](self, sel__blockCMFItemRef_);
}

- (BOOL)blockAddress:(id)a3
{
  void *v4;
  NSOrderedSet *imBlockItemList;
  NSOrderedSet *v6;

  v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:](IMBlockListController, "_createCMFItemRefWithUnsanitizedAddress:", a3);
  if (v4)
  {
    CMFBlockListAddItemForAllServices();
    imBlockItemList = self->_imBlockItemList;
    self->_imBlockItemList = 0;

    CFRelease(v4);
  }
  v6 = self->_imBlockItemList;
  self->_imBlockItemList = 0;

  return v4 != 0;
}

- (void)unblockItem:(id)a3
{
  -[IMBlockListController _unblockCMFItem:](self, "_unblockCMFItem:", objc_msgSend(a3, "cmfItem"));
}

- (void)unblockAddress:(id)a3
{
  void *v4;
  const void *v5;
  NSOrderedSet *imBlockItemList;

  v4 = +[IMBlockListController _createCMFItemRefWithUnsanitizedAddress:](IMBlockListController, "_createCMFItemRefWithUnsanitizedAddress:", a3);
  if (v4)
  {
    v5 = v4;
    if (CMFBlockListIsItemBlocked())
    {
      -[IMBlockListController _unblockCMFItem:](self, "_unblockCMFItem:", v5);
      imBlockItemList = self->_imBlockItemList;
      self->_imBlockItemList = 0;

    }
    CFRelease(v5);
  }
}

+ (void)_createCMFItemRefWithUnsanitizedAddress:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3780];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v7);

  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!MEMORY[0x1A1AE7D10](v8))
  {
    if (IMStringIsEmail())
    {
      v13 = (void *)CMFItemCreateWithEmailAddress();
      goto LABEL_7;
    }
LABEL_6:
    v13 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");

  v11 = CFPhoneNumberCreate();
  if (!v11)
    goto LABEL_6;
  v12 = (const void *)v11;
  v13 = (void *)CMFItemCreateWithPhoneNumber();
  CFRelease(v12);
LABEL_7:

  return v13;
}

- (void)_buildBlockList
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  IMBlockListItem *v11;
  NSOrderedSet *v12;
  NSOrderedSet *imBlockItemList;

  CMFBlockListCopyItemsForAllServicesService();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v3, "objectAtIndex:", v6);
      -[IMBlockListController _addressForCMItemRef:](self, "_addressForCMItemRef:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "associatedPerson");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[IMBlockListItem initWithPerson:address:cmfItemRef:]([IMBlockListItem alloc], "initWithPerson:address:cmfItemRef:", v10, v9, v7);
        objc_msgSend(v4, "addObject:", v9);
        objc_msgSend(v5, "addObject:", v11);

      }
      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
  v12 = (NSOrderedSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v5);
  imBlockItemList = self->_imBlockItemList;
  self->_imBlockItemList = v12;

}

- (id)_addressForCMItemRef:(void *)a3
{
  if (CMFItemGetType())
  {
    CMFItemCopyEmailAddress();
    return 0;
  }
  else
  {
    CMFItemCopyPhoneNumber();
    IMFormattedPhoneNumberForCFPhoneNumberRef();
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_blockCMFItemRef:(void *)a3
{
  NSOrderedSet *imBlockItemList;

  if (!a3)
    return 0;
  if (CMFBlockListIsItemBlocked())
    return 0;
  CMFBlockListAddItemForAllServices();
  imBlockItemList = self->_imBlockItemList;
  self->_imBlockItemList = 0;

  return 1;
}

- (void)_unblockCMFItem:(void *)a3
{
  NSOrderedSet *imBlockItemList;

  if (a3)
  {
    if (CMFBlockListIsItemBlocked())
    {
      CMFBlockListRemoveItemFromAllServices();
      imBlockItemList = self->_imBlockItemList;
      self->_imBlockItemList = 0;

    }
  }
}

- (NSOrderedSet)imBlockItemList
{
  return self->_imBlockItemList;
}

- (void)setImBlockItemList:(id)a3
{
  objc_storeStrong((id *)&self->_imBlockItemList, a3);
}

- (id)cmfBlockListUpdatedObserver
{
  return self->_cmfBlockListUpdatedObserver;
}

- (void)setCmfBlockListUpdatedObserver:(id)a3
{
  objc_storeStrong(&self->_cmfBlockListUpdatedObserver, a3);
}

- (id)cnDatabaseChangedExternallyObserver
{
  return self->_cnDatabaseChangedExternallyObserver;
}

- (void)setCnDatabaseChangedExternallyObserver:(id)a3
{
  objc_storeStrong(&self->_cnDatabaseChangedExternallyObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cnDatabaseChangedExternallyObserver, 0);
  objc_storeStrong(&self->_cmfBlockListUpdatedObserver, 0);
  objc_storeStrong((id *)&self->_imBlockItemList, 0);
}

@end
