@implementation MFBasicMessageDataSection

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFBasicMessageDataSection;
  -[MFBasicMessageDataSection dealloc](&v3, sel_dealloc);
}

- (void)setData:(id)a3
{

  self->_dataHolder = (MFDataHolder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46088]), "initWithData:", a3);
}

- (MFDataHolder)dataHolder
{
  return self->_dataHolder;
}

- (void)setDataHolder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)isPartial
{
  return self->_partial;
}

- (void)setPartial:(BOOL)a3
{
  self->_partial = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
