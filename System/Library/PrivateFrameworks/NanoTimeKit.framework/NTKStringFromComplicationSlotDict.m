@implementation NTKStringFromComplicationSlotDict

void ___NTKStringFromComplicationSlotDict_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[18];
  _QWORD v3[19];

  v3[18] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("top");
  v2[1] = CFSTR("center");
  v3[0] = CFSTR("top");
  v3[1] = CFSTR("center");
  v2[2] = CFSTR("bottom");
  v2[3] = CFSTR("top-left");
  v3[2] = CFSTR("bottom");
  v3[3] = CFSTR("top left");
  v2[4] = CFSTR("top-right");
  v2[5] = CFSTR("bottom-left");
  v3[4] = CFSTR("top right");
  v3[5] = CFSTR("bottom left");
  v2[6] = CFSTR("bottom-center");
  v2[7] = CFSTR("bottom-right");
  v3[6] = CFSTR("bottom center");
  v3[7] = CFSTR("bottom right");
  v2[8] = CFSTR("date");
  v2[9] = CFSTR("monogram");
  v3[8] = CFSTR("date");
  v3[9] = CFSTR("monogram");
  v2[10] = CFSTR("slot1");
  v2[11] = CFSTR("slot2");
  v3[10] = CFSTR("slot 1");
  v3[11] = CFSTR("slot 2");
  v2[12] = CFSTR("slot3");
  v2[13] = CFSTR("bezel");
  v3[12] = CFSTR("slot 3");
  v3[13] = CFSTR("bezel");
  v2[14] = CFSTR("subdial-top");
  v2[15] = CFSTR("subdial-left");
  v3[14] = CFSTR("subdial top");
  v3[15] = CFSTR("subdial left");
  v2[16] = CFSTR("subdial-right");
  v2[17] = CFSTR("subdial-bottom");
  v3[16] = CFSTR("subdial right");
  v3[17] = CFSTR("subdial bottom");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 18);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_NTKStringFromComplicationSlotDict_dictionary;
  _NTKStringFromComplicationSlotDict_dictionary = v0;

}

@end
