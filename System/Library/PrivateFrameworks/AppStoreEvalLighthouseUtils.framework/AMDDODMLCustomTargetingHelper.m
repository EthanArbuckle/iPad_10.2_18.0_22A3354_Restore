@implementation AMDDODMLCustomTargetingHelper

- (AMDDODMLCustomTargetingHelper)init
{
  AMDDODMLCustomTargetingHelper *v3;
  objc_super v4;
  SEL v5;
  AMDDODMLCustomTargetingHelper *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AMDDODMLCustomTargetingHelper;
  v6 = -[AMDDODMLCustomTargetingHelper init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)callAMDClient:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v14;
  id v16;
  id v17;
  int v18;
  char v19;
  id v20;
  int i;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id *v28;
  id location[3];
  id v30;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  v27 = (id)objc_msgSend(location[0], "objectAtIndex:", 0);
  v26 = (id)objc_msgSend(location[0], "objectAtIndex:", 1);
  v25 = (id)objc_msgSend(location[0], "objectAtIndex:", 2);
  if ((objc_msgSend(v25, "isEqual:", CFSTR("isnil")) & 1) != 0)
    objc_storeStrong(&v25, 0);
  v24 = objc_alloc_init(MEMORY[0x24BE07A20]);

  v4 = objc_alloc(MEMORY[0x24BE07A28]);
  v23 = (id)objc_msgSend(v4, "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", v27, 0, 0, v26, 0, v25);
  v22 = 0;
  for (i = 0; i < 3; ++i)
  {
    v5 = (id)objc_msgSend(v24, "getFeature:", v23);
    v6 = v22;
    v22 = v5;

    v19 = 0;
    v14 = 0;
    if (v22)
    {
      v20 = (id)objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE07A10]);
      v19 = 1;
      v14 = objc_msgSend(v20, "isEqual:", *MEMORY[0x24BE07A18]);
    }
    if ((v19 & 1) != 0)

    if ((v14 & 1) != 0)
      break;
  }
  if (v22)
  {
    v17 = (id)objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE07A10]);
    if ((objc_msgSend(v17, "isEqual:", *MEMORY[0x24BE07A18]) & 1) != 0)
    {
      v16 = (id)objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BE07A08]);
      if (v16)
      {
        v30 = v16;
      }
      else
      {
        v11 = objc_alloc(MEMORY[0x24BDD1540]);
        v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 154, 0);
        *v28 = v12;
        v30 = 0;
      }
      v18 = 1;
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x24BDD1540]);
      v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 153, 0);
      *v28 = v10;
      v30 = 0;
      v18 = 1;
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDD1540]);
    v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 152, 0);
    *v28 = v8;
    v30 = 0;
    v18 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v30;
}

- (id)getOperationsArray
{
  id v3;
  id v4[3];
  _QWORD v5[13];

  v5[12] = *MEMORY[0x24BDAC8D0];
  v4[2] = self;
  v4[1] = (id)a2;
  v5[0] = CustomTargetingSum;
  v5[1] = CustomTargetingSumEmp;
  v5[2] = CustomTargetingConNum;
  v5[3] = CustomTargetingConStr;
  v5[4] = CustomTargetingMean;
  v5[5] = CustomTargetingMeanEmp;
  v5[6] = CustomTargetingLen;
  v5[7] = CustomTargetingFirst;
  v5[8] = CustomTargetingMax;
  v5[9] = CustomTargetingMaxEmp;
  v5[10] = CustomTargetingMin;
  v5[11] = CustomTargetingMinEmp;
  v4[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 12);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)performOperation:(id)a3 onArray:(id)a4 error:(id *)a5
{
  id v5;
  double v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  id v16;
  double v17;
  unint64_t v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  id v26;
  id v28;
  double v29;
  id v30;
  double v31;
  id v32;
  double v33;
  id v34;
  double v35;
  id v36;
  unint64_t v37;
  double v38;
  double v39;
  unint64_t v40;
  id v41;
  unint64_t ii;
  double v45;
  unint64_t n;
  double v47;
  unint64_t m;
  double v49;
  id v50;
  id v51;
  unint64_t k;
  id v53;
  id v54;
  id v55;
  id v56;
  unint64_t j;
  id v58;
  int v59;
  id v60;
  double v61;
  id v62;
  unint64_t i;
  double v64;
  int v65;
  id *v66;
  id v67;
  id location[3];
  id v69;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v67 = 0;
  objc_storeStrong(&v67, a4);
  v66 = a5;
  if ((objc_msgSend(location[0], "isEqual:", CustomTargetingSum) & 1) != 0
    || (objc_msgSend(location[0], "isEqual:", CustomTargetingSumEmp) & 1) != 0)
  {
    if (objc_msgSend(v67, "count"))
    {
      v64 = 0.0;
      for (i = 0; i < objc_msgSend(v67, "count"); ++i)
      {
        v41 = (id)objc_msgSend(v67, "objectAtIndex:", i);
        objc_msgSend(v41, "doubleValue");
        v64 = v64 + v6;

      }
      v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v64);
      v65 = 1;
    }
    else
    {
      if ((objc_msgSend(location[0], "isEqual:", CustomTargetingSum) & 1) != 0)
      {
        v5 = objc_alloc(MEMORY[0x24BDD1540]);
        *v66 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 155, 0);
        v69 = 0;
      }
      else
      {
        v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      }
      v65 = 1;
    }
  }
  else if ((objc_msgSend(location[0], "containsString:", CustomTargetingConNum) & 1) != 0)
  {
    v62 = (id)objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("_"));
    if (objc_msgSend(v62, "count") == 2 || objc_msgSend(v62, "count") == 3)
    {
      v61 = 0.00000001;
      if (objc_msgSend(v62, "count") == 3)
      {
        v60 = (id)objc_msgSend(v62, "objectAtIndex:", 2);
        v59 = objc_msgSend(v60, "intValue");
        v61 = (double)(1 / (v59 ^ 0xA));
        objc_storeStrong(&v60, 0);
      }
      v58 = (id)objc_msgSend(v62, "objectAtIndex:", 1);
      for (j = 0; ; ++j)
      {
        v40 = j;
        if (v40 >= objc_msgSend(v67, "count"))
          break;
        v56 = (id)objc_msgSend(v67, "objectAtIndex:", j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = v56;
          objc_msgSend(v55, "doubleValue");
          v39 = v10 - v61;
          objc_msgSend(v58, "doubleValue");
          if (v39 >= v11
            || (objc_msgSend(v55, "doubleValue", v39), v38 = v12 + v61, objc_msgSend(v58, "doubleValue"), v38 <= v13))
          {
            v65 = 0;
          }
          else
          {
            v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v38);
            v65 = 1;
          }
          objc_storeStrong(&v55, 0);
          if (!v65)
            v65 = 0;
        }
        else
        {
          v8 = objc_alloc(MEMORY[0x24BDD1540]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 157, 0);
          *v66 = v9;
          v69 = 0;
          v65 = 1;
        }
        objc_storeStrong(&v56, 0);
        if (v65)
          goto LABEL_31;
      }
      v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      v65 = 1;
LABEL_31:
      objc_storeStrong(&v58, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDD1540]);
      *v66 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 156, 0);
      v69 = 0;
      v65 = 1;
    }
    objc_storeStrong(&v62, 0);
  }
  else if ((objc_msgSend(location[0], "containsString:", CustomTargetingConStr) & 1) != 0)
  {
    v54 = (id)objc_msgSend(location[0], "componentsSeparatedByString:", CFSTR("_"));
    v53 = (id)objc_msgSend(v54, "objectAtIndex:", 1);
    for (k = 0; ; ++k)
    {
      v37 = k;
      if (v37 >= objc_msgSend(v67, "count"))
        break;
      v51 = (id)objc_msgSend(v67, "objectAtIndex:", k);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = v51;
        if ((objc_msgSend(v50, "isEqual:", v53) & 1) != 0)
        {
          v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
          v65 = 1;
        }
        else
        {
          v65 = 0;
        }
        objc_storeStrong(&v50, 0);
        if (!v65)
          v65 = 0;
      }
      else
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 158, 0);
        *v66 = v15;
        v69 = 0;
        v65 = 1;
      }
      objc_storeStrong(&v51, 0);
      if (v65)
        goto LABEL_46;
    }
    v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v65 = 1;
LABEL_46:
    objc_storeStrong(&v53, 0);
    objc_storeStrong(&v54, 0);
  }
  else if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMean) & 1) != 0
         || (objc_msgSend(location[0], "isEqual:", CustomTargetingMeanEmp) & 1) != 0)
  {
    if (objc_msgSend(v67, "count"))
    {
      v49 = 0.0;
      for (m = 0; m < objc_msgSend(v67, "count"); ++m)
      {
        v36 = (id)objc_msgSend(v67, "objectAtIndex:", m);
        objc_msgSend(v36, "doubleValue");
        v49 = v49 + v17;

      }
      v18 = objc_msgSend(v67, "count");
      v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v49 / (double)v18);
      v65 = 1;
    }
    else
    {
      if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMean) & 1) != 0)
      {
        v16 = objc_alloc(MEMORY[0x24BDD1540]);
        *v66 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 159, 0);
        v69 = 0;
      }
      else
      {
        v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      }
      v65 = 1;
    }
  }
  else if ((objc_msgSend(location[0], "isEqual:", CustomTargetingLen) & 1) != 0)
  {
    v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v67, "count"));
    v65 = 1;
  }
  else if ((objc_msgSend(location[0], "isEqual:", CustomTargetingFirst) & 1) != 0)
  {
    if (objc_msgSend(v67, "count"))
    {
      v69 = (id)objc_msgSend(v67, "firstObject");
    }
    else
    {
      v19 = objc_alloc(MEMORY[0x24BDD1540]);
      *v66 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 180, 0);
      v69 = 0;
    }
    v65 = 1;
  }
  else if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMax) & 1) != 0
         || (objc_msgSend(location[0], "isEqual:", CustomTargetingMaxEmp) & 1) != 0)
  {
    if (objc_msgSend(v67, "count"))
    {
      v34 = (id)objc_msgSend(v67, "firstObject");
      objc_msgSend(v34, "doubleValue");
      v35 = v21;

      v47 = v35;
      for (n = 0; n < objc_msgSend(v67, "count"); ++n)
      {
        v32 = (id)objc_msgSend(v67, "objectAtIndex:", n);
        objc_msgSend(v32, "doubleValue");
        v33 = v22;

        if (v33 > v47)
          v47 = v33;
      }
      v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47);
      v65 = 1;
    }
    else
    {
      if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMax) & 1) != 0)
      {
        v20 = objc_alloc(MEMORY[0x24BDD1540]);
        *v66 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 160, 0);
        v69 = 0;
      }
      else
      {
        v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      }
      v65 = 1;
    }
  }
  else if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMin) & 1) != 0
         || (objc_msgSend(location[0], "isEqual:", CustomTargetingMinEmp) & 1) != 0)
  {
    if (objc_msgSend(v67, "count"))
    {
      v30 = (id)objc_msgSend(v67, "firstObject");
      objc_msgSend(v30, "doubleValue");
      v31 = v24;

      v45 = v31;
      for (ii = 0; ii < objc_msgSend(v67, "count"); ++ii)
      {
        v28 = (id)objc_msgSend(v67, "objectAtIndex:", ii);
        objc_msgSend(v28, "doubleValue");
        v29 = v25;

        if (v29 < v45)
          v45 = v29;
      }
      v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v45);
      v65 = 1;
    }
    else
    {
      if ((objc_msgSend(location[0], "isEqual:", CustomTargetingMin) & 1) != 0)
      {
        v23 = objc_alloc(MEMORY[0x24BDD1540]);
        *v66 = (id)objc_msgSend(v23, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 161, 0);
        v69 = 0;
      }
      else
      {
        v69 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
      }
      v65 = 1;
    }
  }
  else
  {
    v26 = objc_alloc(MEMORY[0x24BDD1540]);
    *v66 = (id)objc_msgSend(v26, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 162, 0);
    v69 = 0;
    v65 = 1;
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(location, 0);
  return v69;
}

- (id)getDictionaryValueDataType:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v15;
  int v16;
  id v17;
  _QWORD __b[8];
  uint64_t v19;
  id v20;
  id *v21;
  id location[3];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v20 = 0;
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
  if (v15)
  {
    v10 = *(_QWORD *)__b[2];
    v11 = 0;
    v12 = v15;
    while (1)
    {
      v9 = v11;
      if (*(_QWORD *)__b[2] != v10)
        objc_enumerationMutation(obj);
      v19 = *(_QWORD *)(__b[1] + 8 * v11);
      v17 = (id)objc_msgSend(location[0], "objectForKey:", v19);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!v20)
        {
          objc_storeStrong(&v20, IsAnArray);
LABEL_28:
          v16 = 0;
          goto LABEL_29;
        }
        if ((objc_msgSend(v20, "isEqual:", IsAnArray) & 1) != 0)
          goto LABEL_28;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v20)
          {
            objc_storeStrong(&v20, IsANumber);
            goto LABEL_28;
          }
          if ((objc_msgSend(v20, "isEqual:", IsANumber) & 1) != 0)
            goto LABEL_28;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v20)
            {
              objc_storeStrong(&v20, IsAString);
              goto LABEL_28;
            }
            if ((objc_msgSend(v20, "isEqual:", IsAString) & 1) != 0)
              goto LABEL_28;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v6 = objc_alloc(MEMORY[0x24BDD1540]);
              v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 164, 0);
              *v21 = v7;
              v23 = 0;
              v16 = 1;
              goto LABEL_29;
            }
            if (!v20)
            {
              objc_storeStrong(&v20, IsADictionary);
              goto LABEL_28;
            }
            if ((objc_msgSend(v20, "isEqual:", IsADictionary) & 1) != 0)
              goto LABEL_28;
          }
        }
      }
      v4 = objc_alloc(MEMORY[0x24BDD1540]);
      v5 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 163, 0);
      *v21 = v5;
      v23 = 0;
      v16 = 1;
LABEL_29:
      objc_storeStrong(&v17, 0);
      if (v16)
        goto LABEL_33;
      ++v11;
      if (v9 + 1 >= v12)
      {
        v11 = 0;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v24, 16);
        if (!v12)
          break;
      }
    }
  }
  v16 = 0;
LABEL_33:

  if (!v16)
    v23 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v23;
}

- (id)parseData:(id)a3 withArray:(id)a4 error:(id *)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  AMDDODMLCustomTargetingHelper *v34;
  id v35;
  id v38;
  _QWORD v39[8];
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[8];
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[8];
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD __b[8];
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  int v72;
  id v73;
  id v74;
  id *v75;
  id v76;
  id location[2];
  AMDDODMLCustomTargetingHelper *v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v78 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v76 = 0;
  objc_storeStrong(&v76, a4);
  v75 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v74 = location[0];
    if (objc_msgSend(v76, "count") == 2)
    {
      v34 = v78;
      v35 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
      v73 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v34, "performOperation:onArray:error:");

      if (v73)
      {
        v72 = 0;
      }
      else
      {
        v79 = 0;
        v72 = 1;
      }
      objc_storeStrong(&v73, 0);
      if (!v72)
        v72 = 0;
    }
    else if (objc_msgSend(v76, "count") == 1)
    {
      v71 = (id)objc_msgSend(v74, "firstObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v79 = v71;
        v72 = 1;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 166, 0);
        v79 = 0;
        v72 = 1;
      }
      objc_storeStrong(&v71, 0);
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BDD1540]);
      *v75 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 167, 0);
      v79 = 0;
      v72 = 1;
    }
    objc_storeStrong(&v74, 0);
    if (!v72)
      goto LABEL_104;
    goto LABEL_105;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = objc_alloc(MEMORY[0x24BDD1540]);
    *v75 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 108, 0);
    v79 = 0;
    v72 = 1;
    goto LABEL_105;
  }
  v70 = location[0];
  v69 = -[AMDDODMLCustomTargetingHelper getDictionaryValueDataType:error:](v78, "getDictionaryValueDataType:error:", v70, v75);
  if (!v69)
  {
    v79 = 0;
    v72 = 1;
    goto LABEL_101;
  }
  if ((objc_msgSend(v69, "isEqual:", IsAnArray) & 1) != 0)
  {
    if (objc_msgSend(v76, "count") == 3)
    {
      v68 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
      v67 = (id)objc_msgSend(v76, "objectAtIndex:", 2);
      v66 = (id)objc_msgSend(v70, "objectForKey:", v68);
      if (v66)
      {
        v65 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v78, "performOperation:onArray:error:", v67, v66, v75);
        if (v65)
          v79 = v65;
        else
          v79 = 0;
        v72 = 1;
        objc_storeStrong(&v65, 0);
      }
      else
      {
        v7 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 168, 0);
        v79 = 0;
        v72 = 1;
      }
      objc_storeStrong(&v66, 0);
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, 0);
      goto LABEL_101;
    }
    if (objc_msgSend(v76, "count") == 2)
    {
      v64 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
      v63 = -[AMDDODMLCustomTargetingHelper getOperationsArray](v78, "getOperationsArray");
      if ((objc_msgSend(v63, "containsObject:", v64) & 1) != 0)
      {
        if (objc_msgSend(v70, "count") == 1)
        {
          memset(__b, 0, sizeof(__b));
          v33 = v70;
          if (objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", __b, v83, 16))
          {
            v62 = *(_QWORD *)__b[1];
            v60 = (id)objc_msgSend(v70, "objectForKey:", v62);
            v59 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v78, "performOperation:onArray:error:", v64, v60, v75);
            if (v59)
              v79 = v59;
            else
              v79 = 0;
            v72 = 1;
            objc_storeStrong(&v59, 0);
            objc_storeStrong(&v60, 0);
          }
          else
          {
            v72 = 0;
          }

          if (!v72)
            v72 = 0;
        }
        else
        {
          v8 = objc_alloc(MEMORY[0x24BDD1540]);
          *v75 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 169, 0);
          v79 = 0;
          v72 = 1;
        }
      }
      else
      {
        v58 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
        v57 = (id)objc_msgSend(v70, "objectForKey:", v58);
        v56 = (id)objc_msgSend(v57, "firstObject");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v79 = v56;
          v72 = 1;
        }
        else
        {
          v9 = objc_alloc(MEMORY[0x24BDD1540]);
          *v75 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 170, 0);
          v79 = 0;
          v72 = 1;
        }
        objc_storeStrong(&v56, 0);
        objc_storeStrong(&v57, 0);
        objc_storeStrong(&v58, 0);
      }
      objc_storeStrong(&v63, 0);
      objc_storeStrong(&v64, 0);
      if (!v72)
        goto LABEL_100;
    }
    else
    {
      if (objc_msgSend(v76, "count") != 1)
      {
        v13 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 172, 0);
        v79 = 0;
        v72 = 1;
        goto LABEL_101;
      }
      if (objc_msgSend(v70, "count") != 1)
      {
        v12 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 169, 0);
        v79 = 0;
        v72 = 1;
        goto LABEL_101;
      }
      memset(v54, 0, sizeof(v54));
      v32 = v70;
      if (objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", v54, v82, 16))
      {
        v55 = *(_QWORD *)v54[1];
        v53 = (id)objc_msgSend(v70, "objectForKey:", v55);
        v52 = (id)objc_msgSend(v53, "firstObject");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v79 = v52;
          v72 = 1;
        }
        else
        {
          v10 = objc_alloc(MEMORY[0x24BDD1540]);
          v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 171, 0);
          *v75 = v11;
          v79 = 0;
          v72 = 1;
        }
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
      }
      else
      {
        v72 = 0;
      }

      if (!v72)
        goto LABEL_100;
    }
  }
  else
  {
    if ((objc_msgSend(v69, "isEqual:", IsANumber) & 1) == 0 && (objc_msgSend(v69, "isEqual:", IsAString) & 1) == 0)
    {
      if ((objc_msgSend(v69, "isEqual:", IsADictionary) & 1) != 0)
      {
        v19 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 177, 0);
      }
      else
      {
        v20 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v20, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 178, 0);
      }
      v79 = 0;
      v72 = 1;
      goto LABEL_101;
    }
    if (objc_msgSend(v76, "count") == 3)
    {
      v51 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
      v50 = (id)objc_msgSend(v76, "objectAtIndex:", 2);
      v49 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      memset(v46, 0, sizeof(v46));
      v30 = v70;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v46, v81, 16);
      if (v31)
      {
        v27 = *(_QWORD *)v46[2];
        v28 = 0;
        v29 = v31;
        while (1)
        {
          v26 = v28;
          if (*(_QWORD *)v46[2] != v27)
            objc_enumerationMutation(v30);
          v47 = *(_QWORD *)(v46[1] + 8 * v28);
          v45 = (id)objc_msgSend(v70, "objectForKey:", v47);
          objc_msgSend(v49, "addObject:", v47);
          objc_msgSend(v48, "addObject:", v45);
          objc_storeStrong(&v45, 0);
          ++v28;
          if (v26 + 1 >= v29)
          {
            v28 = 0;
            v29 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v46, v81, 16);
            if (!v29)
              break;
          }
        }
      }

      if ((objc_msgSend(v51, "isEqual:", CFSTR("GETKEYS")) & 1) != 0)
      {
        v44 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v78, "performOperation:onArray:error:", v50, v49, v75);
        if (v44)
          v79 = v44;
        else
          v79 = 0;
        v72 = 1;
        objc_storeStrong(&v44, 0);
      }
      else if ((objc_msgSend(v51, "isEqual:", CFSTR("GETVALS")) & 1) != 0)
      {
        v43 = -[AMDDODMLCustomTargetingHelper performOperation:onArray:error:](v78, "performOperation:onArray:error:", v50, v48, v75);
        if (v43)
          v79 = v43;
        else
          v79 = 0;
        v72 = 1;
        objc_storeStrong(&v43, 0);
      }
      else
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = (id)objc_msgSend(v14, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 173, 0);
        *v75 = v15;
        v79 = 0;
        v72 = 1;
      }
      objc_storeStrong(&v48, 0);
      objc_storeStrong(&v49, 0);
      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
    }
    else
    {
      if (objc_msgSend(v76, "count") == 2)
      {
        v42 = (id)objc_msgSend(v76, "objectAtIndex:", 1);
        v41 = (id)objc_msgSend(v70, "objectForKey:", v42);
        if (v41)
        {
          v79 = v41;
        }
        else
        {
          v16 = objc_alloc(MEMORY[0x24BDD1540]);
          *v75 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 174, 0);
          v79 = 0;
        }
        v72 = 1;
        objc_storeStrong(&v41, 0);
        objc_storeStrong(&v42, 0);
        goto LABEL_101;
      }
      if (objc_msgSend(v76, "count") != 1)
      {
        v18 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 176, 0);
        v79 = 0;
        v72 = 1;
        goto LABEL_101;
      }
      if (objc_msgSend(v70, "count") != 1)
      {
        v17 = objc_alloc(MEMORY[0x24BDD1540]);
        *v75 = (id)objc_msgSend(v17, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 175, 0);
        v79 = 0;
        v72 = 1;
        goto LABEL_101;
      }
      memset(v39, 0, sizeof(v39));
      v25 = v70;
      if (objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", v39, v80, 16))
      {
        v40 = *(_QWORD *)v39[1];
        v38 = (id)objc_msgSend(v70, "objectForKey:", v40);
        v79 = v38;
        v72 = 1;
        objc_storeStrong(&v38, 0);
      }
      else
      {
        v72 = 0;
      }

      if (!v72)
LABEL_100:
        v72 = 0;
    }
  }
LABEL_101:
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  if (!v72)
  {
LABEL_104:
    v22 = objc_alloc(MEMORY[0x24BDD1540]);
    v23 = (id)objc_msgSend(v22, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 179, 0);
    *v75 = v23;
    v79 = 0;
    v72 = 1;
  }
LABEL_105:
  objc_storeStrong(&v76, 0);
  objc_storeStrong(location, 0);
  return v79;
}

- (id)postProc:(id)a3 withDirections:(id)a4 error:(id *)a5
{
  id v5;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id v19;
  id location[3];
  id v21;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = (id)objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("_"));
  v16 = (id)objc_msgSend(v17, "firstObject");
  if ((objc_msgSend(v16, "isEqual:", CustomTargetingCutDown) & 1) != 0)
  {
    v15 = (id)objc_msgSend(v17, "lastObject");
    v14 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v13 = (id)objc_msgSend(v14, "numberFromString:", v15);
    if (location[0] <= v13)
      v21 = location[0];
    else
      v21 = v13;
    v12 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else if ((objc_msgSend(v16, "isEqual:", CustomTargetingCutUp) & 1) != 0)
  {
    v11 = (id)objc_msgSend(v17, "lastObject");
    v10 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v9 = (id)objc_msgSend(v10, "numberFromString:", v11);
    if (location[0] >= v9)
      v21 = location[0];
    else
      v21 = v9;
    v12 = 1;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x24BDD1540]);
    *v18 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 181, 0);
    v21 = 0;
    v12 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)mainTargetingResolver:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  AMDDODMLCustomTargetingHelper *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id obj;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD __b[8];
  id v35;
  id v36;
  id *v37;
  id location[2];
  AMDDODMLCustomTargetingHelper *v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = a4;
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
  if (v22)
  {
    v17 = *(_QWORD *)__b[2];
    v18 = 0;
    v19 = v22;
    while (1)
    {
      v16 = v18;
      if (*(_QWORD *)__b[2] != v17)
        objc_enumerationMutation(obj);
      v35 = *(id *)(__b[1] + 8 * v18);
      v33 = (id)objc_msgSend(v35, "componentsSeparatedByString:", CFSTR("______"));
      v32 = (id)objc_msgSend(v33, "firstObject");
      v31 = (id)objc_msgSend(v32, "componentsSeparatedByString:", CFSTR("____"));
      v30 = (id)objc_msgSend(v31, "firstObject");
      v29 = (id)objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("__"));
      if (objc_msgSend(v29, "count") == 3)
        break;
      v4 = objc_alloc(MEMORY[0x24BDD1540]);
      v5 = (id)objc_msgSend(v4, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 165, 0);
      *v37 = v5;
      v40 = 0;
      v28 = 1;
LABEL_25:
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      if (v28)
        goto LABEL_29;
      ++v18;
      if (v16 + 1 >= v19)
      {
        v18 = 0;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
        if (!v19)
          goto LABEL_28;
      }
    }
    v27 = -[AMDDODMLCustomTargetingHelper callAMDClient:error:](v39, "callAMDClient:error:", v29, v37);
    if (!v27)
    {
      v40 = 0;
      v28 = 1;
LABEL_24:
      objc_storeStrong(&v27, 0);
      goto LABEL_25;
    }
    v26 = -[AMDDODMLCustomTargetingHelper parseData:withArray:error:](v39, "parseData:withArray:error:", v27, v31, v37);
    if (!v26)
    {
      v40 = 0;
      v28 = 1;
LABEL_23:
      objc_storeStrong(&v26, 0);
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v26;
      objc_msgSend(v36, "setObject:forKey:", v25, v35);
      objc_storeStrong(&v25, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = objc_alloc(MEMORY[0x24BDD1540]);
        v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", AMDLighthouseODMLPluginErrorDomain, 165, 0);
        *v37 = v9;
        v40 = 0;
        v28 = 1;
        goto LABEL_23;
      }
      v24 = v26;
      v23 = v24;
      if (objc_msgSend(v33, "count") == 2)
      {
        v14 = v39;
        v13 = v24;
        v15 = (id)objc_msgSend(v33, "lastObject");
        v6 = -[AMDDODMLCustomTargetingHelper postProc:withDirections:error:](v14, "postProc:withDirections:error:", v13);
        v7 = v23;
        v23 = v6;

      }
      if (v23)
      {
        v11 = v36;
        v12 = (id)objc_msgSend(v23, "stringValue");
        objc_msgSend(v11, "setObject:forKey:");

        v28 = 0;
      }
      else
      {
        v40 = 0;
        v28 = 1;
      }
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
      if (v28)
        goto LABEL_23;
    }
    v28 = 0;
    goto LABEL_23;
  }
LABEL_28:
  v28 = 0;
LABEL_29:

  if (!v28)
  {
    v40 = v36;
    v28 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v40;
}

@end
