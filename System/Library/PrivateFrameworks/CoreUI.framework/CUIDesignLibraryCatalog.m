@implementation CUIDesignLibraryCatalog

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6
{
  return -[CUIDesignLibraryCatalog colorWithName:palette:displayGamut:hierarchyLevel:error:](self, "colorWithName:palette:displayGamut:hierarchyLevel:error:", a3, a4, a5, 0, a6);
}

- (int64_t)styling
{
  return self->_styling;
}

- (id)_colorNameStringFromNameEnum:(int64_t)a3 palette:(int64_t)a4
{
  __CFString *v4;
  id result;
  const __CFString *v6;

  if ((unint64_t)(a4 - 1) > 3)
    v4 = CFSTR("system");
  else
    v4 = off_1E41AB680[a4 - 1];
  result = CFSTR("systemWhiteColor");
  switch(a3)
  {
    case 0:
      v6 = CFSTR("RedColor");
      goto LABEL_20;
    case 1:
      v6 = CFSTR("OrangeColor");
      goto LABEL_20;
    case 2:
      v6 = CFSTR("YellowColor");
      goto LABEL_20;
    case 3:
      v6 = CFSTR("GreenColor");
      goto LABEL_20;
    case 4:
      v6 = CFSTR("TealColor");
      goto LABEL_20;
    case 5:
      v6 = CFSTR("MintColor");
      goto LABEL_20;
    case 6:
      v6 = CFSTR("CyanColor");
      goto LABEL_20;
    case 7:
      v6 = CFSTR("BlueColor");
      goto LABEL_20;
    case 8:
      v6 = CFSTR("IndigoColor");
      goto LABEL_20;
    case 9:
      v6 = CFSTR("PurpleColor");
      goto LABEL_20;
    case 10:
      v6 = CFSTR("PinkColor");
      goto LABEL_20;
    case 11:
      return result;
    case 12:
      return CFSTR("systemBlackColor");
    case 13:
      return CFSTR("systemGrayColor");
    case 14:
      v6 = CFSTR("BrownColor");
LABEL_20:
      result = -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v6);
      break;
    case 15:
      result = CFSTR("labelColor");
      break;
    case 16:
      result = CFSTR("secondaryLabelColor");
      break;
    case 17:
      result = CFSTR("tertiaryLabelColor");
      break;
    case 18:
      result = CFSTR("quaternaryLabelColor");
      break;
    case 19:
      result = CFSTR("quinaryLabelColor");
      break;
    case 20:
      result = CFSTR("IconBorderOuterColor");
      break;
    case 21:
      result = CFSTR("primarySystemFillColor");
      break;
    case 22:
      result = CFSTR("secondarySystemFillColor");
      break;
    case 23:
      result = CFSTR("tertiarySystemFillColor");
      break;
    case 24:
      result = CFSTR("quaternarySystemFillColor");
      break;
    case 25:
      result = CFSTR("quinarySystemFillColor");
      break;
    case 26:
      result = CFSTR("groupBoxFillColor");
      break;
    case 27:
      result = CFSTR("groupBoxFormFillColor");
      break;
    default:
      result = CFSTR("systemRedColor");
      break;
  }
  return result;
}

+ (id)catalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  id result;
  id v13;
  uint64_t v14;
  CUIDesignLibraryCatalog *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  CUIDesignLibraryCatalog *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  result = objc_msgSend(a1, "_catalogPathComponentForDesignSystem:colorScheme:contrast:styling:error:", __resolvedDesignSystemForInputSystem(a3), a4, a5, a6, a7);
  if (result)
  {
    v13 = result;
    if (__catalogOnceToken != -1)
      dispatch_once(&__catalogOnceToken, &__block_literal_global_6);
    os_unfair_lock_lock((os_unfair_lock_t)&__catalogCacheLock);
    v15 = (CUIDesignLibraryCatalog *)objc_msgSend((id)__catalogCache, "objectForKey:", v13);
    if (v15)
      goto LABEL_13;
    v16 = objc_msgSend((id)__coreUIBundleResoucePath, "stringByAppendingPathComponent:", objc_msgSend((id)objc_opt_class(CUIDesignLibraryCatalog, v14), "_bundleNameForResolvedDesignSystem:", a3));
    if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v16))
    {
      v23 = objc_msgSend(v16, "stringByAppendingPathComponent:", v13);
      v24 = -[CUIDesignLibraryCatalog initWithURL:error:]([CUIDesignLibraryCatalog alloc], "initWithURL:error:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23), a7);
      if (v24)
      {
        v15 = v24;
        -[CUIDesignLibraryCatalog setDesignSystem:](v24, "setDesignSystem:", a3);
        -[CUIDesignLibraryCatalog setColorScheme:](v15, "setColorScheme:", a4);
        -[CUIDesignLibraryCatalog setContrast:](v15, "setContrast:", a5);
        -[CUIDesignLibraryCatalog setStyling:](v15, "setStyling:", a6);
        objc_msgSend((id)__catalogCache, "setObject:forKey:", v15, v13);
LABEL_13:
        os_unfair_lock_unlock((os_unfair_lock_t)&__catalogCacheLock);
        return v15;
      }
      if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v23))
      {
        _CUILog(4, (uint64_t)"CoreUI: Error: Couldn't open CUIDesignLibraryCatalog at path %@.", v25, v26, v27, v28, v29, v30, (uint64_t)v23);
      }
    }
    else
    {
      if (a7)
        *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error: Couldn't find CUIDesignLibraryCatalog bundle at path %@. Check to make sure that the DesignLibrary .uicatalog files have been distilled and installed in the correct resource location. This may involve building the correct DesignLibrary bundle target as a separate step."), v16), NSLocalizedDescriptionKey, 0));
      _CUILog(4, (uint64_t)"CoreUI: -[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:] Couldn't locate catalog at path '%@'.", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
    v15 = 0;
    goto LABEL_13;
  }
  return result;
}

- (void)setStyling:(int64_t)a3
{
  self->_styling = a3;
}

- (void)setDesignSystem:(int64_t)a3
{
  self->_designSystem = a3;
}

- (void)setContrast:(int64_t)a3
{
  self->_contrast = a3;
}

- (void)setColorScheme:(int64_t)a3
{
  self->_colorScheme = a3;
}

- (CUIDesignLibraryCatalog)initWithURL:(id)a3 error:(id *)a4
{
  CUIDesignLibraryCatalog *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIDesignLibraryCatalog;
  v6 = -[CUIDesignLibraryCatalog init](&v9, sel_init);
  if (v6)
  {
    if (!objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", a4))
    {
      v6->_storageRef = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_6;
    }
    v6->_assetStoreName = (NSString *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "URLByDeletingPathExtension"), "lastPathComponent"), "copy");
    v7 = +[CUIThemeFacet themeWithContentsOfURL:error:](CUIThemeFacet, "themeWithContentsOfURL:error:", a3, a4);
    v6->_storageRef = v7;
    if (!v7)
    {
      v6->_storageRef = 0x7FFFFFFFFFFFFFFFLL;
      v6->_lock._os_unfair_lock_opaque = 0;
LABEL_6:

      return 0;
    }
  }
  return v6;
}

+ (id)_catalogPathComponentForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  unsigned int v7;
  const __CFString *v8;
  const __CFString *v9;
  char v10;
  const __CFString *v11;
  id result;
  const __CFString *v13;
  const __CFString *v14;

  v7 = 0;
  v8 = &stru_1E41B97C0;
  v9 = CFSTR("iOSRepositories/");
  v10 = 1;
  v11 = &stru_1E41B97C0;
  switch(a3)
  {
    case 0:
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUIDesignLibraryCatalog.m"), 127, CFSTR("Can't use CUIDesignSystemAutomatic with _catalogPathComponentForDesignSystem. Must resolve before calling based on OS."));
      goto LABEL_5;
    case 1:
      goto LABEL_12;
    case 2:
      v7 = 0;
      v11 = &stru_1E41B97C0;
      v9 = CFSTR("tvOSRepositories/");
      goto LABEL_12;
    case 3:
      v7 = 0;
      v11 = &stru_1E41B97C0;
      v9 = CFSTR("watchOSRepositories/");
      goto LABEL_12;
    case 4:
      v7 = 0;
      v11 = &stru_1E41B97C0;
      v9 = CFSTR("CarPlayRepositories/");
      goto LABEL_12;
    case 5:
      v11 = CFSTR("Contents/Resources/");
      v7 = 1;
      v9 = CFSTR("macOSRepositories/");
      goto LABEL_12;
    case 6:
      v10 = 0;
      v7 = 0;
      v11 = CFSTR("Contents/Resources/");
      v9 = CFSTR("macTouchBarRepositories/");
      goto LABEL_12;
    case 7:
      v7 = 0;
      v11 = &stru_1E41B97C0;
      v9 = CFSTR("xrOSRepositories/");
LABEL_12:
      v13 = CFSTR("Dark");
      if (((a4 != 1) & v10) != 0)
        v13 = CFSTR("Light");
      if (a6 == 1)
      {
        a6 = v7;
      }
      else if (a6 == 2)
      {
        if (v7)
          a6 = 2;
        else
          a6 = 0;
      }
      if (a6 == 2)
        v8 = CFSTR("FauxVibrant");
      if (a6 == 1)
        v8 = CFSTR("Vibrant");
      if (((a5 == 1) & v10) != 0)
        v14 = CFSTR("IncreasedContrast");
      else
        v14 = CFSTR("Standard");
      result = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@%@%@.car"), v11, v9, v13, v8, v14);
      break;
    default:
      if (a7)
        *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("CUIDesignLibraryCatalog does not recognize the requested design system."), a4, a5, a6, NSLocalizedDescriptionKey, 0));
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

+ (id)_bundleNameForResolvedDesignSystem:(int64_t)a3
{
  id result;

  result = CFSTR("DesignLibrary-iOS.bundle");
  if ((unint64_t)(a3 - 1) >= 4 && a3 != 7)
  {
    if (a3)
    {
      return CFSTR("DesignLibrary-macOS.bundle");
    }
    else
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CUIDesignLibraryCatalog.m"), 235, CFSTR("Can't use CUIDesignSystemAutomatic to find the bundle. Must resolve first by calling __resolvedDesignSystemForInputSystem."));
      return 0;
    }
  }
  return result;
}

void __85__CUIDesignLibraryCatalog_catalogForDesignSystem_colorScheme_contrast_styling_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  __catalogCache = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
  __coreUIBundleResoucePath = -[NSBundle resourcePath](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CUIDesignLibraryCatalog, v9)), "resourcePath");
  if (!__coreUIBundleResoucePath)
    _CUILog(4, (uint64_t)"CoreUI: -[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:] Couldn't locate CoreUIBundle", v10, v11, v12, v13, v14, v15, a9);
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CUIDesignLibraryCatalog %p:%@>"), self, objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, a2), "debugDescription"));
}

- (void)dealloc
{
  uint64_t v3;
  id (*colorCache)[28][4];
  uint64_t v5;
  id (*v6)[28][4];
  uint64_t i;
  CFNullRef v8;
  objc_super v9;

  v3 = 0;
  colorCache = self->_colorCache;
  do
  {
    v5 = 0;
    v6 = colorCache;
    do
    {
      for (i = 0; i != 4; ++i)
      {
        v8 = (CFNullRef)(*v6)[0][i];
        if (v8 != kCFNull)

        (*v6)[0][i] = 0;
      }
      ++v5;
      v6 = (id (*)[28][4])((char *)v6 + 32);
    }
    while (v5 != 28);
    ++v3;
    ++colorCache;
  }
  while (v3 != 5);
  v9.receiver = self;
  v9.super_class = (Class)CUIDesignLibraryCatalog;
  -[CUIDesignLibraryCatalog dealloc](&v9, sel_dealloc);
}

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7
{
  os_unfair_lock_s *p_lock;
  char *v13;
  const __CFNull *v14;
  CFNullRef *v15;
  const __CFNull *v16;
  CUIDesignColor *v17;
  id v18;
  uint64_t v19;
  CFStringRef *v20;
  unsigned int v21;
  CGColor *ConstantColor;
  id v23;
  CGColorSpace *GrayGamma2_2;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  double v30;
  BOOL v31;
  double v32;
  CGFloat Alpha;
  CGColorRef CopyWithAlpha;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  CGFloat components;
  double v41;
  double v42;
  double v43;

  kdebug_trace(726663173, 21, a3, a4, a5);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = (char *)self + 896 * a4 + 32 * a3 + 8 * a6;
  v16 = (const __CFNull *)*((_QWORD *)v13 + 3);
  v15 = (CFNullRef *)(v13 + 24);
  v14 = v16;
  if (v16 == kCFNull)
  {
    v17 = 0;
    goto LABEL_54;
  }
  v17 = v14;
  if (v17)
  {
LABEL_54:
    os_unfair_lock_unlock(p_lock);
    if (v17)
      v37 = 0;
    else
      v37 = -1;
    kdebug_trace(726663174, 21, v37, 0, 0);
    return v17;
  }
  v18 = -[CUIDesignLibraryCatalog _colorNameStringFromNameEnum:palette:](self, "_colorNameStringFromNameEnum:palette:", a3, a4);
  v39 = 0;
  v38 = 0;
  if (a3 == 11)
  {
    v20 = (CFStringRef *)&kCGColorWhite;
    v21 = -1;
LABEL_8:
    v39 = v21;
    ConstantColor = CGColorGetConstantColor(*v20);
    CGColorRetain(ConstantColor);
    if (ConstantColor)
      goto LABEL_17;
    goto LABEL_12;
  }
  if (a3 == 12)
  {
    v20 = (CFStringRef *)&kCGColorBlack;
    v21 = -16777216;
    goto LABEL_8;
  }
  v23 = v18;
  if (objc_msgSend((id)_LookupStructuredThemeProvider(self->_storageRef, v19), "getPhysicalColor:withName:", &v38, v18))
  {
    v21 = v39;
LABEL_12:
    if (BYTE2(v21) == BYTE1(v21) && BYTE1(v21) == v21)
    {
      components = (double)BYTE2(v21) / 255.0;
      v41 = (double)HIBYTE(v21) / 255.0;
      GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetGrayGamma2_2();
    }
    else
    {
      components = (double)BYTE2(v21) / 255.0;
      v41 = (double)BYTE1(v21) / 255.0;
      v42 = (double)v21 / 255.0;
      v43 = (double)HIBYTE(v21) / 255.0;
      GrayGamma2_2 = (CGColorSpace *)_CUIColorSpaceGetSRGB();
    }
    ConstantColor = CGColorCreate(GrayGamma2_2, &components);
LABEL_17:
    v25 = -[CUIDesignLibraryCatalog colorScheme](self, "colorScheme");
    v26 = -[CUIDesignLibraryCatalog styling](self, "styling");
    v27 = 0;
    if ((unint64_t)(a3 - 13) <= 0xFFFFFFFFFFFFFFFDLL && v26 == 1)
    {
      if (v25 == 1)
        v28 = 27;
      else
        v28 = 0;
      if (!v25)
        v28 = 26;
      if (BYTE2(v39) == v39)
        v29 = v28;
      else
        v29 = 0;
      if (BYTE2(v39) != BYTE1(v39))
        v29 = 0;
      if (HIBYTE(v39) == 255)
        v27 = v29;
      else
        v27 = 0;
    }
    if ((unint64_t)(a6 - 1) > 2 || !ConstantColor)
      goto LABEL_53;
    v30 = colorWithName_palette_displayGamut_hierarchyLevel_error__CUIHierarchicalColorOpacities[a6];
    if (v25 == 1)
    {
      v31 = (a3 == 10 || a3 == 0) && a6 == 2;
      v32 = 0.2;
    }
    else
    {
      if (v25)
      {
LABEL_52:
        Alpha = CGColorGetAlpha(ConstantColor);
        CopyWithAlpha = CGColorCreateCopyWithAlpha(ConstantColor, v30 * Alpha);
        CGColorRelease(ConstantColor);
        ConstantColor = CopyWithAlpha;
LABEL_53:
        v17 = -[CUIDesignColor initWithColor:blendMode:displayGamut:]([CUIDesignColor alloc], "initWithColor:blendMode:displayGamut:", ConstantColor, v27, 0);
        CGColorRelease(ConstantColor);
        *v15 = (CFNullRef)v17;
        goto LABEL_54;
      }
      v31 = a6 == 1 && a3 == 2;
      v32 = 0.3;
    }
    if (v31)
      v30 = v32;
    goto LABEL_52;
  }
  if (a7)
    *a7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The requested color, %@, could not be found in the %@ CUIDesignLibrary catalog."), v23, self->_assetStoreName), NSLocalizedDescriptionKey, 0));
  *v15 = kCFNull;
  os_unfair_lock_unlock(&self->_lock);
  kdebug_trace(726663174, 21, -1, 0, 0);
  return 0;
}

- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4
{
  void *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  CUIRenditionKey *v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = (void *)_LookupStructuredThemeProvider(self->_storageRef, a2);
  v8 = (unsigned __int16 *)objc_msgSend(v7, "renditionKeyForName:", a3);
  _CUILog(3, (uint64_t)"-[CUIDesignLibraryCatalog shapeEffectPresetWithName:%@ error:]", v9, v10, v11, v12, v13, v14, (uint64_t)a3);
  v15 = CUIRenditionKeyValueForAttribute(v8, 17);
  kdebug_trace(726663173, 22, v15, 0, 0);
  if (!v8)
    goto LABEL_5;
  v16 = +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", v8);
  -[CUIRenditionKey setThemeScale:](v16, "setThemeScale:", 1);
  -[CUIRenditionKey setThemeState:](v16, "setThemeState:", 0);
  -[CUIRenditionKey setThemePresentationState:](v16, "setThemePresentationState:", 0);
  -[CUIRenditionKey setThemeValue:](v16, "setThemeValue:", 0);
  -[CUIRenditionKey setThemeDimension1:](v16, "setThemeDimension1:", 0);
  -[CUIRenditionKey setThemeAppearance:](v16, "setThemeAppearance:", 0);
  v17 = objc_msgSend(v7, "renditionWithKey:", -[CUIRenditionKey keyList](v16, "keyList"));
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "type") == (id)7)
    {
      v18 = objc_msgSend(v18, "effectPreset");
      goto LABEL_6;
    }
LABEL_5:
    v18 = 0;
  }
LABEL_6:
  v19 = 0;
  if (a4 && !v18)
  {
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 260, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The requested effect preset, %@, could not be found in the %@ CUIDesignLibrary catalog."), a3, self->_assetStoreName), NSLocalizedDescriptionKey, 0));
    v19 = -1;
  }
  kdebug_trace(726663174, 22, v19, 0, 0);
  return v18;
}

- (int64_t)designSystem
{
  return self->_designSystem;
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (int64_t)contrast
{
  return self->_contrast;
}

@end
