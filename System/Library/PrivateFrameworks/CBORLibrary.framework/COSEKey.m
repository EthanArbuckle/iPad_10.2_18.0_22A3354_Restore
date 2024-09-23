@implementation COSEKey

- (COSEKey)initWithData:(id)a3
{
  void *v4;
  COSEKey *v5;

  +[CBOR decodeFromData:](CBOR, "decodeFromData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[COSEKey initWithCBOR:](self, "initWithCBOR:", v4);

  return v5;
}

- (COSEKey)initWithCBOR:(id)a3
{
  id v5;
  COSEKey *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSNumber *curveID;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSData *paramX;
  void *v23;
  void *v24;
  uint64_t v25;
  NSData *paramD;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSData *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSData *symmetricKey;
  id v44;
  void *v45;
  NSData *paramY;
  void *v47;
  void *v48;
  uint64_t v49;
  NSData *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSData *identifier;
  void *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;
  char v75;
  char v76;
  char v77;
  char v78;
  int v79;
  uint64_t v80;
  NSArray *operations;
  void *v82;
  void *v83;
  uint64_t v84;
  NSData *baseInitializationVector;
  COSEKey *v86;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  objc_super v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v98.receiver = self;
  v98.super_class = (Class)COSEKey;
  v6 = -[COSEKey init](&v98, sel_init);
  if (!v6)
    goto LABEL_105;
  if (objc_msgSend(v5, "type") == 5)
  {
    objc_storeStrong((id *)&v6->_cborObj, a3);
    objc_msgSend(v5, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_msgSend(v9, "type") == 3 || objc_msgSend(v9, "isWholeNumber")))
    {
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "type") != 3)
      {
        v11 = objc_msgSend(v9, "unsignedLongLongValue");
        v6->_type = v11;
        v12 = 1;
        switch(v11)
        {
          case 1:
            goto LABEL_11;
          case 2:
            goto LABEL_22;
          case 3:
            break;
          case 4:
            goto LABEL_32;
          default:
            goto LABEL_48;
        }
LABEL_103:

        if (v12)
          goto LABEL_104;
LABEL_105:
        v86 = v6;
        goto LABEL_106;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("OKP")))
      {
        v6->_type = 1;
LABEL_11:
        v13 = v9;
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "numeric");
          v16 = objc_claimAutoreleasedReturnValue();
          curveID = v6->_curveID;
          v6->_curveID = (NSNumber *)v16;

        }
        v18 = v10;
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20 && objc_msgSend(v20, "type") == 2)
        {
          objc_msgSend(v20, "data");
          v21 = objc_claimAutoreleasedReturnValue();
          paramX = v6->_paramX;
          v6->_paramX = (NSData *)v21;

        }
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 && objc_msgSend(v24, "type") == 2)
        {
          objc_msgSend(v24, "data");
          v25 = objc_claimAutoreleasedReturnValue();
          paramD = v6->_paramD;
          v6->_paramD = (NSData *)v25;

        }
        v9 = v13;
        v10 = v18;
        goto LABEL_48;
      }
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("EC2")))
      {
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("Symmetric")))
        {
          v6->_type = 4;
LABEL_32:
          +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41 && objc_msgSend(v41, "type") == 2)
          {
            objc_msgSend(v41, "data");
            v42 = objc_claimAutoreleasedReturnValue();
            symmetricKey = v6->_symmetricKey;
            v6->_symmetricKey = (NSData *)v42;

          }
        }
        else
        {
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("RSA")))
          {
            v6->_type = 3;
            v12 = 1;
            goto LABEL_103;
          }
          v6->_type = 0;
        }
LABEL_48:
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (v52 && objc_msgSend(v52, "type") == 2)
        {
          objc_msgSend(v52, "data");
          v53 = objc_claimAutoreleasedReturnValue();
          identifier = v6->_identifier;
          v6->_identifier = (NSData *)v53;

        }
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        v92 = v56;
        v93 = v52;
        if (v56 && (objc_msgSend(v56, "type") == 3 || objc_msgSend(v56, "isWholeNumber")))
        {
          if (objc_msgSend(v56, "type") == 3)
          {
            objc_msgSend(v56, "string");
            v57 = (id)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v57, "isEqualToString:", CFSTR("ES256")) & 1) != 0)
            {
              v58 = -7;
            }
            else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("ES384")) & 1) != 0)
            {
              v58 = -35;
            }
            else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("ES512")) & 1) != 0)
            {
              v58 = -36;
            }
            else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("A128GCM")) & 1) != 0)
            {
              v58 = 1;
            }
            else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("A192GCM")) & 1) != 0)
            {
              v58 = 2;
            }
            else
            {
              if (!objc_msgSend(v57, "isEqualToString:", CFSTR("A256GCM")))
              {
                v12 = 1;
LABEL_102:

                goto LABEL_103;
              }
              v58 = 3;
            }
            v6->_algorithm = v58;

          }
          else
          {
            v6->_algorithm = 0;
          }
        }
        v57 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60 && objc_msgSend(v60, "type") == 4)
        {
          v90 = v5;
          v88 = v9;
          v89 = v7;
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          objc_msgSend(v60, "array");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
          if (!v62)
            goto LABEL_95;
          v63 = v62;
          v64 = *(_QWORD *)v95;
          while (1)
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v95 != v64)
                objc_enumerationMutation(v61);
              v66 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
              if (objc_msgSend(v66, "isWholeNumber"))
              {
                objc_msgSend(v60, "numeric");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                v68 = v57;
                v69 = v67;
LABEL_91:
                objc_msgSend(v68, "addObject:", v69);
                goto LABEL_92;
              }
              if (objc_msgSend(v66, "type") != 3)
                continue;
              objc_msgSend(v66, "string");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v67, "isEqualToString:", CFSTR("sign"));
              v69 = &unk_24C7D64B0;
              if ((v70 & 1) != 0)
                goto LABEL_90;
              v71 = objc_msgSend(v67, "isEqualToString:", CFSTR("verify"));
              v69 = &unk_24C7D64C8;
              if ((v71 & 1) != 0)
                goto LABEL_90;
              v72 = objc_msgSend(v67, "isEqualToString:", CFSTR("encrypt"));
              v69 = &unk_24C7D64E0;
              if ((v72 & 1) != 0)
                goto LABEL_90;
              v73 = objc_msgSend(v67, "isEqualToString:", CFSTR("decrypt"));
              v69 = &unk_24C7D64F8;
              if ((v73 & 1) != 0)
                goto LABEL_90;
              v74 = objc_msgSend(v67, "isEqualToString:", CFSTR("wrapKey"));
              v69 = &unk_24C7D6510;
              if ((v74 & 1) != 0)
                goto LABEL_90;
              v75 = objc_msgSend(v67, "isEqualToString:", CFSTR("unwrapKey"));
              v69 = &unk_24C7D6528;
              if ((v75 & 1) != 0)
                goto LABEL_90;
              v76 = objc_msgSend(v67, "isEqualToString:", CFSTR("deriveKey"));
              v69 = &unk_24C7D6540;
              if ((v76 & 1) != 0
                || (v77 = objc_msgSend(v67, "isEqualToString:", CFSTR("deriveBits")),
                    v69 = &unk_24C7D6558,
                    (v77 & 1) != 0)
                || (v78 = objc_msgSend(v67, "isEqualToString:", CFSTR("MACCreate")), v69 = &unk_24C7D6570,
                                                                                     (v78 & 1) != 0)
                || (v79 = objc_msgSend(v67, "isEqualToString:", CFSTR("MACVerify")), v69 = &unk_24C7D6588, v79))
              {
LABEL_90:
                v68 = v57;
                goto LABEL_91;
              }
LABEL_92:

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
            if (!v63)
            {
LABEL_95:

              v5 = v90;
              v9 = v88;
              v7 = v89;
              break;
            }
          }
        }
        if (objc_msgSend(v57, "count"))
        {
          v80 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v57, 0);
          operations = v6->_operations;
          v6->_operations = (NSArray *)v80;

        }
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 5);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83 && objc_msgSend(v83, "type") == 2)
        {
          objc_msgSend(v83, "data");
          v84 = objc_claimAutoreleasedReturnValue();
          baseInitializationVector = v6->_baseInitializationVector;
          v6->_baseInitializationVector = (NSData *)v84;

        }
        v12 = 0;
        goto LABEL_102;
      }
      v6->_type = 2;
LABEL_22:
      v91 = v10;
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v28, "numeric");
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v6->_curveID;
        v6->_curveID = (NSNumber *)v29;

      }
      v31 = v9;
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 && objc_msgSend(v33, "type") == 2)
      {
        objc_msgSend(v33, "data");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v6->_paramX;
        v6->_paramX = (NSData *)v34;

      }
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v7;
      objc_msgSend(v7, "objectForKey:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        if (objc_msgSend(v38, "type") == 2)
        {
          objc_msgSend(v38, "data");
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v38, "type") == 10)
          {
            v44 = objc_alloc(MEMORY[0x24BDBCE50]);
            v45 = &COMPRESSED_EC2_Y_ONE;
          }
          else
          {
            if (objc_msgSend(v38, "type") != 9)
              goto LABEL_44;
            v44 = objc_alloc(MEMORY[0x24BDBCE50]);
            v45 = &COMPRESSED_EC2_Y_ZERO;
          }
          v39 = objc_msgSend(v44, "initWithBytes:length:", v45, 1);
        }
        paramY = v6->_paramY;
        v6->_paramY = (NSData *)v39;

      }
LABEL_44:
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -4);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKey:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48 && objc_msgSend(v48, "type") == 2)
      {
        objc_msgSend(v48, "data");
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = v6->_paramD;
        v6->_paramD = (NSData *)v49;

      }
      v7 = v37;
      v9 = v31;
      v10 = v91;
      goto LABEL_48;
    }

  }
LABEL_104:
  v86 = 0;
LABEL_106:

  return v86;
}

- (uint64_t)_initCBORWithMemberParams
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCED8]);
  +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v3;
  +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithDictionary:", v5);

  if (*(_QWORD *)(a1 + 64))
  {
    +[CBOR cborWithData:](CBOR, "cborWithData:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

  }
  v11 = 0;
  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
    case 3:
      goto LABEL_30;
    case 1:
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", objc_msgSend(*(id *)(a1 + 16), "integerValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v13);

      if (!objc_msgSend(*(id *)(a1 + 24), "length"))
        goto LABEL_13;
      +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 24));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -2;
      goto LABEL_12;
    case 2:
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", objc_msgSend(*(id *)(a1 + 16), "integerValue"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v17);

      if (objc_msgSend(*(id *)(a1 + 24), "length"))
      {
        +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 24));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", -2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v19);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "length"))
      {
        +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 32));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -3;
LABEL_12:
        +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v20);

      }
LABEL_13:
      if (!objc_msgSend(*(id *)(a1 + 40), "length"))
        goto LABEL_18;
      +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -4;
      break;
    case 4:
      if (!objc_msgSend(*(id *)(a1 + 88), "length"))
        goto LABEL_18;
      +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 88));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -1;
      break;
    default:
      goto LABEL_18;
  }
  +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v23);

LABEL_18:
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v24 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v25 = *(id *)(a1 + 72);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v25);
          +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "integerValue", (_QWORD)v38));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v27);
    }

    +[CBOR cborWithArray:](CBOR, "cborWithArray:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v32);

  }
  if (objc_msgSend(*(id *)(a1 + 80), "length", (_QWORD)v38))
  {
    +[CBOR cborWithData:](CBOR, "cborWithData:", *(_QWORD *)(a1 + 80));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", 5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, v34);

  }
  +[CBOR cborWithDictionary:](CBOR, "cborWithDictionary:", v6);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v35;

  v11 = 1;
LABEL_30:

  return v11;
}

- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 signBit:(BOOL)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  COSEKey *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  _BOOL4 v27;
  id v28;
  char v29;
  objc_super v30;

  v27 = a6;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v28 = a9;
  v30.receiver = self;
  v30.super_class = (Class)COSEKey;
  v18 = -[COSEKey init](&v30, sel_init);
  v19 = (uint64_t)v18;
  if (!v18)
    goto LABEL_6;
  v18->_type = 2;
  v18->_algorithm = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v19 + 16);
  *(_QWORD *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  v22 = v27 ? 3 : 2;
  v29 = v22;
  v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v29, 1);
  v24 = *(void **)(v19 + 32);
  *(_QWORD *)(v19 + 32) = v23;

  objc_storeStrong((id *)(v19 + 40), a7);
  objc_storeStrong((id *)(v19 + 72), a8);
  objc_storeStrong((id *)(v19 + 64), a9);
  if (!-[COSEKey _initCBORWithMemberParams](v19))
    v25 = 0;
  else
LABEL_6:
    v25 = (id)v19;

  return v25;
}

- (id)initEC2WithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 y:(id)a6 d:(id)a7 keyOperations:(id)a8 keyIdentifier:(id)a9
{
  id v16;
  id v17;
  COSEKey *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a5;
  v25 = a6;
  v24 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)COSEKey;
  v18 = -[COSEKey init](&v27, sel_init);
  v19 = (uint64_t)v18;
  if (!v18)
    goto LABEL_3;
  v18->_type = 2;
  v18->_algorithm = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v19 + 16);
  *(_QWORD *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  objc_storeStrong((id *)(v19 + 32), a6);
  objc_storeStrong((id *)(v19 + 40), a7);
  objc_storeStrong((id *)(v19 + 72), a8);
  objc_storeStrong((id *)(v19 + 64), a9);
  if (!-[COSEKey _initCBORWithMemberParams](v19))
    v22 = 0;
  else
LABEL_3:
    v22 = (id)v19;

  return v22;
}

- (id)initOKPWithAlgorithm:(int64_t)a3 curveIdentifier:(int64_t)a4 x:(id)a5 d:(id)a6 keyOperations:(id)a7 keyIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  COSEKey *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  objc_super v24;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)COSEKey;
  v18 = -[COSEKey init](&v24, sel_init);
  v19 = (uint64_t)v18;
  if (!v18)
    goto LABEL_3;
  v18->_type = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(void **)(v19 + 16);
  *(_QWORD *)(v19 + 16) = v20;

  objc_storeStrong((id *)(v19 + 24), a5);
  objc_storeStrong((id *)(v19 + 40), a6);
  objc_storeStrong((id *)(v19 + 72), a7);
  objc_storeStrong((id *)(v19 + 64), a8);
  if (!-[COSEKey _initCBORWithMemberParams](v19))
    v22 = 0;
  else
LABEL_3:
    v22 = (id)v19;

  return v22;
}

- (NSNumber)ecCurveIdentifier
{
  if (self->_type == 2)
    return self->_curveID;
  else
    return (NSNumber *)0;
}

- (NSData)ecCurveX
{
  if (self->_type == 2)
    return self->_paramX;
  else
    return (NSData *)0;
}

- (NSData)ecCurveY
{
  if (self->_type == 2)
    return self->_paramY;
  else
    return (NSData *)0;
}

- (NSData)ecCurveD
{
  if (self->_type == 2)
    return self->_paramD;
  else
    return (NSData *)0;
}

- (NSNumber)okpCurveIdentifier
{
  if (self->_type == 1)
    return self->_curveID;
  else
    return (NSNumber *)0;
}

- (NSData)okpCurveX
{
  if (self->_type == 1)
    return self->_paramX;
  else
    return (NSData *)0;
}

- (NSData)okpCurveD
{
  if (self->_type == 1)
    return self->_paramD;
  else
    return (NSData *)0;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)algorithm
{
  return self->_algorithm;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSArray)operations
{
  return self->_operations;
}

- (NSData)baseInitializationVector
{
  return self->_baseInitializationVector;
}

- (NSData)symmetricKey
{
  return self->_symmetricKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symmetricKey, 0);
  objc_storeStrong((id *)&self->_baseInitializationVector, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_paramD, 0);
  objc_storeStrong((id *)&self->_paramY, 0);
  objc_storeStrong((id *)&self->_paramX, 0);
  objc_storeStrong((id *)&self->_curveID, 0);
  objc_storeStrong((id *)&self->_cborObj, 0);
}

@end
