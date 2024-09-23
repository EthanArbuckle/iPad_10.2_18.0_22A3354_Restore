@implementation ReadSchedulesResults

- (NSDictionary)schedulesToSlots
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSchedulesToSlots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)availableSlots
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableSlots:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableSlots, 0);
  objc_storeStrong((id *)&self->_schedulesToSlots, 0);
}

@end
