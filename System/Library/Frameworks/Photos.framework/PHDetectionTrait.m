@implementation PHDetectionTrait

- (PHDetectionTrait)initWithType:(signed __int16)a3 value:(signed __int16)a4 score:(double)a5 startTime:(double)a6 duration:(double)a7
{
  PHDetectionTrait *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PHDetectionTrait;
  result = -[PHDetectionTrait init](&v13, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_value = a4;
    result->_score = a5;
    result->_startTime = a6;
    result->_duration = a7;
  }
  return result;
}

- (PHDetectionTrait)initWithPropertyListRepresentation:(id)a3
{
  id v5;
  void *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  PHDetectionTrait *v18;
  void *v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHDetectionTrait.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("plist"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("startTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = -[PHDetectionTrait initWithType:value:score:startTime:duration:](self, "initWithType:value:score:startTime:duration:", v7, v9, v12, v15, v17);

  return v18;
}

- (id)propertyListRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PHDetectionTrait type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[PHDetectionTrait value](self, "value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("value"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PHDetectionTrait score](self, "score");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("score"));

  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[PHDetectionTrait startTime](self, "startTime");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("startTime"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[PHDetectionTrait duration](self, "duration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("duration"));

  return v3;
}

- (signed)type
{
  return self->_type;
}

- (signed)value
{
  return self->_value;
}

- (double)score
{
  return self->_score;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

+ (id)detectionTraitsForDetection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9867;
  v18 = __Block_byref_object_dispose__9868;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PHDetectionTrait_detectionTraitsForDetection___block_invoke;
  v10[3] = &unk_1E35DEE50;
  v6 = v5;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3
{
  return (id)objc_msgSend(a1, "detectionTraitsByFaceLocalIdentifierForFaces:withDetectionTraitTypes:", a3, 0);
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaces:(id)a3 withDetectionTraitTypes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "uuid", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        if (!v12)
          v12 = v15;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);

    if (!v12)
    {
      v18 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_15;
    }
    objc_msgSend(v12, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "detectionTraitsByFaceLocalIdentifierForFaceUUIDs:photoLibrary:withDetectionTraitTypes:", v8, v17, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0C9AA70];
    v12 = v9;
  }

LABEL_15:
  return v18;
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4
{
  return (id)objc_msgSend(a1, "detectionTraitsByFaceLocalIdentifierForFaceUUIDs:photoLibrary:withDetectionTraitTypes:", a3, a4, 0);
}

+ (id)detectionTraitsByFaceLocalIdentifierForFaceUUIDs:(id)a3 photoLibrary:(id)a4 withDetectionTraitTypes:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9867;
  v25 = __Block_byref_object_dispose__9868;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke;
  v16[3] = &unk_1E35DEB38;
  v11 = v7;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  BOOL v12;
  id v13;

  v2 = a1[4];
  v3 = a1[5];
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D716E0], "fetchDetectionTraitByFaceUUIDWithFaceUUIDs:library:error:", v2, v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v4)
  {
    v6 = (void *)a1[6];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke_2;
    v9[3] = &unk_1E35D7B50;
    v12 = v6 != 0;
    v7 = v6;
    v8 = a1[7];
    v10 = v7;
    v11 = v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __106__PHDetectionTrait_detectionTraitsByFaceLocalIdentifierForFaceUUIDs_photoLibrary_withDetectionTraitTypes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  PHDetectionTrait *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  PHDetectionTrait *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PHObject localIdentifierWithUUID:](PHFace, "localIdentifierWithUUID:", a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
        if (!*(_BYTE *)(a1 + 48)
          || (v13 = *(void **)(a1 + 32),
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "type")), v14 = (void *)objc_claimAutoreleasedReturnValue(), LODWORD(v13) = objc_msgSend(v13, "containsObject:", v14), v14, (_DWORD)v13))
        {
          v15 = [PHDetectionTrait alloc];
          v16 = objc_msgSend(v12, "type");
          v17 = objc_msgSend(v12, "value");
          objc_msgSend(v12, "score");
          v19 = v18;
          objc_msgSend(v12, "startTime");
          v21 = v20;
          objc_msgSend(v12, "duration");
          v23 = -[PHDetectionTrait initWithType:value:score:startTime:duration:](v15, "initWithType:value:score:startTime:duration:", v16, v17, v19, v21, v22);
          objc_msgSend(v6, "addObject:", v23);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v6, v24);
}

void __48__PHDetectionTrait_detectionTraitsForDetection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PHDetectionTrait *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  PHDetectionTrait *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 40), "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("self == %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v8);

  v27 = v5;
  v28 = v2;
  objc_msgSend(v2, "executeFetchRequest:error:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = v10;
  objc_msgSend(v10, "detectionTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v17 = [PHDetectionTrait alloc];
        v18 = objc_msgSend(v16, "type");
        v19 = objc_msgSend(v16, "value");
        objc_msgSend(v16, "score");
        v21 = v20;
        objc_msgSend(v16, "startTime");
        v23 = v22;
        objc_msgSend(v16, "duration");
        v25 = -[PHDetectionTrait initWithType:value:score:startTime:duration:](v17, "initWithType:value:score:startTime:duration:", v18, v19, v21, v23, v24);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v25);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v13);
  }

}

@end
