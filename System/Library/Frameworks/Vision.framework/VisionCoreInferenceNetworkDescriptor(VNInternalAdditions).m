@implementation VisionCoreInferenceNetworkDescriptor(VNInternalAdditions)

- (id)URLForComputeDevice:()VNInternalAdditions error:
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a1, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedComputeDevice:](VNError, "errorForUnsupportedComputeDevice:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)getVNEspressoModelImageprintData:()VNInternalAdditions elementType:elementCount:fromTensorData:descriptor:error:
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t *v34;
  unint64_t *v35;
  id v36;
  _QWORD *v37;
  int64x2_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *__p[3];
  uint64_t v43;
  vImage_Buffer dest;
  int v45;
  vImage_Buffer src;

  v13 = a6;
  v14 = a7;
  objc_msgSend(v14, "shape");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  if ((objc_msgSend(v15, "getOneDimensionalArrayDimensionIndex:error:", &v43, a8) & 1) == 0)
  {
LABEL_23:
    v21 = 0;
    goto LABEL_33;
  }
  v16 = objc_msgSend(v14, "dataType");
  v17 = v16;
  v40 = 1;
  v18 = 4;
  if (v16 == 65552 || v16 == 65568)
    goto LABEL_6;
  if (v16 != 65600)
  {
    if (a8)
    {
      v30 = objc_alloc(MEMORY[0x1E0CB3940]);
      NSStringFromVisionCoreTensorDataType();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("tensor data type %@ is not supported"), v31);

      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", v32);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_23;
  }
  v40 = 2;
  v18 = 8;
LABEL_6:
  v19 = objc_msgSend(v15, "elementCount");
  v20 = v18 * v19;
  if (v20 == objc_msgSend(v14, "storageByteCount"))
  {
    *a3 = (id)objc_msgSend(v13, "copy");
    *a4 = v40;
    *a5 = v19;
    v21 = 1;
    goto LABEL_33;
  }
  v37 = a3;
  v39 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v20));
  v22 = objc_msgSend(v39, "mutableBytes");
  if (!v22)
  {
    if (a8)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v21 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v29 = v39;
    goto LABEL_32;
  }
  v36 = v13;
  v23 = objc_msgSend(v15, "rank");
  v34 = a4;
  v35 = a5;
  src.data = 0;
  std::vector<unsigned long>::vector(__p, v23, &src);
  v24 = objc_msgSend(objc_retainAutorelease(v13), "bytes");
  if (!v19)
  {
LABEL_20:
    v29 = v39;
    *v37 = objc_retainAutorelease(v39);
    *v34 = v40;
    *v35 = v19;
    v21 = 1;
    goto LABEL_27;
  }
  v25 = v24;
  v21 = 0;
  v26 = 0;
  v38 = vdupq_n_s64(1uLL);
  while (1)
  {
    *((_QWORD *)__p[0] + v43) = v26;
    v41 = 0;
    if ((objc_msgSend(v14, "getByteOffset:forPosition:rank:error:", &v41) & 1) == 0)
      break;
    v27 = (_QWORD *)(v25 + v41);
    switch(v17)
    {
      case 65600:
        *(_QWORD *)(v22 + 8 * v26) = *v27;
        break;
      case 65568:
        v28 = *(_DWORD *)v27;
        goto LABEL_18;
      case 65552:
        src.data = (void *)(v25 + v41);
        *(int64x2_t *)&src.height = v38;
        src.rowBytes = 2;
        v45 = 2143289344;
        dest.data = &v45;
        *(int64x2_t *)&dest.height = v38;
        dest.rowBytes = 4;
        vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
        v28 = v45;
LABEL_18:
        *(_DWORD *)(v22 + 4 * v26) = v28;
        break;
    }
    v21 = ++v26 >= v19;
    if (v19 == v26)
      goto LABEL_20;
  }
  v29 = v39;
LABEL_27:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v13 = v36;
LABEL_32:

LABEL_33:
  return v21;
}

- (id)VNEspressoModelImageprintOfClass:()VNInternalAdditions fromData:tensorDescriptor:originatingRequestSpecifier:fromBlock:error:
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, id, uint64_t, uint64_t, id, uint64_t);
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24 = 0;
  v25 = 0;
  v23 = 0;
  LOBYTE(a1) = objc_msgSend(a1, "getVNEspressoModelImageprintData:elementType:elementCount:fromTensorData:descriptor:error:", &v23, &v25, &v24, v14, v15, a8);
  v18 = v23;
  if ((a1 & 1) != 0)
  {
    if (v17)
    {
      v17[2](v17, a3, v18, v25, v24, v16, a8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a3, "printWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:error:", v18, v25, v24, v16, a8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v20;
      if (v20)
        v21 = v20;

    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
