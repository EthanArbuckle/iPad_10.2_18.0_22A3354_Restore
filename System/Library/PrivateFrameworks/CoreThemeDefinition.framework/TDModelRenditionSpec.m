@implementation TDModelRenditionSpec

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("ModelIORenditionSpec"));
}

- (void)processMesh:(id)a3 withAssetMeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(a6, "newObjectForEntity:", CFSTR("ModelIOMeshRenditionSpec"));
  v12 = (void *)objc_msgSend(a6, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  objc_msgSend(a5, "copyAttributesInto:", v12);
  objc_msgSend(v12, "setElement:", objc_msgSend(a6, "elementWithIdentifier:", 164));
  objc_msgSend(v12, "setPart:", objc_msgSend(a6, "partWithIdentifier:", 232));
  objc_msgSend(v12, "setDimension1:", a4);
  objc_msgSend(v11, "setParentRendition:", self);
  -[TDModelRenditionSpec addChildRenditionsObject:](self, "addChildRenditionsObject:", v11);
  objc_msgSend(v11, "setKeySpec:", v12);
  objc_msgSend((id)-[TDModelRenditionSpec production](self, "production"), "addRenditionsObject:", v11);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = (void *)objc_msgSend(a3, "submeshes", 0);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(v11, "processSubMesh:withAssetSubmeshIndex:assetKeySpec:inDocument:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (v16 + i), objc_msgSend(v11, "keySpec"), a6);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v16 += i;
    }
    while (v15);
  }

}

- (void)processModelObjectsInDocument:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(a3, "_cachedModelAssets");
  v6 = objc_msgSend((id)-[TDModelRenditionSpec asset](self, "asset"), "fileURLWithDocument:", a3);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDDE6D8]), "initWithURL:", v6);
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "addObject:", v7);
    -[TDModelRenditionSpec setModelAssetIndex:](self, "setModelAssetIndex:", objc_msgSend(v5, "count") - 1);
    v9 = (void *)objc_msgSend(v8, "childObjectsOfClass:", objc_opt_class());
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v9);
          -[TDModelRenditionSpec processMesh:withAssetMeshIndex:assetKeySpec:inDocument:](self, "processMesh:withAssetMeshIndex:assetKeySpec:inDocument:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (v12 + i), -[TDModelRenditionSpec keySpec](self, "keySpec"), a3);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v12 += i;
      }
      while (v11);
    }

  }
  else
  {
    NSLog(CFSTR("Couldn't load asset for URL: %@"), v6);
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend((id)objc_msgSend(a5, "_cachedModelAssets", a3, a4), "objectAtIndex:", (int)-[TDModelRenditionSpec modelAssetIndex](self, "modelAssetIndex"));
  v8 = (void *)-[TDModelRenditionSpec childRenditions](self, "childRenditions");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithModelAsset:", v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(v9, "addMeshReference:", objc_msgSend(MEMORY[0x24BE28C68], "renditionKeyWithKeyList:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13++), "keySpec"), "key")));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  objc_msgSend(v9, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v9, "setCompressionType:", 2);
  v14 = (void *)objc_msgSend(v9, "CSIRepresentationWithCompression:", 1);

  return v14;
}

@end
