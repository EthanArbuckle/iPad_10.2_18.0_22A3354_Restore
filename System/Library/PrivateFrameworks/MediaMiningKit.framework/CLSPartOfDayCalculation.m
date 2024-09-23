@implementation CLSPartOfDayCalculation

+ (id)partOfDayForItem:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _OWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(a3, "cls_localDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (double)objc_msgSend(v4, "hour") * 3600.0;
    v7 = (double)objc_msgSend(v5, "minute");
    v8 = v6 + (double)objc_msgSend(v5, "second") + v7 * 60.0;
  }
  else
  {
    v8 = 0.0;
  }

  v9 = malloc_type_calloc(7uLL, 8uLL, 0x100004000313F17uLL);
  v10 = v9;
  *v9 = xmmword_1CABE9040;
  v9[1] = xmmword_1CABE9050;
  v9[2] = xmmword_1CABE9060;
  *((_QWORD *)v9 + 6) = 0x40F97D0000000000;
  if (v8 >= 104400.0)
    v8 = (double)((unint64_t)v8 % 0x15180);
  v11 = 0;
  while (v8 >= *((double *)v9 + v11 + 1) || v8 < *((double *)v9 + v11))
  {
    if (++v11 == 6)
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
  }
  if (v11 == 5)
    v12 = 0;
  else
    v12 = v11;
LABEL_14:
  objc_msgSend(a1, "_possibleTimesOfDay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v10);

  return v14;
}

+ (id)partsOfDayForFeeder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  void *v8;
  size_t v9;
  unint64_t *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  size_t v17;
  unint64_t v18;
  void *v19;
  uint64_t i;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[10];
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "numberOfItems");
  if (v5)
  {
    v6 = v5;
    v7 = malloc_type_calloc(7uLL, 8uLL, 0x100004000313F17uLL);
    *v7 = xmmword_1CABE9040;
    v7[1] = xmmword_1CABE9050;
    v7[2] = xmmword_1CABE9060;
    *((_QWORD *)v7 + 6) = 0x40F97D0000000000;
    objc_msgSend(a1, "_possibleTimesOfDay");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = (unint64_t *)malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0xBFF0000000000000;
    objc_msgSend(v4, "localStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "universalStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __47__CLSPartOfDayCalculation_partsOfDayForFeeder___block_invoke;
    v26[3] = &unk_1E84F85C0;
    v26[7] = v14;
    v26[4] = v27;
    v26[5] = &v28;
    v26[6] = v6;
    v26[8] = v7;
    v26[9] = v10;
    objc_msgSend(v4, "enumerateItemsUsingBlock:", v26);
    v15 = 0;
    if (v9)
    {
      v16 = v10;
      v17 = v9;
      do
      {
        v18 = *v16;
        if (*v16 && (double)v18 / (double)(unint64_t)v29[3] < 0.03)
        {
          *v16 = 0;
          v15 += v18;
        }
        ++v16;
        --v17;
      }
      while (v17);
    }
    v29[3] -= v15;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        v21 = v10[i];
        if (v21)
        {
          v22 = v29[3];
          objc_msgSend(v8, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v21 / (double)v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, v23);

          }
        }
      }
    }
    free(v10);
    free(v7);
    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v19;
}

+ (id)_possibleTimesOfDay
{
  if (_possibleTimesOfDay_onceToken != -1)
    dispatch_once(&_possibleTimesOfDay_onceToken, &__block_literal_global_2928);
  return (id)_possibleTimesOfDay_possibleTimesOfDay;
}

void __46__CLSPartOfDayCalculation__possibleTimesOfDay__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Night");
  v2[1] = CFSTR("Morning");
  v2[2] = CFSTR("Noon");
  v2[3] = CFSTR("Afternoon");
  v2[4] = CFSTR("Evening");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_possibleTimesOfDay_possibleTimesOfDay;
  _possibleTimesOfDay_possibleTimesOfDay = v0;

}

void __47__CLSPartOfDayCalculation_partsOfDayForFeeder___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  BOOL v31;
  double v32;
  void *v33;
  NSObject *v34;
  int v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v7 = (double)a3 / (double)*(unint64_t *)(a1 + 48);
  if (v7 <= 0.33)
  {
    v8 = 1;
  }
  else if (v7 >= 0.66)
  {
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "clsLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "cls_localDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_8;
LABEL_14:
    v18 = v10;
    v19 = v18;
    if (!v18)
    {
      v21 = 0.0;
      goto LABEL_34;
    }
    v20 = (double)objc_msgSend(v18, "hour") * 3600.0;
    if (v8 == 2)
    {
      if (objc_msgSend(v19, "minute") <= 4)
      {
        v24 = -1.0;
LABEL_33:
        v21 = v20 + v24;
        goto LABEL_34;
      }
    }
    else if (v8 == 1 && objc_msgSend(v19, "minute") >= 56)
    {
      v21 = v20 + 3600.0;
LABEL_34:

      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v21;
      goto LABEL_35;
    }
    v25 = (double)objc_msgSend(v19, "minute");
    v24 = (double)objc_msgSend(v19, "second") + v25 * 60.0;
    goto LABEL_33;
  }
  objc_msgSend(v6, "cls_universalDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingTimeInterval:", *(double *)(a1 + 56));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLSCalendar dateComponentsWithLocalDate:](CLSCalendar, "dateComponentsWithLocalDate:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3)
    goto LABEL_14;
LABEL_8:
  v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v12 = v10;
  v13 = v12;
  if (v12)
  {
    v14 = 3600.0;
    v15 = (double)objc_msgSend(v12, "hour") * 3600.0;
    if (v8 == 2)
    {
      v14 = -1.0;
      if (objc_msgSend(v13, "minute") < 5)
        goto LABEL_23;
    }
    else if (v8 == 1 && objc_msgSend(v13, "minute") > 55)
    {
LABEL_23:
      if (v15 + v14 >= v11 || v11 == -1.0)
        v21 = v15 + v14;
      else
        v21 = v15 + v14 + 86400.0;
      goto LABEL_29;
    }
    v22 = (double)objc_msgSend(v13, "minute");
    v14 = (double)objc_msgSend(v13, "second") + v22 * 60.0;
    goto LABEL_23;
  }
  v21 = 0.0;
LABEL_29:

LABEL_35:
  v26 = *(_QWORD *)(a1 + 64);
  v27 = *(double *)(v26 + 48);
  v28 = v21;
  if (v27 <= v21)
    v28 = (double)((unint64_t)v21 % 0x15180);
  v29 = 0;
  while (v28 >= *(double *)(v26 + 8 * v29 + 8) || v28 < *(double *)(v26 + 8 * v29))
  {
    if (++v29 == 6)
    {
      if (!a3)
      {
LABEL_47:
        *(double *)(v26 + 8) = *(double *)(v26 + 8) + 7200.0;
        v30 = v27 + 7200.0;
        *(double *)(v26 + 48) = v30;
        v31 = v30 > v21;
        v32 = v21;
        if (!v31)
          v32 = (double)((unint64_t)v21 % 0x15180);
        v29 = 0;
        while (v32 >= *(double *)(v26 + 8 * v29 + 8) || v32 < *(double *)(v26 + 8 * v29))
        {
          if (++v29 == 6)
            goto LABEL_55;
        }
        if (v29 == 5)
          v29 = 0;
        goto LABEL_60;
      }
      goto LABEL_55;
    }
  }
  if (v29 == 5)
    v29 = 0;
  if (!a3 && v29 != 1)
    goto LABEL_47;
  if (v29 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_60:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8 * v29);
    goto LABEL_61;
  }
LABEL_55:
  +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "loggingConnection");
  v34 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = 134217984;
    v36 = v21;
    _os_log_error_impl(&dword_1CAB79000, v34, OS_LOG_TYPE_ERROR, "Cannot find time of day for time interval %f", (uint8_t *)&v35, 0xCu);
  }

LABEL_61:
}

@end
