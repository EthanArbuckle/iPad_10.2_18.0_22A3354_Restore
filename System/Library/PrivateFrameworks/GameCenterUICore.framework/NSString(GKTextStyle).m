@implementation NSString(GKTextStyle)

- (id)_gkAttributedStringByApplyingStyle:()GKTextStyle
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDD1458];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", a1, v7);
  return v8;
}

- (id)_gkAttributedStringByApplyingStylesForTags:()GKTextStyle untaggedStyle:
{
  uint64_t v5;
  uint64_t *v6;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  unsigned int (**v12)(_QWORD);
  void (**v13)(_QWORD, _QWORD, _QWORD);
  int v14;
  void *v15;
  uint64_t v16;
  int v17;
  char v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  char v23;
  __CFString *v24;
  int v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  int64_t v38;
  void *v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  _QWORD v51[6];
  _QWORD v52[7];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[4];
  __CFString *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  _QWORD v82[2];
  _QWORD v83[23];

  v83[20] = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v42 = a4;
  objc_msgSend(v42, "attributes");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", a1, v40);
  v57 = 0;
  v58 = &v57;
  v59 = 0xD810000000;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v60 = &unk_219FA6ED3;
  v72 = 0;
  v5 = -[__CFString length](a1, "length");
  v6 = v58;
  v58[20] = (uint64_t)a1;
  v6[23] = 0;
  v6[24] = v5;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  v6[21] = (uint64_t)CharactersPtr;
  if (CharactersPtr)
    CStringPtr = 0;
  else
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  v6[22] = (uint64_t)CStringPtr;
  v6[25] = 0;
  v6[26] = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v9 = MEMORY[0x24BDAC760];
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke;
  v52[3] = &unk_24DC27C48;
  v52[4] = &v53;
  v52[5] = 0;
  v52[6] = v5;
  v10 = (void *)MEMORY[0x220737704](v52);
  v51[0] = v9;
  v51[1] = 3221225472;
  v51[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_2;
  v51[3] = &unk_24DC27C70;
  v51[4] = &v73;
  v51[5] = v83;
  v11 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x220737704](v51);
  v47[0] = v9;
  v47[1] = 3221225472;
  v47[2] = __82__NSString_GKTextStyle___gkAttributedStringByApplyingStylesForTags_untaggedStyle___block_invoke_3;
  v47[3] = &unk_24DC27C98;
  v49 = &v53;
  v50 = &v57;
  v12 = v10;
  v47[4] = a1;
  v48 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x220737704](v47);
  v14 = 0;
  v15 = 0;
  v16 = 0;
  while (1)
  {
    if (!v14)
    {
      v13[2](v13, 60, 0);
      if ((v11[2](v11, v54[3] - 1) & 1) != 0)
        goto LABEL_45;
      v14 = 1;
      goto LABEL_36;
    }
    if (v14 != 1)
    {
      if (((unsigned int (*)(_QWORD, uint64_t, _QWORD))v13[2])(v13, 60, 0)
        && ((unsigned int (*)(_QWORD, uint64_t, _QWORD))v13[2])(v13, 47, 0))
      {
        v17 = v11[2](v11, v54[3] - 2);
      }
      else
      {
        v20 = *MEMORY[0x24BE3A308];
        if (!*MEMORY[0x24BE3A308])
        {
          v21 = (id)GKOSLoggers();
          v20 = *MEMORY[0x24BE3A308];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v78 = a1;
          _os_log_debug_impl(&dword_219F71000, v20, OS_LOG_TYPE_DEBUG, "no closing tag in string:%@", buf, 0xCu);
        }
        v17 = 1;
      }
      v22 = v54[3];
      v45 = 0;
      v23 = ((uint64_t (*)(_QWORD, uint64_t, id *))v13[2])(v13, 62, &v45);
      v24 = (__CFString *)v45;
      if ((v23 & 1) != 0)
      {
        if (v17)
          goto LABEL_30;
        v25 = v11[2](v11, v54[3]);
        if ((-[__CFString isEqualToString:](v24, "isEqualToString:", v15) & 1) != 0)
          goto LABEL_31;
        v26 = *MEMORY[0x24BE3A308];
        if (!*MEMORY[0x24BE3A308])
        {
          v27 = (id)GKOSLoggers();
          v26 = *MEMORY[0x24BE3A308];
        }
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
LABEL_30:
          v25 = 1;
LABEL_31:
          objc_msgSend(v43, "objectForKeyedSubscript:", v15);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33 && v33 != v42)
          {
            objc_msgSend(v33, "attributes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setAttributes:range:", v35, v16, v22 - v16);

          }
          if (v25)
            goto LABEL_45;
          v14 = 0;
          goto LABEL_36;
        }
        *(_DWORD *)buf = 138412802;
        v78 = v24;
        v79 = 2112;
        v80 = v15;
        v81 = 2112;
        v82[0] = a1;
        v28 = v26;
        v29 = "wrong closing tag name (got %@, expected %@) in string:%@";
        v30 = 32;
      }
      else
      {
        v31 = *MEMORY[0x24BE3A308];
        if (!*MEMORY[0x24BE3A308])
        {
          v32 = (id)GKOSLoggers();
          v31 = *MEMORY[0x24BE3A308];
        }
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          goto LABEL_30;
        *(_DWORD *)buf = 138412290;
        v78 = a1;
        v28 = v31;
        v29 = "malformed closing tag in string:%@";
        v30 = 12;
      }
      _os_log_debug_impl(&dword_219F71000, v28, OS_LOG_TYPE_DEBUG, v29, buf, v30);
      goto LABEL_30;
    }
    v46 = v15;
    v18 = ((uint64_t (*)(_QWORD, uint64_t, id *))v13[2])(v13, 62, &v46);
    v19 = v46;

    if ((v18 & 1) == 0)
      break;
    if ((v11[2](v11, v54[3]) & 1) != 0)
      goto LABEL_44;
    v16 = v54[3];
    v14 = 2;
    v15 = v19;
LABEL_36:
    if (v12[2](v12))
      goto LABEL_45;
  }
  v36 = *MEMORY[0x24BE3A308];
  if (!*MEMORY[0x24BE3A308])
  {
    v37 = (id)GKOSLoggers();
    v36 = *MEMORY[0x24BE3A308];
  }
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v78 = a1;
    _os_log_debug_impl(&dword_219F71000, v36, OS_LOG_TYPE_DEBUG, "malformed tag in string:%@", buf, 0xCu);
  }
LABEL_44:
  v15 = v19;
LABEL_45:
  v38 = v74[3] & 0xFFFFFFFFFFFFFFFELL;
  if (v38 >= 2)
  {
    do
    {
      if (v83[v38 - 1] != v82[v38])
        objc_msgSend(v44, "deleteCharactersInRange:");
      v38 -= 2;
    }
    while ((unint64_t)(v38 + 2) > 3);
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v73, 8);

  return v44;
}

@end
