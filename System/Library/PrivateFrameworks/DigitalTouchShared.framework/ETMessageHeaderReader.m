@implementation ETMessageHeaderReader

+ (id)identifierInArchive:(id)a3
{
  id v3;
  _BYTE *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  int v17;
  void *v19;
  void *v20;

  v3 = a3;
  v4 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v3);
  v5 = (int *)MEMORY[0x24BE7AF60];
  v6 = (int *)MEMORY[0x24BE7AF50];
  if (*(_QWORD *)&v4[*MEMORY[0x24BE7AF60]] < *(_QWORD *)&v4[*MEMORY[0x24BE7AF50]])
  {
    v7 = (int *)MEMORY[0x24BE7AF48];
    v8 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (v4[*v7])
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v5;
        v13 = *(_QWORD *)&v4[v12];
        v14 = v13 + 1;
        if (v13 == -1 || v14 > *(_QWORD *)&v4[*v6])
          break;
        v15 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
        *(_QWORD *)&v4[v12] = v14;
        v11 |= (unint64_t)(v15 & 0x7F) << v9;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        if (v10++ >= 9)
        {
          LODWORD(v11) = 0;
          v17 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      v17 = v4[*v7];
      if (v4[*v7])
        LODWORD(v11) = 0;
LABEL_14:
      if (v17 || (v11 & 7) == 4)
        break;
      if ((v11 & 0x7FFF8) == 0x28)
      {
        PBReaderReadString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (!v4[*v7])
          goto LABEL_24;

      }
      else if (!PBReaderSkipValueWithTag())
      {
        break;
      }
    }
    while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
  }
  v20 = 0;
LABEL_24:

  return v20;
}

+ (unsigned)messageTypeInArchive:(id)a3
{
  id v3;
  _BYTE *v4;
  int *v5;
  int *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  char v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  int v27;
  unsigned __int16 v28;
  unsigned int v30;

  v3 = a3;
  v4 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v3);
  v5 = (int *)MEMORY[0x24BE7AF60];
  v6 = (int *)MEMORY[0x24BE7AF50];
  if (*(_QWORD *)&v4[*MEMORY[0x24BE7AF60]] < *(_QWORD *)&v4[*MEMORY[0x24BE7AF50]])
  {
    v7 = (int *)MEMORY[0x24BE7AF48];
    LODWORD(v8) = *MEMORY[0x24BE7AF48];
    v9 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (v4[(int)v8])
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v5;
        v14 = *(_QWORD *)&v4[v13];
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)&v4[*v6])
          break;
        v16 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v14);
        *(_QWORD *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          LODWORD(v12) = 0;
          v18 = v4[*v7];
          goto LABEL_14;
        }
      }
      v4[*v7] = 1;
LABEL_12:
      v18 = v4[*v7];
      if (v4[*v7])
        LODWORD(v12) = 0;
LABEL_14:
      if (v18 || (v12 & 7) == 4)
        break;
      if ((v12 & 0x7FFF8) == 8)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        while (1)
        {
          v23 = *v5;
          v24 = *(_QWORD *)&v4[v23];
          v25 = v24 + 1;
          if (v24 == -1 || v25 > *(_QWORD *)&v4[*v6])
            break;
          v26 = *(_BYTE *)(*(_QWORD *)&v4[*v9] + v24);
          *(_QWORD *)&v4[v23] = v25;
          v22 |= (unint64_t)(v26 & 0x7F) << v20;
          if ((v26 & 0x80) == 0)
            goto LABEL_29;
          v20 += 7;
          v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            v8 = *v7;
            v27 = v4[v8];
            goto LABEL_31;
          }
        }
        v4[*v7] = 1;
LABEL_29:
        v8 = *v7;
        v27 = v4[v8];
        if (v4[v8])
          LODWORD(v22) = 0;
LABEL_31:
        if (!v27)
        {
          v30 = v22 - 1;
          if (v30 >= 6)
            break;
          v28 = word_22C6BA858[v30];
          goto LABEL_34;
        }
      }
      else
      {
        if (!PBReaderSkipValueWithTag())
        {
          v28 = 0;
          goto LABEL_34;
        }
        LODWORD(v8) = *v7;
      }
    }
    while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
  }
  v28 = -1;
LABEL_34:

  return v28;
}

+ (void)getSendTime:(double *)a3 type:(unsigned __int16 *)a4 inArchive:(id)a5
{
  _BYTE *v7;
  char v8;
  char v9;
  int *v10;
  int *v11;
  int *v12;
  int *v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  int v23;
  int v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  unsigned __int16 v38;
  id v39;

  v39 = a5;
  *a4 = -1;
  *a3 = 0.0;
  v7 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v39);
  v8 = 0;
  v9 = 0;
  v10 = (int *)MEMORY[0x24BE7AF60];
  v11 = (int *)MEMORY[0x24BE7AF50];
  v12 = (int *)MEMORY[0x24BE7AF48];
  v13 = (int *)MEMORY[0x24BE7AF30];
  while (*(_QWORD *)&v7[*v10] < *(_QWORD *)&v7[*v11] && !v7[*v12])
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    while (1)
    {
      v17 = *v10;
      v18 = *(_QWORD *)&v7[v17];
      v19 = v18 + 1;
      if (v18 == -1 || v19 > *(_QWORD *)&v7[*v11])
        break;
      v20 = *(_BYTE *)(*(_QWORD *)&v7[*v13] + v18);
      *(_QWORD *)&v7[v17] = v19;
      v16 |= (unint64_t)(v20 & 0x7F) << v14;
      if ((v20 & 0x80) == 0)
        goto LABEL_12;
      v14 += 7;
      v21 = v15++ >= 9;
      if (v21)
      {
        LODWORD(v16) = 0;
        v22 = *v12;
        v23 = v7[v22];
        goto LABEL_14;
      }
    }
    v7[*v12] = 1;
LABEL_12:
    v22 = *v12;
    v23 = v7[v22];
    if (v7[v22])
      LODWORD(v16) = 0;
LABEL_14:
    if (v23 || (v16 & 7) == 4)
      break;
    v25 = (unsigned __int16)(v16 >> 3);
    if (v25 == 2)
    {
      v33 = *v10;
      v34 = *(_QWORD *)&v7[v33];
      if (v34 <= 0xFFFFFFFFFFFFFFF7 && (v35 = v34 + 8, v34 + 8 <= *(_QWORD *)&v7[*v11]))
      {
        v36 = *(_QWORD *)(*(_QWORD *)&v7[*v13] + v34);
        *(_QWORD *)&v7[v33] = v35;
      }
      else
      {
        v36 = 0;
        v7[v22] = 1;
      }
      if (!v7[*v12])
        *a3 = (double)v36 / 1000.0;
      v9 = 1;
    }
    else
    {
      if (v25 == 1)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        while (1)
        {
          v29 = *v10;
          v30 = *(_QWORD *)&v7[v29];
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)&v7[*v11])
            break;
          v32 = *(_BYTE *)(*(_QWORD *)&v7[*v13] + v30);
          *(_QWORD *)&v7[v29] = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0)
            goto LABEL_34;
          v26 += 7;
          v21 = v27++ >= 9;
          if (v21)
          {
            LODWORD(v28) = 0;
            if (v7[*v12])
              goto LABEL_45;
            goto LABEL_35;
          }
        }
        v7[*v12] = 1;
LABEL_34:
        if (v7[*v12])
          goto LABEL_45;
LABEL_35:
        v37 = v28 - 1;
        if (v37 > 5)
          v38 = -1;
        else
          v38 = word_22C6BA858[v37];
        *a4 = v38;
LABEL_45:
        v8 = 1;
        goto LABEL_46;
      }
      if (!PBReaderSkipValueWithTag())
        break;
    }
    if ((v8 & 1) != 0)
    {
LABEL_46:
      if ((v9 & 1) != 0)
        break;
    }
  }

}

+ (double)sendTimeInArchive:(id)a3
{
  id v3;
  _BYTE *v4;
  int *v5;
  int *v6;
  double v7;
  int *v8;
  uint64_t v9;
  int *v10;
  char v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v19;
  int v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v3 = a3;
  v4 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x24BE7AEF8]), "initWithData:", v3);
  v5 = (int *)MEMORY[0x24BE7AF60];
  v6 = (int *)MEMORY[0x24BE7AF50];
  v7 = 0.0;
  if (*(_QWORD *)&v4[*MEMORY[0x24BE7AF60]] < *(_QWORD *)&v4[*MEMORY[0x24BE7AF50]])
  {
    v8 = (int *)MEMORY[0x24BE7AF48];
    LODWORD(v9) = *MEMORY[0x24BE7AF48];
    v10 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (v4[(int)v9])
        break;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      while (1)
      {
        v14 = *v5;
        v15 = *(_QWORD *)&v4[v14];
        v16 = v15 + 1;
        if (v15 == -1 || v16 > *(_QWORD *)&v4[*v6])
          break;
        v17 = *(_BYTE *)(*(_QWORD *)&v4[*v10] + v15);
        *(_QWORD *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0)
          goto LABEL_12;
        v11 += 7;
        if (v12++ >= 9)
        {
          LODWORD(v13) = 0;
          v19 = *v8;
          v20 = v4[v19];
          goto LABEL_14;
        }
      }
      v4[*v8] = 1;
LABEL_12:
      v19 = *v8;
      v20 = v4[v19];
      if (v4[v19])
        LODWORD(v13) = 0;
LABEL_14:
      if (v20 || (v13 & 7) == 4)
        break;
      if ((v13 & 0x7FFF8) == 0x10)
      {
        v22 = *v5;
        v23 = *(_QWORD *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && (v24 = v23 + 8, v23 + 8 <= *(_QWORD *)&v4[*v6]))
        {
          v25 = *(_QWORD *)(*(_QWORD *)&v4[*v10] + v23);
          *(_QWORD *)&v4[v22] = v24;
        }
        else
        {
          v25 = 0;
          v4[v19] = 1;
        }
        v9 = *v8;
        if (!v4[v9])
        {
          v7 = (double)v25 / 1000.0;
          break;
        }
      }
      else
      {
        if (!PBReaderSkipValueWithTag())
          break;
        LODWORD(v9) = *v8;
      }
    }
    while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
  }

  return v7;
}

@end
