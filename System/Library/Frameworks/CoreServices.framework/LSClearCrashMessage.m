@implementation LSClearCrashMessage

void ___LSClearCrashMessage_block_invoke()
{
  uint64_t v0;
  unint64_t v1;
  int v2;
  void *v3;

  v0 = _LSSetCrashReporterMessage_messagePtr;
  while (1)
  {
    v1 = __ldxr((unint64_t *)&_LSSetCrashReporterMessage_messagePtr);
    if (v1 != v0)
      break;
    if (!__stxr(0, (unint64_t *)&_LSSetCrashReporterMessage_messagePtr))
    {
      v2 = 1;
      goto LABEL_6;
    }
  }
  v2 = 0;
  __clrex();
LABEL_6:
  if (v2)
    v3 = (void *)v0;
  else
    v3 = 0;
  free(v3);
  qword_1ECD29C28 = _LSSetCrashReporterMessage_messagePtr;
}

@end
