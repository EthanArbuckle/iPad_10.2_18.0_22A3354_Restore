@implementation CUINamedImageAtlas

- (void)dealloc
{
  __CFArray *atlasImages;
  objc_super v4;

  atlasImages = self->_atlasImages;
  if (atlasImages)
    CFRelease(atlasImages);

  v4.receiver = self;
  v4.super_class = (Class)CUINamedImageAtlas;
  -[CUINamedLookup dealloc](&v4, sel_dealloc);
}

- (id)_renditionForKey:(uint64_t)a3 inThemeRef:
{
  void *v4;

  if (a1
    && (v4 = (void *)_LookupStructuredThemeProvider(a3, a2),
        objc_msgSend(v4, "assetExistsForKey:", objc_msgSend(a2, "keyList"))))
  {
    return objc_msgSend(v4, "renditionWithKey:", objc_msgSend(a2, "keyList"));
  }
  else
  {
    return 0;
  }
}

- (BOOL)_dimension1ExistsInKeyFormatForThemeRef:(_BOOL8)result
{
  id v2;

  if (result)
  {
    v2 = objc_msgSend((id)_LookupStructuredThemeProvider(a2, a2), "keyFormat");
    return CUIRenditionKeyHasIdentifier((uint64_t)v2, 8);
  }
  return result;
}

- (CUINamedImageAtlas)initWithName:(id)a3 usingRenditionKey:(id)a4 withContents:(id)a5 contentsFromCatalog:(id)a6 fromTheme:(unint64_t)a7 withSourceThemeRef:(unint64_t)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  CUINamedImage *v28;
  CUINamedImage *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v57;
  id v58;
  _BOOL4 v59;
  void *v60;
  uint64_t v61;
  void *v62;
  __CFArray *theArray;
  NSArray *v64;
  CUINamedImageAtlas *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  NSDictionary *v74;
  id obj;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  objc_super v85;
  _BYTE v86[128];
  _BYTE v87[128];

  v14 = (void *)_LookupStructuredThemeProvider(a8, a2);
  v85.receiver = self;
  v85.super_class = (Class)CUINamedImageAtlas;
  v65 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v85, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a7);
  if (!v65->_images)
  {
    v76 = objc_msgSend(a3, "stringByAppendingString:", CFSTR("/"));
    v74 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v64 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v58 = a6;
    if (a5
      && (v15 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, a5, a7),
          objc_msgSend(objc_msgSend(v15, "contentNames"), "count")))
    {
      obj = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", objc_msgSend(v15, "contentNames"));
    }
    else
    {
      obj = 0;
    }
    v16 = -[CUIRenditionKey copy](-[CUINamedLookup renditionKey](v65, "renditionKey"), "copy");
    v59 = -[CUINamedImageAtlas _dimension1ExistsInKeyFormatForThemeRef:]((_BOOL8)v65, a7);
    v57 = objc_msgSend(v16, "themeScale");
    v73 = objc_msgSend(v16, "themeIdiom");
    v72 = objc_msgSend(v16, "themeSubtype");
    v71 = objc_msgSend(v16, "themeDisplayGamut");
    v70 = objc_msgSend(v16, "themeDirection");
    v69 = objc_msgSend(v16, "themeSizeClassHorizontal");
    v68 = objc_msgSend(v16, "themeSizeClassVertical");
    v67 = objc_msgSend(v16, "themeMemoryClass");
    v66 = objc_msgSend(v16, "themeGraphicsClass");
    objc_msgSend(v16, "setThemeDimension1:", 0);
    v60 = v16;
    v17 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v16, a7);
    if (v17)
    {
      v61 = 0;
      do
      {
        v18 = a7;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v62 = v17;
        v19 = objc_msgSend(v17, "layerReferences");
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(_QWORD *)v82 != v22)
                objc_enumerationMutation(v19);
              v24 = objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i), "referenceKey");
              v25 = objc_msgSend(v14, "renditionNameForKeyList:", objc_msgSend(v24, "keyList"));
              v27 = v25;
              if (objc_msgSend(v25, "rangeOfString:options:range:", v76, 8, 0, objc_msgSend(v25, "length")) != (id)0x7FFFFFFFFFFFFFFFLL)
                v27 = objc_msgSend(v25, "substringFromIndex:", v26);
              v28 = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:]([CUINamedImage alloc], "initWithName:usingRenditionKey:fromTheme:", v27, v24, v18);
              if (v28)
              {
                v29 = v28;
                -[NSDictionary setObject:forKey:](v74, "setObject:forKey:", v28, v27);

              }
              objc_msgSend(obj, "removeObject:", v25);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
          }
          while (v21);
        }
        -[NSArray addObject:](v64, "addObject:", v62);
        v30 = objc_msgSend(v62, "unslicedImage");
        if (v30)
        {
          CFArrayAppendValue(theArray, v30);
          a7 = v18;
          if (!v59)
            break;
        }
        else
        {
          a7 = v18;
          if (!v59)
            break;
        }
        ++v61;
        objc_msgSend(v60, "setThemeDimension1:");
        v17 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v60, a7);
      }
      while (v17);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(_QWORD *)v78 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)j);
          v37 = v35;
          if (objc_msgSend(v35, "rangeOfString:options:range:", v76, 8, 0, objc_msgSend(v35, "length")) != (id)0x7FFFFFFFFFFFFFFFLL)
            v37 = objc_msgSend(v35, "substringFromIndex:", v36);
          v38 = objc_msgSend(v58, "imageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:memoryClass:graphicsClass:", v35, v73, v72, v71, v70, v69, (double)(uint64_t)v57, v68, v67, v66);
          if (v38)
          {
            v45 = v38;
            objc_msgSend(v38, "setName:", v37);
            -[NSDictionary setObject:forKey:](v74, "setObject:forKey:", v45, v37);
            v46 = objc_msgSend(objc_msgSend(v45, "_rendition"), "linkingToRendition");
            if (v46)
            {
              v47 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v46, a7);
              if (v47 && (v54 = v47, -[NSArray indexOfObject:](v64, "indexOfObject:", v47) == 0x7FFFFFFFFFFFFFFFLL))
              {
                -[NSArray addObject:](v64, "addObject:", v54);
                v55 = objc_msgSend(v54, "unslicedImage");
                if (v55)
                  CFArrayAppendValue(theArray, v55);
              }
              else
              {
                _CUILog(1, (uint64_t)"CoreUI: didn't find parent rendition for '%@' skipping it", v48, v49, v50, v51, v52, v53, (uint64_t)v35);
              }
            }
          }
          else
          {
            _CUILog(1, (uint64_t)"CoreUI: couldn't find image '%@' in '%@'", v39, v40, v41, v42, v43, v44, (uint64_t)v35);
          }
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v32);
    }
    v65->_images = v74;
    v65->_renditions = v64;
    v65->_atlasImages = theArray;

  }
  return v65;
}

- (CGImage)image
{
  __CFArray *atlasImages;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  atlasImages = self->_atlasImages;
  if (!atlasImages || CFArrayGetCount(atlasImages) < 1)
    return 0;
  _CUILog(1, (uint64_t)"CoreUI: using depricated method -[CUINamedImageAtlas image] use -[CUINamedImageAtlas images] instead", v4, v5, v6, v7, v8, v9, v11);
  return (CGImage *)CFArrayGetValueAtIndex(self->_atlasImages, 0);
}

- (__CFArray)images
{
  return self->_atlasImages;
}

- (double)scale
{
  return (double)CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIRenditionKey keyList](-[CUINamedLookup renditionKey](self, "renditionKey"), "keyList"), 12);
}

- (id)imageWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_images, "objectForKey:", a3);
}

- (NSArray)imageNames
{
  return -[NSDictionary allKeys](self->_images, "allKeys");
}

- (BOOL)completeTextureExtrusion
{
  return -[CUINamedLookup _distilledInVersion](self, "_distilledInVersion") > 0x1AB;
}

@end
