@implementation GEOBusinessHours

+ (id)prioritizeBusinessHours:(id)a3 compareDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__65;
  v29 = __Block_byref_object_dispose__65;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__65;
  v23 = __Block_byref_object_dispose__65;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__GEOBusinessHours_prioritizeBusinessHours_compareDate___block_invoke;
  v18[3] = &unk_1E1C10840;
  v18[4] = &v25;
  v18[5] = &v19;
  v8 = (void *)MEMORY[0x18D765024](v18);
  +[GEOBusinessHours divideBusinessHoursBasedOnTodaysDate:compareDate:completion:](GEOBusinessHours, "divideBusinessHoursBasedOnTodaysDate:compareDate:completion:", v5, v6, v8);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("hoursType"), 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("startDate"), 1);
  v31[0] = v9;
  v31[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26[5], "sortedArrayUsingDescriptors:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v26[5];
  v26[5] = v12;

  objc_msgSend((id)v20[5], "sortedArrayUsingDescriptors:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v20[5];
  v20[5] = v14;

  objc_msgSend(v7, "addObjectsFromArray:", v26[5]);
  objc_msgSend(v7, "addObjectsFromArray:", v20[5]);
  v16 = (void *)objc_msgSend(v7, "copy");

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v16;
}

void __56__GEOBusinessHours_prioritizeBusinessHours_compareDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

+ (void)divideBusinessHoursBasedOnTodaysDate:(id)a3 compareDate:(id)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v35 = a5;
  v10 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      v37 = v13;
      do
      {
        if (*(_QWORD *)v39 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
        objc_msgSend(v16, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17 || objc_msgSend(v9, "compare:", v17) != 1)
        {
          switch(objc_msgSend(v16, "hoursType"))
          {
            case 0:
              break;
            case 1:
              objc_msgSend(v10, "addObject:", v16);
              break;
            case 2:
              if (!objc_msgSend(v16, "pdHoursAreValid"))
                break;
              goto LABEL_11;
            case 3:
LABEL_11:
              objc_msgSend(v16, "startDate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v9, "compare:", v18);
              v20 = v14;
              v21 = v9;
              v22 = v11;
              v23 = v10;
              v24 = v5;
              v25 = v19;

              v26 = v25 == -1;
              v5 = v24;
              v10 = v23;
              v11 = v22;
              v9 = v21;
              v14 = v20;
              v13 = v37;
              if (!v26)
                goto LABEL_12;
              break;
            case 4:
              v30 = v16;
              if (!v30)
                break;
              v31 = v30;

              v42 = v31;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v35;
              (*((void (**)(id, void *, _QWORD))v35 + 2))(v35, v33, MEMORY[0x1E0C9AA60]);
              v32 = v36;
              goto LABEL_22;
            default:
LABEL_12:
              objc_msgSend(v16, "startDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v9, "compare:", v27);
              v29 = v10;
              if (v28 != 1)
              {
                if (objc_msgSend(v9, "compare:", v27))
                  v29 = v36;
                else
                  v29 = v10;
              }
              objc_msgSend(v29, "addObject:", v16);

              break;
          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v13);
  }

  v31 = (void *)objc_msgSend(v10, "copy");
  v32 = v36;
  v33 = (void *)objc_msgSend(v36, "copy");
  v34 = v35;
  (*((void (**)(id, void *, void *))v35 + 2))(v35, v31, v33);
LABEL_22:

}

- (GEOBusinessHours)initWithGEOPDBusinessHours:(id)a3 timeZone:(id)a4
{
  id v7;
  id v8;
  GEOBusinessHours *v9;
  GEOBusinessHours *v10;
  void *v11;
  GEOBusinessHours *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  GEOBusinessHours *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GEOBusinessHours;
  v9 = -[GEOBusinessHours init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hours, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__GEOBusinessHours_initWithGEOPDBusinessHours_timeZone___block_invoke;
    v16[3] = &unk_1E1C10868;
    v12 = v10;
    v17 = v12;
    v13 = (void *)MEMORY[0x18D765024](v16);
    -[GEOBusinessHours pdHours](v12, "pdHours");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _geoNormalizedAndViewHourModelsForPDHours(v14, v11, v8, -[GEOBusinessHours openingSoonThresholdInSeconds](v12, "openingSoonThresholdInSeconds"), -[GEOBusinessHours closingSoonThresdholdInSeconds](v12, "closingSoonThresdholdInSeconds"), v13);

  }
  return v10;
}

void __56__GEOBusinessHours_initWithGEOPDBusinessHours_timeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v6;

}

- (GEOBusinessHours)initWithGEOPDHours:(id)a3 timeZone:(id)a4
{
  id v6;
  id v7;
  GEOBusinessHours *v8;
  void *v9;
  GEOBusinessHours *v10;
  void *v11;
  _QWORD v13[4];
  GEOBusinessHours *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOBusinessHours;
  v8 = -[GEOBusinessHours init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__GEOBusinessHours_initWithGEOPDHours_timeZone___block_invoke;
    v13[3] = &unk_1E1C10868;
    v10 = v8;
    v14 = v10;
    v11 = (void *)MEMORY[0x18D765024](v13);
    _geoNormalizedAndViewHourModelsForPDHours(v6, v9, v7, 0, 0, v11);
    v10->_isBrandTypeHours = 1;

  }
  return v8;
}

void __48__GEOBusinessHours_initWithGEOPDHours_timeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v6;

}

- (unsigned)openingSoonThresholdInSeconds
{
  _DWORD *v2;
  unsigned int v3;

  -[GEOPDBusinessHours hoursThreshold]((id *)&self->_hours->super.super.isa);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[5];
  else
    v3 = 0;

  return v3;
}

- (unsigned)closingSoonThresdholdInSeconds
{
  _DWORD *v2;
  unsigned int v3;

  -[GEOPDBusinessHours hoursThreshold]((id *)&self->_hours->super.super.isa);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[4];
  else
    v3 = 0;

  return v3;
}

- (unint64_t)hoursType
{
  uint64_t v3;

  if (self->_isBrandTypeHours)
    return 1;
  v3 = -[GEOPDBusinessHours hoursType]((uint64_t)self->_hours) - 1;
  if (v3 <= 3)
    return v3 + 1;
  else
    return 0;
}

- (BOOL)pdHoursAreValid
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "days", (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (NSArray)pdHours
{
  return (NSArray *)-[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
}

- (NSString)localizedMessage
{
  void *v2;
  void *v3;

  -[GEOPDBusinessHours message]((id *)&self->_hours->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSSet)operatingWeekdays
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDBusinessHours weeklyHours]((id *)&self->_hours->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__GEOBusinessHours_operatingWeekdays__block_invoke;
  v7[3] = &unk_1E1C10890;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return (NSSet *)v5;
}

void __37__GEOBusinessHours_operatingWeekdays__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "daysCount"))
  {
    v3 = 0;
    do
    {
      v4 = objc_msgSend(v7, "days");
      v5 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v4 + 4 * v3));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      ++v3;
    }
    while (v3 < objc_msgSend(v7, "daysCount"));
  }

}

- (NSDate)startDate
{
  GEOPDBusinessHours *hours;
  unint64_t start;
  void *v4;

  hours = self->_hours;
  if (hours && (start = hours->_start) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)start);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)endDate
{
  GEOPDBusinessHours *hours;
  unint64_t end;
  void *v4;

  hours = self->_hours;
  if (hours && (end = hours->_end) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)end);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSArray)placeDailyHours
{
  return self->_placeDailyHours;
}

- (NSArray)placeDailyNormalizedHours
{
  return self->_placeDailyNormalizedHours;
}

- (BOOL)isBrandTypeHours
{
  return self->_isBrandTypeHours;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDailyNormalizedHours, 0);
  objc_storeStrong((id *)&self->_placeDailyHours, 0);
  objc_storeStrong((id *)&self->_hours, 0);
}

@end
