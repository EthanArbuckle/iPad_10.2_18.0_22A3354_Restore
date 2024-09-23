@implementation JFXEffectTextEditingProperties

+ (id)textEditingPropertiesWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;

  v8 = a8;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc((Class)a1);
  v22 = *a6;
  v20 = (void *)objc_msgSend(v19, "initWithTextEffect:withText:relativeTo:atTime:index:moveBeforeScalingToAvoidKeyboard:", v18, v17, &v22, a7, v8, x, y, width, height);

  return v20;
}

- (JFXEffectTextEditingProperties)initWithTextEffect:(id)a3 withText:(id)a4 relativeTo:(CGRect)a5 atTime:(id *)a6 index:(unint64_t)a7 moveBeforeScalingToAvoidKeyboard:(BOOL)a8
{
  _BOOL8 v8;
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  JFXEffectTextEditingProperties *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  JFXEffectTextEditingProperties *v34;
  objc_super v36;
  __int128 v37;
  int64_t var3;

  v8 = a8;
  height = a5.size.height;
  width = a5.size.width;
  v15 = a3;
  v16 = a4;
  objc_msgSend(v15, "strings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count") <= a7)
  {
    v34 = 0;
  }
  else
  {
    v37 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    +[JFXTextEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXTextEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v15, 1, &v37, 0, 0, 1, width, height);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textFrames");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20 <= a7)
    {
      v34 = 0;
    }
    else
    {
      v36.receiver = self;
      v36.super_class = (Class)JFXEffectTextEditingProperties;
      v21 = -[JFXEffectTextEditingProperties init](&v36, sel_init);
      if (v21)
      {
        objc_msgSend(v15, "effectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffectTextEditingProperties setIsSpecialCaseForGameOverPoster:](v21, "setIsSpecialCaseForGameOverPoster:", objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BE79528]));

        v23 = *MEMORY[0x24BDBF070];
        v24 = *(double *)(MEMORY[0x24BDBF070] + 8);
        v25 = *(double *)(MEMORY[0x24BDBF070] + 16);
        v26 = *(double *)(MEMORY[0x24BDBF070] + 24);
        -[JFXEffectTextEditingProperties setCachedFrame:](v21, "setCachedFrame:", *MEMORY[0x24BDBF070], v24, v25, v26);
        -[JFXEffectTextEditingProperties setCachedBounds:](v21, "setCachedBounds:", v23, v24, v25, v26);
        -[JFXEffectTextEditingProperties setMoveBeforeScalingToAvoidKeyboard:](v21, "setMoveBeforeScalingToAvoidKeyboard:", v8);
        -[JFXEffectTextEditingProperties JFX_configureWithEffect:](v21, "JFX_configureWithEffect:", v15);
        v27 = objc_msgSend(v15, "indexOfTextObjectUsedForEditViewTransform");
        objc_msgSend(v18, "textFrames");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffectTextEditingProperties setEffectFrame:](v21, "setEffectFrame:", v29);

        objc_msgSend(v17, "objectAtIndexedSubscript:", a7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffectTextEditingProperties JFX_configureWithAttributedString:text:](v21, "JFX_configureWithAttributedString:text:", v30, v16);

        objc_msgSend(v15, "defaultTypingAttributes:", a7);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffectTextEditingProperties JFX_configureWithDefaultTypingAttributes:](v21, "JFX_configureWithDefaultTypingAttributes:", v31);

        v32 = (void *)MEMORY[0x24BE79010];
        -[JFXEffectTextEditingProperties defaultTypingAttributes](v21, "defaultTypingAttributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[JFXEffectTextEditingProperties setIsAllCaps:](v21, "setIsAllCaps:", objc_msgSend(v32, "isAllCapsFromAttributes:", v33));

      }
      self = v21;
      v34 = self;
    }

  }
  return v34;
}

- (void)JFX_configureWithEffect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties setUseFullTransform:](self, "setUseFullTransform:", +[JFXEffectEditingUtilities shouldUseFullTransformWhileEditingTextForEffectID:](JFXEffectEditingUtilities, "shouldUseFullTransformWhileEditingTextForEffectID:", v4));

  objc_msgSend(v10, "customTextEditColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties setCustomTextColor:](self, "setCustomTextColor:", v5);

  objc_msgSend(v10, "customTextEditTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties setCustomTextEditTintColor:](self, "setCustomTextEditTintColor:", v6);

  objc_msgSend(v10, "effectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties setOutlineDisabled:](self, "setOutlineDisabled:", +[JFXEffectEditingUtilities shouldDisableTextOutlineWhileEditingTextForEffectID:](JFXEffectEditingUtilities, "shouldDisableTextOutlineWhileEditingTextForEffectID:", v7));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v10;
    -[JFXEffectTextEditingProperties setIsEmoji:](self, "setIsEmoji:", objc_msgSend(v8, "isEmoji"));
    v9 = objc_msgSend(v8, "isTextFlipped");

    -[JFXEffectTextEditingProperties setIsTextFlipped:](self, "setIsTextFlipped:", v9);
  }
  else
  {
    -[JFXEffectTextEditingProperties setIsEmoji:](self, "setIsEmoji:", 0);
  }

}

- (void)JFX_configureWithAttributedString:(id)a3 text:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v6 && objc_msgSend(v13, "length"))
  {
    v7 = objc_msgSend(v6, "length");
    v8 = objc_msgSend(v13, "length");
    if (v7 >= v8)
      v9 = v8;
    else
      v9 = v7;
    objc_msgSend(v13, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v6, v10);

  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v13);
  }
  objc_msgSend(MEMORY[0x24BE79010], "baselineOffsetFromAttributedString:", v11);
  -[JFXEffectTextEditingProperties setBaselineYOffset:](self, "setBaselineYOffset:");
  -[JFXEffectTextEditingProperties JFX_modifyAttributedString:](self, "JFX_modifyAttributedString:", v11);
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v11, "attribute:atIndex:effectiveRange:", CFSTR("TXNumSoftLines"), 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectTextEditingProperties setNumberOfLines:](self, "setNumberOfLines:", objc_msgSend(v12, "unsignedIntegerValue"));

  }
  else
  {
    -[JFXEffectTextEditingProperties setNumberOfLines:](self, "setNumberOfLines:", 1);
  }
  -[JFXEffectTextEditingProperties setAttributedText:](self, "setAttributedText:", v11);

}

- (void)JFX_configureWithDefaultTypingAttributes:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x24BDD1688];
  v5 = a3;
  v10 = (id)objc_msgSend([v4 alloc], "initWithString:attributes:", CFSTR(" "), v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXEffectTextEditingProperties setDefaultTextColor:](self, "setDefaultTextColor:", v6);
  -[JFXEffectTextEditingProperties JFX_modifyAttributedString:](self, "JFX_modifyAttributedString:", v10);
  objc_msgSend(v10, "attributesAtIndex:effectiveRange:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties setDefaultTypingAttributes:](self, "setDefaultTypingAttributes:", v7);

  -[JFXEffectTextEditingProperties defaultTypingAttributes](self, "defaultTypingAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXEffectTextEditingProperties setTextAlignment:](self, "setTextAlignment:", objc_msgSend(v9, "alignment"));
}

- (void)JFX_modifyAttributedString:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v9, "size");
    v5 = v4;
    v7 = v6;
    objc_msgSend(v9, "beginEditing");
    -[JFXEffectTextEditingProperties JFX_modifyRangesOfAttributedString:isOutlineDisabled:](self, "JFX_modifyRangesOfAttributedString:isOutlineDisabled:", v9, -[JFXEffectTextEditingProperties isOutlineDisabled](self, "isOutlineDisabled"));
    -[JFXEffectTextEditingProperties customTextColor](self, "customTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectTextEditingProperties JFX_modifyEntireAttributedString:forTargetSize:fontColor:](self, "JFX_modifyEntireAttributedString:forTargetSize:fontColor:", v9, v8, v5, v7);

    objc_msgSend(v9, "endEditing");
  }

}

- (void)JFX_modifyRangesOfAttributedString:(id)a3 isOutlineDisabled:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;
  BOOL v16;

  v11 = a3;
  if (objc_msgSend(v11, "length"))
  {
    v6 = 1.0;
    v7 = 1.0;
    if (!-[JFXEffectTextEditingProperties useFullTransform](self, "useFullTransform"))
    {
      -[JFXEffectTextEditingProperties scale](self, "scale");
      v6 = v8;
      v7 = v9;
    }
    v10 = objc_msgSend(v11, "length");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__JFXEffectTextEditingProperties_JFX_modifyRangesOfAttributedString_isOutlineDisabled___block_invoke;
    v12[3] = &unk_24EE5A980;
    v13 = v11;
    v14 = v6;
    v15 = v7;
    v16 = a4;
    objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v12);

  }
}

void __87__JFXEffectTextEditingProperties_JFX_modifyRangesOfAttributedString_isOutlineDisabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByApplyingSubstituteFont:attributes:range:", *(_QWORD *)(a1 + 32), v7, a3, a4);
  objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByAdjustingKerning:attributes:range:scale:", *(_QWORD *)(a1 + 32), v7, a3, a4, *(double *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x24BDF66A0], a3, a4);
  else
    objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByAdjustingOutline:attributes:range:scale:", *(_QWORD *)(a1 + 32), v7, a3, a4, *(double *)(a1 + 40));

}

- (void)JFX_modifyEntireAttributedString:(id)a3 forTargetSize:(CGSize)a4 fontColor:(id)a5
{
  double height;
  double width;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  height = a4.height;
  width = a4.width;
  v20 = a3;
  v9 = a5;
  if (objc_msgSend(v20, "length"))
  {
    v10 = 1.0;
    v11 = 1.0;
    if (!-[JFXEffectTextEditingProperties useFullTransform](self, "useFullTransform"))
    {
      -[JFXEffectTextEditingProperties scale](self, "scale");
      v10 = v12;
      v11 = v13;
    }
    v14 = -[JFXEffectTextEditingProperties isSpecialCaseForGameOverPoster](self, "isSpecialCaseForGameOverPoster");
    v15 = v10 * 0.73;
    if (v14)
    {
      v11 = v11 * 0.73;
      v10 = v10 * 0.73;
    }
    objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByAdjustingFontSize:scale:", v20, v10, v15);
    objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x24BDF65D8], 0, objc_msgSend(v20, "length"));
    objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByAdjustingForNegativeLineSpacing:scale:", v20, v10);
    v16 = (void *)MEMORY[0x24BE79010];
    -[JFXEffectTextEditingProperties rotation](self, "rotation");
    objc_msgSend(v16, "modifyAttributedStringByAdjustingShadow:scale:rotation:", v20, v10, v17);
    if (v9)
    {
      v18 = objc_msgSend(v20, "length");
      v19 = *MEMORY[0x24BDF6600];
      objc_msgSend(v20, "removeAttribute:range:", *MEMORY[0x24BDF6600], 0, v18);
      objc_msgSend(v20, "addAttribute:value:range:", v19, v9, 0, v18);
    }
    if (!-[JFXEffectTextEditingProperties isSpecialCaseForGameOverPoster](self, "isSpecialCaseForGameOverPoster"))
      objc_msgSend(MEMORY[0x24BE79010], "modifyAttributedStringByAdjustingFont:toFitSize:", v20, width * v10, height * v11);
  }

}

- (CGRect)frame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD *v19;
  uint64_t v20;
  CGPoint v21;
  CGPoint v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t, double, double);
  void *v33;
  uint64_t *v34;
  CGAffineTransform v35;
  PVCGPointQuad v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CGAffineTransform v45;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  CGAffineTransform v49;
  PVCGPointQuad v50;
  CGRect v51;
  CGRect result;

  -[JFXEffectTextEditingProperties cachedFrame](self, "cachedFrame");
  if (CGRectIsNull(v51))
  {
    -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "center");
    v5 = v4;
    v7 = v6;

    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeTranslation(&t1, -v5, -v7);
    -[JFXEffectTextEditingProperties rotation](self, "rotation");
    CGAffineTransformMakeRotation(&t2, -(v8 + -3.14159265));
    CGAffineTransformConcat(&v48, &t1, &t2);
    CGAffineTransformMakeTranslation(&v45, v5, v7);
    CGAffineTransformConcat(&v49, &v48, &v45);
    v37 = 0;
    v38 = &v37;
    v39 = 0x6010000000;
    v40 = &unk_226ACDFC7;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "cornerPoints");
    else
      memset(&v36, 0, sizeof(v36));
    v31[1] = 3221225472;
    v35 = v49;
    v31[0] = MEMORY[0x24BDAC760];
    v32 = __39__JFXEffectTextEditingProperties_frame__block_invoke;
    v33 = &unk_24EE5A9A8;
    v34 = &v37;
    v19 = v31;
    v20 = 0;
    do
    {
      v50 = v36;
      PVCGPointQuad_get_point_at_index(&v50);
      ((void (*)(_QWORD *, uint64_t))v32)(v19, v20);
      v20 = (v20 + 1);
    }
    while ((_DWORD)v20 != 4);

    v21 = (CGPoint)*((_OWORD *)v38 + 3);
    v50.a = (CGPoint)*((_OWORD *)v38 + 2);
    v50.b = v21;
    v22 = (CGPoint)*((_OWORD *)v38 + 5);
    v50.c = (CGPoint)*((_OWORD *)v38 + 4);
    v50.d = v22;
    pv_bounding_CGRect(&v50);
    v12 = v23;
    v14 = v24;
    v16 = v25;
    v18 = v26;
    if (-[JFXEffectTextEditingProperties isSpecialCaseForGameOverPoster](self, "isSpecialCaseForGameOverPoster"))
    {
      v12 = v12 + (v16 - v16 * 0.73) * 0.5;
      v14 = v14 + (v18 - v18 * 0.73) * 0.5;
      v18 = v18 * 0.73;
      v16 = v16 * 0.73;
    }
    -[JFXEffectTextEditingProperties setCachedFrame:](self, "setCachedFrame:", v12, v14, v16, v18);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    -[JFXEffectTextEditingProperties cachedFrame](self, "cachedFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  v27 = v12;
  v28 = v14;
  v29 = v16;
  v30 = v18;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

uint64_t __39__JFXEffectTextEditingProperties_frame__block_invoke(uint64_t a1, double a2, double a3)
{
  CGPoint v3;
  CGFloat y;

  v3 = (CGPoint)vaddq_f64(*(float64x2_t *)(a1 + 72), vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 56), a3), *(float64x2_t *)(a1 + 40), a2));
  y = v3.y;
  return PVCGPointQuad_set_point_at_index((PVCGPointQuad *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), v3);
}

- (CGRect)bounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  -[JFXEffectTextEditingProperties cachedBounds](self, "cachedBounds");
  if (CGRectIsNull(v18))
  {
    -[JFXEffectTextEditingProperties frame](self, "frame");
    v3 = CGRectMakeWithSize();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    -[JFXEffectTextEditingProperties setCachedBounds:](self, "setCachedBounds:");
  }
  else
  {
    -[JFXEffectTextEditingProperties cachedBounds](self, "cachedBounds");
    v3 = v10;
    v5 = v11;
    v7 = v12;
    v9 = v13;
  }
  v14 = v3;
  v15 = v5;
  v16 = v7;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGPoint)scale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGPoint result;

  -[JFXEffectTextEditingProperties cachedScale](self, "cachedScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXEffectTextEditingProperties cachedScale](self, "cachedScale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CGPointValue");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v18 = 0u;
    -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame", 0, 0, 0, 0, 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "transformInfo");
    }
    else
    {
      v18 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
    }

    v6 = fmax(fabs(*(double *)&v18), 0.001);
    v8 = fmax(fabs(*((double *)&v18 + 1)), 0.001);
    if (-[JFXEffectTextEditingProperties isSpecialCaseForGameOverPoster](self, "isSpecialCaseForGameOverPoster"))
    {
      v8 = v8 * 0.73;
      v6 = v6 * 0.73;
    }
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v6, v8, v14, v15, v16, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectTextEditingProperties setCachedScale:](self, "setCachedScale:", v11);

  }
  v12 = v6;
  v13 = v8;
  result.y = v13;
  result.x = v12;
  return result;
}

- (double)rotation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;

  -[JFXEffectTextEditingProperties cachedRotation](self, "cachedRotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXEffectTextEditingProperties cachedRotation](self, "cachedRotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "transformInfo");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }

    pv_simd_quaternion_get_euler_angles();
    v6 = 0.0 + 3.14159265;
    if (-[JFXEffectTextEditingProperties isTextFlipped](self, "isTextFlipped", v11, v12, 0, 0))
      v6 = v6 + -3.14159265;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectTextEditingProperties setCachedRotation:](self, "setCachedRotation:", v9);

  }
  return v6;
}

- (CGAffineTransform)partialTransformNoScaleNoTranslation
{
  CGAffineTransform *result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  __int128 v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t *v25;
  void *v26;
  __int128 v27;
  unint64_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;

  result = (CGAffineTransform *)-[JFXEffectTextEditingProperties isSpecialCaseForGameOverPoster](self, "isSpecialCaseForGameOverPoster");
  if ((_DWORD)result)
  {
    v6 = MEMORY[0x24BDBD8B8];
    v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&retstr->c = v7;
    v8 = *(_OWORD *)(v6 + 32);
LABEL_14:
    *(_OWORD *)&retstr->tx = v8;
    return result;
  }
  -[JFXEffectTextEditingProperties cachedPartialTransformNoScaleNoTranslation](self, "cachedPartialTransformNoScaleNoTranslation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "transform");
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
    }

    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = *((_QWORD *)&v52 + 1);
    v51 = 0u;
    v52 = v17;
    -[JFXEffectTextEditingProperties scale](self, "scale");
    *(double *)&v28 = 1.0 / v18;
    -[JFXEffectTextEditingProperties scale](self, "scale");
    v20 = v19;
    pv_simd_normalize();
    v21 = 0;
    *(_QWORD *)&v22 = 0;
    *((double *)&v22 + 1) = -1.0 / v20;
    v61 = v28;
    v62 = 0u;
    v63 = v22;
    v64 = 0u;
    v65 = 0u;
    v66 = xmmword_226AB71E0;
    v67 = 0u;
    v68 = xmmword_226AB71D0;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    do
    {
      v24 = *(float64x2_t *)((char *)&v61 + v21);
      v23 = *(float64x2_t *)((char *)&v61 + v21 + 16);
      v25 = (float64x2_t *)((char *)&v37 + v21);
      *v25 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v29, v24.f64[0]), v31, v24, 1), v33, v23.f64[0]), v35, v23, 1);
      v25[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v30, v24.f64[0]), v32, v24, 1), v34, v23.f64[0]), v36, v23, 1);
      v21 += 32;
    }
    while (v21 != 128);
    v49 = v41;
    v50 = v42;
    v51 = v43;
    v52 = v44;
    v45 = v37;
    v46 = v38;
    v47 = v39;
    v48 = v40;
    v65 = v41;
    v66 = v42;
    v67 = v43;
    v68 = v44;
    v61 = v37;
    v62 = v38;
    v63 = v39;
    v64 = v40;
    objc_msgSend(MEMORY[0x24BE790A8], "matrixWithSIMDDouble4x4:", &v61);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffectTextEditingProperties setCachedPartialTransformNoScaleNoTranslation:](self, "setCachedPartialTransformNoScaleNoTranslation:", v26);

    v27 = v47;
    *(_OWORD *)&retstr->a = v45;
    *(_OWORD *)&retstr->c = v27;
    v8 = v51;
    goto LABEL_14;
  }
  -[JFXEffectTextEditingProperties cachedPartialTransformNoScaleNoTranslation](self, "cachedPartialTransformNoScaleNoTranslation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "SIMDDouble4x4");
    v12 = v53;
    v13 = v55;
    v14 = v59;
  }
  else
  {
    v12 = 0uLL;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v13 = 0uLL;
    v14 = 0uLL;
    v53 = 0u;
    v54 = 0u;
  }
  *(_OWORD *)&retstr->a = v12;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = v14;

  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v26.receiver = self;
  v26.super_class = (Class)JFXEffectTextEditingProperties;
  -[JFXEffectTextEditingProperties description](&v26, sel_description);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties attributedText](self, "attributedText");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties defaultTypingAttributes](self, "defaultTypingAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties bounds](self, "bounds");
  NSStringFromCGRect(v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties frame](self, "frame");
  NSStringFromCGRect(v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1968];
  -[JFXEffectTextEditingProperties scale](self, "scale");
  v25[0] = v4;
  v25[1] = v5;
  objc_msgSend(v3, "valueWithBytes:objCType:", v25, "{CGPoint=dd}");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[JFXEffectTextEditingProperties rotation](self, "rotation");
  objc_msgSend(v6, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXEffectTextEditingProperties useFullTransform](self, "useFullTransform"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXEffectTextEditingProperties isAllCaps](self, "isAllCaps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXEffectTextEditingProperties isEmoji](self, "isEmoji"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXEffectTextEditingProperties isTextFlipped](self, "isTextFlipped"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXEffectTextEditingProperties isOutlineDisabled](self, "isOutlineDisabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties customTextEditTintColor](self, "customTextEditTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties customTextColor](self, "customTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffectTextEditingProperties effectFrame](self, "effectFrame");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@\n    attributedText: %@\n    defaultTypingAttributes: %@\n    bounds: %@\n    frame: %@\n    scale: %@\n    rotation: %@\n    useFullTransform: %@\n    isAllCaps: %@\n    isEmoji: %@\n    isTextFlipped: %@\n    isOutlineDisabled: %@\n    customTextEditTintColor: %@\n    customTextColor: %@\n    effectFrame:\n%@\n"), v19, v24, v23, v18, v17, v22, v15, v16, v14, v7, v8, v9, v10, v11, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (JFXTextEffectFrame)effectFrame
{
  return self->_effectFrame;
}

- (void)setEffectFrame:(id)a3
{
  objc_storeStrong((id *)&self->_effectFrame, a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)defaultTypingAttributes
{
  return self->_defaultTypingAttributes;
}

- (void)setDefaultTypingAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)useFullTransform
{
  return self->_useFullTransform;
}

- (void)setUseFullTransform:(BOOL)a3
{
  self->_useFullTransform = a3;
}

- (BOOL)isAllCaps
{
  return self->_isAllCaps;
}

- (void)setIsAllCaps:(BOOL)a3
{
  self->_isAllCaps = a3;
}

- (BOOL)isEmoji
{
  return self->_isEmoji;
}

- (void)setIsEmoji:(BOOL)a3
{
  self->_isEmoji = a3;
}

- (BOOL)isTextFlipped
{
  return self->_isTextFlipped;
}

- (void)setIsTextFlipped:(BOOL)a3
{
  self->_isTextFlipped = a3;
}

- (BOOL)isOutlineDisabled
{
  return self->_outlineDisabled;
}

- (void)setOutlineDisabled:(BOOL)a3
{
  self->_outlineDisabled = a3;
}

- (BOOL)moveBeforeScalingToAvoidKeyboard
{
  return self->_moveBeforeScalingToAvoidKeyboard;
}

- (void)setMoveBeforeScalingToAvoidKeyboard:(BOOL)a3
{
  self->_moveBeforeScalingToAvoidKeyboard = a3;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
}

- (double)baselineYOffset
{
  return self->_baselineYOffset;
}

- (void)setBaselineYOffset:(double)a3
{
  self->_baselineYOffset = a3;
}

- (UIColor)defaultTextColor
{
  return self->_defaultTextColor;
}

- (void)setDefaultTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)customTextColor
{
  return self->_customTextColor;
}

- (void)setCustomTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIColor)customTextEditTintColor
{
  return self->_customTextEditTintColor;
}

- (void)setCustomTextEditTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isSpecialCaseForGameOverPoster
{
  return self->_isSpecialCaseForGameOverPoster;
}

- (void)setIsSpecialCaseForGameOverPoster:(BOOL)a3
{
  self->_isSpecialCaseForGameOverPoster = a3;
}

- (CGRect)cachedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedFrame.origin.x;
  y = self->_cachedFrame.origin.y;
  width = self->_cachedFrame.size.width;
  height = self->_cachedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedFrame:(CGRect)a3
{
  self->_cachedFrame = a3;
}

- (CGRect)cachedBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedBounds.origin.x;
  y = self->_cachedBounds.origin.y;
  width = self->_cachedBounds.size.width;
  height = self->_cachedBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (NSValue)cachedScale
{
  return self->_cachedScale;
}

- (void)setCachedScale:(id)a3
{
  objc_storeStrong((id *)&self->_cachedScale, a3);
}

- (NSNumber)cachedRotation
{
  return self->_cachedRotation;
}

- (void)setCachedRotation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRotation, a3);
}

- (PVMatrix44Double)cachedPartialTransformNoScaleNoTranslation
{
  return self->_cachedPartialTransformNoScaleNoTranslation;
}

- (void)setCachedPartialTransformNoScaleNoTranslation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPartialTransformNoScaleNoTranslation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPartialTransformNoScaleNoTranslation, 0);
  objc_storeStrong((id *)&self->_cachedRotation, 0);
  objc_storeStrong((id *)&self->_cachedScale, 0);
  objc_storeStrong((id *)&self->_customTextEditTintColor, 0);
  objc_storeStrong((id *)&self->_customTextColor, 0);
  objc_storeStrong((id *)&self->_defaultTextColor, 0);
  objc_storeStrong((id *)&self->_defaultTypingAttributes, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_effectFrame, 0);
}

@end
