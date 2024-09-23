@implementation CEKExpandNormalizedContactPoint

void __CEKExpandNormalizedContactPoint_block_invoke()
{
  void *v0;
  double v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_referenceBounds");
  v18 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  objc_msgSend(v0, "scale");
  v8 = (void *)MGCopyAnswer();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v15 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9835000, v15, OS_LOG_TYPE_DEFAULT, "No data found for CameraButton MG query", buf, 2u);
    }

    v12 = 0.0;
    v14 = 0.610402524;
  }
  CEKExpandNormalizedPoint(v12, v14, v18, v3, v5, v7);
  UIRectRoundToScale();
  CEKExpandNormalizedContactPoint_contactFrame_2 = v16;
  CEKExpandNormalizedContactPoint_contactFrame_3 = v17;

}

@end
