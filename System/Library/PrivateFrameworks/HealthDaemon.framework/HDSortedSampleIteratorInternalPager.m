@implementation HDSortedSampleIteratorInternalPager

uint64_t __144___HDSortedSampleIteratorInternalPager_getSamplesWithQueryDescriptor_sortDescriptors_anchor_limit_includeDeletedObjects_profile_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t *v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;

  v7 = a2;
  v8 = a3;
  v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
    {
      v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v11 = (uint64_t *)v10[7];
      v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        v18 = v10[6];
        v19 = ((uint64_t)v11 - v18) >> 4;
        if ((unint64_t)(v19 + 1) >> 60)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v20 = v12 - v18;
        v21 = (uint64_t)(v12 - v18) >> 3;
        if (v21 <= v19 + 1)
          v21 = v19 + 1;
        if (v20 >= 0x7FFFFFFFFFFFFFF0)
          v22 = 0xFFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        v61 = v10 + 8;
        if (v22)
        {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)(v10 + 8), v22);
          v25 = v24;
        }
        else
        {
          v23 = 0;
          v25 = 0;
        }
        v26 = &v23[16 * v19];
        *(_QWORD *)v26 = a4;
        *((_QWORD *)v26 + 1) = (id)v7;
        v28 = v10[6];
        v27 = v10[7];
        v29 = v26;
        if (v27 != v28)
        {
          v30 = v10[7];
          do
          {
            v31 = *(_QWORD *)(v30 - 16);
            v30 -= 16;
            *((_QWORD *)v29 - 2) = v31;
            v29 -= 16;
            v32 = *(_QWORD *)(v30 + 8);
            *(_QWORD *)(v30 + 8) = 0;
            *((_QWORD *)v29 + 1) = v32;
          }
          while (v30 != v28);
        }
        v13 = v26 + 16;
        v10[6] = v29;
        v10[7] = v13;
        v33 = v10[8];
        v10[8] = &v23[16 * v25];
        v59 = v27;
        v60 = v33;
        v57 = v28;
        v58 = v28;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v57);
      }
      else
      {
        *v11 = a4;
        v11[1] = (uint64_t)(id)v7;
        v13 = v11 + 2;
      }
      v10[7] = v13;
      objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorWithSortDescriptors:followingSample:objectID:", *(_QWORD *)(a1 + 32), v7, a4);
      v34 = objc_claimAutoreleasedReturnValue();
LABEL_40:
      v52 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v53 = *(void **)(v52 + 40);
      *(_QWORD *)(v52 + 40) = v34;

      goto LABEL_41;
    }
    if (v8 && *(_BYTE *)(a1 + 88))
    {
      v14 = *(_QWORD **)(*(_QWORD *)(a1 + 56) + 8);
      v15 = (uint64_t *)v14[7];
      v16 = v14[8];
      if ((unint64_t)v15 >= v16)
      {
        v35 = v14[6];
        v36 = ((uint64_t)v15 - v35) >> 4;
        if ((unint64_t)(v36 + 1) >> 60)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v37 = v16 - v35;
        v38 = (uint64_t)(v16 - v35) >> 3;
        if (v38 <= v36 + 1)
          v38 = v36 + 1;
        if (v37 >= 0x7FFFFFFFFFFFFFF0)
          v39 = 0xFFFFFFFFFFFFFFFLL;
        else
          v39 = v38;
        v61 = v14 + 8;
        if (v39)
        {
          v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HKRawInterval<double>>>((uint64_t)(v14 + 8), v39);
          v42 = v41;
        }
        else
        {
          v40 = 0;
          v42 = 0;
        }
        v43 = &v40[16 * v36];
        *(_QWORD *)v43 = a4;
        *((_QWORD *)v43 + 1) = v9;
        v45 = v14[6];
        v44 = v14[7];
        v46 = v43;
        if (v44 != v45)
        {
          v47 = v14[7];
          do
          {
            v48 = *(_QWORD *)(v47 - 16);
            v47 -= 16;
            *((_QWORD *)v46 - 2) = v48;
            v46 -= 16;
            v49 = *(_QWORD *)(v47 + 8);
            *(_QWORD *)(v47 + 8) = 0;
            *((_QWORD *)v46 + 1) = v49;
          }
          while (v47 != v45);
        }
        v17 = v43 + 16;
        v14[6] = v46;
        v14[7] = v17;
        v50 = v14[8];
        v14[8] = &v40[16 * v42];
        v59 = v44;
        v60 = v50;
        v57 = v45;
        v58 = v45;
        std::__split_buffer<std::tuple<long long,HKSample * {__strong}>>::~__split_buffer((uint64_t)&v57);
      }
      else
      {
        *v15 = a4;
        v15[1] = (uint64_t)(id)v8;
        v17 = v15 + 2;
      }
      v14[7] = v17;
      if (*(_QWORD *)(a1 + 32))
        v51 = *(_QWORD *)(a1 + 32);
      else
        v51 = MEMORY[0x1E0C9AA60];
      objc_msgSend(MEMORY[0x1E0CB6C10], "sortedQueryAnchorWithSortDescriptors:objectID:", v51, a4);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), CFSTR("_HDSortedSampleIteratorInternalPager.mm"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sample != nil || deletedObject != nil"));

  }
LABEL_41:
  v54 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_QWORD *)(v54 + 24) < a4)
    *(_QWORD *)(v54 + 24) = a4;

  return 1;
}

@end
