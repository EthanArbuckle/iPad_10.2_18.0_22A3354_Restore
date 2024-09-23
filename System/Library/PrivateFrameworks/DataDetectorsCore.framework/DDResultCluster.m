@implementation DDResultCluster

- (void)addDDResult:(__DDResult *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  NSMutableArray *DDResults;
  int64_t v8;

  if (self->_DDResults)
  {
    if (self->_DDRange.location == DDResultGetRangeForURLification((uint64_t)a3) && self->_DDRange.length == v5)
      -[NSMutableArray addObject:](self->_DDResults, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    DDResults = self->_DDResults;
    self->_DDResults = v6;

    self->_DDRange.location = DDResultGetRangeForURLification((uint64_t)a3);
    self->_DDRange.length = v8;
  }
}

- (void)setMLResult:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t location;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (self->_DDRange.length < 1)
    goto LABEL_11;
  v5 = objc_msgSend(v14, "range");
  location = self->_DDRange.location;
  if (location <= v5)
    v8 = v5;
  else
    v8 = self->_DDRange.location;
  v9 = self->_DDRange.length + location;
  v10 = v5 + v6;
  v11 = v14;
  if (v9 >= v10)
    v9 = v10;
  v12 = v9 <= v8;
  v13 = v9 - v8;
  if (v12)
    v13 = 0;
  if (v13 >= 1)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_MLResult, a3);
    v11 = v14;
  }

}

- (__DDResult)resolvedDDResultFromOriginalQuery:(__DDScanQuery *)a3 mlSupportedTypes:(__CFArray *)a4
{
  uint64_t v7;
  DDMLResult *MLResult;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  __DDResult *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  __DDResult *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  DDMLResult *v31;
  int64_t var0;
  int64_t var1;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __DDScanQuery *v37;
  __DDResult *v38;
  DDResultCluster *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = -[NSMutableArray count](self->_DDResults, "count");
  v39 = self;
  MLResult = self->_MLResult;
  if (!v7)
  {
    if (MLResult)
      return -[DDMLResult ddResultFromQuery:](MLResult, "ddResultFromQuery:", a3);
    return 0;
  }
  if (MLResult)
  {
    v37 = a3;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = self->_DDResults;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v38 = 0;
      v13 = *(_QWORD *)v45;
      v14 = -1;
      v15 = -1;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v45 != v13)
            objc_enumerationMutation(v9);
          v17 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v18 = -[DDMLResult classification](v39->_MLResult, "classification");
          if (v18 == 10 || DDMLClassificationForType(v17) != v18)
          {
            if (!DDResultTypeIsMLSupported(v17, a4) && *(_QWORD *)(v17 + 48) > v14)
            {
              v14 = *(_QWORD *)(v17 + 48);
              v12 = (__DDResult *)v17;
            }
          }
          else
          {
            v19 = *(_QWORD *)(v17 + 48);
            v20 = v19 <= v15;
            if (v19 > v15)
              v15 = *(_QWORD *)(v17 + 48);
            v21 = (uint64_t)v38;
            if (!v20)
              v21 = v17;
            v38 = (__DDResult *)v21;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v38 = 0;
    }

    a3 = v37;
    if (v38)
      v26 = v38;
    else
      v26 = v12;
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = self->_DDResults;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v24)
    {
      v25 = v24;
      v26 = 0;
      v27 = *(_QWORD *)v41;
      v28 = -1;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v23);
          v30 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
          if (!DDResultTypeIsMLSupported(v30, a4) && *(_QWORD *)(v30 + 48) > v28)
          {
            v28 = *(_QWORD *)(v30 + 48);
            v26 = (__DDResult *)v30;
          }
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v25);
    }
    else
    {
      v26 = 0;
    }

  }
  v31 = v39->_MLResult;
  if (v26)
  {
    if (v31)
    {
      if (!CFStringHasSuffix(v26->var5, CFSTR("MLCandidate")))
      {
        var0 = v26->var2.var0;
        var1 = v26->var2.var1;
        v34 = var0 - -[DDMLResult range](v39->_MLResult, "range");
        v35 = -[DDMLResult range](v39->_MLResult, "range");
        -[DDMLResult range](v39->_MLResult, "range");
        DDResultExpandRange(v26, (uint64_t)a3, v34, v35 - (var0 + var1) + v36);
        return v26;
      }
      v31 = v39->_MLResult;
      return -[DDMLResult ddResultFromQuery:](v31, "ddResultFromQuery:", a3);
    }
    if (+[DDMLResult shouldKeepResultOfType:](DDMLResult, "shouldKeepResultOfType:", v26->var5))
      return v26;
    return 0;
  }
  return -[DDMLResult ddResultFromQuery:](v31, "ddResultFromQuery:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MLResult, 0);
  objc_storeStrong((id *)&self->_DDResults, 0);
}

+ (id)clustersWithDDResults:(id)a3 mlResults:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSUInteger v8;
  DDResultCluster *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  _BOOL4 v15;
  BOOL v16;
  char v17;
  NSUInteger v18;
  NSUInteger v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v27;
  void *v28;
  id v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  NSUInteger v37;
  NSUInteger range1;
  unint64_t range1_8;
  NSUInteger v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  NSRange v47;
  NSRange v48;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = v5;
  v32 = objc_msgSend(v5, "count");
  v27 = v6;
  v31 = objc_msgSend(v6, "count");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v37 = 0;
  range1 = 0x7FFFFFFFFFFFFFFFLL;
  range1_8 = 0x7FFFFFFFFFFFFFFFLL;
  v40 = 0;
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = v7;
  while (1)
  {
    if (!v11)
    {
      if (v13 >= v32)
      {
        v11 = 0;
        if (v10)
          goto LABEL_11;
        goto LABEL_6;
      }
      objc_msgSend(v28, "objectAtIndexedSubscript:", v13);
      v11 = objc_claimAutoreleasedReturnValue();

      v36 = *(_QWORD *)(v11 + 32);
      v37 = *(_QWORD *)(v11 + 40);
      ++v13;
    }
    if (v10)
      goto LABEL_11;
LABEL_6:
    if (v12 >= v31)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v27, "objectAtIndexedSubscript:", v12);
      v10 = objc_claimAutoreleasedReturnValue();
      range1_8 = objc_msgSend((id)v10, "range");
      v40 = v14;
      ++v12;
    }
LABEL_11:
    v15 = (v11 | v10) != 0;
    if (!v11)
    {
      if (v10)
      {
        v17 = 0;
        v18 = range1_8;
        v19 = v40;
        goto LABEL_30;
      }
LABEL_29:
      v17 = 0;
      v19 = 0;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_30;
    }
    if (v10)
      v16 = v36 >= range1_8;
    else
      v16 = 0;
    v17 = !v16;
    if ((v17 & 1) != 0)
      v18 = v36;
    else
      v18 = range1_8;
    if ((v17 & 1) != 0)
      v19 = v37;
    else
      v19 = v40;
    if ((v17 & 1) == 0 && !v10)
      goto LABEL_29;
LABEL_30:
    if (v9)
    {
      v47.location = range1;
      v47.length = v8;
      v48.location = v18;
      v48.length = v19;
      if (!NSIntersectionRange(v47, v48).length)
      {
        v33 = v8;
        v34 = v13;
        v35 = v12;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v20 = v7;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v42 != v23)
                objc_enumerationMutation(v20);
              -[DDResultCluster setMLResult:](v9, "setMLResult:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v22);
        }

        objc_msgSend(v20, "removeAllObjects");
        objc_msgSend(v30, "addObject:", v9);

        v9 = 0;
        v7 = v29;
        v13 = v34;
        v12 = v35;
        v8 = v33;
      }
      v15 = (v11 | v10) != 0;
    }
    if (!v15)
      break;
    if (v9)
    {
      if ((v17 & 1) != 0)
        goto LABEL_44;
LABEL_46:
      objc_msgSend(v7, "addObject:", v10);

      v10 = 0;
    }
    else
    {
      v9 = objc_alloc_init(DDResultCluster);
      v8 = v19;
      range1 = v18;
      if ((v17 & 1) == 0)
        goto LABEL_46;
LABEL_44:
      -[DDResultCluster addDDResult:](v9, "addDDResult:", v11);
      v11 = 0;
    }
  }
  v25 = v30;

  return v25;
}

@end
