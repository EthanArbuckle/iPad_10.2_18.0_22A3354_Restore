ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes;
}

uint64_t sub_209558EA4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  return sub_2095686F8();
}

BOOL AXAnimatedImagesEnabled(void)
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
  v8 = get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr;
  if (!get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
    v6[3] = (uint64_t)v0;
    get_AXSReduceMotionAutoplayAnimatedImagesEnabledSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((unsigned int (*)(uint64_t))v0)(v2) != 0;
}

uint64_t libAccessibilityLibrary()
{
  uint64_t v0;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = libAccessibilityLibraryCore_frameworkLibrary;
  v6 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C1B8538;
    v8 = 0;
    v0 = _sl_dlopen();
    v4[3] = v0;
    libAccessibilityLibraryCore_frameworkLibrary = v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_209559064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_209559084()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DED8 = result;
  return result;
}

uint64_t sub_2095590B8()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DED0 = result;
  return result;
}

uint64_t sub_2095590EC()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEC8 = result;
  return result;
}

uint64_t sub_209559120()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEC0 = result;
  return result;
}

uint64_t sub_209559154()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEB8 = result;
  return result;
}

uint64_t sub_209559188()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEB0 = result;
  return result;
}

uint64_t sub_2095591BC()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEA8 = result;
  return result;
}

uint64_t sub_2095591F0()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DEA0 = result;
  return result;
}

uint64_t sub_209559224()
{
  uint64_t result;

  result = sub_2095686EC();
  qword_253D1DE98 = result;
  return result;
}

unint64_t sub_209559258()
{
  unint64_t result;

  result = qword_253D1D330;
  if (!qword_253D1D330)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes, &type metadata for AttributeScopes.AccessibilityAttributes);
    atomic_store(result, (unint64_t *)&qword_253D1D330);
  }
  return result;
}

unint64_t sub_20955929C()
{
  unint64_t result;

  result = qword_253D1D328;
  if (!qword_253D1D328)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes, &type metadata for AttributeScopes.AccessibilityAttributes);
    atomic_store(result, (unint64_t *)&qword_253D1D328);
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.SpellOutAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.SpellOutAttribute;
}

unint64_t sub_2095592F8()
{
  unint64_t result;

  result = qword_253D1D3B8;
  if (!qword_253D1D3B8)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.SpellOutAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.SpellOutAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D3B8);
  }
  return result;
}

unint64_t sub_20955933C()
{
  return 0xD000000000000026;
}

uint64_t sub_20955935C(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D348);
}

uint64_t sub_209559384()
{
  return MEMORY[0x24BEE1338];
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute;
}

unint64_t sub_2095593A0()
{
  unint64_t result;

  result = qword_253D1D3B0;
  if (!qword_253D1D3B0)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D3B0);
  }
  return result;
}

unint64_t sub_2095593E4()
{
  return 0xD000000000000027;
}

uint64_t sub_209559404(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, qword_253D1D3C0);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute;
}

unint64_t sub_209559430()
{
  unint64_t result;

  result = qword_253D1D3A8;
  if (!qword_253D1D3A8)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D3A8);
  }
  return result;
}

unint64_t sub_209559474()
{
  return 0xD000000000000026;
}

uint64_t sub_209559494(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D368);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute;
}

unint64_t sub_2095594C0()
{
  unint64_t result;

  result = qword_253D1D3A0;
  if (!qword_253D1D3A0)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D3A0);
  }
  return result;
}

unint64_t sub_209559504()
{
  return 0xD000000000000026;
}

uint64_t sub_209559524(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D370);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute;
}

unint64_t sub_209559550()
{
  unint64_t result;

  result = qword_253D1D398;
  if (!qword_253D1D398)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D398);
  }
  return result;
}

unint64_t sub_209559594()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_2095595B4(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D350);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute;
}

unint64_t sub_2095595E0()
{
  unint64_t result;

  result = qword_253D1D390;
  if (!qword_253D1D390)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D390);
  }
  return result;
}

unint64_t sub_209559624()
{
  return 0xD000000000000020;
}

uint64_t sub_209559644(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D340);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute;
}

unint64_t sub_209559670()
{
  unint64_t result;

  result = qword_253D1D388;
  if (!qword_253D1D388)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D388);
  }
  return result;
}

unint64_t sub_2095596B4()
{
  return 0xD000000000000019;
}

uint64_t sub_2095596D4(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D320);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.IPANotationAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.IPANotationAttribute;
}

unint64_t sub_209559700()
{
  unint64_t result;

  result = qword_253D1D380;
  if (!qword_253D1D380)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.IPANotationAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.IPANotationAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D380);
  }
  return result;
}

unint64_t sub_209559744()
{
  return 0xD000000000000023;
}

uint64_t sub_209559764(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, qword_253D1D358);
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextCustomAttribute()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextCustomAttribute;
}

unint64_t sub_209559790()
{
  unint64_t result;

  result = qword_253D1D378;
  if (!qword_253D1D378)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextCustomAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.TextCustomAttribute);
    atomic_store(result, (unint64_t *)&qword_253D1D378);
  }
  return result;
}

unint64_t sub_2095597D4()
{
  return 0xD000000000000017;
}

uint64_t sub_2095597F4(uint64_t a1, uint64_t a2)
{
  return sub_209558EA4(a1, a2, &qword_253D1D338);
}

BOOL AXPrefersHorizontalTextLayout(void)
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr;
  v8 = get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr;
  if (!get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSPrefersHorizontalTextLayout");
    v6[3] = (uint64_t)v0;
    get_AXSPrefersHorizontalTextLayoutSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((unsigned int (*)(uint64_t))v0)(v2) != 0;
}

BOOL AXPrefersNonBlinkingTextInsertionIndicator()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  v8 = get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  if (!get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSPrefersNonBlinkingCursorIndicator");
    v6[3] = (uint64_t)v0;
    get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((unsigned int (*)(uint64_t))v0)(v2) != 0;
}

BOOL AXAssistiveAccessEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = get_AXSClarityBoardEnabledSymbolLoc_ptr;
  v8 = get_AXSClarityBoardEnabledSymbolLoc_ptr;
  if (!get_AXSClarityBoardEnabledSymbolLoc_ptr)
  {
    v1 = (void *)libAccessibilityLibrary();
    v0 = dlsym(v1, "_AXSClarityBoardEnabled");
    v6[3] = (uint64_t)v0;
    get_AXSClarityBoardEnabledSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((unsigned int (*)(uint64_t))v0)(v2) != 0;
}

void AXOpenSettingsFeature(uint64_t a1, void *a2)
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1 != 1)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD0FC8];
    AXLocalizedString(CFSTR("ERROR_OPEN_SETTINGS_UNSUPPPORTED_TYPE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (!v3)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v8 = (void *)getAXUIClientClass_softClass;
  v23 = getAXUIClientClass_softClass;
  if (!getAXUIClientClass_softClass)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __getAXUIClientClass_block_invoke;
    v19[3] = &unk_24C1B8518;
    v19[4] = &v20;
    __getAXUIClientClass_block_invoke((uint64_t)v19);
    v8 = (void *)v21[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v20, 8);
  v10 = [v9 alloc];
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("OpenPrefClient-%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithIdentifier:serviceBundleName:", v14, CFSTR("AXAssetAndDataServer"));

  v24 = CFSTR("feature");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFE478], "mainAccessQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", v17, 14, v18, 0);

  v7 = 0;
  if (v3)
LABEL_8:
    v3[2](v3, v7);
LABEL_9:

}

void sub_209559C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXUIClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccessibilityUILibraryCore_frameworkLibrary)
  {
    AccessibilityUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccessibilityUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXUIClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getAXUIClientClass_block_invoke_cold_1();
    free(v3);
  }
  getAXUIClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXRequestingClientSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AXRuntimeLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
  }
  else
  {
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
    if (!AXRuntimeLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXRequestingClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXRequestingClientSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  const CGFloat *Components;
  CGFloat Alpha;
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef v5;
  double v6;
  double v7;
  int v8;
  double v9;
  double v10;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __CFString *v56;
  void *v57;
  void *v59;
  void *v60;
  _BOOL4 v61;
  _BOOL4 v62;
  __CFString *v63;
  __CFString *v64;
  NSObject *v65;
  void *v66;
  _QWORD v67[4];
  _QWORD v68[3];
  _QWORD v69[3];
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  Components = CGColorGetComponents(color);
  Alpha = CGColorGetAlpha(color);
  ColorSpace = CGColorGetColorSpace(color);
  if (Components)
  {
    v5 = ColorSpace;
    v70 = 0u;
    v71 = 0u;
    if (_AXSRGBColorSpace_onceToken != -1)
      dispatch_once(&_AXSRGBColorSpace_onceToken, &__block_literal_global);
    if ((CGColorSpaceRef)_AXSRGBColorSpace_RGBColorSpace == v5)
      goto LABEL_12;
    if (_AXExtendedSRGBColorSpace_onceToken != -1)
      dispatch_once(&_AXExtendedSRGBColorSpace_onceToken, &__block_literal_global_25);
    if ((CGColorSpaceRef)_AXExtendedSRGBColorSpace_ExtendedSRGBColorSpace == v5)
      goto LABEL_12;
    if (AXRGBColorTransform_onceToken != -1)
      dispatch_once(&AXRGBColorTransform_onceToken, &__block_literal_global_26);
    if (CGColorTransformConvertColorComponents())
    {
      *((CGFloat *)&v71 + 1) = Alpha;
      Components = (const CGFloat *)&v70;
LABEL_12:
      v6 = *Components;
      v7 = Components[1];
      v8 = 1;
      v10 = Components[2];
      v9 = Components[3];
      goto LABEL_14;
    }
  }
  v8 = 0;
  v6 = -1.0;
  v7 = -1.0;
  v10 = -1.0;
  v9 = -1.0;
LABEL_14:
  if (v6 < v7 || v6 < v10)
  {
    if (v7 < v6 || v7 < v10)
    {
      if (v7 >= v6)
        v13 = v6;
      else
        v13 = v7;
      v14 = v10;
    }
    else
    {
      if (v6 >= v10)
        v13 = v10;
      else
        v13 = v6;
      v14 = v7;
    }
  }
  else
  {
    if (v7 >= v10)
      v13 = v10;
    else
      v13 = v7;
    v14 = v6;
  }
  v15 = 0.0;
  v16 = 0.0;
  if (v14 > 0.0)
  {
    v15 = (v14 - v13) / v14;
    v17 = (v14 - v6) / (v14 - v13);
    v18 = (v14 - v7) / (v14 - v13);
    v19 = (v14 - v10) / (v14 - v13);
    v20 = 5.0 - v17;
    if (v13 == v6)
      v20 = v18 + 3.0;
    v21 = v17 + 1.0;
    if (v13 != v10)
      v21 = 3.0 - v19;
    if (v14 != v7)
      v21 = v20;
    v22 = v13 == v7;
    v23 = 1.0 - v18;
    v24 = v19 + 5.0;
    if (v22)
      v23 = v24;
    if (v14 != v6)
      v23 = v21;
    if (v15 == 0.0)
      v16 = 0.0;
    else
      v16 = v23;
  }
  v68[0] = CFSTR("red");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v25;
  v68[1] = CFSTR("green");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v26;
  v68[2] = CFSTR("blue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "mutableCopy");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)fmod(v16 / 6.0, 1.0), CFSTR("hue"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v70 = v30;
    v67[1] = CFSTR("saturation");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v70 + 1) = v31;
    v67[2] = CFSTR("brightness");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v71 = v32;
    v67[3] = CFSTR("alpha");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v71 + 1) = v33;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, v67, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setValuesForKeysWithDictionary:", v34);

  }
  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("hue"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("hue"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "doubleValue");
  v38 = v37;

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("saturation"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "doubleValue");
  v41 = v40;

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("alpha"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "doubleValue");
  v44 = v43;

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("red"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  v47 = v46;

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("green"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "doubleValue");
  v50 = v49;

  objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("blue"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  v53 = v52;

  v54 = fmax(v44 * (v50 * 0.715200007 + v47 * 0.212599993 + v53 * 0.0722000003), 0.0);
  if (v54 <= 1.0)
    v55 = v54;
  else
    v55 = 1.0;
  if (v35)
  {
    if (v44 == 0.0)
    {
      v56 = CFSTR("transparent");
LABEL_64:
      AXLocalizedString(v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    }
    if (v55 > 0.99000001)
    {
      v56 = CFSTR("white");
      goto LABEL_64;
    }
    if (v55 < 0.00999999978)
    {
      v56 = CFSTR("black");
      goto LABEL_64;
    }
    if (v41 < 0.0500000007)
    {
      AXColorGetLightnessDescription(v55);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      AXLocalizedString(CFSTR("gray"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      AXColorDescriptionFromAttributeDescriptions(v59, 0, v60);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_120:

      goto LABEL_65;
    }
    v61 = v38 > 0.0560000017;
    if (v38 >= 0.111000001)
      v61 = 0;
    v62 = v55 < 0.540000021 && v61;
    AXColorGetLightnessDescription(v55);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41 >= 0.200000003)
    {
      v60 = 0;
      if (v41 <= 0.899999976 || v55 <= 0.699999988)
      {
LABEL_79:
        if (v62)
        {
          v64 = CFSTR("brown");
        }
        else
        {
          if (v38 < 0.0 || v38 > 1.0)
          {
            AXLogCommon();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              AXNameFromColor_cold_1(v65, v38);

            v66 = 0;
            goto LABEL_119;
          }
          if (v38 >= 0.0280000009)
          {
            if (v38 < 0.0560000017)
            {
              v64 = CFSTR("red orange");
              goto LABEL_118;
            }
            if (v38 < 0.111000001)
            {
              v64 = CFSTR("orange");
              goto LABEL_118;
            }
            if (v38 < 0.128999993)
            {
              v64 = CFSTR("orange yellow");
              goto LABEL_118;
            }
            if (v38 < 0.166999996)
            {
              v64 = CFSTR("yellow");
              goto LABEL_118;
            }
            if (v38 < 0.222000003)
            {
              v64 = CFSTR("yellow green");
              goto LABEL_118;
            }
            if (v38 < 0.388999999)
            {
              v64 = CFSTR("green");
              goto LABEL_118;
            }
            if (v38 < 0.469000012)
            {
              v64 = CFSTR("blue green");
              goto LABEL_118;
            }
            if (v38 < 0.540000021)
            {
              v64 = CFSTR("cyan");
              goto LABEL_118;
            }
            if (v38 < 0.611000001)
            {
              v64 = CFSTR("cyan blue");
              goto LABEL_118;
            }
            if (v38 < 0.666999996)
            {
              v64 = CFSTR("blue");
              goto LABEL_118;
            }
            if (v38 < 0.800000012)
            {
              v64 = CFSTR("blue magenta");
              goto LABEL_118;
            }
            if (v38 < 0.888999999)
            {
              v64 = CFSTR("magenta");
              goto LABEL_118;
            }
            if (v38 < 0.916999996)
            {
              v64 = CFSTR("magenta pink");
              goto LABEL_118;
            }
            if (v38 < 0.958000004)
            {
              v64 = CFSTR("pink");
              goto LABEL_118;
            }
            if (v38 < 0.986000001)
            {
              v64 = CFSTR("pink red");
              goto LABEL_118;
            }
          }
          v64 = CFSTR("red");
        }
LABEL_118:
        AXLocalizedString(v64);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_119:
        AXColorDescriptionFromAttributeDescriptions(v59, v60, v66);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_120;
      }
      v63 = CFSTR("vibrant");
    }
    else
    {
      v63 = CFSTR("grayish");
    }
    AXLocalizedString(v63);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_79;
  }
  v57 = 0;
LABEL_65:

  return (NSString *)v57;
}

id AXColorDescriptionFromAttributeDescriptions(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  id v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_msgSend(v5, "length");
  v9 = objc_msgSend(v6, "length");
  if (v8)
  {
    if (v9)
    {
      AXLocalizedString(CFSTR("color.attributes.format.all"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD17C8];
      v14 = v6;
      v15 = v7;
    }
    else
    {
      AXLocalizedString(CFSTR("color.attributes.format.lightness.hue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD17C8];
      v14 = v7;
    }
    objc_msgSend(v11, "localizedStringWithFormat:", v10, v5, v14, v15);
  }
  else
  {
    if (!v9)
    {
      v12 = v7;
      goto LABEL_9;
    }
    AXLocalizedString(CFSTR("color.attributes.format.saturation.hue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v10, v6, v7, v15);
  }
  v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v12;
}

id AXColorGetLightnessDescription(double a1)
{
  __CFString *v1;
  void *v2;

  if (a1 >= 0.349999994)
  {
    if (a1 <= 0.850000024)
    {
      v2 = 0;
      return v2;
    }
    v1 = CFSTR("light");
  }
  else
  {
    v1 = CFSTR("dark");
  }
  AXLocalizedString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

id getCIImageClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCIImageClass_softClass;
  v7 = getCIImageClass_softClass;
  if (!getCIImageClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCIImageClass_block_invoke;
    v3[3] = &unk_24C1B8518;
    v3[4] = &v4;
    __getCIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20955AFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreImageLibraryCore_frameworkLibrary)
  {
    CoreImageLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreImageLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CIImage");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCIImageClass_block_invoke_cold_1();
    free(v3);
  }
  getCIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void _AXPostPlatformNotification(uint64_t a1, void *a2)
{
  id v3;
  void (*v4)(uint64_t, id);
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = (void (*)(uint64_t, id))getUIAccessibilityPostNotificationSymbolLoc_ptr;
  v10 = getUIAccessibilityPostNotificationSymbolLoc_ptr;
  if (!getUIAccessibilityPostNotificationSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __getUIAccessibilityPostNotificationSymbolLoc_block_invoke;
    v6[3] = &unk_24C1B8518;
    v6[4] = &v7;
    __getUIAccessibilityPostNotificationSymbolLoc_block_invoke((uint64_t)v6);
    v4 = (void (*)(uint64_t, id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
    v5 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v4(a1, v3);

}

void *__getUIAccessibilityPostNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (UIKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)UIKitLibraryCore_frameworkLibrary;
  }
  else
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)UIKitLibraryCore_frameworkLibrary;
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "UIAccessibilityPostNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilityPostNotificationSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id AXTextPreferredFontForTextStyle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  if (!_contentSizeCategoryOverrideForPreviews)
    _PreferredContentSizeCategory();
  v2 = (void *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getNSFontClass_softClass;
  v11 = getNSFontClass_softClass;
  if (!getNSFontClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getNSFontClass_block_invoke;
    v7[3] = &unk_24C1B8518;
    v7[4] = &v8;
    __getNSFontClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  objc_msgSend(v4, "fontWithDescriptor:size:", v2, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_20955C1C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _contentSizeCategoryToUse()
{
  uint64_t result;

  result = _contentSizeCategoryOverrideForPreviews;
  if (!_contentSizeCategoryOverrideForPreviews)
    return _PreferredContentSizeCategory();
  return result;
}

double AXTextPreferredUserFontSizeForSize(double a1)
{
  const __CTFontDescriptor *v2;
  void *v3;
  double v4;
  double v5;

  if (!_contentSizeCategoryOverrideForPreviews)
    _PreferredContentSizeCategory();
  v2 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  v3 = (void *)CTFontDescriptorCopyAttribute(v2, (CFStringRef)*MEMORY[0x24BDC4DA8]);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  CFRelease(v2);
  if (a1 > 0.0)
    return fmin(fmax(round(v5 * a1 / 13.0), 8.0), 120.0);
  return v5;
}

uint64_t AXTextGetAppUsesCustomContentSize()
{
  if (!_observingNotification)
  {
    _RefreshContentSizePreferences();
    _BeginObservingPreferredContentSizeChangedNotification();
  }
  return _cachedUsesCustomContentSize;
}

void _RefreshContentSizePreferences()
{
  const __CFString *v0;
  void *v1;
  int v2;
  id v3;

  v0 = (const __CFString *)_AXSCopyPreferredContentSizeCategoryName();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("UIContentSizeIsCustom"));

  if (_cachedPreferredContentSizeCategory
    && CFStringCompare(v0, (CFStringRef)_cachedPreferredContentSizeCategory, 0) == kCFCompareEqualTo)
  {
    if (_cachedUsesCustomContentSize == v2)
      return;
  }
  else
  {
    _cachedPreferredContentSizeCategory = (uint64_t)v0;
    if (_cachedUsesCustomContentSize == v2)
      goto LABEL_7;
  }
  _cachedUsesCustomContentSize = v2;
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("UIContentSizeCategoryDidChangeNotification"), 0);

}

void _BeginObservingPreferredContentSizeChangedNotification()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (!_observingNotification)
  {
    _observingNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_PreferredContentSizeChangedCallback, (CFStringRef)*MEMORY[0x24BED26D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

void AXTextSetAppUsesCustomContentSize(int a1)
{
  void *v2;
  void *v3;
  __CFNotificationCenter *DistributedCenter;

  if (!_observingNotification)
    _BeginObservingPreferredContentSizeChangedNotification();
  if (_cachedUsesCustomContentSize != a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (a1)
      objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("UIContentSizeIsCustom"));
    else
      objc_msgSend(v2, "removeObjectForKey:", CFSTR("UIContentSizeIsCustom"));

    _cachedUsesCustomContentSize = a1;
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, (CFNotificationName)*MEMORY[0x24BED26D0], 0, 0, 1u);
  }
}

uint64_t AXTextSetContentSizeCategoryOverrideForPreviews(uint64_t result)
{
  _contentSizeCategoryOverrideForPreviews = result;
  return result;
}

uint64_t _PreferredContentSizeCategory()
{
  if (!_observingNotification)
  {
    _RefreshContentSizePreferences();
    _BeginObservingPreferredContentSizeChangedNotification();
  }
  return _cachedPreferredContentSizeCategory;
}

Class __getNSFontClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppKitLibraryCore_frameworkLibrary)
  {
    AppKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NSFont");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getNSFontClass_block_invoke_cold_1();
    free(v3);
  }
  getNSFontClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getkAXMChartAxisTitleKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartAxisTitleKeySymbolLoc_ptr;
  v7 = getkAXMChartAxisTitleKeySymbolLoc_ptr;
  if (!getkAXMChartAxisTitleKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartAxisTitleKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartAxisTitleKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartNumericAxisScaleTypeKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr;
  v7 = getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartNumericAxisScaleTypeKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartNumericAxisScaleTypeKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartNumericAxisLowerBoundKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr;
  v7 = getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartNumericAxisLowerBoundKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartNumericAxisLowerBoundKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartNumericAxisUpperBoundKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr;
  v7 = getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartNumericAxisUpperBoundKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartNumericAxisUpperBoundKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartNumericAxisGridlinePositionsKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr;
  v7 = getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr;
  if (!getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartNumericAxisGridlinePositionsKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartNumericAxisGridlinePositionsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartAxisTypeNumeric()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartAxisTypeNumericSymbolLoc_ptr;
  v7 = getkAXMChartAxisTypeNumericSymbolLoc_ptr;
  if (!getkAXMChartAxisTypeNumericSymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartAxisTypeNumeric");
    v5[3] = (uint64_t)v0;
    getkAXMChartAxisTypeNumericSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartAxisTypeKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartAxisTypeKeySymbolLoc_ptr;
  v7 = getkAXMChartAxisTypeKeySymbolLoc_ptr;
  if (!getkAXMChartAxisTypeKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartAxisTypeKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartAxisTypeKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartCategoryAxisCategoriesKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr;
  v7 = getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr;
  if (!getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartCategoryAxisCategoriesKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartCategoryAxisCategoriesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartAxisTypeCategorical()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartAxisTypeCategoricalSymbolLoc_ptr;
  v7 = getkAXMChartAxisTypeCategoricalSymbolLoc_ptr;
  if (!getkAXMChartAxisTypeCategoricalSymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartAxisTypeCategorical");
    v5[3] = (uint64_t)v0;
    getkAXMChartAxisTypeCategoricalSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesNameKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesNameKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesNameKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesNameKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesNameKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesNameKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesContinuousKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesContinuousKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesContinuousKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesContinuousKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesContinuousKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesContinuousKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesXDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesXDataKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesXDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesXDataKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesXDataKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesXDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesYDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesYDataKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesYDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesYDataKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesYDataKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesYDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesZNumericDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesZNumericDataKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesZNumericDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesZCategoricalDataKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesZCategoricalDataKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesZCategoricalDataKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesValueDescriptionsKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesValueDescriptionsKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesValueDescriptionsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id AXAudioGraphLog()
{
  if (AXAudioGraphLog_onceToken != -1)
    dispatch_once(&AXAudioGraphLog_onceToken, &__block_literal_global_423);
  return (id)AXAudioGraphLog_Log;
}

id getkAXMChartSeriesMeanValueDescriptionKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesMeanValueDescriptionKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesMeanValueDescriptionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

void sub_2095601E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

id getkAXMChartTitleKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartTitleKeySymbolLoc_ptr;
  v7 = getkAXMChartTitleKeySymbolLoc_ptr;
  if (!getkAXMChartTitleKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartTitleKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartTitleKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSummaryKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSummaryKeySymbolLoc_ptr;
  v7 = getkAXMChartSummaryKeySymbolLoc_ptr;
  if (!getkAXMChartSummaryKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSummaryKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSummaryKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartContentDirectionKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartContentDirectionKeySymbolLoc_ptr;
  v7 = getkAXMChartContentDirectionKeySymbolLoc_ptr;
  if (!getkAXMChartContentDirectionKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartContentDirectionKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartContentDirectionKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartXAxisKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartXAxisKeySymbolLoc_ptr;
  v7 = getkAXMChartXAxisKeySymbolLoc_ptr;
  if (!getkAXMChartXAxisKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartXAxisKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartXAxisKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartYAxisKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartYAxisKeySymbolLoc_ptr;
  v7 = getkAXMChartYAxisKeySymbolLoc_ptr;
  if (!getkAXMChartYAxisKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartYAxisKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartYAxisKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartAdditionalAxesKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartAdditionalAxesKeySymbolLoc_ptr;
  v7 = getkAXMChartAdditionalAxesKeySymbolLoc_ptr;
  if (!getkAXMChartAdditionalAxesKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartAdditionalAxesKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartAdditionalAxesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getkAXMChartSeriesKey()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getkAXMChartSeriesKeySymbolLoc_ptr;
  v7 = getkAXMChartSeriesKeySymbolLoc_ptr;
  if (!getkAXMChartSeriesKeySymbolLoc_ptr)
  {
    v1 = (void *)AXMediaUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "kAXMChartSeriesKey");
    v5[3] = (uint64_t)v0;
    getkAXMChartSeriesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

id getAXMDataSonificationManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAXMDataSonificationManagerClass_softClass;
  v7 = getAXMDataSonificationManagerClass_softClass;
  if (!getAXMDataSonificationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXMDataSonificationManagerClass_block_invoke;
    v3[3] = &unk_24C1B8518;
    v3[4] = &v4;
    __getAXMDataSonificationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2095617B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXMediaUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
    AXMediaUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AXMediaUtilitiesLibraryCore_frameworkLibrary;
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAXMDataSonificationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AXMediaUtilitiesLibrary();
  result = objc_getClass("AXMDataSonificationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXMDataSonificationManagerClass_block_invoke_cold_1();
  getAXMDataSonificationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void AXApplicationFocusDidChange(void *a1)
{
  id v1;
  id v2;
  void (*v3)(uint64_t, id);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v3 = (void (*)(uint64_t, id))getUIAccessibilityPostNotificationSymbolLoc_ptr_0;
    v9 = getUIAccessibilityPostNotificationSymbolLoc_ptr_0;
    if (!getUIAccessibilityPostNotificationSymbolLoc_ptr_0)
    {
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0;
      v5[3] = &unk_24C1B8518;
      v5[4] = &v6;
      __getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0((uint64_t)v5);
      v3 = (void (*)(uint64_t, id))v7[3];
    }
    _Block_object_dispose(&v6, 8);
    if (!v3)
    {
      v4 = (_Unwind_Exception *)AXAnimatedImagesEnabled_cold_1();
      _Block_object_dispose(&v6, 8);
      _Unwind_Resume(v4);
    }
    v3(1053, v2);

  }
}

void *__getUIAccessibilityPostNotificationSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (UIKitLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)UIKitLibraryCore_frameworkLibrary_0;
  }
  else
  {
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)UIKitLibraryCore_frameworkLibrary_0;
    if (!UIKitLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "UIAccessibilityPostNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getUIAccessibilityPostNotificationSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL AXSupportsBidirectionalAXMFiHearingDeviceStreaming(void)
{
  if (AXSupportsBidirectionalAXMFiHearingDeviceStreaming_onceToken[0] != -1)
    dispatch_once(AXSupportsBidirectionalAXMFiHearingDeviceStreaming_onceToken, &__block_literal_global_1);
  return AXSupportsBidirectionalAXMFiHearingDeviceStreaming_SupportsLEA2;
}

NSArray *AXMFiHearingDevicePairedUUIDs(void)
{
  void *v0;
  id v1;
  __SecTask *v2;
  uint64_t v3;
  __SecTask *v4;
  CFTypeRef v5;
  void *v6;
  CFTypeID v7;
  id v8;
  void *v9;
  id v10;
  CFTypeID v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  _AXSHearingDevicePairedUUIDs();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = SecTaskCreateFromSelf(0);
  v3 = MEMORY[0x24BDAC760];
  if (v2)
  {
    v4 = v2;
    v5 = SecTaskCopyValueForEntitlement(v2, CFSTR("com.apple.developer.hearing-aid-app"), 0);
    if (!v5)
    {
LABEL_13:
      CFRelease(v4);
      goto LABEL_14;
    }
    v6 = (void *)v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFStringGetTypeID())
    {
      v8 = v6;
      if (objc_msgSend(v8, "length"))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.hearing.internal")))
        {
          objc_msgSend(v0, "allValues");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v3;
          v19[1] = 3221225472;
          v19[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke;
          v19[3] = &unk_24C1B8878;
          v10 = v1;
          v20 = v10;
          objc_msgSend(v9, "enumerateObjectsUsingBlock:", v19);

          v1 = v20;
        }
        else
        {
          objc_msgSend(v0, "valueForKey:", v8);
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }

        v1 = v10;
      }
    }
    else
    {
      v11 = CFGetTypeID(v6);
      if (v11 != CFArrayGetTypeID())
      {
LABEL_12:
        CFRelease(v6);
        goto LABEL_13;
      }
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke_2;
      v16[3] = &unk_24C1B88A0;
      v17 = v0;
      v1 = v1;
      v18 = v1;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);

      v8 = v17;
    }

    goto LABEL_12;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __AXMFiHearingDevicePairedUUIDs_block_invoke_3;
  v14[3] = &unk_24C1B88C8;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v12;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v14);

  return (NSArray *)v12;
}

id AXLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD1488];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_24C1B9220, CFSTR("Accessibility"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id AXBrailleMap.subscript.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_heightAtPoint_);
}

id sub_209562520@<X0>(id *a1@<X0>, double *a2@<X1>, _DWORD *a3@<X8>)
{
  id result;
  int v5;

  result = objc_msgSend(*a1, sel_heightAtPoint_, *a2, a2[1]);
  *a3 = v5;
  return result;
}

id sub_209562554(_DWORD *a1, id *a2, double *a3, double a4)
{
  LODWORD(a4) = *a1;
  return objc_msgSend(*a2, sel_setHeight_atPoint_, a4, *a3, a3[1]);
}

id AXBrailleMap.subscript.setter()
{
  void *v0;

  return objc_msgSend(v0, sel_setHeight_atPoint_);
}

id (*AXBrailleMap.subscript.modify(uint64_t a1, double a2, double a3))(uint64_t a1, double a2)
{
  void *v3;
  int v5;

  *(_QWORD *)(a1 + 16) = v3;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  objc_msgSend(v3, sel_heightAtPoint_);
  *(_DWORD *)(a1 + 24) = v5;
  return sub_2095625C0;
}

id sub_2095625C0(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 24);
  return objc_msgSend(*(id *)(a1 + 16), sel_setHeight_atPoint_, a2, *(double *)a1, *(double *)(a1 + 8));
}

uint64_t sub_2095625DC()
{
  return 0;
}

id AXNumericDataAxisDescriptor.range.getter()
{
  void *v0;
  double v1;
  double v2;
  id result;
  double v4;

  objc_msgSend(v0, sel_lowerBound);
  v2 = v1;
  result = objc_msgSend(v0, sel_upperBound);
  if (v2 > v4)
    __break(1u);
  return result;
}

id AXNumericDataAxisDescriptor.range.setter(double a1, double a2)
{
  void *v2;

  objc_msgSend(v2, sel_setLowerBound_);
  return objc_msgSend(v2, sel_setUpperBound_, a2);
}

id (*AXNumericDataAxisDescriptor.range.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  double v3;
  double v4;
  id (*result)(uint64_t);
  double v6;

  *(_QWORD *)(a1 + 16) = v1;
  objc_msgSend(v1, sel_lowerBound);
  v4 = v3;
  result = (id (*)(uint64_t))objc_msgSend(v1, sel_upperBound);
  if (v4 > v6)
  {
    __break(1u);
  }
  else
  {
    *(double *)a1 = v4;
    *(double *)(a1 + 8) = v6;
    return sub_2095626E0;
  }
  return result;
}

id sub_2095626E0(uint64_t a1)
{
  void *v1;
  double v2;

  v1 = *(void **)(a1 + 16);
  v2 = *(double *)(a1 + 8);
  objc_msgSend(v1, sel_setLowerBound_, *(double *)a1);
  return objc_msgSend(v1, sel_setUpperBound_, v2);
}

char *AXNumericDataAxisDescriptor.gridlinePositions.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_gridlinePositions);
  sub_209563CB8(0, &qword_253D1D2F0);
  v2 = sub_2095687AC();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_209568854();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_209563C34(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x20BD0F208](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      objc_msgSend(v7, sel_doubleValue);
      v10 = v9;

      v12 = *(_QWORD *)(v13 + 16);
      v11 = *(_QWORD *)(v13 + 24);
      if (v12 >= v11 >> 1)
        sub_209563C34((char *)(v11 > 1), v12 + 1, 1);
      ++v5;
      *(_QWORD *)(v13 + 16) = v12 + 1;
      *(_QWORD *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

void AXNumericDataAxisDescriptor.gridlinePositions.setter(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_209568830();
    v4 = 0;
    do
    {
      v5 = v4 + 1;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)(a1 + 8 * v4 + 32));
      sub_209568818();
      sub_20956883C();
      sub_209568848();
      sub_209568824();
      v4 = v5;
    }
    while (v3 != v5);
  }
  swift_bridgeObjectRelease();
  sub_209563CB8(0, &qword_253D1D2F0);
  v6 = (id)sub_2095687A0();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setGridlinePositions_, v6);

}

void (*AXNumericDataAxisDescriptor.gridlinePositions.modify(char **a1))(uint64_t *a1, char a2)
{
  char *v1;

  a1[1] = v1;
  *a1 = AXNumericDataAxisDescriptor.gridlinePositions.getter();
  return sub_209562A48;
}

void sub_209562A48(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    AXNumericDataAxisDescriptor.gridlinePositions.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    AXNumericDataAxisDescriptor.gridlinePositions.setter(*a1);
  }
}

id AXNumericDataAxisDescriptor.init(title:range:gridlinePositions:valueDescriptionProvider:)(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD aBlock[6];

  v12 = (void *)sub_2095686EC();
  swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(a5 + 16);
  if (v13)
  {
    v21 = v12;
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_209568830();
    v14 = 0;
    do
    {
      v15 = v14 + 1;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)(a5 + 8 * v14 + 32));
      sub_209568818();
      sub_20956883C();
      sub_209568848();
      sub_209568824();
      v14 = v15;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    v12 = v21;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_209563CB8(0, &qword_253D1D2F0);
  v17 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  aBlock[4] = a6;
  aBlock[5] = a7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_209562C94;
  aBlock[3] = &block_descriptor;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v19 = objc_msgSend(v16, sel_initWithTitle_lowerBound_upperBound_gridlinePositions_valueDescriptionProvider_, v12, v17, v18, a1, a2);
  swift_release();
  _Block_release(v18);

  return v19;
}

id sub_209562C94(uint64_t a1, double a2)
{
  void (*v3)(uint64_t, double);
  uint64_t v4;
  void *v5;

  v3 = *(void (**)(uint64_t, double))(a1 + 32);
  v4 = swift_retain();
  v3(v4, a2);
  swift_release();
  v5 = (void *)sub_2095686EC();
  swift_bridgeObjectRelease();
  return v5;
}

id AXNumericDataAxisDescriptor.init(attributedTitle:range:gridlinePositions:valueDescriptionProvider:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD aBlock[6];

  v7 = a3;
  v11 = a1;
  v12 = *(_QWORD *)(a2 + 16);
  if (v12)
  {
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_209568830();
    v13 = 0;
    do
    {
      v14 = v13 + 1;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)(a2 + 8 * v13 + 32));
      sub_209568818();
      sub_20956883C();
      sub_209568848();
      sub_209568824();
      v13 = v14;
    }
    while (v12 != v14);
    swift_bridgeObjectRelease();
    v7 = a3;
    v11 = a1;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_209563CB8(0, &qword_253D1D2F0);
  v16 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  aBlock[4] = v7;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_209562C94;
  aBlock[3] = &block_descriptor_3;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v18 = objc_msgSend(v15, sel_initWithAttributedTitle_lowerBound_upperBound_gridlinePositions_valueDescriptionProvider_, v11, v16, v17, a5, a6);

  swift_release();
  _Block_release(v17);

  return v18;
}

void __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(AXDataPoint *__return_ptr retstr, Swift::Double x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t countAndFlagsBits;
  char rawValue;
  double v9;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v6 = v5;
  countAndFlagsBits = label.value._countAndFlagsBits;
  rawValue = (char)additionalValues._rawValue;
  v9 = *(double *)&y.is_nil;
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_valueWithNumber_, x);
  if ((rawValue & 1) == 0)
  {
    v13 = objc_msgSend(v11, sel_valueWithNumber_, v9);
    v14 = *(_QWORD *)(countAndFlagsBits + 16);
    if (v14)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v13 = 0;
  v14 = *(_QWORD *)(countAndFlagsBits + 16);
  if (!v14)
    goto LABEL_10;
LABEL_3:
  v23 = v13;
  sub_209568830();
  v15 = (_BYTE *)(countAndFlagsBits + 48);
  do
  {
    v19 = *((_QWORD *)v15 - 2);
    if ((*v15 & 1) != 0)
    {
      v16 = *((_QWORD *)v15 - 1);
      swift_bridgeObjectRetain();
      v17 = (void *)sub_2095686EC();
      v18 = objc_msgSend(v11, sel_valueWithCategory_, v17);

      sub_209563C68(v19, v16, 1);
    }
    else
    {
      v20 = objc_msgSend(v11, sel_valueWithNumber_, *((double *)v15 - 2));
    }
    sub_209568818();
    sub_20956883C();
    sub_209568848();
    sub_209568824();
    v15 += 24;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  v13 = v23;
LABEL_11:
  sub_209563CB8(0, (unint64_t *)&unk_253D1D2D8);
  v21 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    v22 = (void *)sub_2095686EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithX_y_additionalValues_label_, v12, v13, v21, v22);

}

void __swiftcall AXDataPoint.init(x:y:additionalValues:label:)(AXDataPoint *__return_ptr retstr, Swift::String x, Swift::Double_optional y, Swift::OpaquePointer additionalValues, Swift::String_optional label)
{
  uint64_t v5;
  uint64_t countAndFlagsBits;
  char rawValue;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;

  v23 = v5;
  countAndFlagsBits = label.value._countAndFlagsBits;
  rawValue = (char)additionalValues._rawValue;
  v8 = *(double *)&y.is_nil;
  v9 = (void *)sub_2095686EC();
  swift_bridgeObjectRelease();
  v10 = (void *)objc_opt_self();
  v11 = objc_msgSend(v10, sel_valueWithCategory_, v9);

  if ((rawValue & 1) == 0)
  {
    v12 = objc_msgSend(v10, sel_valueWithNumber_, v8);
    v13 = *(_QWORD *)(countAndFlagsBits + 16);
    if (v13)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v12 = 0;
  v13 = *(_QWORD *)(countAndFlagsBits + 16);
  if (!v13)
    goto LABEL_10;
LABEL_3:
  v22 = v12;
  sub_209568830();
  v14 = (_BYTE *)(countAndFlagsBits + 48);
  do
  {
    v18 = *((_QWORD *)v14 - 2);
    if ((*v14 & 1) != 0)
    {
      v15 = *((_QWORD *)v14 - 1);
      swift_bridgeObjectRetain();
      v16 = (void *)sub_2095686EC();
      v17 = objc_msgSend(v10, sel_valueWithCategory_, v16);

      sub_209563C68(v18, v15, 1);
    }
    else
    {
      v19 = objc_msgSend(v10, sel_valueWithNumber_, *((double *)v14 - 2));
    }
    sub_209568818();
    sub_20956883C();
    sub_209568848();
    sub_209568824();
    v14 += 24;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
  v12 = v22;
LABEL_11:
  sub_209563CB8(0, (unint64_t *)&unk_253D1D2D8);
  v20 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  if (v23)
  {
    v21 = (void *)sub_2095686EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithX_y_additionalValues_label_, v11, v12, v20, v21);

}

id AXChartDescriptor.xAxis.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_xAxis);
}

uint64_t AXChartDescriptor.xAxis.setter(uint64_t a1)
{
  void *v1;

  objc_msgSend(v1, sel_setXAxis_, a1);
  return swift_unknownObjectRelease();
}

uint64_t (*AXChartDescriptor.xAxis.modify(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_xAxis);
  return sub_20956346C;
}

uint64_t sub_20956346C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 8), sel_setXAxis_, *(_QWORD *)a1);
  return swift_unknownObjectRelease();
}

uint64_t AXChartDescriptor.additionalAxes.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_additionalAxes);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
  v3 = sub_2095687AC();

  return v3;
}

void sub_209563508(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_additionalAxes);
  if (v3)
  {
    v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
    v5 = sub_2095687AC();

  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  *a2 = v5;
}

void sub_20956357C(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_209568854())
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((*a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
      v4 = (id)sub_2095687A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_setAdditionalAxes_, v4);

      return;
    }
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setAdditionalAxes_, 0);
}

void AXChartDescriptor.additionalAxes.setter(unint64_t a1)
{
  void *v1;
  id v2;

  if (a1 >> 62)
  {
    if (sub_209568854())
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
    v2 = (id)sub_2095687A0();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setAdditionalAxes_, v2);

    return;
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setAdditionalAxes_, 0);
}

void (*AXChartDescriptor.additionalAxes.modify(uint64_t *a1))(uint64_t *a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;

  a1[1] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_additionalAxes);
  if (v3)
  {
    v4 = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
    v5 = sub_2095687AC();

  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
  }
  *a1 = v5;
  return sub_209563788;
}

void sub_209563788(uint64_t *a1, char a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = *a1;
  v4 = (unint64_t)*a1 >> 62;
  if ((a2 & 1) != 0)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      v9 = sub_209568854();
      v6 = (void *)a1[1];
      if (v9)
        goto LABEL_4;
    }
    else
    {
      v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v6 = (void *)a1[1];
      if (v5)
      {
LABEL_4:
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
        v7 = (void *)sub_2095687A0();
        swift_bridgeObjectRelease();
        objc_msgSend(v6, sel_setAdditionalAxes_, v7);

LABEL_10:
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setAdditionalAxes_, 0);
    goto LABEL_10;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v10 = sub_209568854();
    swift_bridgeObjectRelease();
    v8 = (void *)a1[1];
    if (v10)
      goto LABEL_7;
  }
  else
  {
    v8 = (void *)a1[1];
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_7:
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
      v11 = (id)sub_2095687A0();
      swift_bridgeObjectRelease();
      objc_msgSend(v8, sel_setAdditionalAxes_, v11);

      return;
    }
  }
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setAdditionalAxes_, 0);
}

id AXChartDescriptor.init(title:summary:xAxis:yAxis:additionalAxes:series:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, unint64_t a7)
{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v19;

  if (a2)
  {
    v11 = (void *)sub_2095686EC();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v11 = 0;
    if (a4)
    {
LABEL_3:
      v12 = (void *)sub_2095686EC();
      swift_bridgeObjectRelease();
      if (!(a7 >> 62))
        goto LABEL_4;
LABEL_9:
      v19 = a6;
      swift_bridgeObjectRetain();
      v13 = (void *)sub_209568854();
      swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  v12 = 0;
  if (a7 >> 62)
    goto LABEL_9;
LABEL_4:
  v13 = *(void **)((a7 & 0xFFFFFFFFFFFFF8) + 0x10);
  v14 = a6;
  if (v13)
  {
LABEL_5:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
    v13 = (void *)sub_2095687A0();
  }
LABEL_6:
  swift_bridgeObjectRelease();
  v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_209563CB8(0, &qword_253D1D2E8);
  v16 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithTitle_summary_xAxisDescriptor_yAxisDescriptor_additionalAxes_series_, v11, v12, a5, a6, v13, v16);

  swift_unknownObjectRelease();
  return v17;
}

id AXChartDescriptor.init(attributedTitle:summary:xAxis:yAxis:additionalAxes:series:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, unint64_t a6)
{
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v17;

  if (a3)
  {
    v10 = (void *)sub_2095686EC();
    swift_bridgeObjectRelease();
    if (!(a6 >> 62))
      goto LABEL_3;
LABEL_7:
    v17 = a5;
    swift_bridgeObjectRetain();
    v11 = (void *)sub_209568854();
    swift_bridgeObjectRelease();
    if (!v11)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = 0;
  if (a6 >> 62)
    goto LABEL_7;
LABEL_3:
  v11 = *(void **)((a6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v12 = a5;
  if (v11)
  {
LABEL_4:
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9A0);
    v11 = (void *)sub_2095687A0();
  }
LABEL_5:
  swift_bridgeObjectRelease();
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_209563CB8(0, &qword_253D1D2E8);
  v14 = (void *)sub_2095687A0();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithAttributedTitle_summary_xAxisDescriptor_yAxisDescriptor_additionalAxes_series_, a1, v10, a4, a5, v11, v14);

  swift_unknownObjectRelease();
  return v15;
}

char *sub_209563C34(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_209564004(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_209563C68(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0F7E4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_209563CB8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id sub_209563CF0@<X0>(id *a1@<X0>, double *a2@<X8>)
{
  id v3;
  double v4;
  double v5;
  id result;
  double v7;

  v3 = *a1;
  objc_msgSend(*a1, sel_lowerBound);
  v5 = v4;
  result = objc_msgSend(v3, sel_upperBound);
  if (v5 > v7)
  {
    __break(1u);
  }
  else
  {
    *a2 = v5;
    a2[1] = v7;
  }
  return result;
}

id sub_209563D4C(double *a1, id *a2)
{
  double v2;
  id v3;

  v2 = a1[1];
  v3 = *a2;
  objc_msgSend(*a2, sel_setLowerBound_, *a1);
  return objc_msgSend(v3, sel_setUpperBound_, v2);
}

char *sub_209563D94@<X0>(char **a1@<X8>)
{
  char *result;

  result = AXNumericDataAxisDescriptor.gridlinePositions.getter();
  *a1 = result;
  return result;
}

void sub_209563DBC()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  AXNumericDataAxisDescriptor.gridlinePositions.setter(v0);
}

id sub_209563DE4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_xAxis);
  *a2 = result;
  return result;
}

id sub_209563E1C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setXAxis_, *a1);
}

uint64_t sub_209563E3C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t _s5ValueOwxx(uint64_t a1)
{
  return sub_209563C68(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_209563E3C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s5ValueOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_209563E3C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_209563C68(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t _s5ValueOwta(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_209563C68(v4, v5, v6);
  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s5ValueOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_209563FDC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_209563FE8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AXDataPoint.Value()
{
  return &type metadata for AXDataPoint.Value;
}

char *sub_209564004(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459F9B0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

void sub_209564138()
{
  sub_2095672B0();
  JUMPOUT(0x20BD0F070);
}

void sub_209564170()
{
  sub_2095672B0();
  JUMPOUT(0x20BD0F07CLL);
}

uint64_t AttributeDynamicLookup.subscript.getter()
{
  return sub_2095686BC();
}

uint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D320);
}

unint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.markdownName.getter()
{
  return 0xD000000000000019;
}

uint64_t static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.decodeMarkdown(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v5;
  char v6;
  _QWORD v7[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2095688D8();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    v5 = sub_209568890();
    if (v5 >= 7)
      v6 = 0;
    else
      v6 = v5;
    *a2 = v6;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  return result;
}

unint64_t AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 7;
  if (result < 7)
    v2 = result;
  *a2 = v2;
  return result;
}

id static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.objectiveCValue(for:)(unsigned __int8 *a1)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *a1);
}

uint64_t AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

id static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.value(for:)@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;
  char v4;

  result = objc_msgSend(a1, sel_integerValue);
  if ((unint64_t)result >= 7)
    v4 = 0;
  else
    v4 = (char)result;
  *a2 = v4;
  return result;
}

BOOL sub_209564344(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_209564358(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x746C7561666564;
    else
      v3 = 1751607656;
    if (v2 == 1)
      v4 = 0xE700000000000000;
    else
      v4 = 0xE400000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x746C7561666564;
      else
        v6 = 1751607656;
      if (v5 == 1)
        v7 = 0xE700000000000000;
      else
        v7 = 0xE400000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE300000000000000;
    v3 = 7827308;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE300000000000000;
  if (v3 != 7827308)
  {
LABEL_21:
    v8 = sub_209568878();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_209564450(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_209564498(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_20956458C + 4 * byte_209569A98[a2]))(0x656C6F736E6F63);
}

uint64_t sub_20956458C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656C6F736E6F63 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_209568878();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2095646E0()
{
  sub_2095688B4();
  sub_2095688C0();
  return sub_2095688CC();
}

uint64_t sub_209564724()
{
  return sub_2095688C0();
}

void sub_20956474C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_209564788()
{
  sub_209568710();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209564874()
{
  sub_2095688B4();
  sub_2095688C0();
  return sub_2095688CC();
}

void sub_2095648B4(uint64_t a1, char a2)
{
  sub_2095688B4();
  __asm { BR              X10 }
}

uint64_t sub_2095648FC()
{
  sub_209568710();
  swift_bridgeObjectRelease();
  return sub_2095688CC();
}

unint64_t sub_2095649FC@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)(*a1, a2);
}

void sub_209564A04(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_209564A10()
{
  sub_20956726C();
  return sub_209568794();
}

uint64_t sub_209564A6C()
{
  sub_20956726C();
  return sub_20956877C();
}

uint64_t sub_209564AB8()
{
  sub_209567228();
  return sub_2095686C8();
}

uint64_t sub_209564B14()
{
  sub_2095671E4();
  return sub_2095686D4();
}

uint64_t sub_209564B70@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return static AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.decodeMarkdown(from:)(a1, a2);
}

id sub_209564B84(unsigned __int8 *a1)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *a1);
}

unint64_t sub_209564BC4@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  unint64_t result;
  char v4;
  char v5;

  result = AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel.init(rawValue:)((unint64_t)objc_msgSend(a1, sel_integerValue), &v5);
  v4 = v5;
  if (v5 == 7)
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextCustomAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D338);
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextCustomAttribute.markdownName.getter()
{
  return 0xD000000000000017;
}

uint64_t sub_209564C4C()
{
  sub_209567184(&qword_25459FA60, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  return sub_2095686C8();
}

uint64_t sub_209564CC0()
{
  sub_209567184(&qword_25459FA58, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  return sub_2095686D4();
}

uint64_t sub_209564D34()
{
  sub_209567140();
  return sub_2095686E0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D350);
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.markdownName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.decodeMarkdown(from:)@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;
  _QWORD v6[4];
  char v7;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2095688D8();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    sub_209568884();
    AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)(&v7);
    v5 = v7;
    if (v7 == 8)
      v5 = 0;
    *a2 = v5;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_209568860();
  result = swift_bridgeObjectRelease();
  v4 = 8;
  if (v2 < 8)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.objectiveCValue(for:)(uint64_t a1)
{
  return sub_209565DE8(a1, sub_209564EF0);
}

void sub_209564EF0()
{
  __asm { BR              X9 }
}

uint64_t sub_209564F44()
{
  int v0;
  uint64_t v1;

  sub_2095672F4(1);
  swift_bridgeObjectRelease();
  sub_209567418();
  sub_209568800();
  v1 = swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t))((char *)sub_20956508C + 4 * byte_209569AB8[v0]))(v1);
}

uint64_t sub_20956508C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_20956737C(1uLL, 0x656C6F736E6F63, 0xE700000000000000);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  swift_bridgeObjectRelease();
  MEMORY[0x20BD0F100](v0, v2, v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_209568740();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_209568758();
  sub_209568734();
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.value(for:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  char v5;
  char v6;

  v2 = sub_2095686F8();
  result = sub_2095652AC(v2, v3, &v6);
  v5 = v6;
  if (v6 == 8)
    v5 = 0;
  *a1 = v5;
  return result;
}

unint64_t sub_2095652AC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t result;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD v25[2];

  if ((sub_20956874C() & 1) == 0)
  {
    result = swift_bridgeObjectRelease();
    v24 = 8;
    goto LABEL_11;
  }
  v6 = sub_20956871C();
  v7 = sub_20956737C(v6, a1, a2);
  v9 = v8;
  swift_bridgeObjectRelease();
  result = sub_2095687E8();
  if ((v11 & 1) != 0)
    v12 = v9;
  else
    v12 = result;
  if (v12 >> 14 < v7 >> 14)
  {
    __break(1u);
  }
  else
  {
    sub_2095687F4();
    v13 = sub_2095687DC();
    v15 = v14;
    swift_bridgeObjectRelease();
    result = sub_2095687E8();
    if ((v16 & 1) != 0)
      result = v9;
    if (v9 >> 14 >= result >> 14)
    {
      v17 = sub_2095687F4();
      v19 = v18;
      v21 = v20;
      v23 = v22;
      swift_bridgeObjectRelease();
      MEMORY[0x20BD0F100](v17, v19, v21, v23);
      swift_bridgeObjectRelease();
      v25[0] = v13;
      v25[1] = v15;
      swift_bridgeObjectRetain();
      sub_209568740();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)((char *)v25);
      v24 = v25[0];
LABEL_11:
      *a3 = v24;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2095654C0 + 4 * byte_209569AC0[*v0]))(0x6E69616C70, 0xE500000000000000);
}

uint64_t sub_2095654C0()
{
  return 0x656C6F736E6F63;
}

uint64_t sub_2095654D8()
{
  return 0x74737953656C6966;
}

uint64_t sub_2095654FC()
{
  return 0x6E6967617373656DLL;
}

uint64_t sub_20956551C()
{
  return 0x766974617272616ELL;
}

uint64_t sub_209565538()
{
  return 0x6F43656372756F73;
}

uint64_t sub_209565554()
{
  return 0x6873646165727073;
}

uint64_t sub_209565574()
{
  return 0x636F725064726F77;
}

void sub_209565598(char *a1)
{
  sub_209564450(*a1);
}

void sub_2095655A4()
{
  char *v0;

  sub_2095648B4(0, *v0);
}

void sub_2095655B0(uint64_t a1)
{
  char *v1;

  sub_20956474C(a1, *v1);
}

void sub_2095655B8(uint64_t a1)
{
  char *v1;

  sub_2095648B4(a1, *v1);
}

uint64_t sub_2095655C0@<X0>(char *a1@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext.init(rawValue:)(a1);
}

uint64_t sub_2095655CC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2095655F8 + 4 * byte_209569AC8[*v0]))();
}

void sub_2095655F8(_QWORD *a1@<X8>)
{
  *a1 = 0x656C6F736E6F63;
  a1[1] = 0xE700000000000000;
}

void sub_209565614(_QWORD *a1@<X8>)
{
  *a1 = 0x74737953656C6966;
  a1[1] = 0xEA00000000006D65;
}

void sub_20956563C(_QWORD *a1@<X8>)
{
  *a1 = 0x6E6967617373656DLL;
  a1[1] = 0xE900000000000067;
}

void sub_209565660(_QWORD *a1@<X8>)
{
  *a1 = 0x766974617272616ELL;
  a1[1] = 0xE900000000000065;
}

void sub_209565680(_QWORD *a1@<X8>)
{
  *a1 = 0x6F43656372756F73;
  a1[1] = 0xEA00000000006564;
}

void sub_2095656A0(_QWORD *a1@<X8>)
{
  *a1 = 0x6873646165727073;
  a1[1] = 0xEB00000000746565;
}

void sub_2095656C4(char *a1@<X8>)
{
  strcpy(a1, "wordProcessing");
  a1[15] = -18;
}

uint64_t sub_2095656EC()
{
  sub_2095670FC();
  return sub_209568788();
}

uint64_t sub_209565748()
{
  sub_2095670FC();
  return sub_209568770();
}

uint64_t sub_209565794()
{
  sub_2095670B8();
  return sub_2095686C8();
}

uint64_t sub_2095657F0()
{
  sub_209567074();
  return sub_2095686D4();
}

uint64_t sub_20956584C@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  return static AttributeScopes.AccessibilityAttributes.TextualContextAttribute.decodeMarkdown(from:)(a1, a2);
}

uint64_t sub_209565860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2095666C8(a1, a2, a3, sub_209564EF0);
}

unint64_t sub_20956587C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  char v5;
  char v6;

  v2 = sub_2095686F8();
  result = sub_2095652AC(v2, v3, &v6);
  v5 = v6;
  if (v6 == 8)
    v5 = 0;
  *a1 = v5;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D368);
}

unint64_t static AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_2095658FC()
{
  return sub_2095686C8();
}

uint64_t sub_209565918()
{
  return sub_2095686D4();
}

uint64_t sub_209565934()
{
  sub_209567030();
  return sub_2095686E0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D340);
}

unint64_t static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.markdownName.getter()
{
  return 0xD000000000000020;
}

id static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.objectiveCValue(for:)(double a1)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, a1 + 1.0);
}

double static AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute.value(for:)(void *a1)
{
  double v1;

  objc_msgSend(a1, sel_doubleValue);
  return v1 + -1.0;
}

uint64_t sub_209565A48()
{
  return sub_2095686C8();
}

uint64_t sub_209565A64()
{
  return sub_2095686D4();
}

uint64_t sub_209565A80()
{
  sub_209566FEC();
  return sub_2095686E0();
}

id sub_209565ADC(double *a1)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *a1 + 1.0);
}

double sub_209565B2C@<D0>(void *a1@<X0>, double *a2@<X8>)
{
  double v3;
  double result;

  objc_msgSend(a1, sel_doubleValue);
  result = v3 + -1.0;
  *a2 = result;
  return result;
}

uint64_t static AttributeScopes.AccessibilityAttributes.SpellOutAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D348);
}

unint64_t static AttributeScopes.AccessibilityAttributes.SpellOutAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_209565BA0()
{
  sub_209566FA8();
  return sub_2095686E0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute.name.getter()
{
  return sub_209565D78(&qword_253D1D370);
}

unint64_t static AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute.markdownName.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_209565C34()
{
  sub_209566F64();
  return sub_2095686E0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.IPANotationAttribute.name.getter()
{
  return sub_209565D78(qword_253D1D358);
}

unint64_t static AttributeScopes.AccessibilityAttributes.IPANotationAttribute.markdownName.getter()
{
  return 0xD000000000000023;
}

uint64_t sub_209565CC8()
{
  return sub_2095686C8();
}

uint64_t sub_209565CE4()
{
  return sub_2095686D4();
}

uint64_t sub_209565D00()
{
  sub_209566F20();
  return sub_2095686E0();
}

uint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.name.getter()
{
  return sub_209565D78(qword_253D1D3C0);
}

uint64_t sub_209565D78(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  return sub_2095686F8();
}

unint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.markdownName.getter()
{
  return 0xD000000000000027;
}

uint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.objectiveCValue(for:)(uint64_t a1)
{
  return sub_209565DE8(a1, (void (*)(void))sub_209565E38);
}

uint64_t sub_209565DE8(uint64_t a1, void (*a2)(void))
{
  uint64_t v2;

  a2();
  v2 = sub_2095686EC();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_209565E38()
{
  unsigned __int8 *v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *v0;
  sub_2095672F4(1);
  swift_bridgeObjectRelease();
  sub_209567418();
  sub_209568800();
  swift_bridgeObjectRelease();
  v2 = 0xE700000000000000;
  v3 = 0x746C7561666564;
  if (v1 != 1)
  {
    v3 = 1751607656;
    v2 = 0xE400000000000000;
  }
  if (v1)
    v4 = v3;
  else
    v4 = 7827308;
  if (v1)
    v5 = v2;
  else
    v5 = 0xE300000000000000;
  v6 = sub_20956737C(1uLL, v4, v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_bridgeObjectRelease();
  MEMORY[0x20BD0F100](v6, v8, v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_209568740();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = sub_209568758();
  sub_209568734();
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t static AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.value(for:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  char v5;
  char v6;

  v2 = sub_2095686F8();
  result = sub_209566074(v2, v3, &v6);
  v5 = v6;
  if (v6 == 3)
    v5 = 1;
  *a1 = v5;
  return result;
}

unint64_t sub_209566074@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t result;
  char v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _QWORD v25[2];

  if ((sub_20956874C() & 1) == 0)
  {
    result = swift_bridgeObjectRelease();
    v24 = 3;
    goto LABEL_11;
  }
  v6 = sub_20956871C();
  v7 = sub_20956737C(v6, a1, a2);
  v9 = v8;
  swift_bridgeObjectRelease();
  result = sub_2095687E8();
  if ((v11 & 1) != 0)
    v12 = v9;
  else
    v12 = result;
  if (v12 >> 14 < v7 >> 14)
  {
    __break(1u);
  }
  else
  {
    sub_2095687F4();
    v13 = sub_2095687DC();
    v15 = v14;
    swift_bridgeObjectRelease();
    result = sub_2095687E8();
    if ((v16 & 1) != 0)
      result = v9;
    if (v9 >> 14 >= result >> 14)
    {
      v17 = sub_2095687F4();
      v19 = v18;
      v21 = v20;
      v23 = v22;
      swift_bridgeObjectRelease();
      MEMORY[0x20BD0F100](v17, v19, v21, v23);
      swift_bridgeObjectRelease();
      v25[0] = v13;
      v25[1] = v15;
      swift_bridgeObjectRetain();
      sub_209568740();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)((char *)v25);
      v24 = v25[0];
LABEL_11:
      *a3 = v24;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)@<X0>(char *a1@<X8>)
{
  unint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_209568860();
  result = swift_bridgeObjectRelease();
  v4 = 3;
  if (v2 < 3)
    v4 = v2;
  *a1 = v4;
  return result;
}

uint64_t AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x746C7561666564;
  if (*v0 != 1)
    v1 = 1751607656;
  if (*v0)
    return v1;
  else
    return 7827308;
}

uint64_t sub_209566300(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_209564358(*a1, *a2);
}

uint64_t sub_20956630C()
{
  sub_2095688B4();
  sub_209568710();
  swift_bridgeObjectRelease();
  return sub_2095688CC();
}

uint64_t sub_20956639C()
{
  sub_209568710();
  return swift_bridgeObjectRelease();
}

uint64_t sub_209566408()
{
  sub_2095688B4();
  sub_209568710();
  swift_bridgeObjectRelease();
  return sub_2095688CC();
}

uint64_t sub_209566494@<X0>(char *a1@<X8>)
{
  return AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority.init(rawValue:)(a1);
}

void sub_2095664A0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE300000000000000;
  v4 = 0xE700000000000000;
  v5 = 0x746C7561666564;
  if (v2 != 1)
  {
    v5 = 1751607656;
    v4 = 0xE400000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 7827308;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_2095664F0()
{
  sub_209566EDC();
  return sub_209568788();
}

uint64_t sub_20956654C()
{
  sub_209566EDC();
  return sub_209568770();
}

uint64_t sub_209566598()
{
  sub_209566E98();
  return sub_2095686C8();
}

uint64_t sub_2095665F4()
{
  sub_209566E54();
  return sub_2095686D4();
}

uint64_t sub_209566650()
{
  sub_209566E10();
  return sub_2095686E0();
}

uint64_t sub_2095666AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2095666C8(a1, a2, a3, (void (*)(void))sub_209565E38);
}

uint64_t sub_2095666C8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v4;

  a4();
  v4 = sub_2095686EC();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_209566718@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t result;
  char v5;
  char v6;

  v2 = sub_2095686F8();
  result = sub_209566074(v2, v3, &v6);
  v5 = v6;
  if (v6 == 3)
    v5 = 1;
  *a1 = v5;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_2095667A8()
{
  unint64_t result;

  result = qword_25459F9C0;
  if (!qword_25459F9C0)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel);
    atomic_store(result, (unint64_t *)&qword_25459F9C0);
  }
  return result;
}

unint64_t sub_2095667F0()
{
  unint64_t result;

  result = qword_25459F9C8;
  if (!qword_25459F9C8)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel);
    atomic_store(result, (unint64_t *)&qword_25459F9C8);
  }
  return result;
}

uint64_t sub_209566834()
{
  return sub_209567184(&qword_25459F9D0, MEMORY[0x24BEE0D10], MEMORY[0x24BEE12A8]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD0F7F0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2095668A8()
{
  unint64_t result;

  result = qword_25459F9E0;
  if (!qword_25459F9E0)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext);
    atomic_store(result, (unint64_t *)&qword_25459F9E0);
  }
  return result;
}

unint64_t sub_2095668F0()
{
  unint64_t result;

  result = qword_25459F9E8;
  if (!qword_25459F9E8)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext);
    atomic_store(result, (unint64_t *)&qword_25459F9E8);
  }
  return result;
}

uint64_t sub_209566934()
{
  return MEMORY[0x24BEE13E8];
}

uint64_t sub_209566940()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_209566950()
{
  unint64_t result;

  result = qword_25459F728;
  if (!qword_25459F728)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority);
    atomic_store(result, (unint64_t *)&qword_25459F728);
  }
  return result;
}

unint64_t sub_209566998()
{
  unint64_t result;

  result = qword_25459F720;
  if (!qword_25459F720)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority);
    atomic_store(result, (unint64_t *)&qword_25459F720);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s23AccessibilityAttributesV21HeadingLevelAttributeO12HeadingLevelOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s23AccessibilityAttributesV21HeadingLevelAttributeO12HeadingLevelOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_209566AC8 + 4 * byte_209569AD5[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_209566AFC + 4 * byte_209569AD0[v4]))();
}

uint64_t sub_209566AFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566B04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x209566B0CLL);
  return result;
}

uint64_t sub_209566B18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x209566B20);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_209566B24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566B2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566B38(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_209566B40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel;
}

uint64_t _s23AccessibilityAttributesV23TextualContextAttributeO14TextualContextOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s23AccessibilityAttributesV23TextualContextAttributeO14TextualContextOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_209566C34 + 4 * byte_209569ADF[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_209566C68 + 4 * byte_209569ADA[v4]))();
}

uint64_t sub_209566C68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566C70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x209566C78);
  return result;
}

uint64_t sub_209566C84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x209566C8CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_209566C90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566C98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext;
}

uint64_t _s23AccessibilityAttributesV29AnnouncementPriorityAttributeO20AnnouncementPriorityOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s23AccessibilityAttributesV29AnnouncementPriorityAttributeO20AnnouncementPriorityOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_209566D90 + 4 * byte_209569AE9[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_209566DC4 + 4 * byte_209569AE4[v4]))();
}

uint64_t sub_209566DC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566DCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x209566DD4);
  return result;
}

uint64_t sub_209566DE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x209566DE8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_209566DEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209566DF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority()
{
  return &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority;
}

unint64_t sub_209566E10()
{
  unint64_t result;

  result = qword_25459F9F0;
  if (!qword_25459F9F0)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute);
    atomic_store(result, (unint64_t *)&qword_25459F9F0);
  }
  return result;
}

unint64_t sub_209566E54()
{
  unint64_t result;

  result = qword_25459F9F8;
  if (!qword_25459F9F8)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority);
    atomic_store(result, (unint64_t *)&qword_25459F9F8);
  }
  return result;
}

unint64_t sub_209566E98()
{
  unint64_t result;

  result = qword_25459FA00;
  if (!qword_25459FA00)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority);
    atomic_store(result, (unint64_t *)&qword_25459FA00);
  }
  return result;
}

unint64_t sub_209566EDC()
{
  unint64_t result;

  result = qword_25459FA08;
  if (!qword_25459FA08)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority, &type metadata for AttributeScopes.AccessibilityAttributes.AnnouncementPriorityAttribute.AnnouncementPriority);
    atomic_store(result, (unint64_t *)&qword_25459FA08);
  }
  return result;
}

unint64_t sub_209566F20()
{
  unint64_t result;

  result = qword_25459FA10;
  if (!qword_25459FA10)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.IPANotationAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.IPANotationAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA10);
  }
  return result;
}

unint64_t sub_209566F64()
{
  unint64_t result;

  result = qword_25459FA18;
  if (!qword_25459FA18)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.QueueAnnouncementAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA18);
  }
  return result;
}

unint64_t sub_209566FA8()
{
  unint64_t result;

  result = qword_25459FA20;
  if (!qword_25459FA20)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.SpellOutAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.SpellOutAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA20);
  }
  return result;
}

unint64_t sub_209566FEC()
{
  unint64_t result;

  result = qword_25459FA28;
  if (!qword_25459FA28)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.AdjustedPitchAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA28);
  }
  return result;
}

unint64_t sub_209567030()
{
  unint64_t result;

  result = qword_25459FA30;
  if (!qword_25459FA30)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.IncludesPunctuationAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA30);
  }
  return result;
}

unint64_t sub_209567074()
{
  unint64_t result;

  result = qword_25459FA38;
  if (!qword_25459FA38)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext);
    atomic_store(result, (unint64_t *)&qword_25459FA38);
  }
  return result;
}

unint64_t sub_2095670B8()
{
  unint64_t result;

  result = qword_25459FA40;
  if (!qword_25459FA40)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext);
    atomic_store(result, (unint64_t *)&qword_25459FA40);
  }
  return result;
}

unint64_t sub_2095670FC()
{
  unint64_t result;

  result = qword_25459FA48;
  if (!qword_25459FA48)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext, &type metadata for AttributeScopes.AccessibilityAttributes.TextualContextAttribute.TextualContext);
    atomic_store(result, (unint64_t *)&qword_25459FA48);
  }
  return result;
}

unint64_t sub_209567140()
{
  unint64_t result;

  result = qword_25459FA50;
  if (!qword_25459FA50)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.TextCustomAttribute, &type metadata for AttributeScopes.AccessibilityAttributes.TextCustomAttribute);
    atomic_store(result, (unint64_t *)&qword_25459FA50);
  }
  return result;
}

uint64_t sub_209567184(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25459F9D8);
    v8 = a2;
    result = MEMORY[0x20BD0F7FC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2095671E4()
{
  unint64_t result;

  result = qword_25459FA68;
  if (!qword_25459FA68)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel);
    atomic_store(result, (unint64_t *)&qword_25459FA68);
  }
  return result;
}

unint64_t sub_209567228()
{
  unint64_t result;

  result = qword_25459FA70;
  if (!qword_25459FA70)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel);
    atomic_store(result, (unint64_t *)&qword_25459FA70);
  }
  return result;
}

unint64_t sub_20956726C()
{
  unint64_t result;

  result = qword_25459FA78;
  if (!qword_25459FA78)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel, &type metadata for AttributeScopes.AccessibilityAttributes.HeadingLevelAttribute.HeadingLevel);
    atomic_store(result, (unint64_t *)&qword_25459FA78);
  }
  return result;
}

unint64_t sub_2095672B0()
{
  unint64_t result;

  result = qword_25459FA80;
  if (!qword_25459FA80)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AttributeScopes.AccessibilityAttributes, &type metadata for AttributeScopes.AccessibilityAttributes);
    atomic_store(result, (unint64_t *)&qword_25459FA80);
  }
  return result;
}

uint64_t sub_2095672F4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_209568728();
    return sub_209568764();
  }
  return result;
}

unint64_t sub_20956737C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_209568728();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_209568764();
  }
  __break(1u);
  return result;
}

unint64_t sub_209567418()
{
  unint64_t result;

  result = qword_25459F730;
  if (!qword_25459F730)
  {
    result = MEMORY[0x20BD0F7FC](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_25459F730);
  }
  return result;
}

BOOL static AccessibilityNotification.Kind.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccessibilityNotification.Kind.hash(into:)()
{
  return sub_2095688C0();
}

uint64_t AccessibilityNotification.Kind.hashValue.getter()
{
  sub_2095688B4();
  sub_2095688C0();
  return sub_2095688CC();
}

void static AccessibilityNotification.Announcement._kind.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

id AccessibilityNotification.Announcement._info.getter()
{
  id *v0;

  return *v0;
}

void AccessibilityNotification.Announcement._info.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*AccessibilityNotification.Announcement._info.modify())()
{
  return nullsub_2;
}

unint64_t sub_209567530()
{
  unint64_t result;

  result = qword_25459F738;
  if (!qword_25459F738)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25459F738);
  }
  return result;
}

Accessibility::AccessibilityNotification::Announcement __swiftcall AccessibilityNotification.Announcement.init(_:)(Accessibility::AccessibilityNotification::Announcement result)
{
  Accessibility::AccessibilityNotification::Announcement *v1;

  v1->_info.super.isa = result._info.super.isa;
  return result;
}

void sub_209567578(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

id sub_209567580@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

void sub_20956758C()
{
  void **v0;

  _AXPostPlatformNotification(1008, *v0);
}

Swift::Void __swiftcall _AccessibilityNotifications.post()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v3 = v0;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v2 + 16))(&v11, v3, v2);
  v8 = dword_20956AAE0[(char)v11];
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v3, v2);
  v9 = (void *)sub_20956886C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  _AXPostPlatformNotification(v8, v9);
  swift_unknownObjectRelease();
}

void static AccessibilityNotification.LayoutChanged._kind.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t AccessibilityNotification.LayoutChanged._info.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2095678E8(v1, a1);
}

uint64_t AccessibilityNotification.LayoutChanged._info.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_209567930(a1, v1);
}

uint64_t (*AccessibilityNotification.LayoutChanged._info.modify())()
{
  return nullsub_2;
}

uint64_t AccessibilityNotification.LayoutChanged.init(_:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  return sub_209567930(a1, (uint64_t)a2);
}

void sub_2095676D4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2095676E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2095678E8(v1, a1);
}

uint64_t sub_2095676EC(uint64_t a1, uint64_t a2)
{
  return sub_209567724(a1, a2, 1001);
}

void static AccessibilityNotification.ScreenChanged._kind.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t (*AccessibilityNotification.ScreenChanged._info.modify())()
{
  return nullsub_2;
}

void sub_209567710(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_20956771C(uint64_t a1, uint64_t a2)
{
  return sub_209567724(a1, a2, 1000);
}

uint64_t sub_209567724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  uint64_t v7;

  sub_2095678E8(v3, (uint64_t)&v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25459FA88);
  v5 = (void *)sub_2095688A8();
  _AXPostPlatformNotification(a3, v5);
  return swift_unknownObjectRelease();
}

void static AccessibilityNotification.PageScrolled._kind.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t (*AccessibilityNotification.PageScrolled._info.modify())()
{
  return nullsub_2;
}

uint64_t _s13Accessibility0A12NotificationO12AnnouncementVyAE10Foundation16AttributedStringVcfC_0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v4 = sub_20956868C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209567530();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = sub_2095687D0();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *a2 = v8;
  return result;
}

void _s13Accessibility0A12NotificationO12AnnouncementVyAESScfC_0(_QWORD *a1@<X8>)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v3 = (void *)sub_2095686EC();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithString_, v3);

  *a1 = v4;
}

void sub_2095678CC(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_2095678D8()
{
  void **v0;

  _AXPostPlatformNotification(1009, *v0);
}

uint64_t sub_2095678E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25459FA88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209567930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25459FA88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_20956797C()
{
  unint64_t result;

  result = qword_25459FA90;
  if (!qword_25459FA90)
  {
    result = MEMORY[0x20BD0F7FC](&protocol conformance descriptor for AccessibilityNotification.Kind, &type metadata for AccessibilityNotification.Kind);
    atomic_store(result, (unint64_t *)&qword_25459FA90);
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityNotification()
{
  return &type metadata for AccessibilityNotification;
}

uint64_t getEnumTagSinglePayload for AccessibilityNotification.Kind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AccessibilityNotification.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_209567AAC + 4 * byte_20956A975[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_209567AE0 + 4 * byte_20956A970[v4]))();
}

uint64_t sub_209567AE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_209567AE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x209567AF0);
  return result;
}

uint64_t sub_209567AFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x209567B04);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_209567B08(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_209567B10(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.Kind()
{
  return &type metadata for AccessibilityNotification.Kind;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.Announcement()
{
  return &type metadata for AccessibilityNotification.Announcement;
}

uint64_t initializeBufferWithCopyOfBuffer for AccessibilityNotification.LayoutChanged(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AccessibilityNotification.LayoutChanged(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    return __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AccessibilityNotification.LayoutChanged(uint64_t a1, _OWORD *a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  return a1;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.LayoutChanged()
{
  return &type metadata for AccessibilityNotification.LayoutChanged;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 24) = v3;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v4;
  }
  return a1;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 24) = v4;
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    return a1;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s13Accessibility25AccessibilityNotificationO13LayoutChangedVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.ScreenChanged()
{
  return &type metadata for AccessibilityNotification.ScreenChanged;
}

ValueMetadata *type metadata accessor for AccessibilityNotification.PageScrolled()
{
  return &type metadata for AccessibilityNotification.PageScrolled;
}

uint64_t dispatch thunk of static _AccessibilityNotifications._kind.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of _AccessibilityNotifications._info.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _AccessibilityNotifications.post()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

BOOL static AccessibilitySettings.prefersNonBlinkingTextInsertionIndicator.getter()
{
  return AXPrefersNonBlinkingTextInsertionIndicator();
}

Swift::Bool __swiftcall AXPrefersHorizontalTextLayout()()
{
  return AXPrefersHorizontalTextLayout();
}

BOOL static AccessibilitySettings.prefersHorizontalTextLayout.getter()
{
  return AXPrefersHorizontalTextLayout();
}

__CFString *static AccessibilitySettings.prefersHorizontalTextLayoutDidChangeNotification.getter()
{
  return CFSTR("com.apple.accessibility.prefers.horizontal.text");
}

Swift::Bool __swiftcall AXAnimatedImagesEnabled()()
{
  return AXAnimatedImagesEnabled();
}

BOOL static AccessibilitySettings.animatedImagesEnabled.getter()
{
  return AXAnimatedImagesEnabled();
}

__CFString *static AccessibilitySettings.animatedImagesEnabledDidChangeNotification.getter()
{
  return CFSTR("com.apple.accessibility.reduce.motion.autoplay.animated.images.status");
}

uint64_t static AccessibilitySettings.openSettings(for:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_209567FAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_209568044;
  return sub_20956889C();
}

uint64_t sub_209568044()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2095680B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2095680BC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2095680F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459FAB0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_2095683D8;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_209568280;
  aBlock[3] = &block_descriptor_0;
  v9 = _Block_copy(aBlock);
  swift_release();
  AXOpenSettingsFeature(a2, v9);
  _Block_release(v9);
}

void sub_209568218(uint64_t a1)
{
  uint64_t v1;

  sub_2095680F0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_209568220(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459FAB0);
    return sub_2095687B8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459FAB0);
    return sub_2095687C4();
  }
}

void sub_209568280(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

__CFString *sub_2095682D4()
{
  qword_25459FA98 = (uint64_t)CFSTR("com.apple.accessibility.prefers.horizontal.text");
  return CFSTR("com.apple.accessibility.prefers.horizontal.text");
}

id static NSNotificationName.AXPrefersHorizontalTextLayoutDidChange.getter()
{
  return sub_20956833C(&qword_25459F8C8, (id *)&qword_25459FA98);
}

__CFString *sub_209568308()
{
  qword_25459FAA0 = (uint64_t)CFSTR("com.apple.accessibility.reduce.motion.autoplay.animated.images.status");
  return CFSTR("com.apple.accessibility.reduce.motion.autoplay.animated.images.status");
}

id static NSNotificationName.AXAnimatedImagesEnabledDidChange.getter()
{
  return sub_20956833C(qword_25459F8D0, (id *)&qword_25459FAA0);
}

id sub_20956833C(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t sub_209568374()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459FAB0);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2095683D8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25459FAB0);
  return sub_209568220(a1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t AXAnimatedImagesEnabled_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getAXUIClientClass_block_invoke_cold_1(v0);
}

void __getAXUIClientClass_block_invoke_cold_1()
{
  NSObject *v0;
  double v1;

  v0 = abort_report_np();
  AXNameFromColor_cold_1(v0, v1);
}

void AXNameFromColor_cold_1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl(&dword_209557000, log, OS_LOG_TYPE_ERROR, "Hue value should be in range [0..1f], got %f", (uint8_t *)&v2, 0xCu);
}

uint64_t __getCIImageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getNSFontClass_block_invoke_cold_1(v0);
}

uint64_t __getNSFontClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXDataSeriesDescriptor initWithDictionary:].cold.2(v0);
}

void __getAXMDataSonificationManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_209568674();
}

uint64_t sub_209568674()
{
  return MEMORY[0x24BDCBC18]();
}

uint64_t sub_209568680()
{
  return MEMORY[0x24BDCBC20]();
}

uint64_t sub_20956868C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_209568698()
{
  return MEMORY[0x24BDCC948]();
}

uint64_t sub_2095686A4()
{
  return MEMORY[0x24BDCC950]();
}

uint64_t sub_2095686B0()
{
  return MEMORY[0x24BDCC958]();
}

uint64_t sub_2095686BC()
{
  return MEMORY[0x24BDCD2E0]();
}

uint64_t sub_2095686C8()
{
  return MEMORY[0x24BDCD5B0]();
}

uint64_t sub_2095686D4()
{
  return MEMORY[0x24BDCD5B8]();
}

uint64_t sub_2095686E0()
{
  return MEMORY[0x24BDCD710]();
}

uint64_t sub_2095686EC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2095686F8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_209568704()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_209568710()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20956871C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_209568728()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_209568734()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_209568740()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20956874C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_209568758()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_209568764()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_209568770()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_20956877C()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_209568788()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_209568794()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2095687A0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2095687AC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2095687B8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2095687C4()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2095687D0()
{
  return MEMORY[0x24BDCFFF8]();
}

uint64_t sub_2095687DC()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_2095687E8()
{
  return MEMORY[0x24BEE1DB8]();
}

uint64_t sub_2095687F4()
{
  return MEMORY[0x24BEE1E60]();
}

uint64_t sub_209568800()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_20956880C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_209568818()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_209568824()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_209568830()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20956883C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_209568848()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_209568854()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_209568860()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_20956886C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_209568878()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_209568884()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_209568890()
{
  return MEMORY[0x24BEE3A78]();
}

uint64_t sub_20956889C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2095688A8()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2095688B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2095688C0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2095688CC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2095688D8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x24BDBDCA0]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x24BDBDCA8]();
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x24BDC47D8](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x24BDC4850]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSSize NSSizeFromString(NSString *aString)
{
  double v1;
  double v2;
  NSSize result;

  MEMORY[0x24BDD1220](aString);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x24BDD1270]((__n128)aSize, *(__n128 *)&aSize.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

uint64_t _AXSCopyPreferredContentSizeCategoryName()
{
  return MEMORY[0x24BED2190]();
}

uint64_t _AXSHearingDevicePairedUUIDs()
{
  return MEMORY[0x24BED2278]();
}

uint64_t _AXSHearingDeviceStreamingEars()
{
  return MEMORY[0x24BED2280]();
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  return MEMORY[0x24BED2598]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

