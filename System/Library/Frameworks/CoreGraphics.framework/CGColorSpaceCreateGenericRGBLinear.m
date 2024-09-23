@implementation CGColorSpaceCreateGenericRGBLinear

void __CGColorSpaceCreateGenericRGBLinear_block_invoke()
{
  const void *DataForGenericHDR_f;
  const __CFData *DataForGenericHDR_f_84;
  _QWORD *icc_with_data;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;

  if (CGCMSUtilsCreateDataForGenericHDR_once != -1)
    dispatch_once(&CGCMSUtilsCreateDataForGenericHDR_once, &__block_literal_global_56_1464);
  if (CGCMSUtilsCreateDataForGenericHDR_cglibrarypredicate != -1)
    dispatch_once(&CGCMSUtilsCreateDataForGenericHDR_cglibrarypredicate, &__block_literal_global_82);
  DataForGenericHDR_f = (const void *)CGCMSUtilsCreateDataForGenericHDR_f(CGCMSUtilsCreateDataForGenericHDR_profileSpec);
  if (CGCMSUtilsCreateDataForGenericHDR_cglibrarypredicate_85 != -1)
    dispatch_once(&CGCMSUtilsCreateDataForGenericHDR_cglibrarypredicate_85, &__block_literal_global_87);
  DataForGenericHDR_f_84 = (const __CFData *)CGCMSUtilsCreateDataForGenericHDR_f_84(DataForGenericHDR_f, 0);
  if (DataForGenericHDR_f)
    CFRelease(DataForGenericHDR_f);
  if (DataForGenericHDR_f_84)
  {
    icc_with_data = color_space_state_create_icc_with_data(DataForGenericHDR_f_84);
    if (icc_with_data)
    {
      v3 = (uint64_t)icc_with_data;
      icc_with_data[9] = CFSTR("kCGColorSpaceGenericRGBLinear");
      *(_QWORD *)(icc_with_data[11] + 48) = CFSTR("Generic HDR Profile");
      CFRelease(DataForGenericHDR_f_84);
      *(_BYTE *)(v3 + 8) = 1;
      DataForGenericHDR_f_84 = (const __CFData *)CGColorSpaceCreateWithState((unsigned int *)v3, v4, v5, v6, v7, v8, v9, v10);
      do
      {
        v11 = __ldxr((unsigned int *)v3);
        v12 = v11 - 1;
      }
      while (__stxr(v12, (unsigned int *)v3));
      if (!v12)
        color_space_state_dealloc(v3);
    }
    else
    {
      CFRelease(DataForGenericHDR_f_84);
      DataForGenericHDR_f_84 = 0;
    }
  }
  CGColorSpaceCreateGenericRGBLinear_space = (uint64_t)DataForGenericHDR_f_84;
}

@end
