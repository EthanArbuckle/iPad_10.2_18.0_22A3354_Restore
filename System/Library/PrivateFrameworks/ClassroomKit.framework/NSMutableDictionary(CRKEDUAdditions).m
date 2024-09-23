@implementation NSMutableDictionary(CRKEDUAdditions)

- (id)crk_validateAndRemoveNonZeroLengthStringWithKey:()CRKEDUAdditions isRequired:outError:
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "removeObjectForKey:", v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a5)
      {
        v10 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "crk_badFieldTypeErrorWithField:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;
      goto LABEL_12;
    }
  }
  v10 = 0;
  if (a5 && a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = 0;
    *a5 = v11;
  }
LABEL_12:

  return v10;
}

- (id)crk_validateAndRemoveObjectOfClass:()CRKEDUAdditions withKey:isRequired:outError:
{
  id v9;
  void *v10;
  id v11;
  void *v12;

  v9 = a4;
  objc_msgSend(a1, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "removeObjectForKey:", v9);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      goto LABEL_11;
    }
    if (!a6)
    {
      v11 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "crk_badFieldTypeErrorWithField:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = 0;
    *a6 = v12;
    goto LABEL_11;
  }
  v11 = 0;
  if (a6 && a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

- (id)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:allowZeroLengthString:outError:
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  objc_msgSend(a1, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v19 = 0;
    if (!a7 || !a5)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x24BDD1540], "crk_missingFieldErrorWithField:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v19 = 0;
    *a7 = v20;
    goto LABEL_25;
  }
  objc_msgSend(a1, "removeObjectForKey:", v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a7)
    {
LABEL_24:
      v19 = 0;
      goto LABEL_25;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "crk_badFieldTypeErrorWithField:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v22 = a7;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((a6 & 1) != 0)
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v18, "length"))
            continue;
        }
        if (v22)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "crk_badFieldTypeErrorWithField:", v11);
          *v22 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_24;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
        continue;
      break;
    }
  }

  v19 = v13;
LABEL_25:

  return v19;
}

- (uint64_t)crk_validateAndRemoveArrayOfClass:()CRKEDUAdditions withKey:isRequired:outError:
{
  return objc_msgSend(a1, "crk_validateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", a3, a4, a5, 1, a6);
}

@end
