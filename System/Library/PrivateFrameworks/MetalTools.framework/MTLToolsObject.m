@implementation MTLToolsObject

- (MTLDevice)device
{
  return (MTLDevice *)self->_device;
}

- (MTLToolsObject)initWithBaseObject:(id)a3 parent:(id)a4
{
  MTLToolsObject *v6;
  MTLToolsDevice *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLToolsObject;
  v6 = -[MTLToolsObject init](&v9, sel_init);
  if (v6)
  {
    v6->_baseObject = (MTLToolsObject *)a3;
    v6->_parent = (MTLToolsObject *)a4;
    if (a4)
      v7 = (MTLToolsDevice *)*((_QWORD *)a4 + 3);
    else
      v7 = 0;
    v6->_device = v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v4;

  if (atomic_load((unsigned int *)&self->_externalReferences))
    -[MTLToolsDevice notifyExternalReferencesNonZeroOnDealloc:](self->_device, "notifyExternalReferencesNonZeroOnDealloc:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTLToolsObject;
  -[MTLToolsObject dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsObject;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ -> %@"), -[MTLToolsObject description](&v3, sel_description), -[MTLToolsObject description](self->_baseObject, "description"));
}

- (id)originalObject
{
  MTLToolsObject *i;

  for (i = self->_baseObject; ; i = -[MTLToolsObject baseObject](i, "baseObject"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
  }
  return i;
}

- (void)setOriginalObject:(id)a3
{
  MTLToolsObject *v4;

  v4 = self;
  -[MTLToolsObject baseObject](self, "baseObject");
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v4 = -[MTLToolsObject baseObject](v4, "baseObject");
    -[MTLToolsObject baseObject](v4, "baseObject");
  }

  v4->_baseObject = (MTLToolsObject *)a3;
}

- (id)parent
{
  return self->_parent;
}

- (id)strongParent
{
  return self->_parent;
}

- (id)baseObject
{
  return self->_baseObject;
}

- (void)setBaseObject:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
