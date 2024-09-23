@implementation MTLToolsVisibleFunctionTable

- (unint64_t)resourceIndex
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "resourceIndex");
}

- (unint64_t)uniqueIdentifier
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "uniqueIdentifier");
}

- (unint64_t)gpuHandle
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuHandle");
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuResourceID");
}

- (unint64_t)gpuAddress
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "gpuAddress");
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setFunction:atIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto17MTLFunctionHandle}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setFunctions:withRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setBuffer:offset:atIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *__p[3];

  length = a5.length;
  location = a5.location;
  std::vector<objc_object  {objcproto9MTLBuffer}*>::vector(__p, a5.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v11 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v11;
    }
  }
  v12 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v12, "setBuffers:offsets:withRange:", __p[0], a4, location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)setValue:(unint64_t)a3 atIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setValue:atIndex:", a3, a4);
}

- (void)setValue:(unint64_t)a3 withRange:(_NSRange)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setValue:withRange:", a3, a4.location, a4.length);
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
  objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "setVisibleFunctionTable:atBufferIndex:", objc_msgSend(a3, "baseObject"), a4);
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *__p[3];

  length = a4.length;
  location = a4.location;
  std::vector<objc_object  {objcproto23MTLVisibleFunctionTable}*>::vector(__p, a4.length);
  if (length)
  {
    for (i = 0; i != length; ++i)
    {
      v9 = objc_msgSend((id)a3[i], "baseObject");
      *((_QWORD *)__p[0] + i) = v9;
    }
  }
  v10 = -[MTLToolsObject baseObject](self, "baseObject");
  objc_msgSend(v10, "setVisibleFunctionTables:withBufferRange:", __p[0], location, length);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "bufferAddressAtIndex:", a3);
}

@end
