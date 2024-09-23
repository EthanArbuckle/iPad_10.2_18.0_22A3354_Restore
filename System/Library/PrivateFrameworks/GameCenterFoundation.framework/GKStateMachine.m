@implementation GKStateMachine

id __56___GKStateMachine__validateTransitionFromState_toState___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  char v3;
  id *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  v3 = objc_opt_respondsToSelector();

  v4 = (id *)a1[4];
  if ((v3 & 1) != 0)
  {
    v5 = objc_loadWeakRetained(v4 + 3);
    objc_msgSend(v5, "missingTransitionFromState:toState:", a1[5], a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "missingTransitionFromState:toState:", a1[5], a1[6]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

@end
