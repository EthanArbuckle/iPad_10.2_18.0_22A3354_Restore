@implementation TDContentsRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)-[TDContentsRenditionSpec contains](self, "contains", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12++), "name"));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  objc_msgSend(v7, "sortUsingSelector:", sel_localizedCompare_);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithNameList:", v7);
  objc_msgSend(v13, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  v14 = (void *)objc_msgSend(v13, "CSIRepresentationWithCompression:", 0);

  return v14;
}

@end
