@implementation GKScoreParser

- (void)parseScore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  __CFString *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[3];
  char v17;
  _QWORD v18[3];
  char v19;

  v4 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__9;
  v14[4] = __Block_byref_object_dispose__9;
  v15 = 0;
  v5 = (void *)objc_opt_new();
  -[GKScoreParser setPrefix:](self, "setPrefix:", v5);

  v6 = (void *)objc_opt_new();
  -[GKScoreParser setSuffix:](self, "setSuffix:", v6);

  v7 = (void *)objc_opt_new();
  -[GKScoreParser setNumericSeparators:](self, "setNumericSeparators:", v7);

  v8 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__GKScoreParser_parseScore___block_invoke;
  v9[3] = &unk_1E75B4FD0;
  v11 = v18;
  v12 = v16;
  v13 = v14;
  v9[4] = self;
  v10 = CFSTR(" ");
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v9);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);

}

void __28__GKScoreParser_parseScore___block_invoke(uint64_t a1, void *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a2;
  v4 = objc_msgSend(v39, "characterAtIndex:", 0);
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    if ((v4 - 58) <= 0xFFFFFFF5 && v4 != 45)
    {
      objc_msgSend(*(id *)(a1 + 32), "prefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    *(_BYTE *)(v6 + 24) = 1;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (v4 != 45)
    {
      *(_BYTE *)(v19 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "setPrecision:", objc_msgSend(*(id *)(a1 + 32), "precision") + 1);
      goto LABEL_8;
    }
    goto LABEL_35;
  }
  objc_msgSend(*(id *)(a1 + 32), "suffix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    if ((v5 - 48) < 0xA)
    {
      v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "setPrecision:", objc_msgSend(*(id *)(a1 + 32), "precision") + 1);
LABEL_43:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_8;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR(":")))
      {
        v12 = *(void **)(a1 + 32);
        v13 = objc_msgSend(v12, "colonCount");
        objc_msgSend(v12, "setColonCount:", v13 + 1);
        if (v13 >= 2)
          objc_msgSend(*(id *)(a1 + 32), "setError:", 1);
      }
      objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count")
        && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v16, "count") - 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if ((v18 & 1) == 0)
          goto LABEL_31;
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24)
      {
        objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v27, "count") - 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

        objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v26, "count");
        v31 = v30;
        if ((v29 & 1) != 0)
        {
          if (v30 >= 2)
          {
            v32 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);

            if (v32)
            {
              objc_msgSend(*(id *)(a1 + 32), "setError:", 1);
LABEL_31:
              objc_msgSend(*(id *)(a1 + 32), "suffix");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "appendString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

LABEL_32:
              objc_msgSend(*(id *)(a1 + 32), "suffix");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "appendString:", v39);

LABEL_42:
              v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v37 = *(void **)(v36 + 40);
              *(_QWORD *)(v36 + 40) = 0;

              goto LABEL_43;
            }
LABEL_41:
            objc_msgSend(*(id *)(a1 + 32), "setPrecision:", 1);
            goto LABEL_42;
          }
LABEL_40:

          goto LABEL_41;
        }

        if (v31 != 1)
        {
          v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          if (v38 && (objc_msgSend(v38, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "setError:", 1);
          goto LABEL_32;
        }
        objc_msgSend(*(id *)(a1 + 32), "numericSeparators");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      else
      {
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      }
      objc_msgSend(v25, "addObject:", v35);
      goto LABEL_40;
    }
    v20 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v21 = *v20;
      if (v21 && (objc_msgSend(v21, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setError:", 1);
      objc_msgSend(*(id *)(a1 + 32), "suffix");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appendString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      goto LABEL_3;
    }
    objc_storeStrong(v20, a2);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_35:
    *(_BYTE *)(v19 + 24) = 1;
    goto LABEL_8;
  }
LABEL_3:
  objc_msgSend(*(id *)(a1 + 32), "suffix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "appendString:", v39);

LABEL_8:
}

+ (id)formattedDifferenceBetweenFirstScore:(id)a3 secondScore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v52;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "formattedScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parseScore:", v8);

  v9 = (void *)objc_opt_new();
  objc_msgSend(v6, "formattedScore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parseScore:", v10);

  if ((objc_msgSend(v7, "error") & 1) == 0 && (objc_msgSend(v9, "error") & 1) == 0)
  {
    v12 = objc_msgSend(v5, "score");
    v13 = objc_msgSend(v6, "score");
    if (v12 - v13 >= 0)
      v14 = v12 - v13;
    else
      v14 = v13 - v12;
    if (v12 == v13)
    {
      v11 = 0;
      v15 = &stru_1E75BB5A8;
LABEL_62:

      goto LABEL_63;
    }
    objc_msgSend(v7, "numericSeparators");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    objc_msgSend(v9, "numericSeparators");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 >= objc_msgSend(v18, "count"))
      v19 = v7;
    else
      v19 = v9;
    objc_msgSend(v19, "numericSeparators");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v7, "colonCount");
    if (v21 >= objc_msgSend(v9, "colonCount"))
      v22 = v7;
    else
      v22 = v9;
    v23 = objc_msgSend(v22, "colonCount");
    v24 = objc_msgSend(v7, "precision");
    if (v24 >= objc_msgSend(v9, "precision"))
      v25 = v7;
    else
      v25 = v9;
    v26 = objc_msgSend(v25, "precision");
    if (v23 >= 1)
    {
      if ((unint64_t)objc_msgSend(v20, "count") < 2)
      {
        if ((unint64_t)v23 > 1)
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%02ld:%02ld"), v14 / 0xE10, (uint64_t)(v14 % 0xE10) / 60, (uint64_t)(v14 % 0xE10) % 60);
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%02ld"), v14 / 0x3C, v14 % 0x3C, v52);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%02ld:%05.2f"), v14 / 0x57E40, (uint64_t)((double)(v14 % 0x57E40) / 6000.0), (float)((float)(uint64_t)(v14 % 0x57E40 - 6000 * (uint64_t)((double)(v14 % 0x57E40) / 6000.0)) / 100.0));
      }
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_43:
      v39 = objc_msgSend(v5, "score");
      if (v39 >= 0)
        v40 = v39;
      else
        v40 = -v39;
      v41 = objc_msgSend(v6, "score");
      if (v41 >= 0)
        v42 = v41;
      else
        v42 = -v41;
      if (v40 >= v42)
        v43 = v7;
      else
        v43 = v9;
      objc_msgSend(v43, "prefix");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v5, "score");
      if (v45 >= 0)
        v46 = v45;
      else
        v46 = -v45;
      v47 = objc_msgSend(v6, "score");
      if (v47 >= 0)
        v48 = v47;
      else
        v48 = -v47;
      if (v46 >= v48)
        v49 = v7;
      else
        v49 = v9;
      objc_msgSend(v49, "suffix");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v44, v15, v50);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_62;
    }
    v27 = v26;
    objc_msgSend(v7, "numericSeparators");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "count"))
    {
      objc_msgSend(v9, "numericSeparators");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v20, "count");
        if (v27 == 3 && v32 == 1)
          v34 = 0;
        else
          v34 = v27;
        goto LABEL_33;
      }
    }
    else
    {

    }
    v34 = 0;
    v31 = 0;
LABEL_33:
    v35 = (void *)objc_opt_new();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setGroupingSeparator:", v36);

    }
    else
    {
      objc_msgSend(v35, "setGroupingSeparator:", CFSTR(","));
    }
    objc_msgSend(v35, "setGroupingSize:", 3);
    objc_msgSend(v35, "setUsesGroupingSeparator:", 1);
    objc_msgSend(v35, "setDecimalSeparator:", v31);
    objc_msgSend(v35, "setNumberStyle:", 1);
    objc_msgSend(v35, "setMinimumFractionDigits:", v34);
    objc_msgSend(v35, "setMaximumFractionDigits:", v34);
    if (v31 && v34 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(uint64_t)v14 / __exp10((double)v34));
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v38 = (void *)v37;
    objc_msgSend(v35, "stringFromNumber:", v37);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_43;
  }
  v11 = 0;
LABEL_63:

  return v11;
}

- (NSMutableString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (NSMutableString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
  objc_storeStrong((id *)&self->_suffix, a3);
}

- (NSMutableArray)numericSeparators
{
  return self->_numericSeparators;
}

- (void)setNumericSeparators:(id)a3
{
  objc_storeStrong((id *)&self->_numericSeparators, a3);
}

- (int64_t)colonCount
{
  return self->_colonCount;
}

- (void)setColonCount:(int64_t)a3
{
  self->_colonCount = a3;
}

- (int64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(int64_t)a3
{
  self->_precision = a3;
}

- (BOOL)error
{
  return self->_error;
}

- (void)setError:(BOOL)a3
{
  self->_error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numericSeparators, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
