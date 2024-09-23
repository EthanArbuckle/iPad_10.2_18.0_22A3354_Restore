@implementation GKLeaderboardSet

void __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v2)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), v2, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:userInfo:", 3, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v3);

    }
  }
}

@end
