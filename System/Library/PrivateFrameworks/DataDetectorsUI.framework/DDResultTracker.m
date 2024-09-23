@implementation DDResultTracker

- (DDResultTracker)initWithReferenceResult:(__DDResult *)a3
{
  char *v4;
  int Category;
  char *v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DDResultTracker;
  v4 = -[DDResultTracker init](&v14, sel_init);
  if (v4)
  {
    *((_QWORD *)v4 + 12) = CFRetain(a3);
    *((_QWORD *)v4 + 6) = DDResultGetRange();
    Category = DDResultGetCategory();
    *(_OWORD *)(v4 + 8) = xmmword_19F0068C0;
    v6 = v4 + 8;
    *(_OWORD *)(v4 + 24) = xmmword_19F0068D0;
    if (Category == 4)
    {
      *((_DWORD *)v4 + 6) = 2;
      v4[44] = 1;
    }
    else
    {
      --*(_DWORD *)&v6[4 * Category];
    }
    v7 = 0;
    v8 = 0;
    *((_DWORD *)v4 + 10) = 0;
    do
    {
      v8 += *(_DWORD *)&v6[v7];
      *((_DWORD *)v4 + 10) = v8;
      v7 += 4;
    }
    while (v7 != 32);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)*((_QWORD *)v4 + 10);
    *((_QWORD *)v4 + 10) = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v11;

    *((_QWORD *)v4 + 9) = 0;
  }
  return (DDResultTracker *)v4;
}

- (void)dealloc
{
  __DDResult *referenceResult;
  objc_super v4;

  referenceResult = self->referenceResult;
  if (referenceResult)
    CFRelease(referenceResult);
  v4.receiver = self;
  v4.super_class = (Class)DDResultTracker;
  -[DDResultTracker dealloc](&v4, sel_dealloc);
}

- (BOOL)addResultIfAppropriate:(__DDResult *)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5
{
  id v8;
  id v9;
  int Category;
  unint64_t referenceResultLocation;
  uint64_t Range;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unint64_t maximumDistance;
  BOOL v17;
  void *v18;
  NSMutableArray *resultsBefore;
  NSMutableArray *resultsAfter;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t Type;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  __DDResult *referenceResult;
  _QWORD v51[3];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!self->totalCountRemaining)
    goto LABEL_14;
  Category = DDResultGetCategory();
  referenceResultLocation = self->referenceResultLocation;
  Range = DDResultGetRange();
  v13 = referenceResultLocation - Range;
  if ((uint64_t)(referenceResultLocation - Range) >= 0)
    v14 = referenceResultLocation - Range;
  else
    v14 = Range - referenceResultLocation;
  if (Category == 1)
  {
    if (v14 <= self->maximumDistanceForEmails)
    {
      if (v14 <= self->maximumDistance)
      {
        v15 = self->countRemainingByCategory[1];
LABEL_38:
        if (!v15)
          goto LABEL_44;
LABEL_41:
        --self->countRemainingByCategory[Category];
        --self->totalCountRemaining;
        if (v13 < 1)
          -[NSMutableArray addObject:](self->resultsAfter, "addObject:", a3);
        else
          -[NSMutableArray insertObject:atIndex:](self->resultsBefore, "insertObject:atIndex:", a3, 0);
        goto LABEL_44;
      }
      goto LABEL_14;
    }
LABEL_44:
    v17 = 1;
    goto LABEL_45;
  }
  maximumDistance = self->maximumDistance;
  if (v14 <= maximumDistance)
  {
    if (Category == 3)
    {
      if (!self->existingAddressResult)
      {
        self->existingAddressResult = a3;
        goto LABEL_41;
      }
      if (DDAddressResultCanBeMergedWith())
        goto LABEL_41;
      goto LABEL_44;
    }
    goto LABEL_19;
  }
  v17 = 0;
  if (Category == 4 && v14 <= 2 * maximumDistance)
  {
    if (!DDResultHasType() || DDResultIsPastDate())
    {
LABEL_14:
      v17 = 0;
      goto LABEL_45;
    }
LABEL_19:
    v15 = self->countRemainingByCategory[Category];
    if (v15 && Category == 4)
    {
      v40 = v8;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      referenceResult = self->referenceResult;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &referenceResult, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      resultsBefore = self->resultsBefore;
      resultsAfter = self->resultsAfter;
      v51[0] = v18;
      v51[1] = resultsBefore;
      v51[2] = resultsAfter;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v36)
      {
        v22 = *(_QWORD *)v46;
        v23 = *MEMORY[0x1E0D1CB88];
        v38 = v21;
        v39 = v9;
        v34 = *(_QWORD *)v46;
        v35 = v13;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v46 != v22)
              objc_enumerationMutation(v21);
            v37 = v24;
            v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v24);
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            v44 = 0u;
            v26 = v25;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v42;
              while (2)
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v42 != v29)
                    objc_enumerationMutation(v26);
                  Type = DDResultGetType();
                  if (MEMORY[0x1A1AF2D58](Type, v23))
                  {
                    v32 = DDResultGetType();
                    if (MEMORY[0x1A1AF2D58](Type, v32))
                    {

                      v17 = 1;
                      v9 = v39;
                      v8 = v40;
                      goto LABEL_45;
                    }
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
                if (v28)
                  continue;
                break;
              }
            }

            v24 = v37 + 1;
            v21 = v38;
            v9 = v39;
            v22 = v34;
            v13 = v35;
          }
          while (v37 + 1 != v36);
          v36 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
        }
        while (v36);
      }

      v8 = v40;
      goto LABEL_41;
    }
    goto LABEL_38;
  }
LABEL_45:

  return v17;
}

- (id)results
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSMutableArray arrayByAddingObject:](self->resultsBefore, "arrayByAddingObject:", self->referenceResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", self->resultsAfter);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->sortByProximity)
  {
    objc_msgSend(v4, "sortedArrayUsingFunction:context:", MEMORY[0x1E0D1CD40], self->referenceResult);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (unsigned)totalCountRemaining
{
  return self->totalCountRemaining;
}

- (unint64_t)maximumDistanceForEmails
{
  return self->maximumDistanceForEmails;
}

- (void)setMaximumDistanceForEmails:(unint64_t)a3
{
  self->maximumDistanceForEmails = a3;
}

- (unint64_t)maximumDistance
{
  return self->maximumDistance;
}

- (void)setMaximumDistance:(unint64_t)a3
{
  self->maximumDistance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->resultsAfter, 0);
  objc_storeStrong((id *)&self->resultsBefore, 0);
}

@end
