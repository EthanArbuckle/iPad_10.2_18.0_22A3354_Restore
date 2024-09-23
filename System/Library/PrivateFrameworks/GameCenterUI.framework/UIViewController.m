@implementation UIViewController

void __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_gkPresentChallengeVC:", v4);

}

uint64_t __113__UIViewController_GKChallengeAdditions___gkPresentSendDialogForChallenge_selectPlayers_defaultMessage_complete___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t result;

  v3 = objc_msgSend(a2, "count");
  if (*MEMORY[0x1E0D253F8]
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "presentingViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    if (!a1[5])
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "popToViewController:animated:", a1[4], 1);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_102);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3 != 0);
  return result;
}

@end
