@implementation SGIdentityName

- (NSString)fullName
{
  NSString *privFullName;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *prefix;
  NSString *middlename;
  NSString *firstname;
  NSString *surname;
  uint64_t v11;
  uint64_t v12;
  NSString *suffix;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  privFullName = self->_privFullName;
  if (!privFullName)
  {
    v4 = (void *)MEMORY[0x1C3BD4F6C](0, a2);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    middlename = self->_middlename;
    prefix = self->_prefix;
    if (!prefix)
      prefix = (NSString *)v5;
    firstname = self->_firstname;
    surname = self->_surname;
    if (!firstname)
      firstname = (NSString *)v5;
    v22[0] = prefix;
    v22[1] = firstname;
    if (middlename)
      v11 = (uint64_t)middlename;
    else
      v11 = v5;
    if (surname)
      v12 = (uint64_t)surname;
    else
      v12 = v5;
    v22[2] = v11;
    v22[3] = v12;
    suffix = self->_suffix;
    if (!suffix)
      suffix = (NSString *)v5;
    v22[4] = suffix;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(":"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (fullName__pasOnceToken5 != -1)
      dispatch_once(&fullName__pasOnceToken5, &__block_literal_global_25272);
    v16 = (void *)fullName__pasExprOnceResult;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __26__SGIdentityName_fullName__block_invoke_2;
    v20[3] = &unk_1E7DB1D20;
    v20[4] = self;
    v21 = v15;
    v17 = v15;
    v18 = v16;
    objc_msgSend(v18, "runWithLockAcquired:", v20);

    objc_autoreleasePoolPop(v4);
    privFullName = self->_privFullName;
  }
  return privFullName;
}

- (SGIdentityName)initWithString:(id)a3
{
  SGIdentityName *v4;
  void *v5;
  void *v6;
  SGIdentityName *v7;

  v4 = self;
  v5 = (void *)MEMORY[0x1C3BD4F6C](self, a2);
  +[SGNames universalCleanName:](SGNames, "universalCleanName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(SGGuessNamingTradition(v6))
  {
    case 0u:
      v7 = -[SGIdentityName initWithKoreanName:](v4, "initWithKoreanName:", v6);
      goto LABEL_8;
    case 1u:
      v7 = -[SGIdentityName initWithChineseName:](v4, "initWithChineseName:", v6);
      goto LABEL_8;
    case 2u:
      v7 = -[SGIdentityName initWithJapaneseName:](v4, "initWithJapaneseName:", v6);
      goto LABEL_8;
    case 3u:
      v7 = -[SGIdentityName initWithVietnameseName:](v4, "initWithVietnameseName:", v6);
      goto LABEL_8;
    case 4u:
    case 5u:
    case 6u:
    case 8u:
      v7 = -[SGIdentityName initWithWesternName:](v4, "initWithWesternName:", v6);
      goto LABEL_8;
    case 7u:
      v7 = -[SGIdentityName initWithSpanishName:](v4, "initWithSpanishName:", v6);
LABEL_8:
      v4 = v7;
      break;
    default:
      break;
  }
  objc_autoreleasePoolPop(v5);

  return v4;
}

- (SGIdentityName)initWithKoreanName:(id)a3
{
  id v5;
  SGIdentityName *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  __objc2_meth_list **p_inst_meths;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  id *v45;
  void *v47;
  void *v48;
  void *v49;
  SGIdentityName *v50;
  id *v51;
  id *location;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD block[4];
  id *v63;
  SEL v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SGIdentityName;
  v6 = -[SGIdentityName init](&v65, sel_init);
  if (v6)
  {
    +[SGNames cjkSpacersToWhiteSpace:](SGNames, "cjkSpacersToWhiteSpace:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SGIdentityName_initWithKoreanName___block_invoke;
    block[3] = &unk_1E7DB6368;
    v8 = v6;
    v63 = v8;
    v64 = a2;
    if (initWithKoreanName__once != -1)
      dispatch_once(&initWithKoreanName__once, block);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v48 = v9;
      v49 = v7;
      v50 = v6;
      v51 = v8;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v47 = v11;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v59;
        v16 = v8 + 2;
        location = v8 + 3;
        p_inst_meths = &OBJC_PROTOCOL___SGExternalEnrichment.inst_meths;
        do
        {
          v18 = 0;
          v53 = v14;
          do
          {
            if (*(_QWORD *)v59 != v15)
              objc_enumerationMutation(v12);
            v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v18);
            if (-[__objc2_meth_list containsObject:](p_inst_meths[506], "containsObject:", v19))
            {
              objc_storeStrong(v16, v19);
              objc_storeStrong(location, v19);
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v20 = v12;
              v21 = v12;
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v55;
                do
                {
                  for (i = 0; i != v23; ++i)
                  {
                    if (*(_QWORD *)v55 != v24)
                      objc_enumerationMutation(v21);
                    v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                    if ((objc_msgSend(v19, "isEqualToString:", v26) & 1) == 0)
                      objc_storeStrong(v16, v26);
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
                }
                while (v23);
              }

              v12 = v20;
              v14 = v53;
              p_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SGExternalEnrichment + 24);
            }
            ++v18;
          }
          while (v18 != v14);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v14);
      }

      v8 = v51;
      if (!objc_msgSend(v51[3], "length"))
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v51[3];
        v51[3] = (id)v27;

        objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v51[2];
        v51[2] = (id)v29;

      }
      v31 = 0;
      v7 = v49;
      v6 = v50;
      v11 = v47;
      v9 = v48;
      goto LABEL_43;
    }
    if ((unint64_t)objc_msgSend(v7, "length") < 2)
    {
      v35 = 0;
    }
    else
    {
      v32 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v7, "substringToIndex:", 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)initWithKoreanName__koreanSurnames, "containsObject:", v31))
      {
        objc_storeStrong(v8 + 3, v31);
        if (objc_msgSend(v7, "length") != 2)
        {
          v33 = v7;
          v34 = 2;
LABEL_41:
          objc_msgSend(v33, "substringFromIndex:", v34);
          v37 = objc_claimAutoreleasedReturnValue();
          v36 = v8[2];
          v8[2] = (id)v37;
          goto LABEL_42;
        }
        goto LABEL_36;
      }
      objc_autoreleasePoolPop(v32);
      v35 = v31;
    }
    if (objc_msgSend(v7, "length"))
    {
      v32 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v7, "substringToIndex:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend((id)initWithKoreanName__koreanSurnames, "containsObject:", v31))
      {
        objc_storeStrong(v8 + 3, v31);
        if (objc_msgSend(v7, "length") != 1)
        {
          v33 = v7;
          v34 = 1;
          goto LABEL_41;
        }
LABEL_36:
        v36 = v8[2];
        v8[2] = 0;
LABEL_42:

        objc_autoreleasePoolPop(v32);
        goto LABEL_43;
      }
      objc_autoreleasePoolPop(v32);
    }
    else
    {
      v31 = v35;
    }
    objc_storeStrong(v8 + 2, v7);
LABEL_43:
    v38 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v8[2], "stringByTrimmingCharactersInSet:", v9);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v8[2];
    v8[2] = (id)v39;

    objc_msgSend(v8[4], "stringByTrimmingCharactersInSet:", v9);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v8[4];
    v8[4] = (id)v41;

    objc_msgSend(v8[3], "stringByTrimmingCharactersInSet:", v9);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = v8[3];
    v8[3] = (id)v43;

    objc_autoreleasePoolPop(v38);
    v45 = v8;

    goto LABEL_44;
  }
  v7 = v5;
LABEL_44:

  return v6;
}

- (SGIdentityName)initWithJapaneseName:(id)a3
{
  id v5;
  SGIdentityName *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *firstname;
  uint64_t v12;
  NSString *surname;
  uint64_t v14;
  NSString *privFullName;
  SGIdentityName *v16;
  uint64_t v17;
  SGIdentityName *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  SGIdentityName *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSString *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  void *v36;
  NSRange v37;
  NSUInteger length;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSUInteger v48;
  NSUInteger v49;
  NSUInteger v50;
  void *v51;
  NSUInteger v52;
  NSRange v53;
  uint64_t v54;
  NSString *v55;
  uint64_t v56;
  NSString *v57;
  NSUInteger v58;
  NSUInteger v59;
  NSUInteger v60;
  NSUInteger v61;
  NSRange v62;
  uint64_t v63;
  uint64_t v64;
  NSString *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSString *v69;
  SGIdentityName *v70;
  uint64_t v72;
  void *context;
  void *v74;
  _QWORD v75[4];
  id v76;
  uint8_t *v77;
  uint8_t buf[8];
  uint8_t *v79;
  uint64_t v80;
  char v81;
  _QWORD block[4];
  SGIdentityName *v83;
  SEL v84;
  objc_super v85;
  NSRange v86;
  NSRange v87;
  NSRange v88;
  NSRange v89;
  NSRange v90;
  NSRange v91;

  v5 = a3;
  v85.receiver = self;
  v85.super_class = (Class)SGIdentityName;
  v6 = -[SGIdentityName init](&v85, sel_init);
  if (v6)
  {
    +[SGNames cjkSpacersToWhiteSpace:](SGNames, "cjkSpacersToWhiteSpace:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _PASCollapseWhitespaceAndStrip();
    v5 = (id)objc_claimAutoreleasedReturnValue();

    tokenizeNameAfterWhitespaceNormalization(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 2)
    {
      v9 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v10 = objc_claimAutoreleasedReturnValue();
      firstname = v6->_firstname;
      v6->_firstname = (NSString *)v10;

      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v12 = objc_claimAutoreleasedReturnValue();
      surname = v6->_surname;
      v6->_surname = (NSString *)v12;

      -[NSString stringByAppendingString:](v6->_surname, "stringByAppendingString:", v6->_firstname);
      v14 = objc_claimAutoreleasedReturnValue();
      privFullName = v6->_privFullName;
      v6->_privFullName = (NSString *)v14;

      v16 = v6;
      objc_autoreleasePoolPop(v9);
LABEL_50:

      goto LABEL_51;
    }
    if ((unint64_t)objc_msgSend(v8, "count") >= 3)
    {
      objc_storeStrong((id *)&v6->_surname, v5);
LABEL_14:
      v24 = v6;
      goto LABEL_50;
    }
    if (!objc_msgSend(v8, "count"))
    {
      sgLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "Tried to parse a Japanese name with no tokens? This shouldn't happen.", buf, 2u);
      }

      goto LABEL_14;
    }
    v17 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke;
    block[3] = &unk_1E7DB6368;
    v84 = a2;
    v18 = v6;
    v83 = v18;
    if (initWithJapaneseName__onceToken != -1)
      dispatch_once(&initWithJapaneseName__onceToken, block);
    pthread_mutex_lock(&initWithJapaneseName__updateLock);
    v19 = (void *)objc_opt_new();
    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3840]), "initWithDominantScript:languageMap:", CFSTR("Jpan"), &unk_1E7E11608);
    *(_QWORD *)buf = 0;
    v79 = buf;
    v80 = 0x2020000000;
    v81 = 0;
    v20 = objc_msgSend(v5, "length");
    v21 = *MEMORY[0x1E0CB2CF8];
    v75[0] = v17;
    v75[1] = 3221225472;
    v75[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke_3;
    v75[3] = &unk_1E7DB14A0;
    v22 = v19;
    v76 = v22;
    v77 = buf;
    objc_msgSend(v5, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v20, v21, 6, v74, v75);
    if (v79[24] || !objc_msgSend(v22, "count"))
    {
      objc_storeStrong((id *)&v18->_surname, v5);
LABEL_46:
      if (-[NSString length](v18->_surname, "length") && -[NSString length](v18->_firstname, "length"))
      {
        v67 = (void *)MEMORY[0x1C3BD4F6C]();
        -[NSString stringByAppendingString:](v18->_surname, "stringByAppendingString:", v18->_firstname);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v18->_privFullName;
        v18->_privFullName = (NSString *)v68;

        objc_autoreleasePoolPop(v67);
      }
      pthread_mutex_unlock(&initWithJapaneseName__updateLock);
      v70 = v18;

      _Block_object_dispose(buf, 8);
      goto LABEL_50;
    }
    if (objc_msgSend(v22, "count") == 1)
    {
      context = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "rangeValue");
      objc_msgSend(v5, "substringWithRange:", v26, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v18->_surname;
      v18->_surname = (NSString *)v28;

      goto LABEL_44;
    }
    v30 = objc_msgSend(v22, "count");
    if ((unint64_t)(v30 - 1) >= 5)
      v31 = 5;
    else
      v31 = v30 - 1;
    while (1)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "rangeValue");
      v35 = v34;

      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v86.location = objc_msgSend(v36, "rangeValue");
      v89.location = v33;
      v89.length = v35;
      v37 = NSUnionRange(v86, v89);
      length = v37.length;

      if (objc_msgSend((id)initWithJapaneseName__trie, "payloadForString:range:", v5, v37.location, v37.length))break;
      if ((uint64_t)v31-- <= 0)
        goto LABEL_30;
    }
    if (v37.location == 0x7FFFFFFFFFFFFFFFLL || v37.length != 1)
    {
      if (v37.location != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_35;
    }
    else if ((unint64_t)objc_msgSend(v22, "count") <= 2)
    {
      length = 1;
LABEL_35:
      context = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "substringWithRange:", v37.location, length);
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v18->_surname;
      v18->_surname = (NSString *)v56;

      if (v31 >= objc_msgSend(v22, "count") - 1)
        goto LABEL_45;
      objc_msgSend(v22, "objectAtIndexedSubscript:", v31 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v25, "rangeValue");
      v60 = v59;
      objc_msgSend(v22, "lastObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v91.location = objc_msgSend(v51, "rangeValue");
      v91.length = v61;
      v88.location = v58;
      v88.length = v60;
      v62 = NSUnionRange(v88, v91);
      objc_msgSend(v5, "substringWithRange:", v62.location, v62.length);
      v63 = objc_claimAutoreleasedReturnValue();
      v55 = v18->_firstname;
      v18->_firstname = (NSString *)v63;
      goto LABEL_37;
    }
LABEL_30:
    context = (void *)MEMORY[0x1C3BD4F6C]();
    if (objc_msgSend(v22, "count") != 2)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v25, "rangeValue");
      v50 = v49;
      objc_msgSend(v22, "lastObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v90.location = objc_msgSend(v51, "rangeValue");
      v90.length = v52;
      v87.location = v48;
      v87.length = v50;
      v53 = NSUnionRange(v87, v90);
      objc_msgSend(v5, "substringWithRange:", v53.location, v53.length);
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = v18->_surname;
      v18->_surname = (NSString *)v54;
LABEL_37:

      goto LABEL_44;
    }
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "rangeValue");
    v43 = v42;

    objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "rangeValue");
    v72 = v46;
    v47 = v45;

    if (v43 == 3)
    {
      if (v41 + 3 != v47)
      {
        v43 = 3;
LABEL_43:
        objc_msgSend(v5, "substringWithRange:", v41, v43);
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = v18->_surname;
        v18->_surname = (NSString *)v64;

        objc_msgSend(v5, "substringWithRange:", v47, v72);
        v66 = objc_claimAutoreleasedReturnValue();
        v25 = v18->_firstname;
        v18->_firstname = (NSString *)v66;
LABEL_44:

LABEL_45:
        objc_autoreleasePoolPop(context);
        goto LABEL_46;
      }
    }
    else if (v43 != 2 || v72 != 1 || v41 + 2 != v47)
    {
      goto LABEL_43;
    }
    if (objc_msgSend((id)initWithJapaneseName__trie, "payloadForString:range:", v5, v41, v43 - 1))
    {
      --v47;
      ++v72;
      --v43;
    }
    goto LABEL_43;
  }
LABEL_51:

  return v6;
}

- (SGIdentityName)initWithChineseName:(id)a3
{
  id v4;
  SGIdentityName *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *firstname;
  uint64_t v10;
  NSString *surname;
  SGIdentityName *v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  NSString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  uint8_t v37[16];
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SGIdentityName;
  v5 = -[SGIdentityName init](&v38, sel_init);
  if (v5)
  {
    +[SGNames cjkSpacersToWhiteSpace:](SGNames, "cjkSpacersToWhiteSpace:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    _PASCollapseWhitespaceAndStrip();
    v4 = (id)objc_claimAutoreleasedReturnValue();

    tokenizeNameAfterWhitespaceNormalization(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2 || (unint64_t)objc_msgSend(v7, "count") >= 3)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v8 = objc_claimAutoreleasedReturnValue();
      firstname = v5->_firstname;
      v5->_firstname = (NSString *)v8;

      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      surname = v5->_surname;
      v5->_surname = (NSString *)v10;

    }
    else if (objc_msgSend(v7, "count"))
    {
      if (initWithChineseName__onceToken != -1)
        dispatch_once(&initWithChineseName__onceToken, &__block_literal_global_62_25228);
      v14 = (void *)MEMORY[0x1C3BD4F6C]();
      switch(objc_msgSend(v4, "length"))
      {
        case 2:
          v15 = (void *)initWithChineseName__oneCharChineseSurnames;
          objc_msgSend(v4, "substringToIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = fixedWidthStringSetContains(v15, 1, v16);

          if (!(_DWORD)v15)
            goto LABEL_16;
          objc_msgSend(v4, "substringToIndex:", 1);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v5->_surname;
          v5->_surname = (NSString *)v17;

          objc_msgSend(v4, "substringFromIndex:", 1);
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        case 3:
          objc_msgSend(v4, "substringToIndex:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)initWithChineseName__twoCharChineseSurnames;
          _PASSimpleICUTransform();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v22) = fixedWidthStringSetContains(v22, 2, v23);

          if ((_DWORD)v22)
            goto LABEL_22;
          v24 = (void *)initWithChineseName__oneCharChineseSurnames;
          objc_msgSend(v4, "substringToIndex:", 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          _PASSimpleICUTransform();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v24) = fixedWidthStringSetContains(v24, 1, v26);

          if (!(_DWORD)v24)
            goto LABEL_24;
          objc_msgSend(v4, "substringToIndex:", 1);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v5->_surname;
          v5->_surname = (NSString *)v27;

          v29 = v4;
          v30 = 1;
          goto LABEL_23;
        case 4:
          objc_msgSend(v4, "substringToIndex:", 2);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)initWithChineseName__twoCharChineseSurnames;
          _PASSimpleICUTransform();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v31) = fixedWidthStringSetContains(v31, 2, v32);

          if ((_DWORD)v31)
          {
LABEL_22:
            objc_msgSend(v4, "substringToIndex:", 2);
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = v5->_surname;
            v5->_surname = (NSString *)v33;

            v29 = v4;
            v30 = 2;
LABEL_23:
            objc_msgSend(v29, "substringFromIndex:", v30);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v5->_firstname;
            v5->_firstname = (NSString *)v35;

          }
          else
          {
LABEL_24:
            objc_storeStrong((id *)&v5->_firstname, v4);
          }
LABEL_25:

          objc_autoreleasePoolPop(v14);
          break;
        default:
LABEL_16:
          v19 = (NSString *)v4;
LABEL_17:
          v21 = v5->_firstname;
          v5->_firstname = v19;
          goto LABEL_25;
      }
    }
    else
    {
      sgLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEFAULT, "Tried to parse a jp/zh name with no tokens? This shouldn't happen.", v37, 2u);
      }

    }
    v12 = v5;

  }
  return v5;
}

- (SGIdentityName)initWithVietnameseName:(id)a3
{
  id v4;
  SGIdentityName *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  void *v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  NSString *v33;
  uint64_t v34;
  NSString *v35;
  SGIdentityName *v36;
  void *v38;
  uint64_t v39;
  NSString *surname;
  uint64_t v41;
  NSString *middlename;
  void *v43;
  uint64_t v44;
  NSString *firstname;
  objc_super v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SGIdentityName;
  v5 = -[SGIdentityName init](&v46, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v6);
    if (objc_msgSend(v7, "count") == 2)
    {
      v8 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v47[0] = v13;
      v47[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(" "));
      v15 = objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v8);
      v4 = (id)v15;
    }
    +[SGNames cleanName:](SGNames, "cleanName:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGNames stripAndReturnHonorifics:](SGNames, "stripAndReturnHonorifics:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      objc_storeStrong((id *)&v5->_prefix, v18);
    if (objc_msgSend(v19, "length"))
      objc_storeStrong((id *)&v5->_suffix, v19);
    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGNames handleLastNameFirstOrder:](SGNames, "handleLastNameFirstOrder:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    tokenizeNameAfterWhitespaceNormalization(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "count") == 1)
    {
      v23 = v22;
      v24 = 0;
    }
    else
    {
      if (objc_msgSend(v22, "count") != 2)
      {
        if ((unint64_t)objc_msgSend(v22, "count") >= 3)
        {
          v38 = (void *)MEMORY[0x1C3BD4F6C]();
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v39 = objc_claimAutoreleasedReturnValue();
          surname = v5->_surname;
          v5->_surname = (NSString *)v39;

          objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
          v41 = objc_claimAutoreleasedReturnValue();
          middlename = v5->_middlename;
          v5->_middlename = (NSString *)v41;

          objc_msgSend(v22, "subarrayWithRange:", 2, objc_msgSend(v22, "count") - 2);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "_pas_componentsJoinedByString:", CFSTR(" "));
          v44 = objc_claimAutoreleasedReturnValue();
          firstname = v5->_firstname;
          v5->_firstname = (NSString *)v44;

          objc_autoreleasePoolPop(v38);
        }
        goto LABEL_13;
      }
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v5->_surname;
      v5->_surname = (NSString *)v25;

      v23 = v22;
      v24 = 1;
    }
    objc_msgSend(v23, "objectAtIndexedSubscript:", v24);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v5->_firstname;
    v5->_firstname = (NSString *)v27;

LABEL_13:
    v29 = (void *)MEMORY[0x1C3BD4F6C]();
    -[NSString capitalizedString](v5->_firstname, "capitalizedString");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v5->_firstname;
    v5->_firstname = (NSString *)v30;

    -[NSString capitalizedString](v5->_middlename, "capitalizedString");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v5->_middlename;
    v5->_middlename = (NSString *)v32;

    -[NSString capitalizedString](v5->_surname, "capitalizedString");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v5->_surname;
    v5->_surname = (NSString *)v34;

    objc_autoreleasePoolPop(v29);
    v36 = v5;

  }
  return v5;
}

- (SGIdentityName)initWithSpanishName:(id)a3
{
  id v4;
  SGIdentityName *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  NSString *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSString *firstname;
  NSString *middlename;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSString *v49;
  NSString *v50;
  void *v51;
  uint64_t v52;
  NSString *surname;
  int v54;
  int v55;
  void *v56;
  uint64_t v57;
  NSString *v58;
  void *v59;
  uint64_t v60;
  NSString *v61;
  SGIdentityName *v62;
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SGIdentityName;
  v5 = -[SGIdentityName init](&v64, sel_init);
  if (!v5)
  {
    v8 = v4;
    goto LABEL_39;
  }
  +[SGIdentityName patterns](SGIdentityName, "patterns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regex2ForKey:", CFSTR("CommonSpanishSurnamePrefix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGNames cleanName:](SGNames, "cleanName:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGNames stripAndReturnHonorifics:](SGNames, "stripAndReturnHonorifics:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_storeStrong((id *)&v5->_prefix, v10);
  if (objc_msgSend(v11, "length"))
    objc_storeStrong((id *)&v5->_suffix, v11);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGNames handleLastNameFirstOrder:](SGNames, "handleLastNameFirstOrder:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  tokenizeNameAfterWhitespaceNormalization(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[SGIdentityName patterns](SGIdentityName, "patterns");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "regex2ForKey:", CFSTR("CompositeSpanishFirstname"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "matchesString:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v14, "count") > 2 || v17 || objc_msgSend(v10, "length"))
  {
    if ((unint64_t)objc_msgSend(v14, "count") > 2 || v17)
    {
      if (!v17)
      {
        v37 = objc_msgSend(v14, "count");
        v18 = (void *)MEMORY[0x1C3BD4F6C]();
        if (v37 == 4)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "matchesString:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            v40 = 1;
          else
            v40 = 2;
          objc_msgSend(v14, "subarrayWithRange:", 0, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "_pas_componentsJoinedByString:", CFSTR(" "));
          v42 = objc_claimAutoreleasedReturnValue();
          firstname = v5->_firstname;
          v5->_firstname = (NSString *)v42;

          middlename = v5->_middlename;
          v5->_middlename = 0;

          v45 = objc_msgSend(v14, "count") - v40;
          v46 = v14;
          v47 = v40;
        }
        else
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
          v48 = objc_claimAutoreleasedReturnValue();
          v49 = v5->_firstname;
          v5->_firstname = (NSString *)v48;

          v50 = v5->_middlename;
          v5->_middlename = 0;

          v45 = objc_msgSend(v14, "count") - 1;
          v46 = v14;
          v47 = 1;
        }
        objc_msgSend(v46, "subarrayWithRange:", v47, v45);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "_pas_componentsJoinedByString:", CFSTR(" "));
        v52 = objc_claimAutoreleasedReturnValue();
        surname = v5->_surname;
        v5->_surname = (NSString *)v52;

        goto LABEL_25;
      }
      v18 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v14, "subarrayWithRange:", 0, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_pas_componentsJoinedByString:", CFSTR(" "));
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v5->_firstname;
      v5->_firstname = (NSString *)v24;

      v26 = v5->_middlename;
      v5->_middlename = 0;

      objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_pas_componentsJoinedByString:", CFSTR(" "));
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v5->_surname;
      v5->_surname = (NSString *)v28;

      if (!-[NSString isEqualToString:](v5->_surname, "isEqualToString:", &stru_1E7DB83A8))
      {
LABEL_25:
        objc_autoreleasePoolPop(v18);
        goto LABEL_26;
      }
      v22 = v5->_surname;
      v5->_surname = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1C3BD4F6C]();
      v19 = v5->_middlename;
      v5->_middlename = 0;

      v20 = v5->_firstname;
      v5->_firstname = 0;

      objc_msgSend(v14, "_pas_componentsJoinedByString:", CFSTR(" "));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v5->_surname;
      v5->_surname = (NSString *)v21;
    }

    goto LABEL_25;
  }
  -[SGIdentityName segmentWesternNameWithNameParts:andPrefix:](v5, "segmentWesternNameWithNameParts:andPrefix:", v14, v5->_prefix);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("firstname"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v5->_firstname;
  v5->_firstname = (NSString *)v31;

  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("middlename"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v5->_middlename;
  v5->_middlename = (NSString *)v33;

  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("surname"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v5->_surname;
  v5->_surname = (NSString *)v35;

LABEL_26:
  if (-[NSString length](v5->_firstname, "length") && (unint64_t)letterLength(v5->_firstname) >= 3)
    v54 = _PASIsAllUppercase();
  else
    v54 = 0;
  if (-[NSString length](v5->_surname, "length") && (unint64_t)letterLength(v5->_surname) >= 3)
  {
    v55 = _PASIsAllUppercase();
    if (!v54)
      goto LABEL_36;
    goto LABEL_35;
  }
  v55 = 0;
  if (v54)
  {
LABEL_35:
    v56 = (void *)MEMORY[0x1C3BD4F6C]();
    -[NSString capitalizedString](v5->_firstname, "capitalizedString");
    v57 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v56);
    v58 = v5->_firstname;
    v5->_firstname = (NSString *)v57;

  }
LABEL_36:
  if (v55)
  {
    v59 = (void *)MEMORY[0x1C3BD4F6C]();
    -[NSString capitalizedString](v5->_surname, "capitalizedString");
    v60 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v59);
    v61 = v5->_surname;
    v5->_surname = (NSString *)v60;

  }
  v62 = v5;

LABEL_39:
  return v5;
}

- (id)segmentWesternNameWithNameParts:(id)a3 andPrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  BOOL v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  id v53;
  __CFString *v54;
  void *v55;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v59;
  int64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  CFIndex v64;
  UniChar v65;
  int IsCharacterMember;
  int64_t v67;
  uint64_t v69;
  uint64_t v70;
  int64_t v71;
  CFIndex v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *context;
  uint64_t v93;
  __CFString *v94;
  uint64_t v95;
  id v96;
  const __CFCharacterSet *Predefined;
  void *v98;
  const __CFCharacterSet *theSet;
  UniChar buffer[8];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  CFStringRef theString;
  const UniChar *v109;
  const char *v110;
  uint64_t v111;
  CFIndex v112;
  int64_t v113;
  int64_t v114;
  CFRange v115;

  v5 = a3;
  v6 = a4;
  +[SGIdentityName patterns](SGIdentityName, "patterns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regex2ForKey:", CFSTR("SurnamePrefix"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "count");
  v10 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count") == 1)
  {
    v11 = objc_msgSend(v6, "length");
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v13 = CFSTR("firstname");
LABEL_24:
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v13);

      goto LABEL_25;
    }
LABEL_23:
    v13 = CFSTR("surname");
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "count") == 2)
  {
    v14 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v14);
    objc_msgSend(v8, "existsInString:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = objc_msgSend(v6, "length");

      if (v19)
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ %@"), v21, v22);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("surname"));

        goto LABEL_25;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = +[SGNames shouldInvertOrderOfFirst:last:](SGNames, "shouldInvertOrderOfFirst:last:", v40, v41);

    if (v42)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v43, CFSTR("firstname"));

      v44 = v5;
      v45 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v46, CFSTR("firstname"));

      v44 = v5;
      v45 = 1;
    }
    objc_msgSend(v44, "objectAtIndexedSubscript:", v45);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 3)
    goto LABEL_25;
  v96 = v6;
  v24 = v9 - 1;
  v95 = MEMORY[0x1C3BD4F6C]();
  v98 = v10;
  if (v9 != 1)
  {
    v25 = 1;
    v26 = 1;
    do
    {
      v27 = v25 - 1;
      v28 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v25 - 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lowercaseString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v28);
      objc_msgSend(v8, "existsInString:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        v32 = v25 - 1;
        v10 = v98;
        if (v27)
          goto LABEL_14;
        goto LABEL_27;
      }
      v26 = v24 > v25++;
    }
    while (v9 != v25);
    v10 = v98;
    v32 = v9 - 1;
    if ((_DWORD)v9 != 1)
    {
LABEL_14:
      v33 = (void *)MEMORY[0x1C3BD4F6C]();
      v34 = (v32 + 1);
      objc_msgSend(v5, "subarrayWithRange:", 0, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_pas_componentsJoinedByString:", CFSTR(" "));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v36, CFSTR("surname"));

      if (v26)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", (v32 + 1));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v37, CFSTR("firstname"));

      }
      if (v24 > v34)
      {
        objc_msgSend(v5, "subarrayWithRange:", (v32 + 2), v24 - v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "_pas_componentsJoinedByString:", CFSTR(" "));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v39, CFSTR("middlename"));

      }
      goto LABEL_76;
    }
  }
LABEL_27:
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v48, CFSTR("firstname"));

  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isCapitalized(v49) & 1) == 0)
  {

    goto LABEL_67;
  }
  objc_msgSend(v5, "objectAtIndexedSubscript:", v9 - 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = isCapitalized(v50);

  if (!v51)
    goto LABEL_67;
  context = (void *)MEMORY[0x1C3BD4F6C]();
  if (v24 < 2)
  {
LABEL_65:
    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "_pas_componentsJoinedByString:", CFSTR(" "));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v74, CFSTR("surname"));

    v75 = context;
    goto LABEL_77;
  }
  v52 = 1;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v52);
    v53 = (id)objc_claimAutoreleasedReturnValue();
    theSet = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
    v54 = (__CFString *)v53;
    objc_opt_self();
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v55)
      goto LABEL_80;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    *(_OWORD *)buffer = 0u;
    v101 = 0u;
    Length = CFStringGetLength(v54);
    theString = v54;
    v111 = 0;
    v112 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v54);
    CStringPtr = 0;
    v109 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v54, 0x600u);
    v110 = CStringPtr;
    v113 = 0;
    v114 = 0;
    v93 = v52;
    v94 = v54;
    if (Length >= 1)
      break;
    v61 = 0;
LABEL_63:

    v10 = v98;
    if ((v61 & 1) == 0)
      goto LABEL_81;
    v52 = v93 + 1;
    if (v93 + 1 == v24)
      goto LABEL_65;
  }
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v62 = 64;
  while (1)
  {
    if ((unint64_t)v60 >= 4)
      v63 = 4;
    else
      v63 = v60;
    v64 = v112;
    if (v112 <= v60)
    {
      v65 = 0;
    }
    else if (v109)
    {
      v65 = v109[v60 + v111];
    }
    else if (v110)
    {
      v65 = v110[v111 + v60];
    }
    else
    {
      v67 = v113;
      if (v114 <= v60 || v113 > v60)
      {
        v69 = v63 + v59;
        v70 = v62 - v63;
        v71 = v60 - v63;
        v72 = v71 + 64;
        if (v71 + 64 >= v112)
          v72 = v112;
        v113 = v71;
        v114 = v72;
        if (v112 >= v70)
          v64 = v70;
        v115.length = v64 + v69;
        v115.location = v71 + v111;
        CFStringGetCharacters(theString, v115, buffer);
        v67 = v113;
      }
      v65 = buffer[v60 - v67];
    }
    IsCharacterMember = CFCharacterSetIsCharacterMember(theSet, v65);
    if (!IsCharacterMember && (v61 & 1) == 0)
    {
      if (CFCharacterSetIsCharacterMember(Predefined, v65))
        v61 = 1;
      goto LABEL_48;
    }
    if (IsCharacterMember)
      break;
LABEL_48:
    ++v60;
    --v59;
    ++v62;
    if (Length == v60)
      goto LABEL_63;
  }
  v54 = v94;
LABEL_80:

LABEL_81:
  objc_autoreleasePoolPop(context);
LABEL_67:
  if (v24 < 2)
  {
LABEL_71:
    objc_msgSend(v5, "objectAtIndexedSubscript:", v9 - 1);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v98;
    objc_msgSend(v98, "setObject:forKeyedSubscript:", v82, CFSTR("surname"));

    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 2);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "_pas_componentsJoinedByString:", CFSTR(" "));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setObject:forKeyedSubscript:", v84, CFSTR("middlename"));

    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("middlename"));
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v84) = objc_msgSend(v85, "isEqualToString:", &stru_1E7DB83A8);

    v86 = (void *)v95;
    v6 = v96;
    if ((_DWORD)v84)
      objc_msgSend(v98, "removeObjectForKey:", CFSTR("middlename"));
  }
  else
  {
    v76 = 2;
    while (1)
    {
      v77 = v76 - 1;
      v33 = (void *)MEMORY[0x1C3BD4F6C]();
      v78 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v76 - 1);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "lowercaseString");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v78);
      objc_msgSend(v8, "existsInString:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      if (v81)
        break;
      objc_autoreleasePoolPop(v33);
      if (v9 == ++v76)
        goto LABEL_71;
    }
    objc_msgSend(v5, "subarrayWithRange:", v76 - 1, objc_msgSend(v5, "count") - v77);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "_pas_componentsJoinedByString:", CFSTR(" "));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v98;
    objc_msgSend(v98, "setObject:forKeyedSubscript:", v88, CFSTR("surname"));

    if ((v77 & 0xFFFFFFFE) != 0)
    {
      objc_msgSend(v5, "subarrayWithRange:", 1, (v77 - 1));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "_pas_componentsJoinedByString:", CFSTR(" "));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "setObject:forKeyedSubscript:", v90, CFSTR("middlename"));

      objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("middlename"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v90) = objc_msgSend(v91, "isEqualToString:", &stru_1E7DB83A8);

      if ((_DWORD)v90)
        objc_msgSend(v98, "removeObjectForKey:", CFSTR("middlename"));
    }
LABEL_76:
    v75 = v33;
LABEL_77:
    objc_autoreleasePoolPop(v75);
    v86 = (void *)v95;
    v6 = v96;
  }
  objc_autoreleasePoolPop(v86);
LABEL_25:

  return v10;
}

- (SGIdentityName)initWithWesternName:(id)a3
{
  id v4;
  SGIdentityName *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *firstname;
  uint64_t v18;
  NSString *middlename;
  uint64_t v20;
  NSString *surname;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  SGIdentityName *v39;
  NSString *v41;
  NSString *v42;
  void *v43;
  void *context;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SGIdentityName;
  v5 = -[SGIdentityName init](&v45, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1C3BD4F6C]();
    +[SGNames cleanName:](SGNames, "cleanName:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v7;
    +[SGNames stripAndReturnHonorifics:](SGNames, "stripAndReturnHonorifics:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      objc_storeStrong((id *)&v5->_prefix, v9);
    if (objc_msgSend(v10, "length"))
      objc_storeStrong((id *)&v5->_suffix, v10);
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGNames handleLastNameFirstOrder:](SGNames, "handleLastNameFirstOrder:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    tokenizeNameAfterWhitespaceNormalization(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sgFilter();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[SGIdentityName segmentWesternNameWithNameParts:andPrefix:](v5, "segmentWesternNameWithNameParts:andPrefix:", v14, v5->_prefix);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("firstname"));
    v16 = objc_claimAutoreleasedReturnValue();
    firstname = v5->_firstname;
    v5->_firstname = (NSString *)v16;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("middlename"));
    v18 = objc_claimAutoreleasedReturnValue();
    middlename = v5->_middlename;
    v5->_middlename = (NSString *)v18;

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("surname"));
    v20 = objc_claimAutoreleasedReturnValue();
    surname = v5->_surname;
    v5->_surname = (NSString *)v20;

    context = (void *)v6;
    if (-[NSString length](v5->_firstname, "length") && (unint64_t)letterLength(v5->_firstname) >= 3)
      v22 = _PASIsAllUppercase();
    else
      v22 = 0;
    if (-[NSString length](v5->_middlename, "length") && (unint64_t)letterLength(v5->_middlename) >= 3)
      v23 = _PASIsAllUppercase();
    else
      v23 = 0;
    if (-[NSString length](v5->_surname, "length") && (unint64_t)letterLength(v5->_surname) >= 3)
    {
      v24 = _PASIsAllUppercase();
      if (!v22)
      {
LABEL_20:
        if (v23)
        {
          -[NSString capitalizedString](v5->_middlename, "capitalizedString");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v5->_middlename;
          v5->_middlename = (NSString *)v29;

          if (v24)
            goto LABEL_22;
        }
        else if (v24)
        {
LABEL_22:
          -[NSString capitalizedString](v5->_surname, "capitalizedString");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v5->_surname;
          v5->_surname = (NSString *)v27;
          goto LABEL_30;
        }
        if (!v22 || !-[NSString length](v5->_surname, "length"))
          goto LABEL_31;
        v42 = v5->_firstname;
        if (-[NSString length](v5->_middlename, "length"))
        {
          v31 = v5->_middlename;
          v32 = v5->_surname;
          v33 = v32;
        }
        else
        {
          v33 = 0;
          v32 = v5->_surname;
          v31 = v32;
        }
        v34 = v32;
        v35 = v5->_firstname;
        v5->_firstname = v31;
        v41 = v31;

        v36 = v5->_middlename;
        v5->_middlename = v33;
        v37 = v33;

        v38 = v5->_surname;
        v5->_surname = v42;
        v28 = v42;

LABEL_30:
LABEL_31:
        v39 = v5;

        objc_autoreleasePoolPop(context);
        v4 = v43;
        goto LABEL_32;
      }
    }
    else
    {
      v24 = 0;
      if (!v22)
        goto LABEL_20;
    }
    -[NSString capitalizedString](v5->_firstname, "capitalizedString");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v5->_firstname;
    v5->_firstname = (NSString *)v25;

    goto LABEL_20;
  }
LABEL_32:

  return v5;
}

- (id)toSGNameWithOrigin:(id)a3 recordId:(id)a4 extractionInfo:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = (objc_class *)MEMORY[0x1E0D198C0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  -[SGIdentityName firstname](self, "firstname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIdentityName middlename](self, "middlename");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIdentityName surname](self, "surname");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIdentityName fullName](self, "fullName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIdentityName prefix](self, "prefix");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGIdentityName suffix](self, "suffix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v12, "initWithFirstName:middleName:lastName:fullName:prefix:suffix:recordId:origin:extractionInfo:", v13, v14, v15, v16, v17, v18, v10, v11, v9);

  return v19;
}

- (NSString)firstname
{
  return self->_firstname;
}

- (NSString)surname
{
  return self->_surname;
}

- (NSString)middlename
{
  return self->_middlename;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_middlename, 0);
  objc_storeStrong((id *)&self->_surname, 0);
  objc_storeStrong((id *)&self->_firstname, 0);
  objc_storeStrong((id *)&self->_privFullName, 0);
}

uint64_t __38__SGIdentityName_initWithWesternName___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  uint64_t v3;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  UniChar v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  _OWORD v20[8];
  CFStringRef theString;
  const UniChar *v22;
  const char *v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  CFRange v28;

  v2 = a2;
  objc_opt_self();
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    memset(v20, 0, sizeof(v20));
    Length = CFStringGetLength(v2);
    theString = v2;
    v24 = 0;
    v25 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v2);
    CStringPtr = 0;
    v22 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
    v26 = 0;
    v27 = 0;
    v23 = CStringPtr;
    if (Length < 1)
    {
LABEL_26:
      v3 = 0;
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 64;
      while (1)
      {
        v11 = (unint64_t)v9 >= 4 ? 4 : v9;
        v12 = v25;
        if (v25 <= v9)
          break;
        if (v22)
        {
          v13 = v22[v9 + v24];
        }
        else if (v23)
        {
          v13 = v23[v24 + v9];
        }
        else
        {
          if (v27 <= v9 || v8 > v9)
          {
            v15 = v11 + v7;
            v16 = v10 - v11;
            v17 = v9 - v11;
            v18 = v17 + 64;
            if (v17 + 64 >= v25)
              v18 = v25;
            v26 = v17;
            v27 = v18;
            if (v25 >= v16)
              v12 = v16;
            v28.length = v12 + v15;
            v28.location = v17 + v24;
            CFStringGetCharacters(theString, v28, (UniChar *)v20);
            v8 = v26;
          }
          v13 = *((_WORD *)v20 + v9 - v8);
        }
        if (v13 != 46)
          break;
        ++v9;
        --v7;
        ++v10;
        if (Length == v9)
          goto LABEL_26;
      }
      v3 = 1;
    }
  }

  return v3;
}

void __38__SGIdentityName_initWithChineseName___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[SGIdentityName patterns](SGIdentityName, "patterns");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawValueOrDataForKey:", CFSTR("SingleCharChineseSurname"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithChineseName__oneCharChineseSurnames;
  initWithChineseName__oneCharChineseSurnames = v0;

  objc_msgSend(v4, "rawValueOrDataForKey:", CFSTR("MultiCharChineseSurname"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithChineseName__twoCharChineseSurnames;
  initWithChineseName__twoCharChineseSurnames = v2;

}

void __39__SGIdentityName_initWithJapaneseName___block_invoke(uint64_t a1)
{
  id v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke_2;
  v7[3] = &unk_1E7DB1478;
  v6 = *(_OWORD *)(a1 + 32);
  v1 = (id)v6;
  v8 = v6;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3BD5158](v7);
  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "registerUpdateHandler:", v2);

  +[SGAsset asset](SGAsset, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v5);

}

void __39__SGIdentityName_initWithJapaneseName___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("ja")))
  {
    v11 = (void *)MEMORY[0x1C3BD4F6C]();
    v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }

}

void __39__SGIdentityName_initWithJapaneseName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  pthread_mutex_lock(&initWithJapaneseName__updateLock);
  objc_msgSend(v3, "filesystemPathForAssetDataRelativePath:", CFSTR("ja_surname.trie"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGIdentityName.m"), 311, CFSTR("failed to get asset path for ja_surname.trie"));

  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v9);
  v5 = (void *)initWithJapaneseName__trie;
  initWithJapaneseName__trie = v4;

  if (!initWithJapaneseName__trie)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SGIdentityName initWithJapaneseName:]_block_invoke_2");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("SGIdentityName.m"), 313, CFSTR("Could not load ja_surname trie"));

  }
  pthread_mutex_unlock(&initWithJapaneseName__updateLock);

}

void __37__SGIdentityName_initWithKoreanName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("koreansurnames"), CFSTR("txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGIdentityName.m"), 213, CFSTR("Could not generate file path from koreansurnames.txt"));

  }
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v4, 4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGIdentityName.m"), 213, CFSTR("Could not load list of korean surnames from koreansurnames.txt"));

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SGIdentityName.m"), 213, CFSTR("Could not load components separated by new line."));

  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v8);
  v10 = (void *)initWithKoreanName__koreanSurnames;
  initWithKoreanName__koreanSurnames = v9;

  objc_autoreleasePoolPop(v2);
}

void __26__SGIdentityName_fullName__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  v6 = v17;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setNamePrefix:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v7, "setGivenName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v7, "setMiddleName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v7, "setFamilyName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(v7, "setNameSuffix:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v7, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v9;

    v12 = *(_QWORD *)(a1 + 32);
    v15 = *(__CFString **)(v12 + 8);
    v13 = (id *)(v12 + 8);
    v14 = v15;
    if (v15)
      v16 = v14;
    else
      v16 = &stru_1E7DB83A8;
    objc_storeStrong(v13, v16);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "length") <= 0x400)
    {
      if ((unint64_t)objc_msgSend(v17, "count") >= 0x32)
        objc_msgSend(v17, "removeAllObjects");
      objc_msgSend(v17, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
    }

    v6 = v17;
  }

}

void __26__SGIdentityName_fullName__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 50);
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)fullName__pasExprOnceResult;
  fullName__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

+ (id)patterns
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SGIdentityName_patterns__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (patterns__pasOnceToken3 != -1)
    dispatch_once(&patterns__pasOnceToken3, block);
  return (id)patterns__pasExprOnceResult;
}

+ (id)nameWithString:(id)a3
{
  id v3;
  SGIdentityName *v4;

  v3 = a3;
  v4 = -[SGIdentityName initWithString:]([SGIdentityName alloc], "initWithString:", v3);

  return v4;
}

void __26__SGIdentityName_patterns__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGPatterns patternsForClass:](SGPatterns, "patternsForClass:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)patterns__pasExprOnceResult;
  patterns__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

@end
