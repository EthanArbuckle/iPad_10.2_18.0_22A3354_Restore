@implementation GEOAPSequencesManager

- (GEOAPSequencesManager)init
{
  GEOAPSequencesManager *v2;
  id v3;
  void *v4;
  id *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  NSArray *sequences;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)GEOAPSequencesManager;
  v2 = -[GEOAPSequencesManager init](&v11, sel_init);
  if (v2)
  {
    v3 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 2015, 101);
    v4 = v3;
    if (v3)
      *((_QWORD *)v3 + 3) = 0x408C200000000000;
    -[GEOAPSequenceState setName:]((uint64_t)v3, CFSTR("awaiting search results"));
    -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v4, 4, 201);
    v5 = -[GEOAPSequence initWithStartingState:]((id *)[GEOAPSequence alloc], v4);
    -[GEOAPSequence setName:]((uint64_t)v5, CFSTR("search conversion"));
    v6 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 2007, 101);

    if (v6)
      v6[3] = 0x408C200000000000;
    -[GEOAPSequenceState setName:]((uint64_t)v6, CFSTR("awaiting tap list item"));
    -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v6, 4, 201);
    if (v5)
      objc_msgSend(v5[1], "addObject:", v6);
    v7 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 6003, 201);

    if (v7)
    {
      v7[3] = 0x408C200000000000;
      -[GEOAPSequenceState setName:]((uint64_t)v7, CFSTR("awaiting placecard interaction"));
      -[GEOAPSequenceState addAdmissionUserAction:target:]((uint64_t)v7, 6009, 201);
      -[GEOAPSequenceState addAdmissionUserAction:target:]((uint64_t)v7, 6010, 201);
      -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v7, 4, 201);
      *((_DWORD *)v7 + 8) = 1;
      if (!v5)
      {
LABEL_11:
        v12[0] = v5;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
        v8 = objc_claimAutoreleasedReturnValue();
        sequences = v2->_sequences;
        v2->_sequences = (NSArray *)v8;

        return v2;
      }
    }
    else
    {
      -[GEOAPSequenceState setName:](0, CFSTR("awaiting placecard interaction"));
      -[GEOAPSequenceState addAdmissionUserAction:target:](0, 6009, 201);
      -[GEOAPSequenceState addAdmissionUserAction:target:](0, 6010, 201);
      -[GEOAPSequenceState addAbortingUserAction:target:](0, 4, 201);
      if (!v5)
        goto LABEL_11;
    }
    objc_msgSend(v5[1], "addObject:", v7);
    goto LABEL_11;
  }
  return v2;
}

+ (id)sharedManager
{
  objc_opt_self();
  if (qword_254316C30 != -1)
    dispatch_once(&qword_254316C30, &__block_literal_global_7);
  return (id)_MergedGlobals_9;
}

void __38__GEOAPSequencesManager_sharedManager__block_invoke()
{
  GEOAPSequencesManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAPSequencesManager);
  v1 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)v0;

}

- (void)processUserAction:(uint64_t)a3 target:(double)a4 atTime:
{
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __57__GEOAPSequencesManager_processUserAction_target_atTime___block_invoke;
    v23[3] = &unk_250DC0B80;
    v23[4] = &v24;
    objc_msgSend(v8, "shortSessionValues:", v23);

    if (*((_BYTE *)v25 + 24))
    {
      v9 = *(void **)(a1 + 8);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v10);
            -[GEOAPSequence reset](*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v11);
      }

    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = *(id *)(a1 + 8);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
          if (-[GEOAPSequence processUserAction:target:atTime:](v18, a2, a3, a4))
            -[GEOAPSequence reset](v18);
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
      }
      while (v15);
    }

    _Block_object_dispose(&v24, 8);
  }
}

uint64_t __57__GEOAPSequencesManager_processUserAction_target_atTime___block_invoke(uint64_t result, double a2, double a3)
{
  if (*(double *)&processUserAction_target_atTime__sessionCreateTimeInUse != a3)
  {
    processUserAction_target_atTime__sessionCreateTimeInUse = *(_QWORD *)&a3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequences, 0);
}

@end
