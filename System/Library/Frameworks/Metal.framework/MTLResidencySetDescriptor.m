@implementation MTLResidencySetDescriptor

- (MTLResidencySetDescriptor)init
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLResidencySetDescriptor;
  -[MTLResidencySetDescriptor init](&v4, sel_init);
  return self;
}

- (void)setEvictsImmediately:(BOOL)a3
{
  self->_evictsImmediately = a3;
}

- (BOOL)evictsImmediately
{
  return self->_evictsImmediately;
}

- (BOOL)commitsImmediately
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLResidencySetDescriptor;
  -[MTLResidencySetDescriptor dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setLabel:", -[MTLResidencySetDescriptor label](self, "label"));
  objc_msgSend(v4, "setEvictsImmediately:", -[MTLResidencySetDescriptor evictsImmediately](self, "evictsImmediately"));
  objc_msgSend(v4, "setInitialCapacity:", -[MTLResidencySetDescriptor initialCapacity](self, "initialCapacity"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  NSString *v7;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    v7 = (NSString *)*((_QWORD *)a3 + 1);
    if (v7 == self->_label || (v6 = -[NSString isEqual:](v7, "isEqual:")) != 0)
    {
      if (*((unsigned __int8 *)a3 + 24) != self->_evictsImmediately)
        goto LABEL_3;
      LOBYTE(v6) = *((_QWORD *)a3 + 2) == self->_initialCapacity;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t initialCapacity;
  _QWORD v6[2];
  _BOOL4 evictsImmediately;

  bzero(v6, 0x18uLL);
  v3 = -[NSString hash](self->_label, "hash");
  initialCapacity = self->_initialCapacity;
  v6[0] = v3;
  v6[1] = initialCapacity;
  evictsImmediately = self->_evictsImmediately;
  return _MTLHashState((int *)v6, 0x18uLL);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (void)setInitialCapacity:(unint64_t)a3
{
  self->_initialCapacity = a3;
}

@end
