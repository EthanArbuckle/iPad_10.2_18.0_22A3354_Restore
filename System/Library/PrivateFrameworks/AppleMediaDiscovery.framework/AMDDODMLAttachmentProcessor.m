@implementation AMDDODMLAttachmentProcessor

- (AMDDODMLAttachmentProcessor)initWithHashMapDictionary:(id)a3 withDownSampleDictionary:(id)a4 withNegSampleDictionary:(id)a5
{
  AMDDODMLAttachmentProcessor *v5;
  AMDDODMLAttachmentProcessor *v7;
  AMDDODMLAttachmentProcessor *v10;
  objc_super v11;
  id v12;
  id v13;
  id location[2];
  AMDDODMLAttachmentProcessor *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)AMDDODMLAttachmentProcessor;
  v10 = -[AMDDODMLAttachmentProcessor init](&v11, sel_init);
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
  {
    objc_storeStrong((id *)&v15->_hashMapAttachments, location[0]);
    objc_storeStrong((id *)&v15->_downSampleAttachments, v13);
    objc_storeStrong((id *)&v15->_negSampleAttachements, v12);
  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (AMDDODMLAttachmentProcessor)initWithAttachmentURLs:(id)a3 withInstructions:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
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
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v32;
  AMDDODMLAttachmentProcessor *v36;
  id v37;
  int v38;
  id v39;
  id v40;
  unint64_t i;
  objc_super v42;
  id v43;
  id *v44;
  id v45;
  id location[2];
  id v47;
  AMDDODMLAttachmentProcessor *v48;

  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, a4);
  v44 = a5;
  v43 = 0;
  objc_storeStrong(&v43, a6);
  v6 = v47;
  v47 = 0;
  v42.receiver = v6;
  v42.super_class = (Class)AMDDODMLAttachmentProcessor;
  v36 = -[AMDDODMLAttachmentProcessor init](&v42, sel_init);
  v47 = v36;
  objc_storeStrong(&v47, v36);
  if (v36)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)*((_QWORD *)v47 + 1);
    *((_QWORD *)v47 + 1) = v7;

    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)*((_QWORD *)v47 + 2);
    *((_QWORD *)v47 + 2) = v9;

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (void *)*((_QWORD *)v47 + 3);
    *((_QWORD *)v47 + 3) = v11;

    for (i = 0; ; ++i)
    {
      v32 = i;
      if (v32 >= objc_msgSend(v45, "count"))
        goto LABEL_27;
      v40 = (id)objc_msgSend(v45, "objectAtIndex:", i);
      v39 = (id)objc_msgSend(v40, "objectForKey:", FunctionName);
      if (!v39)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v14 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v43, 50, 0);
        *v44 = v14;
        v48 = 0;
        v38 = 1;
        goto LABEL_25;
      }
      v37 = 0;
      if ((objc_msgSend(v39, "isEqual:", HashMapFile) & 1) != 0)
      {
        v15 = (id)objc_msgSend(v47, "readHashMapDictionary:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v16 = v37;
        v37 = v15;

        goto LABEL_21;
      }
      if ((objc_msgSend(v39, "isEqual:", HashMapFileBytes) & 1) != 0)
      {
        v17 = (id)objc_msgSend(v47, "readHashMapDictionaryBytes:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v18 = v37;
        v37 = v17;

        goto LABEL_21;
      }
      if ((objc_msgSend(v39, "isEqual:", NegativeSampleFile) & 1) != 0)
      {
        v19 = (id)objc_msgSend(v47, "readNegativeSampleArray:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v20 = v37;
        v37 = v19;

        goto LABEL_21;
      }
      if ((objc_msgSend(v39, "isEqual:", NegativeSampleFileBytes) & 1) != 0)
      {
        v21 = (id)objc_msgSend(v47, "readNegativeSampleArrayBytes:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v22 = v37;
        v37 = v21;

        goto LABEL_21;
      }
      if ((objc_msgSend(v39, "isEqual:", DownSampleFile) & 1) != 0)
      {
        v23 = (id)objc_msgSend(v47, "readDownSampleDictionary:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v24 = v37;
        v37 = v23;

        goto LABEL_21;
      }
      if ((objc_msgSend(v39, "isEqual:", DownSampleFileBytes) & 1) != 0)
        break;
      if ((objc_msgSend(v39, "isEqual:", WeightsFileBytes) & 1) != 0)
      {
        v27 = (id)objc_msgSend(v47, "readWeightsArrayBytes:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
        v28 = v37;
        v37 = v27;

LABEL_21:
        if (v37)
        {
          v38 = 0;
        }
        else
        {
          v48 = 0;
          v38 = 1;
        }
        goto LABEL_24;
      }
      v29 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v30 = (id)objc_msgSend(v29, "initWithDomain:code:userInfo:", v43, 50, 0);
      *v44 = v30;
      v48 = 0;
      v38 = 1;
LABEL_24:
      objc_storeStrong(&v37, 0);
LABEL_25:
      objc_storeStrong(&v39, 0);
      objc_storeStrong(&v40, 0);
      if (v38)
        goto LABEL_28;
    }
    v25 = (id)objc_msgSend(v47, "readDownSampleDictionaryBytes:withAttachments:error:errorDomain:", v40, location[0], v44, v43);
    v26 = v37;
    v37 = v25;

    goto LABEL_21;
  }
LABEL_27:
  v48 = (AMDDODMLAttachmentProcessor *)v47;
  v38 = 1;
LABEL_28:
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v47, 0);
  return v48;
}

- (id)hashMapForKey:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLAttachmentProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_hashMapAttachments, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)setHashMap:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id location[2];
  AMDDODMLAttachmentProcessor *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  -[NSMutableDictionary setObject:forKey:](v9->_hashMapAttachments, "setObject:forKey:", location[0], v7);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (id)downSampleDictionaryForKey:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLAttachmentProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_downSampleAttachments, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)negSampleArrayForKey:(id)a3
{
  id v4;
  id location[2];
  AMDDODMLAttachmentProcessor *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[NSMutableDictionary objectForKey:](v6->_negSampleAttachements, "objectForKey:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)weightsArray
{
  return self->_weightAttachment;
}

- (id)getURLFromURLArray:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v12;
  int v13;
  id v14;
  id *v15;
  id location[3];
  id v17;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14 = 0;
  objc_storeStrong(&v14, a5);
  if (objc_msgSend(location[0], "count"))
  {
    if ((unint64_t)objc_msgSend(location[0], "count") <= 1)
    {
      v12 = (id)objc_msgSend(location[0], "firstObject");
      v17 = v12;
      v13 = 1;
      objc_storeStrong(&v12, 0);
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v8 = (id)objc_msgSend(v7, "initWithDomain:code:userInfo:", v14, 95, 0);
      *v15 = v8;
      v17 = 0;
      v13 = 1;
    }
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v6 = (id)objc_msgSend(v5, "initWithDomain:code:userInfo:", v14, 94, 0);
    *v15 = v6;
    v17 = 0;
    v13 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (id)readNegativeSampleArray:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD __b[8];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id *v31;
  id v32;
  id location[2];
  AMDDODMLAttachmentProcessor *v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31 = a5;
  v30 = 0;
  objc_storeStrong(&v30, a6);
  v29 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v28 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  if (v29 && v28)
  {
    v26 = (id)objc_msgSend(v32, "attachmentURLsForBasename:", v29);
    v25 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v34, "getURLFromURLArray:error:errorDomain:", v26, v31, v30);
    if (v25)
    {
      v24 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v25, 4, v31);
      if ((objc_msgSend(v24, "isEqual:", 0) & 1) != 0)
      {
        v35 = 0;
        v27 = 1;
      }
      else
      {
        v23 = (id)objc_msgSend(v24, "componentsSeparatedByString:", CFSTR("\n"));
        v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(__b, 0, sizeof(__b));
        v15 = v23;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (v16)
        {
          v12 = *(_QWORD *)__b[2];
          v13 = 0;
          v14 = v16;
          while (1)
          {
            v11 = v13;
            if (*(_QWORD *)__b[2] != v12)
              objc_enumerationMutation(v15);
            v21 = *(id *)(__b[1] + 8 * v13);
            v9 = v22;
            v10 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v21, "longLongValue"));
            objc_msgSend(v9, "addObject:");

            ++v13;
            if (v11 + 1 >= v14)
            {
              v13 = 0;
              v14 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
              if (!v14)
                break;
            }
          }
        }

        -[NSMutableDictionary setObject:forKey:](v34->_negSampleAttachements, "setObject:forKey:", v22, v28);
        v35 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
        v27 = 1;
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
      }
      objc_storeStrong(&v24, 0);
    }
    else
    {
      v35 = 0;
      v27 = 1;
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v30, 51, 0);
    *v31 = v7;
    v35 = 0;
    v27 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v35;
}

- (id)readNegativeSampleArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  unint64_t v13;
  double v17;
  unint64_t i;
  id v19;
  id v20;
  id v21;
  id v22;
  int v23;
  id v24;
  id v25;
  id v26;
  id *v27;
  id v28;
  id location[2];
  AMDDODMLAttachmentProcessor *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = 0;
  objc_storeStrong(&v28, a4);
  v27 = a5;
  v26 = 0;
  objc_storeStrong(&v26, a6);
  v25 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v24 = (id)objc_msgSend(location[0], "objectForKey:", OutputArray);
  if (v25 && v24)
  {
    v22 = (id)objc_msgSend(v28, "attachmentURLsForBasename:", v25);
    v21 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v30, "getURLFromURLArray:error:errorDomain:", v22, v27, v26);
    if (v21)
    {
      v20 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v21, 1, v27);
      if (v20)
      {
        if (objc_msgSend(v20, "length") % 8uLL)
        {
          v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v26, 59, 0);
          *v27 = v9;
          v31 = 0;
          v23 = 1;
        }
        else
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          for (i = 0; ; ++i)
          {
            v13 = i;
            if (v13 >= objc_msgSend(v20, "length") / 8uLL)
              break;
            v17 = 0.0;
            v33 = 8 * i;
            v32 = 8;
            v34 = 8 * i;
            v35 = 8;
            objc_msgSend(v20, "getBytes:range:", &v17, 8 * i, 8);
            v11 = v19;
            v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
            objc_msgSend(v11, "addObject:");

          }
          -[NSMutableDictionary setObject:forKey:](v30->_negSampleAttachements, "setObject:forKey:", v19, v24);
          v31 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
          v23 = 1;
          objc_storeStrong(&v19, 0);
        }
      }
      else
      {
        v31 = 0;
        v23 = 1;
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      v31 = 0;
      v23 = 1;
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v26, 52, 0);
    *v27 = v7;
    v31 = 0;
    v23 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31;
}

- (id)readDownSampleDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v24;
  id v25;
  id v26;
  _QWORD __b[8];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id *v38;
  id v39;
  id location[2];
  AMDDODMLAttachmentProcessor *v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = a5;
  v37 = 0;
  objc_storeStrong(&v37, a6);
  v36 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v35 = (id)objc_msgSend(location[0], "objectForKey:", OutputDictionary);
  if (v36 && v35)
  {
    v33 = (id)objc_msgSend(v39, "attachmentURLsForBasename:", v36);
    v32 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v41, "getURLFromURLArray:error:errorDomain:", v33, v38, v37);
    if (v32)
    {
      v31 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v32, 4, v38);
      if ((objc_msgSend(v31, "isEqual:", 0) & 1) != 0)
      {
        v42 = 0;
        v34 = 1;
      }
      else
      {
        v30 = (id)objc_msgSend(v31, "componentsSeparatedByString:", CFSTR("\n"));
        v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        memset(__b, 0, sizeof(__b));
        v19 = v30;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
        if (v20)
        {
          v16 = *(_QWORD *)__b[2];
          v17 = 0;
          v18 = v20;
          while (1)
          {
            v15 = v17;
            if (*(_QWORD *)__b[2] != v16)
              objc_enumerationMutation(v19);
            v28 = *(id *)(__b[1] + 8 * v17);
            v26 = (id)objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(","));
            if (objc_msgSend(v26, "count") == 2)
            {
              v11 = (void *)MEMORY[0x1E0CB37E8];
              v12 = (id)objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
              v25 = (id)objc_msgSend(v11, "numberWithLong:", objc_msgSend(v12, "longLongValue"));

              v13 = (void *)MEMORY[0x1E0CB37E8];
              v14 = (id)objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
              objc_msgSend(v14, "doubleValue");
              v24 = (id)objc_msgSend(v13, "numberWithDouble:");

              objc_msgSend(v29, "setObject:forKey:", v24, v25);
              objc_storeStrong(&v24, 0);
              objc_storeStrong(&v25, 0);
              v34 = 0;
            }
            else
            {
              v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v37, 14, 0);
              *v38 = v9;
              v42 = 0;
              v34 = 1;
            }
            objc_storeStrong(&v26, 0);
            if (v34)
              break;
            ++v17;
            if (v15 + 1 >= v18)
            {
              v17 = 0;
              v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
              if (!v18)
                goto LABEL_18;
            }
          }
        }
        else
        {
LABEL_18:
          v34 = 0;
        }

        if (!v34)
        {
          -[NSMutableDictionary setObject:forKey:](v41->_downSampleAttachments, "setObject:forKey:", v29, v35);
          v42 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
          v34 = 1;
        }
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
      }
      objc_storeStrong(&v31, 0);
    }
    else
    {
      v42 = 0;
      v34 = 1;
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v37, 53, 0);
    *v38 = v7;
    v42 = 0;
    v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v42;
}

- (id)readDownSampleDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v13;
  uint64_t v14;
  id v18;
  id v19[3];
  double v20[3];
  uint64_t v21;
  unint64_t i;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  id location[2];
  AMDDODMLAttachmentProcessor *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  v34 = 0;
  objc_storeStrong(&v34, a6);
  v33 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v32 = (id)objc_msgSend(location[0], "objectForKey:", SecondFileBaseName);
  v31 = (id)objc_msgSend(location[0], "objectForKey:", OutputDictionary);
  if (v33 && v32 && v31)
  {
    v29 = (id)objc_msgSend(v36, "attachmentURLsForBasename:", v33);
    v28 = (id)objc_msgSend(v36, "attachmentURLsForBasename:", v32);
    v27 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v38, "getURLFromURLArray:error:errorDomain:", v29, v35, v34);
    v26 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v38, "getURLFromURLArray:error:errorDomain:", v28, v35, v34);
    if (v27 && v26)
    {
      v25 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v27);
      v24 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v26, 1, v35);
      if (v25 && v24)
      {
        v14 = objc_msgSend(v25, "length");
        if (v14 == objc_msgSend(v24, "length"))
        {
          if (objc_msgSend(v25, "length") % 8uLL)
          {
            v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v34, 59, 0);
            *v35 = v11;
            v39 = 0;
            v30 = 1;
          }
          else
          {
            v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            for (i = 0; ; ++i)
            {
              v13 = i;
              if (v13 >= objc_msgSend(v25, "length") / 8uLL)
                break;
              v21 = 0;
              v45 = 8 * i;
              v44 = 8;
              v46 = 8 * i;
              v47 = 8;
              *(_QWORD *)&v20[1] = 8 * i;
              *(_QWORD *)&v20[2] = 8;
              objc_msgSend(v25, "getBytes:range:", &v21, 8 * i, 8);
              v20[0] = 0.0;
              v41 = 8 * i;
              v40 = 8;
              v42 = 8 * i;
              v43 = 8;
              v19[1] = (id)(8 * i);
              v19[2] = (id)8;
              objc_msgSend(v24, "getBytes:range:", v20, 8 * i, 8);
              v19[0] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v21);
              v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20[0]);
              objc_msgSend(v23, "setObject:forKey:", v18, v19[0]);
              objc_storeStrong(&v18, 0);
              objc_storeStrong(v19, 0);
            }
            -[NSMutableDictionary setObject:forKey:](v38->_downSampleAttachments, "setObject:forKey:", v23, v31);
            v39 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
            v30 = 1;
            objc_storeStrong(&v23, 0);
          }
        }
        else
        {
          v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v34, 58, 0);
          *v35 = v9;
          v39 = 0;
          v30 = 1;
        }
      }
      else
      {
        v39 = 0;
        v30 = 1;
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v39 = 0;
      v30 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v34, 54, 0);
    *v35 = v7;
    v39 = 0;
    v30 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v39;
}

- (id)readHashMapDictionary:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v24;
  id v25;
  id v26;
  _QWORD __b[8];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id *v38;
  id v39;
  id location[2];
  AMDDODMLAttachmentProcessor *v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_storeStrong(&v39, a4);
  v38 = a5;
  v37 = 0;
  objc_storeStrong(&v37, a6);
  v36 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v35 = (id)objc_msgSend(location[0], "objectForKey:", OutputDictionary);
  if (v36 && v35)
  {
    v33 = (id)objc_msgSend(v39, "attachmentURLsForBasename:", v36);
    v32 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v41, "getURLFromURLArray:error:errorDomain:", v33, v38, v37);
    if (v32)
    {
      v31 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v32, 4, v38);
      if ((objc_msgSend(v31, "isEqual:", 0) & 1) != 0)
      {
        v42 = 0;
        v34 = 1;
      }
      else
      {
        v30 = (id)objc_msgSend(v31, "componentsSeparatedByString:", CFSTR("\n"));
        v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        memset(__b, 0, sizeof(__b));
        v19 = v30;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
        if (v20)
        {
          v16 = *(_QWORD *)__b[2];
          v17 = 0;
          v18 = v20;
          while (1)
          {
            v15 = v17;
            if (*(_QWORD *)__b[2] != v16)
              objc_enumerationMutation(v19);
            v28 = *(id *)(__b[1] + 8 * v17);
            v26 = (id)objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(","));
            if (objc_msgSend(v26, "count") == 2)
            {
              v11 = (void *)MEMORY[0x1E0CB37E8];
              v12 = (id)objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
              v25 = (id)objc_msgSend(v11, "numberWithLong:", objc_msgSend(v12, "longLongValue"));

              v13 = (void *)MEMORY[0x1E0CB37E8];
              v14 = (id)objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
              v24 = (id)objc_msgSend(v13, "numberWithLong:", objc_msgSend(v14, "longLongValue"));

              objc_msgSend(v29, "setObject:forKey:", v24, v25);
              objc_storeStrong(&v24, 0);
              objc_storeStrong(&v25, 0);
              v34 = 0;
            }
            else
            {
              v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v37, 14, 0);
              *v38 = v9;
              v42 = 0;
              v34 = 1;
            }
            objc_storeStrong(&v26, 0);
            if (v34)
              break;
            ++v17;
            if (v15 + 1 >= v18)
            {
              v17 = 0;
              v18 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", __b, v43, 16);
              if (!v18)
                goto LABEL_18;
            }
          }
        }
        else
        {
LABEL_18:
          v34 = 0;
        }

        if (!v34)
        {
          -[NSMutableDictionary setObject:forKey:](v41->_hashMapAttachments, "setObject:forKey:", v29, v35);
          v42 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
          v34 = 1;
        }
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
      }
      objc_storeStrong(&v31, 0);
    }
    else
    {
      v42 = 0;
      v34 = 1;
    }
    objc_storeStrong(&v32, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v37, 55, 0);
    *v38 = v7;
    v42 = 0;
    v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v42;
}

- (id)readHashMapDictionaryBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v13;
  uint64_t v14;
  id v18;
  id v19[3];
  _QWORD v20[3];
  uint64_t v21;
  unint64_t i;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id *v35;
  id v36;
  id location[2];
  AMDDODMLAttachmentProcessor *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v36 = 0;
  objc_storeStrong(&v36, a4);
  v35 = a5;
  v34 = 0;
  objc_storeStrong(&v34, a6);
  v33 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  v32 = (id)objc_msgSend(location[0], "objectForKey:", SecondFileBaseName);
  v31 = (id)objc_msgSend(location[0], "objectForKey:", OutputDictionary);
  if (v33 && v32 && v31)
  {
    v29 = (id)objc_msgSend(v36, "attachmentURLsForBasename:", v33);
    v28 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v38, "getURLFromURLArray:error:errorDomain:", v29, v35, v34);
    v27 = (id)objc_msgSend(v36, "attachmentURLsForBasename:", v32);
    v26 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v38, "getURLFromURLArray:error:errorDomain:", v27, v35, v34);
    if (v28 && v26)
    {
      v25 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v28);
      v24 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v26, 1, v35);
      if (v24 && v25)
      {
        v14 = objc_msgSend(v25, "length");
        if (v14 == objc_msgSend(v24, "length"))
        {
          if (objc_msgSend(v25, "length") % 8uLL)
          {
            v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v34, 59, 0);
            *v35 = v11;
            v39 = 0;
            v30 = 1;
          }
          else
          {
            v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            for (i = 0; ; ++i)
            {
              v13 = i;
              if (v13 >= objc_msgSend(v25, "length") / 8uLL)
                break;
              v21 = 0;
              v45 = 8 * i;
              v44 = 8;
              v46 = 8 * i;
              v47 = 8;
              v20[1] = 8 * i;
              v20[2] = 8;
              objc_msgSend(v25, "getBytes:range:", &v21, 8 * i, 8);
              v20[0] = 0;
              v41 = 8 * i;
              v40 = 8;
              v42 = 8 * i;
              v43 = 8;
              v19[1] = (id)(8 * i);
              v19[2] = (id)8;
              objc_msgSend(v24, "getBytes:range:", v20, 8 * i, 8);
              v19[0] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v21);
              v18 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v20[0]);
              objc_msgSend(v23, "setObject:forKey:", v18, v19[0]);
              objc_storeStrong(&v18, 0);
              objc_storeStrong(v19, 0);
            }
            -[NSMutableDictionary setObject:forKey:](v38->_hashMapAttachments, "setObject:forKey:", v23, v31);
            v39 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
            v30 = 1;
            objc_storeStrong(&v23, 0);
          }
        }
        else
        {
          v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v9 = (id)objc_msgSend(v8, "initWithDomain:code:userInfo:", v34, 58, 0);
          *v35 = v9;
          v39 = 0;
          v30 = 1;
        }
      }
      else
      {
        v39 = 0;
        v30 = 1;
      }
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v25, 0);
    }
    else
    {
      v39 = 0;
      v30 = 1;
    }
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v29, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v34, 56, 0);
    *v35 = v7;
    v39 = 0;
    v30 = 1;
  }
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v39;
}

- (id)readWeightsArrayBytes:(id)a3 withAttachments:(id)a4 error:(id *)a5 errorDomain:(id)a6
{
  id v6;
  id v7;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id *v18;
  id v19;
  id location[2];
  AMDDODMLAttachmentProcessor *v21;
  id v22;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = 0;
  objc_storeStrong(&v17, a6);
  v16 = (id)objc_msgSend(location[0], "objectForKey:", FileBaseName);
  if (v16)
  {
    v14 = (id)objc_msgSend(v19, "attachmentURLsForBasename:", v16);
    v13 = -[AMDDODMLAttachmentProcessor getURLFromURLArray:error:errorDomain:](v21, "getURLFromURLArray:error:errorDomain:", v14, v18, v17);
    if (v13)
    {
      v12 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v13, 1, v18);
      if (v12)
      {
        objc_storeStrong((id *)&v21->_weightAttachment, v12);
        v22 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", 1);
      }
      else
      {
        v22 = 0;
      }
      v15 = 1;
      objc_storeStrong(&v12, 0);
    }
    else
    {
      v22 = 0;
      v15 = 1;
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v7 = (id)objc_msgSend(v6, "initWithDomain:code:userInfo:", v17, 113, 0);
    *v18 = v7;
    v22 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightAttachment, 0);
  objc_storeStrong((id *)&self->_negSampleAttachements, 0);
  objc_storeStrong((id *)&self->_downSampleAttachments, 0);
  objc_storeStrong((id *)&self->_hashMapAttachments, 0);
}

@end
