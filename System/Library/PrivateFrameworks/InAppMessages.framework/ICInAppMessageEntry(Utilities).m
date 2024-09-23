@implementation ICInAppMessageEntry(Utilities)

- (uint64_t)comparePriorityWithMessageEntry:()Utilities
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(a1, "applicationMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "priority");

  objc_msgSend(v4, "applicationMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "priority");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

@end
