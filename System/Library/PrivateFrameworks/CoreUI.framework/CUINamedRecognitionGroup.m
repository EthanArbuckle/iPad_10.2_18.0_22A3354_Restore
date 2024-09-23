@implementation CUINamedRecognitionGroup

- (CUINamedRecognitionGroup)initWithName:(id)a3 contentsFromCatalog:(id)a4 usingRenditionKey:(id)a5 fromTheme:(unint64_t)a6
{
  CUINamedRecognitionGroup *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];

  v40.receiver = self;
  v40.super_class = (Class)CUINamedRecognitionGroup;
  v8 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v40, sel_initWithName_usingRenditionKey_fromTheme_, a3, a5, a6);
  if (v8)
  {
    v9 = objc_msgSend(a3, "stringByAppendingString:", CFSTR("/"));
    v10 = -[CUIThemeRendition contentNames](-[CUINamedLookup _rendition](v8, "_rendition"), "contentNames");
    if (!objc_msgSend(v10, "count"))
    {
      _CUILog(4, (uint64_t)"CoreUI: NamedRecognitionGroup '%@' has no contents", v11, v12, v13, v14, v15, v16, (uint64_t)a3);

      return 0;
    }
    v8->_imageContents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_objectContents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v10);
          v21 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v20);
          v22 = objc_msgSend(a4, "_recognitionImageWithName:", v21);
          if (!v22)
          {
            v26 = objc_msgSend(a4, "_recognitionObjectWithName:", v21);
            if (!v26)
            {
              _CUILog(4, (uint64_t)"-[CUINamedRecognitionGroup initWithName:contentsFromCatalog:usingRenditionKey:fromTheme:] couldn't find any recognitions objects named '%@' skipping", v27, v28, v29, v30, v31, v32, (uint64_t)v21);
              goto LABEL_18;
            }
            v25 = v26;
LABEL_15:
            if (objc_msgSend(v21, "rangeOfString:options:range:", v9, 8, 0, objc_msgSend(v21, "length")) != (id)0x7FFFFFFFFFFFFFFFLL)
              v21 = objc_msgSend(v21, "substringFromIndex:", v33);
            -[NSMutableDictionary setObject:forKey:](v8->_objectContents, "setObject:forKey:", v25, v21);
            goto LABEL_18;
          }
          v23 = v22;
          if (objc_msgSend(v21, "rangeOfString:options:range:", v9, 8, 0, objc_msgSend(v21, "length")) != (id)0x7FFFFFFFFFFFFFFFLL)
            v21 = objc_msgSend(v21, "substringFromIndex:", v24);
          -[NSMutableDictionary setObject:forKey:](v8->_imageContents, "setObject:forKey:", v23, v21);
          v25 = objc_msgSend(a4, "_recognitionObjectWithName:", v21);
          if (v25)
            goto LABEL_15;
LABEL_18:
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        v18 = v34;
      }
      while (v34);
    }
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedRecognitionGroup;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (id)namedRecognitionItemList
{
  return objc_msgSend(-[NSMutableDictionary allKeys](self->_imageContents, "allKeys"), "arrayByAddingObjectsFromArray:", -[NSMutableDictionary allKeys](self->_objectContents, "allKeys"));
}

- (id)namedRecognitionImageImageList
{
  return -[NSMutableDictionary allKeys](self->_imageContents, "allKeys");
}

- (id)namedRecognitionObjectObjectList
{
  return -[NSMutableDictionary allKeys](self->_objectContents, "allKeys");
}

- (id)recognitionItemsWithName:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = -[CUINamedRecognitionGroup recognitionImageWithName:](self, "recognitionImageWithName:", a3);
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v7 = -[CUINamedRecognitionGroup recognitionObjectWithName:](self, "recognitionObjectWithName:", a3);
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  v8 = objc_msgSend(v5, "copy");

  return v8;
}

- (id)recognitionImageWithName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_imageContents, "objectForKey:", a3);
}

- (id)recognitionObjectWithName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_objectContents, "objectForKey:", a3);
}

@end
