@implementation FindScheduleSlotsToAddAndClearResults

- (NSDictionary)slotToHMMTRSchedulesToAdd
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSlotToHMMTRSchedulesToAdd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)slotsOfSchedulesToClear
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSlotsOfSchedulesToClear:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotsOfSchedulesToClear, 0);
  objc_storeStrong((id *)&self->_slotToHMMTRSchedulesToAdd, 0);
}

@end
