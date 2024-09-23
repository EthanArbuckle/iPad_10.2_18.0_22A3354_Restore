@implementation CFPDContainerSource

- (__CFString)container
{
  return self->_containerPath;
}

- (CFPDContainerSource)initWithDomain:(__CFString *)a3 userName:(__CFString *)a4 container:(__CFString *)a5 byHost:(BOOL)a6 managed:(BOOL)a7 shmemIndex:(signed __int16)a8 daemon:(id)a9
{
  CFPDContainerSource *v10;
  __CFString *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CFPDContainerSource;
  v10 = -[CFPDSource initWithDomain:userName:byHost:managed:shmemIndex:daemon:](&v13, sel_initWithDomain_userName_byHost_managed_shmemIndex_daemon_, a3, a4, a6, a7, a8, a9);
  if (v10)
  {
    if (a5)
      v11 = (__CFString *)CFRetain(a5);
    else
      v11 = 0;
    v10->_containerPath = v11;
  }
  return v10;
}

- (void)dealloc
{
  __CFString *containerPath;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  containerPath = self->_containerPath;
  if (containerPath)
    CFRelease(containerPath);
  v4.receiver = self;
  v4.super_class = (Class)CFPDContainerSource;
  -[CFPDSource dealloc](&v4, sel_dealloc);
}

@end
