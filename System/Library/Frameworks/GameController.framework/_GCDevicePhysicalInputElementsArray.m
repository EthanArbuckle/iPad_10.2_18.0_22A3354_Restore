@implementation _GCDevicePhysicalInputElementsArray

- (uint64_t)implementation
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (_GCDevicePhysicalInputElementsArray)retain
{
  _GCDevicePhysicalInputBase *implementation;
  _GCDevicePhysicalInputBase *v4;

  if (self)
    implementation = self->_implementation;
  else
    implementation = 0;
  v4 = implementation;
  return self;
}

- (void)release
{
  if (self)
    self = (_GCDevicePhysicalInputElementsArray *)self->_implementation;

}

- (unint64_t)retainCount
{
  if (self)
    self = (_GCDevicePhysicalInputElementsArray *)self->_implementation;
  return -[_GCDevicePhysicalInputElementsArray retainCount](self, "retainCount");
}

- (BOOL)allowsWeakReference
{
  return 0;
}

- (unint64_t)count
{
  uint64_t v2;

  if (self)
  {
    v2 = *(_QWORD *)(self + 8);
    if (v2)
      return *(_QWORD *)(v2 + 24);
    else
      return 0;
  }
  return self;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self)
    self = (_GCDevicePhysicalInputElementsArray *)self->_implementation;
  return (id)-[_GCDevicePhysicalInputBase _elementAtIndex:]((uint64_t)self, a3);
}

@end
