@implementation PHMemoryRelevanceHelper

+ (double)relevanceScoreForMemory:(id)a3 atDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  v6 = 0.0;
  if (+[PHMemoryRelevanceHelper isMemory:relevantAtDate:](PHMemoryRelevanceHelper, "isMemory:relevantAtDate:", v5, a4))
  {
    +[PHMemoryRelevanceHelper _notificationScoreComponentForMemory:](PHMemoryRelevanceHelper, "_notificationScoreComponentForMemory:", v5);
    v8 = v7;
    +[PHMemoryRelevanceHelper _categoryScoreComponentForMemory:](PHMemoryRelevanceHelper, "_categoryScoreComponentForMemory:", v5);
    v10 = v9;
    +[PHMemoryRelevanceHelper _triggerScoreComponentForMemory:](PHMemoryRelevanceHelper, "_triggerScoreComponentForMemory:", v5);
    v6 = v8 + v10 + v11;
  }

  return v6;
}

+ (BOOL)isMemory:(id)a3 relevantAtDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  if (+[PHMemoryRelevanceHelper _isMemoryTemporal:](PHMemoryRelevanceHelper, "_isMemoryTemporal:", v5))
  {
    objc_msgSend(v5, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PHMemoryRelevanceHelper _isDate:inSameDayAndMonthAsDate:](PHMemoryRelevanceHelper, "_isDate:inSameDayAndMonthAsDate:", v7, v6);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)isMemory:(id)a3 proactiveWorthyAtDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  char v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "featuredState") == 1
    && (objc_msgSend(v6, "creationDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceDate:", v8),
        v10 = v9,
        v8,
        v10 <= 86400.0))
  {
    v11 = objc_msgSend(a1, "isMemory:relevantAtDate:", v6, v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)_isMemoryTemporal:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[PHMemoryRelevanceHelper _isMemoryCategoryTemporal:](PHMemoryRelevanceHelper, "_isMemoryCategoryTemporal:", objc_msgSend(v3, "category"))|| +[PHMemoryRelevanceHelper _isMemorySubcategoryTemporal:](PHMemoryRelevanceHelper, "_isMemorySubcategoryTemporal:", objc_msgSend(v3, "subcategory"));

  return v4;
}

+ (BOOL)_isMemoryCategoryTemporal:(unint64_t)a3
{
  return (a3 - 202 < 0xC) & (0xC01u >> (a3 + 54));
}

+ (BOOL)_isMemorySubcategoryTemporal:(unint64_t)a3
{
  return a3 == 210;
}

+ (BOOL)_isDate:(id)a3 inSameDayAndMonthAsDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isDate:inSameDayAsDate:", v5, v6) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v7, "components:fromDate:", 24, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 24, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "month");
    if (v11 == objc_msgSend(v10, "month"))
    {
      v12 = objc_msgSend(v9, "day");
      v8 = v12 == objc_msgSend(v10, "day");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (double)_notificationScoreComponentForMemory:(id)a3
{
  double v3;

  +[PHMemoryRelevanceHelper _notificationLevelWeightForMemory:](PHMemoryRelevanceHelper, "_notificationLevelWeightForMemory:", a3);
  return v3 * 0.25;
}

+ (double)_categoryScoreComponentForMemory:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  if (objc_msgSend(v3, "subcategory"))
    +[PHMemoryRelevanceHelper _subcategoryWeightForMemory:](PHMemoryRelevanceHelper, "_subcategoryWeightForMemory:", v3);
  else
    +[PHMemoryRelevanceHelper _categoryWeightForMemory:](PHMemoryRelevanceHelper, "_categoryWeightForMemory:", v3);
  v5 = v4;

  return v5 * 0.5;
}

+ (double)_triggerScoreComponentForMemory:(id)a3
{
  double v3;

  +[PHMemoryRelevanceHelper _triggerScoreForMemory:](PHMemoryRelevanceHelper, "_triggerScoreForMemory:", a3);
  return v3 * 0.25;
}

+ (double)_notificationLevelWeightForMemory:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 1.0;
  if ((objc_msgSend(v3, "isMustSee") & 1) == 0)
  {
    if ((objc_msgSend(v3, "isStellar") & 1) != 0)
    {
      v4 = 0.8;
    }
    else if (objc_msgSend(v3, "isGreat"))
    {
      v4 = 0.6;
    }
    else
    {
      v4 = 0.4;
    }
  }

  return v4;
}

+ (double)_triggerScoreForMemory:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "triggerTypes");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = 0.0;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v7);
      +[PHMemoryRelevanceHelper _memoryTriggerTierScoreByTriggerType:](PHMemoryRelevanceHelper, "_memoryTriggerTierScoreByTriggerType:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "unsignedIntValue", (_QWORD)v16));
      if (v11 < v13)
        v11 = v13;
      v14 = 1.0;
      if (v11 == 1.0)
        break;
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v14 = v11;
        if (v9)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v14 = 0.0;
  }

  return v14;
}

+ (double)_categoryWeightForMemory:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "category");
  result = 1.0;
  if (v3 <= 200)
  {
    if (v3 > 100)
    {
      if (v3 == 101)
        return 0.8;
      if (v3 != 102)
        return result;
    }
    else if (v3 && v3 != 100)
    {
      return result;
    }
    return 0.2;
  }
  if (v3 > 300)
  {
    if (v3 != 401 && v3 != 302)
    {
      if (v3 != 301)
        return result;
      return 0.8;
    }
    return 0.2;
  }
  switch(v3)
  {
    case 201:
      return 0.8;
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 208:
    case 211:
    case 216:
      return 0.2;
    case 209:
    case 210:
    case 215:
    case 218:
      result = 0.6;
      break;
    case 214:
    case 217:
    case 219:
    case 220:
    case 221:
      result = 0.4;
      break;
    default:
      return result;
  }
  return result;
}

+ (double)_subcategoryWeightForMemory:(id)a3
{
  uint64_t v3;
  double result;

  v3 = objc_msgSend(a3, "subcategory");
  result = 1.0;
  if (v3 > 300)
  {
    if (v3 > 403)
    {
      if ((unint64_t)(v3 - 1000) < 4)
        return 0.2;
      if (v3 != 404)
      {
        if (v3 != 1100)
          return result;
        return 0.2;
      }
    }
    else
    {
      if ((unint64_t)(v3 - 301) < 3 || (unint64_t)(v3 - 402) < 2)
        return 0.2;
      if (v3 != 401)
        return result;
    }
    return 0.6;
  }
  if (v3 > 200)
  {
    switch(v3)
    {
      case 201:
      case 202:
      case 203:
      case 204:
      case 208:
      case 209:
      case 213:
      case 215:
      case 216:
      case 218:
        return 0.6;
      case 205:
      case 206:
      case 212:
      case 214:
      case 217:
        return 0.8;
      case 207:
        return 0.2;
      case 211:
        return 0.4;
      default:
        return result;
    }
    return result;
  }
  if ((unint64_t)(v3 - 101) < 2)
    return 0.8;
  if (!v3)
    return 0.2;
  if (v3 == 103)
    return 0.4;
  return result;
}

+ (double)_memoryTriggerTierScoreByTriggerType:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 <= 0x1B)
    return dbl_19944A8E8[a3];
  return result;
}

@end
