@implementation SCNCommonProfileProgramCache

- (SCNCommonProfileProgramCache)init
{
  SCNCommonProfileProgramCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SCNCommonProfileProgramCache;
  v2 = -[SCNCommonProfileProgramCache init](&v4, sel_init);
  if (v2)
    v2->_owners = CFSetCreateMutable(0, 0, 0);
  return v2;
}

- (void)dealloc
{
  __C3DFXProgram *program;
  __CFSet *owners;
  objc_super v5;

  program = self->_program;
  if (program)
  {
    CFRelease(program);
    self->_program = 0;
  }
  owners = self->_owners;
  if (owners)
  {
    CFRelease(owners);
    self->_owners = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SCNCommonProfileProgramCache;
  -[SCNCommonProfileProgramCache dealloc](&v5, sel_dealloc);
}

@end
