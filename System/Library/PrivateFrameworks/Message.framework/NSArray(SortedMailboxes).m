@implementation NSArray(SortedMailboxes)

- (uint64_t)mf_indexOfMailboxDictionaryWithName:()SortedMailboxes
{
  id v4;
  CFIndex v5;
  CFIndex v6;
  CFIndex v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  CFRange v13;

  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v13.location = 0;
  v13.length = v5;
  v6 = CFArrayBSearchValues((CFArrayRef)a1, v13, v4, (CFComparatorFunction)_compareNameWithMailboxDictionary, v4);
  v7 = v6;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x8000000000000000) == 0 && v6 < v5)
  {
    objc_msgSend(a1, "objectAtIndex:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("MailboxName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v4);

    if (v11)
      v8 = v7;
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

@end
