@implementation TDMicaRenditionSpec

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rendition with asset %@ and key %@"), objc_msgSend((id)objc_msgSend((id)-[TDMicaRenditionSpec production](self, "production"), "asset"), "name"), objc_msgSend((id)-[TDMicaRenditionSpec keySpec](self, "keySpec"), "debugDescription"));
}

- (void)_logError:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (void)_logWarning:(id)a3
{
  NSLog(CFSTR("%@"), a2, a3);
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  __int16 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  __int16 v36;
  TDMicaRenditionSpec *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v6 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v47 = 0;
  v8 = (void *)objc_msgSend((id)-[TDMicaRenditionSpec production](self, "production", a3), "asset");
  v9 = (void *)objc_msgSend(v8, "fileURLWithDocument:", a5);
  if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v47) & 1) == 0)
    v9 = (void *)objc_msgSend((id)objc_msgSend(v9, "URLByDeletingPathExtension"), "URLByAppendingPathExtension:", CFSTR("ca"));
  if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v47) & 1) == 0)
    v9 = (void *)objc_msgSend((id)objc_msgSend(v9, "URLByDeletingPathExtension"), "URLByAppendingPathExtension:", CFSTR("caml"));
  if (-[TDMicaRenditionSpec parentRendition](self, "parentRendition"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithInternalReferenceRect:layout:", 1000, 0.0, 0.0, 128.0, 128.0);
    objc_msgSend(v10, "setScaleFactor:", 1);
    objc_msgSend(v10, "setUtiType:", *MEMORY[0x24BDE5D48]);
    objc_msgSend(v10, "addSliceRect:", 0.0, 0.0, 128.0, 128.0);
    v11 = objc_alloc_init(MEMORY[0x24BE28C70]);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)-[TDMicaRenditionSpec parentRendition](self, "parentRendition"), "keySpec"), "key"));
    objc_msgSend(v11, "setReferenceKey:", v12);
    objc_msgSend(v10, "addLayerReference:", v11);
    v13 = (void *)objc_msgSend(v10, "CSIRepresentationWithCompression:", 1);

  }
  else if (v8)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    v47 = 0;
    if ((objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "isEqualToString:", CFSTR("ca")) & 1) != 0)
    {
      v14 = (uint64_t *)MEMORY[0x24BDE5D50];
    }
    else
    {
      v15 = objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "isEqualToString:", CFSTR("caml"));
      v14 = (uint64_t *)MEMORY[0x24BDE5D48];
      if (v15)
        v14 = (uint64_t *)MEMORY[0x24BDE5D58];
    }
    v16 = *v14;
    v17 = (void *)objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v9, *v14, MEMORY[0x24BDBD1B8], &v47);
    if (!v17 || v47)
    {
      -[TDMicaRenditionSpec _logError:](self, "_logError:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Couldn't find Mica asset at %@ of type %@: %@"), v9, v16, v47));
      v13 = 0;
    }
    else
    {
      v35 = v8;
      v36 = v6;
      v18 = (void *)objc_msgSend(v17, "rootLayer");
      v37 = self;
      v19 = (void *)-[TDMicaRenditionSpec layerPath](self, "layerPath");
      if (objc_msgSend(v19, "length"))
      {
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        obj = (id)objc_msgSend(v19, "componentsSeparatedByString:", CFSTR("/"));
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v44 != v22)
                objc_enumerationMutation(obj);
              v24 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              v42 = 0u;
              v25 = (void *)objc_msgSend(v18, "sublayers");
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v40;
                while (2)
                {
                  for (j = 0; j != v27; ++j)
                  {
                    if (*(_QWORD *)v40 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    if ((objc_msgSend((id)objc_msgSend(v30, "name"), "isEqualToString:", v24) & 1) != 0)
                    {
                      v18 = v30;
                      goto LABEL_31;
                    }
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
                  if (v27)
                    continue;
                  break;
                }
              }
LABEL_31:
              ;
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
          }
          while (v21);
        }
      }
      v31 = CAEncodeLayerTree();
      if (v31)
      {
        v32 = (void *)v31;
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithRawData:pixelFormat:layout:", v31, 1145132097, 1000);
        objc_msgSend(v33, "setScaleFactor:", 1);
        objc_msgSend(v33, "setUtiType:", *MEMORY[0x24BDE5D48]);
        objc_msgSend(v33, "setName:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mica: %@"), objc_msgSend(v35, "name")));
        objc_msgSend(v33, "setColorSpaceID:", v36);
        objc_msgSend(v33, "setOpacity:", 1.0);
        objc_msgSend(v33, "setBlendMode:", 0);
        objc_msgSend(v33, "setIsTintable:", -[TDMicaRenditionSpec isTintable](v37, "isTintable"));
        objc_msgSend(v33, "setCompressionType:", 2);
        objc_msgSend(v33, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](v37, "propertiesAsDictionary"));
        v13 = (void *)objc_msgSend(v33, "CSIRepresentationWithCompression:", 1);

      }
      else
      {
        v13 = 0;
      }
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
  else
  {
    return 0;
  }
  return v13;
}

- (id)copyDataFromAttributes
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0), "copy");
}

@end
