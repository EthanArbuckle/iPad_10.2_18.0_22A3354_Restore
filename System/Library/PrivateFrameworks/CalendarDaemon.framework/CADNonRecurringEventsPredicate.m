@implementation CADNonRecurringEventsPredicate

- (CADNonRecurringEventsPredicate)initWithStartDate:(id)a3 endDate:(id)a4 calendarIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  CADPropertyFilter *v11;
  CADPropertyFilter *v12;
  CADPropertyFilter *v13;
  CADPropertyFilter *v14;
  void *v15;
  CADNonRecurringEventsPredicate *v16;
  objc_super v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CADPropertyFilter initWithProperty:comparison:dateValue:]([CADPropertyFilter alloc], "initWithProperty:comparison:dateValue:", 5, 5, v10);

  v12 = -[CADPropertyFilter initWithProperty:comparison:dateValue:]([CADPropertyFilter alloc], "initWithProperty:comparison:dateValue:", 6, 2, v9);
  v13 = -[CADPropertyFilter initWithProperty:comparison:integerValue:]([CADPropertyFilter alloc], "initWithProperty:comparison:integerValue:", 10, 0, 0);
  v14 = -[CADPropertyFilter initWithProperty:comparison:integerValue:]([CADPropertyFilter alloc], "initWithProperty:comparison:integerValue:", 11, 0, 0);
  v19[0] = v11;
  v19[1] = v12;
  v19[2] = v13;
  v19[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CADNonRecurringEventsPredicate;
  v16 = -[CADPropertySearchPredicate initWithEntityType:filters:calendars:](&v18, sel_initWithEntityType_filters_calendars_, 2, v15, v8);

  return v16;
}

- (id)defaultPropertiesToLoad
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CADNonRecurringEventsPredicate;
  -[CADPropertySearchPredicate defaultPropertiesToLoad](&v7, sel_defaultPropertiesToLoad);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D0B330];
  v8[0] = *MEMORY[0x1E0D0B278];
  v8[1] = v3;
  v8[2] = *MEMORY[0x1E0D0B700];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)relatedObjectPropertiesToLoad
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[10];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v16[0] = &unk_1E6A50600;
  v2 = *MEMORY[0x1E0D0B778];
  v15[0] = *MEMORY[0x1E0D0B770];
  v15[1] = v2;
  v15[2] = *MEMORY[0x1E0D0B790];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = &unk_1E6A50618;
  v4 = *MEMORY[0x1E0D0B850];
  v14[0] = *MEMORY[0x1E0D0B820];
  v14[1] = v4;
  v5 = *MEMORY[0x1E0D0B870];
  v14[2] = *MEMORY[0x1E0D0B248];
  v14[3] = v5;
  v6 = *MEMORY[0x1E0D0B868];
  v14[4] = *MEMORY[0x1E0D0B890];
  v14[5] = v6;
  v7 = *MEMORY[0x1E0D0B888];
  v14[6] = *MEMORY[0x1E0D0B878];
  v14[7] = v7;
  v8 = *MEMORY[0x1E0D0B238];
  v14[8] = *MEMORY[0x1E0D0B220];
  v14[9] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v16[2] = &unk_1E6A50630;
  v13 = *MEMORY[0x1E0D0B840];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
