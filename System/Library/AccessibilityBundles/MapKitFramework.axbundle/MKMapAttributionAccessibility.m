@implementation MKMapAttributionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKMapAttribution");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapAttribution"), CFSTR("initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:"), "@", "@", "@", "B", "B", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapAttribution"), CFSTR("_string"), "NSAttributedString");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOAttribution"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOAttribution"), CFSTR("logo"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("GEOResourceManifestManager"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("GEOResourceManifestManager"), CFSTR("modernManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOResourceManifestManager"), CFSTR("activeTileGroup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GEOActiveTileGroup"), CFSTR("attributions"), "@", 0);

}

- (MKMapAttributionAccessibility)initWithStringAttributes:(id)a3 regionalAttributions:(id)a4 underlineText:(BOOL)a5 applyLinkAttribution:(BOOL)a6 scale:(double)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  MKMapAttributionAccessibility *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  int v29;
  unint64_t v31;
  uint64_t v32;
  objc_super v33;

  v8 = a6;
  v9 = a5;
  v12 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MKMapAttributionAccessibility;
  v13 = -[MKMapAttributionAccessibility initWithStringAttributes:regionalAttributions:underlineText:applyLinkAttribution:scale:](&v33, sel_initWithStringAttributes_regionalAttributions_underlineText_applyLinkAttribution_scale_, a3, v12, v9, v8, a7);
  if (!objc_msgSend(v12, "count")
    || (objc_msgSend(v12, "objectAtIndex:", 0), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("GEOResourceManifestManager")), "safeValueForKey:", CFSTR("modernManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeValueForKey:", CFSTR("activeTileGroup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeArrayForKey:", CFSTR("attributions"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MKMapAttributionAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("_string"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = 0;
  v19 = objc_msgSend(v18, "length");
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *MEMORY[0x24BDF65C0];
    while (1)
    {
      objc_msgSend(v18, "attributesAtIndex:effectiveRange:", v21, &v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      objc_msgSend(v23, "objectForKey:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v25, "image");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "safeValueForKey:", CFSTR("name"));
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(v14, "safeValueForKey:", CFSTR("logo"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "hasPrefix:", CFSTR("tomtom"));

            if (v29)
              v27 = CFSTR("TomTom");
            else
              v27 = 0;
          }
          objc_msgSend(v26, "setAccessibilityLabel:", v27);

          break;
        }
      }
      v31 += v32;

      v21 = v31;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL || v31 >= v20)
        goto LABEL_18;
    }

  }
LABEL_18:

  return v13;
}

@end
