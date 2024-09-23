@implementation NSIndexPath(MailUI)

- (uint64_t)ef_publicDescription
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld - %ld}"), objc_msgSend(a1, "section"), objc_msgSend(a1, "item"));
}

- (unint64_t)mui_distanceTo:()MailUI
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = a1;
  v6 = objc_msgSend(v5, "section");
  v7 = objc_msgSend(v4, "section");
  if (v6 >= v7)
  {
    if (v6 <= v7)
    {
      v9 = objc_msgSend(v4, "item");
      v8 = v9 - objc_msgSend(v5, "item");
    }
    else
    {
      v8 = 0x8000000000000000;
    }
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (uint64_t)mui_nextIndexPath
{
  return objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", objc_msgSend(a1, "item") + 1, objc_msgSend(a1, "section"));
}

@end
