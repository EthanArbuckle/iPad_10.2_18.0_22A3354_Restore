@implementation UIView(ClockKitUI)

- (void)_updateFilter:()ClockKitUI amount:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t j;
  void *v26;
  uint64_t k;
  float v28;
  void *v29;
  void *v30;
  float v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  filterNamesToIndicesMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = 0;
  v52 = 0;
  objc_msgSend(a1, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count") + 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_storeStrong(&v50 + objc_msgSend(v17, "unsignedIntegerValue"), v15);
        else
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v12);
  }

  if (!a4)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      v20 = a2;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setName:", CFSTR("CLKUITritiumViewFilterTypeBrightnessName"));
      v32 = v20;
      v34 = 0;
      v33 = 0;
      v35 = 0;
      v36 = v20;
      v38 = 0;
      v37 = 0;
      v39 = 0;
      v40 = v20;
      v42 = 0;
      v41 = 0;
      v43 = 0;
      v44 = 1065353216;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setValue:forKey:", v22, CFSTR("inputColorMatrix"));

      v19 = v50;
      v50 = v21;
    }
    else
    {
      v19 = v50;
      v50 = 0;
    }
    goto LABEL_22;
  }
  if (a4 == 1)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setName:", CFSTR("CLKUITritiumViewFilterTypeSaturationName"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setValue:forKey:", v24, CFSTR("inputAmount"));

      v19 = v51;
      v51 = v23;
    }
    else
    {
      v19 = v51;
      v51 = 0;
    }
LABEL_22:
    v18 = a1;
LABEL_23:

    goto LABEL_24;
  }
  v18 = a1;
  if (a4 == 2)
  {
    if (fabs(a2 + -1.0) >= 0.00000011920929)
    {
      v28 = a2;
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BF0]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setName:", CFSTR("CLKUIViewFilterTypeNameTritiumTapThrough"));
      v32 = v28;
      v34 = 0;
      v33 = 0;
      v35 = 0;
      v36 = v28;
      v38 = 0;
      v37 = 0;
      v39 = 0;
      v40 = v28;
      v42 = 0;
      v41 = 0;
      v43 = 0;
      v44 = 1065353216;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setValue:forKey:", v30, CFSTR("inputColorMatrix"));

      v19 = v52;
      v52 = v29;
    }
    else
    {
      v19 = v52;
      v52 = 0;
    }
    goto LABEL_23;
  }
LABEL_24:
  for (j = 0; j != 24; j += 8)
  {
    if (*(void **)((char *)&v50 + j))
      objc_msgSend(v9, "addObject:");
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(v18, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFilters:", v9);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  for (k = 16; k != -8; k -= 8)

}

- (uint64_t)setTritiumBrightness:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 0);
}

- (uint64_t)setTritiumSaturation:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 1);
}

- (uint64_t)setTritiumTapThroughFilter:()ClockKitUI
{
  return objc_msgSend(a1, "_updateFilter:amount:", 2);
}

- (void)setMaxAPL:()ClockKitUI
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CD27B0]);
  objc_msgSend(v6, "frame");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(a1, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperlayer");

  objc_msgSend(v2, "addSublayer:", v3);
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayer:", v6);
  objc_msgSend(v3, "setContextId:", objc_msgSend(v5, "contextId"));
  objc_msgSend(v3, "setRendersAsynchronously:", 1);

}

@end
