@implementation C3DPreferencesGetInteger

void __C3DPreferencesGetInteger_block_invoke()
{
  uint64_t v0;
  id v1;

  v1 = (id)CFPreferencesCopyAppValue(CFSTR("internalSettings"), CFSTR("com.apple.scenekit"));
  C3DPreferencesGetInteger_prefs[0] = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceGLES")), "BOOLValue");
  qword_1F03C5998 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceMetal")), "BOOLValue");
  qword_1F03C59A0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("showsStatistics")), "BOOLValue");
  qword_1F03C59A8 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("cameraControlEnabled")), "BOOLValue");
  qword_1F03C59B0 = (int)objc_msgSend((id)objc_msgSend(v1, "valueForKey:", CFSTR("batchMaxCount")), "intValue");
  unk_1F03C59B8 = 0;
  qword_1F03C59C0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("disableLinearSpaceRendering")), "BOOLValue");
  qword_1F03C59C8 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("disableWideGamut")), "BOOLValue");
  qword_1F03C59D0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("enableWideGamut")), "BOOLValue");
  qword_1F03C59D8 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("enablePostMorphUnifyNormals")), "BOOLValue");
  qword_1F03C59E8 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("enableStandardShadersWithFunctionConstants")), "BOOLValue");
  qword_1F03C59F0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceNMOSBehavior")), "BOOLValue");
  qword_1F03C59F8 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceOS2019Behavior")), "BOOLValue");
  qword_1F03C5A00 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceOS2018Behavior")), "BOOLValue");
  qword_1F03C5A08 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceOS2017Behavior")), "BOOLValue");
  qword_1F03C5A10 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("forceOS2016Behavior")), "BOOLValue");
  unk_1F03C5A18 = 0;
  if (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("useOneCommandQueuePerDevice")))
    v0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("useOneCommandQueuePerDevice")), "BOOLValue");
  else
    v0 = 1;
  qword_1F03C5A20 = v0;
  qword_1F03C5A28 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("disableReverseZ")), "BOOLValue");
  qword_1F03C59E0 = objc_msgSend((id)objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("isolateCacheMissShader")), "BOOLValue");

}

@end
