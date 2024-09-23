@implementation MLTransposeBrick

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int i;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *__p;
  void *v46;
  std::vector<int> v47;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0D1F4E0]);
  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "integerValue") >= 6)
  {

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    if (v12 < 6)
    {
      -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      std::vector<int>::vector(&v47, 5uLL);
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "width");
      *v47.__begin_ = v16;

      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "height");
      v47.__begin_[1] = v18;

      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "channels");
      v47.__begin_[2] = v20;

      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "batch");
      v47.__begin_[3] = v22;

      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "sequence");
      v47.__begin_[4] = v24;

      objc_msgSend(v9, "setSequence:", 1);
      objc_msgSend(v9, "setBatch:", 1);
      objc_msgSend(v9, "setChannels:", 1);
      objc_msgSend(v9, "setHeight:", 1);
      objc_msgSend(v9, "setWidth:", 1);
      if (v14)
      {
        -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", v14 - 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "unsignedIntegerValue");
        objc_msgSend(v9, "setWidth:", v47.__begin_[v14 + ~v26]);

        if (v14 >= 2)
        {
          -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", v14 - 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "unsignedIntegerValue");
          objc_msgSend(v9, "setHeight:", v47.__begin_[v14 + ~v28]);

          if (v14 >= 3)
          {
            -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", v14 - 3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "unsignedIntegerValue");
            objc_msgSend(v9, "setChannels:", v47.__begin_[v14 + ~v30]);

            if (v14 >= 4)
            {
              -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", v14 - 4);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "unsignedIntegerValue");
              objc_msgSend(v9, "setBatch:", v47.__begin_[v14 + ~v32]);

              if (v14 == 5)
              {
                -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", 0);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "unsignedIntegerValue");
                objc_msgSend(v9, "setSequence:", v47.__begin_[4 - v34]);

              }
            }
          }
        }
      }
      -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRank:", objc_msgSend(v35, "intValue"));

      goto LABEL_16;
    }
  }
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v47, objc_msgSend(v36, "unsignedIntegerValue"));

  std::vector<unsigned long>::vector(&__p, 5uLL);
  for (i = 0; ; ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "unsignedIntegerValue");

    if (v39 <= i)
      break;
    -[NSArray objectAtIndexedSubscript:](self->_outputShapes, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", i);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "unsignedIntegerValue");
    *(_QWORD *)&v47.__begin_[2 * i] = v42;

  }
  TensorAlgebraUtils::Ndim_to_Mdim((uint64_t *)v47.__begin_, (uint64_t *)v47.__end_, (uint64_t *)__p, (uint64_t)v46);
  objc_msgSend(v9, "setSequence:", *(unsigned int *)__p);
  objc_msgSend(v9, "setBatch:", *((unsigned int *)__p + 2));
  objc_msgSend(v9, "setChannels:", *((unsigned int *)__p + 4));
  objc_msgSend(v9, "setHeight:", *((unsigned int *)__p + 6));
  objc_msgSend(v9, "setWidth:", *((unsigned int *)__p + 8));
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRank:", objc_msgSend(v43, "intValue"));

  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
LABEL_16:
  if (v47.__begin_)
  {
    v47.__end_ = v47.__begin_;
    operator delete(v47.__begin_);
  }
  objc_msgSend(v8, "addObject:", v9);

  return v8;
}

- (MLTransposeBrick)initWithParameters:(id)a3
{
  id v4;
  MLTransposeBrick *v5;
  uint64_t v6;
  NSArray *inputRanks;
  uint64_t v8;
  NSArray *outputRanks;
  uint64_t v10;
  NSArray *inputShapes;
  uint64_t v12;
  NSArray *outputShapes;
  uint64_t v14;
  NSArray *axes;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLTransposeBrick;
  v5 = -[MLTransposeBrick init](&v17, sel_init);
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

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("axes"));
    v14 = objc_claimAutoreleasedReturnValue();
    axes = v5->_axes;
    v5->_axes = (NSArray *)v14;

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
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int i;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int j;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *exception;
  id v65;
  void *v66;
  _BYTE *v67;
  void *v68;
  uint64_t *v69;
  void *v70;
  void *v71;
  void *__p;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t *v80;
  uint64_t *v81;
  void *v82;
  _BYTE *v83;
  uint64_t v84;

  v65 = a3;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawPointer");

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rawPointer");

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v70, objc_msgSend(v11, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v68, objc_msgSend(v12, "unsignedIntegerValue"));

  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  std::vector<unsigned long>::vector(&v66, objc_msgSend(v13, "unsignedIntegerValue"));

  for (i = 0; ; ++i)
  {
    -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "unsignedIntegerValue");

    if (v16 <= i)
      break;
    -[NSArray objectAtIndexedSubscript:](self->_axes, "objectAtIndexedSubscript:", i);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    *((_QWORD *)v70 + i) = v18;

  }
  -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "integerValue") > 5)
  {

LABEL_51:
    for (j = 0; ; ++j)
    {
      -[NSArray objectAtIndexedSubscript:](self->_inputRanks, "objectAtIndexedSubscript:", 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "unsignedIntegerValue");

      if (v59 <= j)
        break;
      -[NSArray objectAtIndexedSubscript:](self->_inputShapes, "objectAtIndexedSubscript:", 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectAtIndexedSubscript:", j);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "unsignedIntegerValue");
      *((_QWORD *)v68 + j) = v62;

    }
    goto LABEL_12;
  }
  -[NSArray objectAtIndexedSubscript:](self->_outputRanks, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  if (v21 > 5)
    goto LABEL_51;
  if (v8)
  {
    objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shape");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "width");
    *((_QWORD *)v68 + v8 - 1) = v24;

    if (v8 >= 2)
    {
      objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "shape");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "height");
      *((_QWORD *)v68 + v8 - 2) = v27;

      if (v8 >= 3)
      {
        objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shape");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "channels");
        *((_QWORD *)v68 + v8 - 3) = v30;

        if (v8 >= 4)
        {
          objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "shape");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "batch");
          *((_QWORD *)v68 + v8 - 4) = v33;

          if (v8 == 5)
          {
            objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "shape");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "sequence");
            *(_QWORD *)v68 = v36;

          }
        }
      }
    }
  }
LABEL_12:
  v38 = v70;
  v37 = v71;
  v39 = ((_BYTE *)v71 - (_BYTE *)v70) >> 3;
  v84 = 0;
  std::vector<unsigned long>::vector(&v82, v39);
  std::vector<unsigned long>::vector(&v80, v39);
  std::vector<unsigned long>::vector(&v78, v39);
  v75 = 0;
  v76 = 0;
  v77 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v75, v70, (uint64_t)v71, ((_BYTE *)v71 - (_BYTE *)v70) >> 3);
  if (v39 != ((char *)v69 - (_BYTE *)v68) >> 3 || v39 != (v67 - (_BYTE *)v66) >> 3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](exception, "Mismatch between rank of input/output tensors and the length of axes.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  std::__sort<std::__less<unsigned long,unsigned long> &,unsigned long *>();
  v40 = (uint64_t *)v68;
  if (v37 != v38)
  {
    v41 = 0;
    if (v39 <= 1)
      v42 = 1;
    else
      v42 = v39;
    while (v41 == *((_QWORD *)v75 + v41))
    {
      if (!*((_QWORD *)v68 + v41))
      {
        v63 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD5E28](v63, "Invalid input shape");
        goto LABEL_56;
      }
      if (v42 == ++v41)
      {
        v43 = (uint64_t *)v70;
        v44 = v66;
        do
        {
          v45 = *v43++;
          *v44++ = v40[v45];
          --v42;
        }
        while (v42);
        goto LABEL_23;
      }
    }
    v63 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A1AD5E28](v63, "Invalid axes argument");
LABEL_56:
    __cxa_throw(v63, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
LABEL_23:
  v46 = 1;
  while (v40 != v69)
  {
    v47 = *v40++;
    v46 *= v47;
  }
  TensorAlgebraUtils::computeStrides((uint64_t)v68, (uint64_t)v69, (uint64_t)v82, (uint64_t)v83);
  if (v46)
  {
    v48 = 0;
    v49 = *((_QWORD *)v66 + v39 - 1);
    if (v39 <= 1)
      v39 = 1;
    do
    {
      TensorAlgebraUtils::unravel_index(v48, (uint64_t)v66, (uint64_t)v67, (unint64_t *)v78, (uint64_t)v79);
      if (v37 != v38)
      {
        v50 = (uint64_t *)v78;
        v51 = (uint64_t *)v70;
        v52 = v39;
        v53 = v80;
        do
        {
          v55 = *v50++;
          v54 = v55;
          v56 = *v51++;
          v53[v56] = v54;
          --v52;
        }
        while (v52);
      }
      __p = 0;
      v73 = 0;
      v74 = 0;
      std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v82, (uint64_t)v83, (v83 - (_BYTE *)v82) >> 3);
      TensorAlgebraUtils::ravel_multi_index(v80, (uint64_t)v81, (uint64_t)v68, (uint64_t)v69, (uint64_t *)__p, &v84);
      if (__p)
      {
        v73 = __p;
        operator delete(__p);
      }
      cblas_scopy_NEWLAPACK();
      v48 += v49;
    }
    while (v48 < v46);
  }
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
  if (v78)
  {
    v79 = v78;
    operator delete(v78);
  }
  if (v80)
  {
    v81 = v80;
    operator delete(v80);
  }
  if (v82)
  {
    v83 = v82;
    operator delete(v82);
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (v68)
  {
    v69 = (uint64_t *)v68;
    operator delete(v68);
  }
  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }

}

- (NSArray)axes
{
  return self->_axes;
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
  objc_storeStrong((id *)&self->_axes, 0);
}

@end
