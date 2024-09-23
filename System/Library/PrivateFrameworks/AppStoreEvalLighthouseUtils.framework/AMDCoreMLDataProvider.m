@implementation AMDCoreMLDataProvider

- (AMDCoreMLDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
{
  AMDCoreMLDataProvider *v7;
  id v8;
  id location;
  int64_t v10;
  SEL v11;
  AMDCoreMLDataProvider *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v12->_length = v10;
  objc_storeStrong((id *)&v12->_inputDictionary, v8);
  objc_storeStrong((id *)&v12->_featureSizeMap, location);
  v12->_currentIndex = 0;
  v7 = v12;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

- (int64_t)numberOfIterationsPerEpoch:(int64_t)a3
{
  return (self->_length - self->_length % a3) / a3;
}

- (int64_t)numberOfDataPoints
{
  return self->_length;
}

- (int64_t)count
{
  return self->_length;
}

- (id)fetchData:(int64_t)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  int64_t currentIndex;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSDictionary *obj;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30[3];
  int v31;
  int i;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  int v38;
  id v39;
  _QWORD __b[8];
  uint64_t v41;
  id v42;
  id location;
  id *v44;
  int64_t v45;
  SEL v46;
  AMDCoreMLDataProvider *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  v46 = a2;
  v45 = a3;
  v44 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  memset(__b, 0, sizeof(__b));
  obj = v47->_featureSizeMap;
  v26 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
  if (v26)
  {
    v22 = *(_QWORD *)__b[2];
    v23 = 0;
    v24 = v26;
    while (1)
    {
      v21 = v23;
      if (*(_QWORD *)__b[2] != v22)
        objc_enumerationMutation(obj);
      v41 = *(_QWORD *)(__b[1] + 8 * v23);
      v39 = -[NSDictionary objectForKey:](v47->_featureSizeMap, "objectForKey:", v41);
      if (v39)
      {
        v37 = -[NSDictionary objectForKey:](v47->_inputDictionary, "objectForKey:", v41);
        if (v37)
        {
          v36 = 0;
          currentIndex = v47->_currentIndex;
          v36 = 4 * currentIndex * objc_msgSend(v39, "longValue");
          v35 = 0;
          v19 = v45;
          v35 = 4 * v19 * objc_msgSend(v39, "longValue");
          v34 = v36 + v35;
          v20 = v36;
          if (v20 >= objc_msgSend(v37, "length"))
            goto LABEL_11;
          v17 = v34;
          if (v17 <= objc_msgSend(v37, "length"))
          {
            v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            for (i = v36; i < v34; i += 4)
            {
              v31 = 0;
              v50 = i;
              v49 = 4;
              v51 = i;
              v52 = 4;
              v30[1] = (id)i;
              v30[2] = (id)4;
              objc_msgSend(v37, "getBytes:range:", &v31, i, 4);
              LODWORD(v11) = v31;
              v30[0] = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
              objc_msgSend(v33, "addObject:", v30[0]);
              objc_storeStrong(v30, 0);
            }
            v14 = (void *)MEMORY[0x24BDBFFF0];
            v16 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v45);
            v53[0] = v16;
            v53[1] = v39;
            v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
            v29 = (id)objc_msgSend(v14, "doubleMultiArrayWithShape:valueArray:error:");

            objc_msgSend(v42, "setObject:forKey:", v29, v41);
            objc_storeStrong(&v29, 0);
            objc_storeStrong(&v33, 0);
            v38 = 0;
          }
          else
          {
LABEL_11:
            v9 = objc_alloc(MEMORY[0x24BDD1540]);
            v10 = (id)objc_msgSend(v9, "initWithDomain:code:userInfo:", location, 91, 0);
            *v44 = v10;
            v48 = 0;
            v38 = 1;
          }
        }
        else
        {
          v7 = objc_alloc(MEMORY[0x24BDD1540]);
          v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", location, 81, 0);
          *v44 = v8;
          v48 = 0;
          v38 = 1;
        }
        objc_storeStrong(&v37, 0);
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BDD1540]);
        v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", location, 80, 0);
        *v44 = v6;
        v48 = 0;
        v38 = 1;
      }
      objc_storeStrong(&v39, 0);
      if (v38)
        break;
      ++v23;
      if (v21 + 1 >= v24)
      {
        v23 = 0;
        v24 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", __b, v54, 16);
        if (!v24)
          goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    v38 = 0;
  }

  if (!v38)
  {
    v12 = objc_alloc(MEMORY[0x24BDBFF80]);
    v28 = (id)objc_msgSend(v12, "initWithDictionary:error:", v42, v44);
    v27 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
    objc_msgSend(v27, "addObject:", v28);
    v47->_currentIndex += v45;
    if (v47->_currentIndex + v45 > v47->_length)
      v47->_currentIndex = 0;
    v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v27);
    v38 = 1;
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&location, 0);
  return v48;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSizeMap, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
}

@end
