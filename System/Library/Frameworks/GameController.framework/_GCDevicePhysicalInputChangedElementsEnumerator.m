@implementation _GCDevicePhysicalInputChangedElementsEnumerator

- (uint64_t)implementation
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (_GCDevicePhysicalInputChangedElementsEnumerator)retain
{
  _GCDevicePhysicalInputTransaction *implementation;
  _GCDevicePhysicalInputTransaction *v4;
  objc_super v6;

  if (self)
    implementation = self->_implementation;
  else
    implementation = 0;
  v4 = implementation;
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputChangedElementsEnumerator;
  return -[_GCDevicePhysicalInputChangedElementsEnumerator retain](&v6, sel_retain);
}

- (void)release
{
  _GCDevicePhysicalInputTransaction *implementation;
  objc_super v4;

  if (self)
    implementation = self->_implementation;
  else
    implementation = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputChangedElementsEnumerator;
  -[_GCDevicePhysicalInputChangedElementsEnumerator release](&v4, sel_release);
}

- (id)nextObject
{
  unint64_t currentIndex;
  unint64_t v4;

  while (1)
  {
    currentIndex = self->_currentIndex;
    if (currentIndex >= objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)self->_implementation), "count"))break;
    v4 = self->_currentIndex;
    self->_currentIndex = v4 + 1;
    if (-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:](self->_implementation, v4, 0, 1))
    {
      return (id)objc_msgSend((id)-[_GCDevicePhysicalInputBase elements]((uint64_t)self->_implementation), "objectAtIndexedSubscript:", v4);
    }
  }
  return 0;
}

@end
