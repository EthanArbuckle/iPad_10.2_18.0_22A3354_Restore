@implementation AMDDODMLEspressoDataProvider

- (AMDDODMLEspressoDataProvider)initWithInputs:(int64_t)a3 featureSizeMap:(id)a4 inputDictionary:(id)a5
{
  AMDDODMLEspressoDataProvider *v7;
  id v8;
  id location;
  int64_t v10;
  SEL v11;
  AMDDODMLEspressoDataProvider *v12;

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

- (id)bindDataToInputsDirectly:(id)a3 batchSize:(int64_t)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t j;
  unint64_t v29;
  unint64_t i;
  unint64_t v31;
  uint64_t v32;
  id v33;
  int v34;
  id v35;
  uint64_t *v36;
  _QWORD __b[8];
  uint64_t v38;
  id v39;
  id *v40;
  unint64_t v41;
  id location[2];
  AMDDODMLEspressoDataProvider *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  v40 = a5;
  v39 = 0;
  objc_storeStrong(&v39, a6);
  memset(__b, 0, sizeof(__b));
  v25 = location[0];
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
  if (v26)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v26;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(v25);
      v38 = *(_QWORD *)(__b[1] + 8 * v20);
      v36 = 0;
      v16 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", v38);
      v17 = objc_msgSend(objc_retainAutorelease(v16), "mutableBytes");

      v36 = (uint64_t *)v17;
      v35 = -[NSDictionary objectForKey:](v43->_inputDictionary, "objectForKey:", v38);
      if (v35)
      {
        v33 = -[NSDictionary objectForKey:](v43->_featureSizeMap, "objectForKey:", v38);
        if (v33)
        {
          v10 = objc_msgSend(v33, "longValue");
          if (v36[2] * v36[3] * v36[4] * v36[5] == v10 * v41)
          {
            v32 = *v36;
            v31 = objc_msgSend(v35, "length") / 4uLL;
            for (i = 0; i < v41; ++i)
            {
              v29 = objc_msgSend(v33, "longValue");
              for (j = 0; j < v29; ++j)
              {
                v27 = v43->_currentIndex * v29 + i * v29 + j;
                if (v27 >= v31)
                {
                  v13 = objc_alloc(MEMORY[0x24BDD1540]);
                  v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v39, 91, 0);
                  *v40 = v14;
                  v44 = 0;
                  v34 = 1;
                  goto LABEL_20;
                }
                v46 = 4 * v27;
                v45 = 4;
                v47 = 4 * v27;
                v48 = 4;
                objc_msgSend(v35, "getBytes:range:", v32 + 4 * (i * v29 + j), 4 * v27, 4);
              }
            }
            v34 = 0;
          }
          else
          {
            v11 = objc_alloc(MEMORY[0x24BDD1540]);
            v12 = (id)objc_msgSend(v11, "initWithDomain:code:userInfo:", v39, 82, 0);
            *v40 = v12;
            v44 = 0;
            v34 = 1;
          }
        }
        else
        {
          v8 = objc_alloc(MEMORY[0x24BDD1540]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v39, 80, 0);
          *v40 = v9;
          v44 = 0;
          v34 = 1;
        }
LABEL_20:
        objc_storeStrong(&v33, 0);
      }
      else
      {
        v6 = objc_alloc(MEMORY[0x24BDD1540]);
        v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v39, 81, 0);
        *v40 = v7;
        v44 = 0;
        v34 = 1;
      }
      objc_storeStrong(&v35, 0);
      if (v34)
        break;
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", __b, v49, 16);
        if (!v21)
          goto LABEL_24;
      }
    }
  }
  else
  {
LABEL_24:
    v34 = 0;
  }

  if (!v34)
  {
    v43->_currentIndex += v41;
    if ((int64_t)(v43->_currentIndex + v41) > v43->_length)
      v43->_currentIndex = 0;
    v44 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", 1);
    v34 = 1;
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSizeMap, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
}

@end
