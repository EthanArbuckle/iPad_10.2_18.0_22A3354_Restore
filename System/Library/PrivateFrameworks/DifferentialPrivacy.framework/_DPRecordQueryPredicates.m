@implementation _DPRecordQueryPredicates

+ (void)initialize
{
  kDPCurrentReportVersion = +[_DPJSONOutputHelper currentVersion](_DPJSONOutputHelper, "currentVersion");
}

+ (id)predicateForRecordsInDateRangeStart:(id)a3 end:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((creationDate >= %@) AND (creationDate <= %@))"), a3, a4);
}

+ (id)predicateForRecordsOlderThan:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@"), a3);
}

+ (id)predicateForRecordsWithVersionMismatch
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("reportVersion != %ld"), kDPCurrentReportVersion);
}

+ (id)predicateForAllRecords
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

+ (id)predicateForRecordsNotSubmitted
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(submitted == NO)"));
}

+ (id)predicateForRecordsNotSubmittedForKey:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForKey:beginsWith:submitted:matchReportVersion:", a3, 0, 0, 1);
}

+ (id)predicateForRecordsNotSubmittedForKeyBeginsWith:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForKey:beginsWith:submitted:matchReportVersion:", a3, 1, 0, 1);
}

+ (id)predicateForRecordsSubmitted
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(submitted == YES)"));
}

+ (id)predicateForRecordsSubmittedForKey:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForKey:beginsWith:submitted:matchReportVersion:", a3, 0, 1, 0);
}

+ (id)predicateForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(key == %@)"), a3);
}

+ (id)predicateForRecordsMatchingKey:(id)a3
{
  return (id)objc_msgSend(a1, "predicateForKey:beginsWith:matchReportVersion:", a3, 1, 1);
}

+ (id)predicateForKeyBeginsWith:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(key BEGINSWITH %@)"), a3);
}

+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 submitted:(BOOL)a5 matchReportVersion:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v17[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (v7)
    objc_msgSend(a1, "predicateForRecordsSubmitted");
  else
    objc_msgSend(a1, "predicateForRecordsNotSubmitted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3528];
  v17[0] = v11;
  objc_msgSend((id)objc_opt_class(), "predicateForKey:beginsWith:matchReportVersion:", v10, v8, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)predicateForKey:(id)a3 beginsWith:(BOOL)a4 matchReportVersion:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[3];

  v5 = a5;
  v6 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v6)
    objc_msgSend(a1, "predicateForKeyBeginsWith:", v8);
  else
    objc_msgSend(a1, "predicateForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("reportVersion == %ld"), kDPCurrentReportVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v10;
    v16[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "andPredicateWithSubpredicates:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v9;
  }

  return v14;
}

+ (id)entityForKey:(id)a3
{
  void *v3;
  void *v4;
  __objc2_class **v5;
  unint64_t v6;
  __objc2_class ***v7;
  uint64_t v8;
  void *v9;

  +[_DPKeyNames keyPropertiesForKey:](_DPKeyNames, "keyPropertiesForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    switch(objc_msgSend(v3, "dataAlgorithm"))
    {
      case 1:
        if (objc_msgSend(v4, "privatizationAlgorithm") != 3)
          goto LABEL_13;
        v5 = off_1E95D8370;
        goto LABEL_17;
      case 2:
        v6 = objc_msgSend(v4, "privatizationAlgorithm") - 1;
        if (v6 >= 0xA || ((0x28Bu >> v6) & 1) == 0)
          goto LABEL_13;
        v7 = off_1E95D9D10;
        goto LABEL_16;
      case 3:
        v8 = objc_msgSend(v4, "privatizationAlgorithm");
        if (v8 == 2)
        {
          v5 = off_1E95D8238;
        }
        else
        {
          if (v8 != 4)
            goto LABEL_13;
          v5 = off_1E95D82D8;
        }
LABEL_17:
        -[__objc2_class entityName](*v5, "entityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        v6 = objc_msgSend(v4, "privatizationAlgorithm") - 5;
        if (v6 >= 0xD || ((0x1FD3u >> v6) & 1) == 0)
          goto LABEL_13;
        v7 = off_1E95D9D60;
LABEL_16:
        v5 = v7[v6];
        goto LABEL_17;
      default:
        goto LABEL_13;
    }
  }
  else
  {
LABEL_13:
    v9 = 0;
  }

  return v9;
}

@end
