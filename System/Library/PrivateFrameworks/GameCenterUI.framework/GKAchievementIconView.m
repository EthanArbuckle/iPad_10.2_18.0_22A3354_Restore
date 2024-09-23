@implementation GKAchievementIconView

+ (id)progressSource
{
  if (progressSource_onceToken != -1)
    dispatch_once(&progressSource_onceToken, &__block_literal_global_21_0);
  return (id)progressSource_sResult;
}

void __39__GKAchievementIconView_progressSource__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D25AF8]), "initWithName:imageBrush:", CFSTR("progressSource"), 0);
  v1 = (void *)progressSource_sResult;
  progressSource_sResult = v0;

}

+ (id)progressSourceDetail
{
  if (progressSourceDetail_onceToken != -1)
    dispatch_once(&progressSourceDetail_onceToken, &__block_literal_global_25);
  return (id)progressSourceDetail_sResult;
}

void __45__GKAchievementIconView_progressSourceDetail__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D25AF8]), "initWithName:imageBrush:", CFSTR("progressSourceDetail"), 0);
  v1 = (void *)progressSourceDetail_sResult;
  progressSourceDetail_sResult = v0;

}

- (GKAchievementIconView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKAchievementIconView;
  return -[GKAchievementIconView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setupForAchievement:(id)a3 localAchievement:(id)a4
{
  GKAchievement *v7;
  GKAchievement *v8;
  GKAchievement *v9;
  GKAchievement *v11;

  v11 = self->_achievement;
  v7 = self->_localAchievement;
  v8 = (GKAchievement *)a4;
  v9 = (GKAchievement *)a3;
  -[GKAchievementIconView setAchievement:](self, "setAchievement:", v9);
  -[GKAchievementIconView setLocalAchievement:](self, "setLocalAchievement:", v8);

  if (v11 != v9 || v7 != v8)
    -[GKAchievementIconView configureImage](self, "configureImage");

}

- (double)progressForAchievement:(id)a3
{
  id v3;
  void *v4;
  char v5;
  double v6;
  double v7;

  v3 = a3;
  objc_msgSend(v3, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v3, "percentComplete");
    v6 = v7 / 100.0;
  }

  return v6;
}

- (id)processProgressImage:(id)a3 forAchievement:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[GKAchievementIconView progressForAchievement:](self, "progressForAchievement:", v6);
  objc_msgSend(v7, "_gkImageWithProgress:achievement:isDetail:", v6, -[GKAchievementIconView isDetail](self, "isDetail"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)progressIdentifierForAchievement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[GKAchievementIconView progressForAchievement:](self, "progressForAchievement:", v4);
  v6 = v5;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@~%g"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)loadAndProcessAchievementProgressImageForAchievement:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  _QWORD aBlock[5];
  id v25;
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_isDetail)
    objc_msgSend(v8, "untreatedAchievementImageDetailSource");
  else
    objc_msgSend(v8, "untreatedAchievementImageSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke;
  aBlock[3] = &unk_1E59C8A00;
  aBlock[4] = self;
  v25 = v9;
  v12 = v10;
  v26 = v12;
  v27 = v7;
  v13 = v7;
  v14 = v9;
  v15 = _Block_copy(aBlock);
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_3;
  block[3] = &unk_1E59C6118;
  v21 = v12;
  v22 = v6;
  v23 = v15;
  v17 = v15;
  v18 = v6;
  v19 = v12;
  dispatch_async(v16, block);

}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1AF430880]();
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "processProgressImage:forAchievement:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_6;
    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "progressIdentifierForAchievement:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "processAndCacheImage:forIdentifier:", v9, v11);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "achievementsDefaultIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processProgressImage:forAchievement:", v11, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  if (*(_QWORD *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_2;
    block[3] = &unk_1E59C4620;
    v16 = *(id *)(a1 + 56);
    v14 = v9;
    v15 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_autoreleasePoolPop(v7);

}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedImageForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "imageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_4;
    v12[3] = &unk_1E59C8A50;
    v13 = *(id *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 40);
    dispatch_get_global_queue(0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_6;
    v10[3] = &unk_1E59C56B0;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v5, "loadImageForURLString:loader:reference:queue:handler:", v6, v12, v8, v9, v10);

  }
}

void __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_5;
  v6[3] = &unk_1E59C8A28;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "loadImageWithCompletionHandler:", v6);

}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __90__GKAchievementIconView_loadAndProcessAchievementProgressImageForAchievement_withHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configureImage
{
  GKAchievement **p_localAchievement;
  void *v4;
  GKAchievement *v5;
  _BOOL4 isDetail;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  GKAchievement *v12;
  GKAchievementIconView *v13;

  p_localAchievement = &self->_localAchievement;
  -[GKAchievement internal](self->_localAchievement, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
    p_localAchievement = &self->_achievement;
  v5 = *p_localAchievement;

  isDetail = self->_isDetail;
  v7 = (void *)objc_opt_class();
  if (isDetail)
    objc_msgSend(v7, "progressSourceDetail");
  else
    objc_msgSend(v7, "progressSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKAchievementIconView progressIdentifierForAchievement:](self, "progressIdentifierForAchievement:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedImageForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[GKAchievementIconView setImage:](self, "setImage:", v10);
  }
  else
  {
    -[GKAchievementIconView setImage:](self, "setImage:", 0);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__GKAchievementIconView_configureImage__block_invoke;
    v11[3] = &unk_1E59C8A78;
    v12 = v5;
    v13 = self;
    -[GKAchievementIconView loadAndProcessAchievementProgressImageForAchievement:withHandler:](self, "loadAndProcessAchievementProgressImageForAchievement:withHandler:", v12, v11);

  }
}

uint64_t __39__GKAchievementIconView_configureImage__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(result + 32) == a3)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 40), "setImage:", a2);
    return objc_msgSend(*(id *)(v3 + 40), "_gkSetNeedsRender");
  }
  return result;
}

- (BOOL)isDetail
{
  return self->_isDetail;
}

- (void)setIsDetail:(BOOL)a3
{
  self->_isDetail = a3;
}

- (GKAchievement)achievement
{
  return self->_achievement;
}

- (void)setAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_achievement, a3);
}

- (GKAchievement)localAchievement
{
  return self->_localAchievement;
}

- (void)setLocalAchievement:(id)a3
{
  objc_storeStrong((id *)&self->_localAchievement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAchievement, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end
