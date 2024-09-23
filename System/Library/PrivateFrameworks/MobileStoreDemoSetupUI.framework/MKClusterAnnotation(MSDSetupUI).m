@implementation MKClusterAnnotation(MSDSetupUI)

- (uint64_t)isSameCoordinate
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "memberAnnotations", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_16;
        objc_msgSend(v7, "storeInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "storeLocation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_15;
        if (!v4)
          v4 = v9;
        objc_msgSend(v4, "coordinate");
        v11 = v10;
        objc_msgSend(v9, "coordinate");
        if (v11 != v12 || (objc_msgSend(v4, "coordinate"), v14 = v13, objc_msgSend(v9, "coordinate"), v14 != v15))
        {
LABEL_15:

LABEL_16:
          v16 = 0;
          goto LABEL_18;
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 1;
      if (v3)
        continue;
      break;
    }
  }
  else
  {
    v4 = 0;
    v16 = 1;
  }
LABEL_18:

  return v16;
}

- (BOOL)isInCloseProximity
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  double v19;
  BOOL v21;
  void *v22;

  objc_msgSend(a1, "memberAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 >= 2)
  {
    v5 = 0;
    v4 = 0;
    v6 = v3 - 1;
    v7 = 1;
    v8 = 0x24F47C000uLL;
    while (1)
    {
      objc_msgSend(a1, "memberAnnotations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v4;
        v22 = v10;
        objc_msgSend(v10, "storeInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "storeLocation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v5;
        if (v12 && v3 > v5)
        {
          for (i = v7; v3 > i; ++i)
          {
            objc_msgSend(a1, "memberAnnotations");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectAtIndex:", i);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v8;
              objc_msgSend(v15, "storeInfo");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "storeLocation");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
              {
                objc_msgSend(v12, "distanceFromLocation:", v18);
                if (v19 > 3220.0)
                {

                  return v21;
                }
              }

              v8 = v16;
            }

          }
        }

        v6 = v3 - 1;
      }
      else
      {

        ++v5;
      }
      v4 = v6 <= v5;
      ++v7;
      if (v5 == v6)
        return v4;
    }
  }
  return 1;
}

@end
