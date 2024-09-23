@implementation ICSAriadne

+ (BOOL)shouldTraceSingposts
{
  if (qword_1002DC988 != -1)
    dispatch_once(&qword_1002DC988, &stru_1002863C0);
  return byte_1002DC980;
}

+ (void)trace:(unint64_t)a3
{
  __int16 v3;

  v3 = a3;
  if (objc_msgSend(a1, "shouldTraceSingposts"))
    kdebug_trace((4 * (v3 & 0x3FFF)) | 0x2B1A0000u, 0, 0, 0, 0);
}

@end
