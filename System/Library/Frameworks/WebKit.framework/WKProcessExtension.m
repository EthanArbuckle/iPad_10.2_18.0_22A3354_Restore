@implementation WKProcessExtension

+ (id)sharedInstance
{
  id result;

  if (_MergedGlobals_129 == 1)
    return (id)qword_1ECE73418;
  result = 0;
  qword_1ECE73418 = 0;
  _MergedGlobals_129 = 1;
  return result;
}

- (void)setSharedInstance:(id)a3
{
  const void *v4;

  if ((_MergedGlobals_129 & 1) != 0)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  qword_1ECE73418 = 0;
  _MergedGlobals_129 = 1;
  if (a3)
LABEL_3:
    CFRetain(a3);
LABEL_4:
  v4 = (const void *)qword_1ECE73418;
  qword_1ECE73418 = (uint64_t)a3;
  if (v4)
    CFRelease(v4);
}

- (id)grant:(id)a3 name:(id)a4
{
  return 0;
}

@end
