@implementation TDMultisizeImageSetRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  double v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v32;
  TDMultisizeImageSetRenditionSpec *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)-[TDMultisizeImageSetRenditionSpec production](self, "production", a3, a4);
  v32 = objc_msgSend((id)objc_msgSend(v6, "name"), "name");
  v7 = (void *)objc_msgSend(v6, "sizeIndexes");
  v34 = self;
  v8 = (void *)-[TDMultisizeImageSetRenditionSpec multisizeImageRenditions](self, "multisizeImageRenditions");
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v7);
        v14 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v8);
              if (v14 == objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "sizeIndex"))
              {
                objc_msgSend(v9, "addObject:", v14);
                goto LABEL_16;
              }
            }
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            if (v16)
              continue;
            break;
          }
        }
LABEL_16:
        ;
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }
  if (!objc_msgSend(v9, "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v34, CFSTR("TDMultisizeImageSetRenditionSpec.m"), 36, CFSTR("All multisize image sets need at least one multisize image. This one '%@' has zero."), objc_msgSend((id)objc_msgSend((id)-[TDMultisizeImageSetRenditionSpec production](v34, "production"), "name"), "name"));
  v19 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v36 != v22)
          objc_enumerationMutation(v9);
        v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        v25 = (double)(int)objc_msgSend(v24, "width");
        v26 = objc_msgSend(v24, "height");
        v27 = objc_msgSend(MEMORY[0x24BDD1968], "valueWithSize:", v25, (double)v26);
        objc_msgSend(v19, "setObject:forKey:", v27, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v24, "index")));
      }
      v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v21);
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithMultisizeImageSetNamed:sizesByIndex:", v32, v19);
  objc_msgSend(v28, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v28, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v34, "propertiesAsDictionary"));
  v29 = (void *)objc_msgSend(v28, "CSIRepresentationWithCompression:", 0);

  return v29;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

@end
