@implementation SCNProgram

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNProgram;
  -[SCNProgram dealloc](&v3, sel_dealloc);
}

- (SCNProgram)init
{
  SCNProgram *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNProgram;
  v2 = -[SCNProgram init](&v4, sel_init);
  if (v2 && (C3DWasLinkedBeforeMajorOSYear2014() & 1) == 0)
    v2->_opaque = 1;
  return v2;
}

- (void)setLibrary:(id)library
{
  MTLLibrary *v3;

  v3 = self->_library;
  if (v3 != library)
  {

    self->_library = (MTLLibrary *)library;
    self->_libraryProvider = (SCNMetalLibraryProvider *)-[SCNMetalLibraryProvider iniWithLibrary:]([SCNMetalLibraryProvider alloc], "iniWithLibrary:", library);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (id)library
{
  return self->_library;
}

- (void)setLibraryProvider:(id)a3
{
  if (self->_libraryProvider != a3)
  {

    self->_library = 0;
    self->_libraryProvider = (SCNMetalLibraryProvider *)a3;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (id)libraryProvider
{
  return self->_libraryProvider;
}

- (void)setName:(id)a3
{
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {

    self->_name = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (int)shadingLanguage
{
  return !self->_vertexFunctionName && self->_fragmentFunctionName == 0;
}

- (id)name
{
  return self->_name;
}

+ (SCNProgram)program
{
  return (SCNProgram *)objc_alloc_init((Class)a1);
}

+ (SCNProgram)programWithLibrary:(id)a3
{
  SCNProgram *v4;

  v4 = (SCNProgram *)objc_alloc_init((Class)a1);
  -[SCNProgram setLibrary:](v4, "setLibrary:", a3);
  return v4;
}

- (void)setSourceFile:(id)a3
{
  NSString *sourceFile;

  sourceFile = self->_sourceFile;
  if (sourceFile != a3)
  {

    self->_sourceFile = (NSString *)a3;
  }
}

- (id)sourceFile
{
  return self->_sourceFile;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)opaque
{
  if (self->_opaque != opaque)
  {
    self->_opaque = opaque;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (void)setVertexFunctionName:(NSString *)vertexFunctionName
{
  if (!-[NSString isEqualToString:](self->_vertexFunctionName, "isEqualToString:"))
  {

    self->_vertexFunctionName = (NSString *)-[NSString copy](vertexFunctionName, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (void)setFragmentFunctionName:(NSString *)fragmentFunctionName
{
  if (!-[NSString isEqualToString:](self->_fragmentFunctionName, "isEqualToString:"))
  {

    self->_fragmentFunctionName = (NSString *)-[NSString copy](fragmentFunctionName, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (void)setVertexShader:(NSString *)vertexShader
{
  if (!-[NSString isEqualToString:](self->_vertexShader, "isEqualToString:"))
  {

    self->_vertexShader = (NSString *)-[NSString copy](vertexShader, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (NSString)vertexShader
{
  return self->_vertexShader;
}

- (void)setFragmentShader:(NSString *)fragmentShader
{
  if (!-[NSString isEqualToString:](self->_fragmentShader, "isEqualToString:"))
  {

    self->_fragmentShader = (NSString *)-[NSString copy](fragmentShader, "copy");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
}

- (NSString)fragmentShader
{
  return self->_fragmentShader;
}

- (void)setSemantic:(NSString *)semantic forSymbol:(NSString *)symbol options:(NSDictionary *)options
{
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!self->_semanticInfos)
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSMutableDictionary setValue:forKey:](self->_semanticInfos, "setValue:forKey:", +[SCNProgramSemanticInfo infoWithSemantic:options:](SCNProgramSemanticInfo, "infoWithSemantic:options:", semantic, options), symbol);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = CFSTR("parameter");
  v11[0] = symbol;
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
}

- (NSString)semanticForSymbol:(NSString *)symbol
{
  return (NSString *)objc_msgSend((id)-[NSMutableDictionary valueForKey:](self->_semanticInfos, "valueForKey:", symbol), "semantic");
}

- (id)_optionsForSymbol:(id)a3
{
  return (id)objc_msgSend((id)-[NSMutableDictionary valueForKey:](self->_semanticInfos, "valueForKey:", a3), "options");
}

- (id)_allSymbolsWithSceneKitSemantic
{
  id result;

  result = self->_semanticInfos;
  if (result)
    return (id)objc_msgSend(result, "allKeys");
  return result;
}

- (void)setSemanticInfos:(id)a3
{
  NSMutableDictionary *semanticInfos;

  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
  {
    -[NSMutableDictionary removeAllObjects](semanticInfos, "removeAllObjects");
    if (!a3)
      return;
    goto LABEL_3;
  }
  self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (a3)
LABEL_3:
    -[NSMutableDictionary addEntriesFromDictionary:](self->_semanticInfos, "addEntriesFromDictionary:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setVertexShader:", -[SCNProgram vertexShader](self, "vertexShader"));
  objc_msgSend(v4, "setVertexFunctionName:", -[SCNProgram vertexFunctionName](self, "vertexFunctionName"));
  objc_msgSend(v4, "setFragmentFunctionName:", -[SCNProgram fragmentFunctionName](self, "fragmentFunctionName"));
  objc_msgSend(v4, "setFragmentShader:", -[SCNProgram fragmentShader](self, "fragmentShader"));
  objc_msgSend(v4, "setName:", -[SCNProgram name](self, "name"));
  objc_msgSend(v4, "setLibrary:", -[SCNProgram library](self, "library"));
  objc_msgSend(v4, "setLibraryProvider:", -[SCNProgram libraryProvider](self, "libraryProvider"));
  objc_msgSend(v4, "setSemanticInfos:", self->_semanticInfos);
  return v4;
}

- (id)_bufferBindings
{
  return self->_bufferBindings;
}

- (void)handleBindingOfBufferNamed:(NSString *)name frequency:(SCNBufferFrequency)frequency usingBlock:(SCNBufferBindingBlock)block
{
  NSMutableDictionary *bufferBindings;
  SCNBufferBinding *v10;
  SCNBufferBinding *v11;

  bufferBindings = self->_bufferBindings;
  if (block)
  {
    if (!bufferBindings)
      self->_bufferBindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = objc_alloc_init(SCNBufferBinding);
    -[SCNBufferBinding setName:](v10, "setName:", name);
    -[SCNBufferBinding setFrequency:](v10, "setFrequency:", frequency);
    -[SCNBufferBinding setBlock:](v10, "setBlock:", _Block_copy(block));
    -[NSMutableDictionary setValue:forKey:](self->_bufferBindings, "setValue:forKey:", v10, name);

    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](bufferBindings, "removeObjectForKey:", name, frequency);
    v11 = objc_alloc_init(SCNBufferBinding);
    -[SCNBufferBinding setName:](v11, "setName:", name);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("SCNProgramDidChangeNotification"), self, 0);

  }
}

- (id)copy
{
  return -[SCNProgram copyWithZone:](self, "copyWithZone:", 0);
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4
{
  -[SCNProgram setSemantic:forSymbol:options:](self, "setSemantic:forSymbol:options:", a3, a4, 0);
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = delegate;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *vertexShader;
  NSString *fragmentShader;
  NSString *vertexFunctionName;
  NSString *sourceFile;
  NSString *fragmentFunctionName;
  NSString *name;
  NSMutableDictionary *semanticInfos;

  -[SCNProgram _customEncodingOfSCNProgram:](self, "_customEncodingOfSCNProgram:");
  vertexShader = self->_vertexShader;
  if (vertexShader)
    objc_msgSend(a3, "encodeObject:forKey:", vertexShader, CFSTR("vertexShader"));
  fragmentShader = self->_fragmentShader;
  if (fragmentShader)
    objc_msgSend(a3, "encodeObject:forKey:", fragmentShader, CFSTR("fragmentShader"));
  vertexFunctionName = self->_vertexFunctionName;
  if (vertexFunctionName)
    objc_msgSend(a3, "encodeObject:forKey:", vertexFunctionName, CFSTR("vertexFunctionName"));
  sourceFile = self->_sourceFile;
  if (sourceFile)
    objc_msgSend(a3, "encodeObject:forKey:", sourceFile, CFSTR("sourceFile"));
  fragmentFunctionName = self->_fragmentFunctionName;
  if (fragmentFunctionName)
    objc_msgSend(a3, "encodeObject:forKey:", fragmentFunctionName, CFSTR("fragmentFunctionName"));
  name = self->_name;
  if (name)
    objc_msgSend(a3, "encodeObject:forKey:", name, CFSTR("name"));
  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
    objc_msgSend(a3, "encodeObject:forKey:", semanticInfos, CFSTR("semanticInfos"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_opaque, CFSTR("opaque"));
}

- (SCNProgram)initWithCoder:(id)a3
{
  SCNProgram *v4;
  _BOOL8 v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNProgram;
  v4 = -[SCNProgram init](&v8, sel_init);
  if (v4)
  {
    v5 = +[SCNTransaction immediateMode](SCNTransaction, "immediateMode");
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", 1);
    -[SCNProgram _customDecodingOfSCNProgram:](v4, "_customDecodingOfSCNProgram:", a3);
    -[SCNProgram setVertexShader:](v4, "setVertexShader:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertexShader")));
    -[SCNProgram setFragmentShader:](v4, "setFragmentShader:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fragmentShader")));
    -[SCNProgram setVertexFunctionName:](v4, "setVertexFunctionName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vertexFunctionName")));
    -[SCNProgram setFragmentFunctionName:](v4, "setFragmentFunctionName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fragmentFunctionName")));
    -[SCNProgram setSourceFile:](v4, "setSourceFile:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceFile")));
    -[SCNProgram setName:](v4, "setName:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name")));
    v6 = (void *)SCNPlistClasses();
    -[SCNProgram setSemanticInfos:](v4, "setSemanticInfos:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setByAddingObject:", objc_opt_class()), CFSTR("semanticInfos")));
    -[SCNProgram setOpaque:](v4, "setOpaque:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("opaque")));
    +[SCNTransaction setImmediateMode:](SCNTransaction, "setImmediateMode:", v5);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
