@implementation WDStoredDataCategory

- (NSMutableArray)displayTypes
{
  NSMutableArray *displayTypes;
  NSMutableArray *v4;
  NSMutableArray *v5;

  displayTypes = self->_displayTypes;
  if (!displayTypes)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_displayTypes;
    self->_displayTypes = v4;

    displayTypes = self->_displayTypes;
  }
  return displayTypes;
}

- (HKDisplayCategory)category
{
  return (HKDisplayCategory *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_displayTypes, 0);
}

@end
