@implementation AVCaptureDevice(JFX)

- (uint64_t)jfx_trueDepthCamera
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "deviceType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDB1A48]);

  return v2;
}

- (uint64_t)jfx_highestQualityColorSpace
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (jfx_highestQualityColorSpace_onceToken != -1)
    dispatch_once(&jfx_highestQualityColorSpace_onceToken, &__block_literal_global_623);
  objc_msgSend(a1, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)jfx_highestQualityColorSpace_s_colorSpaceLookup;
  objc_sync_enter(v3);
  objc_msgSend((id)jfx_highestQualityColorSpace_s_colorSpaceLookup, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    objc_msgSend(a1, "formats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__AVCaptureDevice_JFX__jfx_highestQualityColorSpace__block_invoke_2;
    v10[3] = &unk_24EE5A760;
    v10[4] = &v11;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)jfx_highestQualityColorSpace_s_colorSpaceLookup, "setObject:forKeyedSubscript:", v6, v2);

    _Block_object_dispose(&v11, 8);
  }
  objc_sync_exit(v3);

  objc_msgSend((id)jfx_highestQualityColorSpace_s_colorSpaceLookup, "objectForKeyedSubscript:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  return v8;
}

@end
