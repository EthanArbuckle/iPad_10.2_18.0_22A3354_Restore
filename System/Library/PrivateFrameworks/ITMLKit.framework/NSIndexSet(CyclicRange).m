@implementation NSIndexSet(CyclicRange)

+ (id)indexSetWithIndexesInCyclicRange:()CyclicRange itemCount:
{
  void *v5;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v8 + a4 > a5)
    {
      v10 = a5 - v8;
      objc_msgSend(v9, "addIndexesInRange:", v8, v10);
      v8 = 0;
      a4 -= v10;
    }
    objc_msgSend(v5, "addIndexesInRange:", v8, a4);
  }
  return v5;
}

- (uint64_t)cyclicRangeForItemCount:()CyclicRange includeAllIndexes:
{
  if (a4)
    return objc_msgSend(a1, "_allInclusiveCyclicRangeForItemCount:");
  else
    return objc_msgSend(a1, "_filteredCyclicRangeForItemCount:");
}

- (uint64_t)_filteredCyclicRangeForItemCount:()CyclicRange
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[8];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3010000000;
  v39 = &unk_1D96B5DDD;
  v40 = xmmword_1D96A7A30;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3010000000;
  v34 = &unk_1D96B5DDD;
  v35 = xmmword_1D96A7A30;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3010000000;
  v29 = &unk_1D96B5DDD;
  v30 = xmmword_1D96A7A30;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v5 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke;
  v21[3] = &unk_1E9F4C608;
  v21[4] = &v22;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v21);
  if ((unint64_t)v23[3] < 2)
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_msgSend(a1, "count");
    v7 = (unint64_t)((double)(v6 / (v23[3] - 1)) * 0.5);
  }
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_2;
  v20[3] = &unk_1E9F4C630;
  v20[4] = &v31;
  v20[5] = &v36;
  v20[6] = &v26;
  v20[7] = v7;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v20);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_3;
  v19[3] = &__block_descriptor_40_e20_Q24__0__NSRange_QQ_8l;
  v19[4] = v7;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_4;
  v16[3] = &unk_1E9F4C678;
  v8 = (id)MEMORY[0x1DF092410](v19);
  v17 = v8;
  v18 = a3;
  v9 = MEMORY[0x1DF092410](v16);
  v10 = (void *)v9;
  v11 = v37[5];
  v12 = v27;
  if (!v11 || v32[5] + v11 <= (unint64_t)v27[5])
    goto LABEL_9;
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v9, v37[4]) & 1) == 0)
  {
    v12 = v27;
LABEL_9:
    v13 = v12 + 4;
    goto LABEL_10;
  }
  v13 = v32 + 4;
LABEL_10:
  v14 = *v13;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
  return v14;
}

- (uint64_t)_allInclusiveCyclicRangeForItemCount:()CyclicRange
{
  void *v5;
  uint64_t v6;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__NSIndexSet_CyclicRange___allInclusiveCyclicRangeForItemCount___block_invoke;
  v17[3] = &unk_1E9F4C608;
  v17[4] = &v18;
  objc_msgSend(a1, "enumerateRangesUsingBlock:", v17);
  if (objc_msgSend((id)v19[5], "count") == 1)
  {
    objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeValue");

  }
  else
  {
    v8 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    while (v8 < objc_msgSend((id)v19[5], "count"))
    {
      objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rangeValue");

      if (v8)
        objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", v8 - 1);
      else
        objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", objc_msgSend((id)v19[5], "count") - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeValue");
      v15 = v14;

      v16 = a3 - v11 + v13 + v15;
      if (v13 > v11)
        v16 = v13 + v15 - v11;
      if (v9 >= v16)
      {
        v9 = v16;
        v6 = v11;
      }
      ++v8;
    }
  }
  _Block_object_dispose(&v18, 8);

  return v6;
}

@end
