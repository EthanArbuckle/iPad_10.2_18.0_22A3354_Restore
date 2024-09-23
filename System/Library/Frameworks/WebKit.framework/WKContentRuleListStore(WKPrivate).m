@implementation WKContentRuleListStore(WKPrivate)

- (_QWORD)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BBB78;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)_getContentRuleListSourceForIdentifier:()WKPrivate completionHandler:
{
  WTF::StringImpl *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  WTF::StringImpl *v6;

  v2 = *a2;
  *a2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  if (v2)
    v4 = WTF::StringImpl::operator NSString *();
  else
    v4 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  if (v2)
  {
    if (*(_DWORD *)v2 == 2)
      return WTF::StringImpl::destroy(v2, v6);
    else
      *(_DWORD *)v2 -= 2;
  }
  return result;
}

@end
