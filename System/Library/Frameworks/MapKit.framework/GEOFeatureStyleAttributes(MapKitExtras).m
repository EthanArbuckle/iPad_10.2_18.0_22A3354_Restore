@implementation GEOFeatureStyleAttributes(MapKitExtras)

+ (id)annotationViewProvidedCustomFeatureStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 348, 65572, 1, 65567, 3, 0);
}

+ (id)styleAttributesForTrafficCameraType:()MapKitExtras isAboveThreshold:
{
  id v6;
  uint64_t v7;

  v6 = objc_alloc((Class)objc_opt_class());
  switch(a3)
  {
    case 1:
      if (a4)
        v7 = 1;
      else
        v7 = 2;
      break;
    case 2:
      v7 = 3;
      break;
    case 3:
      v7 = 4;
      break;
    case 4:
      v7 = 5;
      break;
    case 5:
      v7 = 6;
      break;
    case 6:
      v7 = 7;
      break;
    default:
      v7 = 0;
      break;
  }
  return (id)objc_msgSend(v6, "initWithAttributes:", 5, 3, 6, 248, 65602, v7, 0);
}

+ (id)styleAttributesForTrafficIncidentType:()MapKitExtras
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributes:", 5, 3, 6, 222, 65544, a3, 0);
}

+ (id)styleAttributesForRouteAnnotationWithAttributes:()MapKitExtras
{
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6[0] = 0x19C00000006;
  objc_msgSend(v4, "replaceAttributes:count:", v6, 1);

  return v4;
}

+ (id)styleAttributesForUnpickedFeatureWithAttributes:()MapKitExtras
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6 = 65573;
  objc_msgSend(v4, "replaceAttributes:count:", &v6, 1);

  return v4;
}

+ (id)styleAttributesForSearchResultWithAttributes:()MapKitExtras
{
  id v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6 = xmmword_18B2AFDE0;
  v7 = 0x100010024;
  objc_msgSend(v4, "replaceAttributes:count:", &v6, 3);

  return v4;
}

+ (id)styleAttributesForCalloutWithAttributes:()MapKitExtras
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6 = 0x100010025;
  objc_msgSend(v4, "replaceAttributes:count:", &v6, 1);

  return v4;
}

+ (id)styleAttributesForDraggingWithAttributes:()MapKitExtras
{
  id v3;
  void *v4;
  uint64_t v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v3, "featureStyleAttributes"));
  v6 = 0x100010043;
  objc_msgSend(v4, "replaceAttributes:count:", &v6, 1);

  return v4;
}

+ (id)markerStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 0);
}

+ (id)genericServiceStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 223, 0);
}

+ (id)trainStationStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, 24, 10, 0, 0);
}

+ (id)genericMarkerStyleAttributes
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 4, 226, 5, 3, 6, 348, 10, 0, 65572, 1, 65573, 0, 0);
}

+ (id)styleAttributesForTransitType:()MapKitExtras
{
  uint64_t v3;

  if (a3 > 0xB)
    v3 = 0;
  else
    v3 = dword_18B2AFD90[a3];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithAttributes:", 5, 3, 6, v3, 10, 0, 0);
}

- (id)styleAttributesWithElevatedGround:()MapKitExtras
{
  void *v4;
  _DWORD v6[2];

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(a1, "featureStyleAttributes"));
  v6[0] = 65617;
  v6[1] = a3;
  objc_msgSend(v4, "replaceAttributes:count:", v6, 1);
  return v4;
}

+ (id)styleAttributesForMapFeatureAttributes:()MapKitExtras elevatedGround:
{
  id v5;
  void *v6;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270A8]), "initWithStyleAttributes:", objc_msgSend(v5, "featureStyleAttributes"));
  v8 = 0x100010025;
  v9 = 65617;
  v10 = a4;
  v11 = 0x200010075;
  objc_msgSend(v6, "replaceAttributes:count:", &v8, 3);

  return v6;
}

@end
