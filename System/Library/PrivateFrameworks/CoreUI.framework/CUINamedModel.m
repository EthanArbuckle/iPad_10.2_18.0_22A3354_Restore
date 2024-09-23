@implementation CUINamedModel

- (id)_renditionForKey:(id)a3 inThemeRef:(unint64_t)a4
{
  void *v5;

  v5 = (void *)_LookupStructuredThemeProvider(a4, a2);
  if (objc_msgSend(v5, "assetExistsForKey:", objc_msgSend(a3, "keyList")))
    return objc_msgSend(v5, "renditionWithKey:", objc_msgSend(a3, "keyList"));
  else
    return 0;
}

- (CUINamedModel)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedModel *v6;
  CUIThemeRendition *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  id v36;
  id v37;
  id obj;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];

  v49.receiver = self;
  v49.super_class = (Class)CUINamedModel;
  v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v49, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v7 = -[CUINamedLookup _rendition](v6, "_rendition");
  if ((id)-[CUIThemeRendition type](v7, "type") != (id)1011)
  {

    v6 = 0;
  }
  v36 = -[CUIThemeRendition modelAsset](v7, "modelAsset");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = -[CUIThemeRendition meshKeys](v7, "meshKeys");
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    v35 = *(_QWORD *)v46;
    do
    {
      v11 = 0;
      v37 = v9;
      do
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v11);
        v13 = -[CUINamedModel _renditionForKey:inThemeRef:](v6, "_renditionForKey:inThemeRef:", v12, a5);
        if (objc_msgSend(v13, "type") == (id)1012)
        {
          v40 = v11;
          objc_msgSend(v36, "addObject:", objc_msgSend(v13, "modelMesh"));
          v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(objc_msgSend(v13, "submeshKeys"), "count"));
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v39 = v13;
          v21 = objc_msgSend(v13, "submeshKeys");
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(_QWORD *)v42 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
                v27 = -[CUINamedModel _renditionForKey:inThemeRef:](v6, "_renditionForKey:inThemeRef:", v26, a5);
                if (objc_msgSend(v27, "type") == (id)1016)
                  objc_msgSend(v20, "addObject:", objc_msgSend(v27, "modelSubmesh"));
                else
                  _CUILog(4, (uint64_t)"-[CUINamedModel initWithName:usingRenditionKey:fromTheme:] Got a rendition not of type kCUIModelSubMeshRenditionType with key: '%@' skipping", v28, v29, v30, v31, v32, v33, v26);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v23);
          }
          objc_msgSend(objc_msgSend(v39, "modelMesh"), "setSubmeshes:", v20);

          v10 = v35;
          v9 = v37;
          v11 = v40;
        }
        else
        {
          _CUILog(4, (uint64_t)"-[CUINamedModel initWithName:usingRenditionKey:fromTheme:] Got a rendition not of type kCUIModelMeshRenditionType with key: '%@' skipping", v14, v15, v16, v17, v18, v19, v12);
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v9);
  }
  return v6;
}

- (MDLAsset)asset
{
  return (MDLAsset *)-[CUIThemeRendition modelAsset](-[CUINamedLookup _rendition](self, "_rendition"), "modelAsset");
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> name:'%@' asset:'%@' #meshes:%lu>"), NSStringFromClass(v3), self, -[CUINamedLookup name](self, "name"), -[CUINamedModel asset](self, "asset"), -[MDLAsset count](-[CUINamedModel asset](self, "asset"), "count"));
}

@end
