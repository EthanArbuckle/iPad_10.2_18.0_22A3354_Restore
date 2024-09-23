@implementation CUINamedRecognitionObject

- (CUINamedRecognitionObject)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedRecognitionObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUINamedRecognitionObject;
  v5 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v7, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  if ((id)-[CUIThemeRendition type](-[CUINamedLookup _rendition](v5, "_rendition"), "type") != (id)1014)
  {

    return 0;
  }
  return v5;
}

- (int64_t)version
{
  return -[CUIThemeRendition objectVersion](-[CUINamedLookup _rendition](self, "_rendition"), "objectVersion");
}

- (NSData)objectData
{
  return (NSData *)-[CUIThemeRendition data](-[CUINamedLookup _rendition](self, "_rendition"), "data");
}

- (id)referenceOriginTransformation
{
  return objc_msgSend(objc_msgSend(a1, "_rendition"), "transformation");
}

- (id)description
{
  id v3;
  NSString *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CUINamedRecognitionObject;
  v3 = -[CUINamedRecognitionObject description](&v20, sel_description);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\tColumns:\n"));
  -[CUINamedRecognitionObject referenceOriginTransformation](self, "referenceOriginTransformation");
  v5 = 0;
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  v10 = (float *)&v16 + 2;
  do
  {
    v11 = *(v10 - 2);
    v12 = *(v10 - 1);
    v13 = *v10;
    v14 = v10[1];
    v10 += 4;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\t\t[%lu] = %f, %f, %f, %f\n"), v4, v5++, *(_QWORD *)&v11, *(_QWORD *)&v12, v13, v14, v16, v17, v18, v19);
  }
  while (v5 != 4);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v3, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Name: %@\nVersion: %ld\nTransformation: \n%@"), -[CUINamedLookup name](self, "name"), -[CUINamedRecognitionObject version](self, "version"), v4));
}

@end
