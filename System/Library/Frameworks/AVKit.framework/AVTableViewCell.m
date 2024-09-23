@implementation AVTableViewCell

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
  objc_storeStrong(&self->_representedObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_representedObject, 0);
}

@end
