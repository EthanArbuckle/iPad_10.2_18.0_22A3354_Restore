@implementation EKExpandedReminderStackDismissingLayout

- (EKExpandedReminderStackDismissingLayout)initWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6;
  EKExpandedReminderStackDismissingLayout *v7;
  dispatch_group_t v8;
  OS_dispatch_group *animationDispatchGroup;
  void *v10;
  id completionHandler;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  v7 = -[EKExpandedReminderStackLayout initWithDelegate:](&v13, sel_initWithDelegate_, a3);
  if (v7)
  {
    v8 = dispatch_group_create();
    animationDispatchGroup = v7->_animationDispatchGroup;
    v7->_animationDispatchGroup = (OS_dispatch_group *)v8;

    v10 = _Block_copy(v6);
    completionHandler = v7->_completionHandler;
    v7->_completionHandler = v10;

    v7->_executedCompletionHandler = 0;
  }

  return v7;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  v4 = a3;
  -[EKExpandedReminderStackDismissingLayout layoutAttributesForItemAtIndexPath:](&v7, sel_layoutAttributesForItemAtIndexPath_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  -[EKExpandedReminderStackDismissingLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v7, sel_layoutAttributesForSupplementaryViewOfKind_atIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKExpandedReminderStackLayout prepareHeaderAnimationWithLayoutAttributes:](self, "prepareHeaderAnimationWithLayoutAttributes:", v5);
  return v5;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v7;
  id v8;
  char isKindOfClass;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  char v17;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  v14[3] = &unk_1E601B6E8;
  v17 = isKindOfClass & 1;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = _Block_copy(v14);

  return v12;
}

void __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  _QWORD block[5];

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 512));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 512);
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  block[3] = &unk_1E6018688;
  block[4] = v4;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], block);
  objc_msgSend(MEMORY[0x1E0DC3F38], "expandingStackedRemindersSpringAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v15[3] = &unk_1E6019510;
  v18 = *(_BYTE *)(a1 + 56);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v7, "addAnimations:", v15);
  v9 = v6;
  v10 = 3221225472;
  v11 = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_4;
  v12 = &unk_1E601B6C0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v8 = v3;
  objc_msgSend(v7, "addCompletion:", &v9);
  objc_msgSend(v7, "startAnimation", v9, v10, v11, v12, v13);

}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 528))
  {
    *(_BYTE *)(v1 + 528) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(result + 32) + 520) + 16))();
  }
  return result;
}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  int v2;
  void *v3;
  void *v5;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "frame");
    return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  }
  else
  {
    if (v3)
    {
      objc_msgSend(v3, "transform");
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
      v7 = 0u;
    }
    v5 = *(void **)(a1 + 32);
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    objc_msgSend(v5, "setTransform:", v6);
    objc_msgSend(*(id *)(a1 + 40), "alpha");
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  }
}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 512));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_animationDispatchGroup, 0);
}

@end
