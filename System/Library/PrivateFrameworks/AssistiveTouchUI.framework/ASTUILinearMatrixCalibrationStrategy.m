@implementation ASTUILinearMatrixCalibrationStrategy

- (id)calibratedArrayForGazePoint:(CGPoint)a3
{
  return (id)objc_opt_new();
}

- (CGPoint)calibratedGazePointForGazePoint:(CGPoint)a3
{
  float x;
  float y;
  void *v5;
  uint64_t i;
  void *v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  float __C[2];
  float __B[6];
  float __A[3];
  uint64_t v16;
  CGPoint result;

  v16 = *MEMORY[0x24BDAC8D0];
  x = a3.x;
  y = a3.y;
  __A[0] = x;
  __A[1] = y;
  __A[2] = 1.0;
  -[ASTUILinearMatrixCalibrationStrategy calibratedArrayForGazePoint:](self, "calibratedArrayForGazePoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 6; ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    __B[i] = v8;

  }
  vDSP_mmul(__A, 1, __B, 1, __C, 1, 1uLL, 2uLL, 3uLL);
  v9 = __C[0];
  v10 = __C[1];

  v11 = v9;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)learnCalibrationForPoints:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  const float *v26;
  unint64_t v27;
  void *v28;
  float v29;
  const float *v30;
  unint64_t v31;
  void *v32;
  float v33;
  float *v34;
  __CLPK_integer *v35;
  __CLPK_real *v36;
  void *v37;
  double v38;
  uint64_t i;
  void *v40;
  _QWORD v42[2];
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  float v55[6];
  float v56[6];
  float v57[9];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_0);
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __66__ASTUILinearMatrixCalibrationStrategy_learnCalibrationForPoints___block_invoke_2;
  v53[3] = &unk_250819AB8;
  v43 = v3;
  v54 = v43;
  objc_msgSend(v4, "ax_mappedArrayUsingBlock:", v53);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v50;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v11), "CGPointValue");
        v13 = v12;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v15);

        objc_msgSend(v6, "addObject:", &unk_25081BA78);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v46;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v21), "CGPointValue");
        v23 = v22;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v24);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v25);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v19);
  }

  v42[1] = v42;
  v26 = (const float *)((char *)v42 - ((4 * objc_msgSend(v6, "count") + 15) & 0xFFFFFFFFFFFFFFF0));
  if (objc_msgSend(v6, "count"))
  {
    v27 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "floatValue");
      v26[v27] = v29;

      ++v27;
    }
    while (objc_msgSend(v6, "count") > v27);
  }
  v30 = (const float *)((char *)v42 - ((4 * objc_msgSend(v16, "count") + 15) & 0xFFFFFFFFFFFFFFF0));
  if (objc_msgSend(v16, "count"))
  {
    v31 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      v30[v31] = v33;

      ++v31;
    }
    while (objc_msgSend(v16, "count") > v31);
  }
  v34 = (float *)((char *)v42 - ((4 * objc_msgSend(v6, "count") + 15) & 0xFFFFFFFFFFFFFFF0));
  vDSP_mtrans(v26, 1, v34, 1, 3uLL, objc_msgSend(v7, "count"));
  vDSP_mtrans(v30, 1, (float *)((char *)v42 - ((4 * objc_msgSend(v16, "count") + 15) & 0xFFFFFFFFFFFFFFF0)), 1, 2uLL, objc_msgSend(v17, "count"));
  vDSP_mmul(v34, 1, v26, 1, v57, 1, 3uLL, 3uLL, objc_msgSend(v7, "count"));
  vDSP_mmul(v34, 1, v30, 1, v56, 1, 3uLL, 2uLL, objc_msgSend(v7, "count"));
  v44 = 3;
  v35 = (__CLPK_integer *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
  v36 = (__CLPK_real *)malloc_type_malloc(0xCuLL, 0x100004052888210uLL);
  sgetrf_((__CLPK_integer *)&v44, (__CLPK_integer *)&v44, v57, (__CLPK_integer *)&v44, v35, (__CLPK_integer *)&v44 + 1);
  sgetri_((__CLPK_integer *)&v44, v57, (__CLPK_integer *)&v44, v35, v36, (__CLPK_integer *)&v44, (__CLPK_integer *)&v44 + 1);
  vDSP_mmul(v57, 1, v56, 1, v55, 1, 3uLL, 2uLL, 3uLL);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 6; ++i)
  {
    *(float *)&v38 = v55[i];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObject:", v40);

  }
  return v37;
}

uint64_t __66__ASTUILinearMatrixCalibrationStrategy_learnCalibrationForPoints___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

@end
