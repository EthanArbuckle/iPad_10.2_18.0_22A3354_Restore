@implementation PHUserFeedbackCalculator

- (PHUserFeedbackCalculator)initWithPhotoLibrary:(id)a3
{
  id v4;
  PHUserFeedbackDataCache *v5;
  PHUserFeedbackCalculator *v6;

  v4 = a3;
  v5 = -[PHUserFeedbackDataCache initWithPhotoLibrary:]([PHUserFeedbackDataCache alloc], "initWithPhotoLibrary:", v4);

  v6 = -[PHUserFeedbackCalculator initWithDataCache:](self, "initWithDataCache:", v5);
  return v6;
}

- (PHUserFeedbackCalculator)initWithDataCache:(id)a3
{
  id v5;
  PHUserFeedbackCalculator *v6;
  PHUserFeedbackCalculator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHUserFeedbackCalculator;
  v6 = -[PHUserFeedbackCalculator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataCache, a3);

  return v7;
}

- (PHPhotoLibrary)photoLibrary
{
  return -[PHUserFeedbackDataCache photoLibrary](self->_dataCache, "photoLibrary");
}

- (double)scoreForAssetUUIDs:(id)a3 personsUUIDsByAssetUUIDs:(id)a4
{
  double result;

  -[PHUserFeedbackCalculator scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:](self, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", a3, 0, a4, 0);
  return result;
}

- (double)scoreForKeyAssetUUID:(id)a3 personsUUIDsInKeyAsset:(id)a4 memoryFeatures:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17[0] = a4;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHUserFeedbackCalculator scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:](self, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", MEMORY[0x1E0C9AA60], v11, v12, v9);
  v14 = v13;

  return v14;
}

- (double)scoreForAssetUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5 memoryFeatures:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  double v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = a6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        if (-[PHUserFeedbackCalculator _hasNegativeFeedback:](self, "_hasNegativeFeedback:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17), (_QWORD)v24))
        {

          v21 = -1.0;
          goto LABEL_12;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }

  -[PHUserFeedbackCalculator dataCache](self, "dataCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deniedFeaturedPhotoUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsObject:", v11);

  v21 = -1.0;
  if ((v20 & 1) == 0)
  {
    -[PHUserFeedbackCalculator _scoreForPersonsInAssetsForUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:](self, "_scoreForPersonsInAssetsForUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:", v10, v11, v12);
    v21 = v22;
  }
LABEL_12:

  return v21;
}

- (id)personUUIDsWithNegativeFeedback
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PHUserFeedbackCalculator dataCache](self, "dataCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedbackTypeByPersonUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        if ((v13 & 0xFFFFFFFFFFFFFFFELL) == 2)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (unint64_t)userFeedbackTypeForPersonUUID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUserFeedbackCalculator userFeedbackTypeByPersonUUIDForPersonUUIDs:](self, "userFeedbackTypeByPersonUUIDForPersonUUIDs:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  return v9;
}

- (id)userFeedbackTypeByPersonUUIDForPersonUUIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PHUserFeedbackCalculator dataCache](self, "dataCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userFeedbackTypeByPersonUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsForKeys:notFoundMarker:", v4, &unk_1E3654928);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)memoryFeaturesWithNegativeFeedbackForMemoryFeatures:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[PHUserFeedbackCalculator _hasNegativeFeedback:](self, "_hasNegativeFeedback:", v11, (_QWORD)v13))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (double)_scoreForPersonsInAssetsForUUIDs:(id)a3 keyAssetUUID:(id)a4 personsUUIDsByAssetUUIDs:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  PHUserFeedbackCalculator *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  PHUserFeedbackCalculator *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[6];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v61 = a5;
  v10 = 0.0;
  v11 = 0.0;
  if (v9)
  {
    objc_msgSend(v61, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHUserFeedbackCalculator _scoreForKeyAssetWithPersonUUIDs:](self, "_scoreForKeyAssetWithPersonUUIDs:", v12);
    v14 = v13;

    v11 = -1.0;
    if (v14 == -1.0)
      goto LABEL_53;
    v11 = v14;
  }
  v49 = v8;
  v50 = v9;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v15 = v8;
  v62 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v62)
  {
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v51 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v59 = *(_QWORD *)v64;
    v60 = 0;
    obj = v15;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x19AEBEADC]();
        objc_msgSend(v61, "objectForKeyedSubscript:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHUserFeedbackCalculator _uniqueFeedbackTypesForPersonUUIDs:](self, "_uniqueFeedbackTypesForPersonUUIDs:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", &unk_1E3654940);
        v22 = objc_msgSend(v20, "containsObject:", &unk_1E3654958);
        v23 = self;
        -[PHUserFeedbackCalculator dataCache](self, "dataCache");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deniedFeaturedPhotoUUIDs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v25, "containsObject:", v17);

        if ((_DWORD)v17)
        {
          ++v60;
LABEL_14:
          self = v23;
          goto LABEL_15;
        }
        if ((v21 | v22) != 1)
          goto LABEL_14;
        v10 = v10 + 1.0;
        v57 |= v22;
        self = v23;
        if (objc_msgSend(v19, "count") == 1)
        {
          ++v56;
        }
        else if (objc_msgSend(v19, "count") == 2)
        {
          if (-[PHUserFeedbackCalculator _anyPersonUUIDs:matchesWithImportantPersonType:](v23, "_anyPersonUUIDs:matchesWithImportantPersonType:", v19, 1))
          {
            ++v51;
          }
          else
          {
            v26 = -[PHUserFeedbackCalculator _anyPersonUUIDs:matchesWithImportantPersonType:](v23, "_anyPersonUUIDs:matchesWithImportantPersonType:", v19, 2);
            if (v26)
              v27 = v55 + 1;
            else
              v27 = v55;
            v28 = v54;
            if (!v26)
              v28 = v54 + 1;
            v54 = v28;
            v55 = v27;
          }
        }
        else if ((unint64_t)objc_msgSend(v19, "count") > 3)
        {
          v29 = objc_msgSend(v19, "count");
          v30 = v52;
          if (v29 > 3)
            v30 = v52 + 1;
          v52 = v30;
        }
        else
        {
          ++v53;
        }
LABEL_15:

        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v62 != v16);
      v15 = obj;
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      v62 = v31;
      if (!v31)
        goto LABEL_34;
    }
  }
  v60 = 0;
  v57 = 0;
  v52 = 0;
  v53 = 0;
  v51 = 0;
  v54 = 0;
  v55 = 0;
  v56 = 0;
LABEL_34:

  v32 = v10 + (double)v60;
  if (v32 == 0.0)
  {
    v8 = v49;
    v9 = v50;
  }
  else
  {
    v33 = objc_msgSend(v15, "count");
    v34 = 0.0;
    v35 = 0.0;
    v8 = v49;
    v9 = v50;
    if (v32 > 0.0)
    {
      v36 = v56 + v60;
      v37 = v32 / (double)v33;
      v48 = self;
      if (v37 <= 0.2)
      {
        v34 = -0.1;
      }
      else if (v37 > 0.5)
      {
        v34 = -0.3;
      }
      else
      {
        v34 = 0.0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v38;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v39;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v55);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v67[2] = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v67[3] = v41;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v67[4] = v42;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v67[5] = v43;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 6);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "valueForKeyPath:", CFSTR("@max.self"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 2.0;
      if (v36 == objc_msgSend(v45, "integerValue"))
      {
        v9 = v50;
      }
      else
      {
        v9 = v50;
        if (v51 != objc_msgSend(v45, "integerValue"))
        {
          v35 = 1.0;
          if (v55 != objc_msgSend(v45, "integerValue") && v54 != objc_msgSend(v45, "integerValue"))
          {
            v35 = 0.5;
            if (v53 != objc_msgSend(v45, "integerValue"))
            {
              if (v52 == objc_msgSend(v45, "integerValue"))
                v35 = 0.1;
              else
                v35 = 0.0;
            }
          }
        }
      }

      self = v48;
    }
    -[PHUserFeedbackCalculator _adjustScore:shouldDowngrade:](self, "_adjustScore:shouldDowngrade:", v57 & 1, v11 + v34 * v35);
    v11 = v46;
  }
LABEL_53:

  return v11;
}

- (double)_scoreForKeyAssetWithPersonUUIDs:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  -[PHUserFeedbackCalculator _uniqueFeedbackTypesForPersonUUIDs:](self, "_uniqueFeedbackTypesForPersonUUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", &unk_1E3654940);
  v7 = objc_msgSend(v5, "containsObject:", &unk_1E3654958);
  v8 = v7;
  if ((v6 & 1) != 0 || (v9 = 0.0, (_DWORD)v7))
  {
    v10 = -1.0;
    if (objc_msgSend(v4, "count") != 1)
    {
      if (objc_msgSend(v4, "count") == 2)
      {
        if (!-[PHUserFeedbackCalculator _anyPersonUUIDs:matchesWithImportantPersonType:](self, "_anyPersonUUIDs:matchesWithImportantPersonType:", v4, 1))
        {
          if (-[PHUserFeedbackCalculator _anyPersonUUIDs:matchesWithImportantPersonType:](self, "_anyPersonUUIDs:matchesWithImportantPersonType:", v4, 2))
          {
            v10 = -0.2;
          }
          else
          {
            v10 = -0.3;
          }
        }
      }
      else if ((unint64_t)objc_msgSend(v4, "count") >= 4)
      {
        if ((unint64_t)objc_msgSend(v4, "count") <= 3)
          v10 = -1.0;
        else
          v10 = -0.1;
      }
      else
      {
        v10 = -0.2;
      }
    }
    -[PHUserFeedbackCalculator _adjustScore:shouldDowngrade:](self, "_adjustScore:shouldDowngrade:", v8, v10);
    v9 = v11;
  }

  return v9;
}

- (BOOL)_anyPersonUUIDs:(id)a3 matchesWithImportantPersonType:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUUID IN %@"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHUserFeedbackCalculator dataCache](self, "dataCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "importantPersons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "type") == a4)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)_uniqueFeedbackTypesForPersonUUIDs:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PHUserFeedbackCalculator userFeedbackTypeByPersonUUIDForPersonUUIDs:](self, "userFeedbackTypeByPersonUUIDForPersonUUIDs:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)_adjustScore:(double)result shouldDowngrade:(BOOL)a4
{
  if (result < 0.0 && a4)
  {
    if (result >= -0.1)
      result = -0.35;
    else
      result = -1.0;
  }
  if (result < -1.0)
    result = -1.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)_hasNegativeFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "type") == 16)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "datesWithNegativeFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v49;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v4, "collidesWithDate:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v9)) & 1) != 0)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_62;
        }
      }
LABEL_61:
      LOBYTE(v7) = 1;
    }
  }
  else if (objc_msgSend(v4, "type") == 512)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateIntervalsWithNegativeFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v7)
    {
      v11 = *(_QWORD *)v45;
LABEL_14:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v4, "collidesWithDateInterval:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v12)) & 1) != 0)
          goto LABEL_61;
        if (v7 == ++v12)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
          if (v7)
            goto LABEL_14;
          break;
        }
      }
    }
  }
  else if (objc_msgSend(v4, "type") == 32)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "holidayNamesWithNegativeFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
    if (v7)
    {
      v14 = *(_QWORD *)v41;
LABEL_24:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v4, "collidesWithHolidayWithName:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v15)) & 1) != 0)
          goto LABEL_61;
        if (v7 == ++v15)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
          if (v7)
            goto LABEL_24;
          break;
        }
      }
    }
  }
  else if (objc_msgSend(v4, "type") == 4096)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "locationsWithNegativeFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
    if (v7)
    {
      v17 = *(_QWORD *)v37;
LABEL_34:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v18), "coordinate");
        if ((objc_msgSend(v4, "collidesWithLocationAtCoordinates:") & 1) != 0)
          goto LABEL_61;
        if (v7 == ++v18)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v54, 16);
          if (v7)
            goto LABEL_34;
          break;
        }
      }
    }
  }
  else if (objc_msgSend(v4, "type") == 0x20000)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "areaNamesWithNegativeFeedback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
    if (v7)
    {
      v20 = *(_QWORD *)v33;
LABEL_44:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v20)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v4, "collidesWithAreaWithName:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v21)) & 1) != 0)
          goto LABEL_61;
        if (v7 == ++v21)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v53, 16);
          if (v7)
            goto LABEL_44;
          break;
        }
      }
    }
  }
  else
  {
    if (objc_msgSend(v4, "type") != 1)
    {
      LOBYTE(v7) = 0;
      goto LABEL_63;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PHUserFeedbackCalculator dataCache](self, "dataCache", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "userFeedbackTypeByPersonUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v52, 16);
    if (v7)
    {
      v23 = *(_QWORD *)v29;
LABEL_54:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v6);
        +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v4, "collidesWithPersonWithLocalIdentifier:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_61;
        if (v7 == ++v24)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v52, 16);
          if (v7)
            goto LABEL_54;
          break;
        }
      }
    }
  }
LABEL_62:

LABEL_63:
  return v7;
}

- (PHUserFeedbackDataCache)dataCache
{
  return self->_dataCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCache, 0);
}

+ (BOOL)score:(double)a3 meetsScoreThreshold:(double)a4
{
  BOOL v4;
  BOOL v6;
  BOOL v7;

  if (a4 == 0.0)
  {
    v4 = a3 < 0.0;
    return !v4;
  }
  if (a4 == -0.1)
  {
    v4 = a3 < -0.1;
    return !v4;
  }
  if (a4 == -0.35)
  {
    v6 = a3 >= -1.0;
    v7 = a3 < -0.1;
  }
  else
  {
    if (a4 != -1.0)
      return 0;
    v6 = a3 >= -1.0;
    v7 = a3 < -0.35;
  }
  return v7 && v6;
}

+ (id)descriptionForScore:(double)a3
{
  if ((objc_msgSend(a1, "score:meetsScoreThreshold:", a3, 0.0) & 1) != 0)
    return CFSTR("Recommended");
  if ((objc_msgSend(a1, "score:meetsScoreThreshold:", a3, -0.1) & 1) != 0)
    return CFSTR("Acceptable");
  if ((objc_msgSend(a1, "score:meetsScoreThreshold:", a3, -1.0) & 1) != 0)
    return CFSTR("Unacceptable");
  if (objc_msgSend(a1, "score:meetsScoreThreshold:", a3, -0.35))
    return CFSTR("Not Recommended");
  return CFSTR("Unknown");
}

+ (id)fetchSongIdentifiersWithNegativeFeedbackWithPhotoLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  char *v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
  uint64_t v32;
  NSObject *v33;
  unint64_t v34;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  double v46;
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "_isUserFeedbackFeatureFlagEnabled"))
  {
    PLUserFeedbackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);
    info = 0;
    mach_timebase_info(&info);
    v7 = v5;
    v8 = v7;
    v34 = v6 - 1;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "FetchSongIdentifiersWithNegativeFeedback", ", buf, 2u);
    }
    spid = v6;
    v33 = v8;

    v32 = mach_absolute_time();
    v36 = v4;
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = CFSTR("PHMemoryPropertySetUserFeedback");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v10);

    v35 = v9;
    +[PHMemory fetchMemoriesWithUserFeedbackWithOptions:](PHMemory, "fetchMemoriesWithUserFeedbackWithOptions:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v18, "userFeedbackProperties", spid);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "userFeedback");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "feature") == 6)
          {
            v37 = 0;
            objc_msgSend(v20, "contextAsListOfSongIdentifiersWithError:", &v37);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v37;
            if (v21)
            {
              objc_msgSend(v12, "addObjectsFromArray:", v21);
            }
            else
            {
              PLPhotoKitGetLog();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v18, "localIdentifier");
                v24 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v44 = v24;
                v45 = 2112;
                v46 = *(double *)&v22;
                _os_log_impl(&dword_1991EC000, v23, OS_LOG_TYPE_ERROR, "PHUserFeedbackCalculator: Error parsing song identifiers from feedback for memory %@: %@", buf, 0x16u);

              }
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      }
      while (v15);
    }

    v25 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v28 = v33;
    v29 = v28;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v29, OS_SIGNPOST_INTERVAL_END, spid, "FetchSongIdentifiersWithNegativeFeedback", ", buf, 2u);
    }

    v4 = v36;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "FetchSongIdentifiersWithNegativeFeedback";
      v45 = 2048;
      v46 = (float)((float)((float)((float)(v25 - v32) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

+ (id)songIdentifiersWithNegativeFeedbackForMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "userFeedbackProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "feature") == 6)
  {
    v12 = 0;
    objc_msgSend(v5, "contextAsListOfSongIdentifiersWithError:", &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      PLPhotoKitGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "localIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v10;
        v15 = 2112;
        v16 = v7;
        _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "PHUserFeedbackCalculator: Error parsing song identifiers from feedback for memory %@: %@", buf, 0x16u);

      }
      v8 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

+ (BOOL)_isUserFeedbackFeatureFlagEnabled
{
  return 1;
}

@end
