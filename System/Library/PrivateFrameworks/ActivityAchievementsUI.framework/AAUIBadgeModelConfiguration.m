@implementation AAUIBadgeModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enamelTriColors, 0);
  objc_storeStrong((id *)&self->_modelEnamelColor, 0);
  objc_storeStrong((id *)&self->_metalColor, 0);
  objc_storeStrong((id *)&self->_shapeName, 0);
  objc_storeStrong((id *)&self->_glyphTexturePath, 0);
  objc_storeStrong((id *)&self->_badgeTexturePaths, 0);
  objc_storeStrong((id *)&self->_badgeModelPaths, 0);
}

- (NSArray)badgeTexturePaths
{
  return self->_badgeTexturePaths;
}

- (NSArray)badgeModelPaths
{
  return self->_badgeModelPaths;
}

- (BOOL)useFullColorEnamel
{
  return self->_useFullColorEnamel;
}

- (BOOL)unearnedUsesTwoToneEnamel
{
  return self->_unearnedUsesTwoToneEnamel;
}

- (UIColor)metalColor
{
  return self->_metalColor;
}

- (NSString)glyphTexturePath
{
  return self->_glyphTexturePath;
}

- (BOOL)faceHasMetalInlay
{
  return self->_faceHasMetalInlay;
}

- (NSArray)enamelTriColors
{
  return self->_enamelTriColors;
}

- (AAUIBadgeModelConfiguration)initWithModelPaths:(id)a3 texturePaths:(id)a4 shapeName:(id)a5 metalColor:(id)a6 useFullColorEnamel:(BOOL)a7 modelEnamelColor:(id)a8 unearnedUsesTwoToneEnamel:(BOOL)a9 faceHasMetalInlay:(BOOL)a10 enamelTricolors:(id)a11 glyphTexturePath:(id)a12 glyphTextureScale:(double)a13 glyphPositionOffset:(CGPoint)a14
{
  CGFloat y;
  CGFloat x;
  id v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  AAUIBadgeModelConfiguration *v32;
  uint64_t v33;
  NSArray *badgeModelPaths;
  id v36;
  id v37;
  id v38;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id obj;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  y = a14.y;
  x = a14.x;
  v55 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v36 = a4;
  v47 = a4;
  v37 = a5;
  v46 = a5;
  v38 = a6;
  v45 = a6;
  v40 = a8;
  v44 = a8;
  v43 = a11;
  v42 = a12;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "usesMetricSystem");

  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v21;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v51 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v29, "componentsSeparatedByString:", CFSTR("/"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v31, "containsString:", CFSTR("Kilometer")) & v23 & 1) != 0
          || (objc_msgSend(v31, "containsString:", CFSTR("Mile")) ^ 1 | v23) != 1
          || (objc_msgSend(v31, "containsString:", CFSTR("Mile")) & 1) == 0
          && (objc_msgSend(v31, "containsString:", CFSTR("Kilometer")) & 1) == 0)
        {
          objc_msgSend(v24, "addObject:", v29);
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v26);
  }

  v49.receiver = self;
  v49.super_class = (Class)AAUIBadgeModelConfiguration;
  v32 = -[AAUIBadgeModelConfiguration init](&v49, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v24, "copy");
    badgeModelPaths = v32->_badgeModelPaths;
    v32->_badgeModelPaths = (NSArray *)v33;

    objc_storeStrong((id *)&v32->_badgeTexturePaths, v36);
    objc_storeStrong((id *)&v32->_glyphTexturePath, a12);
    objc_storeStrong((id *)&v32->_shapeName, v37);
    objc_storeStrong((id *)&v32->_metalColor, v38);
    v32->_useFullColorEnamel = a7;
    objc_storeStrong((id *)&v32->_modelEnamelColor, v40);
    v32->_unearnedUsesTwoToneEnamel = a9;
    v32->_faceHasMetalInlay = a10;
    objc_storeStrong((id *)&v32->_enamelTriColors, a11);
    v32->_glyphTextureScale = a13;
    v32->_glyphPositionOffset.x = x;
    v32->_glyphPositionOffset.y = y;
  }

  return v32;
}

- (AAUIBadgeModelConfiguration)init
{

  return 0;
}

- (unint64_t)badgeShape
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AAUIBadgeModelConfiguration shapeName](self, "shapeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (AAUIBadgeShapeFromName_onceToken[0] != -1)
    dispatch_once(AAUIBadgeShapeFromName_onceToken, &__block_literal_global_3);
  objc_msgSend((id)AAUIBadgeShapeFromName_shapeNameMappings, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (void)setBadgeModelPaths:(id)a3
{
  objc_storeStrong((id *)&self->_badgeModelPaths, a3);
}

- (void)setBadgeTexturePaths:(id)a3
{
  objc_storeStrong((id *)&self->_badgeTexturePaths, a3);
}

- (void)setGlyphTexturePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)shapeName
{
  return self->_shapeName;
}

- (void)setShapeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setMetalColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)glyphTextureScale
{
  return self->_glyphTextureScale;
}

- (void)setGlyphTextureScale:(double)a3
{
  self->_glyphTextureScale = a3;
}

- (CGPoint)glyphPositionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_glyphPositionOffset.x;
  y = self->_glyphPositionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setGlyphPositionOffset:(CGPoint)a3
{
  self->_glyphPositionOffset = a3;
}

- (void)setUseFullColorEnamel:(BOOL)a3
{
  self->_useFullColorEnamel = a3;
}

- (UIColor)modelEnamelColor
{
  return self->_modelEnamelColor;
}

- (void)setModelEnamelColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setUnearnedUsesTwoToneEnamel:(BOOL)a3
{
  self->_unearnedUsesTwoToneEnamel = a3;
}

- (void)setFaceHasMetalInlay:(BOOL)a3
{
  self->_faceHasMetalInlay = a3;
}

- (void)setEnamelTriColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
