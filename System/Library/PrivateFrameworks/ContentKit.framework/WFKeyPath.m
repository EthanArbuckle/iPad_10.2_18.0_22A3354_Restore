@implementation WFKeyPath

+ (id)evaluateKeyPath:(id)a3 onObject:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v40;
  id *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[3];
  uint64_t v50;
  void *v51;
  _QWORD v52[4];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    v32 = 0;
    goto LABEL_18;
  }
  v42 = v8;
  v10 = v8;
  if (!objc_msgSend(v9, "count"))
  {
LABEL_12:
    v10 = v10;
    v32 = v10;
    goto LABEL_17;
  }
  v41 = a5;
  v11 = 0;
  v43 = *MEMORY[0x24BDD0FC8];
  v12 = 0x24BDBC000uLL;
  while (1)
  {
    objc_msgSend(v9, "objectAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subarrayWithRange:", 0, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v9, "count");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0;
      objc_msgSend(a1, "valueFromArray:component:previousKeyPath:error:", v10, v13, v15, &v47);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v47;
LABEL_8:
      v19 = v18;
      v20 = v10;
      v10 = (id)v17;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = 0;
      objc_msgSend(a1, "valueFromDictionary:component:previousKeyPath:isLastComponent:error:", v10, v13, v15, v11 == v16 - 1, &v46);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v46;
      goto LABEL_8;
    }
    v52[0] = v15;
    v52[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("In key path '%1$@', you referenced a value '%2$@' inside of '%3$@', which is not an array or dictionary."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v23, v20, v13, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD1540];
    v50 = v43;
    v51 = v24;
    objc_msgSend(*(id *)(v12 + 3696), "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v44 = v10;
    v26 = v15;
    v27 = v9;
    v28 = v13;
    v29 = a1;
    v30 = v12;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("WFKeyPathErrorDomain"), 3, v31);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v12 = v30;
    a1 = v29;
    v13 = v28;
    v9 = v27;
    v15 = v26;

    v10 = 0;
LABEL_10:

    if (v19)
      break;

    if (objc_msgSend(v9, "count") <= (unint64_t)++v11)
      goto LABEL_12;
  }
  if (v41)
  {
    WFLocalizedString(CFSTR("Could not evaluate the key path."));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v19, "domain");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v19, "code");
    v36 = v12;
    v37 = v35;
    v48[0] = *MEMORY[0x24BDD0FD8];
    v48[1] = v43;
    v49[0] = v45;
    v49[1] = v33;
    v48[2] = *MEMORY[0x24BDD1398];
    v49[2] = v19;
    objc_msgSend(*(id *)(v36 + 3696), "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", v34, v37, v38);
    *v41 = (id)objc_claimAutoreleasedReturnValue();

  }
  v32 = 0;
LABEL_17:

  v8 = v42;
LABEL_18:

  return v32;
}

+ (id)valueFromArray:(id)a3 component:(id)a4 previousKeyPath:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37[0] = v11;
  v37[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invertedSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v15);

  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_msgSend(v10, "integerValue");
    if (v17 <= 0)
    {
      if (a6)
      {
        v27 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("In '%1$@', you asked for item %2$d, but the first item is at index 1."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", v28, v13, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x24BDD1540];
        v33 = *MEMORY[0x24BDD0FC8];
        v34 = v20;
        v22 = (void *)MEMORY[0x24BDBCE70];
        v23 = &v34;
        v24 = &v33;
        goto LABEL_10;
      }
    }
    else
    {
      if (v17 <= (unint64_t)objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "objectAtIndex:", v17 - 1);
        a6 = (id *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (a6)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("In '%1$@', the index you specified was outside of the possible range for the array (you asked for item %3$d, and the array has only %4$d)."));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v19, v11, v17, objc_msgSend(v9, "count"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x24BDD1540];
        v31 = *MEMORY[0x24BDD0FC8];
        v32 = v20;
        v22 = (void *)MEMORY[0x24BDBCE70];
        v23 = &v32;
        v24 = &v31;
LABEL_10:
        objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WFKeyPathErrorDomain"), 0, v29);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
  }
  else if (a6)
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("The value at '%1$@' is an array, but '%2$@' is not a valid index."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", v26, v11, v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36 = v20;
    v22 = (void *)MEMORY[0x24BDBCE70];
    v23 = &v36;
    v24 = &v35;
    goto LABEL_10;
  }
LABEL_12:

  return a6;
}

+ (id)valueFromDictionary:(id)a3 component:(id)a4 previousKeyPath:(id)a5 isLastComponent:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  objc_msgSend(a3, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 || a6)
  {
    v20 = v13;
  }
  else if (a7)
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("In '%1$@', no value was found for dictionary key '%2$@'."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v12, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v23[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("WFKeyPathErrorDomain"), 2, v19);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

@end
