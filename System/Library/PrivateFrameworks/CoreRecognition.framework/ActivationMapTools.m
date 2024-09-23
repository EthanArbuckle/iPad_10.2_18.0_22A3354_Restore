@implementation ActivationMapTools

+ (id)characterCentroidsFromActivationMap:(const void *)a3 codeMap:(const int *)a4 decodedSymbolIndexes:(id *)a5
{
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  float *v18;
  float *v19;
  float *v20;
  float v21;
  uint64_t v22;
  float *v23;
  float v24;
  float v25;
  float *v26;
  float *v27;
  float *v28;
  float *v29;
  float v31;
  float *v32;
  float v33;
  float v34;
  uint64_t v35;
  float v36;
  double v37;
  void *v38;
  void *v39;
  unint64_t v41;
  id v42;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3)
    goto LABEL_48;
  v10 = *(_QWORD **)a3;
  v9 = *((_QWORD *)a3 + 1);
  if (v9 == *(_QWORD *)a3)
    goto LABEL_48;
  v11 = v10[1] - *v10;
  if (v11)
  {
    v12 = 0;
    v13 = v11 >> 2;
    if (v13 <= 1)
      v13 = 1;
    while (a4[v12] != 103)
    {
      if (v13 == ++v12)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v12 = -1;
  }
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v41 = 0;
  do
  {
    while (1)
    {
      v18 = (float *)v10[3 * v14];
      v19 = v18;
      if (v12 >= 2)
      {
        v20 = v18 + 1;
        v21 = *v18;
        v22 = 4 * v12 - 4;
        v19 = (float *)v10[3 * v14];
        v23 = v18 + 1;
        do
        {
          v24 = *v23++;
          v25 = v24;
          if (v21 < v24)
          {
            v21 = v25;
            v19 = v20;
          }
          v20 = v23;
          v22 -= 4;
        }
        while (v22);
      }
      v26 = &v18[v12];
      v27 = v26 + 1;
      v28 = (float *)v10[3 * v14 + 1];
      v29 = v26 + 2;
      if (v27 != v28 && v29 != v28)
      {
        v31 = *v27;
        v32 = v29;
        do
        {
          v33 = *v32++;
          v34 = v33;
          if (v31 < v33)
          {
            v31 = v34;
            v27 = v29;
          }
          v29 = v32;
        }
        while (v32 != v28);
      }
      if (*v19 <= *v27)
        v19 = v27;
      v35 = v19 - v18;
      v36 = *v19;
      v37 = *v19;
      if (v17 != 2)
        break;
      if (v37 >= 0.2)
      {
        if (v36 < (float)v41)
        {
          v17 = 2;
          goto LABEL_45;
        }
        v41 = (unint64_t)v36;
        v17 = 2;
        goto LABEL_44;
      }
      if (v14 - v16 < 2)
        goto LABEL_40;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (v16 + v14) >> 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v38);

      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v15);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v39);

        ++v14;
        v10 = *(_QWORD **)a3;
        v9 = *((_QWORD *)a3 + 1);
        v17 = 1;
        if (v14 >= 0xAAAAAAAAAAAAAAABLL * ((v9 - *(_QWORD *)a3) >> 3))
          goto LABEL_47;
      }
      else
      {
        ++v14;
        v10 = *(_QWORD **)a3;
        v9 = *((_QWORD *)a3 + 1);
        v17 = 1;
        if (v14 >= 0xAAAAAAAAAAAAAAABLL * ((v9 - *(_QWORD *)a3) >> 3))
          goto LABEL_48;
      }
    }
    if (v17 == 1)
    {
      if (v37 < 0.2)
      {
LABEL_40:
        v17 = 1;
        goto LABEL_45;
      }
      v41 = (unint64_t)v36;
      v17 = 2;
      v16 = v14;
LABEL_44:
      v15 = v35;
      goto LABEL_45;
    }
    if (v37 < 0.2)
      v17 = 1;
    else
      v17 = 2;
    v16 = v14;
LABEL_45:
    ++v14;
  }
  while (v14 < 0xAAAAAAAAAAAAAAABLL * ((v9 - (uint64_t)v10) >> 3));
  if (!a5)
    goto LABEL_48;
LABEL_47:
  *a5 = objc_retainAutorelease(v42);
LABEL_48:

  return v8;
}

+ (int)colInImage:(vImage_Buffer *)a3 forPoint:(int)a4 inActivationMapWithSize:(int)a5
{
  return (a3->width - 18) * a4 / a5 + 9;
}

+ (id)characterCentroidsFromActivationMap:(void *)a3 codeMap:(const int *)a4 potentialPatterns:(id)a5 minWordLengthFractionForCorrelationPeak:(float)a6 bestModelIndex:(int64_t *)a7
{
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  float v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  float v23;
  id v24;
  int64_t *v26;
  id obj;
  float v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v26 = a7;
  *a7 = -1;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v15 = 0;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    v18 = INFINITY;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        v28 = 0.0;
        *(float *)&v14 = a6;
        objc_msgSend(a1, "fitSpacingModel:toActivationMap:codeMap:minWordLengthFractionForCorrelationPeak:cost:", v20, a3, a4, &v28, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        v23 = v28;
        if (v28 < v18)
        {
          v24 = v21;

          *v26 = v15 + i;
          v16 = v24;
          v18 = v23;
        }

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v15 += i;
    }
    while (v13);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)decodeStringWithCentroids:(id)a3 activationMap:(const void *)a4 codeMap:(const int *)a5 model:(id)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  int v21;
  unint64_t v22;
  void *v23;
  double v24;
  uint64_t v25;
  int v26;
  uint64_t *v27;
  unint64_t v28;
  float v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  double *v34;
  _BYTE *v35;
  double *v36;
  double v37;
  double v38;
  int v39;
  void *v40;
  id v41;
  id v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *__p;
  char *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v43 = a6;
  objc_msgSend(v43, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  if (v10 == objc_msgSend(v44, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v44;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v12)
    {
      v49 = 0;
      v50 = v9;
      v47 = *(_QWORD *)v57;
      v51 = v11;
      while (2)
      {
        v13 = 0;
        v46 = v12;
        do
        {
          if (*(_QWORD *)v57 != v47)
            objc_enumerationMutation(obj);
          v48 = v13;
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v13);
          v15 = objc_msgSend(v9, "characterAtIndex:", v49);
          v16 = objc_msgSend(v14, "intValue");
          if (v16 <= 2)
            v17 = 2;
          else
            v17 = v16;
          v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
          v19 = v18 - 1;
          v20 = v18 - 1;
          if (v19 >= v16 + 2)
            v21 = v16 + 2;
          else
            v21 = v20;
          v22 = (uint64_t)(*(_QWORD *)(*(_QWORD *)a4 + 24 * v16 + 8) - *(_QWORD *)(*(_QWORD *)a4 + 24 * v16)) >> 2;
          v53 = 0;
          std::vector<double>::vector(&__p, v22, &v53);
          objc_msgSend(MEMORY[0x24BDD16A8], "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (v17 - 2);
          if ((int)v25 > v21)
          {
LABEL_23:
            if (__p == v55)
            {
              v35 = __p;
            }
            else
            {
              v34 = (double *)((char *)__p + 8);
              v35 = __p;
              if ((char *)__p + 8 != v55)
              {
                v24 = *(double *)__p;
                v35 = __p;
                v36 = (double *)((char *)__p + 8);
                do
                {
                  v37 = *v36++;
                  v38 = v37;
                  if (v24 < v37)
                  {
                    v24 = v38;
                    v35 = v34;
                  }
                  v34 = v36;
                }
                while (v36 != (double *)v55);
              }
            }
            LOWORD(v53) = *(const int *)((char *)a5 + ((v35 - (_BYTE *)__p) << 29 >> 30));
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v53, 1, v24);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "appendString:", v40);

            ++v49;
            v39 = 1;
          }
          else
          {
            v26 = v21 + 1;
            while (1)
            {
              v27 = (uint64_t *)(*(_QWORD *)a4 + 24 * v25);
              if (v27[1] == *v27)
              {
                v39 = 0;
                goto LABEL_34;
              }
              v28 = 0;
              v29 = -INFINITY;
              v30 = 0xFFFFFFFFLL;
              do
              {
                v31 = objc_msgSend(a1, "matchLabel:toModelCharacter:", a5[v28], v15);
                v32 = *v27;
                if (v31 && *(float *)(v32 + 4 * v28) > v29)
                {
                  v30 = v28;
                  v29 = *(float *)(v32 + 4 * v28);
                }
                ++v28;
              }
              while (v28 < (v27[1] - v32) >> 2);
              if ((v30 & 0x80000000) != 0)
                break;
              *((double *)__p + v30) = *((double *)__p + v30) + v29;
              LOWORD(v53) = a5[v30];
              v9 = v50;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v53, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = v51;
              objc_msgSend(v23, "appendString:", v33);

              if (v26 == (_DWORD)++v25)
                goto LABEL_23;
            }
            v39 = 0;
            v9 = v50;
            v11 = v51;
          }
LABEL_34:

          if (__p)
          {
            v55 = (char *)__p;
            operator delete(__p);
          }
          if (!v39)
          {

            v41 = 0;
            goto LABEL_42;
          }
          v13 = v48 + 1;
        }
        while (v48 + 1 != v46);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v12)
          continue;
        break;
      }
    }

    v41 = v11;
LABEL_42:

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

+ (id)textFromActivationMap:(void *)a3 codeMap:(const int *)a4 invert:(BOOL)a5
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float *v23;
  float **v24;
  unint64_t v25;
  _QWORD *v26;
  float *v27;
  float *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  float *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void **v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[5];

  v73[3] = *MEMORY[0x24BDAC8D0];
  v5 = *(uint64_t **)a3;
  v6 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
  if (v6)
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v65 = 0;
    v66 = 0;
    v64 = 0;
    v10 = v5;
    v9 = (uint64_t *)*v5;
    v11 = -1431655765 * ((v10[1] - (uint64_t)v9) >> 3);
    if ((int)v8 < 2)
    {
      std::vector<std::vector<float>>::resize(&v64, v11);
      if (v11 >= 1)
      {
        v37 = 0;
        v38 = 24 * v11;
        do
        {
          v39 = **(_QWORD **)a3;
          if (v64 != v39)
            std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)(v64 + v37), *(char **)(v39 + v37), *(_QWORD *)(v39 + v37 + 8), (uint64_t)(*(_QWORD *)(v39 + v37 + 8) - *(_QWORD *)(v39 + v37)) >> 2);
          v37 += 24;
        }
        while (v38 != v37);
      }
    }
    else
    {
      v13 = *v9;
      v12 = v9[1];
      std::vector<std::vector<float>>::resize(&v64, v11);
      if (v11 >= 1)
      {
        v15 = 0;
        v61 = v11;
        v62 = (unint64_t)(v12 - v13) >> 2;
        do
        {
          if ((int)v62 >= 1)
          {
            v16 = 0;
            do
            {
              v17 = *(uint64_t **)a3;
              v18 = 0.0;
              v19 = v8;
              do
              {
                v20 = *v17;
                v17 += 3;
                v18 = v18 + *(float *)(*(_QWORD *)(v20 + 24 * v15) + 4 * v16);
                --v19;
              }
              while (v19);
              v21 = v64 + 24 * v15;
              v22 = v18 / (float)(int)v8;
              v24 = (float **)(v21 + 8);
              v23 = *(float **)(v21 + 8);
              v26 = (_QWORD *)(v21 + 16);
              v25 = *(_QWORD *)(v21 + 16);
              if ((unint64_t)v23 >= v25)
              {
                v28 = *(float **)v21;
                v29 = ((uint64_t)v23 - *(_QWORD *)v21) >> 2;
                v30 = v29 + 1;
                if ((unint64_t)(v29 + 1) >> 62)
                  std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                v31 = v25 - (_QWORD)v28;
                if (v31 >> 1 > v30)
                  v30 = v31 >> 1;
                if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL)
                  v32 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v32 = v30;
                if (v32)
                {
                  v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v26, v32);
                  v23 = *v24;
                  v28 = *(float **)v21;
                }
                else
                {
                  v33 = 0;
                }
                v34 = (float *)&v33[4 * v29];
                *v34 = v22;
                v27 = v34 + 1;
                while (v23 != v28)
                {
                  v35 = *((_DWORD *)v23-- - 1);
                  *((_DWORD *)v34-- - 1) = v35;
                }
                *(_QWORD *)v21 = v34;
                *v24 = v27;
                *v26 = &v33[4 * v32];
                if (v28)
                  operator delete(v28);
              }
              else
              {
                *v23 = v22;
                v27 = v23 + 1;
              }
              *v24 = v27;
              ++v16;
            }
            while (v16 != v62);
          }
          ++v15;
        }
        while (v15 != v61);
      }
    }
    if (v65 == v64)
    {
      v36 = 0;
    }
    else
    {
      v67 = 0;
      LODWORD(v14) = 1060320051;
      objc_msgSend(a1, "characterCentroidsFromActivationMap:codeMap:potentialPatterns:minWordLengthFractionForCorrelationPeak:bestModelIndex:", &v64, a4, &unk_24C5A51D8, &v67, v14);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = MEMORY[0x24BDBD1A8];
      if (v40
        && (objc_msgSend(&unk_24C5A51D8, "objectAtIndexedSubscript:", v67),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(a1, "decodeStringWithCentroids:activationMap:codeMap:model:", v40, &v64, a4, v42),
            v43 = (void *)objc_claimAutoreleasedReturnValue(),
            v42,
            v43))
      {
        v44 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "_newZStringWithString:", v43);
        v72[0] = v44;
        v72[1] = v40;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0xAAAAAAAAAAAAAAABLL * ((v65 - v64) >> 3));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v72[2] = v45;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v73[0] = &stru_24C599708;
        v73[1] = v41;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0xAAAAAAAAAAAAAAABLL * ((v65 - v64) >> 3));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v73[2] = v44;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0;
      }

      v63 = 0;
      LODWORD(v47) = 1050253722;
      objc_msgSend(a1, "characterCentroidsFromActivationMap:codeMap:potentialPatterns:minWordLengthFractionForCorrelationPeak:bestModelIndex:", &v64, a4, &unk_24C5A51F0, &v63, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48
        && (objc_msgSend(&unk_24C5A51F0, "objectAtIndexedSubscript:", v63),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(a1, "decodeStringWithCentroids:activationMap:codeMap:model:", v48, &v64, a4, v49),
            v50 = (void *)objc_claimAutoreleasedReturnValue(),
            v49,
            v50))
      {
        v51 = (void *)objc_msgSend(v48, "mutableCopy");
        for (i = 0; i < objc_msgSend(v48, "count"); ++i)
        {
          v53 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v51, "objectAtIndexedSubscript:", i);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "numberWithInteger:", 2 * objc_msgSend(v54, "integerValue"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setObject:atIndexedSubscript:", v55, i);

        }
        v70[0] = v50;
        v70[1] = v51;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0x5555555555555556 * ((v65 - v64) >> 3));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v57;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v71[0] = &stru_24C599708;
        v71[1] = v41;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0xAAAAAAAAAAAAAAABLL * ((v65 - v64) >> 3));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v71[2] = v51;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 3);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
      }

      v68[0] = CFSTR("CardNumber");
      v68[1] = CFSTR("Expiration");
      v69[0] = v46;
      v69[1] = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v67 = (void **)&v64;
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v67);
  }
  else
  {
    v36 = 0;
  }
  return v36;
}

+ (void)extractActivationSignals:(void *)a3 fromActivationMap:(const void *)a4 forModel:(id)a5 codeMap:(const int *)a6
{
  id v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  BOOL v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  float *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int *v38;
  int *v39;
  uint64_t v40;
  float v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  float *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v55;
  int v56;
  void *__p;
  void *v58;
  uint64_t v59;
  void *v60;
  _BYTE *v61;
  char *v62;
  char *v63;
  unint64_t v64;

  v9 = a5;
  if (*((_QWORD *)a4 + 1) != *(_QWORD *)a4)
  {
    v51 = v9;
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24C599708);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v52 = **(_QWORD **)a4;
    v53 = *(_QWORD *)(*(_QWORD *)a4 + 8);
    v11 = (char *)a3 + 8;
    if ((unint64_t)((v53 - v52) >> 2) <= 1)
      v12 = 1;
    else
      v12 = (v53 - v52) >> 2;
    while (v10 < objc_msgSend(v55, "length"))
    {
      v13 = objc_msgSend(v55, "characterAtIndex:", v10);
      v14 = v13;
      v15 = *v11;
      if (!*v11)
        goto LABEL_16;
      v16 = v11;
      do
      {
        v17 = *(_DWORD *)(v15 + 32);
        v18 = v17 < (int)v13;
        if (v17 >= (int)v13)
          v19 = (uint64_t *)v15;
        else
          v19 = (uint64_t *)(v15 + 8);
        if (!v18)
          v16 = (_QWORD *)v15;
        v15 = *v19;
      }
      while (*v19);
      if (v16 == v11 || *((_DWORD *)v16 + 8) > (int)v13)
      {
LABEL_16:
        v62 = 0;
        v63 = 0;
        v64 = 0;
        if (v53 != v52)
        {
          v20 = 0;
          do
          {
            if (objc_msgSend(a1, "matchLabel:toModelCharacter:", a6[v20], v14))
            {
              v21 = v63;
              if ((unint64_t)v63 >= v64)
              {
                v23 = v62;
                v24 = (v63 - v62) >> 2;
                v25 = v24 + 1;
                if ((unint64_t)(v24 + 1) >> 62)
                  std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                v26 = v64 - (_QWORD)v62;
                if ((uint64_t)(v64 - (_QWORD)v62) >> 1 > v25)
                  v25 = v26 >> 1;
                if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
                  v27 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v27 = v25;
                if (v27)
                {
                  v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v64, v27);
                  v23 = v62;
                  v21 = v63;
                }
                else
                {
                  v28 = 0;
                }
                v29 = &v28[4 * v24];
                *(_DWORD *)v29 = v20;
                v22 = v29 + 4;
                while (v21 != v23)
                {
                  v30 = *((_DWORD *)v21 - 1);
                  v21 -= 4;
                  *((_DWORD *)v29 - 1) = v30;
                  v29 -= 4;
                }
                v62 = v29;
                v63 = v22;
                v64 = (unint64_t)&v28[4 * v27];
                if (v23)
                  operator delete(v23);
              }
              else
              {
                *(_DWORD *)v63 = v20;
                v22 = v21 + 4;
              }
              v63 = v22;
            }
            ++v20;
          }
          while (v20 != v12);
        }
        v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3);
        v56 = 0;
        std::vector<float>::vector(&v60, v31, &v56);
        v32 = *(uint64_t **)a4;
        v33 = *((_QWORD *)a4 + 1);
        v34 = (float *)v60;
        v35 = v33 - *(_QWORD *)a4;
        if (v33 != *(_QWORD *)a4)
        {
          v36 = 0;
          v37 = v35 / 24;
          v38 = (int *)v62;
          v39 = (int *)v63;
          if (v37 <= 1)
            v37 = 1;
          do
          {
            if (v38 != v39)
            {
              v40 = v32[3 * v36];
              v41 = v34[v36];
              v42 = v38;
              do
              {
                v43 = *v42++;
                v41 = v41 + *(float *)(v40 + 4 * v43);
                v34[v36] = v41;
              }
              while (v42 != v39);
            }
            ++v36;
          }
          while (v36 != v37);
        }
        v56 = v14;
        v58 = 0;
        v59 = 0;
        __p = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v34, (uint64_t)v61, (v61 - (_BYTE *)v34) >> 2);
        std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)a3, v56, (uint64_t)&v56);
        v11 = (char *)a3 + 8;
        if (__p)
        {
          v58 = __p;
          operator delete(__p);
        }
        if (v60)
        {
          v61 = v60;
          operator delete(v60);
        }
        if (v62)
        {
          v63 = v62;
          operator delete(v62);
        }
      }
      ++v10;
    }
    if (v53 == v52)
    {
LABEL_55:
      v44 = 0;
    }
    else
    {
      v44 = 0;
      while (a6[v44] != 103)
      {
        if (v12 == ++v44)
          goto LABEL_55;
      }
    }
    std::vector<float>::vector(&v62, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 3));
    v45 = *(uint64_t **)a4;
    v46 = v62;
    v47 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
    if (v47)
    {
      v48 = v47 / 24;
      if (v48 <= 1)
        v48 = 1;
      v49 = (float *)v62;
      do
      {
        v50 = *v45;
        v45 += 3;
        *v49++ = 1.0 - *(float *)(v50 + 4 * v44);
        --v48;
      }
      while (v48);
    }
    v56 = -1;
    v58 = 0;
    v59 = 0;
    __p = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v46, (uint64_t)v63, (v63 - v46) >> 2);
    std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)a3, v56, (uint64_t)&v56);
    if (__p)
    {
      v58 = __p;
      operator delete(__p);
    }
    if (v62)
    {
      v63 = v62;
      operator delete(v62);
    }

    v9 = v51;
  }

}

+ (BOOL)matchLabel:(int)a3 toModelCharacter:(unsigned __int16)a4
{
  BOOL v4;
  BOOL v5;

  v4 = a4 == a3;
  if (a4 == 64)
    v4 = (a3 - 58) < 0xFFFFFFF6;
  v5 = a4 == 63 || v4;
  if (a4 == 35)
    v5 = (a3 - 48) < 0xA;
  return a3 != 103 && v5;
}

+ (id)fitSpacingModel:(id)a3 toActivationMap:(const void *)a4 codeMap:(const int *)a5 minWordLengthFractionForCorrelationPeak:(float)a6 cost:(float *)a7
{
  id v11;
  id v12;
  uint64_t i;
  void *v14;
  int v15;
  void *v16;
  std::vector<int>::pointer begin;
  char *v18;
  float *v19;
  unint64_t v20;
  id v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  float v26;
  float v27;
  char *v28;
  int *v29;
  int **v30;
  unint64_t v31;
  int *v32;
  _DWORD *v33;
  _DWORD *v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  char *v47;
  char *v48;
  void *v49;
  void *v50;
  int *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  float *v57;
  float *v58;
  float *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  float *v65;
  int v66;
  int *v67;
  int v68;
  int **v69;
  int *v70;
  BOOL v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  float v75;
  int v76;
  float v77;
  char *v78;
  uint64_t v79;
  float *v80;
  _QWORD *v81;
  float v82;
  uint64_t v83;
  id v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  size_t v89;
  unint64_t v90;
  char *v91;
  size_t v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  int v96;
  int v97;
  uint64_t *v98;
  uint64_t **v99;
  uint64_t *v100;
  uint64_t **v101;
  int v102;
  uint64_t **v103;
  uint64_t v104;
  unint64_t j;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  float *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  _QWORD *v113;
  uint64_t *v114;
  uint64_t **v115;
  uint64_t **v116;
  int v117;
  int v118;
  uint64_t *v119;
  _DWORD *v120;
  float *v121;
  unint64_t v122;
  float *v123;
  float *v124;
  uint64_t v125;
  _BOOL4 v126;
  unint64_t v127;
  unint64_t v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  void **v132;
  float v133;
  float *v134;
  float *v135;
  unint64_t v136;
  float v137;
  float v138;
  float v139;
  _QWORD *v140;
  _QWORD *v141;
  char *v142;
  void **v143;
  int v144;
  char *v145;
  void **v146;
  char *v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  void **v151;
  float v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  char *v156;
  char *v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v160;
  char *v161;
  char *v162;
  int v163;
  void *v164;
  char *v165;
  _QWORD *v166;
  void *v167;
  unsigned int *v168;
  unint64_t v169;
  void *v170;
  id v171;
  id v172;
  size_t v173;
  _DWORD *v174;
  id v175;
  unint64_t v176;
  float v177;
  id v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  id v183;
  int v184;
  int v185;
  void *v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  float v190;
  float v191;
  float v192;
  int v193;
  uint64_t *v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  float v199;
  float *v201;
  char *v202;
  float v203;
  unint64_t v204;
  float v205;
  uint64_t v206;
  float v207;
  float *v208;
  int v209;
  uint64_t v210;
  unint64_t v211;
  uint64_t v212;
  char *v213;
  id v214;
  uint64_t v215;
  float v216;
  void *v217;
  unint64_t v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  char *v222;
  uint64_t v223;
  uint64_t v224;
  _QWORD *v225;
  _DWORD *v226;
  uint64_t v227;
  unint64_t v228;
  char v229;
  double v230;
  void *v231;
  void **v232;
  void **v233;
  unint64_t v234;
  int v235;
  void *v236;
  unint64_t k;
  void *v238;
  unint64_t v239;
  id v241;
  float *v242;
  uint64_t v243;
  id v244;
  uint64_t v245;
  const int *v246;
  uint64_t v247;
  uint64_t *v248;
  _QWORD *v249;
  char **v250;
  uint64_t v251;
  const int *v252;
  id v253;
  _QWORD *v254;
  id v255;
  int v256;
  char **v257;
  void **v258;
  void **v259;
  uint64_t v260;
  float *v261;
  float *v262;
  uint64_t v263;
  uint64_t *v264;
  uint64_t *v265;
  uint64_t v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  uint64_t v271;
  char *v272;
  uint64_t v273;
  char *v274;
  char *v275;
  char *v276;
  _QWORD **v277;
  _QWORD *v278;
  uint64_t v279;
  float *v280;
  float *v281;
  float *v282;
  char *v283;
  char *v284;
  char *v285;
  std::vector<int> v286;
  _QWORD v287[19];

  v242 = a7;
  v287[16] = *MEMORY[0x24BDAC8D0];
  v244 = a3;
  v253 = a1;
  v249 = a4;
  objc_msgSend(a1, "characterCentroidsFromActivationMap:codeMap:decodedSymbolIndexes:", a4, a5, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v12 = 0;
    goto LABEL_297;
  }
  v252 = a5;
  std::vector<int>::vector(&v286, objc_msgSend(v11, "count") - 1);
  for (i = 0; i + 1 < (unint64_t)objc_msgSend(v11, "count"); ++i)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", i);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    objc_msgSend(v11, "objectAtIndexedSubscript:", i + 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "intValue");

    v286.__begin_[i] = (_DWORD)v14 - v15;
  }
  v284 = 0;
  v285 = 0;
  v280 = 0;
  v281 = 0;
  v282 = 0;
  v283 = 0;
  begin = v286.__begin_;
  if (v286.__end_ != v286.__begin_)
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v254 = &v282;
    LODWORD(v255) = -1;
    while (1)
    {
      v21 = v11;
      v22 = begin[v20];
      if (v281 == v19)
        break;
      v23 = 0;
      v24 = v281 - v19;
      if (v24 <= 1)
        v24 = 1;
      v25 = -1;
      v26 = INFINITY;
      do
      {
        v27 = vabds_f32(v19[v23], (float)v22);
        if (v27 < 4.0 && v27 < v26)
        {
          v26 = v27;
          v25 = v23;
        }
        ++v23;
      }
      while (v24 != v23);
      if (v25 < 0)
        break;
      v28 = &v18[24 * v25];
      v30 = (int **)(v28 + 8);
      v29 = (int *)*((_QWORD *)v28 + 1);
      v31 = *((_QWORD *)v28 + 2);
      if ((unint64_t)v29 >= v31)
      {
        v51 = *(int **)v28;
        v52 = ((uint64_t)v29 - *(_QWORD *)v28) >> 2;
        v53 = v52 + 1;
        if ((unint64_t)(v52 + 1) >> 62)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v54 = v31 - (_QWORD)v51;
        if (v54 >> 1 > v53)
          v53 = v54 >> 1;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
          v55 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v55 = v53;
        if (v55)
        {
          v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v28 + 16), v55);
          v29 = *v30;
          v51 = *(int **)v28;
        }
        else
        {
          v56 = 0;
        }
        v67 = (int *)&v56[4 * v52];
        *v67 = v22;
        v32 = v67 + 1;
        while (v29 != v51)
        {
          v68 = *--v29;
          *--v67 = v68;
        }
        *(_QWORD *)v28 = v67;
        *v30 = v32;
        *((_QWORD *)v28 + 2) = &v56[4 * v55];
        if (v51)
          operator delete(v51);
      }
      else
      {
        *v29 = v22;
        v32 = v29 + 1;
      }
      *v30 = v32;
      v18 = v283;
      v11 = v21;
LABEL_70:
      v69 = (int **)&v18[24 * v25];
      v70 = *v69;
      v72 = (char *)v69[1] - (char *)*v69;
      v71 = v72 == 0;
      v73 = v72 >> 2;
      if (v71)
      {
        v75 = 0.0;
      }
      else
      {
        if (v73 <= 1)
          v74 = 1;
        else
          v74 = v73;
        v75 = 0.0;
        do
        {
          v76 = *v70++;
          v75 = v75 + (float)v76;
          --v74;
        }
        while (v74);
      }
      v77 = v75 / (float)v73;
      v19 = v280;
      v280[v25] = v77;
      ++v20;
      begin = v286.__begin_;
      if (v20 >= v286.__end_ - v286.__begin_)
      {
        v78 = v284;
        goto LABEL_81;
      }
    }
    v33 = operator new(4uLL);
    v34 = v33;
    *v33 = v22;
    v35 = (unint64_t)(v33 + 1);
    v36 = v284;
    if (v284 < v285)
    {
      *(_QWORD *)v284 = v33;
      *((_QWORD *)v36 + 1) = v35;
      v37 = v36 + 24;
      *((_QWORD *)v36 + 2) = v35;
      v11 = v21;
LABEL_46:
      v284 = v37;
      v57 = v281;
      if (v281 >= v282)
      {
        v59 = v280;
        v60 = v281 - v280;
        v61 = v60 + 1;
        if ((unint64_t)(v60 + 1) >> 62)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v62 = (char *)v282 - (char *)v280;
        if (((char *)v282 - (char *)v280) >> 1 > v61)
          v61 = v62 >> 1;
        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFFCLL)
          v63 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v63 = v61;
        if (v63)
        {
          v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v254, v63);
          v59 = v280;
          v57 = v281;
        }
        else
        {
          v64 = 0;
        }
        v65 = (float *)&v64[4 * v60];
        *v65 = 0.0;
        v58 = v65 + 1;
        while (v57 != v59)
        {
          v66 = *((_DWORD *)v57-- - 1);
          *((_DWORD *)v65-- - 1) = v66;
        }
        v280 = v65;
        v281 = v58;
        v282 = (float *)&v64[4 * v63];
        if (v59)
          operator delete(v59);
      }
      else
      {
        *v281 = 0.0;
        v58 = v57 + 1;
      }
      v281 = v58;
      v18 = v283;
      v25 = (_DWORD)v255 - 1431655765 * ((unint64_t)(v284 - v283) >> 3);
      goto LABEL_70;
    }
    v38 = 0xAAAAAAAAAAAAAAABLL * ((v284 - v18) >> 3);
    v39 = v38 + 1;
    if (v38 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * ((v285 - v18) >> 3) > v39)
      v39 = 0x5555555555555556 * ((v285 - v18) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * ((v285 - v18) >> 3) >= 0x555555555555555)
      v40 = 0xAAAAAAAAAAAAAAALL;
    else
      v40 = v39;
    v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v40);
    v43 = &v41[24 * v38];
    *((_QWORD *)v43 + 1) = 0;
    *((_QWORD *)v43 + 2) = 0;
    *(_QWORD *)v43 = v34;
    *(int64x2_t *)(v43 + 8) = vdupq_n_s64(v35);
    v37 = v43 + 24;
    v44 = v283;
    v45 = v284;
    if (v284 == v283)
    {
      v283 = v43;
      v284 = v43 + 24;
      v285 = &v41[24 * v42];
    }
    else
    {
      do
      {
        *((_QWORD *)v43 - 3) = 0;
        *((_QWORD *)v43 - 2) = 0;
        v43 -= 24;
        *((_QWORD *)v43 + 2) = 0;
        v46 = *(_OWORD *)(v45 - 24);
        v45 -= 24;
        *(_OWORD *)v43 = v46;
        *((_QWORD *)v43 + 2) = *((_QWORD *)v45 + 2);
        *(_QWORD *)v45 = 0;
        *((_QWORD *)v45 + 1) = 0;
        *((_QWORD *)v45 + 2) = 0;
      }
      while (v45 != v44);
      v45 = v283;
      v47 = v284;
      v283 = v43;
      v284 = v37;
      v285 = &v41[24 * v42];
      if (v47 != v45)
      {
        v48 = v47;
        do
        {
          v50 = (void *)*((_QWORD *)v48 - 3);
          v48 -= 24;
          v49 = v50;
          if (v50)
          {
            *((_QWORD *)v47 - 2) = v49;
            operator delete(v49);
          }
          v47 = v48;
        }
        while (v48 != v45);
        v11 = v21;
        if (!v45)
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    v11 = v21;
    if (!v45)
      goto LABEL_46;
LABEL_45:
    operator delete(v45);
    goto LABEL_46;
  }
  v18 = 0;
  v78 = 0;
LABEL_81:
  LODWORD(v79) = -1431655765 * ((v78 - v18) >> 3);
  if ((int)v79 < 1)
  {
    v82 = 0.0;
  }
  else
  {
    v80 = v280;
    v79 = v79;
    v81 = v18 + 8;
    v82 = 0.0;
    LODWORD(v83) = 0x80000000;
    do
    {
      if ((int)v83 < (int)((*v81 - *(v81 - 1)) >> 2))
      {
        v82 = *v80;
        v83 = (*v81 - *(v81 - 1)) >> 2;
      }
      ++v80;
      v81 += 3;
      --v79;
    }
    while (v79);
  }
  v278 = 0;
  v279 = 0;
  v277 = &v278;
  v84 = v253;
  v253 = v11;
  v254 = &v278;
  objc_msgSend(v84, "extractActivationSignals:fromActivationMap:forModel:codeMap:", &v277, v249, v244, v252);
  if (!v279)
  {
    v12 = 0;
    goto LABEL_293;
  }
  objc_msgSend(v244, "componentsSeparatedByString:", CFSTR(" "));
  v241 = (id)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v241, "count");
  v86 = v85;
  v274 = 0;
  v275 = 0;
  v276 = 0;
  v257 = &v274;
  LOBYTE(v258) = 0;
  if (v85)
  {
    if (v85 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v85);
    v274 = v87;
    v276 = &v87[24 * v88];
    v89 = 24 * ((24 * v86 - 24) / 0x18) + 24;
    bzero(v87, v89);
    v275 = &v87[v89];
  }
  v90 = objc_msgSend(v241, "count");
  v271 = 0;
  v272 = 0;
  v273 = 0;
  v257 = (char **)&v271;
  LOBYTE(v258) = 0;
  if (v90)
  {
    std::vector<std::vector<std::vector<float>>>::__vallocate[abi:ne180100](&v271, v90);
    v91 = v272;
    v92 = 24 * ((24 * v90 - 24) / 0x18) + 24;
    bzero(v272, v92);
    v272 = &v91[v92];
  }
  v267 = 0u;
  v268 = 0u;
  v269 = 0u;
  v270 = 0u;
  v255 = v241;
  v93 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v267, v287, 16);
  if (v93)
  {
    v251 = 0;
    v247 = *(_QWORD *)v268;
    do
    {
      v252 = 0;
      v246 = (const int *)v93;
      do
      {
        if (*(_QWORD *)v268 != v247)
          objc_enumerationMutation(v255);
        v94 = 0;
        v95 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * (_QWORD)v252);
        v265 = 0;
        v266 = 0;
        v264 = (uint64_t *)&v265;
        while (v94 < objc_msgSend(v95, "length"))
        {
          v96 = objc_msgSend(v95, "characterAtIndex:", v94);
          v97 = v96;
          v98 = v265;
          if (!v265)
            goto LABEL_110;
          v99 = &v265;
          do
          {
            v100 = v98;
            v101 = v99;
            v102 = *((_DWORD *)v98 + 8);
            v103 = (uint64_t **)(v98 + 1);
            if (v102 >= v96)
            {
              v103 = (uint64_t **)v100;
              v99 = (uint64_t **)v100;
            }
            v98 = *v103;
          }
          while (v98);
          if (v99 == &v265)
            goto LABEL_110;
          if (v102 < v96)
            v100 = (uint64_t *)v101;
          if (*((_DWORD *)v100 + 8) > v96)
          {
LABEL_110:
            v104 = objc_msgSend(v95, "length");
            LODWORD(v257) = 0;
            std::vector<float>::vector(&v261, (unint64_t)(float)((float)((float)(unint64_t)(v104 + 1) * v82) + 1.0), &v257);
            for (j = 0; objc_msgSend(v95, "length") + 2 > j; ++j)
            {
              if (j)
              {
                if (j != objc_msgSend(v95, "length") + 1
                  && objc_msgSend(v95, "characterAtIndex:", j - 1) == v97)
                {
                  v106 = (int)(float)((float)((float)(int)j * v82) + 0.0);
                  if ((v106 & 0x80000000) == 0 && v106 < v262 - v261)
                    v261[v106] = 1.0;
                }
              }
            }
            LODWORD(v257) = v97;
            v259 = 0;
            v260 = 0;
            v258 = 0;
            std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v258, v261, (uint64_t)v262, v262 - v261);
            std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)&v264, (int)v257, (uint64_t)&v257);
            if (v258)
            {
              v259 = v258;
              operator delete(v258);
            }
            if (v261)
            {
              v262 = v261;
              operator delete(v261);
            }
          }
          ++v94;
        }
        v107 = objc_msgSend(v95, "length");
        LODWORD(v257) = 0;
        std::vector<float>::vector(&v261, (unint64_t)(float)((float)((float)(unint64_t)(v107 + 1) * v82) + 1.0), &v257);
        if (v262 != v261)
          *v261 = -1.0;
        v108 = (int)(float)((float)((float)(unint64_t)(objc_msgSend(v95, "length") + 1) * v82) + 0.0);
        v109 = v261;
        v110 = (uint64_t)v262;
        if ((v108 & 0x80000000) != 0)
        {
          v111 = v262 - v261;
        }
        else
        {
          v111 = v262 - v261;
          if (v111 > v108)
            v261[v108] = -1.0;
        }
        LODWORD(v257) = -1;
        v259 = 0;
        v260 = 0;
        v258 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v258, v109, v110, v111);
        std::__tree<std::__value_type<int,std::vector<float>>,std::__map_value_compare<int,std::__value_type<int,std::vector<float>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::vector<float>>>>::__emplace_unique_key_args<int,std::pair<int,std::vector<float>>>((uint64_t *)&v264, (int)v257, (uint64_t)&v257);
        if (v258)
        {
          v259 = v258;
          operator delete(v258);
        }
        v112 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v249[1] - *v249) >> 3);
        v256 = 0;
        std::vector<float>::vector(&v257, v112, &v256);
        v113 = v277;
        if (v277 == v254)
        {
          v126 = 1;
        }
        else
        {
          do
          {
            v114 = v265;
            v115 = &v265;
            v116 = &v265;
            if (v265)
            {
              v117 = *((_DWORD *)v113 + 8);
              do
              {
                while (1)
                {
                  v116 = (uint64_t **)v114;
                  v118 = *((_DWORD *)v114 + 8);
                  if (v118 <= v117)
                    break;
                  v114 = *v116;
                  v115 = v116;
                  if (!*v116)
                    goto LABEL_142;
                }
                if (v118 >= v117)
                {
                  v120 = v116;
                  goto LABEL_145;
                }
                v114 = v116[1];
              }
              while (v114);
              v115 = v116 + 1;
            }
LABEL_142:
            v120 = operator new(0x40uLL);
            v120[8] = *((_DWORD *)v113 + 8);
            *((_QWORD *)v120 + 6) = 0;
            *((_QWORD *)v120 + 7) = 0;
            *((_QWORD *)v120 + 5) = 0;
            *(_QWORD *)v120 = 0;
            *((_QWORD *)v120 + 1) = 0;
            *((_QWORD *)v120 + 2) = v116;
            *v115 = (uint64_t *)v120;
            v119 = (uint64_t *)v120;
            if (*v264)
            {
              v264 = (uint64_t *)*v264;
              v119 = *v115;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v265, v119);
            ++v266;
LABEL_145:
            v121 = (float *)v113[5];
            v122 = (uint64_t)(v113[6] - (_QWORD)v121) >> 2;
            v124 = (float *)*((_QWORD *)v120 + 5);
            v123 = (float *)*((_QWORD *)v120 + 6);
            v125 = (char *)v123 - (char *)v124;
            v126 = v122 >= v123 - v124;
            if (v122 < v123 - v124)
              break;
            v127 = v125 >> 2;
            v128 = v122 + 1;
            v129 = v128 - (v125 >> 2);
            if (v128 != v125 >> 2)
            {
              v130 = 0;
              v131 = v127 >> 1;
              v132 = (void **)v257;
              if (v127 <= 1)
                v127 = 1;
              if (v129 <= 1)
                v129 = 1;
              do
              {
                v133 = 0.0;
                if (v123 != v124)
                {
                  v134 = v121;
                  v135 = v124;
                  v136 = v127;
                  do
                  {
                    v137 = *v134++;
                    v138 = v137;
                    v139 = *v135++;
                    v133 = v133 + (float)(v138 * v139);
                    --v136;
                  }
                  while (v136);
                }
                *((float *)v132 + v130 + v131) = v133 + *((float *)v132 + v130 + v131);
                ++v130;
                ++v121;
              }
              while (v130 != v129);
            }
            v140 = (_QWORD *)v113[1];
            if (v140)
            {
              do
              {
                v141 = v140;
                v140 = (_QWORD *)*v140;
              }
              while (v140);
            }
            else
            {
              do
              {
                v141 = (_QWORD *)v113[2];
                v71 = *v141 == (_QWORD)v113;
                v113 = v141;
              }
              while (!v71);
            }
            v113 = v141;
          }
          while (v141 != v254);
        }
        v142 = (char *)(v271 + 24 * (int)v251);
        v143 = (void **)v257;
        if (v142 != (char *)&v257)
        {
          std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v142, (char *)v257, (uint64_t)v258, ((char *)v258 - (char *)v257) >> 2);
          v143 = (void **)v257;
        }
        if (v126)
        {
          v144 = v251;
          v145 = v274;
          v146 = (void **)&v274[24 * (int)v251];
          if ((unint64_t)((((char *)v258 - (char *)v143) >> 2) - 7) <= 0xFFFFFFFFFFFFFFFBLL)
          {
            v147 = &v274[24 * (int)v251];
            v250 = (char **)(v147 + 8);
            v248 = (uint64_t *)(v147 + 16);
            v148 = 4;
            v149 = 3;
            v245 = (int)v251;
            do
            {
              v150 = objc_msgSend(v95, "length");
              v151 = (void **)v257;
              v152 = *((float *)v257 + v149);
              if (v152 > (float)((float)v150 * a6) && v152 > *((float *)v257 + v149 - 3) && v152 > *((float *)v257 + 3))
              {
                v153 = 0;
                while (v152 >= *(float *)((char *)v257 + v148 + v153))
                {
                  v153 += 4;
                  if (v153 == 20)
                  {
                    v154 = *v250;
                    v155 = *v248;
                    if ((unint64_t)*v250 >= *v248)
                    {
                      v157 = (char *)*v146;
                      v243 = (v154 - (_BYTE *)*v146) >> 2;
                      v158 = v243 + 1;
                      if ((unint64_t)(v243 + 1) >> 62)
                        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
                      v159 = v155 - (_QWORD)v157;
                      if (v159 >> 1 > v158)
                        v158 = v159 >> 1;
                      if ((unint64_t)v159 >= 0x7FFFFFFFFFFFFFFCLL)
                        v160 = 0x3FFFFFFFFFFFFFFFLL;
                      else
                        v160 = v158;
                      if (v160)
                      {
                        v161 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v248, v160);
                        v154 = *v250;
                        v157 = (char *)*v146;
                      }
                      else
                      {
                        v161 = 0;
                      }
                      v162 = &v161[4 * v243];
                      *(_DWORD *)v162 = v149;
                      v156 = v162 + 4;
                      while (v154 != v157)
                      {
                        v163 = *((_DWORD *)v154 - 1);
                        v154 -= 4;
                        *((_DWORD *)v162 - 1) = v163;
                        v162 -= 4;
                      }
                      *v146 = v162;
                      *v250 = v156;
                      *v248 = (uint64_t)&v161[4 * v160];
                      if (v157)
                        operator delete(v157);
                    }
                    else
                    {
                      *(_DWORD *)v154 = v149;
                      v156 = v154 + 4;
                    }
                    *v250 = v156;
                    v151 = (void **)v257;
                    v144 = v245;
                    break;
                  }
                }
              }
              ++v149;
              v148 += 4;
            }
            while ((((char *)v258 - (char *)v151) >> 2) - 3 > v149);
          }
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          v165 = &v145[24 * v144];
          v167 = (void *)*((_QWORD *)v165 + 1);
          v166 = v165 + 8;
          v168 = (unsigned int *)*v146;
          if (v167 != *v146)
          {
            v169 = 0;
            do
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v168[v169]);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v164, "addObject:", v170);

              ++v169;
              v168 = (unsigned int *)*v146;
            }
            while (v169 < (uint64_t)(*v166 - (_QWORD)*v146) >> 2);
          }
          v171 = v164;

          v251 = (v251 + 1);
          v143 = (void **)v257;
          v253 = v171;
        }
        if (v143)
        {
          v258 = v143;
          operator delete(v143);
        }
        if (v261)
        {
          v262 = v261;
          operator delete(v261);
        }
        std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v265);
        if (!v126)
        {

          v12 = 0;
          goto LABEL_292;
        }
        v252 = (const int *)((char *)v252 + 1);
      }
      while (v252 != v246);
      v93 = objc_msgSend(v255, "countByEnumeratingWithState:objects:count:", &v267, v287, 16);
    }
    while (v93);
  }

  v172 = v255;
  objc_msgSend(v255, "count");
  v252 = (const int *)&v241;
  MEMORY[0x24BDAC7A8]();
  v174 = (_DWORD *)((char *)&v241 - ((v173 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v174, v173);
  v175 = v253;
  v176 = objc_msgSend(v172, "count");
  LODWORD(v264) = -1082130432;
  std::vector<float>::vector(&v257, v176, &v264);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v254 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v177 = INFINITY;
  v253 = v175;
  do
  {
    if ((unint64_t)objc_msgSend(v255, "count") < 2)
    {
      v192 = 0.0;
      v193 = -1;
      goto LABEL_247;
    }
    v178 = v175;
    std::vector<float>::vector(&v264, objc_msgSend(v255, "count") - 1);
    v179 = 0;
    v180 = 0;
    v181 = -2;
    while (objc_msgSend(v255, "count") - 1 > v180)
    {
      v182 = &v274[v179];
      if (*(_QWORD *)&v274[v179 + 8] == *(_QWORD *)&v274[v179] || *((_QWORD *)v182 + 4) == *((_QWORD *)v182 + 3))
      {
        *((_DWORD *)v264 + v180) = 2139095040;
      }
      else
      {
        v183 = v255;
        v184 = *(_DWORD *)(*(_QWORD *)v182 + 4 * (int)v174[v181 + 1 + objc_msgSend(v255, "count")]);
        v185 = *(_DWORD *)(*((_QWORD *)v182 + 3) + 4 * (int)v174[v181 + objc_msgSend(v183, "count")]);
        objc_msgSend(v183, "objectAtIndexedSubscript:", v180);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "objectAtIndexedSubscript:", v180 + 1);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = objc_msgSend(v186, "length");
        v189 = objc_msgSend(v187, "length");
        v190 = (double)v184 + (float)(v82 * (float)(unint64_t)(v188 - 1)) * 0.5;
        v191 = (double)v185 - (float)(v82 * (float)(unint64_t)(v189 - 1)) * 0.5;
        *((float *)v264 + v180) = v191 - v190;

        v178 = v253;
      }
      --v181;
      v179 += 24;
      ++v180;
    }
    v194 = v264;
    v195 = v265;
    v196 = (char *)v265 - (char *)v264;
    if ((int)((unint64_t)((char *)v265 - (char *)v264) >> 2) < 1)
    {
      v193 = -1;
      v175 = v178;
    }
    else
    {
      v197 = 0;
      v198 = -1;
      v175 = v178;
      while (1)
      {
        v199 = *(float *)((char *)v264 + v197);
        if (v199 != INFINITY && (v199 < v82 || v199 > (float)(v82 * 6.0)))
          break;
        --v198;
        v197 += 4;
        if ((v196 & 0x3FFFFFFFCLL) == v197)
        {
          v193 = -1;
          goto LABEL_224;
        }
      }
      v209 = objc_msgSend(v255, "count");
      v193 = v209 + v198 - 1;
      v192 = 0.0;
      v194 = v264;
      if (v209 + v198 > 0)
        goto LABEL_245;
      v195 = v265;
      v196 = (char *)v265 - (char *)v264;
    }
LABEL_224:
    v261 = 0;
    v262 = 0;
    v263 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v261, v194, (uint64_t)v195, v196 >> 2);
    std::__sort<std::__less<float,float> &,float *>();
    v201 = v262;
    v202 = (char *)v261;
    if (v262 != v261)
    {
      v202 = (char *)v262;
      while (1)
      {
        v203 = *--v201;
        if (v203 != INFINITY)
          break;
        v202 = (char *)v201;
        if (v201 == v261)
        {
          v202 = (char *)v261;
          break;
        }
      }
    }
    v194 = v264;
    v204 = (char *)v265 - (char *)v264;
    if (v265 == v264)
    {
      v207 = INFINITY;
    }
    else
    {
      if ((int)(v204 >> 2) < 1)
      {
        v192 = INFINITY;
LABEL_244:
        v262 = v261;
        operator delete(v261);
        v194 = v264;
        goto LABEL_245;
      }
      v205 = *(float *)((char *)v261 + (((v202 - (char *)v261) >> 1) & 0xFFFFFFFFFFFFFFFCLL));
      v206 = (v204 >> 2);
      v207 = INFINITY;
      v208 = (float *)v264;
      do
      {
        if (*v208 != INFINITY)
        {
          if (v207 == INFINITY)
            v207 = 0.0;
          v207 = v207 + (float)((float)(*v208 - v205) * (float)(*v208 - v205));
          if (v207 > v177)
            break;
        }
        ++v208;
        --v206;
      }
      while (v206);
    }
    v192 = v207 + 0.0;
    if (v261)
      goto LABEL_244;
LABEL_245:
    if (v194)
    {
      v265 = v194;
      operator delete(v194);
    }
LABEL_247:
    if (v193 < 0 && v192 != INFINITY)
    {
      v210 = 0;
      v211 = 0;
      v212 = -1;
      while (v211 < objc_msgSend(v255, "count"))
      {
        v213 = &v274[v210];
        if (*(_QWORD *)&v274[v210 + 8] != *(_QWORD *)&v274[v210])
        {
          v214 = v255;
          v215 = objc_msgSend(v255, "count");
          v216 = *(float *)(*(_QWORD *)(v271 + v210) + 4 * *(int *)(*(_QWORD *)v213 + 4 * (int)v174[v212 + v215]));
          objc_msgSend(v214, "objectAtIndexedSubscript:", v211);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = objc_msgSend(v217, "length");

          v192 = v192 + (float)((float)v218 - v216);
        }
        ++v211;
        v210 += 24;
        --v212;
      }
      v175 = v253;
    }
    if (v193 < 0 && v192 < v177)
    {
      v219 = 0;
      v220 = 0;
      v221 = -1;
      while (objc_msgSend(v255, "count") > v220)
      {
        v222 = &v274[v219];
        if (*(_QWORD *)&v274[v219 + 8] != *(_QWORD *)&v274[v219])
        {
          v223 = objc_msgSend(v255, "count");
          *((float *)v257 + v220) = (float)*(int *)(*(_QWORD *)v222 + 4 * (int)v174[v221 + v223]);
        }
        ++v220;
        v219 += 24;
        --v221;
      }
      v177 = v192;
      v175 = v253;
    }
    if (v193 >= 1)
    {
      v224 = v193;
      v225 = v274 + 8;
      v226 = v174;
      do
      {
        *v226++ = ((*v225 - *(v225 - 1)) >> 2) - 1;
        v225 += 3;
        --v224;
      }
      while (v224);
    }
    v227 = 0;
    v228 = 0;
    ++*v174;
    v229 = 1;
    while (objc_msgSend(v255, "count") > v228)
    {
      if ((int)v174[v228] >= (unint64_t)((uint64_t)(*(_QWORD *)&v274[v227 + 8] - *(_QWORD *)&v274[v227]) >> 2))
      {
        v174[v228] = 0;
        if (objc_msgSend(v255, "count") - 1 <= v228)
        {
          v229 = 0;
        }
        else
        {
          ++v174[v228 + 1];
          v229 = 1;
        }
      }
      ++v228;
      v227 += 24;
    }
    if ((v229 & 1) == 0)
      break;
    objc_msgSend(v254, "timeIntervalSinceNow");
  }
  while (v230 > -0.1);
  if (v177 != INFINITY)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    v233 = (void **)v257;
    v232 = v258;
    if (v258 != (void **)v257)
    {
      v234 = 0;
      do
      {
        v235 = (int)*((float *)v233 + v234);
        if ((v235 & 0x80000000) == 0)
        {
          objc_msgSend(v255, "objectAtIndexedSubscript:", v234);
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          for (k = 0; objc_msgSend(v236, "length") > k; ++k)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)((double)v235+ (float)(v82 * (float)(unint64_t)(objc_msgSend(v236, "length") - 1)) * -0.5+ (float)(v82 * (float)(int)k)));
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "addObject:", v238);

          }
          v233 = (void **)v257;
          v232 = v258;
        }
        ++v234;
      }
      while (v234 < ((char *)v232 - (char *)v233) >> 2);
    }
    v175 = v231;

  }
  if (v242)
  {
    v239 = objc_msgSend(v244, "length");
    *v242 = v177 / (float)v239;
  }
  v253 = v175;

  if (v257)
  {
    v258 = (void **)v257;
    operator delete(v257);
  }
  v12 = v253;
LABEL_292:
  v257 = (char **)&v271;
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);
  v257 = &v274;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);

  v11 = v253;
LABEL_293:
  std::__tree<std::__value_type<unsigned long long,std::vector<unsigned int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::vector<unsigned int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::vector<unsigned int>>>>::destroy(v278);
  if (v280)
  {
    v281 = v280;
    operator delete(v280);
  }
  v257 = &v283;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v257);
  if (v286.__begin_)
  {
    v286.__end_ = v286.__begin_;
    operator delete(v286.__begin_);
  }
LABEL_297:

  return v12;
}

@end
