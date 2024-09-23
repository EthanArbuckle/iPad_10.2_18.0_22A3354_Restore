@implementation AlgosConnectionScore

+ (id)connectionScore
{
  return objc_alloc_init(AlgosConnectionScore);
}

- (AlgosConnectionScore)init
{
  AlgosConnectionScore *v2;
  AlgosConnectionScore *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AlgosConnectionScore;
  v2 = -[AlgosConnectionScore init](&v4, sel_init);
  if (!v2)
    return v2;
  result = (AlgosConnectionScore *)malloc_type_calloc(1uLL, 0x18uLL, 0xF1748037uLL);
  if (result)
  {
    result->super.isa = 0;
    result->connectionData = 0;
    *(_QWORD *)&result->_debug = 0;
    v2->connectionData = result;
    return v2;
  }
  __break(1u);
  return result;
}

- (void)dealloc
{
  void **connectionData;
  void *v4;
  objc_super v5;

  connectionData = (void **)self->connectionData;
  if (connectionData)
  {
    v4 = *connectionData;
    if (*connectionData)
    {
      connectionData[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x20BD3126C](connectionData, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)AlgosConnectionScore;
  -[AlgosConnectionScore dealloc](&v5, sel_dealloc);
}

- (void)addConnectionRow:(unint64_t)a3 ttfb:(double)a4 ttlb:(double)a5 basettfb:(double)a6 basettlb:(double)a7 weight:(double)a8 failed:(int)a9
{
  _QWORD *connectionData;
  unint64_t v10;
  uint64_t v11;
  _BYTE v12[64];

  connectionData = self->connectionData;
  AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((AlgosScoreConnectionFrameRow *)v12, a3, a4, a5, a6, a7, a8, a9);
  v10 = connectionData[1];
  if (v10 >= connectionData[2])
  {
    v11 = std::vector<AlgosScoreConnectionFrameRow>::__push_back_slow_path<AlgosScoreConnectionFrameRow>((uint64_t)connectionData, (const AlgosScoreConnectionFrameRow *)v12);
  }
  else
  {
    AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((AlgosScoreConnectionFrameRow *)connectionData[1], (const AlgosScoreConnectionFrameRow *)v12);
    v11 = v10 + 64;
    connectionData[1] = v10 + 64;
  }
  connectionData[1] = v11;
}

- (void)clearConnectionRows
{
  *((_QWORD *)self->connectionData + 1) = *(_QWORD *)self->connectionData;
}

- (unint64_t)count
{
  return (uint64_t)(*((_QWORD *)self->connectionData + 1) - *(_QWORD *)self->connectionData) >> 6;
}

- (id)scoreConnection:(BOOL)a3 label:(id)a4
{
  _BOOL8 v4;
  __CFString *v6;
  __CFString *v7;
  const AlgosScoreConnectionFrameRow **connectionData;
  const AlgosScoreConnectionFrameRow *v9;
  const AlgosScoreConnectionFrameRow *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  float64x2_t v14;
  double v15;
  int8x16_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  double v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  const AlgosScoreConnectionFrameRow **v27;
  const AlgosScoreConnectionFrameRow *v28;
  const AlgosScoreConnectionFrameRow *v29;
  int v30;
  double v31;
  char *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  unint64_t *v42;
  unint64_t v43;
  double v44;
  double *v45;
  double *v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  double *v53;
  uint64_t v54;
  int8x16_t v55;
  long double v56;
  int8x16_t v57;
  int8x16_t v58;
  double v59;
  int8x16_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  double v71;
  double *v72;
  double *v73;
  double *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  double *v80;
  uint64_t v81;
  long double v82;
  int8x16_t v83;
  double v84;
  double v85;
  int8x16_t v86;
  double v87;
  const AlgosScoreConnectionFrameRow **v88;
  const AlgosScoreConnectionFrameRow *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  __CFString *v100;
  int8x16_t v101;
  double v102;
  double v103;
  int8x16_t v104;
  int8x16_t v105;
  int8x16_t v106;
  int8x16_t v107;
  unint64_t v108;
  double v109;
  double v110;
  double v111;
  int v112;
  void *v113;
  double *v114;
  char *v115;
  void *v116;
  char *v117;
  char *v118;
  void *__p;
  char *v120;
  char *v121;
  unint64_t v122[8];
  _QWORD v123[5];
  _QWORD v124[5];
  _QWORD v125[4];
  _QWORD v126[6];

  v4 = a3;
  v126[4] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  __p = 0;
  v120 = 0;
  v121 = 0;
  v116 = 0;
  v117 = 0;
  v118 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("no-label");
  connectionData = (const AlgosScoreConnectionFrameRow **)self->connectionData;
  v9 = *connectionData;
  v10 = connectionData[1];
  if (*connectionData != v10)
  {
    v100 = v7;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14.f64[0] = NAN;
    v14.f64[1] = NAN;
    v101 = (int8x16_t)vnegq_f64(v14);
    v15 = 0.0;
    while (1)
    {
      AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((AlgosScoreConnectionFrameRow *)&v108, v9);
      if (v112 == -1)
      {
        v20 = v111 * 350.0;
        if (-[AlgosConnectionScore debug](self, "debug"))
          printf("Fixed error penalty: %1.2f", v20);
        v15 = v15 + v20;
        v11 = (v11 + 1);
        goto LABEL_117;
      }
      v12 = v112 ? (v12 + 1) : v12;
      v17 = v108;
      if (v108 == -1)
      {
        v17 = v13;
        if (!v13)
        {
          v27 = (const AlgosScoreConnectionFrameRow **)self->connectionData;
          v29 = *v27;
          v28 = v27[1];
          if (*v27 == v28)
            break;
          v30 = 0;
          v31 = 0.0;
          do
          {
            AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((AlgosScoreConnectionFrameRow *)v122, v29);
            *(double *)v16.i64 = (double)v122[0];
            if (v122[0] == -1)
              *(double *)v16.i64 = -0.0;
            v31 = v31 + *(double *)v16.i64;
            if (v122[0] != -1)
              ++v30;
            v29 = (const AlgosScoreConnectionFrameRow *)((char *)v29 + 64);
          }
          while (v29 != v28);
          if (!v30)
            break;
          v17 = (unint64_t)(v31 / (double)v30);
          v13 = v17;
          if (!v17)
            break;
        }
      }
      v107.i64[0] = 0;
      if (!v17 || v4)
      {
        v103 = 0.0;
        goto LABEL_20;
      }
      *(double *)v16.i64 = v109 - v110;
      v18 = v120;
      v107 = v16;
      if (v120 >= v121)
      {
        v21 = (char *)__p;
        v22 = (v120 - (_BYTE *)__p) >> 3;
        v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 61)
          goto LABEL_127;
        v24 = v121 - (_BYTE *)__p;
        if ((v121 - (_BYTE *)__p) >> 2 > v23)
          v23 = v24 >> 2;
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
          v25 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v25 = v23;
        if (v25)
        {
          v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v121, v25);
          v21 = (char *)__p;
          v18 = v120;
        }
        else
        {
          v26 = 0;
        }
        v32 = &v26[8 * v22];
        *(_QWORD *)v32 = v107.i64[0];
        v19 = v32 + 8;
        while (v18 != v21)
        {
          v33 = *((_QWORD *)v18 - 1);
          v18 -= 8;
          *((_QWORD *)v32 - 1) = v33;
          v32 -= 8;
        }
        __p = v32;
        v120 = v19;
        v121 = &v26[8 * v25];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *(_QWORD *)v120 = v16.i64[0];
        v19 = v18 + 8;
      }
      v120 = v19;
      v34 = v117;
      if (v117 >= v118)
      {
        v36 = (char *)v116;
        v37 = (v117 - (_BYTE *)v116) >> 3;
        v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 61)
          std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
        v39 = v118 - (_BYTE *)v116;
        if ((v118 - (_BYTE *)v116) >> 2 > v38)
          v38 = v39 >> 2;
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
          v40 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v40 = v38;
        if (v40)
        {
          v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v118, v40);
          v36 = (char *)v116;
          v34 = v117;
        }
        else
        {
          v41 = 0;
        }
        v42 = (unint64_t *)&v41[8 * v37];
        *v42 = v17;
        v35 = (char *)(v42 + 1);
        while (v34 != v36)
        {
          v43 = *((_QWORD *)v34 - 1);
          v34 -= 8;
          *--v42 = v43;
        }
        v116 = v42;
        v117 = v35;
        v118 = &v41[8 * v40];
        if (v36)
          operator delete(v36);
      }
      else
      {
        *(_QWORD *)v117 = v17;
        v35 = v34 + 8;
      }
      v117 = v35;
      v44 = v109;
      v45 = v114;
      if (v114 >= (double *)v115)
      {
        v47 = (double *)v113;
        v48 = ((char *)v114 - (_BYTE *)v113) >> 3;
        v49 = v48 + 1;
        if ((unint64_t)(v48 + 1) >> 61)
          std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
        v50 = v115 - (_BYTE *)v113;
        if ((v115 - (_BYTE *)v113) >> 2 > v49)
          v49 = v50 >> 2;
        if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF8)
          v51 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v51 = v49;
        if (v51)
        {
          v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v115, v51);
          v47 = (double *)v113;
          v45 = v114;
        }
        else
        {
          v52 = 0;
        }
        v53 = (double *)&v52[8 * v48];
        *v53 = v44;
        v46 = v53 + 1;
        while (v45 != v47)
        {
          v54 = *((_QWORD *)v45-- - 1);
          *((_QWORD *)v53-- - 1) = v54;
        }
        v113 = v53;
        v114 = v46;
        v115 = &v52[8 * v51];
        if (v47)
          operator delete(v47);
      }
      else
      {
        *v114 = v109;
        v46 = v45 + 1;
      }
      v114 = v46;
      v55.i64[1] = v107.i64[1];
      *(double *)v55.i64 = *(double *)v107.i64 * 1000.0;
      v104 = v55;
      v56 = fabs(*(double *)v107.i64 * 1000.0);
      *(double *)v57.i64 = pow(v56, 1.9) + v56 * 20000.0;
      v58 = vbslq_s8(v101, v57, v104);
      v102 = *(double *)v58.i64;
      *(double *)v58.i64 = *(double *)v58.i64 / (double)v17 * v111;
      v105 = v58;
      v59 = log1p(fabs(*(double *)v58.i64) * 0.015);
      *(double *)v60.i64 = v59 / log1p(0.015);
      v16 = vbslq_s8(v101, v60, v105);
      v103 = *(double *)v16.i64;
      if (v4)
      {
LABEL_79:
        *(double *)v16.i64 = v109 - v110;
        v61 = v120;
        v107 = v16;
        if (v120 >= v121)
        {
          v63 = (char *)__p;
          v64 = (v120 - (_BYTE *)__p) >> 3;
          v65 = v64 + 1;
          if ((unint64_t)(v64 + 1) >> 61)
LABEL_127:
            std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
          v66 = v121 - (_BYTE *)__p;
          if ((v121 - (_BYTE *)__p) >> 2 > v65)
            v65 = v66 >> 2;
          if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8)
            v67 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v67 = v65;
          if (v67)
          {
            v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v121, v67);
            v63 = (char *)__p;
            v61 = v120;
          }
          else
          {
            v68 = 0;
          }
          v69 = &v68[8 * v64];
          *(_QWORD *)v69 = v107.i64[0];
          v62 = v69 + 8;
          while (v61 != v63)
          {
            v70 = *((_QWORD *)v61 - 1);
            v61 -= 8;
            *((_QWORD *)v69 - 1) = v70;
            v69 -= 8;
          }
          __p = v69;
          v120 = v62;
          v121 = &v68[8 * v67];
          if (v63)
            operator delete(v63);
        }
        else
        {
          *(_QWORD *)v120 = v16.i64[0];
          v62 = v61 + 8;
        }
        v120 = v62;
        v71 = v109;
        v72 = v114;
        if (v114 >= (double *)v115)
        {
          v74 = (double *)v113;
          v75 = ((char *)v114 - (_BYTE *)v113) >> 3;
          v76 = v75 + 1;
          if ((unint64_t)(v75 + 1) >> 61)
            std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
          v77 = v115 - (_BYTE *)v113;
          if ((v115 - (_BYTE *)v113) >> 2 > v76)
            v76 = v77 >> 2;
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
            v78 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v78 = v76;
          if (v78)
          {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v115, v78);
            v74 = (double *)v113;
            v72 = v114;
          }
          else
          {
            v79 = 0;
          }
          v80 = (double *)&v79[8 * v75];
          *v80 = v71;
          v73 = v80 + 1;
          while (v72 != v74)
          {
            v81 = *((_QWORD *)v72-- - 1);
            *((_QWORD *)v80-- - 1) = v81;
          }
          v113 = v80;
          v114 = v73;
          v115 = &v79[8 * v78];
          if (v74)
            operator delete(v74);
        }
        else
        {
          *v114 = v109;
          v73 = v72 + 1;
        }
        v114 = v73;
        v82 = fabs(*(double *)v107.i64);
        *(double *)v83.i64 = pow(v82, 1.9) + v82 * 20000.0;
        v84 = *(double *)vbslq_s8(v101, v83, v107).i64;
        *(double *)v83.i64 = v111 * (v84 / (v110 * 100.0));
        v102 = v84;
        v106 = v83;
        v85 = log1p(fabs(*(double *)v83.i64) * 0.015);
        *(double *)v86.i64 = v85 / log1p(0.015);
        *(_QWORD *)&v103 = vbslq_s8(v101, v86, v106).u64[0];
      }
LABEL_112:
      if (-[AlgosConnectionScore debug](self, "debug"))
        printf("deltat: %1.2f, nl_time_delta: %1.2f, score_incr: %1.2f\n", *(double *)v107.i64, v102, v103);
      v87 = v103 + v103;
      if (!v112)
        v87 = 0.0;
      v15 = v15 + v103 + v87;
LABEL_117:
      v9 = (const AlgosScoreConnectionFrameRow *)((char *)v9 + 64);
      if (v9 == v10)
      {
        v88 = (const AlgosScoreConnectionFrameRow **)self->connectionData;
        v9 = *v88;
        v89 = v88[1];
        v7 = v100;
        goto LABEL_120;
      }
    }
    v13 = 0;
    v103 = v111 * 150.0;
    v107.i64[0] = 0;
LABEL_20:
    v102 = 0.0;
    if (v4)
      goto LABEL_79;
    goto LABEL_112;
  }
  v12 = 0;
  v11 = 0;
  v15 = 0.0;
  v89 = *connectionData;
LABEL_120:
  v90 = (v89 - v9) >> 6;
  v125[0] = CFSTR("count");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = v91;
  v125[1] = CFSTR("time-based");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v126[1] = v92;
  v125[2] = CFSTR("fails");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v12);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v126[2] = v93;
  v125[3] = CFSTR("hard-fails");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v126[3] = v94;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  v123[0] = CFSTR("raw-score");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v96;
  v123[1] = CFSTR("score");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15 / fmax((double)(unint64_t)v90, 1.0));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = v97;
  v124[2] = v95;
  v123[2] = CFSTR("stats");
  v123[3] = CFSTR("type");
  v123[4] = CFSTR("label");
  v124[3] = CFSTR("http");
  v124[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 5);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v113)
  {
    v114 = (double *)v113;
    operator delete(v113);
  }
  if (v116)
  {
    v117 = (char *)v116;
    operator delete(v116);
  }
  if (__p)
  {
    v120 = (char *)__p;
    operator delete(__p);
  }

  return v98;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

@end
