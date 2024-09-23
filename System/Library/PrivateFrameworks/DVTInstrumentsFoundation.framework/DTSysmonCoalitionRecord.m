@implementation DTSysmonCoalitionRecord

- (unint64_t)cid
{
  return self->_cid;
}

- (void)setCid:(unint64_t)a3
{
  self->_cid = a3;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
