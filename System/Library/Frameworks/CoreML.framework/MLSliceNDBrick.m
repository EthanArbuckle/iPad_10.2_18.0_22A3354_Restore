@implementation MLSliceNDBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  unint64_t rank;
  void *v14;
  unint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *exception;
  id v30;
  void *__p[3];
  void *v32[3];
  void *v33[3];
  void *v34[3];
  void *v35[3];
  void *v36;
  _BYTE *v37;
  void *v38;
  _BYTE *v39;
  void *v40[3];
  uint64_t *v41[4];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  LODWORD(a4) = self->_rank;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rank");

  if ((_DWORD)a4 != v11)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "SliceND layer: mismatch between rank of the input and the length of 'begin ids' parameter");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  std::vector<unsigned long>::vector(v41, self->_rank);
  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v12, v41);

  }
  else
  {
    rank = self->_rank;
    v30 = v7;
    std::vector<unsigned long>::vector(v40, rank);
    std::vector<long long>::vector(&v38, rank);
    std::vector<long long>::vector(&v36, rank);
    std::vector<BOOL>::vector(v35, rank);
    std::vector<BOOL>::vector(v34, rank);
    std::vector<long long>::vector(v33, rank);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v14, (uint64_t)v40);

    if ((_DWORD)rank)
    {
      for (i = 0; i != rank; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](self->_begin_ids, "objectAtIndexedSubscript:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");
        *((_QWORD *)v38 + i) = v17;

        -[NSArray objectAtIndexedSubscript:](self->_end_ids, "objectAtIndexedSubscript:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");
        *((_QWORD *)v36 + i) = v19;

        -[NSArray objectAtIndexedSubscript:](self->_begin_masks, "objectAtIndexedSubscript:", i);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = i >> 6;
        v22 = 1 << i;
        if (objc_msgSend(v20, "BOOLValue"))
          v23 = *((_QWORD *)v35[0] + v21) | v22;
        else
          v23 = *((_QWORD *)v35[0] + v21) & ~v22;
        *((_QWORD *)v35[0] + v21) = v23;

        -[NSArray objectAtIndexedSubscript:](self->_end_masks, "objectAtIndexedSubscript:", i);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "BOOLValue"))
          v25 = *((_QWORD *)v34[0] + v21) | v22;
        else
          v25 = *((_QWORD *)v34[0] + v21) & ~v22;
        *((_QWORD *)v34[0] + v21) = v25;

        -[NSArray objectAtIndexedSubscript:](self->_strides, "objectAtIndexedSubscript:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "integerValue");
        *((_QWORD *)v33[0] + i) = v27;

      }
    }
    memset(v32, 0, sizeof(v32));
    v7 = v30;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v32, v38, (uint64_t)v39, (v39 - (_BYTE *)v38) >> 3);
    memset(__p, 0, sizeof(__p));
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(__p, v36, (uint64_t)v37, (v37 - (_BYTE *)v36) >> 3);
    BrickLayers::SliceNDShapeComputation((uint64_t)v32, (uint64_t)__p, (uint64_t)v33, (uint64_t *)v35, (uint64_t *)v34, (uint64_t *)v40, v41);
    if (__p[0])
      operator delete(__p[0]);
    if (v32[0])
      operator delete(v32[0]);
    if (v33[0])
    {
      v33[1] = v33[0];
      operator delete(v33[0]);
    }
    if (v34[0])
      operator delete(v34[0]);
    if (v35[0])
      operator delete(v35[0]);
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v38)
    {
      v39 = v38;
      operator delete(v38);
    }
    if (v40[0])
    {
      v40[1] = v40[0];
      operator delete(v40[0]);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape(v41, v9);
  objc_msgSend(v8, "addObject:", v9);
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }

  return v8;
}

- (MLSliceNDBrick)initWithParameters:(id)a3
{
  id v4;
  MLSliceNDBrick *v5;
  uint64_t v6;
  NSArray *begin_ids;
  uint64_t v8;
  NSArray *begin_masks;
  uint64_t v10;
  NSArray *end_ids;
  uint64_t v12;
  NSArray *end_masks;
  uint64_t v14;
  NSArray *strides;
  uint64_t v16;
  NSArray *inputRanks;
  uint64_t v18;
  NSArray *outputRanks;
  uint64_t v20;
  NSArray *inputShapes;
  uint64_t v22;
  NSArray *outputShapes;
  NSArray *v24;
  unsigned int i;
  void *v26;
  uint64_t v27;
  NSArray *v28;
  unsigned int j;
  void *v30;
  uint64_t v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MLSliceNDBrick;
  v5 = -[MLSliceNDBrick init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("begin_ids"));
    v6 = objc_claimAutoreleasedReturnValue();
    begin_ids = v5->_begin_ids;
    v5->_begin_ids = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("begin_masks"));
    v8 = objc_claimAutoreleasedReturnValue();
    begin_masks = v5->_begin_masks;
    v5->_begin_masks = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_ids"));
    v10 = objc_claimAutoreleasedReturnValue();
    end_ids = v5->_end_ids;
    v5->_end_ids = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_masks"));
    v12 = objc_claimAutoreleasedReturnValue();
    end_masks = v5->_end_masks;
    v5->_end_masks = (NSArray *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("strides"));
    v14 = objc_claimAutoreleasedReturnValue();
    strides = v5->_strides;
    v5->_strides = (NSArray *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputRanks"));
    v16 = objc_claimAutoreleasedReturnValue();
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputRanks"));
    v18 = objc_claimAutoreleasedReturnValue();
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v20 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v22 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v22;

    v5->_shapeInfoNeeded = 0;
    v24 = v5->_inputRanks;
    if (v24)
    {
      for (i = 0; -[NSArray count](v24, "count") > i; ++i)
      {
        -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", i);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "integerValue");

        if (v27 >= 6)
          v5->_shapeInfoNeeded = 1;
        v24 = v5->_inputRanks;
      }
    }
    v28 = v5->_outputRanks;
    if (v28)
    {
      for (j = 0; -[NSArray count](v28, "count") > j; ++j)
      {
        -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", j);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "integerValue");

        if (v31 >= 6)
          v5->_shapeInfoNeeded = 1;
        v28 = v5->_outputRanks;
      }
    }
    v5->_rank = -[NSArray count](v5->_begin_ids, "count");
  }

  return v5;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t rank;
  unint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t *v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t *v37;
  int *v38;
  uint64_t v39;
  _BYTE *v40;
  char *v41;
  _BYTE *v42;
  unint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  unint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  void *exception;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _BYTE *v76;
  _BYTE *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  _QWORD *v88;
  void *v89;
  void *v90;
  void *v91[3];
  void *v92[3];
  void *v93[3];
  void *v94;
  _BYTE *v95;
  void *v96;
  _BYTE *v97;
  void *__p;
  void *v99;
  uint64_t v100;
  unint64_t *v101;
  unint64_t *v102;
  uint64_t *v103;
  uint64_t *v104;
  _QWORD *v105;
  uint64_t v106;
  void *v107;
  _BYTE *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;

  v6 = a3;
  v7 = a4;
  v75 = v6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawPointer");

  rank = self->_rank;
  std::vector<long long>::vector(&v96, rank);
  std::vector<long long>::vector(&v94, rank);
  std::vector<BOOL>::vector(v93, rank);
  std::vector<BOOL>::vector(v92, rank);
  v74 = v7;
  std::vector<long long>::vector(v91, rank);
  if ((_DWORD)rank)
  {
    for (i = 0; i != rank; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_begin_ids, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");
      *((_QWORD *)v96 + i) = v13;

      -[NSArray objectAtIndexedSubscript:](self->_end_ids, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");
      *((_QWORD *)v94 + i) = v15;

      -[NSArray objectAtIndexedSubscript:](self->_begin_masks, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = i >> 6;
      v18 = 1 << i;
      if (objc_msgSend(v16, "BOOLValue"))
        v19 = *((_QWORD *)v93[0] + v17) | v18;
      else
        v19 = *((_QWORD *)v93[0] + v17) & ~v18;
      *((_QWORD *)v93[0] + v17) = v19;

      -[NSArray objectAtIndexedSubscript:](self->_end_masks, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "BOOLValue"))
        v21 = *((_QWORD *)v92[0] + v17) | v18;
      else
        v21 = *((_QWORD *)v92[0] + v17) & ~v18;
      *((_QWORD *)v92[0] + v17) = v21;

      -[NSArray objectAtIndexedSubscript:](self->_strides, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");
      *((_QWORD *)v91[0] + i) = v23;

    }
  }
  std::vector<unsigned long>::vector(&v89, rank);
  std::vector<unsigned long>::vector(&v87, rank);
  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v24, &v89);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v25, (uint64_t)&v89);

  }
  v84 = 0;
  v85 = 0;
  v86 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v84, v96, (uint64_t)v97, (v97 - (_BYTE *)v96) >> 3);
  v81 = 0;
  v82 = 0;
  v83 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v81, v94, (uint64_t)v95, (v95 - (_BYTE *)v94) >> 3);
  v114 = 0;
  v115 = 0;
  v113 = 0;
  v26 = v84;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v113, v84, v85, (v85 - (uint64_t)v84) >> 3);
  v110 = 0;
  v111 = 0;
  v112 = 0;
  v27 = v81;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&v110, v81, v82, (v82 - (uint64_t)v81) >> 3);
  BrickLayers::SliceNDShapeComputation((uint64_t)&v113, (uint64_t)&v110, (uint64_t)v91, (uint64_t *)v93, (uint64_t *)v92, (uint64_t *)&v89, (_QWORD **)&v87);
  if (v110)
  {
    v111 = v110;
    operator delete(v110);
  }
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  v109 = 0;
  v79 = v89;
  v80 = v90;
  v28 = ((_BYTE *)v90 - (_BYTE *)v89) >> 3;
  std::vector<unsigned long>::vector(&v107, v28);
  std::vector<unsigned long>::vector(&v105, v28);
  std::vector<unsigned long>::vector(&v103, v28);
  std::vector<unsigned long>::vector(&v101, v28);
  if (v80 == v79)
    goto LABEL_42;
  v29 = 0;
  v30 = (char *)v93[0];
  v31 = (uint64_t *)v91[0];
  v32 = (int *)v89;
  if (v28 <= 1)
    v33 = 1;
  else
    v33 = v28;
  do
  {
    if (((*(_QWORD *)&v30[(v29 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v29) & 1) != 0)
    {
      if (v31[v29] <= 0)
        v34 = *(_QWORD *)&v32[2 * v29] - 1;
      else
        LODWORD(v34) = 0;
      v34 = (int)v34;
    }
    else
    {
      v34 = v26[v29];
      if ((v34 & 0x8000000000000000) == 0)
        goto LABEL_29;
      v34 += v32[2 * v29];
    }
    v26[v29] = v34;
    if (v34 < 0)
      goto LABEL_102;
LABEL_29:
    if (v34 >= v32[2 * v29])
    {
LABEL_102:
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A1AD5E28](exception, "SliceND layer: Invalid values in begin_ids.");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    ++v29;
  }
  while (v33 != v29);
  v35 = 0;
  v36 = (char *)v92[0];
  v37 = (uint64_t *)v91[0];
  v38 = (int *)v89;
  do
  {
    if (((*(_QWORD *)&v36[(v35 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v35) & 1) != 0)
    {
      if (v37[v35] < 1)
        LODWORD(v39) = -1;
      else
        v39 = *(_QWORD *)&v38[2 * v35];
      v39 = (int)v39;
      v27[v35] = (int)v39;
    }
    else
    {
      v39 = v27[v35];
      if (v39 < 0)
      {
        v39 += v38[2 * v35];
        v27[v35] = v39;
        if (v39 < 0)
        {
LABEL_103:
          v72 = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x1A1AD5E28](v72, "SliceND layer: Invalid values in end_ids.");
          __cxa_throw(v72, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
      }
    }
    if (v39 > v38[2 * v35])
      goto LABEL_103;
    ++v35;
  }
  while (v33 != v35);
LABEL_42:
  v40 = v87;
  if (v87 == v88)
  {
    v42 = v87;
  }
  else
  {
    v41 = (char *)v87 + 8;
    v42 = v87;
    if ((char *)v87 + 8 != (char *)v88)
    {
      v43 = *(_QWORD *)v87;
      v42 = v87;
      v44 = (char *)v87 + 8;
      do
      {
        v46 = *(_QWORD *)v44;
        v44 += 8;
        v45 = v46;
        v47 = v43 >= v46;
        if (v43 <= v46)
          v43 = v45;
        if (!v47)
          v42 = v41;
        v41 = v44;
      }
      while (v44 != (char *)v88);
    }
  }
  v48 = 1;
  if (v87 != v88)
  {
    v49 = (uint64_t *)v87;
    do
    {
      v50 = *v49++;
      v48 *= v50;
    }
    while (v49 != v88);
  }
  v78 = v48;
  v73 = v27;
  TensorAlgebraUtils::computeStrides((uint64_t)v89, (uint64_t)v90, (uint64_t)v107, (uint64_t)v108);
  TensorAlgebraUtils::computeStrides((uint64_t)v87, (uint64_t)v88, (uint64_t)v105, v106);
  v51 = v78;
  if (v78)
  {
    v52 = 0;
    v53 = (v42 - v40) >> 3;
    v76 = v42;
    if (v28 <= 1)
      v54 = 1;
    else
      v54 = v28;
    v55 = v105;
    v77 = v40;
    do
    {
      if (v55[v53])
      {
        v56 = 0;
        do
        {
          TensorAlgebraUtils::unravel_index(v56 + v52, (uint64_t)v87, (uint64_t)v88, v101, (uint64_t)v102);
          if (v80 != v79)
          {
            v57 = v101;
            v58 = (uint64_t *)v91[0];
            v59 = (uint64_t *)v89;
            v60 = v26;
            v61 = v54;
            v62 = v103;
            do
            {
              v64 = *v57++;
              v63 = v64;
              v66 = *v58++;
              v65 = v66;
              v67 = *v60++;
              v68 = v67 + v65 * v63;
              if (v68 < 0 || v68 >= *v59)
              {
                v70 = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x1A1AD5E28](v70, "SliceND layer: Invalid values in arguments (begin_ids, end_ids, strides)");
                __cxa_throw(v70, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
              }
              *v62++ = v68;
              ++v59;
              --v61;
            }
            while (v61);
          }
          __p = 0;
          v99 = 0;
          v100 = 0;
          std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v107, (uint64_t)v108, (v108 - (_BYTE *)v107) >> 3);
          TensorAlgebraUtils::ravel_multi_index(v103, (uint64_t)v104, (uint64_t)v89, (uint64_t)v90, (uint64_t *)__p, &v109);
          if (__p)
          {
            v99 = __p;
            operator delete(__p);
          }
          cblas_scopy_NEWLAPACK();
          ++v56;
          v55 = v105;
        }
        while (v56 < v105[v53]);
        v42 = v76;
        v40 = v77;
        v51 = v78;
      }
      v69 = v51;
      if (v42 != v40)
        v69 = v55[v53 - 1];
      v52 += v69;
    }
    while (v52 < v51);
  }
  if (v101)
  {
    v102 = v101;
    operator delete(v101);
  }
  if (v103)
  {
    v104 = v103;
    operator delete(v103);
  }
  if (v105)
  {
    v106 = (uint64_t)v105;
    operator delete(v105);
  }
  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  if (v73)
    operator delete(v73);
  if (v26)
    operator delete(v26);
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
  if (v91[0])
  {
    v91[1] = v91[0];
    operator delete(v91[0]);
  }
  if (v92[0])
    operator delete(v92[0]);
  if (v93[0])
    operator delete(v93[0]);
  if (v94)
  {
    v95 = v94;
    operator delete(v94);
  }
  if (v96)
  {
    v97 = v96;
    operator delete(v96);
  }

}

- (int)rank
{
  return self->_rank;
}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (NSArray)begin_ids
{
  return self->_begin_ids;
}

- (NSArray)begin_masks
{
  return self->_begin_masks;
}

- (NSArray)end_ids
{
  return self->_end_ids;
}

- (NSArray)end_masks
{
  return self->_end_masks;
}

- (NSArray)strides
{
  return self->_strides;
}

- (NSArray)inputRanks
{
  return self->_inputRanks;
}

- (NSArray)outputRanks
{
  return self->_outputRanks;
}

- (NSArray)inputShapes
{
  return self->_inputShapes;
}

- (NSArray)outputShapes
{
  return self->_outputShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputShapes, 0);
  objc_storeStrong((id *)&self->_inputShapes, 0);
  objc_storeStrong((id *)&self->_outputRanks, 0);
  objc_storeStrong((id *)&self->_inputRanks, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_end_masks, 0);
  objc_storeStrong((id *)&self->_end_ids, 0);
  objc_storeStrong((id *)&self->_begin_masks, 0);
  objc_storeStrong((id *)&self->_begin_ids, 0);
}

@end
