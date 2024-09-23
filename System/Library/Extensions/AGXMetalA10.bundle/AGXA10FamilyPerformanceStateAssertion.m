@implementation AGXA10FamilyPerformanceStateAssertion

- (AGXA10FamilyPerformanceStateAssertion)initWithDevice:(id)a3 level:(int)a4
{
  AGXA10FamilyPerformanceStateAssertion *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AGXA10FamilyPerformanceStateAssertion;
  result = -[AGXA10FamilyPerformanceStateAssertion init](&v7, sel_init);
  if (result)
  {
    result->_device = (AGXA10FamilyDevice *)a3;
    result->_requestedLevel = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  fwrite("AGX: Attempting to destroy performance state assertion\n\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  -[AGXA10FamilyDevice removePerformanceStateAssertion:](self->_device, "removePerformanceStateAssertion:", self);
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyPerformanceStateAssertion;
  -[AGXA10FamilyPerformanceStateAssertion dealloc](&v3, sel_dealloc);
}

- (int64_t)requestedPerformanceState
{
  unsigned int requestedLevel;

  requestedLevel = self->_requestedLevel;
  if (requestedLevel >= 3)
    return 255;
  else
    return requestedLevel;
}

- (BOOL)wasPerformanceStateAssertionMaintained
{
  return objc_msgSend((id)objc_msgSend(-[AGXA10FamilyDevice getConsistentPerfStateInfoAndReset:](self->_device, "getConsistentPerfStateInfoAndReset:", 0), "objectForKeyedSubscript:", CFSTR("was_consistent")), "BOOLValue");
}

@end
