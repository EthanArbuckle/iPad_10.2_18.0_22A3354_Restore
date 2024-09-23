@implementation BRAsset

+ (id)withType:(int64_t)a3 andParameters:(id)a4
{
  return -[BRAsset initWithType:andParameters:null:]([BRAsset alloc], "initWithType:andParameters:null:", a3, a4, 0);
}

+ (id)nullAsset
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__BRAsset_nullAsset__block_invoke;
  block[3] = &unk_24D4A3E38;
  block[4] = a1;
  if (nullAsset_once != -1)
    dispatch_once(&nullAsset_once, block);
  return (id)nullAsset_null;
}

uint64_t __20__BRAsset_nullAsset__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithType:andParameters:null:", 0, 0, 1);
  nullAsset_null = result;
  return result;
}

- (BRAsset)init
{

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("use -initWithID:andParameters:"));
  return 0;
}

- (BRAsset)initWithType:(int64_t)a3 andParameters:(id)a4 null:(BOOL)a5
{
  BRAsset *v8;
  BRAsset *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BRAsset;
  v8 = -[BRAsset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    *(_WORD *)&v8->_hasAudio = 0;
    v8->_parameters = (NSDictionary *)objc_msgSend(a4, "copy");
    v9->_isNull = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRAsset;
  -[BRAsset dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v11;
  int v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v15 = v6;
    v16 = v5;
    v17 = v4;
    v18 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v11 = -[BRAsset type](self, "type"), v11 == objc_msgSend(a3, "type")))
    {
      if (!-[BRAsset parameters](self, "parameters") && !objc_msgSend(a3, "parameters")
        || (v12 = -[NSDictionary isEqual:](-[BRAsset parameters](self, "parameters", v6, v16, v17, v18, v7, v8), "isEqual:", objc_msgSend(a3, "parameters"))) != 0)
      {
        v13 = -[BRAsset isNull](self, "isNull", v15, v16, v17, v18);
        LOBYTE(v12) = v13 ^ objc_msgSend(a3, "isNull") ^ 1;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (id)description
{
  void *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BRAsset;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRAsset description](&v8, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("Type: %ld"), -[BRAsset type](self, "type"));
  if (-[BRAsset hasAudio](self, "hasAudio"))
    v4 = "Y";
  else
    v4 = "N";
  objc_msgSend(v3, "appendFormat:", CFSTR("HasAudio: %s"), v4);
  if (-[BRAsset hasHaptic](self, "hasHaptic"))
    v5 = "Y";
  else
    v5 = "N";
  objc_msgSend(v3, "appendFormat:", CFSTR("HasHaptic: %s"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("Params: %@;"), -[BRAsset parameters](self, "parameters"));
  if (-[BRAsset isNull](self, "isNull"))
    v6 = "Y";
  else
    v6 = "N";
  objc_msgSend(v3, "appendFormat:", CFSTR("IsNull: %s;"), v6);
  return v3;
}

- (id)propertyList
{
  void *v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  NSDictionary *v8;
  void *v9;
  const char *v10;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[BRAsset type](self, "type")), CFSTR("Type"));
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (-[BRAsset hasAudio](self, "hasAudio"))
    v5 = "Y";
  else
    v5 = "N";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v4, "stringWithFormat:", CFSTR("%s;"), v5), CFSTR("HasAudio"));
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (-[BRAsset hasHaptic](self, "hasHaptic"))
    v7 = "Y";
  else
    v7 = "N";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "stringWithFormat:", CFSTR("%s;"), v7), CFSTR("HasHaptic"));
  if (-[BRAsset parameters](self, "parameters"))
    v8 = -[BRAsset parameters](self, "parameters");
  else
    v8 = (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Params"));
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (-[BRAsset isNull](self, "isNull"))
    v10 = "Y";
  else
    v10 = "N";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v9, "stringWithFormat:", CFSTR("%s;"), v10), CFSTR("IsNull"));
  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (BOOL)hasHaptic
{
  return self->_hasHaptic;
}

- (void)setHasHaptic:(BOOL)a3
{
  self->_hasHaptic = a3;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (BOOL)isNull
{
  return self->_isNull;
}

@end
