@implementation FigCaptureSmartStyleSettingsGetSystemStyle

void __FigCaptureSmartStyleSettingsGetSystemStyle_block_invoke(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v2 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@systemstyle"), fsss_prefixedSystemStylePreferenceKeyForBundleID(*(__CFString **)(a1 + 32)));
  v3 = (void *)CFPreferencesCopyValue(v2, CFSTR("com.apple.cameracapture"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v3)
  {
    v13 = v3;
    v4 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CastType"));
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CastIntensity")), "floatValue");
    v6 = v5;
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ToneBias")), "floatValue");
    v8 = v7;
    objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ColorBias")), "floatValue");
    LODWORD(v10) = v9;
    LODWORD(v11) = v6;
    LODWORD(v12) = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = +[FigCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](FigCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v4, v11, v12, v10);
    v3 = v13;
  }

}

@end
