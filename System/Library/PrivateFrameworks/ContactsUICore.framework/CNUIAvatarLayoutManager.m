@implementation CNUIAvatarLayoutManager

id __62__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("baseSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("itemConfigurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations___block_invoke_2;
  v9[3] = &__block_descriptor_40_e57___CNUIAvatarLayoutItemConfiguration_16__0__NSDictionary_8l;
  *(double *)&v9[4] = v5;
  objc_msgSend(v6, "_cn_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)layoutConfigurationsForType:(unint64_t)a3 withItemCount:(int64_t)a4
{
  void *v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "avatarViewLayoutConfigurationsForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[CNUIPRLikenessResolver maxContacts](CNUIPRLikenessResolver, "maxContacts");
  if (v6 >= a4)
    v7 = a4;
  else
    v7 = v6;
  v8 = v7 - 1;
  if (v7 < 1 || v8 >= objc_msgSend(v5, "count"))
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)avatarViewLayoutConfigurationsForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  uint64_t *v9;
  id v10;
  _QWORD v12[4];
  _QWORD v13[2];
  _QWORD v14[4];
  _QWORD v15[2];
  _QWORD block[4];
  _QWORD v17[2];

  +[CNUIAvatarLayoutManager avatarViewLayoutConfigurationsDictionaryForType:](CNUIAvatarLayoutManager, "avatarViewLayoutConfigurationsDictionaryForType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("configurations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 2)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke_3;
    v12[3] = &unk_1EA605488;
    v13[1] = a1;
    v8 = (id *)v13;
    v13[0] = v6;
    if (avatarViewLayoutConfigurationsForType__cn_once_token_4 != -1)
      dispatch_once(&avatarViewLayoutConfigurationsForType__cn_once_token_4, v12);
    v9 = &avatarViewLayoutConfigurationsForType__cn_once_object_4;
  }
  else if (a3 == 1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke_2;
    v14[3] = &unk_1EA605488;
    v15[1] = a1;
    v8 = (id *)v15;
    v15[0] = v6;
    if (avatarViewLayoutConfigurationsForType__cn_once_token_3 != -1)
      dispatch_once(&avatarViewLayoutConfigurationsForType__cn_once_token_3, v14);
    v9 = &avatarViewLayoutConfigurationsForType__cn_once_object_3;
  }
  else
  {
    if (a3)
    {
      v10 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_15;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke;
    block[3] = &unk_1EA605488;
    v17[1] = a1;
    v8 = (id *)v17;
    v17[0] = v6;
    if (avatarViewLayoutConfigurationsForType__cn_once_token_2 != -1)
      dispatch_once(&avatarViewLayoutConfigurationsForType__cn_once_token_2, block);
    v9 = &avatarViewLayoutConfigurationsForType__cn_once_object_2;
  }
  v10 = (id)*v9;

LABEL_15:
  return v10;
}

+ (id)avatarViewLayoutConfigurationsDictionaryForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsDictionaryForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (avatarViewLayoutConfigurationsDictionaryForType__onceToken != -1)
    dispatch_once(&avatarViewLayoutConfigurationsDictionaryForType__onceToken, block);
  v4 = (void *)avatarViewLayoutConfigurationsDictionaryForType__jsonContents;
  +[CNUIAvatarLayoutManager identifierForLayoutType:](CNUIAvatarLayoutManager, "identifierForLayoutType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CNUIAvatarLayoutItemConfiguration *__62__CNUIAvatarLayoutManager_avatarViewLayoutItemConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;

  v3 = a2;
  objc_msgSend(v3, "valueForKey:", CFSTR("size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  objc_msgSend(v3, "valueForKey:", CFSTR("x"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v3, "valueForKey:", CFSTR("y"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  return -[CNUIAvatarLayoutItemConfiguration initWithSize:x:y:baseSize:]([CNUIAvatarLayoutItemConfiguration alloc], "initWithSize:x:y:baseSize:", v6, v9, v12, *(double *)(a1 + 32));
}

+ (id)identifierForLayoutType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PlanetsAvatarLayoutConfigurations");
  if (a3 == 1)
    v3 = CFSTR("PlanetsAvatarLayoutAdHocConfigurations");
  if (a3 == 2)
    return CFSTR("SnowglobeAvatarLayoutConfigurations");
  else
    return (id)v3;
}

void __75__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsDictionaryForType___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("CNUIIdentityAvatarConfiguration"), CFSTR("json"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v1, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)avatarViewLayoutConfigurationsDictionaryForType__jsonContents;
  avatarViewLayoutConfigurationsDictionaryForType__jsonContents = v2;

}

void __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "avatarViewLayoutItemConfigurations:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)avatarViewLayoutConfigurationsForType__cn_once_object_4;
  avatarViewLayoutConfigurationsForType__cn_once_object_4 = v1;

}

+ (id)avatarViewLayoutItemConfigurations:(id)a3
{
  return (id)objc_msgSend(a3, "_cn_map:", &__block_literal_global_71);
}

void __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "avatarViewLayoutItemConfigurations:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)avatarViewLayoutConfigurationsForType__cn_once_object_2;
  avatarViewLayoutConfigurationsForType__cn_once_object_2 = v1;

}

void __65__CNUIAvatarLayoutManager_avatarViewLayoutConfigurationsForType___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend((id)objc_opt_class(), "avatarViewLayoutItemConfigurations:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)avatarViewLayoutConfigurationsForType__cn_once_object_3;
  avatarViewLayoutConfigurationsForType__cn_once_object_3 = v1;

}

+ (int64_t)maxAvatarCountForType:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CNUIAvatarLayoutManager_maxAvatarCountForType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (maxAvatarCountForType__onceToken != -1)
    dispatch_once(&maxAvatarCountForType__onceToken, block);
  return maxAvatarCountForType__maxAvatarCount;
}

void __49__CNUIAvatarLayoutManager_maxAvatarCountForType___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  +[CNUIAvatarLayoutManager avatarViewLayoutConfigurationsDictionaryForType:](CNUIAvatarLayoutManager, "avatarViewLayoutConfigurationsDictionaryForType:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("maxAvatarCount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  maxAvatarCountForType__maxAvatarCount = objc_msgSend(v1, "integerValue");

}

+ (id)avatarBadgeLayerForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  void *v11;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "avatarBadgeRectForAvatarInRect:badgeType:isRTL:", a4, v5, x, y, width, height);
  objc_msgSend(v11, "setFrame:");
  objc_msgSend((id)objc_opt_class(), "applyAvatarBadgeStylingToLayer:badgeType:", v11, a4);
  return v11;
}

+ (CGRect)avatarBadgeRectForAvatarInRect:(CGRect)a3 badgeType:(unint64_t)a4 isRTL:(BOOL)a5
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  _BOOL4 v9;
  double v10;
  double MinY;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!a4)
  {
    v13 = 0.35;
LABEL_12:
    v10 = a3.size.width * v13;
    v14 = x;
    v12 = CGRectGetMaxX(a3) - v10;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    MinY = CGRectGetMinY(v18);
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    v13 = 0.25;
    goto LABEL_12;
  }
  if (a4 != 2)
  {
    v12 = *MEMORY[0x1E0C9D648];
    MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_15;
  }
  v9 = a5;
  if (a3.size.width * 0.85 >= a3.size.height * 0.85)
    v10 = a3.size.height * 0.85;
  else
    v10 = a3.size.width * 0.85;
  MinY = CGRectGetMidY(a3) + v10 * -0.5;
  if (v9)
    v12 = x - v10 * 0.75;
  else
    v12 = x + width * 0.75;
LABEL_13:
  v15 = v10;
LABEL_15:
  v16 = v12;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v15;
  result.origin.y = MinY;
  result.origin.x = v16;
  return result;
}

+ (void)applyAvatarBadgeStylingToLayer:(id)a3 badgeType:(unint64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (a4 <= 2)
  {
    v6 = v5;
    objc_msgSend((id)objc_opt_class(), "cropAvatarBadgeLayer:withCropStyle:", v5, qword_1DD1C8F78[a4]);
    v5 = v6;
  }

}

+ (void)cropAvatarBadgeLayer:(id)a3 withCropStyle:(unint64_t)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v5 = a3;
  if (a4 == 1)
  {
    v12 = v5;
    objc_msgSend(v5, "bounds");
    v10 = v11 * 0.25;
LABEL_8:
    objc_msgSend(v12, "setCornerRadius:", v10);
    objc_msgSend(v12, "setMasksToBounds:", 1);
    v5 = v12;
    goto LABEL_9;
  }
  if (!a4)
  {
    v12 = v5;
    objc_msgSend(v5, "bounds");
    v7 = v6;
    objc_msgSend(v12, "bounds");
    if (v7 >= v8)
      v9 = v7;
    else
      v9 = v8;
    v10 = v9 * 0.5;
    goto LABEL_8;
  }
LABEL_9:

}

+ (double)frameForBadgeWithFrame:(double)a3 onAvatarFrame:(double)a4 withPosition:(CGFloat)a5 mediaContextFrame:(CGFloat)a6 isRTL:(CGFloat)a7
{
  CGFloat v25;
  double MinX;
  double MinY;
  BOOL v31;
  CGFloat v32;
  double v36;
  CGFloat v37;
  CGFloat v41;
  double v44;
  BOOL v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double result;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  switch(a11)
  {
    case 0:
      v52 = a4;
      v25 = a5;
      if (a12)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v25);
        v54.origin.x = a5;
        v54.origin.y = a6;
        v54.size.width = a7;
        v54.size.height = a8;
        MinY = CGRectGetMinY(v54);
        v55.origin.x = a13;
        v55.origin.y = a14;
        v55.size.height = a16;
        v55.size.width = a15;
        v31 = CGRectEqualToRect(v55, *MEMORY[0x1E0C9D648]);
        a4 = v52;
        if (!v31)
          MinX = MinX - (a15 + a3 * -0.5);
      }
      else
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v25) - a3;
        v61.origin.x = a5;
        v61.origin.y = a6;
        v61.size.width = a7;
        v61.size.height = a8;
        MinY = CGRectGetMinY(v61);
        v62.origin.x = a13;
        v62.origin.y = a14;
        v62.size.height = a16;
        v62.size.width = a15;
        v46 = CGRectEqualToRect(v62, *MEMORY[0x1E0C9D648]);
        a4 = v52;
        if (!v46)
          MinX = a15 + a3 * -0.5 + MinX;
      }
      break;
    case 1:
      v41 = a5;
      v44 = a4;
      if (a12)
        MinX = CGRectGetMaxX(*(CGRect *)&v41) - a3;
      else
        MinX = CGRectGetMinX(*(CGRect *)&v41);
      v63.origin.x = a5;
      v63.origin.y = a6;
      v63.size.width = a7;
      v63.size.height = a8;
      v47 = CGRectGetMinY(v63);
      a4 = v44;
      MinY = v47;
      break;
    case 2:
      v53 = a4;
      v32 = a5;
      if (a12)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v32);
        v56.origin.x = a5;
        v56.origin.y = a6;
        v56.size.width = a7;
        v56.size.height = a8;
        MinY = CGRectGetMaxY(v56) - a3;
        v57.origin.x = a13;
        v57.origin.y = a14;
        v57.size.height = a16;
        v57.size.width = a15;
        if (!CGRectEqualToRect(v57, *MEMORY[0x1E0C9D648]))
          MinX = MinX - (a15 + a3 * -0.5);
      }
      else
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v32) - a3;
        v58.origin.x = a5;
        v58.origin.y = a6;
        v58.size.width = a7;
        v58.size.height = a8;
        MinY = CGRectGetMaxY(v58) - a3;
        v59.origin.x = a13;
        v59.origin.y = a14;
        v59.size.height = a16;
        v59.size.width = a15;
        if (!CGRectEqualToRect(v59, *MEMORY[0x1E0C9D648]))
          MinX = a15 + a3 * -0.5 + MinX;
      }
      a4 = v53;
      break;
    case 3:
      v36 = a4;
      v37 = a5;
      if (a12)
        MinX = CGRectGetMaxX(*(CGRect *)&v37) - a3;
      else
        MinX = CGRectGetMinX(*(CGRect *)&v37);
      v60.origin.x = a5;
      v60.origin.y = a6;
      v60.size.width = a7;
      v60.size.height = a8;
      MinY = CGRectGetMaxY(v60) - a3;
      a4 = v36;
      break;
    default:
      MinY = a16;
      MinX = a15;
      break;
  }
  v48 = MinX;
  v49 = MinY;
  v50 = a3;
  *(_QWORD *)&result = (unint64_t)CGRectIntegral(*(CGRect *)(&a4 - 3));
  return result;
}

@end
