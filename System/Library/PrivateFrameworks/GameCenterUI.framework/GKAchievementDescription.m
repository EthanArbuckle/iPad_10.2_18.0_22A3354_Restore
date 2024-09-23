@implementation GKAchievementDescription

void __63__GKAchievementDescription_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImage:");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v5, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 3, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

    }
  }

}

void __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_2;
  block[3] = &unk_1E59C6DF0;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

uint64_t __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

void __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "achievedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "achievedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(MEMORY[0x1E0D25330], "usesGameOverlayUI"))
  {
    v10 = (void *)MEMORY[0x1E0D25330];
    objc_msgSend(*(id *)(a1 + 32), "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentAchievementBannerInOverlayWithIdentifier:title:message:image:", v12, v7, v4, v3);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke_2;
    v13[3] = &unk_1E59C4148;
    v13[4] = *(_QWORD *)(a1 + 32);
    +[GKNotificationBanner showAchievementBannerWithTitle:achievementImage:message:touchHandler:](GKNotificationBanner, "showAchievementBannerWithTitle:achievementImage:message:touchHandler:", v7, v3, v4, v13);
  }

}

void __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("dashboard"), CFSTR("achievementEarnedBanner"), v3, CFSTR("achievementEarnedBanner"));

  +[GKAccessPoint shared](GKAccessPoint, "shared");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerAccessPointWithAchievementID:handler:", v5, 0);

}

@end
