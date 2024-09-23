@implementation NSArray(CAAnimatableValue)

- (void)CA_addValue:()CAAnimatableValue multipliedBy:
{
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  BOOL v15;
  id *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v6 = a1;
  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "count");
  if (v7 >= objc_msgSend(a3, "count"))
    v8 = a3;
  else
    v8 = v6;
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  v11 = 8 * v9;
  if ((unint64_t)(8 * v9) > 0x1000)
  {
    v12 = (char *)malloc_type_malloc(8 * v9, 0x119BBF39uLL);
    v14 = (uint64_t *)malloc_type_malloc(v11, 0xE546BACAuLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v9);
    v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
    MEMORY[0x1E0C80A78](v13);
    v14 = (uint64_t *)v12;
    bzero(v12, v11);
  }
  if (v12)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    objc_msgSend(v6, "getObjects:range:", v12, 0, v10);
    objc_msgSend(a3, "getObjects:range:", v14, 0, v10);
    if (v10)
    {
      v16 = (id *)v12;
      v17 = v14;
      v18 = v10;
      do
      {
        v19 = *v17++;
        *v16 = (id)objc_msgSend(*v16, "CA_addValue:multipliedBy:", v19, a4);
        ++v16;
        --v18;
      }
      while (v18);
    }
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v10);
  }
  if (v11 > 0x1000 && v14)
    free(v14);
  if (v11 > 0x1000 && v12)
    free(v12);
  return v6;
}

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t v16;
  double v17;
  id *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "count");
  if (v7 >= objc_msgSend(a4, "count"))
    v8 = a4;
  else
    v8 = a1;
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  v11 = 8 * v9;
  if ((unint64_t)(8 * v9) > 0x1000)
  {
    v12 = (char *)malloc_type_malloc(8 * v9, 0x52403B35uLL);
    v14 = (uint64_t *)malloc_type_malloc(v11, 0x28157CE8uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v9);
    v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v11);
    MEMORY[0x1E0C80A78](v13);
    v14 = (uint64_t *)v12;
    bzero(v12, v11);
  }
  if (v12)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (v15)
  {
    if (a2 >= 0.5)
      v16 = (uint64_t)a4;
    else
      v16 = (uint64_t)a1;
  }
  else
  {
    objc_msgSend(a1, "getObjects:range:", v12, 0, v10);
    objc_msgSend(a4, "getObjects:range:", v14, 0, v10);
    if (v10)
    {
      v18 = (id *)v12;
      v19 = v14;
      v20 = v10;
      do
      {
        v21 = *v19++;
        *(float *)&v17 = a2;
        *v18 = (id)objc_msgSend(*v18, "CA_interpolateValue:byFraction:", v21, v17);
        ++v18;
        --v20;
      }
      while (v20);
    }
    v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, v10);
  }
  if (v11 > 0x1000 && v14)
    free(v14);
  if (v11 > 0x1000 && v12)
    free(v12);
  return v16;
}

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  unint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  id *v23;
  char *v24;
  char *v25;
  char *v26;
  unint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a1, "count");
  v35 = a1;
  if (v11 >= objc_msgSend(a4, "count"))
    v12 = a4;
  else
    v12 = a1;
  v13 = objc_msgSend(v12, "count");
  v14 = v13;
  if (a3)
  {
    v13 = objc_msgSend(a3, "count");
    if (v14 >= v13)
    {
      v13 = objc_msgSend(a3, "count");
      v14 = v13;
    }
  }
  if (a5)
  {
    v13 = objc_msgSend(a5, "count");
    if (v14 >= v13)
    {
      v13 = objc_msgSend(a5, "count");
      v14 = v13;
    }
  }
  v15 = 8 * v14;
  if (8 * v14 > 0x1000)
  {
    v17 = (char *)malloc_type_malloc(8 * v14, 0x315D638AuLL);
    v21 = (char *)malloc_type_malloc(8 * v14, 0x2B7A612DuLL);
    if (a3)
    {
      v20 = (char *)malloc_type_malloc(8 * v14, 0x3E0ECD24uLL);
      if (a5)
        goto LABEL_16;
    }
    else
    {
      v20 = 0;
      if (a5)
      {
LABEL_16:
        v22 = (char *)malloc_type_malloc(8 * v14, 0xCD05360BuLL);
        if (v17)
          goto LABEL_26;
        goto LABEL_40;
      }
    }
    v22 = 0;
    if (v17)
      goto LABEL_26;
LABEL_40:
    if (*a6 >= 0.5)
      v31 = (uint64_t)a4;
    else
      v31 = (uint64_t)v35;
    goto LABEL_43;
  }
  v34 = a4;
  MEMORY[0x1E0C80A78](v13);
  v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  v17 = (char *)&v33 - v16;
  bzero((char *)&v33 - v16, 8 * v14);
  MEMORY[0x1E0C80A78](v18);
  bzero((char *)&v33 - v16, 8 * v14);
  if (a3)
  {
    MEMORY[0x1E0C80A78](v19);
    v20 = (char *)&v33 - v16;
    bzero((char *)&v33 - v16, 8 * v14);
    if (a5)
    {
      v21 = (char *)&v33 - v16;
LABEL_19:
      MEMORY[0x1E0C80A78](v19);
      v22 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v22, 8 * v14);
      goto LABEL_25;
    }
    v22 = 0;
    v21 = (char *)&v33 - v16;
  }
  else
  {
    v20 = 0;
    v21 = (char *)&v33 - v16;
    if (a5)
      goto LABEL_19;
    v22 = 0;
  }
LABEL_25:
  a4 = v34;
  if (!v17)
    goto LABEL_40;
LABEL_26:
  if (!v21)
    goto LABEL_40;
  objc_msgSend(v35, "getObjects:range:", v17, 0, v14);
  objc_msgSend(a4, "getObjects:range:", v21, 0, v14);
  if (a3)
    objc_msgSend(a3, "getObjects:range:", v20, 0, v14);
  v34 = v21;
  v35 = v17;
  if (a5)
    objc_msgSend(a5, "getObjects:range:", v22, 0, v14);
  if (v14)
  {
    v24 = v34;
    v23 = (id *)v35;
    v25 = v20;
    v26 = v22;
    for (i = v14; i; --i)
    {
      if (v20)
      {
        v28 = *(_QWORD *)v25;
        if (!v22)
          goto LABEL_37;
      }
      else
      {
        v28 = 0;
        if (!v22)
        {
LABEL_37:
          v29 = 0;
          goto LABEL_38;
        }
      }
      v29 = *(_QWORD *)v26;
LABEL_38:
      v30 = *(_QWORD *)v24;
      v24 += 8;
      *v23 = (id)objc_msgSend(*v23, "CA_interpolateValues:::interpolator:", v28, v30, v29, a6);
      ++v23;
      v26 += 8;
      v25 += 8;
    }
  }
  v17 = v35;
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, v14);
  v21 = v34;
LABEL_43:
  if (v15 > 0x1000 && v20)
    free(v20);
  if (v15 > 0x1000 && v17)
    free(v17);
  if (v15 > 0x1000 && v21)
    free(v21);
  if (v15 > 0x1000 && v22)
    free(v22);
  return v31;
}

@end
