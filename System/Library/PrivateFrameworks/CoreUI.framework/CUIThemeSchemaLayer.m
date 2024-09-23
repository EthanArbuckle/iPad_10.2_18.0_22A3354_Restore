@implementation CUIThemeSchemaLayer

- (CUIThemeSchemaLayer)initWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5
{
  CUIThemeSchemaLayer *v8;
  CUIThemeSchemaLayer *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUIThemeSchemaLayer;
  v8 = -[CUIThemeSchemaLayer init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CUIThemeSchemaLayer setRenditions:](v8, "setRenditions:", a3);
    -[CUIThemeSchemaLayer setName:](v9, "setName:", a4);
    -[CUIThemeSchemaLayer setIndex:](v9, "setIndex:", a5);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CUIThemeSchemaLayer setRenditions:](self, "setRenditions:", 0);
  -[CUIThemeSchemaLayer setName:](self, "setName:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaLayer;
  -[CUIThemeSchemaLayer dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaLayer;
  return objc_msgSend(-[CUIThemeSchemaLayer description](&v3, sel_description), "stringByAppendingFormat:", CFSTR("\rName: %@\rIndex: %d\rRenditions: %@"), -[CUIThemeSchemaLayer name](self, "name"), -[CUIThemeSchemaLayer index](self, "index"), -[NSArray description](-[CUIThemeSchemaLayer renditions](self, "renditions"), "description"));
}

+ (id)layerWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithRenditions:name:index:", a3, a4, a5);
}

- (double)translateFromWidthsOrHeightsToLeftsOrTops:(id)a3 leftsOrTops:(id *)a4
{
  uint64_t v6;
  NSMutableArray *v7;
  double v8;
  uint64_t v9;
  double v10;
  float v11;

  v6 = (uint64_t)objc_msgSend(a3, "count");
  v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6);
  if (v6 < 1)
  {
    v10 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      *(float *)&v8 = v10;
      -[NSMutableArray addObject:](v7, "addObject:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
      objc_msgSend(objc_msgSend(a3, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9)), "floatValue");
      v8 = v11;
      v10 = v10 + v8;
      ++v9;
    }
    while (v6 != v9);
  }
  *a4 = v7;
  return v10;
}

- (void)calculateColumLefts:(id *)a3 rowTops:(id *)a4 totalSize:(CGSize *)a5 forPartFeatures:(unint64_t)a6
{
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGImage *v20;
  NSNumber *v21;
  double Width;
  NSNumber *v23;
  double Height;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CUIThemeSchemaLayer *v28;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v8 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2);
  v9 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = self;
  v10 = -[CUIThemeSchemaLayer renditions](self, "renditions");
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "renditionCoordinatesForPartFeatures:", a6);
        v17 = v16;
        v19 = v18;
        v20 = (CGImage *)objc_msgSend(objc_msgSend(v15, "referenceImage"), "image");
        v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v17);
        if (!-[NSMutableDictionary objectForKey:](v8, "objectForKey:", v21))
        {
          Width = (double)CGImageGetWidth(v20);
          *(float *)&Width = Width;
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", Width), v21);
        }
        v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v19);
        if (!-[NSMutableDictionary objectForKey:](v9, "objectForKey:", v23))
        {
          Height = (double)CGImageGetHeight(v20);
          *(float *)&Height = Height;
          -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", Height), v23);
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v12);
  }
  v33 = 0;
  -[CUIThemeSchemaLayer translateFromWidthsOrHeightsToLeftsOrTops:leftsOrTops:](v28, "translateFromWidthsOrHeightsToLeftsOrTops:leftsOrTops:", v8, &v33);
  v26 = v25;
  v32 = 0;
  -[CUIThemeSchemaLayer translateFromWidthsOrHeightsToLeftsOrTops:leftsOrTops:](v28, "translateFromWidthsOrHeightsToLeftsOrTops:leftsOrTops:", v9, &v32);
  *a3 = v33;
  *a4 = v32;
  a5->width = v26;
  a5->height = v27;
}

- (NSArray)renditions
{
  return self->_renditions;
}

- (void)setRenditions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end
