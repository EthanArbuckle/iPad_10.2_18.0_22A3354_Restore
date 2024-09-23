@implementation GEOComposedRouteAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GEOComposedRoute");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityTransitArtworkText
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[GEOComposedRouteAccessibility routePlanningArtworks](self, "routePlanningArtworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityTransitArtworkTextForDataList:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_accessibilityTransitArtworkTextForDataList:(id)a3
{
  void *v3;
  char **p_data;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  objc_class *v19;
  uint64_t v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  const __CFString *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = a3;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v3 = 0;
  if (v36)
  {
    p_data = &CFSTR("GeoServices Accessibility Bundle").data;
    v35 = *(_QWORD *)v54;
    v5 = CFSTR("MKServerFormattedStringParameters");
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v54 != v35)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v37 = v6;
        v8 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v6);
        if (objc_msgSend(v3, "length", v32, v33))
        {
          accessibilityLocalizedString(CFSTR("TRANSIT_ARTWORK_SEPARATOR"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = CFSTR("__AXStringForVariablesSentinel");
          __AXStringForVariables();
          v9 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v9;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v39 = v8;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          if (v40)
          {
            v10 = *(_QWORD *)v50;
            v38 = *(_QWORD *)v50;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v50 != v10)
                  objc_enumerationMutation(v39);
                v41 = v11;
                v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v47 = 0u;
                  v48 = 0u;
                  v45 = 0u;
                  v46 = 0u;
                  v44 = v12;
                  v13 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                  if (v13)
                  {
                    v14 = v13;
                    v15 = *(_QWORD *)v46;
                    do
                    {
                      for (i = 0; i != v14; ++i)
                      {
                        if (*(_QWORD *)v46 != v15)
                          objc_enumerationMutation(v44);
                        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                        if (objc_msgSend(v17, "conformsToProtocol:", p_data[332], v32))
                        {
                          objc_msgSend(v17, "accessibilityText");
                          v18 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!objc_msgSend(v18, "length") && objc_msgSend(v17, "artworkSourceType") == 3)
                          {
                            v19 = (objc_class *)MEMORY[0x23490FDB8](v5);
                            v20 = MEMORY[0x23490FDB8](CFSTR("MKServerFormattedString"));
                            if (v19)
                            {
                              v21 = (objc_class *)v20;
                              if (v20)
                              {
                                v42 = (void *)objc_msgSend([v19 alloc], "initWithInstructionsDistanceDetailLevel:variableOverrides:", 0, 0);
                                v22 = [v21 alloc];
                                objc_msgSend(v17, "textDataSource");
                                v23 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v23, "text");
                                v43 = v3;
                                v24 = (void *)objc_claimAutoreleasedReturnValue();
                                v25 = (void *)objc_msgSend(v22, "initWithGeoServerString:parameters:", v24, v42);

                                objc_msgSend(v25, "multiPartAttributedStringWithAttributes:", MEMORY[0x24BDBD1B8]);
                                v26 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v26, "attributedString");
                                v27 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v27, "string");
                                v28 = v5;
                                v29 = objc_claimAutoreleasedReturnValue();

                                v3 = v43;
                                p_data = (char **)(CFSTR("GeoServices Accessibility Bundle") + 16);

                                v18 = (void *)v29;
                                v5 = v28;
                              }
                            }
                          }
                          if (objc_msgSend(v18, "length"))
                          {
                            v32 = v18;
                            v33 = CFSTR("__AXStringForVariablesSentinel");
                            __AXStringForVariables();
                            v30 = (void *)objc_claimAutoreleasedReturnValue();

                            if (objc_msgSend(v17, "hasRoutingIncidentBadge"))
                            {
                              accessibilityLocalizedString(CFSTR("TRANSIT_INCIDENT"));
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v33 = CFSTR("__AXStringForVariablesSentinel");
                              __AXStringForVariables();
                              v3 = (void *)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v3 = v30;
                            }
                          }

                        }
                        else
                        {
                          v32 = v17;
                          _AXAssert();
                        }
                      }
                      v14 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
                    }
                    while (v14);
                  }

                  v10 = v38;
                }
                else
                {
                  v32 = v12;
                  _AXAssert();
                }
                v11 = v41 + 1;
              }
              while (v41 + 1 != v40);
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
            }
            while (v40);
          }

        }
        else
        {
          v32 = v8;
          _AXAssert();
        }
        v6 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v36);
  }

  return v3;
}

@end
