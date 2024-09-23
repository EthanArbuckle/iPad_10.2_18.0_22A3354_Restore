@implementation CNHeap

- (NSString)rawDataString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawDataString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)heapObjects
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHeapObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)heapObjectsByClassAndBinary
{
  return self->_heapObjectsByClassAndBinary;
}

- (void)setHeapObjectsByClassAndBinary:(id)a3
{
  objc_storeStrong((id *)&self->_heapObjectsByClassAndBinary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heapObjectsByClassAndBinary, 0);
  objc_storeStrong((id *)&self->_heapObjects, 0);
  objc_storeStrong((id *)&self->_rawDataString, 0);
}

@end
