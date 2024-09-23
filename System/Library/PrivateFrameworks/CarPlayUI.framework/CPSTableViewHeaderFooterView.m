@implementation CPSTableViewHeaderFooterView

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
