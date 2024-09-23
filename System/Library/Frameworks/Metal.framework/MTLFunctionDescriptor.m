@implementation MTLFunctionDescriptor

+ (MTLFunctionDescriptor)allocWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MTLFunctionDescriptor;
  return (MTLFunctionDescriptor *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (NSArray)binaryArchives
{
  return self->_private.binaryArchives;
}

- (NSString)specializedName
{
  return self->_private.specializedName;
}

- (unint64_t)pipelineOptions
{
  return self->_pipelineOptions;
}

- (id)privateFunctions
{
  return self->_private.privateFunctions;
}

- (BOOL)applyFunctionConstants
{
  return self->_private.applyFunctionConstants;
}

- (MTLFunctionConstantValues)constantValues
{
  return self->_private.constantValues;
}

- (MTLFunctionOptions)options
{
  return self->_private.options;
}

- (MTLFunctionDescriptor)init
{
  MTLFunctionDescriptor *v2;
  MTLFunctionDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionDescriptor;
  v2 = -[MTLFunctionDescriptor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_private.applyFunctionConstants = 1;
    v2->_private.privateFunctions = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)setName:(NSString *)name
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString *v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (name)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    v10 = CFSTR("name is not a NSString.");
    v11 = 1;
    v12 = 117;
  }
  else
  {
    v10 = CFSTR("name must not be nil.");
    v11 = 0;
    v12 = 114;
  }
  MTLReportFailure(v11, "-[MTLFunctionDescriptor setName:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  v9 = self->_private.name;
  if (v9 != name)
  {

    self->_private.name = (NSString *)-[NSString copy](name, "copy");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionDescriptor;
  -[MTLFunctionDescriptor dealloc](&v3, sel_dealloc);
}

- (void)setConstantValues:(MTLFunctionConstantValues *)constantValues
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  MTLFunctionConstantValues *v9;
  uint64_t v10;

  if (constantValues)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLFunctionDescriptor setConstantValues:]", 153, (uint64_t)CFSTR("constantValues is not a MTLFunctionConstantValues."), v5, v6, v7, v8, v10);
  }
  v9 = self->_private.constantValues;
  if (v9 != constantValues)
  {

    self->_private.constantValues = (MTLFunctionConstantValues *)-[MTLFunctionConstantValues copy](constantValues, "copy");
  }
}

- (NSString)name
{
  return self->_private.name;
}

+ (MTLFunctionDescriptor)functionDescriptor
{
  return objc_alloc_init(MTLFunctionDescriptor);
}

- (void)setBinaryArchives:(NSArray *)binaryArchives
{
  NSArray *v3;

  v3 = self->_private.binaryArchives;
  if (v3 != binaryArchives)
  {

    self->_private.binaryArchives = (NSArray *)-[NSArray copy](binaryArchives, "copy");
  }
}

- (void)setSpecializedName:(NSString *)specializedName
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  uint64_t v10;

  if (specializedName)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[MTLFunctionDescriptor setSpecializedName:]", 135, (uint64_t)CFSTR("specializedName is not a NSString."), v5, v6, v7, v8, v10);
  }
  v9 = self->_private.specializedName;
  if (v9 != specializedName)
  {

    self->_private.specializedName = (NSString *)-[NSString copy](specializedName, "copy");
  }
}

- (void)setPrivateFunctions:(id)a3
{
  NSArray *privateFunctions;

  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions != a3)
  {

    self->_private.privateFunctions = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_private.name, "copyWithZone:", a3);
    *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_private.specializedName, "copyWithZone:", a3);
    v6 = -[MTLFunctionConstantValues copyWithZone:](self->_private.constantValues, "copyWithZone:", a3);
    *(_QWORD *)(v5 + 24) = self->_private.options;
    *(_QWORD *)(v5 + 32) = v6;
    *(_QWORD *)(v5 + 40) = -[NSArray copy](self->_private.binaryArchives, "copy");
    *(_BYTE *)(v5 + 48) = self->_private.applyFunctionConstants;
    *(_QWORD *)(v5 + 56) = -[NSArray copy](self->_private.privateFunctions, "copy");
    objc_msgSend((id)v5, "setPipelineOptions:", self->_pipelineOptions);
    objc_msgSend((id)v5, "setPluginData:", self->_pluginData);
  }
  return (id)v5;
}

- (void)setOptions:(MTLFunctionOptions)options
{
  self->_private.options = options;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t options;
  _QWORD v6[6];
  BOOL applyFunctionConstants;

  bzero(v6, 0x38uLL);
  v6[0] = -[NSString hash](self->_private.name, "hash");
  v6[1] = -[NSString hash](self->_private.specializedName, "hash");
  v3 = -[MTLFunctionConstantValues hash](self->_private.constantValues, "hash");
  options = self->_private.options;
  v6[2] = v3;
  v6[3] = options;
  v6[4] = MTLHashArray(self->_private.binaryArchives, 1, 0);
  applyFunctionConstants = self->_private.applyFunctionConstants;
  v6[5] = MTLHashArray(self->_private.privateFunctions, 1, 1);
  return _MTLHashState((int *)v6, 0x38uLL);
}

- ($2772B1D07D29A72E8557B2574C0AE5C1)hashStableWithFunction:(SEL)a3
{
  MTLFunctionConstantValues *constantValues;
  void *v8;
  void *v9;
  NSArray *privateFunctions;
  _OWORD *v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v17;
  CC_SHA256_CTX c;
  _QWORD data[2];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  bzero(data, 0x10uLL);
  data[0] = -[NSString hash](self->_private.name, "hash");
  data[1] = -[NSString hash](self->_private.specializedName, "hash");
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, data, 0x10u);
  constantValues = self->_private.constantValues;
  if (constantValues)
  {
    *(_QWORD *)&v20[0] = 0;
    v17 = 0;
    v8 = (void *)-[MTLFunctionConstantValues serializedConstantDataForFunction:dataSize:errorMessage:](constantValues, "serializedConstantDataForFunction:dataSize:errorMessage:", a4, v20, &v17);
    if (v8)
    {
      v9 = v8;
      CC_SHA256_Update(&c, v8, v20[0]);
      free(v9);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[MTLFunctionDescriptor hashStableWithFunction:].cold.1();
    }

  }
  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions && -[NSArray count](privateFunctions, "count"))
  {
    CC_SHA256_Update(&c, "privateFunctions", 0x10u);
    v11 = (_OWORD *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](privateFunctions, "objectAtIndexedSubscript:", 0), "bitCodeHash");
    v12 = v11[1];
    v20[0] = *v11;
    v20[1] = v12;
    if (-[NSArray count](privateFunctions, "count") >= 2)
    {
      v13 = 1;
      do
      {
        v14 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](privateFunctions, "objectAtIndexedSubscript:", v13), "bitCodeHash");
        for (i = 0; i != 32; i += 8)
          *(_QWORD *)((char *)v20 + i) ^= *(_QWORD *)(v14 + i);
        v13 = (v13 + 1);
      }
      while (-[NSArray count](privateFunctions, "count") > v13);
    }
    CC_SHA256_Update(&c, v20, 0x20u);
  }
  return ($2772B1D07D29A72E8557B2574C0AE5C1 *)CC_SHA256_Final(retstr->var0, &c);
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  NSString *name;
  NSString *specializedName;
  MTLFunctionConstantValues *constantValues;
  int v10;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return v6;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
  {
LABEL_3:
    LOBYTE(v6) = 0;
    return v6;
  }
  name = self->_private.name;
  if (name == *((NSString **)a3 + 1) || (v6 = -[NSString isEqual:](name, "isEqual:")) != 0)
  {
    specializedName = self->_private.specializedName;
    if (specializedName == *((NSString **)a3 + 2) || (v6 = -[NSString isEqual:](specializedName, "isEqual:")) != 0)
    {
      constantValues = self->_private.constantValues;
      if (constantValues == *((MTLFunctionConstantValues **)a3 + 4)
        || (v6 = -[MTLFunctionConstantValues isEqual:](constantValues, "isEqual:")) != 0)
      {
        if (self->_private.options == *((_QWORD *)a3 + 3))
        {
          v10 = MTLCompareArray(self->_private.binaryArchives, *((void **)a3 + 5), 1, 0);
          LOBYTE(v6) = 0;
          if (!v10)
            return v6;
          if (self->_private.applyFunctionConstants == *((unsigned __int8 *)a3 + 48))
          {
            LOBYTE(v6) = MTLCompareArray(self->_private.privateFunctions, *((void **)a3 + 7), 1, 1);
            return v6;
          }
        }
        goto LABEL_3;
      }
    }
  }
  return v6;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  const __CFString *name;
  NSString *specializedName;
  const __CFString *v9;
  MTLFunctionConstantValues *constantValues;
  NSArray *binaryArchives;
  NSArray *privateFunctions;
  objc_super v14;
  _QWORD v15[19];

  v15[18] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MTLFunctionDescriptor;
  v6 = -[MTLFunctionDescriptor description](&v14, sel_description);
  v15[0] = v4;
  v15[1] = CFSTR("name =");
  name = (const __CFString *)self->_private.name;
  specializedName = self->_private.specializedName;
  if (!name)
    name = CFSTR("<none>");
  v15[2] = name;
  v15[3] = v4;
  if (specializedName)
    v9 = (const __CFString *)specializedName;
  else
    v9 = CFSTR("<none>");
  v15[4] = CFSTR("specializedName =");
  v15[5] = v9;
  v15[6] = v4;
  v15[7] = CFSTR("constantValues =");
  constantValues = self->_private.constantValues;
  if (!constantValues)
    constantValues = (MTLFunctionConstantValues *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15[8] = constantValues;
  v15[9] = v4;
  v15[10] = CFSTR("options =");
  v15[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_private.options);
  v15[12] = v4;
  v15[13] = CFSTR("binaryArchives =");
  binaryArchives = self->_private.binaryArchives;
  if (!binaryArchives)
    binaryArchives = (NSArray *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15[14] = binaryArchives;
  v15[15] = v4;
  v15[16] = CFSTR("privateFunctions =");
  privateFunctions = self->_private.privateFunctions;
  if (!privateFunctions)
    privateFunctions = (NSArray *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15[17] = privateFunctions;
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 18), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLFunctionDescriptor formattedDescription:](self, "formattedDescription:", 0);
}

- (void)setPipelineOptions:(unint64_t)a3
{
  self->_pipelineOptions = a3;
}

- (void)setPluginData:(id)a3
{
  NSDictionary *pluginData;

  pluginData = self->_pluginData;
  if (pluginData != a3)
  {

    self->_pluginData = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (id)pluginData
{
  return self->_pluginData;
}

- (void)setApplyFunctionConstants:(BOOL)a3
{
  self->_private.applyFunctionConstants = a3;
}

- (void)hashStableWithFunction:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_182636000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create constant hash for function.", v0, 2u);
}

@end
