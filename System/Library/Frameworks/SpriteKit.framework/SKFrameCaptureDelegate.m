@implementation SKFrameCaptureDelegate

+ (id)sharedInstance
{
  unsigned __int8 v2;

  {
    +[SKFrameCaptureDelegate sharedInstance]::instance = objc_alloc_init(SKFrameCaptureDelegate);
  }
  return (id)+[SKFrameCaptureDelegate sharedInstance]::instance;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPerformFullCapture:", 1);
  return v4;
}

- (void)archiver:(id)a3 didEncodeObject:(id)a4
{
  id v4;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPerformFullCapture:", 0);

}

@end
