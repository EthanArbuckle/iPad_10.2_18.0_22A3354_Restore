@implementation GKLeaderboard

void __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E59C5CB0;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_gkloadRemoteImageForURL:queue:withCompletionHandler:", v5, MEMORY[0x1E0C80D38], v7);

}

uint64_t __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setResult:", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "result");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 3, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);
    }

  }
}

@end
