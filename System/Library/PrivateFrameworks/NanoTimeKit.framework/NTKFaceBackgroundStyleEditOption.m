@implementation NTKFaceBackgroundStyleEditOption

- (unint64_t)backgroundStyle
{
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C94518], "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideForSensitivity:", NTKGossamerUISensitivity());

  if ((v4 & 1) != 0)
    return 0;
  else
    return -[NTKValueEditOption _value](self, "_value");
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return _EnumValueRange(0, 1uLL);
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("EDIT_OPTION_LABEL_FACE_BACKGROUND_STYLE_TINTED");
  if (a3 != 1)
    v4 = 0;
  if (a3)
    return (id)v4;
  else
    return CFSTR("EDIT_OPTION_LABEL_FACE_BACKGROUND_STYLE_BLACK");
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken != -1)
    dispatch_once(&_valueToFaceBundleStringDict_onceToken, &__block_literal_global_4);
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString;
}

void __64__NTKFaceBackgroundStyleEditOption__valueToFaceBundleStringDict__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6C9D750;
  v2[1] = &unk_1E6C9D768;
  v3[0] = CFSTR("style 1");
  v3[1] = CFSTR("style 2");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString;
  _valueToFaceBundleStringDict_valueToFaceBundleString = v0;

}

- (int64_t)swatchStyle
{
  return 3;
}

@end
