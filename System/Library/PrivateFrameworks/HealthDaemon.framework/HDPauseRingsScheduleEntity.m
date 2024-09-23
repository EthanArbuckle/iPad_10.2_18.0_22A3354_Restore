@implementation HDPauseRingsScheduleEntity

+ (id)databaseTable
{
  return CFSTR("pause_rings_schedule_samples");
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "ascending");
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5778]))
  {
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("start_date_index");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5770]))
    {
      v13.receiver = a1;
      v13.super_class = (Class)&OBJC_METACLASS___HDPauseRingsScheduleEntity;
      objc_msgSendSuper2(&v13, sel_orderingTermForSortDescriptor_, v4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v7 = (void *)MEMORY[0x1E0D29888];
    v8 = objc_opt_class();
    v9 = CFSTR("end_date_index");
  }
  objc_msgSend(v7, "orderingTermWithProperty:entityClass:ascending:", v9, v8, v6);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;

  return v11;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_11;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDPauseRingsScheduleEntity.m"), 62, CFSTR("Subclasses must override %s"), "+[HDPauseRingsScheduleEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("start_date_index");
  v27[2] = CFSTR("end_date_index");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__HDPauseRingsScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E6CE89A8;
  v25 = v13;
  v26 = v12;
  v17 = v12;
  v18 = v13;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v14, v16, a7, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

void __92__HDPauseRingsScheduleEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  MEMORY[0x1BCCAB114](a2, CFSTR("start_date_index"), objc_msgSend(*(id *)(a1 + 40), "startDateIndex"));
  objc_msgSend(*(id *)(a1 + 40), "endDateIndex");
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)objc_msgSend(a3, "pauseRingsSchedules");
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addPauseRingsSchedules:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDPauseRingsScheduleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDPauseRingsScheduleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
