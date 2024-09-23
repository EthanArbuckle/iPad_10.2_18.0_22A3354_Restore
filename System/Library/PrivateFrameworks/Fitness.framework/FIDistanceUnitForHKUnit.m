@implementation FIDistanceUnitForHKUnit

void __FIDistanceUnitForHKUnit_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("km");
  v2[1] = CFSTR("m");
  v3[0] = &unk_24CC58C60;
  v3[1] = &unk_24CC58C78;
  v2[2] = CFSTR("mi");
  v2[3] = CFSTR("yd");
  v3[2] = &unk_24CC58C90;
  v3[3] = &unk_24CC58CA8;
  v2[4] = CFSTR("ft");
  v3[4] = &unk_24CC58CC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FIDistanceUnitForHKUnit___distanceUnitsByUnitString;
  FIDistanceUnitForHKUnit___distanceUnitsByUnitString = v0;

}

@end
