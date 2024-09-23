@implementation CGColorSpaceCreateWithName

void __CGColorSpaceCreateWithName_block_invoke()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  _QWORD v3[89];

  v3[88] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("kCGColorSpaceDeviceGray");
  v3[1] = CGColorSpaceCreateDeviceGray;
  v3[2] = CFSTR("kCGColorSpaceDeviceRGB");
  v3[3] = CGColorSpaceCreateDeviceRGB;
  v3[4] = CFSTR("kCGColorSpaceDeviceCMYK");
  v3[5] = CGColorSpaceCreateDeviceCMYK;
  v3[6] = CFSTR("kCGColorSpaceUncalibratedGray");
  v3[7] = CGColorSpaceCreateUncalibratedGray;
  v3[8] = CFSTR("kCGColorSpaceUncalibratedRGB");
  v3[9] = CGColorSpaceCreateUncalibratedRGB;
  v3[10] = CFSTR("kCGColorSpaceUncalibratedCMYK");
  v3[11] = CGColorSpaceCreateUncalibratedCMYK;
  v3[12] = CFSTR("kCGColorSpaceGenericGray");
  v3[13] = CGColorSpaceCreateGenericGray;
  v3[14] = CFSTR("kCGColorSpaceGenericRGB");
  v3[15] = CGColorSpaceCreateGenericRGB;
  v3[16] = CFSTR("kCGColorSpaceGenericCMYK");
  v3[17] = CGColorSpaceCreateGenericCMYK;
  v3[18] = CFSTR("kCGColorSpaceDisplayP3");
  v3[19] = CGColorSpaceCreateDisplayP3;
  v3[20] = CFSTR("kCGColorSpaceExtendedDisplayP3");
  v3[21] = CGColorSpaceCreateExtendedDisplayP3;
  v3[22] = CFSTR("kCGColorSpaceLinearDisplayP3");
  v3[23] = CGColorSpaceCreateLinearDisplayP3;
  v3[24] = CFSTR("kCGColorSpaceExtendedLinearDisplayP3");
  v3[25] = CGColorSpaceCreateExtendedLinearDisplayP3;
  v3[26] = CFSTR("kCGColorSpaceDisplayP3_PQ");
  v3[27] = CGColorSpaceCreateDisplayP3_PQ;
  v3[28] = CFSTR("kCGColorSpaceDisplayP3_HLG");
  v3[29] = CGColorSpaceCreateDisplayP3_HLG;
  v3[30] = CFSTR("kCGColorSpaceDisplayP3_709OETF");
  v3[31] = CGColorSpaceCreateDisplayP3_709OETF;
  v3[32] = CFSTR("kCGColorSpaceGenericGrayGamma2_2");
  v3[33] = CGColorSpaceCreateGenericGrayGamma22;
  v3[34] = CFSTR("kCGColorSpaceAdobeRGB1998");
  v3[35] = CGColorSpaceCreateAdobeRGB1998;
  v3[36] = CFSTR("kCGColorSpaceSRGB");
  v3[37] = CGColorSpaceCreateSRGB;
  v3[38] = CFSTR("kCGColorSpaceGenericLab");
  v3[39] = CGColorSpaceCreateGenericLab;
  v3[40] = CFSTR("kCGColorSpaceGenericRGBLinear");
  v3[41] = CGColorSpaceCreateGenericRGBLinear;
  v3[42] = CFSTR("kCGColorSpaceGenericXYZ");
  v3[43] = CGColorSpaceCreateGenericXYZ;
  v3[44] = CFSTR("kCGColorSpaceACESCGLinear");
  v3[45] = CGColorSpaceCreateACESCGLinear;
  v3[46] = CFSTR("kCGColorSpaceITUR_709");
  v3[47] = CGColorSpaceCreateITUR_709;
  v3[48] = CFSTR("kCGColorSpaceITUR_709_PQ");
  v3[49] = CGColorSpaceCreateITUR_709_PQ;
  v3[50] = CFSTR("kCGColorSpaceITUR_709_HLG");
  v3[51] = CGColorSpaceCreateITUR_709_HLG;
  v3[52] = CFSTR("kCGColorSpaceITUR_2020");
  v3[53] = CGColorSpaceCreateITUR_2020;
  v3[54] = CFSTR("kCGColorSpaceITUR_2020_sRGBGamma");
  v3[55] = CGColorSpaceCreateITUR_2020_sRGBGamma;
  v3[56] = CFSTR("kCGColorSpaceLinearITUR_2020");
  v3[57] = CGColorSpaceCreateLinearITUR_2020;
  v3[58] = CFSTR("kCGColorSpaceExtendedITUR_2020");
  v3[59] = CGColorSpaceCreateExtendedITUR_2020;
  v3[60] = CFSTR("kCGColorSpaceExtendedLinearITUR_2020");
  v3[61] = CGColorSpaceCreateExtendedLinearITUR_2020;
  v3[62] = CFSTR("kCGColorSpaceITUR_2100_PQ");
  v3[63] = CGColorSpaceCreateITUR_2100_PQ;
  v3[64] = CFSTR("kCGColorSpaceITUR_2100_HLG");
  v3[65] = CGColorSpaceCreateITUR_2100_HLG;
  v3[66] = CFSTR("kCGColorSpaceROMMRGB");
  v3[67] = CGColorSpaceCreateROMMRGB;
  v3[68] = CFSTR("kCGColorSpaceDCIP3");
  v3[69] = CGColorSpaceCreateDCIP3;
  v3[70] = CFSTR("kCGColorSpaceExtendedSRGB");
  v3[71] = CGColorSpaceExtendedSRGB;
  v3[72] = CFSTR("kCGColorSpaceLinearSRGB");
  v3[73] = CGColorSpaceLinearSRGB;
  v3[74] = CFSTR("kCGColorSpaceExtendedLinearSRGB");
  v3[75] = CGColorSpaceExtendedLinearSRGB;
  v3[76] = CFSTR("kCGColorSpaceExtendedGray");
  v3[77] = CGColorSpaceExtendedGray;
  v3[78] = CFSTR("kCGColorSpaceLinearGray");
  v3[79] = CGColorSpaceLinearGray;
  v3[80] = CFSTR("kCGColorSpaceExtendedLinearGray");
  v3[81] = CGColorSpaceExtendedLinearGray;
  v3[82] = CFSTR("kCGColorSpacePerceptualStandardRGB");
  v3[83] = CGColorSpacePerceptualStandardRGB;
  v3[84] = CFSTR("kCGColorSpaceCoreMedia709");
  v3[85] = CGColorSpaceCoreMedia709;
  v3[86] = CFSTR("kCGColorSpaceColoredPattern");
  v3[87] = CGColorSpaceCreateColoredPattern;
  v0 = 0;
  CGColorSpaceCreateWithName_name_creator_pair_dict = (uint64_t)CFDictionaryCreateMutable(0, 44, MEMORY[0x1E0C9B390], 0);
  do
  {
    CFDictionarySetValue((CFMutableDictionaryRef)CGColorSpaceCreateWithName_name_creator_pair_dict, (const void *)v3[v0], (const void *)v3[v0 + 1]);
    v0 += 2;
  }
  while (v0 != 88);
  v1 = (char *)malloc_type_malloc(0x2C0uLL, 0xE004020B7322BuLL);
  v2 = 0;
  CGColorSpaceCreateWithName_name_creator_pair_array = (uint64_t)v1;
  CGColorSpaceCreateWithName_name_creator_pair_count = 1;
  do
  {
    *(_OWORD *)&v1[v2 * 8] = *(_OWORD *)&v3[v2];
    v2 += 2;
  }
  while (v2 != 88);
  qsort(v1, 0x2CuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_names);
}

@end
