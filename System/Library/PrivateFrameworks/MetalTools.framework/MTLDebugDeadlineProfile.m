@implementation MTLDebugDeadlineProfile

- (void)validateCommandQueue:(id)a3
{
  unint64_t *p_commandQueue;
  id v4;
  id v5;
  int v6;

  p_commandQueue = (unint64_t *)&self->_commandQueue;
  v4 = (id)atomic_load((unint64_t *)&self->_commandQueue);
  if (v4)
  {
    if (v4 != a3)
LABEL_13:
      MTLReportFailure();
  }
  else
  {
    do
    {
      v5 = (id)__ldaxr(p_commandQueue);
      if (v5)
      {
        v6 = 0;
        __clrex();
        goto LABEL_8;
      }
    }
    while (__stlxr((unint64_t)a3, p_commandQueue));
    v6 = 1;
LABEL_8:
    if (v6)
      v5 = 0;
    if ((v6 & 1) == 0 && v5 != a3)
      goto LABEL_13;
  }
}

@end
