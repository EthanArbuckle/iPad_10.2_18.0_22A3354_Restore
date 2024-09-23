@implementation CHHandle

- (TUHandle)tuHandle
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](self, "value"));
  if (v3)
  {
    v4 = (unint64_t)-[CHHandle type](self, "type");
    if (v4 > 3)
      v5 = 2;
    else
      v5 = qword_1000758A8[v4];
    v6 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return (TUHandle *)v6;
}

@end
