@implementation IUIRTIInputSystemSourceSession

- (id)sessionIndependentPayloadDelegate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSystemSourceSession payloadDelegate](self, "payloadDelegate"));
  v5 = objc_opt_class(IUIRTIInputSource, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IUIRTIInputSystemSourceSession payloadDelegate](self, "payloadDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataTransportDelegate"));

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceSessionPayloadDelegate"));

  return v9;
}

@end
