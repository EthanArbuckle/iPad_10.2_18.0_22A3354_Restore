@implementation DYError

- (id)localizedDescription
{
  void *v3;
  id result;
  uint64_t v5;
  objc_super v6;

  v3 = (void *)-[DYError userInfo](self, "userInfo");
  if (!v3 || (result = (id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDD0FC8])) == 0)
  {
    v5 = -[DYError code](self, "code");
    if (!objc_msgSend((id)-[DYError domain](self, "domain"), "isEqualToString:", CFSTR("DYErrorDomain"))
      || (result = (id)_StringForError(v5)) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)DYError;
      return -[DYError localizedDescription](&v6, sel_localizedDescription);
    }
  }
  return result;
}

- (id)dy_errorSignature
{
  id result;
  objc_super v4;

  result = (id)_StringForError(-[DYError code](self, "code"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)DYError;
    return -[NSError dy_errorSignature](&v4, sel_dy_errorSignature);
  }
  return result;
}

@end
