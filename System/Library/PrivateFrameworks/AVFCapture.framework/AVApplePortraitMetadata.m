@implementation AVApplePortraitMetadata

- (AVApplePortraitMetadata)initWithPortraitMetadataDictionary:(id)a3
{
  AVApplePortraitMetadata *v4;
  AVApplePortraitMetadataInternal *v5;
  uint64_t v6;
  double v7;
  void *v8;
  uint64_t v9;
  const __CFDictionary *v11;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  CGRect v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVApplePortraitMetadata;
  v4 = -[AVApplePortraitMetadata init](&v23, sel_init);
  if (!v4 || !objc_msgSend(a3, "count"))
  {

    return 0;
  }
  v5 = objc_alloc_init(AVApplePortraitMetadataInternal);
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E48]), "intValue");
  if ((int)v6 < 1)
    goto LABEL_12;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03DF8]), "floatValue");
  -[AVApplePortraitMetadataInternal setApertureFocalRatio:](v5, "setApertureFocalRatio:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E18]), "floatValue");
  -[AVApplePortraitMetadataInternal setLuminanceNoiseAmplitude:](v5, "setLuminanceNoiseAmplitude:");
  -[AVApplePortraitMetadataInternal setFaceOrientation:](v5, "setFaceOrientation:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E08]), "intValue"));
  -[AVApplePortraitMetadataInternal setFaceObservationsData:](v5, "setFaceObservationsData:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E00]));
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E38]);
  v9 = objc_msgSend(v8, "count") == 2
     ? objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "unsignedIntegerValue"), objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "unsignedIntegerValue")): 0;
  -[AVApplePortraitMetadataInternal setIndexesOfShallowDepthOfFieldObservations:](v5, "setIndexesOfShallowDepthOfFieldObservations:", v9);
  v11 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E10]);
  __asm { FMOV            V0.2D, #0.5 }
  v22.origin = _Q0;
  v22.size.width = 0.0;
  v22.size.height = 0.0;
  CGRectMakeWithDictionaryRepresentation(v11, &v22);
  -[AVApplePortraitMetadataInternal setFocusRectangle:](v5, "setFocusRectangle:", *(_OWORD *)&v22.origin, v22.size.width, v22.size.height);
  if (v6 <= 3)
  {
LABEL_12:
    LODWORD(v7) = 0;
    -[AVApplePortraitMetadataInternal setMinimumApertureFocalRatio:](v5, "setMinimumApertureFocalRatio:", v7);
    LODWORD(v20) = 0;
    -[AVApplePortraitMetadataInternal setMaximumApertureFocalRatio:](v5, "setMaximumApertureFocalRatio:", v20);
    goto LABEL_13;
  }
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E28]), "floatValue");
  -[AVApplePortraitMetadataInternal setMinimumApertureFocalRatio:](v5, "setMinimumApertureFocalRatio:");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E20]), "floatValue");
  -[AVApplePortraitMetadataInternal setMaximumApertureFocalRatio:](v5, "setMaximumApertureFocalRatio:");
  if ((_DWORD)v6 == 4)
  {
LABEL_13:
    LODWORD(v17) = 2143289344;
    -[AVApplePortraitMetadataInternal setPortraitLightingEffectStrength:](v5, "setPortraitLightingEffectStrength:", v17);
    goto LABEL_14;
  }
  v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E30]);
  if (v18)
    objc_msgSend(v18, "floatValue");
  else
    LODWORD(v19) = 2143289344;
  -[AVApplePortraitMetadataInternal setPortraitLightingEffectStrength:](v5, "setPortraitLightingEffectStrength:", v19);
  if (v6 >= 6)
  {
    v21 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E40]), "intValue");
    goto LABEL_15;
  }
LABEL_14:
  v21 = 0;
LABEL_15:
  -[AVApplePortraitMetadataInternal setSDOFRenderingVersion:](v5, "setSDOFRenderingVersion:", v21);
  -[AVApplePortraitMetadataInternal setVersion:](v5, "setVersion:", v6);
  return -[AVApplePortraitMetadata initWithInternal:](v4, "initWithInternal:", v5);
}

- (AVApplePortraitMetadata)initWithInternal:(id)a3
{
  AVApplePortraitMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVApplePortraitMetadata;
  v4 = -[AVApplePortraitMetadata init](&v6, sel_init);
  if (v4)
    v4->_internal = (AVApplePortraitMetadataInternal *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVApplePortraitMetadata;
  -[AVApplePortraitMetadata dealloc](&v3, sel_dealloc);
}

- (AVApplePortraitMetadata)initWithCoder:(id)a3
{
  AVApplePortraitMetadataInternal *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v24;
  CGRect rect;

  v5 = objc_alloc_init(AVApplePortraitMetadataInternal);
  v6 = objc_msgSend(a3, "decodeIntForKey:", *MEMORY[0x1E0D03E48]);
  if ((int)v6 >= 1)
  {
    objc_msgSend(a3, "decodeFloatForKey:", *MEMORY[0x1E0D03DF8]);
    -[AVApplePortraitMetadataInternal setApertureFocalRatio:](v5, "setApertureFocalRatio:");
    v7 = *MEMORY[0x1E0D03E28];
    v8 = objc_msgSend(a3, "containsValueForKey:", *MEMORY[0x1E0D03E28]);
    v9 = 0;
    LODWORD(v10) = 0;
    if (v8)
      objc_msgSend(a3, "decodeFloatForKey:", v7, v10);
    -[AVApplePortraitMetadataInternal setMinimumApertureFocalRatio:](v5, "setMinimumApertureFocalRatio:", v10);
    v11 = *MEMORY[0x1E0D03E20];
    if (objc_msgSend(a3, "containsValueForKey:", *MEMORY[0x1E0D03E20]))
    {
      objc_msgSend(a3, "decodeFloatForKey:", v11);
      v9 = LODWORD(v12);
    }
    LODWORD(v12) = v9;
    -[AVApplePortraitMetadataInternal setMaximumApertureFocalRatio:](v5, "setMaximumApertureFocalRatio:", v12);
    v13 = *MEMORY[0x1E0D03E30];
    if (objc_msgSend(a3, "containsValueForKey:", *MEMORY[0x1E0D03E30]))
      objc_msgSend(a3, "decodeFloatForKey:", v13);
    else
      LODWORD(v14) = 2143289344;
    -[AVApplePortraitMetadataInternal setPortraitLightingEffectStrength:](v5, "setPortraitLightingEffectStrength:", v14);
    objc_msgSend(a3, "decodeFloatForKey:", *MEMORY[0x1E0D03E18]);
    -[AVApplePortraitMetadataInternal setLuminanceNoiseAmplitude:](v5, "setLuminanceNoiseAmplitude:");
    -[AVApplePortraitMetadataInternal setFaceOrientation:](v5, "setFaceOrientation:", objc_msgSend(a3, "decodeIntForKey:", *MEMORY[0x1E0D03E08]));
    -[AVApplePortraitMetadataInternal setFaceObservationsData:](v5, "setFaceObservationsData:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D03E00]));
    -[AVApplePortraitMetadataInternal setIndexesOfShallowDepthOfFieldObservations:](v5, "setIndexesOfShallowDepthOfFieldObservations:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D03E38]));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0), *MEMORY[0x1E0D03E10]);
    __asm { FMOV            V0.2D, #0.5 }
    rect.origin = _Q0;
    rect.size.width = 0.0;
    rect.size.height = 0.0;
    CGRectMakeWithDictionaryRepresentation(v18, &rect);
    -[AVApplePortraitMetadataInternal setFocusRectangle:](v5, "setFocusRectangle:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    if (v6 < 6)
      v24 = 0;
    else
      v24 = objc_msgSend(a3, "decodeIntForKey:", *MEMORY[0x1E0D03E40]);
    -[AVApplePortraitMetadataInternal setSDOFRenderingVersion:](v5, "setSDOFRenderingVersion:", v24);
  }
  -[AVApplePortraitMetadataInternal setVersion:](v5, "setVersion:", v6);
  return -[AVApplePortraitMetadata initWithInternal:](self, "initWithInternal:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSData *v7;
  NSIndexSet *v8;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v10;
  CGRect v11;

  v5 = -[AVApplePortraitMetadataInternal version](self->_internal, "version");
  objc_msgSend(a3, "encodeInt:forKey:", v5, *MEMORY[0x1E0D03E48]);
  -[AVApplePortraitMetadataInternal apertureFocalRatio](self->_internal, "apertureFocalRatio");
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E0D03DF8]);
  -[AVApplePortraitMetadataInternal minimumApertureFocalRatio](self->_internal, "minimumApertureFocalRatio");
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E0D03E28]);
  -[AVApplePortraitMetadataInternal maximumApertureFocalRatio](self->_internal, "maximumApertureFocalRatio");
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E0D03E20]);
  -[AVApplePortraitMetadataInternal portraitLightingEffectStrength](self->_internal, "portraitLightingEffectStrength");
  -[AVApplePortraitMetadataInternal portraitLightingEffectStrength](self->_internal, "portraitLightingEffectStrength");
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E0D03E30]);
  -[AVApplePortraitMetadataInternal luminanceNoiseAmplitude](self->_internal, "luminanceNoiseAmplitude");
  objc_msgSend(a3, "encodeFloat:forKey:", *MEMORY[0x1E0D03E18]);
  v6 = -[AVApplePortraitMetadataInternal faceOrientation](self->_internal, "faceOrientation");
  objc_msgSend(a3, "encodeInt:forKey:", v6, *MEMORY[0x1E0D03E08]);
  v7 = -[AVApplePortraitMetadataInternal faceObservationsData](self->_internal, "faceObservationsData");
  objc_msgSend(a3, "encodeObject:forKey:", v7, *MEMORY[0x1E0D03E00]);
  v8 = -[AVApplePortraitMetadataInternal indexesOfShallowDepthOfFieldObservations](self->_internal, "indexesOfShallowDepthOfFieldObservations");
  objc_msgSend(a3, "encodeObject:forKey:", v8, *MEMORY[0x1E0D03E38]);
  -[AVApplePortraitMetadataInternal focusRectangle](self->_internal, "focusRectangle");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v11);
  objc_msgSend(a3, "encodeObject:forKey:", DictionaryRepresentation, *MEMORY[0x1E0D03E10]);

  v10 = -[AVApplePortraitMetadataInternal SDOFRenderingVersion](self->_internal, "SDOFRenderingVersion");
  objc_msgSend(a3, "encodeInt:forKey:", v10, *MEMORY[0x1E0D03E40]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)apertureFocalRatio
{
  float result;

  -[AVApplePortraitMetadataInternal apertureFocalRatio](self->_internal, "apertureFocalRatio");
  return result;
}

- (float)minimumApertureFocalRatio
{
  float result;

  -[AVApplePortraitMetadataInternal minimumApertureFocalRatio](self->_internal, "minimumApertureFocalRatio");
  return result;
}

- (float)maximumApertureFocalRatio
{
  float result;

  -[AVApplePortraitMetadataInternal maximumApertureFocalRatio](self->_internal, "maximumApertureFocalRatio");
  return result;
}

- (float)portraitLightingEffectStrength
{
  float result;

  -[AVApplePortraitMetadataInternal portraitLightingEffectStrength](self->_internal, "portraitLightingEffectStrength");
  return result;
}

- (float)luminanceNoiseAmplitude
{
  float result;

  -[AVApplePortraitMetadataInternal luminanceNoiseAmplitude](self->_internal, "luminanceNoiseAmplitude");
  return result;
}

- (int)faceOrientation
{
  return -[AVApplePortraitMetadataInternal faceOrientation](self->_internal, "faceOrientation");
}

- (NSData)faceObservationsData
{
  return -[AVApplePortraitMetadataInternal faceObservationsData](self->_internal, "faceObservationsData");
}

- (NSIndexSet)indexesOfShallowDepthOfFieldObservations
{
  return -[AVApplePortraitMetadataInternal indexesOfShallowDepthOfFieldObservations](self->_internal, "indexesOfShallowDepthOfFieldObservations");
}

- (CGRect)focusRectangle
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[AVApplePortraitMetadataInternal focusRectangle](self->_internal, "focusRectangle");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unsigned)SDOFRenderingVersion
{
  return -[AVApplePortraitMetadataInternal SDOFRenderingVersion](self->_internal, "SDOFRenderingVersion");
}

@end
