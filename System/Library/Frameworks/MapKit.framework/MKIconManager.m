@implementation MKIconManager

+ (void)setDiskCacheURL:(id)a3
{
  objc_storeStrong((id *)&qword_1ECE2D998, a3);
}

+ (id)iconManager
{
  return (id)objc_msgSend(MEMORY[0x1E0DC6500], "sharedManager");
}

+ (CGColor)newFillColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  CGColor *v10;

  v6 = a3;
  objc_msgSend(a1, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v6, CFSTR("default-search"), 4, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = CGColorRetain((CGColorRef)objc_msgSend(v9, "fillColor"));
  else
    v10 = 0;

  return v10;
}

+ (CGColor)newHaloColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  CGColor *v10;

  v6 = a3;
  objc_msgSend(a1, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v6, CFSTR("default-search"), 4, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = CGColorRetain((CGColorRef)objc_msgSend(v9, "haloColor"));
  else
    v10 = 0;

  return v10;
}

+ (CGColor)newGlyphColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v6;
  void *v7;
  double v8;
  void *v9;
  CGColor *v10;

  v6 = a3;
  objc_msgSend(a1, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v6, CFSTR("default-search"), 4, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = CGColorRetain((CGColorRef)objc_msgSend(v9, "glyphColor"));
  else
    v10 = 0;

  return v10;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6
{
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:iconText:size:forScale:navMode:nightMode:", a3, 0, a4, a6, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 navMode:(BOOL)a6 nightMode:(BOOL)a7
{
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:iconText:size:forScale:navMode:nightMode:", a3, 0, a4, a6, a7, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 iconText:(id)a4 size:(unint64_t)a5 forScale:(double)a6 navMode:(BOOL)a7 nightMode:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  float v24;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v16, "setNightMode:", v8);
  objc_msgSend(v16, "setNavMode:", v9);
  objc_msgSend(v16, "setText:", v15);
  objc_msgSend(a1, "iconManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17;
  if (a5 > 5)
    v20 = 5;
  else
    v20 = qword_18B2A9B88[a5];
  *(float *)&v18 = a6;
  objc_msgSend(v17, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", v14, CFSTR("default-search"), v20, v16, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)objc_msgSend(v21, "image");
    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v21, "contentScale");
      v22 = (void *)objc_msgSend(v23, "initWithCGImage:scale:orientation:", v22, 0, v24);
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:size:forScale:navMode:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_imageForFeatureStyleAttributes:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:size:forScale:navMode:nightMode:", a3, a4, 0, a6, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  objc_msgSend(a1, "imageForTrafficCamera:size:forScale:nightMode:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForTrafficCamera:(id)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForTrafficCameraType:isAboveThreshold:", objc_msgSend(v10, "type"), objc_msgSend(v10, "isAboveSpeedThreshold"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isSpeedLimitCamera"))
  {
    objc_msgSend(v10, "speedLimitText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_imageForFeatureStyleAttributes:iconText:size:forScale:navMode:nightMode:", v11, v12, a4, 1, v6, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_imageForFeatureStyleAttributes:size:forScale:navMode:nightMode:", v11, a4, 1, v6, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5
{
  return (id)objc_msgSend(a1, "imageForTrafficIncidentType:size:forScale:nightMode:", a3, a4, 0, a5);
}

+ (id)imageForTrafficIncidentType:(int64_t)a3 size:(unint64_t)a4 forScale:(double)a5 nightMode:(BOOL)a6
{
  _BOOL8 v6;
  void *v10;
  void *v11;

  v6 = a6;
  objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForTrafficIncidentType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:size:forScale:nightMode:", v10, a4, v6, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)imageForRouteAnnotationStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5
{
  objc_msgSend(a1, "_imageForFeatureStyleAttributes:size:forScale:nightMode:", a3, a4, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForIconID:(unsigned int)a3 contentScale:(double)a4 sizeGroup:(unint64_t)a5 nightMode:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v9;
  id v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  float v19;

  v6 = a6;
  v9 = *(_QWORD *)&a3;
  v11 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v11, "setNightMode:", v6);
  objc_msgSend(a1, "iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  if (a5 > 5)
    v15 = 5;
  else
    v15 = qword_18B2A9B88[a5];
  *(float *)&v13 = a4;
  objc_msgSend(v12, "imageForIconID:contentScale:sizeGroup:modifiers:", v9, v15, v11, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)objc_msgSend(v16, "image");
    if (v17)
    {
      v18 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v16, "contentScale");
      v17 = (void *)objc_msgSend(v18, "initWithCGImage:scale:orientation:", v17, 0, v19);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)imageForMapItem:(id)a3 forScale:(double)a4
{
  +[MKIconManager imageForMapItem:forScale:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:forScale:fallbackToBundleIcon:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForMapItem:(id)a3 forScale:(double)a4 fallbackToBundleIcon:(BOOL)a5
{
  +[MKIconManager imageForMapItem:size:forScale:format:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:size:forScale:format:fallbackToBundleIcon:", a3, 3, 0, a5, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6
{
  +[MKIconManager imageForMapItem:size:forScale:format:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:size:forScale:format:fallbackToBundleIcon:", a3, a4, *(_QWORD *)&a6, 1, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 fallbackToBundleIcon:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v11 = a3;
  objc_msgSend(v11, "_styleAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:", v12, a4, v8, objc_msgSend(v11, "_customIconID"), v7, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:", a3, a4, *(_QWORD *)&a6, 0, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 nightMode:(BOOL)a7
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:nightMode:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 nightMode:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:nightMode:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5, v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8
{
  +[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:", a3, a4, *(_QWORD *)&a6, a7, a8, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 nightMode:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  +[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, 0, a5, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9
{
  uint64_t v10;

  BYTE2(v10) = a9;
  LOWORD(v10) = a8;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 isCarplay:(BOOL)a9 nightMode:(BOOL)a10
{
  uint64_t v11;

  BYTE3(v11) = a10;
  BYTE2(v11) = a9;
  LOWORD(v11) = a8;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 transparent:(BOOL)a7 transitMode:(BOOL)a8 interactive:(BOOL)a9 nightMode:(BOOL)a10
{
  uint64_t v11;

  BYTE2(v11) = a10;
  BYTE1(v11) = a9;
  LOBYTE(v11) = a8;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:", a3, a4, *(_QWORD *)&a6, 0, 0, a7, a5, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:", a3, a4, *(_QWORD *)&a6, a7, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 nightMode:(BOOL)a8
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:nightMode:", a3, a4, *(_QWORD *)&a6, a7, 0, a8, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8
{
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:", a3, a4, *(_QWORD *)&a6, a7, a8, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 nightMode:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, 0, a5, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 nightMode:(BOOL)a10
{
  uint64_t v11;

  BYTE1(v11) = a10;
  LOBYTE(v11) = 0;
  objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = a10;
  objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 nightMode:(BOOL)a11
{
  uint64_t v12;

  BYTE2(v12) = a11;
  LOWORD(v12) = a10;
  objc_msgSend(a1, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11
{
  uint64_t v12;

  BYTE2(v12) = 0;
  LOWORD(v12) = __PAIR16__(a11, a10);
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 nightMode:(BOOL)a12
{
  uint64_t v13;

  BYTE3(v13) = a12;
  BYTE2(v13) = 0;
  LOWORD(v13) = __PAIR16__(a11, a10);
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12
{
  uint64_t v13;

  BYTE3(v13) = 0;
  *(_WORD *)((char *)&v13 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v13) = a10;
  +[MKIconManager imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:customIconID:fallbackToBundleIcon:transparent:transitmode:interactive:isCarplay:nightMode:", a3, a4, *(_QWORD *)&a6, a7, a8, a9, a5, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)imageForStyle:(id)a3 size:(unint64_t)a4 forScale:(double)a5 format:(int)a6 customIconID:(unint64_t)a7 fallbackToBundleIcon:(BOOL)a8 transparent:(BOOL)a9 transitmode:(BOOL)a10 interactive:(BOOL)a11 isCarplay:(BOOL)a12 nightMode:(BOOL)a13
{
  _BOOL8 v13;
  _BOOL4 v14;
  uint64_t v16;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void **p_cache;
  void *v30;
  uint64_t v31;
  void *v32;
  CGImage *v33;
  id v35;
  double v36;
  _QWORD v37[4];
  id v38;
  id v39;
  double v40;
  unint64_t v41;
  BOOL v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v13 = a9;
  v14 = a8;
  v16 = *(_QWORD *)&a6;
  v57 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __142__MKIconManager_imageForStyle_size_forScale_format_customIconID_fallbackToBundleIcon_transparent_transitmode_interactive_isCarplay_nightMode___block_invoke;
  v37[3] = &unk_1E20DA248;
  v42 = a12;
  v43 = a10;
  v44 = v13;
  v45 = a13;
  v35 = v20;
  v38 = v35;
  v39 = a1;
  v40 = a5;
  v41 = a4;
  v21 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v37);
  if (qword_1ECE2D9A8 != -1)
    dispatch_once(&qword_1ECE2D9A8, &__block_literal_global_182);
  v22 = (id)qword_1ECE2D9A0;
  v23 = v22;
  if (!a7 && v22 && GEOConfigGetBOOL())
  {
    objc_msgSend(v23, "imageForStyleAttributes:size:scale:isCarplay:isTransit:isTransparent:isNightMode:drawingBlock:", v35, a4, a12, a10, v13, a13, a5, v21);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21[2](v21);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
  if (!v24 && v14)
  {
    v36 = a5;
    v26 = objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", v16, &v36);
    objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkitBundle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "_cfBundle");

    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    p_cache = _MKUIViewControllerRootView.cache;
    v30 = off_1ECE2D980;
    v49 = off_1ECE2D980;
    if (off_1ECE2D980)
      goto LABEL_16;
    v50 = 0;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v30 = (void *)_MergedGlobals_141;
    v54 = _MergedGlobals_141;
    if (!_MergedGlobals_141)
    {
      v55 = xmmword_1E20DA220;
      v56 = *(_OWORD *)&off_1E20DA230;
      v31 = _sl_dlopen();
      v52[3] = v31;
      _MergedGlobals_141 = v31;
      v30 = (void *)v31;
    }
    _Block_object_dispose(&v51, 8);
    v32 = v50;
    if (!v30)
    {
      v32 = (void *)abort_report_np();
      goto LABEL_23;
    }
    if (v50)
      goto LABEL_24;
    while (1)
    {
      v30 = dlsym(v30, "LICreateIconForBundle");
      v47[3] = (uint64_t)v30;
      p_cache[304] = v30;
LABEL_16:
      _Block_object_dispose(&v46, 8);
      if (v30)
        break;
      p_cache = 0;
      dlerror();
      v32 = (void *)abort_report_np();
LABEL_23:
      __break(1u);
LABEL_24:
      free(v32);
    }
    v33 = (CGImage *)((uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD))v30)(v28, 0, v26, 0);
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v33, 0, v36);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v33);
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

id __142__MKIconManager_imageForStyle_size_forScale_format_customIconID_fallbackToBundleIcon_transparent_transitmode_interactive_isCarplay_nightMode___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGImage *v13;
  id v14;
  float v15;

  if (*(_QWORD *)(a1 + 32) && GEOConfigGetBOOL())
  {
    if (*(_BYTE *)(a1 + 64))
      v2 = CFSTR("default-search-car");
    else
      v2 = CFSTR("default-search");
    v3 = *(unsigned __int8 *)(a1 + 65);
    v4 = objc_alloc_init(MEMORY[0x1E0DC6508]);
    v5 = v4;
    if (*(_BYTE *)(a1 + 66))
      objc_msgSend(v4, "setGlyphOnly:", 1);
    objc_msgSend(v5, "setTransitMode:", v3 != 0);
    if (*(_BYTE *)(a1 + 67))
      objc_msgSend(v5, "setNightMode:", 1);
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = *(double *)(a1 + 48);
    *(float *)&v8 = v8;
    v9 = *(_QWORD *)(a1 + 56);
    if (v9 > 5)
      v10 = 5;
    else
      v10 = qword_18B2A9B88[v9];
    objc_msgSend(v6, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", *(_QWORD *)(a1 + 32), v2, v10, v5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = CGImageRetain((CGImageRef)objc_msgSend(v12, "image"));
      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x1E0CEA638]);
        objc_msgSend(v12, "contentScale");
        v11 = (void *)objc_msgSend(v14, "initWithCGImage:scale:orientation:", v13, 0, v15);
      }
      else
      {
        v11 = 0;
      }
      CGImageRelease(v13);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (void)requestImageForStyleAttributes:(id)a3 size:(unint64_t)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MapKit.SnapshotService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079860);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  objc_msgSend(v11, "resume");
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke;
  v22[3] = &unk_1E20DA270;
  v14 = v10;
  v24 = v14;
  v15 = v11;
  v23 = v15;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke_2;
  v19[3] = &unk_1E20DA298;
  v17 = v14;
  v21 = v17;
  v18 = v15;
  v20 = v18;
  objc_msgSend(v16, "requestIconWithStyleAttributes:size:scale:completionHandler:", v9, a4, v19, a5);

}

uint64_t __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __77__MKIconManager_requestImageForStyleAttributes_size_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)requestImageForMapItem:(id)a3 size:(unint64_t)a4 forScale:(double)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint8_t *v17;
  unint64_t v18;
  double v19;
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a3;
  v10 = a6;
  objc_msgSend(v9, "_identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__12;
    v24 = __Block_byref_object_dispose__12;
    v25 = 0;
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke;
    block[3] = &unk_1E20DA2E8;
    v17 = buf;
    v15 = v9;
    v18 = a4;
    v19 = a5;
    v16 = v10;
    dispatch_async(v12, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    GEOGetMKIconManagerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_INFO, "Cannot request an image for MapItem with no identifier.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  +[MKIconManager imageForMapItem:size:forScale:format:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:size:forScale:format:fallbackToBundleIcon:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, 1, *(double *)(a1 + 64));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke_2;
  v7[3] = &unk_1E20DA2C0;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __72__MKIconManager_requestImageForMapItem_size_forScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

@end
