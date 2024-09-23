@implementation LBFContextId

+ (id)getContextId
{
  if (qword_254355858 != -1)
    dispatch_once(&qword_254355858, &unk_251095050);
  return (id)qword_254355850;
}

@end
