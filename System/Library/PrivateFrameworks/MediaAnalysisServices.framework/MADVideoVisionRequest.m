@implementation MADVideoVisionRequest

+ (id)allocWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if ((id)objc_opt_class() == a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___MADVideoVisionRequest;
    return objc_msgSendSuper2(&v14, sel_allocWithZone_, a3);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
      +[MADVideoVisionRequest allocWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    return 0;
  }
}

+ (void)allocWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Subclassing MADVideoVisionRequest not allowed.", a5, a6, a7, a8, 0);
}

@end
