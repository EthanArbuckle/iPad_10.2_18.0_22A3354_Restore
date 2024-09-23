@implementation AVCaptureOutput(CAMCaptureEngine)

- (id)currentRequest
{
  void *v2;
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v3 = 0;
    goto LABEL_5;
  }
  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CAMCaptureEngineCurrentRequestKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v4;
}

@end
