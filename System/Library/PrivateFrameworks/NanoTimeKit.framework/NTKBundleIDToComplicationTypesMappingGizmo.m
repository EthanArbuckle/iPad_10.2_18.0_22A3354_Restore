@implementation NTKBundleIDToComplicationTypesMappingGizmo

void ___NTKBundleIDToComplicationTypesMappingGizmo_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a2;
  v9 = (id)objc_msgSend(&unk_1E6CA8A78, "mutableCopy");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("2A51E7B3-1B80-4981-9F09-F725BC3A8065"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  if (v4)
  {
    v5 = &unk_1E6CAABD0;
    v6 = CFSTR("com.apple.Mind");
  }
  else
  {
    v5 = &unk_1E6CAABE8;
    v6 = CFSTR("com.apple.DeepBreathing");
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v6);
  v7 = objc_msgSend(v9, "copy");
  v8 = (void *)_NTKBundleIDToComplicationTypesMappingGizmo_bundleIDToComplicationTypesMapping;
  _NTKBundleIDToComplicationTypesMappingGizmo_bundleIDToComplicationTypesMapping = v7;

}

@end
