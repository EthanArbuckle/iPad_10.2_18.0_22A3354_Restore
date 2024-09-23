@implementation _CUIPSDSublayerInfo

+ (id)newWithSublayerCount:(unsigned int)a3 indexSet:(id)a4
{
  objc_class *v6;
  _DWORD *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[4];

  v6 = (objc_class *)objc_opt_self(_CUIPSDSublayerInfo, a2);
  v7 = NSAllocateObject(v6, 4 * a3, 0);
  v8 = v7;
  if (v7)
  {
    v7[2] = a3;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __53___CUIPSDSublayerInfo_newWithSublayerCount_indexSet___block_invoke;
    v10[3] = &unk_1E41AB470;
    v10[4] = v11;
    v10[5] = object_getIndexedIvars(v7);
    objc_msgSend(a4, "enumerateIndexesUsingBlock:", v10);
    _Block_object_dispose(v11, 8);
  }
  return v8;
}

- (unsigned)numberOfSublayers
{
  return self->_numOfSublayers;
}

- (unsigned)sublayerAtIndex:(unsigned int)a3 isValid:(BOOL *)a4
{
  unsigned int result;

  if (self->_numOfSublayers <= a3)
  {
    result = 0;
    if (a4)
      *a4 = 0;
  }
  else
  {
    if (a4)
      *a4 = 1;
    return *((_DWORD *)object_getIndexedIvars(self) + a3);
  }
  return result;
}

@end
