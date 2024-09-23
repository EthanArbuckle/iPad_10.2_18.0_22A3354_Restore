@implementation DYExperiment

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    mach_timebase_info(MEMORY[0x24BE39258]);
}

- (DYExperiment)init
{
  -[DYExperiment doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYExperiment)initWithName:(id)a3 results:(id)a4
{
  DYExperiment *v6;
  DYExperiment *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DYExperiment;
  v6 = -[DYExperiment init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_repeatCount = 128;
    v6->_warmupCount = 4;
    v6->_results = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", a4);
    *(_WORD *)&v7->_enableExperimentFinish = 1;
    v7->_name = (NSString *)objc_msgSend(a3, "copy");
    v7->_traceMode = 1;
    v7->_frameTimeArraySize = 32;
    v7->_frameTimeVariationArraySize = 8;
    v7->_profilingFlags = 0;
    v7->_frameTimeVariationLimit1 = 0.05;
    v7->_frameTimeVariationLimit2 = 0.1;
    v7->_frameTimeVariationRangeMax = 0.03;
    v7->_allowEarlyTermination = 1;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYExperiment)initWithCoder:(id)a3
{
  DYExperiment *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DYExperiment;
  v4 = -[DYExperiment init](&v14, sel_init);
  if (v4)
  {
    v4->_enabled = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enabled"));
    v4->_enableExperimentFinish = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enableExperimentFinish"));
    v4->_enablePerFrameTiming = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("enablePerFrameTiming"));
    v4->_repeatCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("repeatCount"));
    v4->_warmupCount = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("warmupCount"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v4->_results = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0), CFSTR("results"));
    v4->_captureArchivePath = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captureArchivePath"));
    v4->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v4->_traceMode = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("traceMode"));
    v4->_profilingFlags = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("profilingFlags"));
    v4->_frameTimeArraySize = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("frameTimeArraySize"));
    v4->_frameTimeVariationArraySize = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("frameTimeVariationArraySize"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frameTimeVariationLimit1"));
    v4->_frameTimeVariationLimit1 = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frameTimeVariationLimit2"));
    v4->_frameTimeVariationLimit2 = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("frameTimeVariationRangeMax"));
    v4->_frameTimeVariationRangeMax = v12;
    v4->_allowEarlyTermination = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("allowEarlyTermination"));
    v4->_usingModifiedArchive = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("usingModifiedArchive"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_enableExperimentFinish, CFSTR("enableExperimentFinish"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_enablePerFrameTiming, CFSTR("enablePerFrameTiming"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_repeatCount, CFSTR("repeatCount"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_warmupCount, CFSTR("warmupCount"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_results, CFSTR("results"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_captureArchivePath, CFSTR("captureArchivePath"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_traceMode, CFSTR("traceMode"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_profilingFlags, CFSTR("profilingFlags"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_frameTimeArraySize, CFSTR("frameTimeArraySize"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_frameTimeVariationArraySize, CFSTR("frameTimeVariationArraySize"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frameTimeVariationLimit1"), self->_frameTimeVariationLimit1);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frameTimeVariationLimit2"), self->_frameTimeVariationLimit2);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("frameTimeVariationRangeMax"), self->_frameTimeVariationRangeMax);
  objc_msgSend(a3, "encodeBool:forKey:", self->_allowEarlyTermination, CFSTR("allowEarlyTermination"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_usingModifiedArchive, CFSTR("usingModifiedArchive"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:results:", self->_name, self->_results);
  *(_DWORD *)(v4 + 24) = self->_repeatCount;
  *(_DWORD *)(v4 + 28) = self->_warmupCount;
  *(_BYTE *)(v4 + 33) = self->_enableExperimentFinish;
  *(_BYTE *)(v4 + 34) = self->_enablePerFrameTiming;
  *(_BYTE *)(v4 + 32) = self->_enabled;
  *(_QWORD *)(v4 + 8) = -[NSString copy](self->_captureArchivePath, "copy");
  *(_DWORD *)(v4 + 84) = self->_traceMode;
  *(_QWORD *)(v4 + 88) = self->_profilingFlags;
  *(_DWORD *)(v4 + 48) = self->_frameTimeArraySize;
  *(_DWORD *)(v4 + 52) = self->_frameTimeVariationArraySize;
  *(double *)(v4 + 56) = self->_frameTimeVariationLimit1;
  *(double *)(v4 + 64) = self->_frameTimeVariationLimit2;
  *(double *)(v4 + 72) = self->_frameTimeVariationRangeMax;
  *(_BYTE *)(v4 + 80) = self->_allowEarlyTermination;
  *(_BYTE *)(v4 + 96) = self->_usingModifiedArchive;
  return (id)v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExperiment;
  -[DYExperiment dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYExperiment;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ name=%@ repeatCount=%u results=%@"), -[DYExperiment description](&v3, sel_description), -[DYExperiment name](self, "name"), self->_repeatCount, self->_results);
}

- (BOOL)isPresentFrameEnabled
{
  return 1;
}

- (void)setRepeatCount:(unsigned int)a3
{
  unsigned int v3;

  if (a3 <= 1)
    v3 = 1;
  else
    v3 = a3;
  self->_repeatCount = v3;
}

- (void)setFrameTimeArraySize:(unsigned int)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (a3 >= 4)
    v3 = a3;
  else
    v3 = 4;
  v4 = (v3 - 1) | ((v3 - 1) >> 1) | (((v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  v5 = v4 | (v4 >> 4) | ((v4 | (v4 >> 4)) >> 8);
  self->_frameTimeArraySize = (v5 | HIWORD(v5)) + 1;
}

- (void)setFrameTimeVariationArraySize:(unsigned int)a3
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  if (a3 >= 4)
    v3 = a3;
  else
    v3 = 4;
  v4 = (v3 - 1) | ((v3 - 1) >> 1) | (((v3 - 1) | ((v3 - 1) >> 1)) >> 2);
  v5 = v4 | (v4 >> 4) | ((v4 | (v4 >> 4)) >> 8);
  self->_frameTimeVariationArraySize = (v5 | HIWORD(v5)) + 1;
}

- (NSString)name
{
  if (self->_name)
    return self->_name;
  else
    return (NSString *)CFSTR("name was not set!");
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (unsigned)repeatCount
{
  return self->_repeatCount;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (unsigned)warmupCount
{
  return self->_warmupCount;
}

- (void)setWarmupCount:(unsigned int)a3
{
  self->_warmupCount = a3;
}

- (BOOL)enableExperimentFinish
{
  return self->_enableExperimentFinish;
}

- (void)setEnableExperimentFinish:(BOOL)a3
{
  self->_enableExperimentFinish = a3;
}

- (BOOL)enablePerFrameTiming
{
  return self->_enablePerFrameTiming;
}

- (void)setEnablePerFrameTiming:(BOOL)a3
{
  self->_enablePerFrameTiming = a3;
}

- (NSString)captureArchivePath
{
  return self->_captureArchivePath;
}

- (int)traceMode
{
  return self->_traceMode;
}

- (void)setTraceMode:(int)a3
{
  self->_traceMode = a3;
}

- (unint64_t)profilingFlags
{
  return self->_profilingFlags;
}

- (void)setProfilingFlags:(unint64_t)a3
{
  self->_profilingFlags = a3;
}

- (unsigned)frameTimeArraySize
{
  return self->_frameTimeArraySize;
}

- (unsigned)frameTimeVariationArraySize
{
  return self->_frameTimeVariationArraySize;
}

- (double)frameTimeVariationLimit1
{
  return self->_frameTimeVariationLimit1;
}

- (void)setFrameTimeVariationLimit1:(double)a3
{
  self->_frameTimeVariationLimit1 = a3;
}

- (double)frameTimeVariationLimit2
{
  return self->_frameTimeVariationLimit2;
}

- (void)setFrameTimeVariationLimit2:(double)a3
{
  self->_frameTimeVariationLimit2 = a3;
}

- (double)frameTimeVariationRangeMax
{
  return self->_frameTimeVariationRangeMax;
}

- (void)setFrameTimeVariationRangeMax:(double)a3
{
  self->_frameTimeVariationRangeMax = a3;
}

- (BOOL)allowEarlyTermination
{
  return self->_allowEarlyTermination;
}

- (void)setAllowEarlyTermination:(BOOL)a3
{
  self->_allowEarlyTermination = a3;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (void)setMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)usingModifiedArchive
{
  return self->_usingModifiedArchive;
}

- (void)setUsingModifiedArchive:(BOOL)a3
{
  self->_usingModifiedArchive = a3;
}

@end
