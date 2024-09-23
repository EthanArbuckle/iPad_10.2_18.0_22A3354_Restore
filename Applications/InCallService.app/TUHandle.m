@implementation TUHandle

- (CNGeminiHandle)cnHandle
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUHandle value](self, "value"));
  if (v3)
  {
    v4 = -[TUHandle type](self, "type");
    if (v4 == (id)2)
      v5 = 0;
    else
      v5 = -1;
    if (v4 == (id)3)
      v6 = 1;
    else
      v6 = v5;
    v7 = objc_msgSend(objc_alloc((Class)CNGeminiHandle), "initWithString:type:", v3, v6);
  }
  else
  {
    v7 = 0;
  }

  return (CNGeminiHandle *)v7;
}

@end
