@implementation _PFPersistentHistoryFetchModel

+ (id)ancillaryModelNamespace
{
  return CFSTR("PersistentFetchHistory");
}

+ (id)newFetchHistoryModelForCoordinator:andOptions:
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSAttributeDescription *v14;
  NSManagedObjectModel *v15;
  id v16;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_self();
  if (!historyFetchModel)
  {
    v1 = (void *)MEMORY[0x18D76B4E4](v0);
    v2 = -[NSEntityDescription _initWithName:]([NSEntityDescription alloc], "_initWithName:", CFSTR("Transaction"));
    v3 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("author"), 700);
    objc_msgSend(v2, "_addProperty:", v3);

    v4 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("contextName"), 700);
    objc_msgSend(v2, "_addProperty:", v4);

    v5 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("bundleID"), 700);
    objc_msgSend(v2, "_addProperty:", v5);

    v6 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("processID"), 700);
    objc_msgSend(v2, "_addProperty:", v6);

    v7 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("timestamp"), 900);
    objc_msgSend(v2, "_addProperty:", v7);

    v8 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("transactionNumber"), 300);
    objc_msgSend(v2, "_addProperty:", v8);

    v9 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("token"), 300);
    objc_msgSend(v2, "_addProperty:", v9);

    v10 = -[NSEntityDescription _initWithName:]([NSEntityDescription alloc], "_initWithName:", CFSTR("Change"));
    v11 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("changeID"), 300);
    objc_msgSend(v10, "_addProperty:", v11);

    v12 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("changeType"), 300);
    objc_msgSend(v10, "_addProperty:", v12);

    v13 = -[NSAttributeDescription _initWithName:type:]([NSAttributeDescription alloc], "_initWithName:type:", CFSTR("changedEntity"), 300);
    objc_msgSend(v10, "_addProperty:", v13);

    v14 = objc_alloc_init(NSAttributeDescription);
    -[NSPropertyDescription setName:](v14, "setName:", CFSTR("changedObjectID"));
    if (v14)
    {
      -[NSPropertyDescription _throwIfNotEditable](v14, "_throwIfNotEditable");
      v14->_type = 2000;
    }
    objc_msgSend(v10, "_addProperty:", v14);

    objc_msgSend(v2, "_flattenProperties");
    objc_msgSend(v10, "_flattenProperties");
    v15 = [NSManagedObjectModel alloc];
    v19[0] = v2;
    v19[1] = v10;
    v16 = -[NSManagedObjectModel _initWithEntities:](v15, "_initWithEntities:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2));
    objc_msgSend(v16, "_setModelsReferenceIDOffset:", +[_PFPersistentHistoryFetchModel ancillaryEntityOffset](_PFPersistentHistoryFetchModel, "ancillaryEntityOffset"));
    objc_msgSend(v16, "_setIsEditable:", 0);

    objc_autoreleasePoolPop(v1);
    while (!__ldaxr((unint64_t *)&historyFetchModel))
    {
      if (!__stlxr((unint64_t)v16, (unint64_t *)&historyFetchModel))
        return (id)historyFetchModel;
    }
    __clrex();

  }
  return (id)historyFetchModel;
}

+ (unint64_t)ancillaryEntityOffset
{
  return 16050;
}

+ (unint64_t)ancillaryEntityCount
{
  return 2;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    objc_opt_self();
}

+ (void)_invalidateStaticCaches
{
  void *v2;
  unint64_t v3;

  v2 = (void *)historyFetchModel;
  if (historyFetchModel)
  {
    while (1)
    {
      v3 = __ldaxr((unint64_t *)&historyFetchModel);
      if ((void *)v3 != v2)
        break;
      if (!__stlxr(0, (unint64_t *)&historyFetchModel))
      {

        return;
      }
    }
    __clrex();
  }
}

@end
