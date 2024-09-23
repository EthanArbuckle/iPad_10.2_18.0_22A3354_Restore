@implementation EKFrozenReminderCalendar

- (id)initNewListInStore:(id)a3
{
  id v4;
  EKChangeSet *v5;
  void *v6;
  void *v7;
  void *v8;
  EKFrozenReminderCalendar *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(EKChangeSet);
  -[EKChangeSet setSkipsPersistentObjectCopy:](v5, "setSkipsPersistentObjectCopy:", 1);
  v6 = (void *)objc_msgSend(getREMListClass(), "newObjectID");
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKChangeSet changeSingleValue:forKey:basedOn:](v5, "changeSingleValue:forKey:basedOn:", v8, CFSTR("UUID"), 0);

  v11.receiver = self;
  v11.super_class = (Class)EKFrozenReminderCalendar;
  v9 = -[EKFrozenReminderObject initWithREMObject:inStore:withChanges:](&v11, sel_initWithREMObject_inStore_withChanges_, 0, v4, v5);

  return v9;
}

- (id)_list
{
  return self->super._remObject;
}

- (id)remObjectID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKFrozenReminderCalendar _list](self, "_list");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKFrozenReminderCalendar _list](self, "_list");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKFrozenReminderCalendar calendarIdentifier](self, "calendarIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    objc_msgSend(getREMListClass(), "objectIDWithUUID:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (Class)meltedClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__EKFrozenReminderCalendar_title__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("unlocalizedTitle"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __33__EKFrozenReminderCalendar_title__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_list");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)colorStringRaw
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__EKFrozenReminderCalendar_colorStringRaw__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("colorStringRaw"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__EKFrozenReminderCalendar_colorStringRaw__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ekColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "hexColorStringFromREMColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)sharingStatus
{
  void *v3;
  uint64_t v4;

  -[EKFrozenReminderCalendar _list](self, "_list");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sharingStatus");

  return -[EKFrozenReminderCalendar ekSharingStatusFromREMSharingStatus:](self, "ekSharingStatusFromREMSharingStatus:", v4);
}

- (unint64_t)ekSharingStatusFromREMSharingStatus:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (BOOL)isPublished
{
  return 0;
}

- (id)publishURLString
{
  return 0;
}

- (id)REMColorFromEKHexColorString:(id)a3
{
  void *v3;
  void *v4;
  id REMColorClass;
  void *v6;

  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getREMColorClass(), "colorWithHexString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")) && objc_msgSend(v3, "length") == 9)
    {
      REMColorClass = getREMColorClass();
      objc_msgSend(v3, "substringToIndex:", 7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(REMColorClass, "colorWithHexString:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)hexColorStringFromREMColor:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "hexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") <= 8)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("FF"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)calendarIdentifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__EKFrozenReminderCalendar_calendarIdentifier__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("UUID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __46__EKFrozenReminderCalendar_calendarIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_list");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)source
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__EKFrozenReminderCalendar_source__block_invoke;
  v3[3] = &unk_1E4784C40;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("source"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__EKFrozenReminderCalendar_source__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(WeakRetained, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventSourceIDForReminderSourceID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_3;
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(v10, "eventStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceWithIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "backingObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_3:
    v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(v14, "frozenObjectForReminderObject:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

- (id)_account
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EKFrozenReminderCalendar frozenReminderSource](self, "frozenReminderSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "remAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKFrozenReminderCalendar _list](self, "_list");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)_applyChanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v6 = a3;
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("unlocalizedTitle")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("unlocalizedTitle"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v7);

  }
  if (-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("colorStringRaw")))
  {
    -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("colorStringRaw"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKFrozenReminderCalendar REMColorFromEKHexColorString:](self, "REMColorFromEKHexColorString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColor:", v9);

  }
  if (!-[EKChangeSet hasUnsavedChangeForKey:](self->super._changeSet, "hasUnsavedChangeForKey:", CFSTR("source")))
    goto LABEL_8;
  -[EKFrozenReminderCalendar frozenReminderSource](self, "frozenReminderSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "REMObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "saveRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateAccount:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addListChangeItem:", v6);
LABEL_8:
    v15 = 1;
    goto LABEL_9;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 24);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_9:

  return v15;
}

- (BOOL)_applyChangesToSaveRequest:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  -[EKFrozenReminderCalendar updateListWithSaveRequest:error:](self, "updateListWithSaveRequest:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[EKFrozenReminderCalendar _applyChanges:error:](self, "_applyChanges:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (id)frozenReminderSource
{
  void *v2;
  id v3;
  void *v4;

  -[EKChangeSet valueForSingleValueKey:basedOn:](self->super._changeSet, "valueForSingleValueKey:basedOn:", CFSTR("source"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "reminderSource");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)updateListWithSaveRequest:(id)a3 error:(id *)a4
{
  id v5;
  REMListChangeItem *listChange;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  REMListChangeItem *v15;
  REMListChangeItem *v16;
  REMListChangeItem *v17;
  void *v18;

  v5 = a3;
  if (-[EKFrozenReminderObject isNew](self, "isNew"))
  {
    listChange = self->_listChange;
    if (!listChange)
    {
      -[EKFrozenReminderCalendar frozenReminderSource](self, "frozenReminderSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "REMObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateAccount:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKFrozenReminderCalendar title](self, "title");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = &stru_1E4789A58;
      if (v10)
        v12 = (__CFString *)v10;
      v13 = v12;

      -[EKFrozenReminderCalendar remObjectID](self, "remObjectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addListWithName:toAccountChangeItem:listObjectID:", v13, v9, v14);
      v15 = (REMListChangeItem *)objc_claimAutoreleasedReturnValue();

      v16 = self->_listChange;
      self->_listChange = v15;

      listChange = self->_listChange;
    }
    v17 = listChange;
  }
  else
  {
    -[EKFrozenReminderCalendar _list](self, "_list");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateList:", v18);
    v17 = (REMListChangeItem *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (int)displayOrder
{
  void *v2;
  int v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__EKFrozenReminderCalendar_displayOrder__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("displayOrder"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

id __40__EKFrozenReminderCalendar_displayOrder__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithInteger:", objc_msgSend(v2, "daDisplayOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)flags
{
  return 0;
}

- (int)allowedEntities
{
  return 8;
}

- (id)allAlarms
{
  return 0;
}

- (id)sharees
{
  return 0;
}

- (id)symbolicColorName
{
  return 0;
}

- (id)externalID
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__EKFrozenReminderCalendar_externalID__block_invoke;
  v3[3] = &unk_1E4784C18;
  v3[4] = self;
  -[EKFrozenReminderObject valueForSingleValueKey:backingValue:](self, "valueForSingleValueKey:backingValue:", CFSTR("UUID"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__EKFrozenReminderCalendar_externalID__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_list");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "externalIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)isColorDisplayOnly
{
  return 0;
}

- (id)sharedOwnerName
{
  void *v2;
  void *v3;

  -[EKFrozenReminderCalendar _list](self, "_list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedOwnerName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)syncError
{
  return 0;
}

- (id)image
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listChange, 0);
}

@end
