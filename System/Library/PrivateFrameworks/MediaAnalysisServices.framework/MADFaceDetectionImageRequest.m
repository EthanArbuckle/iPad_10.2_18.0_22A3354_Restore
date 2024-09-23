@implementation MADFaceDetectionImageRequest

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MADFaceDetectionImageRequest;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[MADFaceDetectionImageRequest allocWithZone:].cold.1();
    return 0;
  }
}

+ (void)allocWithZone:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Subclassing MADFaceDetectionImageRequest not allowed.", v0, 2u);
}

@end
