@implementation MTLArchitecture

- (NSString)revision
{
  return self->_revision;
}

- (NSString)name
{
  return self->_name;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLArchitecture;
  -[MTLArchitecture dealloc](&v3, sel_dealloc);
}

- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4 revision:(id)a5
{
  MTLArchitecture *v8;
  MTLArchitecture *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLArchitecture;
  v8 = -[MTLArchitecture init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_cpuType = a3;
    v8->_cpuSubtype = a4;
    v8->_name = (NSString *)newArchitectureNameString(a3, a4);
    v9->_revision = (NSString *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (MTLArchitecture)initWithCPUType:(int)a3 cpuSubtype:(int)a4
{
  MTLArchitecture *v6;
  MTLArchitecture *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLArchitecture;
  v6 = -[MTLArchitecture init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_cpuType = a3;
    v6->_cpuSubtype = a4;
    v6->_name = (NSString *)newArchitectureNameString(a3, a4);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 1) = self->_name;
  *((_QWORD *)result + 2) = self->_revision;
  *((_DWORD *)result + 6) = self->_cpuType;
  *((_DWORD *)result + 7) = self->_cpuSubtype;
  return result;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

@end
