@implementation TDEffectRenditionSpec

- (void)setComponentsFromEffectPreset:(id)a3 withDocument:(id)a4
{
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v7 = objc_msgSend(a3, "effectCount");
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", 6);
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      v9 = (void *)objc_msgSend(a4, "newObjectForEntity:", CFSTR("EffectComponent"));
      objc_msgSend(v9, "setEffectParametersFromPreset:atIndex:withDocument:", a3, i, a4);
      objc_msgSend(v10, "addObject:", v9);

    }
  }
  -[TDEffectRenditionSpec setComponents:](self, "setComponents:", v10);

}

- (id)effectPreset
{
  float v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  int v13;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)-[TDEffectRenditionSpec effectScale](self, "effectScale"), "floatValue");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C78]), "initWithEffectScale:", v3);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (void *)-[TDEffectRenditionSpec components](self, "components", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "isEnabled");
        v13 = objc_msgSend((id)objc_msgSend(v11, "effectType"), "identifier");
        if (v13 == 1180787813 || v13 == 1397715043 || v12 != 0)
          objc_msgSend(v11, "updatePresetParameters:atIndex:", v4, v8++);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  return v4;
}

- (void)replaceComponentsWithComponentsFromEffectRendition:(id)a3 withDocument:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v23;
  TDEffectRenditionSpec *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  obj = (id)objc_msgSend(a3, "components");
  if (objc_msgSend(obj, "count"))
  {
    v6 = (void *)-[TDEffectRenditionSpec components](self, "components");
    v25 = (void *)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v9);
    }
    -[TDEffectRenditionSpec removeComponents:](self, "removeComponents:", v6);
    objc_msgSend(a4, "deleteObjects:", v7);
    objc_msgSend((id)objc_msgSend(a4, "managedObjectContext"), "processPendingChanges");
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v26)
    {
      v23 = *(_QWORD *)v33;
      v24 = self;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v12);
          v14 = (void *)objc_msgSend(a4, "newObjectForEntity:", CFSTR("EffectComponent"));
          v27 = v13;
          v15 = (void *)objc_msgSend(v13, "parameters");
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v19);
                v21 = (void *)objc_msgSend(a4, "newObjectForEntity:", CFSTR("EffectParameterValue"));
                objc_msgSend(v21, "setIntValue:", objc_msgSend(v20, "intValue"));
                objc_msgSend(v21, "setFloatValue:", objc_msgSend(v20, "floatValue"));
                objc_msgSend(v21, "setColorValue:", objc_msgSend(v20, "colorValue"));
                objc_msgSend(v21, "setAngleValue:", objc_msgSend(v20, "angleValue"));
                objc_msgSend(v21, "setParameterType:", objc_msgSend(v20, "parameterType"));
                objc_msgSend(v14, "addParametersObject:", v21);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
            }
            while (v17);
          }
          objc_msgSend(v14, "setEffectType:", objc_msgSend(v27, "effectType"));
          objc_msgSend(v14, "setIsEnabled:", objc_msgSend(v27, "isEnabled"));
          self = v24;
          objc_msgSend(v14, "setRendition:", v24);
          objc_msgSend(v25, "addObject:", v14);

          ++v12;
        }
        while (v12 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v26);
    }
    -[TDEffectRenditionSpec addComponents:](self, "addComponents:", v25);
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;

  v7 = -[TDEffectRenditionSpec effectPreset](self, "effectPreset", a3, a4);
  v8 = objc_alloc(MEMORY[0x24BE28C20]);
  objc_msgSend(v7, "effectScale");
  v10 = (void *)objc_msgSend(v8, "initWithShapeEffectPreset:forScaleFactor:", v7, v9);
  objc_msgSend(v10, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v10, "setName:", objc_msgSend((id)objc_msgSend((id)-[TDEffectRenditionSpec production](self, "production"), "partDefinition"), "name"));
  objc_msgSend(v10, "setColorSpaceID:", 1);
  objc_msgSend(v10, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  v11 = (void *)objc_msgSend(v10, "CSIRepresentationWithCompression:", 0);

  return v11;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)componentOfType:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3 != 1397715043 && a3 != 1180787813)
    return 0;
  v5 = (void *)-[TDEffectRenditionSpec components](self, "components");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_8:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "effectType"), "identifier") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        goto LABEL_8;
      return v10;
    }
  }
}

+ (id)keyPathsForValuesAffectingCUIShapeEffectShapeOpacity
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("components"), 0);
}

- (TDEffectComponent)CUIShapeEffectShapeOpacity
{
  return (TDEffectComponent *)-[TDEffectRenditionSpec componentOfType:](self, "componentOfType:", 1397715043);
}

+ (id)keyPathsForValuesAffectingCUIShapeEffectOutputOpacity
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("components"), 0);
}

- (TDEffectComponent)CUIShapeEffectOutputOpacity
{
  return (TDEffectComponent *)-[TDEffectRenditionSpec componentOfType:](self, "componentOfType:", 1180787813);
}

@end
