@implementation ADLayoutUtils(LayoutAdjust)

+ (uint64_t)adjustLayout:()LayoutAdjust sourceOrientation:toRotationPreference:
{
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  uint8_t buf[2];

  if (a3 == 254)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 254;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Cannot adjust unknown layout";
    v8 = buf;
LABEL_13:
    _os_log_error_impl(&dword_20B62B000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    return 254;
  }
  if (a5 || a4 != 8 && a4 != 6)
    return a3;
  if (a3 == 255)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return 254;
    v9 = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Cannot rotate default layout";
    v8 = (uint8_t *)&v9;
    goto LABEL_13;
  }
  return objc_msgSend(MEMORY[0x24BE05FF0], "transposeLayout:");
}

@end
