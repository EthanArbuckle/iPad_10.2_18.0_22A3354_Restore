@implementation ColorSyncProfileCreateWithName

void __ColorSyncProfileCreateWithName_block_invoke()
{
  char *v0;
  uint64_t v1;
  size_t v2;
  uint64_t v3;
  size_t v4;
  _OWORD v5[13];
  CFTypeRef (*v6)();
  void *keys;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  CFTypeRef (*v12)();
  CFStringRef v13;
  CFTypeRef (*v14)();
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  CFStringRef v21;
  CFTypeRef (*v22)();
  CFStringRef v23;
  CFStringRef v24;
  CFStringRef v25;
  CFTypeRef (*v26)();
  CFStringRef v27;
  CFTypeRef (*v28)();
  CFStringRef v29;
  CFStringRef v30;
  CFStringRef v31;
  CFTypeRef (*v32)();
  CFStringRef v33;
  CFTypeRef (*v34)();
  CFStringRef v35;
  CFTypeRef (*v36)();
  uint64_t v37;
  CFTypeRef (*v38)();
  uint64_t v39;
  CFTypeRef (*v40)();
  CFStringRef v41;
  CFTypeRef (*v42)();
  uint64_t v43;
  CFTypeRef (*v44)();
  uint64_t v45;
  CFTypeRef (*v46)();
  uint64_t v47;
  CFTypeRef (*v48)();
  uint64_t v49;
  CFTypeRef (*v50)();
  uint64_t v51;
  CFTypeRef (*v52)();
  CFStringRef v53;
  CFTypeRef (*v54)();
  CFStringRef v55;
  CFTypeRef (*v56)();
  uint64_t v57;
  CFTypeRef (*v58)();
  uint64_t v59;
  CFTypeRef (*v60)();
  const __CFString *v61;
  CFTypeRef (*v62)();
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  keys = (void *)kColorSyncGenericGrayProfile;
  v8 = kColorSyncGenericGrayGamma22Profile;
  v9 = kColorSyncGenericRGBProfile;
  v10 = kColorSyncGenericCMYKProfile;
  v11 = kColorSyncDisplayP3Profile;
  v12 = (CFTypeRef (*)())kColorSyncDisplayP3_HLGProfile;
  v13 = (CFStringRef)kColorSyncDisplayP3_PQProfile;
  v14 = (CFTypeRef (*)())kColorSyncDisplayP3_709OETFProfile;
  v15 = kColorSyncSRGBProfile;
  v16 = kColorSyncAdobeRGB1998Profile;
  v17 = kColorSyncGenericLabProfile;
  v18 = kColorSyncGenericXYZProfile;
  v19 = kColorSyncACESCGLinearProfile;
  v20 = kColorSyncDCIP3Profile;
  v21 = kColorSyncITUR709Profile;
  v22 = (CFTypeRef (*)())kColorSyncITUR709_PQProfile;
  v23 = (CFStringRef)kColorSyncITUR709_HLGProfile;
  v24 = kColorSyncITUR2020Profile;
  v25 = (CFStringRef)kColorSyncITUR2020_sRGBGammaProfile;
  v26 = (CFTypeRef (*)())kColorSyncITUR2020_HLGProfile;
  v27 = (CFStringRef)kColorSyncITUR2020_PQProfile;
  v28 = (CFTypeRef (*)())kColorSyncITUR2100_HLGProfile;
  v29 = (CFStringRef)kColorSyncITUR2100_PQProfile;
  v30 = kColorSyncROMMRGBProfile;
  v31 = (CFStringRef)kColorSyncPerceptualStandardRGBProfile;
  v32 = (CFTypeRef (*)())kColorSyncCoreVideo709Profile;
  v33 = CFSTR("com.apple.ColorSync.CoreVideoLegacy709");
  v5[10] = xmmword_1E2162168;
  v5[11] = *(_OWORD *)&off_1E2162178;
  v5[12] = xmmword_1E2162188;
  v6 = create_CoreVideoLegacy709Profile;
  v5[6] = xmmword_1E2162128;
  v5[7] = *(_OWORD *)&off_1E2162138;
  v5[8] = xmmword_1E2162148;
  v5[9] = *(_OWORD *)&off_1E2162158;
  v5[2] = xmmword_1E21620E8;
  v5[3] = *(_OWORD *)&off_1E21620F8;
  v5[4] = xmmword_1E2162108;
  v5[5] = *(_OWORD *)&off_1E2162118;
  v5[0] = xmmword_1E21620C8;
  v5[1] = *(_OWORD *)&off_1E21620D8;
  ColorSyncProfileCreateWithName_name_to_function_map = (uint64_t)CFDictionaryCreate(0, (const void **)&keys, (const void **)v5, 27, MEMORY[0x1E0C9B390], 0);
  keys = (void *)kColorSyncGenericGrayProfile;
  v8 = (CFStringRef)create_GenericGrayProfile;
  v9 = kColorSyncGenericGrayGamma22Profile;
  v10 = (CFStringRef)create_GenericGrayGamma22Profile;
  v11 = kColorSyncGenericRGBProfile;
  v12 = create_GenericRGBProfile;
  v13 = kColorSyncGenericCMYKProfile;
  v14 = create_GenericCMYKProfile;
  v15 = kColorSyncDisplayP3Profile;
  v16 = (CFStringRef)create_DisplayP3Profile;
  v17 = (CFStringRef)kColorSyncDisplayP3_HLGProfile;
  v18 = (CFStringRef)create_DisplayP3_HLGProfile;
  v19 = (CFStringRef)kColorSyncDisplayP3_PQProfile;
  v20 = (CFStringRef)create_DisplayP3_PQProfile;
  v21 = (CFStringRef)kColorSyncDisplayP3_709OETFProfile;
  v22 = create_DisplayP3_709OETFProfile;
  v23 = kColorSyncSRGBProfile;
  v24 = (CFStringRef)create_sRGBProfile;
  v25 = kColorSyncAdobeRGB1998Profile;
  v26 = create_AdobeRGB1998Profile;
  v27 = kColorSyncGenericLabProfile;
  v28 = create_GenericLabProfile;
  v29 = kColorSyncGenericXYZProfile;
  v30 = (CFStringRef)create_GenericXYZProfile;
  v31 = kColorSyncACESCGLinearProfile;
  v32 = create_ACESCGLinearProfile;
  v33 = kColorSyncDCIP3Profile;
  v34 = create_DCIP3Profile;
  v35 = kColorSyncITUR709Profile;
  v36 = create_ITUR709Profile;
  v37 = kColorSyncITUR709_PQProfile;
  v38 = create_ITUR709_PQProfile;
  v39 = kColorSyncITUR709_HLGProfile;
  v40 = create_ITUR709_HLGProfile;
  v41 = kColorSyncITUR2020Profile;
  v42 = create_ITUR2020Profile;
  v43 = kColorSyncITUR2020_sRGBGammaProfile;
  v44 = create_ITUR2020sRGBGammaProfile;
  v45 = kColorSyncITUR2020_HLGProfile;
  v46 = create_ITUR2020_HLGProfile;
  v47 = kColorSyncITUR2020_PQProfile;
  v48 = create_ITUR2020_PQProfile;
  v49 = kColorSyncITUR2100_HLGProfile;
  v50 = create_ITUR2100_HLGProfile;
  v51 = kColorSyncITUR2100_PQProfile;
  v52 = create_ITUR2100_PQProfile;
  v53 = kColorSyncROMMRGBProfile;
  v54 = create_ROMMRGBProfile;
  v55 = kColorSyncWebSafeColorsProfile;
  v56 = create_WebSafeColorsProfile;
  v57 = kColorSyncPerceptualStandardRGBProfile;
  v58 = create_PerceptualStandardRGBProfile;
  v59 = kColorSyncCoreVideo709Profile;
  v60 = create_CoreVideo709Profile;
  v61 = CFSTR("com.apple.ColorSync.CoreVideoLegacy709");
  v62 = create_CoreVideoLegacy709Profile;
  v0 = (char *)malloc_type_malloc(0x1C0uLL, 0xE0040372BB24AuLL);
  v1 = (uint64_t)v0;
  if (v0)
  {
    ColorSyncProfileCreateWithName_name_creator_pair_count = 1;
    v2 = 28;
LABEL_7:
    v3 = 0;
    v4 = v2;
    do
    {
      *(_OWORD *)&v0[v3] = *(_OWORD *)((char *)&keys + v3);
      v3 += 16;
      --v4;
    }
    while (v4);
    qsort(v0, v2, 0x10uLL, (int (__cdecl *)(const void *, const void *))compare_names);
    goto LABEL_10;
  }
  if (ColorSyncProfileCreateWithName_name_creator_pair_count)
    v2 = 28;
  else
    v2 = 0;
  if (ColorSyncProfileCreateWithName_name_creator_pair_count)
    goto LABEL_7;
LABEL_10:
  ColorSyncProfileCreateWithName_name_creator_pair_array = v1;
}

@end
