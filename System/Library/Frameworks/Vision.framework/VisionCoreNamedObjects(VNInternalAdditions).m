@implementation VisionCoreNamedObjects(VNInternalAdditions)

- (uint64_t)VNEnumerateFloatValuesAtIndexes:()VNInternalAdditions asTensor:usingBlock:error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  if ((objc_msgSend(v13, "getOneDimensionalArrayDimensionIndex:error:", &v32, a6) & 1) == 0)
    goto LABEL_10;
  v14 = objc_msgSend(v13, "elementCount");
  v15 = objc_msgSend(v10, "firstIndex");
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_msgSend(v10, "lastIndex");
    if (v15 < v14 && v17 < v14)
    {
      v18 = objc_msgSend(v11, "dataType");
      v19 = objc_msgSend(v13, "rank");
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __105__VisionCoreNamedObjects_VNInternalAdditions__VNEnumerateFloatValuesAtIndexes_asTensor_usingBlock_error___block_invoke;
      aBlock[3] = &unk_1E4545D68;
      v29 = v19;
      v26 = v10;
      v30 = v32;
      v20 = v11;
      v27 = v20;
      v31 = v18;
      v28 = v12;
      v21 = _Block_copy(aBlock);
      objc_msgSend(v20, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(a1, "accessReadOnlyDataForName:usingBlock:error:", v22, v21, a6);

      v23 = v26;
LABEL_9:

      goto LABEL_11;
    }
    if (a6)
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Value indexes of %@ are out of bounds of [0..%ld]"), v10, v14 - 1);
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v23);
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (uint64_t)VNGetConfidenceValue:()VNInternalAdditions asTensor:error:
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v8 = a4;
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "elementCount");

  if (v10 == 1)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__VisionCoreNamedObjects_VNInternalAdditions__VNGetConfidenceValue_asTensor_error___block_invoke;
    aBlock[3] = &unk_1E4545D90;
    aBlock[4] = &v16;
    v11 = _Block_copy(aBlock);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 0);
    a5 = objc_msgSend(a1, "VNEnumerateFloatValuesAtIndexes:asTensor:usingBlock:error:", v12, v8, v11, a5);

    if ((a5 & 1) != 0)
      *a3 = *((_DWORD *)v17 + 6);

    _Block_object_dispose(&v16, 8);
  }
  else if (a5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ does not provide a single confidence value"), v8);
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v13);
    *(_QWORD *)a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

@end
