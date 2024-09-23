@implementation CKAcknowledgmentVotingViewAnimator

- (CKAcknowledgmentVotingViewAnimator)initWithCollectionView:(id)a3 animatorModelItems:(id)a4 acknowledgmentTypes:(id)a5
{
  id v7;
  id v8;
  CKAcknowledgmentVotingViewAnimator *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CKAcknowledgmentVotingViewAnimator *v15;
  id v16;
  _QWORD v18[4];
  CKAcknowledgmentVotingViewAnimator *v19;
  id v20;
  id v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CKAcknowledgmentVotingViewAnimator;
  v9 = -[CKAcknowledgmentVotingViewAnimator init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v7, "frame");
    v11 = (void *)objc_msgSend(v10, "initWithFrame:");
    -[CKAcknowledgmentVotingViewAnimator setAnimationContainerView:](v9, "setAnimationContainerView:", v11);

    -[CKAcknowledgmentVotingViewAnimator animationContainerView](v9, "animationContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClipsToBounds:", 1);

    -[CKAcknowledgmentVotingViewAnimator setAnimatorModelItems:](v9, "setAnimatorModelItems:", v8);
    objc_msgSend(v7, "collectionViewLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "prepareLayout");

    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __100__CKAcknowledgmentVotingViewAnimator_initWithCollectionView_animatorModelItems_acknowledgmentTypes___block_invoke;
    v18[3] = &unk_1E2756138;
    v15 = v9;
    v19 = v15;
    v20 = v7;
    v21 = v14;
    v16 = v14;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
    -[CKAcknowledgmentVotingViewAnimator setSectionAnimators:](v15, "setSectionAnimators:", v16);

  }
  return v9;
}

void __100__CKAcknowledgmentVotingViewAnimator_initWithCollectionView_animatorModelItems_acknowledgmentTypes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v20;
  _CKAcknowledgementSectionAnimator *v21;

  v3 = a2;
  v21 = objc_alloc_init(_CKAcknowledgementSectionAnimator);
  objc_msgSend(*(id *)(a1 + 32), "animationContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator setContainerView:](v21, "setContainerView:", v4);

  -[_CKAcknowledgementSectionAnimator setAcknowledgmentType:](v21, "setAcknowledgmentType:", objc_msgSend(v3, "acknowledgmentType"));
  -[_CKAcknowledgementSectionAnimator setAckVoteCount:](v21, "setAckVoteCount:", objc_msgSend(v3, "ackVoteCount"));
  objc_msgSend(v3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator setEntityToShow:](v21, "setEntityToShow:", v5);

  objc_msgSend(v3, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "section");

  v8 = *(void **)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB36B0];
  objc_msgSend(v3, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexPathForItem:inSection:", objc_msgSend(v10, "item"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator setAvatarViewAttr:](v21, "setAvatarViewAttr:", v12);

  v13 = *(void **)(a1 + 40);
  +[CKAcknowledgmentVoteCountCollectionReusableView supplementaryViewKind](CKAcknowledgmentVoteCountCollectionReusableView, "supplementaryViewKind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator setVoteCountViewAttr:](v21, "setVoteCountViewAttr:", v16);

  v17 = *(void **)(a1 + 40);
  +[CKAcknowledgmentIconCollectionReusableView supplementaryViewKind](CKAcknowledgmentIconCollectionReusableView, "supplementaryViewKind");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CKAcknowledgementSectionAnimator setAckIconViewAttr:](v21, "setAckIconViewAttr:", v20);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
}

- (void)startAnimationWithDelay:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke;
  v12[3] = &unk_1E274A208;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v12);
  -[CKAcknowledgmentVotingViewAnimator sectionAnimators](self, "sectionAnimators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke_2;
  v11[3] = &__block_descriptor_40_e50_v32__0___CKAcknowledgementSectionAnimator_8Q16_B24l;
  *(double *)&v11[4] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  -[CKAcknowledgmentVotingViewAnimator sectionAnimators](self, "sectionAnimators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3 + (double)(unint64_t)objc_msgSend(v7, "count") * 0.05;

  -[CKAcknowledgmentVotingViewAnimator sectionAnimators](self, "sectionAnimators");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke_3;
  v10[3] = &__block_descriptor_40_e50_v32__0___CKAcknowledgementSectionAnimator_8Q16_B24l;
  *(double *)&v10[4] = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

void __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acknowledgmentVotingViewAnimatorDidFinishAnimation:", *(_QWORD *)(a1 + 32));

}

void __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  v5 = a2;
  objc_msgSend(v5, "animateInAckIconView:", CACurrentMediaTime() + *(double *)(a1 + 32) + (double)a3 * 0.05);

}

uint64_t __62__CKAcknowledgmentVotingViewAnimator_startAnimationWithDelay___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  return objc_msgSend(a2, "insertAvatarDelayTime:", *(double *)(a1 + 32) + (double)a3 * 0.1);
}

- (UIView)animationContainerView
{
  return self->_animationContainerView;
}

- (void)setAnimationContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_animationContainerView, a3);
}

- (CKAcknowledgmentVotingViewAnimatorDelegate)delegate
{
  return (CKAcknowledgmentVotingViewAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sectionAnimators
{
  return self->_sectionAnimators;
}

- (void)setSectionAnimators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)animatorModelItems
{
  return self->_animatorModelItems;
}

- (void)setAnimatorModelItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatorModelItems, 0);
  objc_storeStrong((id *)&self->_sectionAnimators, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationContainerView, 0);
}

@end
