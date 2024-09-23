@implementation TDModelMeshRenditionSpec

- (void)processSubMesh:(id)a3 withAssetSubmeshIndex:(unsigned int *)a4 assetKeySpec:(id)a5 inDocument:(id)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  TDNamedAssetImportInfo *v21;
  id v22;
  TDTextureAssetInfo *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(a6, "newObjectForEntity:", CFSTR("ModelIOSubmeshRenditionSpec"));
  v12 = (void *)objc_msgSend(a6, "newObjectForEntity:", CFSTR("RenditionKeySpec"));
  objc_msgSend(a5, "copyAttributesInto:", v12);
  objc_msgSend(v12, "setElement:", objc_msgSend(a6, "elementWithIdentifier:", 164));
  v28 = a6;
  objc_msgSend(v12, "setPart:", objc_msgSend(a6, "partWithIdentifier:", 233));
  objc_msgSend(v12, "setDimension2:", a4);
  objc_msgSend(v11, "setParentRendition:", self);
  -[TDModelMeshRenditionSpec addSubmeshesObject:](self, "addSubmeshesObject:", v11);
  objc_msgSend(v11, "setKeySpec:", v12);
  v27 = v11;
  objc_msgSend((id)-[TDModelMeshRenditionSpec production](self, "production"), "addRenditionsObject:", v11);
  v13 = (void *)objc_msgSend(a3, "material");
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v13)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "URLValue", v25);
          if (objc_msgSend(v18, "type") == 1 && v19 != 0)
          {
            v21 = objc_alloc_init(TDNamedAssetImportInfo);
            -[TDNamedAssetImportInfo setName:](v21, "setName:", objc_msgSend(v18, "stringValue"));
            -[TDNamedAssetImportInfo setNameIdentifier:](v21, "setNameIdentifier:", 33333);
            -[TDNamedAssetImportInfo setIdiom:](v21, "setIdiom:", 0);
            -[TDNamedAssetImportInfo setScaleFactor:](v21, "setScaleFactor:", 1);
            -[TDNamedAssetImportInfo setModificationDate:](v21, "setModificationDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
            -[TDNamedAssetImportInfo setRenditionType:](v21, "setRenditionType:", 1007);
            -[TDNamedAssetImportInfo setTexturePixelFormat:](v21, "setTexturePixelFormat:", 1);
            -[TDNamedAssetImportInfo setTextureWidth:](v21, "setTextureWidth:", 120);
            -[TDNamedAssetImportInfo setTextureHeight:](v21, "setTextureHeight:", 120);
            v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            v23 = objc_alloc_init(TDTextureAssetInfo);
            -[TDTextureAssetInfo setFileURL:](v23, "setFileURL:", v19);
            -[TDTextureAssetInfo setMipLevel:](v23, "setMipLevel:", 0);
            objc_msgSend(v22, "addObject:", v23);
            -[TDNamedAssetImportInfo setTextureInfos:](v21, "setTextureInfos:", v22);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }
  }
  v29 = 0;
  v24 = v25;
  objc_msgSend(v28, "createNamedTexturesForCustomInfos:referenceFiles:bitSource:error:", v26, 1, objc_msgSend(v28, "_themeBitSourceForReferencedFilesAtURLs:createIfNecessary:", v25, 1, v25), &v29);

}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "_cachedModelAssets"), "objectAtIndex:", (int)objc_msgSend((id)-[TDModelMeshRenditionSpec parentRendition](self, "parentRendition", a3, a4), "modelAssetIndex")), "objectAtIndex:", objc_msgSend((id)-[TDModelMeshRenditionSpec keySpec](self, "keySpec"), "dimension1"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithModelMesh:", v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)-[TDModelMeshRenditionSpec submeshes](self, "submeshes", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addSubmeshReference:", objc_msgSend(MEMORY[0x24BE28C68], "renditionKeyWithKeyList:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "keySpec"), "key")));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  objc_msgSend(v7, "setCompressionType:", 2);
  v13 = (void *)objc_msgSend(v7, "CSIRepresentationWithCompression:", 1);

  return v13;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", CFSTR("ModelIOMeshRenditionSpec"));
}

@end
