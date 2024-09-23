@implementation CKSpotlightQueryResultUtilities

+ (id)contactForResult:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "isFromMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D35868], "me");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cnContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "authorAddresses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchCNContactForHandleWithID:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (CLLocationCoordinate2D)coordinateForResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double (*v36)(uint64_t, double, double);
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double (*v43)(uint64_t, double, double);
  void *v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  CLLocationCoordinate2D result;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (coordinateForResult___pred_CLLocationCoordinate2DIsValidCoreLocation != -1)
    dispatch_once(&coordinateForResult___pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_365_1);
  if (coordinateForResult___pred_CLLocationCoordinate2DMakeCoreLocation != -1)
    dispatch_once(&coordinateForResult___pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_369_1);
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentURL");
  v6 = objc_claimAutoreleasedReturnValue();

  v53 = (void *)v6;
  v54 = v3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 8, 0, v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v7, &v65);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v65;
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v8, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "urlAddresses");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v62 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        }
        while (v14);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }
  if (__kCLLocationCoordinate2DInvalid_once_0 != -1)
    dispatch_once(&__kCLLocationCoordinate2DInvalid_once_0, &__block_literal_global_387_1);
  v20 = *((double *)&__kCLLocationCoordinate2DInvalid___kCLLocationCoordinate2DInvalid_0 + 1);
  v19 = *(double *)&__kCLLocationCoordinate2DInvalid___kCLLocationCoordinate2DInvalid_0;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v21 = v18;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (!v22)
    goto LABEL_41;
  v23 = v22;
  v24 = *(_QWORD *)v58;
  v55 = v21;
  while (2)
  {
    for (j = 0; j != v23; ++j)
    {
      if (*(_QWORD *)v58 != v24)
        objc_enumerationMutation(v21);
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j), v53);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "host");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "isEqualToString:", CFSTR("maps.apple.com")))
      {
        objc_msgSend(v26, "queryParameters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("sll"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          v31 = v29;
        }
        else
        {
          objc_msgSend(v28, "objectForKey:", CFSTR("ll"));
          v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        v32 = v31;

        objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(","));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count") == 2)
        {
          v36 = (double (*)(uint64_t, double, double))coordinateForResult___CLLocationCoordinate2DMake;
          objc_msgSend(v33, "objectAtIndex:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "doubleValue");
          v39 = v38;
          objc_msgSend(v33, "objectAtIndex:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v35, "doubleValue");
          v19 = v36(v40, v39, v41);
          v20 = v42;
LABEL_40:

          v21 = v55;
          goto LABEL_41;
        }
      }
      else
      {
        if (!objc_msgSend(v27, "isEqualToString:", CFSTR("maps.google.com")))
          goto LABEL_35;
        objc_msgSend(v26, "tuQueryParameters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("q"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsSeparatedByString:", CFSTR(" "));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count"))
        {
          v34 = v23;
          objc_msgSend(v33, "objectAtIndex:", 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "componentsSeparatedByString:", CFSTR(","));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v35, "count") == 2)
          {
            v43 = (double (*)(uint64_t, double, double))coordinateForResult___CLLocationCoordinate2DMake;
            objc_msgSend(v35, "objectAtIndex:", 0);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "doubleValue");
            v46 = v45;
            objc_msgSend(v35, "objectAtIndex:", 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "doubleValue");
            v19 = v43(v48, v46, v49);
            v20 = v50;

            v37 = v56;
            goto LABEL_40;
          }

          v23 = v34;
          v21 = v55;
        }
      }

LABEL_35:
    }
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v23)
      continue;
    break;
  }
LABEL_41:

  v51 = v19;
  v52 = v20;
  result.longitude = v52;
  result.latitude = v51;
  return result;
}

uint64_t __55__CKSpotlightQueryResultUtilities_coordinateForResult___block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C24]("CLLocationCoordinate2DIsValid", CFSTR("CoreLocation"));
  coordinateForResult___CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__55__CKSpotlightQueryResultUtilities_coordinateForResult___block_invoke_2()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("CLLocationCoordinate2DMake", CFSTR("CoreLocation"));
  coordinateForResult___CLLocationCoordinate2DMake = result;
  return result;
}

+ (id)indexItemTypeForResult:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "indexItemTypeForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)indexItemTypeForItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)indexDomainForResult:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)indexDomainForItem:(id)a3
{
  return (id)objc_msgSend(a3, "domainIdentifier");
}

@end
