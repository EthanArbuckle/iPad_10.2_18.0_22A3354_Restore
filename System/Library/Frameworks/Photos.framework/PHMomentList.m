@implementation PHMomentList

- (Class)changeRequestClass
{
  return 0;
}

- (PHMomentList)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v9;
  PHMomentList *v10;
  uint64_t v11;
  NSDate *startDate;
  uint64_t v13;
  NSDate *endDate;
  void *v15;
  __int16 v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PHMomentList;
  v10 = -[PHCollectionList initWithFetchDictionary:propertyHint:photoLibrary:](&v20, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v9, a4, a5);
  if (v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("startDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    startDate = v10->super._startDate;
    v10->super._startDate = (NSDate *)v11;

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("endDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    endDate = v10->super._endDate;
    v10->super._endDate = (NSDate *)v13;

    v10->super._collectionListType = 1;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kind"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == 2)
    {
      v17 = 2;
    }
    else
    {
      if (v16 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PHMomentList.m"), 94, CFSTR("invalid kind"));

        goto LABEL_8;
      }
      v17 = 1;
    }
    v10->super._collectionListSubtype = v17;
  }
LABEL_8:

  return v10;
}

- (int64_t)collectionListType
{
  return self->super._collectionListType;
}

- (id)localizedTitle
{
  return self->super._localizedTitle;
}

- (id)localizedLocationNames
{
  return self->super._localizedLocationNames;
}

- (BOOL)hasLocalizedTitle
{
  return -[NSString length](self->super._localizedTitle, "length")
      || -[PHMomentList hasLocationInfo](self, "hasLocationInfo");
}

- (BOOL)hasLocationInfo
{
  return 0;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t collectionListSubtype;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHMomentList;
  -[PHCollectionList description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  collectionListSubtype = self->super._collectionListSubtype;
  if (collectionListSubtype == 2)
  {
    -[PHCollectionList startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "year");

    -[PHCollectionList endDate](self, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components:fromDate:", 4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "year");

    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%ld - %ld]"), v11, v14);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (collectionListSubtype == 1)
  {
    -[PHCollectionList startDate](self, "startDate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[PHCollectionList endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@ - %@]"), v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
LABEL_5:

    v3 = (void *)v8;
  }

  return v3;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D719E8], "defaultPropertiesToFetchForMomentList", a3);
}

+ (id)managedEntityName
{
  return CFSTR("PhotosHighlight");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHMomentList");
  return CFSTR("PHMomentList");
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 0;
}

+ (id)identifierCode
{
  return CFSTR("030");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_1883;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PHMomentList_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_1878 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_1878, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_1879, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

void __52__PHMomentList_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("startDate");
  v4[1] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_1879;
  transformValueExpression_forKeyPath___passThroughSet_1879 = v2;

}

void __28__PHMomentList_entityKeyMap__block_invoke()
{
  PHEntityKeyMap *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v0 = [PHEntityKeyMap alloc];
  v11 = CFSTR("uuid");
  v12[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v1;
  v12[1] = CFSTR("startDate");
  v10 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v2;
  v12[2] = CFSTR("endDate");
  v9 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v3;
  v12[3] = CFSTR("title");
  v8 = CFSTR("localizedTitle");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v0, "initWithPropertyKeysByEntityKey:", v5);
  v7 = (void *)entityKeyMap_pl_once_object_15_1883;
  entityKeyMap_pl_once_object_15_1883 = v6;

}

@end
