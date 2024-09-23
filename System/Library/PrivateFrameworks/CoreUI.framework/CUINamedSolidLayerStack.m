@implementation CUINamedSolidLayerStack

- (CUINamedSolidLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6
{
  id v8;
  CUINamedSolidLayerStack *v9;
  CUIThemeRendition *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  CUINamedSolidLayerImage *v24;
  double v25;
  double v26;
  CUIRenditionKey *v27;
  CUINamedSolidLayerStack *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  CUINamedSolidLayerStack *v48;
  id obj;
  NSArray *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];

  v8 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CUINamedSolidLayerStack;
  v9 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v55, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v10 = -[CUINamedLookup _rendition](v9, "_rendition");
  if ((id)-[CUIThemeRendition type](v10, "type") == (id)1018)
  {
    if (!v8)
    {
      -[CUINamedLookup setName:](v9, "setName:", -[CUIThemeRendition name](v10, "name"));
      v8 = -[CUIThemeRendition name](v10, "name");
    }
    v48 = v9;
    v50 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = -[CUIThemeRendition layerReferences](v10, "layerReferences");
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v23 = (*((uint64_t (**)(id, id))a6 + 2))(a6, objc_msgSend(v22, "referenceKey"));
          if (!v23)
          {
            objc_msgSend(v22, "referenceKey");
            _CUILog(4, (uint64_t)"CoreUI: Unable to resolve layer reference for '%@' name '%@' layerRef referenceKey '%@'", v29, v30, v31, v32, v33, v34, (uint64_t)v22);
            goto LABEL_23;
          }
          v24 = -[CUINamedSolidLayerImage initWithName:usingRenditionKey:fromTheme:]([CUINamedSolidLayerImage alloc], "initWithName:usingRenditionKey:fromTheme:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%ld]"), v8, (char *)i + v19 + 1), v23, a5);
          if (-[CUINamedLookup _rendition](v24, "_rendition"))
          {
            objc_msgSend(v22, "frame");
            -[CUINamedSolidLayerImage setFrame:](v24, "setFrame:");
            objc_msgSend(v22, "opacity");
            if (v25 < 1.0)
            {
              -[CUINamedSolidLayerImage opacity](v24, "opacity");
              if (v26 == 1.0)
              {
                objc_msgSend(v22, "opacity");
                -[CUINamedSolidLayerImage setOpacity:](v24, "setOpacity:");
              }
            }
            if ((int)objc_msgSend(v22, "blendMode") >= 1 && !-[CUINamedSolidLayerImage blendMode](v24, "blendMode"))
              -[CUINamedSolidLayerImage setBlendMode:](v24, "setBlendMode:", objc_msgSend(v22, "blendMode"));
            -[CUINamedSolidLayerImage setFixedFrame:](v24, "setFixedFrame:", objc_msgSend(v22, "fixedFrame"));
            -[NSArray addObject:](v50, "addObject:", v24);
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        v19 += (uint64_t)i;
        if (v18)
          continue;
        break;
      }
    }
LABEL_23:
    v28 = v9;
    v9->_layers = v50;
    v27 = objc_alloc_init(CUIRenditionKey);
    -[CUIRenditionKey setThemeElement:](v27, "setThemeElement:", -[CUIRenditionKey themeElement](-[CUINamedLookup key](v9, "key"), "themeElement"));
    -[CUIRenditionKey setThemePart:](v27, "setThemePart:", 208);
    -[CUIRenditionKey setThemeIdentifier:](v27, "setThemeIdentifier:", -[CUIRenditionKey themeIdentifier](-[CUINamedLookup key](v9, "key"), "themeIdentifier"));
    v35 = (*((uint64_t (**)(id, CUIRenditionKey *))a6 + 2))(a6, v27);
    if (v35)
    {
      v42 = (void *)v35;
      v43 = -[CUINamedLookup storageRef](v9, "storageRef");
      v45 = (void *)_LookupStructuredThemeProvider(v43, v44);
      v46 = objc_msgSend(v45, "copyLookupKeySignatureForKey:", objc_msgSend(v42, "keyList"));
      v48->_flattenedImageRendition = (CUIThemeRendition *)objc_msgSend(v45, "renditionWithKey:usingKeySignature:", objc_msgSend(v42, "keyList"), v46);

    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve flattened image for layer stack %@", v36, v37, v38, v39, v40, v41, (uint64_t)v9);
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: Attempting to create named layer stack '%@' from inappropriate rendition type: %@", v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    v27 = (CUIRenditionKey *)v9;
    v28 = 0;
  }

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUINamedSolidLayerStack;
  if (!-[CUINamedLookup isEqual:](&v10, sel_isEqual_))
    goto LABEL_6;
  v6 = objc_opt_class(CUINamedSolidLayerStack, v5);
  if ((objc_opt_isKindOfClass(a3, v6) & 1) == 0)
    goto LABEL_6;
  v7 = -[NSArray isEqual:](-[CUINamedSolidLayerStack layers](self, "layers"), "isEqual:", objc_msgSend(a3, "layers"));
  if (v7)
  {
    v8 = -[CUIThemeRendition type](-[CUINamedLookup _rendition](self, "_rendition"), "type");
    if (v8 == objc_msgSend(objc_msgSend(a3, "_rendition"), "type"))
    {
      LOBYTE(v7) = 1;
      return v7;
    }
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)CUINamedSolidLayerStack;
  v3 = -[CUINamedLookup hash](&v14, sel_hash);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[CUINamedSolidLayerStack layers](self, "layers", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 *= 2654435769 * (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "hash");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[CUIThemeRendition metrics](-[CUINamedLookup _rendition](self, "_rendition"), "metrics"), "imageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layerImageAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](-[CUINamedSolidLayerStack layers](self, "layers"), "objectAtIndexedSubscript:", a3);
}

- (CGImage)flattenedImage
{
  return -[CUIThemeRendition unslicedImage](self->_flattenedImageRendition, "unslicedImage");
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUINamedSolidLayerStack;
  -[CUINamedLookup dealloc](&v3, sel_dealloc);
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
