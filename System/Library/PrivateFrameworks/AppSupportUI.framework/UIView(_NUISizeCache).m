@implementation UIView(_NUISizeCache)

- (uint64_t)nukeContentLayoutSizeCacheFromOrbit
{
  _NUIViewContainerViewInfo *IfNeeded;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  IfNeeded = _NUIContainerViewInfoCreateIfNeeded(a1, 1);
  IfNeeded->_sizeCache.__end_ = IfNeeded->_sizeCache.__begin_;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)-[objc_object subviews](a1, "subviews", 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "nukeContentLayoutSizeCacheFromOrbit");
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

@end
