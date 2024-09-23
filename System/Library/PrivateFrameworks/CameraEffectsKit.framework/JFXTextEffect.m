@implementation JFXTextEffect

- (id)localizedDefaultText
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "localizedDefaultText");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("_DEFAULT_TEXT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD1488];
    v5 = v8;
    objc_msgSend(v9, "jfxBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v5, &stru_24EE5C428, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToString:", v5))
      v12 = 0;
    else
      v12 = v11;
    v6 = v12;

  }
  return v6;
}

- (id)localizedDefaultFontName
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "localizedDefaultFontName");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("_FONT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD1488];
    v5 = v8;
    objc_msgSend(v9, "jfxBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v5, &stru_24EE5C428, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isEqualToString:", v5))
      v12 = 0;
    else
      v12 = v11;
    v6 = v12;

  }
  return v6;
}

- (void)setupLocalizedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  a2->receiver = a1;
  a2->super_class = (Class)JFXTextEffect;
  -[objc_super description](a2, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_2269A9000, v5, v6, "The font for '%@-%@' is not localized.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_2();
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)JFXTextEffect;
  return -[JFXEffect copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)JFXTextEffect;
  if (-[JFXEffect isAppearanceEqual:forPurpose:](&v15, sel_isAppearanceEqual_forPurpose_, v6, a4))
  {
    v7 = *MEMORY[0x24BE796A8];
    -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE796A8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "parameterForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9 || objc_msgSend(v8, "isEqualToString:", v9))
    {
      v10 = *MEMORY[0x24BE796C8];
      -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE796C8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parameterForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
        v13 = 1;
      else
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)textEffectContentDataSource
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_25590B300);

    if (v6)
    {
      -[JFXEffect contentDataSource](self, "contentDataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)contentProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  objc_super v22;
  objc_super v23;

  -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v22.receiver = self;
    v22.super_class = (Class)JFXTextEffect;
    -[JFXEffect contentProperties](&v22, sel_contentProperties);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedDefaultText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "localizedDefaultText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("localizedDefaultText"));

    }
    objc_msgSend(v3, "localizedDefaultFontName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "localizedDefaultFontName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("localizedDefaultFontName"));

    }
    objc_msgSend(v3, "renderTextWithMotionWhenEditing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "renderTextWithMotionWhenEditing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("renderTextWithMotionWhenEditing"));

    }
    objc_msgSend(v3, "textEditColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "textEditColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("textEditColor"));

    }
    objc_msgSend(v3, "textEditSelectionTintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "textEditSelectionTintColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("textEditSelectionTintColor"));

    }
    objc_msgSend(v3, "maxCharacters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "maxCharacters");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("maxCharacters"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isTextBakedIn"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("isTextBakedIn"));

    if (v5)
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
      v20 = v5;

      v6 = v20;
    }

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)JFXTextEffect;
    -[JFXEffect contentProperties](&v23, sel_contentProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)strings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE796A8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE796C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = v6;
  v7 = (_QWORD *)MEMORY[0x24BE796A8];
  if (a4)
    v7 = (_QWORD *)MEMORY[0x24BE796C8];
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v6, *v7);
  if (objc_msgSend(v10, "length"))
    v8 = objc_msgSend(v10, "isEqualToString:", CFSTR(" "));
  else
    v8 = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v9, *MEMORY[0x24BE79680]);

}

- (void)enableDynamicLineSpacingForDiacritics:(BOOL)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x24BE795D8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v5, v4);

}

- (void)setFont:(id)a3 atIndex:(unint64_t)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x24BE79690];
  if (a4)
    v4 = (_QWORD *)MEMORY[0x24BE796B0];
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", a3, *v4);
}

- (void)setFontSize:(float)a3 atIndex:(unint64_t)a4
{
  id *v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = (id *)MEMORY[0x24BE796A0];
  if (a4)
    v6 = (id *)MEMORY[0x24BE796C0];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *v6;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v10, v8);

}

- (void)setFontScale:(float)a3 atIndex:(unint64_t)a4
{
  id *v6;
  void *v7;
  id v8;
  double v9;
  id v10;

  v6 = (id *)MEMORY[0x24BE79698];
  if (a4)
    v6 = (id *)MEMORY[0x24BE796B8];
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *v6;
  *(float *)&v9 = a3;
  objc_msgSend(v7, "numberWithFloat:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v10, v8);

}

- (id)defaultAttributedString:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[JFXEffect renderEffect](self, "renderEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAttributedString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultTypingAttributes:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[JFXEffect renderEffect](self, "renderEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultAttributedString:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesAtIndex:effectiveRange:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)textFramesAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  void *v7;
  void *v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v10 = *a3;
  +[JFXTextEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXTextEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", self, *(_QWORD *)&a7, &v10, a4, a5, 1, a6.size.width, a6.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textFrames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)textFrameAtIndex:(unint64_t)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8
{
  void *v9;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v12 = *a4;
  -[JFXTextEffect textFramesAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "textFramesAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v12, a5, a6, *(_QWORD *)&a8, a7.origin.x, a7.origin.y, a7.size.width, a7.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") <= a3)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (PVCGPointQuad)textCornersAtIndex:(SEL)a3 time:(unint64_t)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 relativeTo:(CGPoint)a8 basisOrigin:(CGRect)a9
{
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  void *v20;
  void *v21;
  PVCGPointQuad *result;
  CGPoint c;
  CGPoint b;
  CGPoint a;
  __int128 v26;
  int64_t var3;

  v10 = *(_QWORD *)&a10;
  v11 = a7;
  v12 = a6;
  height = a9.size.height;
  width = a9.size.width;
  y = a8.y;
  x = a8.x;
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  -[JFXEffect renderEffect](self, "renderEffect");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v26 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    objc_msgSend(v20, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v26, a4, v12, v11, v10, x, y, width, height);
  }
  else
  {
    retstr->c = 0u;
    retstr->d = 0u;
    retstr->a = 0u;
    retstr->b = 0u;
  }

  if ((_DWORD)v10 == 1)
  {
    c = retstr->c;
    a = retstr->a;
    b = retstr->b;
    retstr->a = retstr->d;
    retstr->b = c;
    retstr->c = b;
    retstr->d = a;
  }
  return result;
}

- (id)textBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 includeMasks:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  -[JFXEffect renderEffect](self, "renderEffect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *a3;
  objc_msgSend(v10, "textEditingBoundsAtTime:forcePosterFrame:useParagraphBounds:includeDropShadow:includeMasks:", &v13, v8, 1, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)textBounds:(CGRect *)a3 atIndex:(unint64_t)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6 includeDropShadow:(BOOL)a7 includeMasks:(BOOL)a8
{
  void *v10;
  unint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGSize v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19;

  v19 = *a5;
  -[JFXTextEffect textBoundsAtTime:forcePosterFrame:includeDropShadow:includeMasks:](self, "textBoundsAtTime:forcePosterFrame:includeDropShadow:includeMasks:", &v19, a6, a7, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 <= a4)
  {
    v17 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    a3->origin = (CGPoint)*MEMORY[0x24BDBF090];
    a3->size = v17;
  }
  else
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGRectValue");
    a3->origin.x = v13;
    a3->origin.y = v14;
    a3->size.width = v15;
    a3->size.height = v16;

  }
  return v11 > a4;
}

- (int64_t)textHitTest:(CGPoint)a3 time:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  CGFloat v12;
  CGFloat v13;
  void *v15;
  uint64_t v16;
  int64_t v17;
  PVCGPointQuad v19[2];
  CGPoint v20;

  v6 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3.y;
  v13 = a3.x;
  -[JFXTextEffect strings](self, "strings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 < 1)
    return -1;
  v17 = 0;
  while (1)
  {
    memset(&v19[1], 0, sizeof(PVCGPointQuad));
    v19[0].a = *(CGPoint *)&a4->var0;
    *(_QWORD *)&v19[0].b.x = a4->var3;
    -[JFXTextEffect textCornersAtIndex:time:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "textCornersAtIndex:time:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v17, v19, 0, 1, v6, 1.0, 1.0, x, y, width, height);
    v19[0] = v19[1];
    v20.x = v13;
    v20.y = v12;
    if ((pv_is_CGPoint_in_quad(v20, v19) & 1) != 0)
      break;
    if (v16 == ++v17)
      return -1;
  }
  return v17;
}

- (void)beginTextEditing
{
  id v2;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginTextEditing");

}

- (void)endTextEditing
{
  id v2;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTextEditing");

}

- (unint64_t)maxCharacters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -1;
  -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "maxCharacters"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (BOOL)textBakedIn
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "isTextBakedIn");
    else
      v6 = 1;
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && (objc_msgSend(v8, "objectForKey:", kJFXEffectPropertiesTextEditDisableTextEditing),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      v6 = objc_msgSend(v9, "BOOLValue");

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)customTextEditColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXTextEffect textEffectContentDataSource](self, "textEffectContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textEditColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    return v5;
  }
  -[JFXEffect effectID](self, "effectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[JFXEffectEditingUtilities shouldRenderTextWithMotionWhileEditingTextForEffectID:](JFXEffectEditingUtilities, "shouldRenderTextWithMotionWhileEditingTextForEffectID:", v6);

  if (!v7)
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", kJFXEffectPropertiesTextEditColorKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") >= 3)
      {
        v11 = (void *)MEMORY[0x24BDF6950];
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;
        objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;
        objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v11, "colorWithRed:green:blue:alpha:", v14, v17, v19, 1.0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (UIColor)customTextEditTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  float v18;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textEffectContentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textEditSelectionTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", kJFXEffectPropertiesTextEditTintColorKey);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = (void *)MEMORY[0x24BDF6950];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "floatValue");
        v13 = v12;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "floatValue");
        v16 = v15;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "floatValue");
        objc_msgSend(v10, "colorWithRed:green:blue:alpha:", v13, v16, v18, 1.0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return (UIColor *)v6;
}

- (id)editUIProperties
{
  if (editUIProperties_onceToken != -1)
    dispatch_once(&editUIProperties_onceToken, &__block_literal_global_17);
  return (id)editUIProperties_finalDict;
}

void __33__JFXTextEffect_editUIProperties__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2 = (void *)editUIProperties_finalDict;
  editUIProperties_finalDict = (uint64_t)v1;

  v3 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v0, "pathForResource:ofType:", kJFXEffectPropertiesResourceFile, kJFXEffectPropertiesPlistKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v18 = v0;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v5, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v37;
      v21 = v5;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(obj);
          v23 = v6;
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v6));
          v24 = (id)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            if (v26)
            {
              v25 = *(_QWORD *)v33;
              do
              {
                v7 = 0;
                do
                {
                  if (*(_QWORD *)v33 != v25)
                    objc_enumerationMutation(v24);
                  v27 = v7;
                  objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v7), "objectForKeyedSubscript:", kJFXEffectPropertiesEffectsKey);
                  v8 = (void *)objc_claimAutoreleasedReturnValue();
                  v9 = v8;
                  if (v8)
                  {
                    v30 = 0u;
                    v31 = 0u;
                    v28 = 0u;
                    v29 = 0u;
                    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                    if (v10)
                    {
                      v11 = v10;
                      v12 = *(_QWORD *)v29;
                      do
                      {
                        for (i = 0; i != v11; ++i)
                        {
                          if (*(_QWORD *)v29 != v12)
                            objc_enumerationMutation(v9);
                          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
                          objc_msgSend(v14, "objectForKeyedSubscript:", kJFXEffectPropertiesIdentifierKey);
                          v15 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v15)
                          {
                            v16 = (void *)editUIProperties_finalDict;
                            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v14);
                            v17 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v16, "setValue:forKey:", v17, v15);

                          }
                        }
                        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
                      }
                      while (v11);
                    }
                  }

                  v7 = v27 + 1;
                }
                while (v27 + 1 != v26);
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
              }
              while (v26);
            }
          }

          v6 = v23 + 1;
          v5 = v21;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v22);
    }

    v0 = v18;
  }

}

- (unint64_t)indexOfTextObjectUsedForEditViewTransform
{
  return 0;
}

@end
