@implementation AlgosScoreCombiner

+ (id)combiner
{
  return objc_alloc_init(AlgosScoreCombiner);
}

- (AlgosScoreCombiner)init
{
  AlgosScoreCombiner *v2;
  AlgosScoreCombiner *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreCombiner;
  v2 = -[AlgosScoreCombiner init](&v4, sel_init);
  if (!v2)
    return v2;
  result = (AlgosScoreCombiner *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->combinerData = 0;
    *(_QWORD *)&result->_debug = 0;
    v2->combinerData = result;
    return v2;
  }
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *combinerData;
  objc_super v4;
  void **v5;

  combinerData = self->combinerData;
  if (combinerData)
  {
    v5 = (void **)self->combinerData;
    std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x20BD3126C](combinerData, 0x20C40960023A9);
  }
  v4.receiver = self;
  v4.super_class = (Class)AlgosScoreCombiner;
  -[AlgosScoreCombiner dealloc](&v4, sel_dealloc);
}

- (void)addScore:(double)a3 weight:(double)a4 type:(id)a5 label:(id)a6
{
  id v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t *combinerData;
  id v14;
  __CFString *v15;
  void *v16[2];
  char v17;
  void *v18[2];
  char v19;
  void *v20[2];
  char v21;
  void *__p;
  char v23;

  v10 = a5;
  v11 = (__CFString *)a6;
  if (v11)
    v12 = v11;
  else
    v12 = &stru_24C3CB9B8;
  combinerData = (uint64_t *)self->combinerData;
  v14 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(v18, (char *)objc_msgSend(v14, "cStringUsingEncoding:", 4));
  v15 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(v16, (char *)-[__CFString cStringUsingEncoding:](v15, "cStringUsingEncoding:", 4));
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v20, v18, v16, a3, a4);
  std::vector<AlgosScoreCombinerFrameRow>::push_back[abi:ne180100](combinerData, (AlgosScoreCombinerFrameRow *)v20);
  if (v23 < 0)
    operator delete(__p);
  if (v21 < 0)
    operator delete(v20[0]);
  if (v17 < 0)
    operator delete(v16[0]);
  if (v19 < 0)
    operator delete(v18[0]);

}

- (void)clearScores
{
  uint64_t *combinerData;
  uint64_t v3;
  uint64_t v4;

  combinerData = (uint64_t *)self->combinerData;
  v4 = *combinerData;
  v3 = combinerData[1];
  if (v3 != *combinerData)
  {
    do
    {
      v3 -= 64;
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(combinerData + 2), v3);
    }
    while (v3 != v4);
  }
  combinerData[1] = v4;
}

- (double)signedMeanSquaredDeviation
{
  const AlgosScoreCombinerFrameRow **combinerData;
  const AlgosScoreCombinerFrameRow *v4;
  const AlgosScoreCombinerFrameRow *v5;
  double v6;
  float64x2_t v7;
  int8x16_t v8;
  int v9;
  int8x16_t v10;
  int8x16_t v12;
  int8x16_t v13;
  double v14;
  void *v15;
  char v16;
  void *__p;
  char v18;
  uint64_t v19;

  combinerData = (const AlgosScoreCombinerFrameRow **)self->combinerData;
  v4 = *combinerData;
  v5 = combinerData[1];
  v6 = 0.0;
  if (*combinerData != v5)
  {
    v7.f64[0] = NAN;
    v7.f64[1] = NAN;
    v12 = (int8x16_t)vnegq_f64(v7);
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v15, v4);
      v8.i64[0] = v19;
      v13 = v8;
      v9 = -[AlgosScoreCombiner debug](self, "debug");
      *(double *)v10.i64 = *(double *)v13.i64 * *(double *)v13.i64;
      *(_QWORD *)&v14 = vbslq_s8(v12, v10, v13).u64[0];
      if (v9 >= 2)
        printf("deviation: %f, score_incr: %f\n", *(double *)v13.i64, v14);
      if (v18 < 0)
        operator delete(__p);
      if (v16 < 0)
        operator delete(v15);
      v6 = v6 + v14;
      v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 + 64);
    }
    while (v4 != v5);
  }
  if (-[AlgosScoreCombiner debug](self, "debug") > 1)
    printf("raw score: %f\n", v6);
  return sqrt(v6 / (double)(unint64_t)((combinerData[1] - *combinerData) >> 6));
}

- (id)scoreScores:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const AlgosScoreCombinerFrameRow **combinerData;
  const AlgosScoreCombinerFrameRow *v11;
  const AlgosScoreCombinerFrameRow *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  const AlgosScoreCombinerFrameRow **v18;
  const AlgosScoreCombinerFrameRow *v19;
  const AlgosScoreCombinerFrameRow *v20;
  double v21;
  double v22;
  const AlgosScoreCombinerFrameRow *v23;
  void *v24;
  void *v25;
  AlgosScoreCombinerFrameRow **v26;
  AlgosScoreCombinerFrameRow *v27;
  AlgosScoreCombinerFrameRow *v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  double *v33;
  void *v34;
  void *v35;
  void *v36;
  const AlgosScoreCombinerFrameRow **v37;
  double v38;
  const AlgosScoreCombinerFrameRow *v39;
  const AlgosScoreCombinerFrameRow *v40;
  double v41;
  double v42;
  double v43;
  const AlgosScoreCombinerFrameRow *v44;
  void *v45;
  void *v46;
  const AlgosScoreCombinerFrameRow **v47;
  const AlgosScoreCombinerFrameRow *v48;
  const AlgosScoreCombinerFrameRow *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL (*v58)(AlgosScoreCombinerFrameRow *, AlgosScoreCombinerFrameRow *);
  void **v59;
  void *v60;
  std::string *v61;
  uint64_t v62;
  void *__p;
  char v64;
  double v65;

  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = v4;
  else
    v7 = CFSTR("no-label");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("label"));
  if (-[AlgosScoreCombiner debug](self, "debug"))
  {
    AlgosScoreCombinerFrame::DebugPrint((const std::string **)self->combinerData, 25);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", amean((const AlgosScoreCombinerFrameRow **)self->combinerData));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("amean"));

    v9 = (void *)MEMORY[0x24BDD16E0];
    combinerData = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v11 = *combinerData;
    v12 = combinerData[1];
    if (*combinerData == v12)
    {
      v14 = 0.0;
    }
    else
    {
      v13 = (double)(unint64_t)((v12 - v11) >> 6);
      v14 = 0.0;
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v11);
        v15 = log(fabs(v65));
        if (v64 < 0)
          operator delete(__p);
        if (SHIBYTE(v62) < 0)
          operator delete(v60);
        v14 = v14 + v15 / v13;
        v11 = (const AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
      }
      while (v11 != v12);
    }
    objc_msgSend(v9, "numberWithDouble:", (double)exp(v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("gmean(abs)"));

    v17 = (void *)MEMORY[0x24BDD16E0];
    v18 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v19 = *v18;
    v20 = v18[1];
    v21 = 0.0;
    if (*v18 == v20)
    {
      v23 = *v18;
    }
    else
    {
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v19);
        v22 = v65;
        if (v64 < 0)
          operator delete(__p);
        if (SHIBYTE(v62) < 0)
          operator delete(v60);
        v21 = v21 + 1.0 / v22;
        v19 = (const AlgosScoreCombinerFrameRow *)((char *)v19 + 64);
      }
      while (v19 != v20);
      v19 = *v18;
      v23 = v18[1];
    }
    objc_msgSend(v17, "numberWithDouble:", (double)(unint64_t)((v23 - v19) >> 6) / v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("hmean(abs)"));

    v25 = (void *)MEMORY[0x24BDD16E0];
    v26 = (AlgosScoreCombinerFrameRow **)self->combinerData;
    v27 = *v26;
    v28 = v26[1];
    v29 = v28 - *v26;
    if ((unint64_t)v29 > 0x7F)
    {
      v60 = 0;
      v61 = 0;
      v62 = 0;
      std::vector<AlgosScoreCombinerFrameRow>::__init_with_size[abi:ne180100]<AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)&v60, v27, v28, v29 >> 6);
      v31 = 126 - 2 * __clz(((char *)v61 - (_BYTE *)v60) >> 6);
      v58 = compareScores;
      if (v61 == v60)
        v32 = 0;
      else
        v32 = v31;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>((AlgosScoreCombinerFrameRow *)v60, v61, (uint64_t (**)(std::string *, const AlgosScoreCombinerFrameRow *))&v58, v32, 1);
      v33 = (double *)((char *)v60 + ((((v26[1] - *v26) >> 1) + 32) & 0xFFFFFFFFFFFFFFC0));
      v30 = *(v33 - 1) + (v33[7] - *(v33 - 1)) * 0.5;
      v59 = &v60;
      std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&v59);
    }
    else
    {
      v30 = nan("median");
    }
    objc_msgSend(v25, "numberWithDouble:", v30, v58);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("median"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", stddev((const AlgosScoreCombinerFrameRow **)self->combinerData));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("std"));

    v36 = (void *)MEMORY[0x24BDD16E0];
    v37 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v38 = amean(v37);
    v39 = *v37;
    v40 = v37[1];
    if (*v37 == v40)
    {
      v42 = 0.0;
      v44 = *v37;
    }
    else
    {
      v41 = v38;
      v42 = 0.0;
      do
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v39);
        v43 = v65;
        if (v64 < 0)
          operator delete(__p);
        if (SHIBYTE(v62) < 0)
          operator delete(v60);
        v42 = v42 + vabdd_f64(v43, v41);
        v39 = (const AlgosScoreCombinerFrameRow *)((char *)v39 + 64);
      }
      while (v39 != v40);
      v39 = *v37;
      v44 = v37[1];
    }
    objc_msgSend(v36, "numberWithDouble:", v42 / (double)(unint64_t)((v44 - v39) >> 6));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("mad"));

    v46 = (void *)MEMORY[0x24BDD16E0];
    v47 = (const AlgosScoreCombinerFrameRow **)self->combinerData;
    v48 = *v47;
    v49 = v47[1];
    v50 = *((double *)*v47 + 7);
    v51 = v50;
    while (v48 != v49)
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v60, v48);
      if (v65 < v50)
        v50 = v65;
      if (v51 < v65)
        v51 = v65;
      if (v64 < 0)
        operator delete(__p);
      if (SHIBYTE(v62) < 0)
        operator delete(v60);
      v48 = (const AlgosScoreCombinerFrameRow *)((char *)v48 + 64);
    }
    objc_msgSend(v46, "numberWithDouble:", v51 - v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("scale"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", standard_moment((const AlgosScoreCombinerFrameRow **)self->combinerData, 4));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("kurtosis"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", standard_moment((const AlgosScoreCombinerFrameRow **)self->combinerData, 3));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("skew"));

  }
  v55 = (void *)MEMORY[0x24BDD16E0];
  -[AlgosScoreCombiner signedMeanSquaredDeviation](self, "signedMeanSquaredDeviation");
  objc_msgSend(v55, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("score"));

  return v6;
}

- (int)debug
{
  return self->_debug;
}

- (void)setDebug:(int)a3
{
  self->_debug = a3;
}

@end
