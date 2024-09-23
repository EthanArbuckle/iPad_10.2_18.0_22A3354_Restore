@implementation BMSegmentManagerProtectedState

- (void)setSegmentNames:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (BMSegmentManagerProtectedState)initWithDeviceStateIsUnlocked:(BOOL)a3
{
  BMSegmentManagerProtectedState *v4;
  BMSegmentManagerProtectedState *v5;
  uint64_t v6;
  NSMutableOrderedSet *segmentNames;
  uint64_t v8;
  NSMutableDictionary *segmentFileHandles;
  NSError *error;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BMSegmentManagerProtectedState;
  v4 = -[BMSegmentManagerProtectedState init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isDataAccessible = a3;
    v6 = objc_opt_new();
    segmentNames = v5->_segmentNames;
    v5->_segmentNames = (NSMutableOrderedSet *)v6;

    v8 = objc_opt_new();
    segmentFileHandles = v5->_segmentFileHandles;
    v5->_segmentFileHandles = (NSMutableDictionary *)v8;

    error = v5->_error;
    v5->_error = 0;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_segmentFileHandles, 0);
  objc_storeStrong((id *)&self->_segmentNames, 0);
}

- (BOOL)isDataAccessible
{
  if (result)
    return *(_BYTE *)(result + 8) != 0;
  return result;
}

- (uint64_t)setIsDataAccessible:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2;
  return result;
}

- (uint64_t)segmentNames
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (uint64_t)segmentFileHandles
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void)setSegmentFileHandles:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (uint64_t)error
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

@end
