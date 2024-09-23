@implementation GTError_replayer

- (id)localizedDescription
{
  id v3;
  id result;
  id v5;
  objc_super v6;

  v3 = -[GTError_replayer userInfo](self, "userInfo");
  if (!v3 || (result = objc_msgSend(v3, "objectForKey:", NSLocalizedDescriptionKey)) == 0)
  {
    v5 = -[GTError_replayer code](self, "code");
    if (!objc_msgSend(-[GTError_replayer domain](self, "domain"), "isEqualToString:", CFSTR("DYErrorDomain"))|| (result = (id)_StringForError((uint64_t)v5)) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GTError_replayer;
      return -[GTError_replayer localizedDescription](&v6, "localizedDescription");
    }
  }
  return result;
}

- (id)dy_errorSignature
{
  id result;
  objc_super v4;

  result = (id)_StringForError((uint64_t)-[GTError_replayer code](self, "code"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)GTError_replayer;
    return -[GTError_replayer dy_errorSignature](&v4, "dy_errorSignature");
  }
  return result;
}

@end
