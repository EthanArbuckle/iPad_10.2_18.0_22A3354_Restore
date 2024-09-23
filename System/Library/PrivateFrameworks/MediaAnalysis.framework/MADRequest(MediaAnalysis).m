@implementation MADRequest(MediaAnalysis)

- (id)vcp_taskWithImageAsset:()MediaAnalysis andSignpostPayload:
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()) & 1) != 0
    || objc_msgSend(a1, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend((id)objc_opt_class(), "taskWithRequest:imageAsset:andSignpostPayload:", a1, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
