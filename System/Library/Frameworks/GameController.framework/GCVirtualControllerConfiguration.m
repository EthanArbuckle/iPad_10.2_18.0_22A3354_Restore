@implementation GCVirtualControllerConfiguration

- (NSSet)elements
{
  return self->_elements;
}

- (void)setElements:(NSSet *)elements
{
  objc_storeStrong((id *)&self->_elements, elements);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
}

@end
