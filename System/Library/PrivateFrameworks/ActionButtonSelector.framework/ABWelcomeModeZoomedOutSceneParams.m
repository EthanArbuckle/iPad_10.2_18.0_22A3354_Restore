@implementation ABWelcomeModeZoomedOutSceneParams

void __ABWelcomeModeZoomedOutSceneParams_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("Scale");
  v2[1] = CFSTR("Rotation");
  v3[0] = &unk_2507426D0;
  v3[1] = &unk_250742778;
  v2[2] = CFSTR("xOffset");
  v2[3] = CFSTR("yOffset");
  v3[2] = &unk_250742928;
  v3[3] = &unk_250742938;
  v2[4] = CFSTR("zOffset");
  v2[5] = CFSTR("Damping");
  v3[4] = &unk_250742948;
  v3[5] = &unk_2507426D0;
  v2[6] = CFSTR("DampingSmooth");
  v2[7] = CFSTR("Response");
  v3[6] = &unk_250742730;
  v3[7] = &unk_2507426D0;
  v2[8] = CFSTR("ResponseSmooth");
  v2[9] = CFSTR("TimeFactor");
  v3[8] = &unk_250742730;
  v3[9] = &unk_2507426D0;
  v2[10] = CFSTR("FocusDistance");
  v2[11] = CFSTR("FocalLength");
  v3[10] = &unk_2507428C8;
  v3[11] = &unk_2507428D8;
  v2[12] = CFSTR("fStop");
  v2[13] = CFSTR("ApertureBlades");
  v3[12] = &unk_2507428E8;
  v3[13] = &unk_250742748;
  v2[14] = CFSTR("LightingIntensity");
  v2[15] = CFSTR("ZoomInProgress");
  v3[14] = &unk_2507426D0;
  v3[15] = &unk_250742730;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ABWelcomeModeZoomedOutSceneParams_params;
  ABWelcomeModeZoomedOutSceneParams_params = v0;

}

@end
