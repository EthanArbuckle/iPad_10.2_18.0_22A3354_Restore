@implementation MTLLegacySVAccelerationStructureErrorLog

- (id)description
{
  const __CFString *v3;
  uint64_t v5[3];

  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v5, -[MTLLegacySVGPULog function](self, "function"));
  v3 = MTLLegacySVAccelerationStructureStringFromType(self->_expectedAccelerationStructureType);
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid Acceleration Structure type %@ bound to shader, expected %@, executing %@\n"), MTLLegacySVAccelerationStructureStringFromType(self->_actualAccelerationStructureType), v3, -[MTLLegacySVGPULog locationDescription](self, "locationDescription"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVAccelerationStructureErrorLog;
  -[MTLLegacySVGPULog dealloc](&v3, sel_dealloc);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unint64_t)expectedAccelerationStructureType
{
  return self->_expectedAccelerationStructureType;
}

- (void)setExpectedAccelerationStructureType:(unint64_t)a3
{
  self->_expectedAccelerationStructureType = a3;
}

- (unint64_t)actualAccelerationStructureType
{
  return self->_actualAccelerationStructureType;
}

- (void)setActualAccelerationStructureType:(unint64_t)a3
{
  self->_actualAccelerationStructureType = a3;
}

@end
