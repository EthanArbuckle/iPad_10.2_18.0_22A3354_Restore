@implementation SKTextureAtlas

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_prePopulateCache
{
  int v3;
  BOOL v4;
  NSDictionary *textureDict;
  _QWORD v6[5];

  v3 = -[NSDictionary count](self->_textureDict, "count");
  if (self->_textureDict)
    v4 = v3 < 1;
  else
    v4 = 1;
  if (!v4)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,SKCTileMapNodeRenderBatch>>>::__rehash<true>((uint64_t)&self->_textureMap, vcvtps_u32_f32((float)v3 / self->_textureMap.__table_.__p3_.__value_));
    textureDict = self->_textureDict;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __35__SKTextureAtlas__prePopulateCache__block_invoke;
    v6[3] = &unk_1EA5001C0;
    v6[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](textureDict, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
}

void __35__SKTextureAtlas__prePopulateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *__p[2];
  char v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = objc_retainAutorelease(v7);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
  v11 = v9 + 32;
  v12 = v8;
  v15 = v12;
  std::__hash_table<std::__hash_value_type<std::string,SKTexture * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKTexture * {__strong}>>>::__emplace_unique_key_args<std::string,std::pair<std::string,SKTexture * {__strong}>>(v11, (unsigned __int8 *)__p, (__int128 *)__p);

  if (v14 < 0)
    operator delete(__p[0]);

}

- (void)commonInit
{
  if (-[SKTextureAtlas commonInit]::_atlasInit != -1)
    dispatch_once(&-[SKTextureAtlas commonInit]::_atlasInit, &__block_literal_global_7);
}

void __28__SKTextureAtlas_commonInit__block_invoke()
{
  SKThreadSafeMapTable *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:", v1);
  v3 = (void *)_atlasDict;
  _atlasDict = v2;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v5 = (void *)_offlineAtlasCache;
  _offlineAtlasCache = (uint64_t)v4;

}

- (SKTextureAtlas)init
{
  SKTextureAtlas *v2;
  SKTextureAtlas *v3;
  NSDictionary *textureDict;
  NSString *atlasName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKTextureAtlas;
  v2 = -[SKTextureAtlas init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    textureDict = v2->_textureDict;
    v2->_textureDict = 0;

    atlasName = v3->_atlasName;
    v3->_atlasName = 0;

    -[SKTextureAtlas commonInit](v3, "commonInit");
  }
  return v3;
}

- (SKTextureAtlas)initWithCoder:(id)a3
{
  id v4;
  SKTextureAtlas *v5;
  SKTextureAtlas *v6;
  uint64_t v7;
  NSString *atlasName;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *textureDict;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKTextureAtlas;
  v5 = -[SKTextureAtlas init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKTextureAtlas commonInit](v5, "commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_atlasName"));
    v7 = objc_claimAutoreleasedReturnValue();
    atlasName = v6->_atlasName;
    v6->_atlasName = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_textureDict"));
    v12 = objc_claimAutoreleasedReturnValue();
    textureDict = v6->_textureDict;
    v6->_textureDict = (NSDictionary *)v12;

    objc_msgSend((id)_atlasDict, "setObject:forKey:", v6, v6->_atlasName);
    -[SKTextureAtlas _prePopulateCache](v6, "_prePopulateCache");
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_atlasName, CFSTR("_atlasName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_textureDict, CFSTR("_textureDict"));

}

- (BOOL)isEqualToTextureAtlas:(id)a3
{
  id v4;
  NSString *atlasName;
  uint64_t v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  atlasName = self->_atlasName;
  v6 = *((_QWORD *)v4 + 2);
  if (atlasName)
  {
    if (v6 && -[NSString isEqualToString:](atlasName, "isEqualToString:"))
      goto LABEL_4;
LABEL_15:
    v15 = 0;
    goto LABEL_20;
  }
  if (v6)
    goto LABEL_15;
LABEL_4:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_textureDict;
  v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_textureDict, "objectForKey:", v11, (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v4 + 1), "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {

LABEL_18:
          v15 = 0;
          goto LABEL_19;
        }
        v14 = objc_msgSend(v12, "isEqualToTexture:", v13);

        if ((v14 & 1) == 0)
          goto LABEL_18;
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v15 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v15 = 1;
  }
LABEL_19:

LABEL_20:
  return v15;
}

- (NSArray)textureNames
{
  NSDictionary *textureDict;

  textureDict = self->_textureDict;
  if (textureDict)
    -[NSDictionary allKeys](textureDict, "allKeys");
  else
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)canUseObjectForAtlas:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (SKTextureAtlas)atlasWithDictionary:(NSDictionary *)properties
{
  NSDictionary *v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SKTextureAtlas *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  SKTextureAtlasPacker *v17;
  id v18;
  id v20;

  v4 = properties;
  -[NSDictionary allValues](v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; objc_msgSend(v5, "count") > i; ++i)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("SKTextures aren't supported in [SKTextureAtlas atlasWithDictionary:].  Use UIImage, NSUrl or NSString instead."));
LABEL_10:

      v11 = 0;
      goto LABEL_17;
    }
    if ((objc_msgSend(a1, "canUseObjectForAtlas:", v7) & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported class:%@ passed into [SKTextureAtlas atlasWithDictionary:].  Use UIImage, NSUrl or NSString instead."), v14);

      goto LABEL_10;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[NSDictionary hash](v4, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_atlasDict, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v11 = objc_alloc_init(SKTextureAtlas);
    objc_storeStrong((id *)&v11->_atlasName, v8);
    -[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("format"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && (objc_msgSend(v15, "isEqualToString:", CFSTR("APPL")) & 1) != 0)
    {
      -[SKTextureAtlas parseAtlasPropertyList:withPath:](v11, "parseAtlasPropertyList:withPath:", v4, 0);
    }
    else
    {
      v17 = objc_alloc_init(SKTextureAtlasPacker);
      v20 = 0;
      -[SKTextureAtlasPacker generateTextureAtlasImages:outputDictionary:forcePOT:](v17, "generateTextureAtlasImages:outputDictionary:forcePOT:", v4, &v20, 0);
      v18 = v20;
      -[SKTextureAtlas parseAtlasPropertyList:withPath:](v11, "parseAtlasPropertyList:withPath:", v18, 0);

    }
  }

LABEL_17:
  return v11;
}

- (void)parseAtlasPropertyList:(id)a3 withPath:(id)a4
{
  id v5;
  void *v6;
  NSDictionary *v7;
  uint64_t v8;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  CGImageSource *v18;
  CGImageSource *v19;
  CGImage *ImageAtIndex;
  id v21;
  id v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSString *v31;
  double width;
  double height;
  NSString *v34;
  CGPoint v35;
  NSString *v36;
  CGSize v37;
  void *v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  NSDictionary *textureDict;
  void *v49;
  void *v50;
  void *v51;
  NSDictionary *v52;
  NSString *v53;
  CGSize v54;
  uint64_t v55;
  uint64_t k;
  uint64_t v57;
  void *v58;
  void *v59;
  NSString *v60;
  double v61;
  double v62;
  NSString *v63;
  CGSize v64;
  NSString *v65;
  CGPoint v66;
  NSString *v67;
  CGSize v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t m;
  NSDictionary *v76;
  NSDictionary *v77;
  void *v78;
  NSString *v79;
  CGSize v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t n;
  uint64_t v84;
  void *v85;
  NSString *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  NSString *v91;
  CGPoint v92;
  NSString *v93;
  CGSize v94;
  void *v95;
  float64x2_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  id obj;
  id obja;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  uint64_t v111;
  double v112;
  void *v113;
  double v114;
  double y;
  void *v117;
  double x;
  void *v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  CGSize v140;
  CGSize v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;

  v152 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v103 = a4;
  v104 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("format"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102 && objc_msgSend(v102, "isEqualToString:", CFSTR("APPL")))
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("version"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "intValue") == 1)
      {
        v97 = v6;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", CFSTR("images"));
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
        if (!v8)
          goto LABEL_45;
        v100 = *(_QWORD *)v143;
        __asm { FMOV            V0.2D, #0.5 }
        v96 = _Q0;
        while (1)
        {
          v14 = 0;
          v98 = v8;
          do
          {
            if (*(_QWORD *)v143 != v100)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * v14);
            objc_msgSend(v15, "objectForKey:", CFSTR("path"), *(_OWORD *)&v96);
            v108 = (id)objc_claimAutoreleasedReturnValue();
            v141 = (CGSize)0;
            objc_msgSend(v15, "objectForKey:", CFSTR("size"));
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            v107 = v14;
            v141 = CGSizeFromString(v16);

            v140 = v141;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[SKTexture textureWithCGImage:](SKTexture, "textureWithCGImage:", objc_msgSend(objc_retainAutorelease(v108), "CGImage"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_23;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = CGImageSourceCreateWithURL((CFURLRef)v108, 0);
              v19 = v18;
              if (v18)
              {
                ImageAtIndex = CGImageSourceCreateImageAtIndex(v18, 0, 0);
                CFRelease(v19);
                +[SKTexture textureWithCGImage:](SKTexture, "textureWithCGImage:", ImageAtIndex);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                CGImageRelease(ImageAtIndex);
                goto LABEL_23;
              }
LABEL_18:
              v17 = 0;
              goto LABEL_23;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_18;
            v21 = v108;
            if (v103)
            {
              objc_msgSend(v103, "stringByAppendingPathComponent:", v21);
              v22 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v22 = v21;
            }
            v23 = v22;
            +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lowercaseString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "rangeOfString:", CFSTR("@2x")) == 0x7FFFFFFFFFFFFFFFLL;

            if (!v25)
              v140 = (CGSize)vmulq_f64((float64x2_t)v140, v96);

LABEL_23:
            objc_msgSend(v17, "setTextureDimension:withPixelSize:", &v140, &v141);
            objc_msgSend(v15, "objectForKey:", CFSTR("subimages"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = v17;
            v138 = 0u;
            v139 = 0u;
            v136 = 0u;
            v137 = 0u;
            v109 = v26;
            v27 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
            if (v27)
            {
              v111 = *(_QWORD *)v137;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v137 != v111)
                    objc_enumerationMutation(v109);
                  v29 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
                  objc_msgSend(v29, "objectForKey:", CFSTR("aliases"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "objectForKey:", CFSTR("textureRect"));
                  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v153 = CGRectFromString(v31);
                  y = v153.origin.y;
                  x = v153.origin.x;
                  width = v153.size.width;
                  height = v153.size.height;

                  objc_msgSend(v29, "objectForKey:", CFSTR("spriteOffset"));
                  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v35 = CGPointFromString(v34);

                  objc_msgSend(v29, "objectForKey:", CFSTR("spriteSourceSize"));
                  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
                  v37 = CGSizeFromString(v36);

                  objc_msgSend(v29, "objectForKey:", CFSTR("textureRotated"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "BOOLValue");

                  if ((_DWORD)v39)
                    v40 = width;
                  else
                    v40 = height;
                  if ((_DWORD)v39)
                    v41 = height;
                  else
                    v41 = width;
                  +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v113, x / v141.width, (v141.height - (y + height)) / v141.height, width / v141.width, height / v141.height);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "setCropOffset:", (v35.x - (v37.width - v41) * 0.5) / v41, (v35.y - (v37.height - v40) * 0.5) / v40);
                  objc_msgSend(v42, "setIsRotated:", v39);
                  objc_msgSend(v42, "setCropScale:", v41 / v37.width, v40 / v37.height);
                  objc_msgSend(v29, "objectForKey:", CFSTR("name"));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "setSubTextureName:", v43);
                  objc_msgSend(v42, "setOriginalAtlasName:", self->_atlasName);
                  -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v42, v43);
                  v134 = 0u;
                  v135 = 0u;
                  v132 = 0u;
                  v133 = 0u;
                  v44 = v30;
                  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
                  if (v45)
                  {
                    v46 = *(_QWORD *)v133;
                    do
                    {
                      for (j = 0; j != v45; ++j)
                      {
                        if (*(_QWORD *)v133 != v46)
                          objc_enumerationMutation(v44);
                        -[NSDictionary setObject:forKey:](v7, "setObject:forKey:", v42, *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * j));
                      }
                      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
                    }
                    while (v45);
                  }

                }
                v27 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
              }
              while (v27);
            }

            v14 = v107 + 1;
          }
          while (v107 + 1 != v98);
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v151, 16);
          if (!v8)
          {
LABEL_45:

            textureDict = self->_textureDict;
            self->_textureDict = v7;

            v6 = v97;
            goto LABEL_80;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unsupported Texture Atlas Format"), CFSTR("Unsupported Texture Atlas Format Code 3"));
LABEL_80:

      goto LABEL_81;
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("metadata"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (!v49)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unsupported Texture Atlas Format"), CFSTR("Unsupported Texture Atlas Format Code 2"));
LABEL_82:

      goto LABEL_83;
    }
    objc_msgSend(v49, "objectForKey:", CFSTR("format"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v51, "intValue") == 3)
      {
        v99 = v51;
        v101 = v50;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v52 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", self->_atlasName);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", CFSTR("size"));
        v53 = (NSString *)objc_claimAutoreleasedReturnValue();
        v54 = CGSizeFromString(v53);

        objc_msgSend(v104, "objectForKey:", CFSTR("frames"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "allKeys");
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v110 = (id)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
        if (v55)
        {
          obja = *(id *)v129;
          do
          {
            for (k = 0; k != v55; ++k)
            {
              if (*(id *)v129 != obja)
                objc_enumerationMutation(v110);
              v57 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * k);
              objc_msgSend(v119, "objectForKey:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectForKey:", CFSTR("aliases"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectForKey:", CFSTR("textureRect"));
              v60 = (NSString *)objc_claimAutoreleasedReturnValue();
              v154 = CGRectFromString(v60);
              v112 = v154.origin.x;
              v114 = v154.size.width;
              v61 = v154.origin.y;
              v62 = v154.size.height;

              objc_msgSend(v58, "objectForKey:", CFSTR("spriteSize"));
              v63 = (NSString *)objc_claimAutoreleasedReturnValue();
              v64 = CGSizeFromString(v63);

              objc_msgSend(v58, "objectForKey:", CFSTR("spriteOffset"));
              v65 = (NSString *)objc_claimAutoreleasedReturnValue();
              v66 = CGPointFromString(v65);

              objc_msgSend(v58, "objectForKey:", CFSTR("spriteSourceSize"));
              v67 = (NSString *)objc_claimAutoreleasedReturnValue();
              v68 = CGSizeFromString(v67);

              objc_msgSend(v58, "objectForKey:", CFSTR("textureRotated"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "BOOLValue");

              +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v117, v112 / v54.width, (v54.height - (v61 + v62)) / v54.height, v114 / v54.width, v62 / v54.height);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "setCropOffset:", v66.x / v64.width, v66.y / v64.height);
              objc_msgSend(v71, "setIsRotated:", v70);
              objc_msgSend(v71, "setCropScale:", v64.width / v68.width, v64.height / v68.height);
              objc_msgSend(v71, "setSubTextureName:", v57);
              objc_msgSend(v71, "setOriginalAtlasName:", self->_atlasName);
              -[NSDictionary setObject:forKey:](v52, "setObject:forKey:", v71, v57);
              v126 = 0u;
              v127 = 0u;
              v124 = 0u;
              v125 = 0u;
              v72 = v59;
              v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v147, 16);
              if (v73)
              {
                v74 = *(_QWORD *)v125;
                do
                {
                  for (m = 0; m != v73; ++m)
                  {
                    if (*(_QWORD *)v125 != v74)
                      objc_enumerationMutation(v72);
                    -[NSDictionary setObject:forKey:](v52, "setObject:forKey:", v71, *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * m));
                  }
                  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v124, v147, 16);
                }
                while (v73);
              }

            }
            v55 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
          }
          while (v55);
        }

        v76 = self->_textureDict;
        self->_textureDict = v52;
LABEL_77:

LABEL_81:
        -[SKTextureAtlas _prePopulateCache](self, "_prePopulateCache");
        goto LABEL_82;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v51, "intValue") == 1)
      {
        v99 = v51;
        v101 = v50;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v77 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", CFSTR("textureFileName"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", v78);
        v117 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v101, "objectForKey:", CFSTR("size"));
        v79 = (NSString *)objc_claimAutoreleasedReturnValue();
        v80 = CGSizeFromString(v79);

        objc_msgSend(v104, "objectForKey:", CFSTR("frames"));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "allKeys");
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v110 = (id)objc_claimAutoreleasedReturnValue();
        v81 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v120, v146, 16);
        if (v81)
        {
          v82 = *(_QWORD *)v121;
          do
          {
            for (n = 0; n != v81; ++n)
            {
              if (*(_QWORD *)v121 != v82)
                objc_enumerationMutation(v110);
              v84 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * n);
              objc_msgSend(v119, "objectForKey:", v84);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "objectForKey:", CFSTR("frame"));
              v86 = (NSString *)objc_claimAutoreleasedReturnValue();
              v155 = CGRectFromString(v86);
              v87 = v155.origin.x;
              v88 = v155.origin.y;
              v89 = v155.size.width;
              v90 = v155.size.height;

              objc_msgSend(v85, "objectForKey:", CFSTR("offset"));
              v91 = (NSString *)objc_claimAutoreleasedReturnValue();
              v92 = CGPointFromString(v91);

              objc_msgSend(v85, "objectForKey:", CFSTR("sourceSize"));
              v93 = (NSString *)objc_claimAutoreleasedReturnValue();
              v94 = CGSizeFromString(v93);

              +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v117, v87 / v80.width, (v80.height - (v88 + v90)) / v80.height, v89 / v80.width, v90 / v80.height);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "setCropOffset:", v92.x, v92.y);
              objc_msgSend(v95, "setIsRotated:", 0);
              objc_msgSend(v95, "setCropScale:", v89 / v94.width, v90 / v94.height);
              -[NSDictionary setObject:forKey:](v77, "setObject:forKey:", v95, v84);

            }
            v81 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v120, v146, 16);
          }
          while (v81);
        }

        v76 = self->_textureDict;
        self->_textureDict = v77;
        goto LABEL_77;
      }
    }

    goto LABEL_81;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Unsupported Texture Atlas Format"), CFSTR("Unsupported Texture Atlas Format Code 1"));
LABEL_83:

}

- (void)loadTextures
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *atlasName;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x1E0D1A6A8], "defaultUICatalogForBundle:", 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  objc_msgSend(v26, "namedImageAtlasWithName:scaleFactor:deviceIdiom:", self->_atlasName, __deviceClassForInterfaceIdiom(v7), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[SKAnalytics instance](SKAnalytics, "instance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendAnalyticsDataWithKey:", CFSTR("com.apple.spritekit.atlas.coreui"));

    -[SKTextureAtlas loadTexturesFromCUIImageAtlas:](self, "loadTexturesFromCUIImageAtlas:", v8);
  }
  else
  {
    +[SKAnalytics instance](SKAnalytics, "instance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendAnalyticsDataWithKey:", CFSTR("com.apple.spritekit.atlas.local"));

    SKGetResourceBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathForResource:ofType:", self->_atlasName, CFSTR("plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[NSString pathExtension](self->_atlasName, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("plist"));

      atlasName = self->_atlasName;
      if (v14)
      {
        -[NSString pathExtension](atlasName, "pathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "caseInsensitiveCompare:", CFSTR("atlasc"));

        v18 = self->_atlasName;
        if (v17)
        {
          -[NSString stringByAppendingString:](self->_atlasName, "stringByAppendingString:", CFSTR(".atlasc"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString lastPathComponent](self->_atlasName, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v20);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[NSString lastPathComponent](self->_atlasName, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByDeletingPathExtension");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSString stringByAppendingPathComponent:](v18, "stringByAppendingPathComponent:", v22);
          v21 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v21 = atlasName;
      }
      SKGetResourceBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "pathForResource:ofType:", v21, CFSTR("plist"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v12, "stringByDeletingLastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      NSLog(CFSTR("Texture Atlas '%@' cannot be found."), self->_atlasName);

      goto LABEL_16;
    }
    objc_msgSend((id)_offlineAtlasCache, "objectForKey:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKTextureAtlas parseAtlasPropertyList:withPath:](self, "parseAtlasPropertyList:withPath:", v25, v24);
    objc_msgSend((id)_offlineAtlasCache, "removeObjectForKey:", v12);

  }
  objc_msgSend((id)_atlasDict, "setObject:forKey:", self, self->_atlasName);
LABEL_16:

}

+ (SKTextureAtlas)atlasNamed:(NSString *)name
{
  NSString *v3;
  void *v4;
  void *v5;
  SKTextureAtlas *v6;
  uint64_t v7;
  NSString *atlasName;

  v3 = name;
  objc_msgSend((id)_atlasDict, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = objc_alloc_init(SKTextureAtlas);
    -[NSString stringByDeletingPathExtension](v3, "stringByDeletingPathExtension");
    v7 = objc_claimAutoreleasedReturnValue();
    atlasName = v6->_atlasName;
    v6->_atlasName = (NSString *)v7;

    -[SKTextureAtlas loadTextures](v6, "loadTextures");
  }

  return v6;
}

- (id)createTextureFromProvider:(CGImageProvider *)a3 andSource:(CGImage *)a4
{
  __IOSurface *v5;
  __IOSurface *v6;
  uint64_t PixelFormat;
  CGColorSpace *ColorSpace;
  int ProcessColorModel;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t ID;
  size_t Width;

  v5 = (__IOSurface *)CGImageProviderCopyIOSurface();
  if (v5)
  {
    v6 = v5;
    PixelFormat = IOSurfaceGetPixelFormat(v5);
    ColorSpace = CGImageGetColorSpace(a4);
    ProcessColorModel = CGColorSpaceGetProcessColorModel();
    v10 = CGColorSpaceUsesExtendedRange(ColorSpace);
    switch((_DWORD)PixelFormat)
    {
      case 0x52476841:
        if (ProcessColorModel != 1 || !v10)
        {
          v12 = 0;
          goto LABEL_16;
        }
        v11 = 10;
        break;
      case 0x52474241:
        v11 = 3;
        break;
      case 0x42475241:
        v11 = 4;
        break;
      default:
        v12 = 0;
        NSLog(CFSTR("SKTexture: pixel format %d is not currently supported in SKTextureAtlas, falling back to individual SKTexture"), PixelFormat);
        goto LABEL_16;
    }
    ID = IOSurfaceGetID(v6);
    Width = IOSurfaceGetWidth(v6);
    +[SKTexture textureWithIOSurfaceID:width:height:format:](SKTexture, "textureWithIOSurfaceID:width:height:format:", ID, Width, IOSurfaceGetHeight(v6), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    CFRelease(v6);
    return v12;
  }
  v12 = 0;
  return v12;
}

- (id)createSubTextureFromTexture:(id)a3 andCUINamedImage:(id)a4 andOrigin:(CGPoint)a5
{
  double y;
  double x;
  id v8;
  id v9;
  CGImage *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  double Height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGImage *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v60;
  _QWORD v61[2];
  double v62;
  double v63;
  double v64[2];
  _QWORD v65[2];

  y = a5.y;
  x = a5.x;
  v8 = a3;
  v9 = a4;
  v10 = (CGImage *)objc_msgSend(v9, "croppedImage");
  objc_msgSend(v9, "size");
  v12 = v11;
  objc_msgSend(v9, "scale");
  v14 = v13;
  objc_msgSend(v9, "size");
  v16 = v15;
  objc_msgSend(v9, "scale");
  v17 = v12 * v14;
  v19 = v16 * v18;
  v60 = v17;
  *(double *)v65 = v17;
  *(double *)&v65[1] = v16 * v18;
  Width = (double)CGImageGetWidth(v10);
  Height = (double)CGImageGetHeight(v10);
  v64[0] = Width;
  v64[1] = Height;
  if (v8)
  {
    objc_msgSend(v8, "pixelSize");
    v23 = v22;
    objc_msgSend(v9, "scale");
    v25 = v24;
    objc_msgSend(v8, "pixelSize");
    v27 = v26;
    objc_msgSend(v9, "scale");
    v62 = v23 / v25;
    v63 = v27 / v28;
    objc_msgSend(v8, "pixelSize");
    v30 = v29;
    objc_msgSend(v8, "pixelSize");
    v32 = v31;
    objc_msgSend(v8, "pixelSize");
    v34 = v33;
    objc_msgSend(v8, "pixelSize");
    +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v8, x / v30, y / v32, Width / v34, Height / v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setIsFlipped:", 1);
    if (objc_msgSend(v9, "isAlphaCropped"))
    {
      objc_msgSend(v9, "alphaCroppedRect");
      v38 = v37;
      objc_msgSend(v9, "alphaCroppedRect");
      v40 = v39;
      objc_msgSend(v9, "alphaCroppedRect");
      objc_msgSend(v36, "setCropOffset:", (v38 - (v60 - (v38 + Width))) * 0.5 / Width, (v19 - (v40 + v41) - (v19 - (v19 - (v40 + v41) + Height))) * 0.5 / Height);
      objc_msgSend(v36, "setCropScale:", Width / v60, Height / v19);
    }
    objc_msgSend(v8, "pixelSize");
    v61[0] = v42;
    v61[1] = v43;
    objc_msgSend(v36, "setTextureDimension:withPixelSize:", &v62, v61);
  }
  else if (objc_msgSend(v9, "isAlphaCropped"))
  {
    objc_msgSend(v9, "alphaCroppedRect");
    v45 = v44;
    objc_msgSend(v9, "alphaCroppedRect");
    v47 = v46;
    objc_msgSend(v9, "alphaCroppedRect");
    v49 = v48;
    objc_msgSend(v9, "alphaCroppedRect");
    v51 = v50;
    objc_msgSend(v9, "alphaCroppedRect");
    v53 = +[SKTextureAtlas createCGImageFromCUINamedImage:withSize:atRect:](SKTextureAtlas, "createCGImageFromCUINamedImage:withSize:atRect:", v10, v60, v19, v45, v19 - (v47 + v49), v51, v52);
    +[SKTexture textureWithCGImage:](SKTexture, "textureWithCGImage:", v53);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v53);
    objc_msgSend(v9, "scale");
    v55 = v54;
    objc_msgSend(v9, "scale");
    v62 = v60 / v55;
    v63 = v19 / v56;
    objc_msgSend(v36, "setTextureDimension:withPixelSize:", &v62, v65);
  }
  else
  {
    +[SKTexture textureWithCGImage:](SKTexture, "textureWithCGImage:", v10);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v62 = v57;
    v63 = v58;
    objc_msgSend(v36, "setTextureDimension:withPixelSize:", &v62, v64);
  }

  return v36;
}

- (void)loadTexturesFromCUIImageAtlas:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int IsSubimage;
  int v12;
  _QWORD *v13;
  id v14;
  id *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSDictionary *textureDict;
  NSDictionary *v21;
  id obj;
  _QWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];
  int v30;
  _QWORD *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(v29, 0, sizeof(v29));
  v30 = 1065353216;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v3, "imageNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v3, "imageWithName:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "croppedImage");
        if (v7)
          v10 = v9 == 0;
        else
          v10 = 1;
        if (!v10)
        {
          v24[0] = 0;
          IsSubimage = CGImageIsSubimage();
          if (v24[0])
            v12 = IsSubimage;
          else
            v12 = 0;
          if (v12 == 1)
          {
            v13 = std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::find<CGImage *>(v29, v24);
            if (v13)
            {
              v14 = (id)v13[3];
            }
            else
            {
              -[SKTextureAtlas createTextureFromProvider:andSource:](self, "createTextureFromProvider:andSource:", CGImageGetImageProvider(), v24[0]);
              v14 = (id)objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                v31 = v24;
                v15 = (id *)std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::__emplace_unique_key_args<CGImage *,std::piecewise_construct_t const&,std::tuple<CGImage * const&>,std::tuple<>>((uint64_t)v29, v24, (uint64_t)&std::piecewise_construct, &v31);
                objc_storeStrong(v15 + 3, v14);
                v16 = v14;
              }

            }
          }
          else
          {
            v14 = 0;
          }
          -[SKTextureAtlas createSubTextureFromTexture:andCUINamedImage:andOrigin:](self, "createSubTextureFromTexture:andCUINamedImage:andOrigin:", v14, v8, *(double *)&v24[1], *(double *)&v24[2]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v18 = objc_msgSend(v3, "completeTextureExtrusion") ^ 1;
          else
            v18 = 1;
          objc_msgSend(v17, "setNeedsExtrusionWorkaround:", v18);
          objc_msgSend(v7, "stringByDeletingPathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_setImageName:", v19);

          -[NSDictionary setObject:forKey:](v21, "setObject:forKey:", v17, v7);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v4);
  }

  self->_isCUIImageAtlas = 1;
  textureDict = self->_textureDict;
  self->_textureDict = v21;

  std::__hash_table<std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::__unordered_map_hasher<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::hash<CGImage *>,std::equal_to<CGImage *>,true>,std::__unordered_map_equal<CGImage *,std::__hash_value_type<CGImage *,SKTexture * {__strong}>,std::equal_to<CGImage *>,std::hash<CGImage *>,true>,std::allocator<std::__hash_value_type<CGImage *,SKTexture * {__strong}>>>::~__hash_table((uint64_t)v29);
}

+ (id)atlasFromCUIImageAtlas:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SKTextureAtlas *v9;
  uint64_t v10;
  NSString *atlasName;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)_atlasDict, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v9 = objc_alloc_init(SKTextureAtlas);
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v10 = objc_claimAutoreleasedReturnValue();
    atlasName = v9->_atlasName;
    v9->_atlasName = (NSString *)v10;

    objc_msgSend((id)_atlasDict, "setObject:forKey:", v9, v9->_atlasName);
    if (v5)
      -[SKTextureAtlas loadTexturesFromCUIImageAtlas:](v9, "loadTexturesFromCUIImageAtlas:", v5);
  }

  return v9;
}

- (void)preloadWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  v6[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKTextureAtlas preloadTextureAtlases:withCompletionHandler:](SKTextureAtlas, "preloadTextureAtlases:withCompletionHandler:", v5, v4);

}

+ (void)preloadTextureAtlases:(NSArray *)textureAtlases withCompletionHandler:(void *)completionHandler
{
  NSArray *v5;
  void *v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = textureAtlases;
  v6 = completionHandler;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        if (*(_QWORD *)(v12 + 8))
        {
          v19 = 0u;
          v20 = 0u;
          v17 = 0u;
          v18 = 0u;
          objc_msgSend(*(id *)(v12 + 8), "objectEnumerator");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v18;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v18 != v15)
                  objc_enumerationMutation(v13);
                objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v14);
          }

        }
        ++v11;
      }
      while (v11 != v9);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v9);
  }

  +[SKTexture preloadTextures:withCompletionHandler:](SKTexture, "preloadTextures:withCompletionHandler:", v7, v6);
}

+ (void)preloadTextureAtlasesNamed:(NSArray *)atlasNames withCompletionHandler:(void *)completionHandler
{
  NSArray *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSArray *v9;
  _QWORD v10[4];
  NSArray *v11;
  id v12;

  v5 = atlasNames;
  v6 = completionHandler;
  dispatch_get_global_queue(17, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke;
  v10[3] = &unk_1EA500258;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x1E0D1A6A8], "defaultUICatalogForBundle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_2;
  v17[3] = &unk_1EA500208;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  v20 = *(id *)(a1 + 40);
  v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x1DF0CFCB0](v17);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_3;
    v13[3] = &unk_1EA500230;
    v14 = v9;
    v15 = v10;
    v16 = v11;
    objc_msgSend(v5, "preloadNamedAtlasWithScaleFactor:andNames:completionHandler:", v12, v13, v4);

  }
  else
  {
    v11[2](v11, 0);
  }

}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        +[SKTextureAtlas atlasNamed:](SKTextureAtlas, "atlasNamed:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v3, *(_QWORD *)(a1 + 40));

}

void __67__SKTextureAtlas_preloadTextureAtlasesNamed_withCompletionHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = (void *)a1[4];
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObject:", v11);

        v12 = (void *)a1[5];
        objc_msgSend(v9, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SKTextureAtlas atlasFromCUIImageAtlas:withName:](SKTextureAtlas, "atlasFromCUIImageAtlas:withName:", v9, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v14);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)description
{
  NSDictionary *textureDict;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSString *atlasName;
  void *v8;
  void *v9;
  void *v10;

  textureDict = self->_textureDict;
  if (textureDict && (v4 = -[NSDictionary count](textureDict, "count")) != 0)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    atlasName = self->_atlasName;
    -[NSDictionary allValues](self->_textureDict, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<SKTextureAtlas> '%@' %ld textures:\n %@"), atlasName, v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<SKTextureAtlas> '%@' 0 textures"), self->_atlasName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[SKTextureAtlas unload](self, "unload");
  v3.receiver = self;
  v3.super_class = (Class)SKTextureAtlas;
  -[SKTextureAtlas dealloc](&v3, sel_dealloc);
}

- (id)findTextureNamedFromAtlas:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  SKTextureAtlas *v31;
  id obj;
  __int128 v33;
  __int128 v34;
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
  void *__p[2];
  char v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v5 = std::__hash_table<std::__hash_value_type<std::string,SKTexture * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKTexture * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKTexture * {__strong}>>>::find<std::string>(&self->_textureMap.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
  if (v5)
  {
    v6 = *((id *)v5 + 5);
  }
  else
  {
    objc_msgSend(v4, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = self;
    v8 = objc_msgSend(v7, "length");

    +[SKTextureAtlas getSupportedPostfixes](SKTextureAtlas, "getSupportedPostfixes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v4, "stringByDeletingPathExtension");
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v10;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v11 = v30;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v42;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(v4, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v12);
    }

    if (v31->_textureDict)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v16 = v9;
      v28 = v16;
      v26 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v38;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v16);
            v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v29);
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            -[NSDictionary allKeys](v31->_textureDict, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            obj = v18;
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v34;
              while (2)
              {
                v21 = 0;
                do
                {
                  if (*(_QWORD *)v34 != v20)
                    objc_enumerationMutation(obj);
                  v22 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v21);
                  objc_msgSend(v22, "stringByDeletingPathExtension");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!objc_msgSend(v23, "caseInsensitiveCompare:", v17))
                  {
                    -[NSDictionary objectForKey:](v31->_textureDict, "objectForKey:", v22);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v6 = (id)objc_msgSend(v24, "copy");
                    objc_msgSend(v6, "setRootAtlas:", v31);

                    goto LABEL_31;
                  }

                  ++v21;
                }
                while (v19 != v21);
                v18 = obj;
                v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
                if (v19)
                  continue;
                break;
              }
            }

            v16 = v28;
            ++v29;
          }
          while (v29 != v26);
          v26 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
        }
        while (v26);
      }

    }
    v6 = (id)objc_msgSend(0, "copy");
    objc_msgSend(v6, "setRootAtlas:", v31);
LABEL_31:

  }
  if (v46 < 0)
    operator delete(__p[0]);

  return v6;
}

- (SKTexture)textureNamed:(NSString *)name
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SKTextureAtlas findTextureNamedFromAtlas:](self, "findTextureNamedFromAtlas:", name);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SKTexture _textureWithImageNamed:](SKTexture, "_textureWithImageNamed:", CFSTR("MissingResource.png"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (SKTexture *)v6;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>>>::~__hash_table((uint64_t)&self->_textureMap);
  objc_storeStrong((id *)&self->_atlasName, 0);
  objc_storeStrong((id *)&self->_textureDict, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  return self;
}

+ (CGImage)createCGImageFromCUINamedImage:(CGImage *)a3 withSize:(CGSize)a4 atRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  size_t v12;
  size_t v13;
  void *v14;
  CGColorSpace *DeviceRGB;
  CGContext *v16;
  CGImage *Image;
  CGRect v19;
  CGRect v20;

  if (!a3)
    return 0;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.height;
  v10 = a4.width;
  v12 = a4.width;
  v13 = a4.height;
  v14 = malloc_type_malloc((4 * v13 * v12), 0x4C290508uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v16 = CGBitmapContextCreate(v14, v12, v13, 8uLL, (4 * v12), DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v10;
  v19.size.height = v9;
  CGContextClearRect(v16, v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  CGContextDrawImage(v16, v20, a3);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  free(v14);
  return Image;
}

+ (id)getSupportedPostfixes
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  if (!+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceIdiom");

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = v5;

    if (v3 == 1)
    {
      v7 = &unk_1EA51B7E0;
      v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      if (v6 >= 2.0)
        v7 = &unk_1EA51B7C8;
    }
    else if (v6 < 2.0)
    {
      v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      v7 = &unk_1EA51B840;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "size");
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bounds");
      v15 = v14;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      v18 = v17;

      if (v15 >= v18)
        v19 = v15;
      else
        v19 = v18;
      v8 = (void *)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
      if (v19 == 736.0)
      {
        v7 = &unk_1EA51B7F8;
      }
      else
      {
        v7 = &unk_1EA51B828;
        if (v12 == 1136.0)
          v7 = &unk_1EA51B810;
      }
    }
    +[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes = (uint64_t)v7;

  }
  return (id)+[SKTextureAtlas(Internal) getSupportedPostfixes]::s_postfixes;
}

+ (id)findTextureNamed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t n;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t ii;
  id v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t m;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  if (_atlasDict)
  {
    objc_msgSend((id)_atlasDict, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; i = v9)
    {
      objc_msgSend(v7, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {

        goto LABEL_9;
      }
      objc_msgSend((id)_atlasDict, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "findTextureNamedFromAtlas:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        break;

    }
    v13 = v11;

    v36 = v13;
  }
  else
  {
LABEL_9:
    SKGetResourceBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathsForResourcesOfType:inDirectory:", CFSTR(".atlasc"), &stru_1EA5021F8);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      obj = v13;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v14)
      {
        v47 = *(_QWORD *)v71;
        do
        {
          v45 = v14;
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v71 != v47)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_msgSend(v16, "lastPathComponent");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)_atlasDict, "objectForKey:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v17 == 0;

            if (v18)
            {
              objc_msgSend(v53, "stringByDeletingPathExtension");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByAppendingPathComponent:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "stringByAppendingString:", CFSTR(".plist"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend((id)_offlineAtlasCache, "objectForKey:", v51);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v21)
              {
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v51);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                  objc_msgSend((id)_offlineAtlasCache, "setObject:forKey:", v21, v51);
              }
              v46 = v21;
              +[SKTextureAtlas getSupportedPostfixes](SKTextureAtlas, "getSupportedPostfixes");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKey:", CFSTR("images"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v49 = v22;
              v39 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
              if (v39)
              {
                v41 = *(_QWORD *)v67;
                do
                {
                  for (k = 0; k != v39; ++k)
                  {
                    if (*(_QWORD *)v67 != v41)
                      objc_enumerationMutation(v49);
                    objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * k), "objectForKey:", CFSTR("subimages"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = 0u;
                    v65 = 0u;
                    v62 = 0u;
                    v63 = 0u;
                    v50 = v23;
                    v40 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                    if (v40)
                    {
                      v42 = *(_QWORD *)v63;
                      do
                      {
                        for (m = 0; m != v40; ++m)
                        {
                          if (*(_QWORD *)v63 != v42)
                            objc_enumerationMutation(v50);
                          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * m), "objectForKey:", CFSTR("name"));
                          v24 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v48, "count"));
                          v25 = (void *)objc_claimAutoreleasedReturnValue();
                          v60 = 0u;
                          v61 = 0u;
                          v58 = 0u;
                          v59 = 0u;
                          v26 = v48;
                          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
                          if (v27)
                          {
                            v28 = *(_QWORD *)v59;
                            do
                            {
                              for (n = 0; n != v27; ++n)
                              {
                                if (*(_QWORD *)v59 != v28)
                                  objc_enumerationMutation(v26);
                                objc_msgSend(v3, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * n));
                                v30 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v25, "addObject:", v30);

                              }
                              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
                            }
                            while (v27);
                          }

                          objc_msgSend(v24, "stringByDeletingPathExtension");
                          v31 = (void *)objc_claimAutoreleasedReturnValue();

                          v56 = 0u;
                          v57 = 0u;
                          v54 = 0u;
                          v55 = 0u;
                          v32 = v25;
                          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
                          if (v33)
                          {
                            v34 = *(_QWORD *)v55;
                            while (2)
                            {
                              for (ii = 0; ii != v33; ++ii)
                              {
                                if (*(_QWORD *)v55 != v34)
                                  objc_enumerationMutation(v32);
                                if (!objc_msgSend(v31, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * ii)))
                                {
                                  +[SKTextureAtlas atlasNamed:](SKTextureAtlas, "atlasNamed:", v53);
                                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v37, "textureNamed:", v3);
                                  v36 = (id)objc_claimAutoreleasedReturnValue();

                                  v13 = v36;
                                  goto LABEL_56;
                                }
                              }
                              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
                              if (v33)
                                continue;
                              break;
                            }
                          }

                        }
                        v40 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
                      }
                      while (v40);
                    }

                  }
                  v39 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
                }
                while (v39);
              }

            }
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v14);
      }

      v36 = 0;
      v13 = obj;
    }
    else
    {
      v36 = 0;
    }
  }
LABEL_56:

  return v36;
}

+ (id)lookupCachedTextureNamed:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v6;
  }
  objc_msgSend((id)_atlasDict, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), "findTextureNamedFromAtlas:", v3, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;

          v10 = v14;
          goto LABEL_13;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = v9;
LABEL_13:

  return v10;
}

- (void)unload
{
  NSDictionary *textureDict;

  objc_msgSend((id)_atlasDict, "removeObjectForKey:", self->_atlasName);
  textureDict = self->_textureDict;
  self->_textureDict = 0;

  std::__hash_table<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,SKAttributeValue * {__strong}>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,SKAttributeValue * {__strong}>>>::clear((uint64_t)&self->_textureMap);
}

+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_exportAtlasWithDictionary:toFile:forcePOT:", v6, v5, 0);

}

+ (void)_exportAtlasWithDictionary:(id)a3 toFile:(id)a4 forcePOT:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  UIImage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  SKTextureAtlasPacker *v26;
  id v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = a4;
  v25 = v7;
  v35 = 0;
  v26 = objc_alloc_init(SKTextureAtlasPacker);
  -[SKTextureAtlasPacker generateTextureAtlasImages:outputDictionary:forcePOT:](v26, "generateTextureAtlasImages:outputDictionary:forcePOT:", v7, &v35, v5);
  v27 = v35;
  objc_msgSend(v29, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v8, "caseInsensitiveCompare:", CFSTR("plist")) == 0;

  if ((a4 & 1) == 0)
  {
    objc_msgSend(v29, "stringByAppendingPathExtension:", CFSTR("plist"));
    v9 = objc_claimAutoreleasedReturnValue();

    v29 = (id)v9;
  }
  if (v27)
  {
    objc_msgSend(v27, "objectForKey:", CFSTR("images"));
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKey:", CFSTR("path"));
          v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(".%ld.png"), 1);
          objc_msgSend(v29, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByDeletingPathExtension");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "stringByAppendingString:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "stringByDeletingLastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringByAppendingPathComponent:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          UIImagePNGRepresentation(v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "writeToFile:atomically:", v20, 1);

          objc_msgSend(v13, "setObject:forKey:", v18, CFSTR("path"));
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    v30 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v27, 200, 0, &v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v30;
    if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "createFileAtPath:contents:attributes:", v29, v22, 0);

    }
  }

}

- (id)_copyImageData
{
  NSDictionary *textureDict;
  void *v3;
  void *v4;
  void *v5;

  textureDict = self->_textureDict;
  if (!textureDict)
    return 0;
  -[NSDictionary allValues](textureDict, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "_copyImageData");

  return v5;
}

@end
