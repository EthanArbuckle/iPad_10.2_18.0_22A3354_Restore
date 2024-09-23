@implementation LNIntentsValueType(CATSupport)

- (const)cat_dialogType
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "typeIdentifier");
  if (v1 > 0xE)
    return CFSTR("dialog.Person");
  else
    return off_1E45DD000[v1];
}

- (id)cat_value:()CATSupport
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v34[3];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(a1, "typeIdentifier"))
  {
    case 3:
      v34[0] = CFSTR("familyName");
      objc_msgSend(v4, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = v6;
        else
          v7 = 0;
      }
      else
      {
        v7 = 0;
      }
      v16 = v7;

      objc_msgSend(v16, "nameComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "familyName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v18;
      v34[1] = CFSTR("givenName");
      objc_msgSend(v4, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
      }
      else
      {
        v20 = 0;
      }
      v22 = v20;

      objc_msgSend(v22, "nameComponents");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "givenName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v24;
      v34[2] = CFSTR("nickname");
      objc_msgSend(v4, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v25;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v29 = v26;

      objc_msgSend(v29, "nameComponents");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "nickname");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_48;
    case 4:
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_11;
      goto LABEL_14;
    case 7:
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_11;
      goto LABEL_14;
    case 8:
      objc_msgSend(v4, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_11:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
LABEL_14:
        v9 = 0;
      }
      v10 = v9;

      objc_msgSend(v10, "title");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    case 12:
      objc_msgSend(v4, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
      }
      else
      {
        v13 = 0;
      }
      v21 = v13;

      objc_msgSend(v21, "filename");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v5 = v17;
      }
      else
      {
        objc_msgSend(v4, "value");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v27;
          else
            v28 = 0;
        }
        else
        {
          v28 = 0;
        }
        v32 = v28;

        objc_msgSend(v32, "fileURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "lastPathComponent");
        v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

      }
      break;
    case 13:
      objc_msgSend(v4, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
      }
      else
      {
        v15 = 0;
      }
      v10 = v15;

      objc_msgSend(v10, "name");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_34:
      v5 = (id)v11;

      break;
    default:
      break;
  }

  return v5;
}

- (uint64_t)cat_keyPath
{
  objc_msgSend(a1, "typeIdentifier");
  return 0;
}

@end
