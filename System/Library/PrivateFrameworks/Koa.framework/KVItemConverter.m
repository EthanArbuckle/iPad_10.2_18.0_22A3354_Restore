@implementation KVItemConverter

+ (id)cascadeItemFromItem:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_opt_class();
    v12 = objc_msgSend_itemType(v5, v9, v10, v11);
    v18 = objc_msgSend_cascadeItemTypeFromItemType_(v8, v13, v12, v14);
    if (v18 == (unsigned __int16)*MEMORY[0x1E0D0D3D8])
    {
      v19 = objc_msgSend_itemType(v5, v15, v16, v17);
      if (v19 == 14)
      {
        v35 = (void *)objc_opt_class();
        objc_msgSend__convertFromKVItemType_GlobalTerm_error_(v35, v36, (uint64_t)v5, (uint64_t)a4);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (v19 == 1)
      {
        v20 = (void *)objc_opt_class();
        objc_msgSend__convertFromKVItemType_CustomTerm_error_(v20, v21, (uint64_t)v5, (uint64_t)a4);
        v22 = objc_claimAutoreleasedReturnValue();
LABEL_25:
        v30 = (void *)v22;
        goto LABEL_26;
      }
    }
    if (v18 > 42183)
    {
      if (v18 <= 53600)
      {
        if (v18 > 47340)
        {
          if (v18 == 47341)
          {
            v68 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_AppIntentsEntity_error_(v68, v69, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          if (v18 == 49066)
          {
            v48 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_RadioEntity_error_(v48, v49, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
        }
        else
        {
          if (v18 == 42184)
          {
            v60 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_Podcast_error_(v60, v61, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
          if (v18 == 42611)
          {
            v40 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_AppIntentsEnum_error_(v40, v41, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
        }
      }
      else if (v18 <= 54384)
      {
        if (v18 == 53601)
        {
          v64 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_LearnedContact_error_(v64, v65, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        if (v18 == 53614)
        {
          v44 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_Fitness_error_(v44, v45, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
      else
      {
        switch(v18)
        {
          case 54385:
            v54 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_CalendarEvent_error_(v54, v55, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          case 61509:
            v56 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_UserAccount_error_(v56, v57, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          case 62158:
            v33 = (void *)objc_opt_class();
            objc_msgSend__convertFromKVItemType_LearnedMediaEntity_error_(v33, v34, (uint64_t)v5, (uint64_t)a4);
            v22 = objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
        }
      }
    }
    else if (v18 <= 15756)
    {
      if (v18 > 12009)
      {
        if (v18 == 12010)
        {
          v66 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_AutoShortcut_error_(v66, v67, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        if (v18 == 12996)
        {
          v46 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_Health_error_(v46, v47, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
      else
      {
        if (v18 == 7690)
        {
          v58 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_HomeEntity_error_(v58, v59, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        if (v18 == 7822)
        {
          v38 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_AppShortcut_error_(v38, v39, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
      }
    }
    else if (v18 <= 19667)
    {
      if (v18 == 15757)
      {
        v62 = (void *)objc_opt_class();
        objc_msgSend__convertFromKVItemType_LocationOfInterest_error_(v62, v63, (uint64_t)v5, (uint64_t)a4);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (v18 == 18540)
      {
        v42 = (void *)objc_opt_class();
        objc_msgSend__convertFromKVItemType_MediaEntity_error_(v42, v43, (uint64_t)v5, (uint64_t)a4);
        v22 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
    }
    else
    {
      switch(v18)
      {
        case 19668:
          v50 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_Contact_error_(v50, v51, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 27122:
          v52 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_FindMy_error_(v52, v53, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        case 36434:
          v31 = (void *)objc_opt_class();
          objc_msgSend__convertFromKVItemType_AppInfo_error_(v31, v32, (uint64_t)v5, (uint64_t)a4);
          v22 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
      }
    }
    v70 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("No supported conversion for KVItem: %@"), v17, v5, *MEMORY[0x1E0CB2938]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v71, (uint64_t)&v74, (uint64_t)&v73, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v70, v72, (uint64_t)CFSTR("com.apple.koa.item.converter"), 1, v26);
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v75 = *MEMORY[0x1E0CB2938];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("Cannot convert invalid KVItem: %@"), v7, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v25, (uint64_t)v76, (uint64_t)&v75, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, (uint64_t)CFSTR("com.apple.koa.item.converter"), 2, v26);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (a4 && v28)
    *a4 = objc_retainAutorelease(v28);

  v30 = 0;
LABEL_26:

  return v30;
}

+ (unsigned)cascadeItemTypeFromItemType:(int64_t)a3
{
  unsigned __int16 result;
  void *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = 19668;
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 7:
    case 10:
    case 11:
    case 13:
    case 14:
      goto LABEL_2;
    case 2:
      return result;
    case 3:
      result = -29102;
      break;
    case 4:
      result = 7690;
      break;
    case 5:
      result = 18540;
      break;
    case 8:
      result = 12010;
      break;
    case 9:
      result = -16470;
      break;
    case 12:
      result = 15757;
      break;
    case 15:
      result = -11151;
      break;
    case 16:
      result = -23352;
      break;
    case 17:
      result = -11922;
      break;
    case 18:
      result = 7822;
      break;
    case 19:
      result = 12996;
      break;
    case 20:
      result = -4027;
      break;
    case 21:
      result = 27122;
      break;
    case 22:
      result = -11935;
      break;
    case 23:
      result = -3378;
      break;
    case 24:
      result = -18195;
      break;
    case 25:
      result = -22925;
      break;
    default:
      v5 = (void *)qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      {
        v6 = v5;
        KVItemTypeDescription(a3, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "+[KVItemConverter cascadeItemTypeFromItemType:]";
        v11 = 2112;
        v12 = v8;
        _os_log_error_impl(&dword_1B70E7000, v6, OS_LOG_TYPE_ERROR, "%s KVItemType: %@ has no valid Cascade item type mapping.", (uint8_t *)&v9, 0x16u);

      }
LABEL_2:
      result = *MEMORY[0x1E0D0D3D8];
      break;
  }
  return result;
}

+ (id)_convertFromKVItemType_Podcast:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;
  id *v11;
  const char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  int v58;

  v5 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1B70FF010;
  v53 = sub_1B70FF020;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1B70FF010;
  v47 = sub_1B70FF020;
  v48 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1B70ED118;
  v42[3] = &unk_1E6B7B110;
  v42[4] = &v55;
  v42[5] = &v49;
  v42[6] = &v43;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v42, v7);
  v8 = *((_DWORD *)v56 + 6);
  if (v8 == 1)
  {
    v14 = objc_alloc(MEMORY[0x1E0D3E430]);
    v15 = v50[5];
    v16 = v44[5];
    v41 = 0;
    v11 = (id *)&v41;
    v13 = objc_msgSend_initWithName_author_error_(v14, v17, v15, v16, &v41);
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    v9 = objc_alloc(MEMORY[0x1E0D3E428]);
    v10 = v50[5];
    v40 = 0;
    v11 = (id *)&v40;
    v13 = objc_msgSend_initWithName_error_(v9, v12, v10, (uint64_t)&v40);
LABEL_5:
    v18 = (void *)v13;
    v19 = *v11;
    goto LABEL_7;
  }
  v18 = 0;
  v19 = 0;
LABEL_7:
  v20 = objc_alloc(MEMORY[0x1E0D3E418]);
  v21 = *((unsigned int *)v56 + 6);
  v39 = v19;
  v23 = (void *)objc_msgSend_initWithEntity_entityType_error_(v20, v22, (uint64_t)v18, v21, &v39);
  v24 = v39;

  if (v23)
  {
    v25 = objc_alloc(MEMORY[0x1E0D3E420]);
    objc_msgSend_itemId(v5, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v24;
    v31 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v25, v30, (uint64_t)v29, (uint64_t)&v38);
    v32 = v38;

    if (v31)
    {
      sub_1B70ECEBC(v23, v31, v5, a4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v32, v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (a4 && v35)
        *a4 = objc_retainAutorelease(v35);

      v31 = 0;
      v33 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v24, v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v34;
    v33 = 0;
    if (a4 && v34)
    {
      v31 = objc_retainAutorelease(v34);
      v33 = 0;
      *a4 = v31;
    }
    v32 = v24;
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v33;
}

+ (int64_t)itemTypeFromCascadeItemType:(unsigned __int16)a3
{
  uint64_t v3;
  int64_t result;
  int v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  result = 1;
  if ((int)a3 > 27121)
  {
    if ((int)a3 > 47340)
    {
      if ((int)a3 > 54384)
      {
        if ((int)a3 <= 61508)
        {
          if (a3 == 54385)
            return 15;
          v5 = 61352;
        }
        else
        {
          if (a3 == 61509)
            return 20;
          if (a3 == 62158)
            return 23;
          v5 = 63369;
        }
        goto LABEL_63;
      }
      if ((int)a3 <= 53481)
      {
        if (a3 == 47341)
          return 24;
        if (a3 == 49066)
          return 9;
      }
      else
      {
        switch(a3)
        {
          case 0xD0EAu:
            return result;
          case 0xD161u:
            return 22;
          case 0xD16Eu:
            return 17;
        }
      }
LABEL_79:
      v7 = (void *)qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
      {
        v8 = (void *)MEMORY[0x1E0D3E4C0];
        v9 = v7;
        objc_msgSend_descriptionForTypeIdentifier_(v8, v10, v3, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 136315394;
        v14 = "+[KVItemConverter itemTypeFromCascadeItemType:]";
        v15 = 2112;
        v16 = v12;
        _os_log_error_impl(&dword_1B70E7000, v9, OS_LOG_TYPE_ERROR, "%s Cascade itemType: %@ has no valid KVItemType mapping.", (uint8_t *)&v13, 0x16u);

      }
      return 0;
    }
    if ((int)a3 > 36433)
    {
      if ((int)a3 <= 42183)
      {
        if (a3 == 36434)
          return 3;
        v5 = 38251;
      }
      else
      {
        if (a3 == 42184)
          return 16;
        if (a3 == 42611)
          return 25;
        v5 = 44935;
      }
      goto LABEL_63;
    }
    if ((int)a3 <= 32964)
    {
      if (a3 == 27122)
        return 21;
      v5 = 30598;
      goto LABEL_63;
    }
    if (a3 == 32965)
      return result;
    if (a3 == 34307)
      return 14;
    v6 = 36059;
LABEL_54:
    if (a3 != v6)
      goto LABEL_79;
    return 14;
  }
  if ((int)a3 <= 14024)
  {
    if ((int)a3 <= 7821)
    {
      if ((int)a3 > 5594)
      {
        if (a3 == 5595)
          return result;
        if (a3 == 7690)
          return 4;
        v5 = 7719;
LABEL_63:
        if (a3 == v5)
          return result;
        goto LABEL_79;
      }
      if (a3 == 800)
        return result;
      if (a3 != 3615)
        goto LABEL_79;
      return 14;
    }
    if ((int)a3 > 12009)
    {
      if (a3 == 12010)
        return 8;
      if (a3 == 12996)
        return 19;
      v5 = 13884;
      goto LABEL_63;
    }
    if (a3 == 7822)
      return 18;
    v6 = 8194;
    goto LABEL_54;
  }
  if ((int)a3 <= 16250)
  {
    if ((int)a3 > 14815)
    {
      if (a3 == 14816 || a3 == 15572)
        return result;
      if (a3 == 15757)
        return 12;
      goto LABEL_79;
    }
    if (a3 != 14025)
    {
      v5 = 14706;
      goto LABEL_63;
    }
    return 14;
  }
  if ((int)a3 <= 19667)
  {
    if (a3 == 16251)
      return result;
    if (a3 == 18540)
      return 5;
    goto LABEL_79;
  }
  if (a3 == 19668)
    return 2;
  if (a3 != 25883)
  {
    v5 = 26512;
    goto LABEL_63;
  }
  return result;
}

+ (int64_t)fieldTypeFromCascadeFieldType:(unsigned __int16)a3
{
  int64_t result;

  if ((int)a3 > 19746)
  {
    if ((int)a3 > 44937)
    {
      if ((int)a3 > 53603)
      {
        if ((int)a3 <= 61512)
        {
          if ((int)a3 > 54388)
          {
            switch(a3)
            {
              case 0xD475u:
                return 651;
              case 0xEFABu:
                return 1;
              case 0xF048u:
                return 900;
            }
          }
          else
          {
            switch(a3)
            {
              case 0xD164u:
                return 1001;
              case 0xD171u:
                return 750;
              case 0xD474u:
                return 650;
            }
          }
          return 0;
        }
        switch(a3)
        {
          case 0xF2CFu:
            result = 1050;
            break;
          case 0xF2D0u:
            result = 1051;
            break;
          case 0xF2D1u:
            result = 1052;
            break;
          case 0xF2D2u:
            result = 1054;
            break;
          default:
            if (a3 == 61513)
            {
              result = 901;
            }
            else
            {
              if (a3 != 63372)
                return 0;
              result = 2;
            }
            break;
        }
      }
      else if ((int)a3 > 49068)
      {
        switch(a3)
        {
          case 0xBFADu:
            result = 351;
            break;
          case 0xBFAEu:
            result = 352;
            break;
          case 0xBFAFu:
            result = 353;
            break;
          case 0xBFB0u:
            result = 354;
            break;
          case 0xBFB1u:
            result = 355;
            break;
          default:
            if (a3 != 53485)
              return 0;
            result = 4;
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 0xB8F3u:
            result = 1103;
            break;
          case 0xB8F4u:
            result = 1104;
            break;
          case 0xB8F5u:
            result = 1105;
            break;
          case 0xB8F6u:
          case 0xB8F7u:
            return 0;
          case 0xB8F8u:
            result = 1101;
            break;
          case 0xB8F9u:
            result = 1102;
            break;
          default:
            if (a3 != 44938)
              return 0;
            result = 5;
            break;
        }
      }
    }
    else
    {
      if ((int)a3 <= 34311)
      {
        if ((int)a3 > 26514)
        {
          if ((int)a3 > 27131)
          {
            switch(a3)
            {
              case 0x69FCu:
                return 952;
              case 0x7789u:
                return 17;
              case 0x80C8u:
                return 12;
            }
          }
          else
          {
            switch(a3)
            {
              case 0x6793u:
                return 10;
              case 0x69F6u:
                return 950;
              case 0x69FBu:
                return 951;
            }
          }
          return 0;
        }
        if ((int)a3 > 19758)
        {
          if (a3 != 19759)
          {
            if (a3 == 19765)
              return 58;
            if (a3 == 25886)
              return 9;
            return 0;
          }
        }
        else
        {
          if (a3 == 19747)
            return 57;
          if (a3 == 19749)
            return 59;
          if (a3 != 19758)
            return 0;
        }
        return 63;
      }
      if ((int)a3 <= 42188)
      {
        if ((int)a3 > 36440)
        {
          switch(a3)
          {
            case 0x8E59u:
              return 104;
            case 0x956Eu:
              return 15;
            case 0xA4CAu:
              return 702;
          }
        }
        else
        {
          switch(a3)
          {
            case 0x8608u:
              return 600;
            case 0x8CE0u:
              return 604;
            case 0x8E57u:
              return 102;
          }
        }
        return 0;
      }
      switch(a3)
      {
        case 0xA67Au:
          result = 1154;
          break;
        case 0xA67Bu:
          result = 1155;
          break;
        case 0xA67Cu:
          result = 1156;
          break;
        case 0xA67Du:
          result = 1151;
          break;
        case 0xA67Eu:
          result = 1152;
          break;
        default:
          if (a3 == 42189)
          {
            result = 700;
          }
          else
          {
            if (a3 != 42190)
              return 0;
            result = 701;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)a3 > 15767)
    {
      if ((int)a3 > 18554)
      {
        switch(a3)
        {
          case 0x487Bu:
            result = 204;
            break;
          case 0x487Cu:
            result = 202;
            break;
          case 0x487Du:
            result = 208;
            break;
          case 0x487Eu:
            result = 206;
            break;
          case 0x487Fu:
            result = 210;
            break;
          case 0x4880u:
            result = 212;
            break;
          case 0x4881u:
            result = 214;
            break;
          case 0x4882u:
            result = 216;
            break;
          case 0x4883u:
            result = 228;
            break;
          case 0x4884u:
            result = 226;
            break;
          case 0x4885u:
            result = 230;
            break;
          case 0x4886u:
            result = 232;
            break;
          default:
            switch(a3)
            {
              case 0x4CDFu:
                result = 50;
                break;
              case 0x4CE0u:
                result = 51;
                break;
              case 0x4CE1u:
                result = 52;
                break;
              case 0x4CE2u:
                result = 53;
                break;
              case 0x4CE3u:
                result = 54;
                break;
              case 0x4CEDu:
                result = 64;
                break;
              default:
                return 0;
            }
            break;
        }
        return result;
      }
      if ((a3 - 15770) < 4)
        return 552;
      if ((a3 - 15768) < 2)
        return 551;
      if (a3 == 16254)
        return 8;
      return 0;
    }
    if ((int)a3 > 7824)
    {
      if ((int)a3 <= 12999)
      {
        if ((int)a3 <= 8198)
        {
          if (a3 == 7825)
            return 801;
          if (a3 == 7830)
            return 804;
        }
        else
        {
          switch(a3)
          {
            case 0x2007u:
              return 602;
            case 0x2EEDu:
              return 300;
            case 0x32C7u:
              return 850;
          }
        }
      }
      else if ((int)a3 > 14708)
      {
        switch(a3)
        {
          case 0x3975u:
            return 14;
          case 0x39E3u:
            return 6;
          case 0x3CD7u:
            return 16;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x32C8u:
            return 851;
          case 0x363Fu:
            return 3;
          case 0x36CEu:
            return 603;
        }
      }
      return 0;
    }
    if ((int)a3 <= 7699)
    {
      switch(a3)
      {
        case 0x323u:
          return 7;
        case 0xE24u:
          return 601;
        case 0x15DEu:
          return 11;
      }
      return 0;
    }
    switch(a3)
    {
      case 0x1E14u:
        result = 158;
        break;
      case 0x1E15u:
        result = 150;
        break;
      case 0x1E16u:
        result = 157;
        break;
      case 0x1E18u:
        result = 152;
        break;
      case 0x1E19u:
        result = 155;
        break;
      case 0x1E1Au:
        result = 153;
        break;
      case 0x1E1Cu:
        result = 154;
        break;
      case 0x1E1Du:
        result = 156;
        break;
      case 0x1E1Eu:
        result = 151;
        break;
      case 0x1E2Au:
        result = 13;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (unsigned)cascadeFieldTypeFromFieldType:(int64_t)a3
{
  unsigned __int16 result;

  if (a3 <= 200)
  {
    result = -4181;
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        result = -2164;
        break;
      case 3:
        result = 13887;
        break;
      case 4:
        result = -12051;
        break;
      case 5:
        result = -20598;
        break;
      case 6:
        result = 14819;
        break;
      case 7:
        result = 803;
        break;
      case 8:
        result = 16254;
        break;
      case 9:
        result = 25886;
        break;
      case 10:
        result = 26515;
        break;
      case 11:
        result = 5598;
        break;
      case 12:
        result = -32568;
        break;
      case 13:
        result = 7722;
        break;
      case 14:
        result = 14709;
        break;
      case 15:
        result = -27282;
        break;
      case 16:
        result = 15575;
        break;
      case 17:
        result = 30601;
        break;
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
        return *MEMORY[0x1E0D0D3D8];
      case 50:
        result = 19679;
        break;
      case 51:
        result = 19680;
        break;
      case 52:
        result = 19681;
        break;
      case 53:
        result = 19682;
        break;
      case 54:
        result = 19683;
        break;
      case 55:
        result = 19684;
        break;
      case 56:
        result = 19685;
        break;
      case 57:
        result = 19747;
        break;
      case 58:
        result = 19765;
        break;
      case 59:
        result = 19749;
        break;
      case 60:
        result = 19767;
        break;
      case 61:
        result = 19760;
        break;
      case 62:
        result = 19744;
        break;
      case 63:
        result = 19758;
        break;
      case 64:
        result = 19693;
        break;
      case 65:
        result = 19694;
        break;
      case 66:
        result = 19695;
        break;
      case 67:
        result = 19696;
        break;
      case 68:
        result = 19697;
        break;
      case 69:
        result = 19698;
        break;
      case 70:
        result = 19699;
        break;
      case 100:
        result = -29099;
        break;
      case 101:
        result = -29098;
        break;
      case 102:
        result = -29097;
        break;
      case 103:
        result = -29090;
        break;
      case 104:
        result = -29095;
        break;
      default:
        switch(a3)
        {
          case 150:
            result = 7701;
            break;
          case 151:
            result = 7710;
            break;
          case 152:
            result = 7704;
            break;
          case 153:
            result = 7706;
            break;
          case 154:
            result = 7708;
            break;
          case 155:
            result = 7705;
            break;
          case 156:
            result = 7709;
            break;
          case 157:
            result = 7702;
            break;
          case 158:
            result = 7700;
            break;
          default:
            return *MEMORY[0x1E0D0D3D8];
        }
        break;
    }
  }
  else
  {
    if (a3 <= 650)
    {
      if (a3 > 301)
      {
        if (a3 > 599)
        {
          switch(a3)
          {
            case 600:
              result = -31224;
              break;
            case 601:
              result = 3620;
              break;
            case 602:
              result = 8199;
              break;
            case 603:
              result = 14030;
              break;
            case 604:
              result = -29472;
              break;
            default:
              if (a3 != 650)
                return *MEMORY[0x1E0D0D3D8];
              result = -11148;
              break;
          }
        }
        else
        {
          switch(a3)
          {
            case 351:
              result = -16467;
              break;
            case 352:
              result = -16466;
              break;
            case 353:
              result = -16465;
              break;
            case 354:
              result = -16464;
              break;
            case 355:
              result = -16463;
              break;
            default:
              if (a3 != 302)
                return *MEMORY[0x1E0D0D3D8];
              result = 12015;
              break;
          }
        }
      }
      else
      {
        switch(a3)
        {
          case 201:
          case 203:
          case 205:
          case 207:
          case 209:
          case 211:
          case 213:
          case 215:
          case 225:
          case 227:
          case 229:
          case 231:
            return 18567;
          case 202:
            return 18556;
          case 204:
            return 18555;
          case 206:
            return 18558;
          case 208:
            return 18557;
          case 210:
            return 18559;
          case 212:
            return 18560;
          case 214:
            return 18561;
          case 216:
            return 18562;
          case 217:
          case 218:
          case 219:
          case 220:
          case 221:
          case 222:
          case 223:
          case 224:
            return *MEMORY[0x1E0D0D3D8];
          case 226:
            return 18564;
          case 228:
            return 18563;
          case 230:
            return 18565;
          case 232:
            return 18566;
          default:
            if (a3 == 300)
            {
              result = 12013;
            }
            else
            {
              if (a3 != 301)
                return *MEMORY[0x1E0D0D3D8];
              result = 12014;
            }
            break;
        }
      }
      return result;
    }
    if (a3 > 1049)
    {
      switch(a3)
      {
        case 1150:
          result = -22924;
          break;
        case 1151:
          result = -22915;
          break;
        case 1152:
          result = -22914;
          break;
        case 1153:
          result = -22919;
          break;
        case 1154:
          result = -22918;
          break;
        case 1155:
          result = -22917;
          break;
        case 1156:
          result = -22916;
          break;
        default:
          switch(a3)
          {
            case 1050:
              result = -3377;
              break;
            case 1051:
              result = -3376;
              break;
            case 1052:
              result = -3375;
              break;
            case 1053:
              result = -3373;
              break;
            case 1054:
              result = -3374;
              break;
            case 1055:
              result = -3372;
              break;
            default:
              switch(a3)
              {
                case 1100:
                  result = -18182;
                  break;
                case 1101:
                  result = -18184;
                  break;
                case 1102:
                  result = -18183;
                  break;
                case 1103:
                  result = -18189;
                  break;
                case 1104:
                  result = -18188;
                  break;
                case 1105:
                  result = -18187;
                  break;
                default:
                  return *MEMORY[0x1E0D0D3D8];
              }
              break;
          }
          break;
      }
    }
    else
    {
      if (a3 > 849)
      {
        if (a3 <= 949)
        {
          if (a3 > 899)
          {
            if (a3 == 900)
              return -4024;
            if (a3 == 901)
              return -4023;
          }
          else
          {
            if (a3 == 850)
              return 12999;
            if (a3 == 851)
              return 13000;
          }
        }
        else
        {
          if (a3 <= 951)
          {
            if (a3 == 950)
              return 27126;
            else
              return 27131;
          }
          switch(a3)
          {
            case 952:
              return 27132;
            case 1000:
              return -11931;
            case 1001:
              return -11932;
          }
        }
        return *MEMORY[0x1E0D0D3D8];
      }
      if (a3 <= 701)
      {
        switch(a3)
        {
          case 651:
            return -11147;
          case 700:
            return -23347;
          case 701:
            return -23346;
        }
        return *MEMORY[0x1E0D0D3D8];
      }
      switch(a3)
      {
        case 800:
          result = 7826;
          break;
        case 801:
          result = 7825;
          break;
        case 802:
          result = 7827;
          break;
        case 803:
          result = 7828;
          break;
        case 804:
          result = 7830;
          break;
        default:
          if (a3 == 702)
          {
            result = -23348;
          }
          else
          {
            if (a3 != 750)
              return *MEMORY[0x1E0D0D3D8];
            result = -11919;
          }
          break;
      }
    }
  }
  return result;
}

+ (id)_convertFromKVItemType_CustomTerm:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  const char *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[8];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2050000000;
  v58 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2050000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1B70FF010;
  v49 = sub_1B70FF020;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1B70FF010;
  v43 = sub_1B70FF020;
  v44 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1B7102ACC;
  v38[3] = &unk_1E6B7B0E8;
  v38[4] = &v55;
  v38[5] = &v51;
  v38[6] = &v45;
  v38[7] = &v39;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v38, v7);
  v10 = (objc_class *)v56[3];
  if (v10 && v52[3])
  {
    v11 = [v10 alloc];
    v12 = v46[5];
    v13 = v40[5];
    v37 = 0;
    v15 = (void *)objc_msgSend_initWithVocabularyString_vocabularyIdentifier_error_(v11, v14, v12, v13, &v37);
    v16 = v37;
    v17 = v16;
    if (v15)
    {
      v18 = objc_alloc((Class)v52[3]);
      objc_msgSend_itemId(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v17;
      v24 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v23, (uint64_t)v22, (uint64_t)&v36);
      v25 = v36;

      if (v24)
      {
        sub_1B70ECEBC(v15, v24, v5, a4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sub_1B7100D70(v25, v5);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (a4 && v33)
          *a4 = objc_retainAutorelease(v33);

        v24 = 0;
        v26 = 0;
      }
      v17 = v25;
    }
    else
    {
      sub_1B7100D70(v16, v5);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;
      v15 = 0;
      if (a4 && v32)
      {
        v24 = objc_retainAutorelease(v32);
        v15 = 0;
        v26 = 0;
        *a4 = v24;
      }
      else
      {
        v26 = 0;
      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v59 = *MEMORY[0x1E0CB2938];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("No supported conversion for CustomTerm KVItem: %@"), v9, v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v15;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)v60, (uint64_t)&v59, 1);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v29, (uint64_t)CFSTR("com.apple.koa.item.converter"), 1, v24);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a4 && v30)
      *a4 = objc_retainAutorelease(v30);

    v17 = 0;
    v26 = 0;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v26;
}

+ (id)_convertFromKVItemType_GlobalTerm:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  _QWORD v37[7];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2050000000;
  v51 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1B70FF010;
  v42 = sub_1B70FF020;
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = sub_1B7102988;
  v37[3] = &unk_1E6B7B110;
  v37[4] = &v48;
  v37[5] = &v44;
  v37[6] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7);
  v10 = (objc_class *)v49[3];
  if (v10 && v45[3])
  {
    v11 = [v10 alloc];
    v12 = v39[5];
    v36 = 0;
    v14 = (void *)objc_msgSend_initWithVocabularyStrings_error_(v11, v13, v12, (uint64_t)&v36);
    v15 = v36;
    v16 = v15;
    if (v14)
    {
      v17 = objc_alloc((Class)v45[3]);
      objc_msgSend_itemId(v5, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v16;
      v23 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v17, v22, (uint64_t)v21, (uint64_t)&v35);
      v24 = v35;

      if (v23)
      {
        sub_1B70ECEBC(v14, v23, v5, a4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sub_1B7100D70(v24, v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (a4 && v32)
          *a4 = objc_retainAutorelease(v32);

        v23 = 0;
        v25 = 0;
      }
      v16 = v24;
    }
    else
    {
      sub_1B7100D70(v15, v5);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v31;
      v14 = 0;
      if (a4 && v31)
      {
        v23 = objc_retainAutorelease(v31);
        v14 = 0;
        v25 = 0;
        *a4 = v23;
      }
      else
      {
        v25 = 0;
      }
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v52 = *MEMORY[0x1E0CB2938];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("No supported conversion for CustomTerm KVItem: %@"), v9, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v14;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v27, (uint64_t)v53, (uint64_t)&v52, 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v26, v28, (uint64_t)CFSTR("com.apple.koa.item.converter"), 1, v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a4 && v29)
      *a4 = objc_retainAutorelease(v29);

    v16 = 0;
    v25 = 0;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

  return v25;
}

+ (id)_convertFromKVItemType_Contact:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id *v37;
  const char *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  id obj;
  _QWORD v46[27];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  void (*v115)(uint64_t);
  id v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t (*v162)(uint64_t, uint64_t);
  void (*v163)(uint64_t);
  id v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t (*v168)(uint64_t, uint64_t);
  void (*v169)(uint64_t);
  id v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  void (*v175)(uint64_t);
  id v176;
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;

  v5 = a3;
  v177 = 0;
  v178 = &v177;
  v179 = 0x3032000000;
  v180 = sub_1B70FF010;
  v181 = sub_1B70FF020;
  v182 = 0;
  v171 = 0;
  v172 = &v171;
  v173 = 0x3032000000;
  v174 = sub_1B70FF010;
  v175 = sub_1B70FF020;
  v176 = 0;
  v165 = 0;
  v166 = &v165;
  v167 = 0x3032000000;
  v168 = sub_1B70FF010;
  v169 = sub_1B70FF020;
  v170 = 0;
  v159 = 0;
  v160 = &v159;
  v161 = 0x3032000000;
  v162 = sub_1B70FF010;
  v163 = sub_1B70FF020;
  v164 = 0;
  v153 = 0;
  v154 = &v153;
  v155 = 0x3032000000;
  v156 = sub_1B70FF010;
  v157 = sub_1B70FF020;
  v158 = 0;
  v147 = 0;
  v148 = &v147;
  v149 = 0x3032000000;
  v150 = sub_1B70FF010;
  v151 = sub_1B70FF020;
  v152 = 0;
  v141 = 0;
  v142 = &v141;
  v143 = 0x3032000000;
  v144 = sub_1B70FF010;
  v145 = sub_1B70FF020;
  v146 = 0;
  v135 = 0;
  v136 = &v135;
  v137 = 0x3032000000;
  v138 = sub_1B70FF010;
  v139 = sub_1B70FF020;
  v140 = 0;
  v129 = 0;
  v130 = &v129;
  v131 = 0x3032000000;
  v132 = sub_1B70FF010;
  v133 = sub_1B70FF020;
  v134 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x3032000000;
  v126 = sub_1B70FF010;
  v127 = sub_1B70FF020;
  v128 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x3032000000;
  v120 = sub_1B70FF010;
  v121 = sub_1B70FF020;
  v122 = 0;
  v111 = 0;
  v112 = &v111;
  v113 = 0x3032000000;
  v114 = sub_1B70FF010;
  v115 = sub_1B70FF020;
  v116 = 0;
  v105 = 0;
  v106 = &v105;
  v107 = 0x3032000000;
  v108 = sub_1B70FF010;
  v109 = sub_1B70FF020;
  v110 = 0;
  v99 = 0;
  v100 = &v99;
  v101 = 0x3032000000;
  v102 = sub_1B70FF010;
  v103 = sub_1B70FF020;
  v104 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = sub_1B70FF010;
  v97 = sub_1B70FF020;
  v98 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = sub_1B70FF010;
  v91 = sub_1B70FF020;
  v92 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = sub_1B70FF010;
  v85 = sub_1B70FF020;
  v86 = 0;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_1B70FF010;
  v79 = sub_1B70FF020;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_1B70FF010;
  v73 = sub_1B70FF020;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_1B70FF010;
  v67 = sub_1B70FF020;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_1B70FF010;
  v61 = sub_1B70FF020;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1B70FF010;
  v55 = sub_1B70FF020;
  v56 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1B710237C;
  v46[3] = &unk_1E6B7B138;
  v46[4] = &v177;
  v46[5] = &v171;
  v46[6] = &v165;
  v46[7] = &v159;
  v46[8] = &v153;
  v46[9] = &v147;
  v46[10] = &v141;
  v46[11] = &v51;
  v46[12] = &v47;
  v46[13] = &v135;
  v46[14] = &v129;
  v46[15] = &v123;
  v46[16] = &v117;
  v46[17] = &v111;
  v46[18] = &v105;
  v46[19] = &v99;
  v46[20] = &v93;
  v46[21] = &v87;
  v46[22] = &v81;
  v46[23] = &v75;
  v46[24] = &v69;
  v46[25] = &v63;
  v46[26] = &v57;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, (const char *)&v123, (uint64_t)v46, (uint64_t)&v111);
  if (*((_BYTE *)v48 + 24))
  {
    sub_1B7100D70((void *)v52[5], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
    if (a4 && v6)
    {
      v7 = objc_retainAutorelease(v6);
      v8 = 0;
      *a4 = v7;
    }
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0D3E2B0]);
    v10 = v178[5];
    v11 = v172[5];
    v12 = v166[5];
    v13 = v160[5];
    v14 = v154[5];
    v15 = v148[5];
    v16 = v142[5];
    v17 = v136[5];
    v18 = v130[5];
    v19 = v124[5];
    v20 = v118[5];
    v21 = v112[5];
    v22 = v106[5];
    v23 = v100[5];
    v24 = v94[5];
    v25 = v88[5];
    v26 = (const char *)v82[5];
    v27 = v76[5];
    v28 = v70[5];
    v29 = v64[5];
    v30 = v58[5];
    v31 = (id *)(v52 + 5);
    obj = (id)v52[5];
    v7 = (id)objc_msgSend_initWithGivenName_middleName_familyName_previousFamilyName_nickname_namePrefix_nameSuffix_phoneNumbers_emailAddresses_postalAddresses_urlAddresses_socialProfiles_instantMessageAddresses_relations_organizationName_departmentName_jobTitle_phoneticGivenName_phoneticMiddleName_phoneticFamilyName_phoneticOrganizationName_note_birthday_nonGregorianBirthday_dates_error_(v9, v26, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
               v27,
               v28,
               v29,
               v30,
               0,
               0,
               0,
               0,
               &obj);
    objc_storeStrong(v31, obj);
    if (v7)
    {
      v32 = objc_alloc(MEMORY[0x1E0D3E2C8]);
      objc_msgSend_itemId(v5, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (id *)(v52 + 5);
      v44 = (id)v52[5];
      v39 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v32, v38, (uint64_t)v36, (uint64_t)&v44);
      objc_storeStrong(v37, v44);

      if (v39)
      {
        sub_1B70ECEBC(v7, v39, v5, a4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sub_1B7100D70((void *)v52[5], v5);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (a4 && v41)
          *a4 = objc_retainAutorelease(v41);

        v39 = 0;
        v8 = 0;
      }
    }
    else
    {
      sub_1B7100D70((void *)v52[5], v5);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v40;
      v8 = 0;
      if (a4 && v40)
      {
        v39 = objc_retainAutorelease(v40);
        v8 = 0;
        *a4 = v39;
      }
    }

  }
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v87, 8);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);

  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v111, 8);

  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v135, 8);

  _Block_object_dispose(&v141, 8);
  _Block_object_dispose(&v147, 8);

  _Block_object_dispose(&v153, 8);
  _Block_object_dispose(&v159, 8);

  _Block_object_dispose(&v165, 8);
  _Block_object_dispose(&v171, 8);

  _Block_object_dispose(&v177, 8);
  return v8;
}

+ (id)_convertFromKVItemType_AppInfo:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[9];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v5 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1B70FF010;
  v62 = sub_1B70FF020;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1B70FF010;
  v56 = sub_1B70FF020;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1B70FF010;
  v50 = sub_1B70FF020;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1B70FF010;
  v44 = sub_1B70FF020;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B70FF010;
  v38 = sub_1B70FF020;
  v39 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1B710226C;
  v33[3] = &unk_1E6B7B160;
  v33[4] = &v58;
  v33[5] = &v52;
  v33[6] = &v46;
  v33[7] = &v34;
  v33[8] = &v40;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v33, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E380]);
  v9 = v59[5];
  v10 = v53[5];
  v11 = v47[5];
  v12 = v41[5];
  v32 = 0;
  v14 = (void *)objc_msgSend_initWithBundleIdentifier_bundleName_displayAppName_spokenName_alternativeAppNames_carPlayAlternativeDisplayName_spotlightName_providerName_error_(v8, v13, v9, v10, v11, 0, v12, 0, 0, 0, &v32);
  v15 = v32;
  v16 = v15;
  if (v14)
  {
    v17 = objc_alloc(MEMORY[0x1E0D3E388]);
    objc_msgSend_itemId(v5, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v35[5];
    v31 = v16;
    v24 = (id)objc_msgSend_initWithSourceItemIdentifier_bundleVersion_error_(v17, v23, (uint64_t)v21, v22, &v31);
    v25 = v31;

    if (v24)
    {
      sub_1B70ECEBC(v14, v24, v5, a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v25, v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (a4 && v28)
        *a4 = objc_retainAutorelease(v28);

      v24 = 0;
      v26 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v15, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v26 = 0;
    if (a4 && v27)
    {
      v24 = objc_retainAutorelease(v27);
      v26 = 0;
      *a4 = v24;
    }
    v25 = v16;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v26;
}

+ (id)_convertFromKVItemType_HomeEntity:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id *v20;
  const char *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  _QWORD v30[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;

  v5 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1B70FF010;
  v47 = sub_1B70FF020;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B70FF010;
  v41 = sub_1B70FF020;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B70FF010;
  v35 = sub_1B70FF020;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B7101EDC;
  v30[3] = &unk_1E6B7B0E8;
  v30[4] = &v49;
  v30[5] = &v43;
  v30[6] = &v31;
  v30[7] = &v37;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v30, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E340]);
  v9 = v44[5];
  v10 = *((unsigned int *)v50 + 6);
  v11 = (id *)(v32 + 5);
  obj = (id)v32[5];
  v13 = (void *)objc_msgSend_initWithEntity_entityType_error_(v8, v12, v9, v10, &obj);
  objc_storeStrong(v11, obj);
  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0D3E348]);
    objc_msgSend_itemId(v5, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v38[5];
    v20 = (id *)(v32 + 5);
    v28 = (id)v32[5];
    v22 = (id)objc_msgSend_initWithSourceItemIdentifier_assistantHomeKitIdentifier_error_(v14, v21, (uint64_t)v18, v19, &v28);
    objc_storeStrong(v20, v28);

    if (v22)
    {
      sub_1B70ECEBC(v13, v22, v5, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70((void *)v32[5], v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

      v22 = 0;
      v23 = 0;
    }
  }
  else
  {
    sub_1B7100D70((void *)v32[5], v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v24;
    v23 = 0;
    if (a4 && v24)
    {
      v22 = objc_retainAutorelease(v24);
      v23 = 0;
      *a4 = v22;
    }
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v23;
}

+ (id)_convertFromKVItemType_MediaEntity:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id *v23;
  const char *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id obj;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD v38[6];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  int v64;

  v5 = a3;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_1B70FF010;
  v59 = sub_1B70FF020;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_1B70FF010;
  v53 = sub_1B70FF020;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1B70FF010;
  v47 = sub_1B70FF020;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = sub_1B7101730;
  v38[3] = &unk_1E6B7B188;
  v38[4] = &v43;
  v38[5] = &v49;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = sub_1B7101804;
  v32[3] = &unk_1E6B7B1B0;
  v6 = (id)MEMORY[0x1BCCA2CD0](v38);
  v33 = v6;
  v34 = &v39;
  v35 = &v61;
  v36 = &v55;
  v37 = &v43;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v7, (uint64_t)v32, v8);
  if (*((_BYTE *)v40 + 24))
  {
    sub_1B7100D70((void *)v44[5], v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 0;
    if (a4 && v9)
    {
      v10 = objc_retainAutorelease(v9);
      v11 = 0;
      *a4 = v10;
    }
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0D3E3B0]);
    v13 = v56[5];
    v14 = *((unsigned int *)v62 + 6);
    v15 = (id *)(v44 + 5);
    obj = (id)v44[5];
    v10 = (id)objc_msgSend_initWithEntity_entityType_error_(v12, v16, v13, v14, &obj);
    objc_storeStrong(v15, obj);
    if (v10)
    {
      v17 = objc_alloc(MEMORY[0x1E0D3E3C8]);
      objc_msgSend_itemId(v5, v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v50[5];
      v23 = (id *)(v44 + 5);
      v30 = (id)v44[5];
      v25 = (id)objc_msgSend_initWithSourceItemIdentifier_linkedIdentifiers_error_(v17, v24, (uint64_t)v21, v22, &v30);
      objc_storeStrong(v23, v30);

      if (v25)
      {
        sub_1B70ECEBC(v10, v25, v5, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        sub_1B7100D70((void *)v44[5], v5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (a4 && v27)
          *a4 = objc_retainAutorelease(v27);

        v25 = 0;
        v11 = 0;
      }
    }
    else
    {
      sub_1B7100D70((void *)v44[5], v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26;
      v11 = 0;
      if (a4 && v26)
      {
        v25 = objc_retainAutorelease(v26);
        v11 = 0;
        *a4 = v25;
      }
    }

  }
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  return v11;
}

+ (id)_convertFromKVItemType_AutoShortcut:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v5 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1B70FF010;
  v48 = sub_1B70FF020;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1B70FF010;
  v42 = sub_1B70FF020;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_1B70FF010;
  v36 = sub_1B70FF020;
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1B710169C;
  v31[3] = &unk_1E6B7B110;
  v31[4] = &v44;
  v31[5] = &v38;
  v31[6] = &v32;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v31, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E290]);
  v9 = v45[5];
  v10 = v39[5];
  v11 = v33[5];
  v30 = 0;
  v13 = (void *)objc_msgSend_initWithPhrase_baseTemplate_templateParameterValue_error_(v8, v12, v9, v10, v11, &v30);
  v14 = v30;
  v15 = v14;
  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0D3E298]);
    objc_msgSend_itemId(v5, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    v22 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v16, v21, (uint64_t)v20, (uint64_t)&v29);
    v23 = v29;

    if (v22)
    {
      sub_1B70ECEBC(v13, v22, v5, a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v23, v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (a4 && v26)
        *a4 = objc_retainAutorelease(v26);

      v22 = 0;
      v24 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v14, v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    v24 = 0;
    if (a4 && v25)
    {
      v22 = objc_retainAutorelease(v25);
      v24 = 0;
      *a4 = v22;
    }
    v23 = v15;
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v24;
}

+ (id)_convertFromKVItemType_AppShortcut:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[9];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v5 = a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1B70FF010;
  v62 = sub_1B70FF020;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1B70FF010;
  v56 = sub_1B70FF020;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1B70FF010;
  v50 = sub_1B70FF020;
  v51 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_1B70FF010;
  v44 = sub_1B70FF020;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_1B70FF010;
  v38 = sub_1B70FF020;
  v39 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1B710158C;
  v33[3] = &unk_1E6B7B160;
  v33[4] = &v58;
  v33[5] = &v52;
  v33[6] = &v46;
  v33[7] = &v40;
  v33[8] = &v34;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v33, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E280]);
  v9 = v59[5];
  v10 = v53[5];
  v11 = v47[5];
  v12 = v41[5];
  v13 = v35[5];
  v32 = 0;
  v15 = (void *)objc_msgSend_initWithEntityTitle_entityInstanceIdentifier_entityTypeIdentifier_providerClass_entitySynonyms_error_(v8, v14, v9, v10, v11, v12, v13, &v32);
  v16 = v32;
  v17 = v16;
  if (v15)
  {
    v18 = objc_alloc(MEMORY[0x1E0D3E288]);
    objc_msgSend_itemId(v5, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    v24 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v23, (uint64_t)v22, (uint64_t)&v31);
    v25 = v31;

    if (v24)
    {
      sub_1B70ECEBC(v15, v24, v5, a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v25, v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (a4 && v28)
        *a4 = objc_retainAutorelease(v28);

      v24 = 0;
      v26 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v16, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v26 = 0;
    if (a4 && v27)
    {
      v24 = objc_retainAutorelease(v27);
      v26 = 0;
      *a4 = v24;
    }
    v25 = v17;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  return v26;
}

+ (id)_convertFromKVItemType_RadioEntity:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  _QWORD v33[9];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;

  v5 = a3;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = sub_1B70FF010;
  v60 = sub_1B70FF020;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_1B70FF010;
  v54 = sub_1B70FF020;
  v55 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1B70FF010;
  v48 = sub_1B70FF020;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1B70FF010;
  v42 = sub_1B70FF020;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1B710143C;
  v33[3] = &unk_1E6B7B160;
  v33[4] = &v56;
  v33[5] = &v50;
  v33[6] = &v44;
  v33[7] = &v38;
  v33[8] = &v34;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v33, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E438]);
  v9 = v57[5];
  v10 = v51[5];
  v11 = v45[5];
  v12 = v39[5];
  v13 = *((unsigned int *)v35 + 6);
  v32 = 0;
  v15 = (void *)objc_msgSend_initWithName_callSign_frequency_channel_signalType_error_(v8, v14, v9, v10, v11, v12, v13, &v32);
  v16 = v32;
  v17 = v16;
  if (v15)
  {
    v18 = objc_alloc(MEMORY[0x1E0D3E440]);
    objc_msgSend_itemId(v5, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    v24 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v23, (uint64_t)v22, (uint64_t)&v31);
    v25 = v31;

    if (v24)
    {
      sub_1B70ECEBC(v15, v24, v5, a4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v25, v5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (a4 && v28)
        *a4 = objc_retainAutorelease(v28);

      v24 = 0;
      v26 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v16, v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v27;
    v26 = 0;
    if (a4 && v27)
    {
      v24 = objc_retainAutorelease(v27);
      v26 = 0;
      *a4 = v24;
    }
    v25 = v17;
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v26;
}

+ (id)_convertFromKVItemType_LocationOfInterest:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  _QWORD v39[12];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;

  v5 = a3;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_1B70FF010;
  v79 = sub_1B70FF020;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_1B70FF010;
  v73 = sub_1B70FF020;
  v74 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x3032000000;
  v66 = sub_1B70FF010;
  v67 = sub_1B70FF020;
  v68 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = sub_1B70FF010;
  v61 = sub_1B70FF020;
  v62 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_1B70FF010;
  v55 = sub_1B70FF020;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_1B70FF010;
  v49 = sub_1B70FF020;
  v50 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v44[3] = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1B7101340;
  v39[3] = &unk_1E6B7B1D8;
  v39[4] = v44;
  v39[5] = &v75;
  v39[6] = &v69;
  v39[7] = &v40;
  v39[8] = &v63;
  v39[9] = &v57;
  v39[10] = &v51;
  v39[11] = &v45;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v39, v7);
  if (v41[3])
  {
    v8 = objc_alloc(MEMORY[0x1E0D3E478]);
    v9 = v64[5];
    v10 = v58[5];
    v11 = v52[5];
    v12 = v46[5];
    v38 = 0;
    v14 = (id)objc_msgSend_initWithThoroughfare_subLocality_locality_country_error_(v8, v13, v9, v10, v11, v12, &v38);
    v15 = v38;
    v16 = v15;
    if (!v14)
    {
      sub_1B7100D70(v15, v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v18 = 0;
      if (a4 && v17)
      {
        v14 = objc_retainAutorelease(v17);
        v18 = 0;
        *a4 = v14;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  v19 = objc_alloc(MEMORY[0x1E0D3E480]);
  v20 = v76[5];
  v21 = v70[5];
  v37 = v16;
  v23 = (void *)objc_msgSend_initWithPreferredName_mapItemName_address_error_(v19, v22, v20, v21, v14, &v37);
  v24 = v37;

  if (v23)
  {
    v25 = objc_alloc(MEMORY[0x1E0D3E488]);
    objc_msgSend_itemId(v5, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v24;
    v31 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v25, v30, (uint64_t)v29, (uint64_t)&v36);
    v16 = v36;

    if (v31)
    {
      sub_1B70ECEBC(v23, v31, v5, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v16, v5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (a4 && v33)
        *a4 = objc_retainAutorelease(v33);

      v31 = 0;
      v18 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v24, v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v32;
    v18 = 0;
    if (a4 && v32)
    {
      v31 = objc_retainAutorelease(v32);
      v18 = 0;
      *a4 = v31;
    }
    v16 = v24;
  }

LABEL_19:
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

  return v18;
}

+ (id)_convertFromKVItemType_CalendarEvent:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B70FF010;
  v41 = sub_1B70FF020;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B70FF010;
  v35 = sub_1B70FF020;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B71012C8;
  v30[3] = &unk_1E6B7B200;
  v30[4] = &v37;
  v30[5] = &v31;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v30, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E2A0]);
  v9 = v38[5];
  v10 = v32[5];
  v29 = 0;
  v12 = (void *)objc_msgSend_initWithTitle_locationName_error_(v8, v11, v9, v10, &v29);
  v13 = v29;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0D3E2A8]);
    objc_msgSend_itemId(v5, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v21 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v15, v20, (uint64_t)v19, (uint64_t)&v28);
    v22 = v28;

    if (v21)
    {
      sub_1B70ECEBC(v12, v21, v5, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v22, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

      v21 = 0;
      v23 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v13, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v23 = 0;
    if (a4 && v24)
    {
      v21 = objc_retainAutorelease(v24);
      v23 = 0;
      *a4 = v21;
    }
    v22 = v14;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

+ (id)_convertFromKVItemType_Fitness:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v5 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_1B70FF010;
  v34 = sub_1B70FF020;
  v35 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1B710126C;
  v29[3] = &unk_1E6B7B228;
  v29[4] = &v30;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v29, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E310]);
  v9 = v31[5];
  v28 = 0;
  v11 = (void *)objc_msgSend_initWithName_error_(v8, v10, v9, (uint64_t)&v28);
  v12 = v28;
  v13 = v12;
  if (v11)
  {
    v14 = objc_alloc(MEMORY[0x1E0D3E318]);
    objc_msgSend_itemId(v5, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v13;
    v20 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v14, v19, (uint64_t)v18, (uint64_t)&v27);
    v21 = v27;

    if (v20)
    {
      sub_1B70ECEBC(v11, v20, v5, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v21, v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (a4 && v24)
        *a4 = objc_retainAutorelease(v24);

      v20 = 0;
      v22 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v12, v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v23;
    v22 = 0;
    if (a4 && v23)
    {
      v20 = objc_retainAutorelease(v23);
      v22 = 0;
      *a4 = v20;
    }
    v21 = v13;
  }

  _Block_object_dispose(&v30, 8);
  return v22;
}

+ (id)_convertFromKVItemType_Health:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B70FF010;
  v41 = sub_1B70FF020;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B70FF010;
  v35 = sub_1B70FF020;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B71011F4;
  v30[3] = &unk_1E6B7B200;
  v30[4] = &v37;
  v30[5] = &v31;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v30, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E320]);
  v9 = v38[5];
  v10 = v32[5];
  v29 = 0;
  v12 = (void *)objc_msgSend_initWithName_nickname_error_(v8, v11, v9, v10, &v29);
  v13 = v29;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0D3E328]);
    objc_msgSend_itemId(v5, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v21 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v15, v20, (uint64_t)v19, (uint64_t)&v28);
    v22 = v28;

    if (v21)
    {
      sub_1B70ECEBC(v12, v21, v5, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v22, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

      v21 = 0;
      v23 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v13, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v23 = 0;
    if (a4 && v24)
    {
      v21 = objc_retainAutorelease(v24);
      v23 = 0;
      *a4 = v21;
    }
    v22 = v14;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

+ (id)_convertFromKVItemType_UserAccount:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B70FF010;
  v41 = sub_1B70FF020;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B70FF010;
  v35 = sub_1B70FF020;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B710117C;
  v30[3] = &unk_1E6B7B200;
  v30[4] = &v37;
  v30[5] = &v31;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v30, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E4C8]);
  v9 = v38[5];
  v10 = v32[5];
  v29 = 0;
  v12 = (void *)objc_msgSend_initWithUserName_givenName_error_(v8, v11, v9, v10, &v29);
  v13 = v29;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0D3E4D0]);
    objc_msgSend_itemId(v5, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v21 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v15, v20, (uint64_t)v19, (uint64_t)&v28);
    v22 = v28;

    if (v21)
    {
      sub_1B70ECEBC(v12, v21, v5, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v22, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

      v21 = 0;
      v23 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v13, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v23 = 0;
    if (a4 && v24)
    {
      v21 = objc_retainAutorelease(v24);
      v23 = 0;
      *a4 = v21;
    }
    v22 = v14;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

+ (id)_convertFromKVItemType_FindMy:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  _QWORD v35[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v5 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_1B70FF010;
  v52 = sub_1B70FF020;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = sub_1B70FF010;
  v46 = sub_1B70FF020;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_1B70FF010;
  v40 = sub_1B70FF020;
  v41 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = sub_1B71010E8;
  v35[3] = &unk_1E6B7B110;
  v35[4] = &v48;
  v35[5] = &v42;
  v35[6] = &v36;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v35, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E308]);
  v9 = v43[5];
  v10 = v37[5];
  v34 = 0;
  v12 = (void *)objc_msgSend_initWithFirstName_lastName_error_(v8, v11, v9, v10, &v34);
  v13 = v34;
  v14 = objc_alloc(MEMORY[0x1E0D3E2F8]);
  v15 = v49[5];
  v33 = v13;
  v17 = (void *)objc_msgSend_initWithName_owner_error_(v14, v16, v15, (uint64_t)v12, &v33);
  v18 = v33;

  if (v17)
  {
    v19 = objc_alloc(MEMORY[0x1E0D3E300]);
    objc_msgSend_itemId(v5, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    v25 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v19, v24, (uint64_t)v23, (uint64_t)&v32);
    v26 = v32;

    if (v25)
    {
      sub_1B70ECEBC(v17, v25, v5, a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v26, v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a4 && v29)
        *a4 = objc_retainAutorelease(v29);

      v25 = 0;
      v27 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v18, v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v28;
    v27 = 0;
    if (a4 && v28)
    {
      v25 = objc_retainAutorelease(v28);
      v27 = 0;
      *a4 = v25;
    }
    v26 = v18;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v27;
}

+ (id)_convertFromKVItemType_LearnedContact:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_1B70FF010;
  v41 = sub_1B70FF020;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_1B70FF010;
  v35 = sub_1B70FF020;
  v36 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1B7101070;
  v30[3] = &unk_1E6B7B200;
  v30[4] = &v31;
  v30[5] = &v37;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v30, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E490]);
  v9 = v38[5];
  v10 = v32[5];
  v29 = 0;
  v12 = (void *)objc_msgSend_initWithUserPhrasedName_suggestedContactId_error_(v8, v11, v9, v10, &v29);
  v13 = v29;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc(MEMORY[0x1E0D3E498]);
    objc_msgSend_itemId(v5, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v14;
    v21 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v15, v20, (uint64_t)v19, (uint64_t)&v28);
    v22 = v28;

    if (v21)
    {
      sub_1B70ECEBC(v12, v21, v5, a4);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v22, v5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

      v21 = 0;
      v23 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v13, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v23 = 0;
    if (a4 && v24)
    {
      v21 = objc_retainAutorelease(v24);
      v23 = 0;
      *a4 = v21;
    }
    v22 = v14;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

+ (id)_convertFromKVItemType_LearnedMediaEntity:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  _QWORD v34[10];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;

  v5 = a3;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1B70FF010;
  v69 = sub_1B70FF020;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = sub_1B70FF010;
  v63 = sub_1B70FF020;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = sub_1B70FF010;
  v57 = sub_1B70FF020;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = sub_1B70FF010;
  v51 = sub_1B70FF020;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_1B70FF010;
  v45 = sub_1B70FF020;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1B70FF010;
  v39 = sub_1B70FF020;
  v40 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1B7100F94;
  v34[3] = &unk_1E6B7B250;
  v34[4] = &v65;
  v34[5] = &v59;
  v34[6] = &v53;
  v34[7] = &v41;
  v34[8] = &v47;
  v34[9] = &v35;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v34, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E4A0]);
  v9 = v66[5];
  v10 = v60[5];
  v11 = v54[5];
  v12 = v48[5];
  v13 = v42[5];
  v14 = v36[5];
  v33 = 0;
  v16 = (void *)objc_msgSend_initWithUserPhrasedSongName_userPhrasedArtistName_userPhrasedAlbumName_userPhrasedEntityName_userPhrasedVersion_suggestedAdamId_error_(v8, v15, v9, v10, v11, v12, v13, v14, &v33);
  v17 = v33;
  v18 = v17;
  if (v16)
  {
    v19 = objc_alloc(MEMORY[0x1E0D3E4A8]);
    objc_msgSend_itemId(v5, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v18;
    v25 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v19, v24, (uint64_t)v23, (uint64_t)&v32);
    v26 = v32;

    if (v25)
    {
      sub_1B70ECEBC(v16, v25, v5, a4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1B7100D70(v26, v5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a4 && v29)
        *a4 = objc_retainAutorelease(v29);

      v25 = 0;
      v27 = 0;
    }
  }
  else
  {
    sub_1B7100D70(v17, v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v28;
    v27 = 0;
    if (a4 && v28)
    {
      v25 = objc_retainAutorelease(v28);
      v27 = 0;
      *a4 = v25;
    }
    v26 = v18;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

  return v27;
}

+ (id)_convertFromKVItemType_AppIntentsEntity:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  const char *v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[10];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;

  v5 = a3;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = sub_1B70FF010;
  v80 = sub_1B70FF020;
  v81 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = sub_1B70FF010;
  v74 = sub_1B70FF020;
  v75 = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = sub_1B70FF010;
  v68 = sub_1B70FF020;
  v69 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1B70FF010;
  v62 = sub_1B70FF020;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_1B70FF010;
  v56 = sub_1B70FF020;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = sub_1B70FF010;
  v50 = sub_1B70FF020;
  v51 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1B7100E4C;
  v45[3] = &unk_1E6B7B250;
  v45[4] = &v76;
  v45[5] = &v52;
  v45[6] = &v46;
  v45[7] = &v70;
  v45[8] = &v64;
  v45[9] = &v58;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v45, v7);
  v8 = objc_alloc(MEMORY[0x1E0D3E1E8]);
  v9 = v71[5];
  v10 = v65[5];
  v11 = v59[5];
  v44 = 0;
  v13 = (void *)objc_msgSend_initWithTitle_subtitle_synonyms_error_(v8, v12, v9, v10, v11, &v44);
  v14 = v44;
  v15 = v14;
  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0D3E1F0]);
    v17 = v53[5];
    v18 = v47[5];
    v43 = v15;
    v20 = (id)objc_msgSend_initWithName_synonyms_error_(v16, v19, v17, v18, &v43);
    v21 = v43;

    if (v20)
    {
      v22 = objc_alloc(MEMORY[0x1E0D3E260]);
      v23 = v77[5];
      v42 = v21;
      v25 = (id)objc_msgSend_initWithTypeIdentifier_displayRepresentation_typeDisplayRepresentation_error_(v22, v24, v23, (uint64_t)v13, v20, &v42);
      v26 = v42;

      if (v25)
      {
        v27 = objc_alloc(MEMORY[0x1E0D3E268]);
        objc_msgSend_itemId(v5, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v26;
        v33 = (id)objc_msgSend_initWithSourceItemIdentifier_rank_error_(v27, v32, (uint64_t)v31, 0, &v41);
        v21 = v41;

        if (v33)
        {
          sub_1B70ECEBC(v25, v33, v5, a4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          sub_1B7100D70(v21, v5);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (a4 && v38)
            *a4 = objc_retainAutorelease(v38);

          v33 = 0;
          v34 = 0;
        }
      }
      else
      {
        sub_1B7100D70(v26, v5);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v37;
        v34 = 0;
        if (a4 && v37)
        {
          v33 = objc_retainAutorelease(v37);
          v34 = 0;
          *a4 = v33;
        }
        v21 = v26;
      }

    }
    else
    {
      sub_1B7100D70(v21, v5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v36;
      v34 = 0;
      if (a4 && v36)
      {
        v25 = objc_retainAutorelease(v36);
        v34 = 0;
        *a4 = v25;
      }
    }

    v15 = v21;
  }
  else
  {
    sub_1B7100D70(v14, v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v35;
    v34 = 0;
    if (a4 && v35)
    {
      v20 = objc_retainAutorelease(v35);
      v34 = 0;
      *a4 = v20;
    }
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  return v34;
}

+ (id)_convertFromKVItemType_AppIntentsEnum:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t (**v5)(_QWORD);
  const char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  const char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  const char *v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id *v25;
  const char *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v36;
  id v37;
  id obj;
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *v43;
  _QWORD *v44;
  uint64_t *v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[10];
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[5];
  id v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;

  v4 = a3;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = sub_1B70FF010;
  v90 = sub_1B70FF020;
  v91 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_1B70FF010;
  v84 = sub_1B70FF020;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = sub_1B70FF010;
  v78 = sub_1B70FF020;
  v79 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_1B70FF010;
  v72 = sub_1B70FF020;
  v73 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_1B70FF010;
  v66[4] = sub_1B70FF020;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_1B70FF010;
  v64[4] = sub_1B70FF020;
  v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_1B70FF010;
  v62[4] = sub_1B70FF020;
  v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_1B70FF010;
  v60[4] = sub_1B70FF020;
  v61 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_1B70FF010;
  v58 = sub_1B70FF020;
  v59 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = sub_1B71009B4;
  v49[3] = &unk_1E6B7B278;
  v49[4] = v66;
  v49[5] = v64;
  v49[6] = v62;
  v49[7] = v60;
  v49[8] = &v54;
  v49[9] = &v68;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1B7100B74;
  v39[3] = &unk_1E6B7B2A0;
  v41 = &v86;
  v42 = &v80;
  v43 = &v74;
  v44 = v66;
  v5 = (uint64_t (**)(_QWORD))(id)MEMORY[0x1BCCA2CD0](v49);
  v40 = v5;
  v45 = &v50;
  v46 = v64;
  v47 = v62;
  v48 = v60;
  objc_msgSend_enumerateFieldsUsingBlock_(v4, v6, (uint64_t)v39, v7);
  if (*((_BYTE *)v51 + 24) || (v5[2](v5) & 1) == 0)
  {
    sub_1B7100D70((void *)v55[5], v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v29;
    v28 = 0;
    if (a4 && v29)
    {
      v13 = objc_retainAutorelease(v29);
      v28 = 0;
      *a4 = v13;
    }
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D3E208]);
    v9 = v81[5];
    v10 = v75[5];
    v11 = (id *)(v55 + 5);
    obj = (id)v55[5];
    v13 = (id)objc_msgSend_initWithName_synonyms_error_(v8, v12, v9, v10, &obj);
    objc_storeStrong(v11, obj);
    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0D3E270]);
      v15 = v87[5];
      v16 = v69[5];
      v17 = (id *)(v55 + 5);
      v37 = (id)v55[5];
      v19 = (id)objc_msgSend_initWithTypeIdentifier_typeDisplayRepresentation_cases_error_(v14, v18, v15, (uint64_t)v13, v16, &v37);
      objc_storeStrong(v17, v37);
      if (v19)
      {
        v20 = objc_alloc(MEMORY[0x1E0D3E278]);
        objc_msgSend_itemId(v4, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (id *)(v55 + 5);
        v36 = (id)v55[5];
        v27 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v20, v26, (uint64_t)v24, (uint64_t)&v36);
        objc_storeStrong(v25, v36);

        if (v27)
        {
          sub_1B70ECEBC(v19, v27, v4, a4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          sub_1B7100D70((void *)v55[5], v4);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (a4 && v32)
            *a4 = objc_retainAutorelease(v32);

          v27 = 0;
          v28 = 0;
        }
      }
      else
      {
        sub_1B7100D70((void *)v55[5], v4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v31;
        v28 = 0;
        if (a4 && v31)
        {
          v27 = objc_retainAutorelease(v31);
          v28 = 0;
          *a4 = v27;
        }
      }

    }
    else
    {
      sub_1B7100D70((void *)v55[5], v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v30;
      v28 = 0;
      if (a4 && v30)
      {
        v19 = objc_retainAutorelease(v30);
        v28 = 0;
        *a4 = v19;
      }
    }

  }
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

  return v28;
}

+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  char v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  KVItemBuilder *v47;
  const char *v48;
  char v49;
  void *v50;
  id *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v60;
  void *v61;
  KVItemBuilder *v62;
  id obj;
  _QWORD v64[4];
  id v65;
  KVItemBuilder *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[4];
  KVItemBuilder *v79;
  uint64_t *v80;
  uint64_t *v81;
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  id v87;
  uint64_t v88;
  id *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;

  v5 = a3;
  objc_msgSend_content(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  v14 = objc_msgSend_itemType(v10, v11, v12, v13);
  v15 = (void *)objc_opt_class();
  v18 = objc_msgSend_itemTypeFromCascadeItemType_(v15, v16, v14, v17);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_metaContent(v5, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sourceItemIdentifier(v22, v23, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_sharedIdentifier(v5, v19, v20, v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_unsignedLongLongValue(v28, v29, v30, v31);
    objc_msgSend_stringWithFormat_(v27, v33, (uint64_t)CFSTR("%llx"), v34, v32);
    v26 = objc_claimAutoreleasedReturnValue();

    v22 = 0;
  }
  v88 = 0;
  v89 = (id *)&v88;
  v90 = 0x3032000000;
  v91 = sub_1B70FF010;
  v92 = sub_1B70FF020;
  v93 = 0;
  v87 = 0;
  v61 = (void *)v26;
  v62 = objc_alloc_init(KVItemBuilder);
  objc_msgSend_setItemType_itemId_error_(v62, v35, v18, v26, &v87);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v93, v87);

  if (v36)
  {
    v60 = v9;
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 0;
    v37 = MEMORY[0x1E0C809B0];
    v38 = v22;
    if (v22)
    {
      v82 = 0;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = sub_1B70FF1C8;
      v78[3] = &unk_1E6B7B2C8;
      v80 = &v83;
      v79 = v62;
      v81 = &v88;
      v40 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v22, v39, (uint64_t)&v82, (uint64_t)v78);
      v41 = v82;
      v42 = v41;
      if ((v40 & 1) == 0)
      {
        sub_1B70FF350(v41, v5);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (!a4)
          goto LABEL_9;
        goto LABEL_14;
      }
      if (*((_BYTE *)v84 + 24))
      {
        sub_1B70FF028(v89[5], v5);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (!a4)
        {
LABEL_9:
          v9 = v60;
LABEL_16:

          v45 = 0;
LABEL_37:
          _Block_object_dispose(&v83, 8);
          goto LABEL_38;
        }
LABEL_14:
        v9 = v60;
        if (v43)
        {
          v43 = objc_retainAutorelease(v43);
          *a4 = v43;
        }
        goto LABEL_16;
      }

      v38 = v42;
      v37 = MEMORY[0x1E0C809B0];
    }
    v72 = 0;
    v73 = &v72;
    v74 = 0x3032000000;
    v75 = sub_1B70FF010;
    v76 = sub_1B70FF020;
    v77 = 0;
    v70 = v18;
    v71 = v38;
    v64[0] = v37;
    v64[1] = 3221225472;
    v64[2] = sub_1B70FF42C;
    v64[3] = &unk_1E6B7B2F0;
    v67 = &v83;
    v68 = &v72;
    v46 = v5;
    v65 = v46;
    v47 = v62;
    v66 = v47;
    v69 = &v88;
    v49 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v60, v48, (uint64_t)&v71, (uint64_t)v64);
    v42 = v71;

    if ((v49 & 1) != 0)
    {
      v38 = v22;
      if (!*((_BYTE *)v84 + 24))
      {
LABEL_23:

        v51 = v89;
        obj = v89[5];
        objc_msgSend_buildItemWithError_(v47, v52, (uint64_t)&obj, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v51 + 5, obj);
        if (v54)
        {
          v55 = v54;
          v45 = v55;
        }
        else
        {
          sub_1B70FF028(v89[5], v46);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          if (a4 && v57)
            *a4 = objc_retainAutorelease(v57);

          v55 = 0;
          v45 = 0;
        }
        v9 = v60;
        goto LABEL_36;
      }
      v50 = (void *)v73[5];
      if (v50)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v50);
        goto LABEL_23;
      }
      sub_1B70FF028(v89[5], v46);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_34;
    }
    else
    {
      sub_1B70FF350(v42, v46);
      v56 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
      {
LABEL_34:
        v9 = v60;
        v38 = v22;
LABEL_35:

        v45 = 0;
        v55 = v65;
LABEL_36:

        _Block_object_dispose(&v72, 8);
        goto LABEL_37;
      }
    }
    v9 = v60;
    v38 = v22;
    if (v56)
    {
      v56 = objc_retainAutorelease(v56);
      *a4 = v56;
    }
    goto LABEL_35;
  }
  sub_1B70FF028(v89[5], v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v44;
  v45 = 0;
  v38 = v22;
  if (a4 && v44)
  {
    v42 = objc_retainAutorelease(v44);
    v45 = 0;
    *a4 = v42;
  }
LABEL_38:

  _Block_object_dispose(&v88, 8);
  return v45;
}

@end
