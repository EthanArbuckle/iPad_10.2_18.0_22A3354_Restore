@implementation PatternVisualInfo

- (unint64_t)visualLocation
{
  return self->_visualLocation;
}

- (void)setVisualLocation:(unint64_t)a3
{
  self->_visualLocation = a3;
}

- (NSArray)sectionIds
{
  return self->_sectionIds;
}

- (void)setSectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIds, 0);
}

@end
