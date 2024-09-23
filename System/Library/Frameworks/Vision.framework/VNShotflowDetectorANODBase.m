@implementation VNShotflowDetectorANODBase

- (id)mergeHeadsBoxes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  float v19;
  float v20;
  unint64_t j;
  void *v22;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_140);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_141_10660);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(v5, "count");
  if (v11)
  {
    v13 = v12;
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_11;
      v16 = 0;
      v17 = 1;
      do
      {
        while (!v17)
        {
          v17 = 0;
          if (++v16 == v13)
            goto LABEL_12;
        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "intersectionOverArea:", v18);
        v20 = v19;
        v17 = v19 <= 0.8;

        ++v16;
      }
      while (v16 != v13);
      if (v20 <= 0.8)
LABEL_11:
        objc_msgSend(v26, "addObject:", v15);
LABEL_12:

    }
  }
  for (j = 0; j < objc_msgSend(v7, "count"); ++j)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", j);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v22);

  }
  return v26;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") != 2;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 1;
}

BOOL __46__VNShotflowDetectorANODBase_mergeHeadsBoxes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label") == 2;
}

@end
