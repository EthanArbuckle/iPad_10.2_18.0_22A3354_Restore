@implementation MLBatchedMatMulBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *__p;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  _BYTE *v24;
  uint64_t *v25[3];

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(v25, objc_msgSend(v8, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v9, v25);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(&v23, objc_msgSend(v10, "unsignedIntegerValue"));

    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    std::vector<unsigned long>::vector(&v21, objc_msgSend(v11, "unsignedIntegerValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v12, (uint64_t)&v23);

    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v13, (uint64_t)&v21);

    v18 = 0;
    v19 = 0;
    v20 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v18, v23, (uint64_t)v24, (v24 - (_BYTE *)v23) >> 3);
    LODWORD(v13) = -[NSNumber BOOLValue](self->_transposeA, "BOOLValue");
    __p = 0;
    v16 = 0;
    v17 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v21, (uint64_t)v22, (v22 - (_BYTE *)v21) >> 3);
    BrickLayers::BatchedMatMulShapeComputation((char **)&v18, (int)v13, (char **)&__p, -[NSNumber BOOLValue](self->_transposeB, "BOOLValue"), v25);
    if (__p)
    {
      v16 = __p;
      operator delete(__p);
    }
    if (v18)
    {
      v19 = v18;
      operator delete(v18);
    }
    if (v21)
    {
      v22 = v21;
      operator delete(v21);
    }
    if (v23)
    {
      v24 = v23;
      operator delete(v23);
    }
  }
  EspressoBrickUtils::NDShape_to_EspressoShape(v25, v7);
  objc_msgSend(v6, "addObject:", v7);
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }

  return v6;
}

- (MLBatchedMatMulBrick)initWithParameters:(id)a3
{
  id v4;
  MLBatchedMatMulBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  uint64_t v14;
  NSNumber *transposeA;
  uint64_t v16;
  NSNumber *transposeB;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  unsigned int i;
  void *v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MLBatchedMatMulBrick;
  v5 = -[MLBatchedMatMulBrick init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputRanks"));
    v6 = objc_claimAutoreleasedReturnValue();
    inputRanks = v5->_inputRanks;
    v5->_inputRanks = (NSArray *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputRanks"));
    v8 = objc_claimAutoreleasedReturnValue();
    outputRanks = v5->_outputRanks;
    v5->_outputRanks = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputShapes"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputShapes = v5->_inputShapes;
    v5->_inputShapes = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("outputShapes"));
    v12 = objc_claimAutoreleasedReturnValue();
    outputShapes = v5->_outputShapes;
    v5->_outputShapes = (NSArray *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transposeA"));
    v14 = objc_claimAutoreleasedReturnValue();
    transposeA = v5->_transposeA;
    v5->_transposeA = (NSNumber *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("transposeB"));
    v16 = objc_claimAutoreleasedReturnValue();
    transposeB = v5->_transposeB;
    v5->_transposeB = (NSNumber *)v16;

    v18 = 0;
    v5->_shapeInfoNeeded = 0;
    while (-[NSArray count](v5->_inputRanks, "count") > v18)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_inputRanks, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

      if (v20 >= 6)
        v5->_shapeInfoNeeded = 1;
      ++v18;
    }
    for (i = 0; -[NSArray count](v5->_outputRanks, "count") > i; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](v5->_outputRanks, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      if (v23 >= 6)
        v5->_shapeInfoNeeded = 1;
    }
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  char *v69;
  unint64_t v70;
  void *v71;
  _BYTE *v72;
  uint64_t v73;
  void *v74;
  uint64_t *v75;
  void *v76;
  _BYTE *v77;
  void *v78;
  _BYTE *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *__p;
  void *v84;
  uint64_t v85;
  void *v86;
  char *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawPointer");

  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v78, objc_msgSend(v11, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v76, objc_msgSend(v12, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v74, objc_msgSend(v13, "unsignedIntegerValue"));

  if (self->_shapeInfoNeeded)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v14, &v78);

    -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::NSShape_to_VecShape(v15, &v76);
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shape");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v17, (uint64_t)&v78);

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    EspressoBrickUtils::EspressoShape_to_NDShape(v18, (uint64_t)&v76);

  }
  v71 = 0;
  v72 = 0;
  v73 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v71, v78, (uint64_t)v79, (v79 - (_BYTE *)v78) >> 3);
  v19 = -[NSNumber BOOLValue](self->_transposeA, "BOOLValue");
  v68 = 0;
  v69 = 0;
  v70 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v68, v76, (uint64_t)v77, (v77 - (_BYTE *)v76) >> 3);
  v20 = -[NSNumber BOOLValue](self->_transposeB, "BOOLValue");
  v102 = 0;
  v103 = 0;
  v101 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v101, v71, (uint64_t)v72, (v72 - (_BYTE *)v71) >> 3);
  v98 = 0;
  v99 = 0;
  v100 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v98, v68, (uint64_t)v69, (v69 - (_BYTE *)v68) >> 3);
  BrickLayers::BatchedMatMulShapeComputation(&v101, v19, &v98, v20, &v74);
  if (v98)
  {
    v99 = v98;
    operator delete(v98);
  }
  if (v101)
  {
    v102 = v101;
    operator delete(v101);
  }
  if (v72 - (_BYTE *)v71 == 8)
  {
    v94 = 1;
    std::vector<unsigned long>::insert((uint64_t)&v71, (char *)v71, &v94);
  }
  v22 = (char *)v68;
  v21 = v69;
  v23 = (v69 - (_BYTE *)v68) >> 3;
  if (v69 - (_BYTE *)v68 == 8)
  {
    if ((unint64_t)v69 >= v70)
    {
      v24 = v70 - (_QWORD)v68;
      if ((uint64_t)(v70 - (_QWORD)v68) >> 2 <= v23 + 1)
        v25 = v23 + 1;
      else
        v25 = v24 >> 2;
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
        v26 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v26 = v25;
      v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v70, v26);
      v28 = (char *)v68;
      v29 = v69;
      v30 = &v27[8 * v23];
      v32 = &v27[8 * v31];
      *(_QWORD *)v30 = 1;
      v21 = v30 + 8;
      while (v29 != v28)
      {
        v33 = *((_QWORD *)v29 - 1);
        v29 -= 8;
        *((_QWORD *)v30 - 1) = v33;
        v30 -= 8;
      }
      v68 = v30;
      v69 = v21;
      v70 = (unint64_t)v32;
      if (v28)
        operator delete(v28);
    }
    else
    {
      *(_QWORD *)v69 = 1;
      v21 += 8;
    }
    v69 = v21;
    v22 = (char *)v68;
    v23 = (v21 - (_BYTE *)v68) >> 3;
  }
  v64 = v71;
  v65 = v72;
  v34 = v72 - (_BYTE *)v71;
  v36 = v74;
  v35 = v75;
  v37 = -2;
  if (v19)
    v38 = -1;
  else
    v38 = -2;
  v67 = *((_QWORD *)v71 + v38 + (v34 >> 3));
  if (!v20)
    v37 = -1;
  v66 = *(_QWORD *)&v22[8 * v23 + 8 * v37];
  v39 = v34 >> 3;
  v96 = 0;
  v97 = 0;
  std::vector<unsigned long>::vector(&v94, v34 >> 3);
  v61 = v7;
  std::vector<unsigned long>::vector(&v92, v23);
  std::vector<unsigned long>::vector(&v90, v39);
  std::vector<unsigned long>::vector(&v88, v23);
  v40 = ((char *)v35 - v36) >> 3;
  std::vector<unsigned long>::vector(&v86, v40);
  v41 = (uint64_t *)v74;
  v42 = 1;
  while (v41 != v75)
  {
    v43 = *v41++;
    v42 *= v43;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v71, (uint64_t)v72, v94, v95);
  TensorAlgebraUtils::computeStrides((uint64_t)v68, (uint64_t)v69, (uint64_t)v92, (uint64_t)v93);
  if (v42)
  {
    v44 = 0;
    v45 = v39;
    v46 = v40 - v39;
    v47 = v40 - v23;
    if (v45 <= 1)
      v48 = 1;
    else
      v48 = v45;
    if (v23 <= 1)
      v49 = 1;
    else
      v49 = v23;
    v62 = v49;
    v63 = v48;
    do
    {
      TensorAlgebraUtils::unravel_index(v44, (uint64_t)v74, (uint64_t)v75, (unint64_t *)v86, (uint64_t)v87);
      v50 = (char *)v86;
      v51 = (char *)v86 + 8 * v46;
      if (v87 != v51)
      {
        memmove(v90, v51, v87 - v51);
        v50 = (char *)v86;
        v51 = v87;
      }
      v52 = &v50[8 * v47];
      if (v51 != v52)
        memmove(v88, v52, v51 - v52);
      if (v65 != v64)
      {
        v53 = (uint64_t *)v71;
        v54 = v90;
        v55 = v63;
        do
        {
          v56 = *v53++;
          if (v56 == 1)
            *v54 = 0;
          ++v54;
          --v55;
        }
        while (v55);
      }
      if (v21 != v22)
      {
        v57 = (uint64_t *)v68;
        v58 = v88;
        v59 = v62;
        do
        {
          v60 = *v57++;
          if (v60 == 1)
            *v58 = 0;
          ++v58;
          --v59;
        }
        while (v59);
      }
      __p = 0;
      v84 = 0;
      v85 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, (const void *)v94, v95, (v95 - v94) >> 3);
      TensorAlgebraUtils::ravel_multi_index((uint64_t *)v90, v91, (uint64_t)v71, (uint64_t)v72, (uint64_t *)__p, &v97);
      if (__p)
      {
        v84 = __p;
        operator delete(__p);
      }
      v80 = 0;
      v81 = 0;
      v82 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v80, v92, (uint64_t)v93, (v93 - (_BYTE *)v92) >> 3);
      TensorAlgebraUtils::ravel_multi_index((uint64_t *)v88, v89, (uint64_t)v68, (uint64_t)v69, (uint64_t *)v80, &v96);
      if (v80)
      {
        v81 = v80;
        operator delete(v80);
      }
      cblas_sgemm_NEWLAPACK();
      v44 += v66 * v67;
    }
    while (v44 < v42);
  }
  if (v86)
  {
    v87 = (char *)v86;
    operator delete(v86);
  }
  if (v88)
  {
    v89 = (uint64_t)v88;
    operator delete(v88);
  }
  if (v90)
  {
    v91 = (uint64_t)v90;
    operator delete(v90);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  if (v94)
  {
    v95 = v94;
    operator delete((void *)v94);
  }
  if (v68)
  {
    v69 = (char *)v68;
    operator delete(v68);
  }
  if (v71)
  {
    v72 = v71;
    operator delete(v71);
  }
  if (v74)
  {
    v75 = (uint64_t *)v74;
    operator delete(v74);
  }
  if (v76)
  {
    v77 = v76;
    operator delete(v76);
  }
  if (v78)
  {
    v79 = v78;
    operator delete(v78);
  }

}

- (BOOL)shapeInfoNeeded
{
  return self->_shapeInfoNeeded;
}

- (NSNumber)transposeA
{
  return self->_transposeA;
}

- (NSNumber)transposeB
{
  return self->_transposeB;
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
  objc_storeStrong((id *)&self->_transposeB, 0);
  objc_storeStrong((id *)&self->_transposeA, 0);
}

@end
