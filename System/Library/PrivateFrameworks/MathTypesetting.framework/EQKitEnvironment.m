@implementation EQKitEnvironment

- (EQKitEnvironment)initWithConfig:(id)a3
{
  id v5;
  EQKitEnvironment *v6;
  EQKitEnvironment *v7;
  id *p_config;
  EQKit::Config::Operator::Dictionary *v9;
  NSURL *v10;
  uint64_t v11;
  void *v12;
  NSNumber *v13;
  NSDictionary *v14;
  void *v15;
  EQKit::Font::Manager *v16;
  uint64_t v17;
  void *v18;
  NSDictionary *v19;
  EQKit::Kerning::Manager *v20;
  uint64_t v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  EQKit::Blahtex::Config *v25;
  unint64_t v27;
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EQKitEnvironment;
  v6 = -[EQKitEnvironment init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    p_config = (id *)&v6->_config;
    objc_storeStrong((id *)&v6->_config, a3);
    +[EQKitEnvironment i_operatorDictionaryURL](EQKitEnvironment, "i_operatorDictionaryURL");
    v9 = (EQKit::Config::Operator::Dictionary *)objc_claimAutoreleasedReturnValue();
    v7->_operatorDictionary = EQKit::Config::Operator::Dictionary::dictionaryFromURL(v9, v10);

    v11 = objc_opt_class();
    objc_msgSend(*p_config, "objectForKeyedSubscript:", CFSTR("version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    EQKitUtilDynamicCast(v11, (uint64_t)v12);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    EQKit::Environment::Version::Version((EQKit::Environment::Version *)&v27, v13);

    -[EQKitEnvironment i_fontsDictionary](v7, "i_fontsDictionary");
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (v27 <= 4)
    {
      +[EQKitEnvironment defaultMathFontName](EQKitEnvironment, "defaultMathFontName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, CFSTR("mathFontName"));

      -[NSDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("requiresLegacySTIXFonts"));
    }
    v16 = (EQKit::Font::Manager *)operator new();
    EQKit::Font::Manager::Manager(v16, v7, v14, (const EQKit::Environment::Version *)&v27);
    v7->_fontManager = (Manager *)v16;
    v17 = objc_opt_class();
    objc_msgSend(*p_config, "objectForKeyedSubscript:", CFSTR("kerning"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    EQKitUtilDynamicCast(v17, (uint64_t)v18);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    v20 = (EQKit::Kerning::Manager *)operator new();
    EQKit::Kerning::Manager::Manager(v20, (const EQKit::Environment::Version *)&v27, v19);
    v7->_kerningManager = v20;
    v21 = objc_opt_class();
    objc_msgSend(*p_config, "objectForKeyedSubscript:", CFSTR("layout"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    EQKitUtilDynamicCast(v21, (uint64_t)v22);
    v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    v7->_layoutConfig = (Config *)EQKit::Layout::Config::newConfigFromDictionary((EQKit::Layout::Config *)&v27, v23, v24);
    if (v7->_operatorDictionary)
    {
      v25 = (EQKit::Blahtex::Config *)operator new();
      EQKit::Blahtex::Config::Config(v25, (const EQKit::Config::Operator::Dictionary *)v7->_operatorDictionary);
      v7->_blahtexConfig = v25;
    }
    if (v27 <= 4)
      objc_msgSend(*p_config, "setObject:forKeyedSubscript:", &unk_2511557D0, CFSTR("version"));

  }
  return v7;
}

- (EQKitEnvironment)initWithData:(id)a3
{
  void *v4;
  id v5;
  EQKitEnvironment *v6;
  id v8;

  v8 = 0;
  +[EQKitEnvironment propertyListWithData:error:](EQKitEnvironment, "propertyListWithData:error:", a3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = -[EQKitEnvironment initWithConfig:](self, "initWithConfig:", v4);

  return v6;
}

- (void)dealloc
{
  EQKit::Config::Operator::Dictionary *operatorDictionary;
  Manager *fontManager;
  EQKit::Kerning::Manager *kerningManager;
  Config *layoutConfig;
  void *blahtexConfig;
  uint64_t v8;
  objc_super v9;

  operatorDictionary = (EQKit::Config::Operator::Dictionary *)self->_operatorDictionary;
  if (operatorDictionary)
  {
    EQKit::Config::Operator::Dictionary::~Dictionary(operatorDictionary);
    MEMORY[0x242690740]();
  }
  fontManager = self->_fontManager;
  if (fontManager)
    (*((void (**)(Manager *, SEL))fontManager->var0 + 1))(fontManager, a2);
  kerningManager = (EQKit::Kerning::Manager *)self->_kerningManager;
  if (kerningManager)
  {
    EQKit::Kerning::Manager::~Manager(kerningManager);
    MEMORY[0x242690740]();
  }
  layoutConfig = self->_layoutConfig;
  if (layoutConfig)
    MEMORY[0x242690740](layoutConfig, 0x1000C4000313F17);
  blahtexConfig = self->_blahtexConfig;
  if (blahtexConfig)
  {
    std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::~__hash_table((uint64_t)blahtexConfig + 40);
    v8 = std::__hash_table<wchar_t,std::hash<wchar_t>,std::equal_to<wchar_t>,std::allocator<wchar_t>>::~__hash_table((uint64_t)blahtexConfig);
    MEMORY[0x242690740](v8, 0x10A0C40864A76ABLL);
  }
  v9.receiver = self;
  v9.super_class = (Class)EQKitEnvironment;
  -[EQKitEnvironment dealloc](&v9, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  EQKitEnvironment *v4;
  void *v5;
  EQKitEnvironment *v6;

  v4 = [EQKitEnvironment alloc];
  -[EQKitEnvironment i_configCopy](self, "i_configCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EQKitEnvironment initWithConfig:](v4, "initWithConfig:", v5);

  return v6;
}

- (NSData)data
{
  NSMutableDictionary *config;
  uint64_t v4;

  config = self->_config;
  v4 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", config, 100, 0, &v4);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyListWithData:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = a3;
  v10 = 0;
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 1, &v10, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  EQKitUtilDynamicCast(v6, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (EQKitEnvironment)defaultEnvironment
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__EQKitEnvironment_defaultEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[EQKitEnvironment defaultEnvironment]::onceToken != -1)
    dispatch_once(&+[EQKitEnvironment defaultEnvironment]::onceToken, block);
  return (EQKitEnvironment *)(id)+[EQKitEnvironment defaultEnvironment]::sInstance;
}

void __38__EQKitEnvironment_defaultEnvironment__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createDefaultEnvironment");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[EQKitEnvironment defaultEnvironment]::sInstance;
  +[EQKitEnvironment defaultEnvironment]::sInstance = v1;

}

+ (id)createDefaultEnvironment
{
  void *v2;
  void *v3;
  EQKitEnvironment *v4;
  uint64_t v6;

  objc_msgSend(a1, "defaultEnvironmentData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v6 = 0,
        +[EQKitEnvironment propertyListWithData:error:](EQKitEnvironment, "propertyListWithData:error:", v2, &v6), (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = -[EQKitEnvironment initWithConfig:]([EQKitEnvironment alloc], "initWithConfig:", v3);

  return v4;
}

+ (NSData)defaultEnvironmentData
{
  if (+[EQKitEnvironment defaultEnvironmentData]::onceToken != -1)
    dispatch_once(&+[EQKitEnvironment defaultEnvironmentData]::onceToken, &__block_literal_global_1);
  return (NSData *)(id)+[EQKitEnvironment defaultEnvironmentData]::sInstance;
}

void __42__EQKitEnvironment_defaultEnvironmentData__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "pathForResource:ofType:", CFSTR("EQKitDefaultEnvironment"), CFSTR("plist"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v3, 2, &v7);
      v5 = v7;
      v6 = (void *)+[EQKitEnvironment defaultEnvironmentData]::sInstance;
      +[EQKitEnvironment defaultEnvironmentData]::sInstance = v4;

    }
  }

}

- (void)setUsesLegacySTIXFonts:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (-[EQKitEnvironment i_requiresLegacySTIXFonts](self, "i_requiresLegacySTIXFonts") != a3)
  {
    -[EQKitEnvironment i_fontsDictionary](self, "i_fontsDictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("requiresLegacySTIXFonts"));

    -[EQKitEnvironment reloadFonts](self, "reloadFonts");
  }
}

- (void)setAllowSingleLineHeight:(BOOL)a3
{
  self->_layoutConfig->var2 = a3;
}

- (BOOL)allowSingleLineHeight
{
  return self->_layoutConfig->var2;
}

+ (NSSet)legacySTIXFontNames
{
  if (+[EQKitEnvironment legacySTIXFontNames]::onceToken != -1)
    dispatch_once(&+[EQKitEnvironment legacySTIXFontNames]::onceToken, &__block_literal_global_24);
  return (NSSet *)(id)+[EQKitEnvironment legacySTIXFontNames]::sLegacySTIXFontNamesSet;
}

void __39__EQKitEnvironment_legacySTIXFontNames__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", &unk_251155950);
  v1 = (void *)+[EQKitEnvironment legacySTIXFontNames]::sLegacySTIXFontNamesSet;
  +[EQKitEnvironment legacySTIXFontNames]::sLegacySTIXFontNamesSet = v0;

}

- (void)setMathFontName:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[EQKitEnvironment mathFontName](self, "mathFontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v5 & 1) == 0)
  {
    -[EQKitEnvironment i_fontsDictionary](self, "i_fontsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("mathFontName"));

    if (!-[EQKitEnvironment usesLegacySTIXFonts](self, "usesLegacySTIXFonts"))
      -[EQKitEnvironment reloadFonts](self, "reloadFonts");

  }
}

- (NSString)mathFontName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[EQKitEnvironment i_mathFontName](self, "i_mathFontName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[EQKitEnvironment defaultMathFontName](EQKitEnvironment, "defaultMathFontName");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

+ (NSString)defaultMathFontName
{
  return (NSString *)CFSTR("STIXTwoMath-Regular");
}

- (BOOL)needsToReloadFontsWhenAddingFontNamed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;

  v4 = a3;
  if (-[EQKitEnvironment usesLegacySTIXFonts](self, "usesLegacySTIXFonts"))
  {
    +[EQKitEnvironment legacySTIXFontNames](EQKitEnvironment, "legacySTIXFontNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);
  }
  else
  {
    -[EQKitEnvironment mathFontName](self, "mathFontName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);
  }
  v7 = v6;

  return v7;
}

- (void)reloadFonts
{
  EQKit::Font::Manager::reloadFonts((EQKit::Font::Manager *)self->_fontManager);
}

- (BOOL)fontsLoadedCorrectly
{
  uint64_t v2;

  v2 = EQKit::Font::Manager::fontCollection((EQKit::Font::Manager *)self->_fontManager);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2);
}

- (__CTFont)defaultFontOfSize:(double)a3
{
  uint64_t v3;
  __CTFont *v4;
  uint64_t v6;
  __int16 v7;
  char v8;
  int v9;
  double v10;
  int v11;
  id v12;

  v6 = 0;
  v7 = 1;
  v8 = 0;
  v9 = 3;
  v10 = a3;
  v11 = 0;
  v12 = 0;
  v3 = EQKit::Font::Manager::fontCollection((EQKit::Font::Manager *)self->_fontManager);
  v4 = (__CTFont *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 72))(v3, &v6);

  return v4;
}

- (id)i_configCopy
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)-[NSMutableDictionary mutableCopy](self->_config, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fonts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("fonts"));

  return v2;
}

+ (id)i_operatorDictionaryURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("EQKitOperatorDictionary"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)i_fontsDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", CFSTR("fonts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EQKitUtilDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)i_mathFontName
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  -[EQKitEnvironment i_fontsDictionary](self, "i_fontsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mathFontName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EQKitUtilDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)i_requiresLegacySTIXFonts
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  -[EQKitEnvironment i_fontsDictionary](self, "i_fontsDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("requiresLegacySTIXFonts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EQKitUtilDynamicCast(v3, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 1;

  return v6;
}

- (BOOL)sourceAttribution
{
  return self->_sourceAttribution;
}

- (void)setSourceAttribution:(BOOL)a3
{
  self->_sourceAttribution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

- (const)operatorDictionary
{
  return self->_operatorDictionary;
}

- (const)fontManager
{
  return self->_fontManager;
}

- (const)kerningManager
{
  return self->_kerningManager;
}

- (const)layoutConfig
{
  return self->_layoutConfig;
}

- (const)blahtexConfig
{
  return self->_blahtexConfig;
}

- (void)beginLayout
{
  EQKit::Font::Manager::beginLayout((uint64_t)self->_fontManager);
  EQKit::Kerning::Manager::beginLayout((uint64_t)self->_kerningManager);
}

- (void)endLayout
{
  EQKit::Kerning::Manager::endLayout((uint64_t ***)self->_kerningManager);
  EQKit::Font::Manager::endLayout((EQKit::Font::Manager *)self->_fontManager);
}

- (BOOL)isKerningEnabled
{
  return *((_BYTE *)self->_kerningManager + 16);
}

- (void)setKerningEnabled:(BOOL)a3
{
  *((_BYTE *)self->_kerningManager + 16) = a3;
}

@end
