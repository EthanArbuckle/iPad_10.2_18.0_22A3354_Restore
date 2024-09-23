@implementation MFBasicMessageDataSection

- (void)setData:(id)a3
{
  MFDataHolder *v4;
  MFDataHolder *dataHolder;
  id v6;

  v6 = a3;
  v4 = (MFDataHolder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46088]), "initWithData:", v6);
  dataHolder = self->_dataHolder;
  self->_dataHolder = v4;

}

- (MFDataHolder)dataHolder
{
  return self->_dataHolder;
}

- (void)setDataHolder:(id)a3
{
  objc_storeStrong((id *)&self->_dataHolder, a3);
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
  objc_storeStrong((id *)&self->_partName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_dataHolder, 0);
}

@end
