@implementation CMISRLHumanFace

- (CMISRLHumanFace)initWithFaceObject:(id)a3
{
  id v4;
  CMISRLHumanFace *v5;
  uint64_t v6;
  NSDictionary *faceMetadata;
  void *v8;
  const __CFDictionary *v9;
  _BOOL4 v10;
  double width;
  float v12;
  void *v13;
  uint64_t i;
  void *v15;
  char *v16;
  int v17;
  float v18;
  CMISRLHumanFace *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CMISRLHumanFace;
  v5 = -[CMISRLHumanFace init](&v21, sel_init);
  v6 = objc_msgSend(v4, "copy");
  faceMetadata = v5->_faceMetadata;
  v5->_faceMetadata = (NSDictionary *)v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06A48]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_FaceID = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D084A0]);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v10 = CGRectMakeWithDictionaryRepresentation(v9, &v5->_Rect);

  if (v10)
  {
    width = v5->_Rect.size.width;
    if (width < v5->_Rect.size.height)
      width = v5->_Rect.size.height;
    v12 = width;
    v5->_RectLargestSide = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E30]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 6; ++i)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      v16 = (char *)v5 + 4 * i;
      *((_DWORD *)v16 + 5) = v17;

      *((_DWORD *)v16 + 11) = *((_DWORD *)v16 + 5);
    }
    +[CMISRLHumanFace mappedSkinToneLevel:](CMISRLHumanFace, "mappedSkinToneLevel:", v5->_SkinToneLevels);
    v5->_SkinToneLevelMapped = v18;
    v19 = v5;

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (float)SkinToneLevelMapped
{
  return self->_SkinToneLevelMapped;
}

- (float)SkinToneLevels
{
  return self->_SkinToneLevels;
}

- (float)FilteredSkinToneLevels
{
  return self->_FilteredSkinToneLevels;
}

- (void)setFilteredSkinToneLevels:(float *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3;
  *(_QWORD *)&self->_FilteredSkinToneLevels[4] = *((_QWORD *)a3 + 2);
  *(_OWORD *)self->_FilteredSkinToneLevels = v3;
}

- (BOOL)areSkinToneLevelsEqualTo:(id)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend(a3, "SkinToneLevels");
  return *(_QWORD *)self->_SkinToneLevels == *v4
      && *(_QWORD *)&self->_SkinToneLevels[2] == v4[1]
      && *(_QWORD *)&self->_SkinToneLevels[4] == v4[2];
}

+ (float)mappedSkinToneLevel:(float *)a3
{
  uint64_t v3;
  float v4;
  float result;
  uint64_t i;

  v3 = 0;
  v4 = 0.0;
  do
    v4 = v4 + a3[v3++];
  while (v3 != 6);
  result = 0.0;
  if (v4 != 0.0)
  {
    for (i = 0; i != 6; ++i)
      result = result + (float)((float)(i + 1) * (float)(a3[i] / v4));
  }
  return result;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  double v5;
  uint64_t v6;
  float *FilteredSkinToneLevels;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_faceMetadata);
  v4 = (void *)objc_opt_new();
  v6 = 0;
  FilteredSkinToneLevels = self->_FilteredSkinToneLevels;
  do
  {
    *(float *)&v5 = FilteredSkinToneLevels[v6];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    ++v6;
  }
  while (v6 != 6);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D06E30]);

  return v3;
}

- (unint64_t)FaceID
{
  return self->_FaceID;
}

- (CGRect)Rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_Rect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)RectLargestSide
{
  return self->_RectLargestSide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceMetadata, 0);
}

@end
