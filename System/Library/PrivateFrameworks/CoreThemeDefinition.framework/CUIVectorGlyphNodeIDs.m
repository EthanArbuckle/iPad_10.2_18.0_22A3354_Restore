@implementation CUIVectorGlyphNodeIDs

id ____CUIVectorGlyphNodeIDs_block_invoke()
{
  id result;
  _QWORD v1[28];

  v1[27] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("Ultralight-L");
  v1[1] = CFSTR("Ultralight-M");
  v1[2] = CFSTR("Ultralight-S");
  v1[3] = CFSTR("Thin-L");
  v1[4] = CFSTR("Thin-M");
  v1[5] = CFSTR("Thin-S");
  v1[6] = CFSTR("Light-L");
  v1[7] = CFSTR("Light-M");
  v1[8] = CFSTR("Light-S");
  v1[9] = CFSTR("Regular-L");
  v1[10] = CFSTR("Regular-M");
  v1[11] = CFSTR("Regular-S");
  v1[12] = CFSTR("Medium-L");
  v1[13] = CFSTR("Medium-M");
  v1[14] = CFSTR("Medium-S");
  v1[15] = CFSTR("Semibold-L");
  v1[16] = CFSTR("Semibold-M");
  v1[17] = CFSTR("Semibold-S");
  v1[18] = CFSTR("Bold-L");
  v1[19] = CFSTR("Bold-M");
  v1[20] = CFSTR("Bold-S");
  v1[21] = CFSTR("Heavy-L");
  v1[22] = CFSTR("Heavy-M");
  v1[23] = CFSTR("Heavy-S");
  v1[24] = CFSTR("Black-L");
  v1[25] = CFSTR("Black-M");
  v1[26] = CFSTR("Black-S");
  result = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 27);
  __CUIVectorGlyphNodeIDs__CUIVectorGlyphNodeIDs = (uint64_t)result;
  return result;
}

@end
