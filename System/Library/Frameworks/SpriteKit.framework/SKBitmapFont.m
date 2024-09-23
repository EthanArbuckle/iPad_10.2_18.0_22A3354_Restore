@implementation SKBitmapFont

- (id)fontName
{
  return self->_fileName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKBitmapFont)init
{
  SKBitmapFont *v2;
  SKBitmapFont *v3;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, SKSpriteNode *>, void *>>> *p_pair1;
  _QWORD *v5;
  unint64_t v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, double>, void *>>> *v7;
  _QWORD *v8;
  unint64_t v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, double>, void *>>> *v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SKBitmapFont;
  v2 = -[SKBitmapFont init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_internal = 0;
    v15 = 0;
    v16 = 0;
    v14 = &v15;
    p_pair1 = &v2->_characterSpriteByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v2->_characterSpriteByChar, (_QWORD *)v2->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
    v5 = v15;
    v3->_characterSpriteByChar.__tree_.__begin_node_ = &v15;
    p_pair1->__value_.__left_ = v5;
    v6 = v16;
    v3->_characterSpriteByChar.__tree_.__pair3_.__value_ = v16;
    if (v6)
    {
      v5[2] = p_pair1;
      v14 = &v15;
      v15 = 0;
      v16 = 0;
      v5 = 0;
    }
    else
    {
      v3->_characterSpriteByChar.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v14, v5);
    v15 = 0;
    v16 = 0;
    v14 = &v15;
    v7 = &v3->_characterAdvanceByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v3->_characterAdvanceByChar, (_QWORD *)v3->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
    v8 = v15;
    v3->_characterAdvanceByChar.__tree_.__begin_node_ = v14;
    v3->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_ = v8;
    v9 = v16;
    v3->_characterAdvanceByChar.__tree_.__pair3_.__value_ = v16;
    if (v9)
    {
      v8[2] = v7;
      v14 = &v15;
      v15 = 0;
      v16 = 0;
      v8 = 0;
    }
    else
    {
      v3->_characterAdvanceByChar.__tree_.__begin_node_ = v7;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v14, v8);
    v15 = 0;
    v16 = 0;
    v14 = &v15;
    v10 = &v3->_characterKerningByCharPair.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v3->_characterKerningByCharPair, (_QWORD *)v3->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
    v11 = v15;
    v3->_characterKerningByCharPair.__tree_.__begin_node_ = v14;
    v3->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_ = v11;
    v12 = v16;
    v3->_characterKerningByCharPair.__tree_.__pair3_.__value_ = v16;
    if (v12)
    {
      v11[2] = v10;
      v14 = &v15;
      v15 = 0;
      v16 = 0;
      v11 = 0;
    }
    else
    {
      v3->_characterKerningByCharPair.__tree_.__begin_node_ = v10;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v14, v11);
    if (onceToken != -1)
      dispatch_once(&onceToken, &__block_literal_global);
  }
  return v3;
}

void __20__SKBitmapFont_init__block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_fontDict;
  _fontDict = v1;

}

- (SKBitmapFont)initWithCoder:(id)a3
{
  id v4;
  SKBitmapFont *v5;
  SKBitmapFont *v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, SKSpriteNode *>, void *>>> *p_pair1;
  _QWORD *v8;
  unint64_t v9;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned short, double>, void *>>> *v10;
  _QWORD *v11;
  unint64_t v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, double>, void *>>> *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  NSString *fileName;
  void *v18;
  uint64_t v19;
  NSString *filePath;
  void *v21;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SKBitmapFont;
  v5 = -[SKBitmapFont init](&v26, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_internal = 0;
    v24 = 0;
    v25 = 0;
    v23 = &v24;
    p_pair1 = &v5->_characterSpriteByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v5->_characterSpriteByChar, (_QWORD *)v5->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
    v8 = v24;
    v6->_characterSpriteByChar.__tree_.__begin_node_ = &v24;
    p_pair1->__value_.__left_ = v8;
    v9 = v25;
    v6->_characterSpriteByChar.__tree_.__pair3_.__value_ = v25;
    if (v9)
    {
      v8[2] = p_pair1;
      v23 = &v24;
      v24 = 0;
      v25 = 0;
      v8 = 0;
    }
    else
    {
      v6->_characterSpriteByChar.__tree_.__begin_node_ = p_pair1;
    }
    std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v23, v8);
    v24 = 0;
    v25 = 0;
    v23 = &v24;
    v10 = &v6->_characterAdvanceByChar.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v6->_characterAdvanceByChar, (_QWORD *)v6->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
    v11 = v24;
    v6->_characterAdvanceByChar.__tree_.__begin_node_ = v23;
    v6->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_ = v11;
    v12 = v25;
    v6->_characterAdvanceByChar.__tree_.__pair3_.__value_ = v25;
    if (v12)
    {
      v11[2] = v10;
      v23 = &v24;
      v24 = 0;
      v25 = 0;
      v11 = 0;
    }
    else
    {
      v6->_characterAdvanceByChar.__tree_.__begin_node_ = v10;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v23, v11);
    v24 = 0;
    v25 = 0;
    v23 = &v24;
    v13 = &v6->_characterKerningByCharPair.__tree_.__pair1_;
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v6->_characterKerningByCharPair, (_QWORD *)v6->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
    v14 = v24;
    v6->_characterKerningByCharPair.__tree_.__begin_node_ = v23;
    v6->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_ = v14;
    v15 = v25;
    v6->_characterKerningByCharPair.__tree_.__pair3_.__value_ = v25;
    if (v15)
    {
      v14[2] = v13;
      v23 = &v24;
      v24 = 0;
      v25 = 0;
      v14 = 0;
    }
    else
    {
      v6->_characterKerningByCharPair.__tree_.__begin_node_ = v13;
    }
    std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v23, v14);
    if (onceToken != -1)
      dispatch_once(&onceToken, &__block_literal_global_3);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_fileName"));
    v16 = objc_claimAutoreleasedReturnValue();
    fileName = v6->_fileName;
    v6->_fileName = (NSString *)v16;

    SKGetResourceBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathForResource:ofType:", v6->_fileName, CFSTR("fnt"));
    v19 = objc_claimAutoreleasedReturnValue();
    filePath = v6->_filePath;
    v6->_filePath = (NSString *)v19;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v6->_filePath, 4, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKBitmapFont loadFontWithTexture:fontDataString:](v6, "loadFontWithTexture:fontDataString:", 0, v21);

  }
  return v6;
}

void __30__SKBitmapFont_initWithCoder___block_invoke()
{
  SKThreadSafeMapTable *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SKThreadSafeMapTable initWithNSMapTable:](v0, "initWithNSMapTable:");
  v2 = (void *)_fontDict;
  _fontDict = v1;

}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fileName, CFSTR("_fileName"));
}

- (BOOL)loadFontWithTexture:(id)a3 fontDataString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t *v116;
  uint64_t *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  __CFString *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t **v127;
  void *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t *v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  void *v163;
  int v164;
  int v166;
  unint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  double v172;
  void *v173;
  id obj;
  void *v175;
  id v176;
  SKBitmapFont *v177;
  int v178;
  uint64_t *v179;
  _QWORD *v180[2];
  uint64_t *v181;
  _QWORD *v182[2];
  id *v183;
  id v184[2];
  _WORD *v185[2];

  v176 = a3;
  v171 = a4;
  v177 = self;
  obj = (id)objc_opt_new();
  v184[0] = 0;
  v184[1] = 0;
  v182[1] = 0;
  v183 = v184;
  v181 = (uint64_t *)v182;
  v182[0] = 0;
  v180[0] = 0;
  v180[1] = 0;
  v179 = (uint64_t *)v180;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v171;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", CFSTR("info face=\"));
    objc_msgSend(v9, "substringFromIndex:", v10 + v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "rangeOfString:", CFSTR("\")));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v177->_fontName, v169);
    objc_msgSend(v8, "objectAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("common lineHeight="));
    objc_msgSend(v13, "substringFromIndex:", v14 + v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "rangeOfString:", CFSTR(" ")));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v177->_lineHeight = v18;

    v19 = objc_msgSend(v16, "rangeOfString:", CFSTR("base="));
    objc_msgSend(v16, "substringFromIndex:", v19 + v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "substringToIndex:", objc_msgSend(v21, "rangeOfString:", CFSTR(" ")));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v177->_baseLine = v23;

    objc_msgSend(v8, "objectAtIndex:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "rangeOfString:", CFSTR("file=\"));
    objc_msgSend(v24, "substringFromIndex:", v25 + v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "rangeOfString:", CFSTR("\")));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v176)
    {
      if (v177->_internal)
        +[SKTexture _textureWithImageNamed:](SKTexture, "_textureWithImageNamed:", v170);
      else
        +[SKTexture textureWithImageNamed:](SKTexture, "textureWithImageNamed:", v170);
      v176 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "objectAtIndex:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v29, "rangeOfString:", CFSTR("chars count="));
    objc_msgSend(v29, "substringFromIndex:", v30 + v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = objc_msgSend(v32, "intValue");
    v28 = 0;
    if (v33 >= 1 && v176)
    {
      if (objc_msgSend(v8, "count") >= (unint64_t)(v33 + 4))
      {
        v167 = (v33 + 4);
        v168 = v7;
        v173 = v8;
        objc_msgSend(v176, "pixelSize");
        v172 = v34;
        v36 = v35;
        v37 = 0;
        v166 = v33;
        v38 = v33;
        do
        {
          LOWORD(v178) = 0;
          objc_msgSend(v173, "objectAtIndex:", v37 + 4);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objc_msgSend(v39, "rangeOfString:", CFSTR("id="));
          objc_msgSend(v39, "substringFromIndex:", v40 + v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = objc_msgSend(v42, "rangeOfString:", CFSTR(" "));
          v45 = v44;
          objc_msgSend(v42, "substringToIndex:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "intValue");

          objc_msgSend(v42, "substringFromIndex:", v43 + v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = objc_msgSend(v48, "rangeOfString:", CFSTR("x="));
          objc_msgSend(v48, "substringFromIndex:", v49 + v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v52 = objc_msgSend(v51, "rangeOfString:", CFSTR(" "));
          v54 = v53;
          objc_msgSend(v51, "substringToIndex:", v52);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "doubleValue");
          v57 = v56;

          objc_msgSend(v51, "substringFromIndex:", v52 + v54);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = objc_msgSend(v58, "rangeOfString:", CFSTR("y="));
          objc_msgSend(v58, "substringFromIndex:", v59 + v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          v62 = objc_msgSend(v61, "rangeOfString:", CFSTR(" "));
          v64 = v63;
          objc_msgSend(v61, "substringToIndex:", v62);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "doubleValue");
          v67 = v66;

          objc_msgSend(v61, "substringFromIndex:", v62 + v64);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v69 = objc_msgSend(v68, "rangeOfString:", CFSTR("width="));
          objc_msgSend(v68, "substringFromIndex:", v69 + v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = objc_msgSend(v71, "rangeOfString:", CFSTR(" "));
          v74 = v73;
          objc_msgSend(v71, "substringToIndex:", v72);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "doubleValue");
          v77 = v76;

          objc_msgSend(v71, "substringFromIndex:", v72 + v74);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          v79 = objc_msgSend(v78, "rangeOfString:", CFSTR("height="));
          objc_msgSend(v78, "substringFromIndex:", v79 + v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();

          v82 = objc_msgSend(v81, "rangeOfString:", CFSTR(" "));
          v84 = v83;
          objc_msgSend(v81, "substringToIndex:", v82);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "doubleValue");
          v87 = v86;

          objc_msgSend(v81, "substringFromIndex:", v82 + v84);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          v89 = objc_msgSend(v88, "rangeOfString:", CFSTR("xoffset="));
          objc_msgSend(v88, "substringFromIndex:", v89 + v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v92 = objc_msgSend(v91, "rangeOfString:", CFSTR(" "));
          v94 = v93;
          objc_msgSend(v91, "substringToIndex:", v92);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "doubleValue");
          v97 = v96;

          objc_msgSend(v91, "substringFromIndex:", v92 + v94);
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          v99 = objc_msgSend(v98, "rangeOfString:", CFSTR("yoffset="));
          objc_msgSend(v98, "substringFromIndex:", v99 + v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();

          v102 = objc_msgSend(v101, "rangeOfString:", CFSTR(" "));
          v104 = v103;
          objc_msgSend(v101, "substringToIndex:", v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "doubleValue");
          v107 = v106;

          objc_msgSend(v101, "substringFromIndex:", v102 + v104);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          v109 = objc_msgSend(v108, "rangeOfString:", CFSTR("xadvance="));
          objc_msgSend(v108, "substringFromIndex:", v109 + v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          v112 = objc_msgSend(v111, "rangeOfString:", CFSTR(" "));
          v114 = v113;
          objc_msgSend(v111, "substringToIndex:", v112);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "doubleValue");
          v117 = v116;

          objc_msgSend(v111, "substringFromIndex:", v112 + v114);
          v118 = (void *)objc_claimAutoreleasedReturnValue();

          v119 = objc_msgSend(v118, "rangeOfString:", CFSTR("letter=\"));
          objc_msgSend(v118, "substringFromIndex:", v119 + v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v121, "substringToIndex:", objc_msgSend(v121, "rangeOfString:", CFSTR("\")));
          v122 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString isEqualToString:](v122, "isEqualToString:", CFSTR("space")))
          {
            LOWORD(v178) = 32;

            v122 = CFSTR(" ");
          }
          else if (-[__CFString length](v122, "length"))
          {
            LOWORD(v178) = -[__CFString characterAtIndex:](v122, "characterAtIndex:", 0);
          }
          else
          {
            LOWORD(v178) = 0;
          }
          +[SKTexture textureWithRect:inTexture:](SKTexture, "textureWithRect:inTexture:", v176, v57 / v172, (v36 - (v67 + v87)) / v36, v77 / v172, v87 / v36);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          if (SKGetGlobalFlippedFlag())
          {
            +[SKSpriteNode spriteNodeWithTexture:](SKSpriteNode, "spriteNodeWithTexture:", v123);
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "setAnchorPoint:", 0.0, 0.0);
            v125 = v124;
            objc_msgSend(v124, "setPosition:", v97, v107 - v177->_lineHeight);
          }
          else
          {
            +[SKSpriteNode spriteNodeWithTexture:](SKSpriteNode, "spriteNodeWithTexture:", v123);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "setAnchorPoint:", 0.0, 1.0);
            v125 = v126;
            objc_msgSend(v126, "setPosition:", v97, v177->_lineHeight - v107);
          }
          objc_msgSend(obj, "addObject:", v125);
          v185[0] = &v178;
          v127 = std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&v183, (unsigned __int16 *)&v178, (uint64_t)&std::piecewise_construct, v185);
          objc_storeStrong((id *)v127 + 5, v125);
          v185[0] = &v178;
          std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>(&v181, (unsigned __int16 *)&v178, (uint64_t)&std::piecewise_construct, v185)[5] = v117;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "setObject:forKey:", v122, v128);

          ++v37;
          v32 = v121;
        }
        while (v38 != v37);
        if (objc_msgSend(v173, "count") > v167)
        {
          objc_msgSend(v173, "objectAtIndex:", v167);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          v130 = objc_msgSend(v129, "rangeOfString:", CFSTR("kernings count="));
          if (v130 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v121 = v129;
          }
          else
          {
            objc_msgSend(v129, "substringFromIndex:", v130 + v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();

            v133 = objc_msgSend(v132, "intValue");
            if (objc_msgSend(v173, "count") <= (unint64_t)(v133 + (int)v167) || v133 < 1)
            {
              v121 = v132;
            }
            else
            {
              v134 = v133;
              v135 = v166 + 5;
              v121 = v132;
              do
              {
                objc_msgSend(v173, "objectAtIndex:", v135);
                v136 = (void *)objc_claimAutoreleasedReturnValue();

                v137 = objc_msgSend(v136, "rangeOfString:", CFSTR("first="));
                objc_msgSend(v136, "substringFromIndex:", v137 + v138);
                v139 = (void *)objc_claimAutoreleasedReturnValue();

                v140 = objc_msgSend(v139, "rangeOfString:", CFSTR(" "));
                v142 = v141;
                objc_msgSend(v139, "substringToIndex:", v140);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = objc_msgSend(v143, "intValue");

                objc_msgSend(v139, "substringFromIndex:", v140 + v142);
                v145 = (void *)objc_claimAutoreleasedReturnValue();

                v146 = objc_msgSend(v145, "rangeOfString:", CFSTR("second="));
                objc_msgSend(v145, "substringFromIndex:", v146 + v147);
                v148 = (void *)objc_claimAutoreleasedReturnValue();

                v149 = objc_msgSend(v148, "rangeOfString:", CFSTR(" "));
                v151 = v150;
                objc_msgSend(v148, "substringToIndex:", v149);
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                v153 = objc_msgSend(v152, "intValue");

                objc_msgSend(v148, "substringFromIndex:", v149 + v151);
                v154 = (void *)objc_claimAutoreleasedReturnValue();

                v155 = objc_msgSend(v154, "rangeOfString:", CFSTR("amount="));
                objc_msgSend(v154, "substringFromIndex:", v155 + v156);
                v121 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v121, "doubleValue");
                v158 = v157;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v144);
                v159 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "objectForKey:", v159);
                v160 = (void *)objc_claimAutoreleasedReturnValue();
                v161 = objc_msgSend(v160, "characterAtIndex:", 0);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v153);
                v162 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "objectForKey:", v162);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                v164 = objc_msgSend(v163, "characterAtIndex:", 0);

                if (v161 && v164)
                {
                  v178 = v164 | (v161 << 16);
                  v185[0] = &v178;
                  std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v179, (unsigned int *)&v178, (uint64_t)&std::piecewise_construct, (_DWORD **)v185)[5] = v158;
                }
                ++v135;
                --v134;
              }
              while (v134);
            }
          }
        }
        objc_storeStrong((id *)&v177->_characterSprites, obj);
        v7 = v168;
        v8 = v173;
        if (&v177->_characterSpriteByChar != (map<unsigned short, SKSpriteNode *, std::less<unsigned short>, std::allocator<std::pair<const unsigned short, SKSpriteNode *>>> *)&v183)
          std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__tree_node<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,void *> *,long>>((uint64_t **)&v177->_characterSpriteByChar, v183, v184);
        if (&v177->_characterAdvanceByChar != (map<unsigned short, double, std::less<unsigned short>, std::allocator<std::pair<const unsigned short, double>>> *)&v181)
          std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned short,double>,std::__tree_node<std::__value_type<unsigned short,double>,void *> *,long>>((uint64_t **)&v177->_characterAdvanceByChar, v181, v182);
        if (&v177->_characterKerningByCharPair != (map<unsigned int, double, std::less<unsigned int>, std::allocator<std::pair<const unsigned int, double>>> *)&v179)
          std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned int,double>,std::__tree_node<std::__value_type<unsigned int,double>,void *> *,long>>((uint64_t **)&v177->_characterKerningByCharPair, v179, v180);
        if (v177->_fileName)
          objc_msgSend((id)_fontDict, "setObject:forKey:");
        v28 = 1;
        v32 = v121;
      }
      else
      {
        v28 = 0;
      }
    }

  }
  else
  {
    v28 = 0;
  }

  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v179, v180[0]);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&v181, v182[0]);
  std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&v183, (_QWORD *)v184[0]);

  return v28;
}

+ (id)fontForFileNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SKBitmapFont *v7;
  void *v8;
  void *v9;
  SKBitmapFont *v10;
  void *v11;
  _BOOL4 v12;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)_fontDict, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      SKGetResourceBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pathForResource:ofType:", v4, CFSTR("fnt"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_alloc_init(SKBitmapFont);
        objc_storeStrong((id *)&v10->_fileName, a3);
        objc_storeStrong((id *)&v10->_filePath, v9);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v10->_filePath, 4, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SKBitmapFont loadFontWithTexture:fontDataString:](v10, "loadFontWithTexture:fontDataString:", 0, v11);

        if (v12)
          v7 = v10;
        else
          v7 = 0;

      }
      else
      {
        v7 = 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)spriteForCharacterNamed:(unsigned __int16)a3
{
  unsigned __int16 v4;
  unsigned __int16 *v5;

  v4 = a3;
  v5 = &v4;
  return (id)objc_msgSend(std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&self->_characterSpriteByChar, &v4, (uint64_t)&std::piecewise_construct, &v5)[5], "copy");
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (double)advanceForCharacterNamed:(unsigned __int16)a3
{
  unsigned __int16 v4;
  unsigned __int16 *v5;

  v4 = a3;
  v5 = &v4;
  return *((double *)std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short const&>,std::tuple<>>((uint64_t **)&self->_characterAdvanceByChar, &v4, (uint64_t)&std::piecewise_construct, &v5)+ 5);
}

- (double)kerningForCharacterNamed:(unsigned __int16)a3 followedBy:(unsigned __int16)a4
{
  unsigned int v5;
  int *v6;

  v5 = a4 | (a3 << 16);
  v6 = (int *)&v5;
  return *((double *)std::__tree<std::__value_type<unsigned int,double>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,double>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,double>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)&self->_characterKerningByCharPair, &v5, (uint64_t)&std::piecewise_construct, &v6)+ 5);
}

+ (id)fontWithTexture:(id)a3 fontDataString:(id)a4
{
  id v5;
  id v6;
  SKBitmapFont *v7;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_4;
  v7 = objc_alloc_init(SKBitmapFont);
  if (!-[SKBitmapFont loadFontWithTexture:fontDataString:](v7, "loadFontWithTexture:fontDataString:", v5, v6))
  {

LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&self->_characterKerningByCharPair, (_QWORD *)self->_characterKerningByCharPair.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned short,double>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,double>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,double>>>::destroy((uint64_t)&self->_characterAdvanceByChar, (_QWORD *)self->_characterAdvanceByChar.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,SKSpriteNode * {__strong}>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,SKSpriteNode * {__strong}>>>::destroy((uint64_t)&self->_characterSpriteByChar, (_QWORD *)self->_characterSpriteByChar.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_characterSprites, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = (char *)self + 56;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = (char *)self + 80;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = (char *)self + 104;
  return self;
}

+ (id)_fontForFileNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SKBitmapFont *v9;
  SKBitmapFont *v10;
  void *v11;
  _BOOL4 v12;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("fnt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)_fontDict, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = objc_alloc_init(SKBitmapFont);
      objc_storeStrong((id *)&v10->_fileName, v6);
      objc_storeStrong((id *)&v10->_filePath, v6);
      v10->_internal = 1;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v10->_filePath, 4, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[SKBitmapFont loadFontWithTexture:fontDataString:](v10, "loadFontWithTexture:fontDataString:", 0, v11);

      if (v12)
        v9 = v10;
      else
        v9 = 0;

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
