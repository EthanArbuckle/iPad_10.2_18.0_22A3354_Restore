@implementation COSE

- (COSE)initWithData:(id)a3
{
  void *v4;
  COSE *v5;

  +[CBOR decodeFromData:](CBOR, "decodeFromData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[COSE initWithCBOR:](self, "initWithCBOR:", v4);

  return v5;
}

- (COSE)initWithData:(id)a3 type:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  COSE *v14;
  COSE *v15;

  +[CBOR decodeFromData:](CBOR, "decodeFromData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "tag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numeric");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "tag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numeric");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      if (v13 != a4)
      {
        v14 = 0;
        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  v15 = -[COSE initWithCBOR:](self, "initWithCBOR:", v6);
  if (v15)
    v15->_type = a4;
  self = v15;
  v14 = self;
LABEL_9:

  return v14;
}

- (COSE)initWithCBOR:(id)a3
{
  id v5;
  COSE *v6;
  void *v7;
  unint64_t v8;
  COSE *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t type;
  CBOR *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSDictionary *v22;
  NSDictionary *protectedHeadererDictionary;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)COSE;
  v6 = -[COSE init](&v28, sel_init);
  if (!v6)
    goto LABEL_23;
  if (objc_msgSend(v5, "type") == 4)
  {
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 2)
    {
      objc_storeStrong((id *)&v6->_cborObj, a3);
      -[CBOR tag](v6->_cborObj, "tag");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_8;
      -[CBOR tag](v6->_cborObj, "tag");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numeric");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_type = objc_msgSend(v12, "integerValue");

      type = v6->_type;
      if ((unint64_t)(type - 96) < 3 || (unint64_t)(type - 16) <= 2)
      {
LABEL_8:
        v14 = v6->_cborObj;
        if (-[CBOR type](v14, "type") != 4)
        {
LABEL_22:

LABEL_23:
          v9 = v6;
          goto LABEL_24;
        }
        -[CBOR array](v14, "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v15, "count") < 2)
        {
LABEL_21:

          goto LABEL_22;
        }
        -[CBOR array](v14, "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "type") == 2)
        {
          objc_msgSend(v17, "data");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "length"))
          {
            v22 = 0;
LABEL_20:

            protectedHeadererDictionary = v6->_protectedHeadererDictionary;
            v6->_protectedHeadererDictionary = v22;

            -[COSE _parseCommonHeaderParameters:](v6, v6->_protectedHeadererDictionary);
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "dictionary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            -[COSE _parseCommonHeaderParameters:](v6, v25);
            objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "type");

            goto LABEL_21;
          }
          +[CBOR decodeFromData:](CBOR, "decodeFromData:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "dictionary");
          v20 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v20;
        }
        else if (objc_msgSend(v17, "type") == 5)
        {
          objc_msgSend(v17, "dictionary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v21 = (void *)MEMORY[0x24BDBD1B8];
        if (v18)
          v21 = v18;
        v22 = v21;
        goto LABEL_20;
      }
    }
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (id)initWithProtectedHeaders:(void *)a3 unprotectedHeaders:(void *)a4 payload:(uint64_t)a5 type:(void *)a6 additionalCBORs:
{
  id v11;
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a2;
  v12 = a4;
  v13 = a6;
  if (a1)
  {
    v14 = (objc_class *)MEMORY[0x24BDBCEB8];
    v15 = a3;
    v16 = objc_alloc_init(v14);
    if (objc_msgSend(v11, "count"))
    {
      +[CBOR cborWithDictionary:](CBOR, "cborWithDictionary:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithCBOR:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    }
    +[CBOR cborWithData:](CBOR, "cborWithData:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    +[CBOR cborWithDictionary:](CBOR, "cborWithDictionary:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addObject:", v20);
    if (v12)
      +[CBOR cborWithData:](CBOR, "cborWithData:", v12);
    else
      +[CBOR cborNil](CBOR, "cborNil");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

    if (v13)
      objc_msgSend(v16, "addObjectsFromArray:", v13);
    +[CBOR cborWithArray:](CBOR, "cborWithArray:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5 != -1)
    {
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTag:", v23);

    }
    a1 = (id)objc_msgSend(a1, "initWithCBOR:", v22);

  }
  return a1;
}

- (NSData)protectedHeaderParameters
{
  void *v2;
  void *v3;
  void *v4;

  -[CBOR array](self->_cborObj, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSDictionary)unprotectedHeaderParameters
{
  void *v2;
  void *v3;
  void *v4;

  -[CBOR array](self->_cborObj, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSData)content
{
  void *v2;
  void *v3;
  void *v4;

  -[CBOR array](self->_cborObj, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSData *)v4;
}

- (CBOR)tag
{
  void *cborObj;

  cborObj = self->_cborObj;
  if (cborObj)
  {
    objc_msgSend(cborObj, "tag");
    cborObj = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CBOR *)cborObj;
}

- (void)_parseCommonHeaderParameters:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  uint64_t v49;
  id v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v4)
  {
    v5 = v4;
    v53 = *(_QWORD *)v59;
    v50 = v3;
    v51 = a1;
    do
    {
      v6 = 0;
      v52 = v5;
      do
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v6);
        objc_msgSend(v3, "objectForKeyedSubscript:", v7, v50);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "type");
        if (v9 < 2)
          goto LABEL_9;
        if (v9 != 3)
        {
          if (v9 != 13)
            goto LABEL_61;
LABEL_9:
          objc_msgSend(v7, "numeric");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        objc_msgSend(v7, "string");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v11 = v10;
        v12 = objc_msgSend(v10, "integerValue");

        switch(v12)
        {
          case 1:
            if (objc_msgSend(v8, "type") == 3)
            {
              objc_msgSend(v8, "string");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (!objc_msgSend(v8, "isWholeNumber"))
                goto LABEL_61;
              objc_msgSend(v8, "numeric");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v15 = v13;
            a1[4] = objc_msgSend(v13, "integerValue");
            goto LABEL_60;
          case 2:
            if (objc_msgSend(v8, "type") != 4)
              goto LABEL_61;
            v15 = (void *)objc_opt_new();
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            objc_msgSend(v8, "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
            if (!v17)
              goto LABEL_29;
            v18 = v17;
            v19 = *(_QWORD *)v55;
            break;
          case 3:
            if (objc_msgSend(v8, "type") == 3)
            {
              objc_msgSend(v8, "string");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-sign\"));

              if (v29)
              {
                v30 = &unk_24C7D63D8;
              }
              else
              {
                objc_msgSend(v8, "string");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-sign1\"));

                if (v36)
                {
                  v30 = &unk_24C7D63F0;
                }
                else
                {
                  objc_msgSend(v8, "string");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-encrypt\"));

                  if (v38)
                  {
                    v30 = &unk_24C7D6408;
                  }
                  else
                  {
                    objc_msgSend(v8, "string");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-encrypt0\"));

                    if (v40)
                    {
                      v30 = &unk_24C7D6420;
                    }
                    else
                    {
                      objc_msgSend(v8, "string");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-mac\"));

                      if (v42)
                      {
                        v30 = &unk_24C7D6438;
                      }
                      else
                      {
                        objc_msgSend(v8, "string");
                        v43 = (void *)objc_claimAutoreleasedReturnValue();
                        v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("application/cose; cose-type=\"cose-mac0\"));

                        if (v44)
                        {
                          v30 = &unk_24C7D6450;
                        }
                        else
                        {
                          objc_msgSend(v8, "string");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("application/cose-key"));

                          if (v46)
                          {
                            v30 = &unk_24C7D6468;
                          }
                          else
                          {
                            objc_msgSend(v8, "string");
                            v47 = (void *)objc_claimAutoreleasedReturnValue();
                            v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("application/cose-key-set"));

                            if (!v48)
                              goto LABEL_61;
                            v30 = &unk_24C7D6480;
                          }
                        }
                      }
                    }
                  }
                }
              }
              objc_msgSend(v30, "stringValue");
              v49 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)a1[6];
              a1[6] = v49;
            }
            else
            {
              if (!objc_msgSend(v8, "isWholeNumber"))
                goto LABEL_61;
              objc_msgSend(v8, "numeric");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringValue");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)a1[6];
              a1[6] = v33;

            }
            goto LABEL_60;
          case 4:
            if (objc_msgSend(v8, "type") != 2)
              goto LABEL_61;
            objc_msgSend(v8, "data");
            v31 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)a1[7];
            a1[7] = v31;
            goto LABEL_60;
          case 5:
            if (objc_msgSend(v8, "type") != 2)
              goto LABEL_61;
            objc_msgSend(v8, "data");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)a1[8];
            a1[8] = v14;
            goto LABEL_60;
          case 6:
            if (objc_msgSend(v8, "type") != 2)
              goto LABEL_61;
            objc_msgSend(v8, "data");
            v32 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)a1[9];
            a1[9] = v32;
            goto LABEL_60;
          default:
            goto LABEL_61;
        }
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v55 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (objc_msgSend(v21, "isWholeNumber"))
            {
              objc_msgSend(v21, "numeric");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v22);
            }
            else
            {
              objc_msgSend(v21, "string");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v23)
                continue;
              v24 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v21, "string");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v22, "integerValue"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v25);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v18);
LABEL_29:

        if (objc_msgSend(v15, "count"))
        {
          v26 = objc_msgSend(v15, "copy");
          a1 = v51;
          v27 = (void *)v51[5];
          v51[5] = v26;

        }
        else
        {
          a1 = v51;
        }
        v3 = v50;
LABEL_60:

        v5 = v52;
LABEL_61:

        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v5);
  }

}

- (id)_searchForHeaderLabel:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v5 = (void *)*((_QWORD *)a1 + 3);
    v6 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __30__COSE__searchForHeaderLabel___block_invoke;
    v16[3] = &unk_24C7D4290;
    v7 = v3;
    v17 = v7;
    v18 = &v26;
    v19 = &v20;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);
    if (*((_BYTE *)v27 + 24))
    {
      a1 = (id)v21[5];
    }
    else
    {
      objc_msgSend(*((id *)a1 + 1), "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __30__COSE__searchForHeaderLabel___block_invoke_2;
      v12[3] = &unk_24C7D4290;
      v13 = v7;
      v14 = &v26;
      v15 = &v20;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

      a1 = (id)v21[5];
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return a1;
}

void __30__COSE__searchForHeaderLabel___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = objc_msgSend(v11, "type");
  if (v8 < 2)
  {
LABEL_4:
    objc_msgSend(v11, "numeric");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (v8 != 3)
  {
    if (v8 != 13)
    {
      v10 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  objc_msgSend(v11, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if (!objc_msgSend(*(id *)(a1 + 32), "compare:", v10))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
LABEL_9:

}

void __30__COSE__searchForHeaderLabel___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = objc_msgSend(v11, "type");
  if (v8 < 2)
  {
LABEL_4:
    objc_msgSend(v11, "numeric");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (v8 != 3)
  {
    if (v8 != 13)
    {
      v10 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  objc_msgSend(v11, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  if (!objc_msgSend(*(id *)(a1 + 32), "compare:", v10))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
LABEL_9:

}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)protectedHeadererDictionary
{
  return self->_protectedHeadererDictionary;
}

- (int64_t)algorithmIdentifier
{
  return self->_algorithmIdentifier;
}

- (NSArray)criticalHeaderParameters
{
  return self->_criticalHeaderParameters;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSData)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSData)initializationVector
{
  return self->_initializationVector;
}

- (NSData)partialInitializationVector
{
  return self->_partialInitializationVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialInitializationVector, 0);
  objc_storeStrong((id *)&self->_initializationVector, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_criticalHeaderParameters, 0);
  objc_storeStrong((id *)&self->_protectedHeadererDictionary, 0);
  objc_storeStrong((id *)&self->_cborObj, 0);
}

- (void)setType:(uint64_t)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "tag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 8), "tag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "numeric");

    }
    *(_QWORD *)(a1 + 16) = a2;
  }
}

- (id)sourceObject
{
  if (a1)
    a1 = (id *)a1[1];
  return a1;
}

@end
