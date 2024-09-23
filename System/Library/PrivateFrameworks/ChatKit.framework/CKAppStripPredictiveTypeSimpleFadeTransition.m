@implementation CKAppStripPredictiveTypeSimpleFadeTransition

- (void)transitionFromView:(id)a3 toView:(id)a4 withDirection:(int64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a6;
  objc_msgSend(v9, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bringSubviewToFront:", v9);

  v12 = (void *)MEMORY[0x1E0CEABB0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__CKAppStripPredictiveTypeSimpleFadeTransition_transitionFromView_toView_withDirection_completion___block_invoke;
  v15[3] = &unk_1E274A108;
  v16 = v9;
  v17 = v8;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v12, "animateWithDuration:animations:completion:", v15, v10, 0.1);

}

uint64_t __99__CKAppStripPredictiveTypeSimpleFadeTransition_transitionFromView_toView_withDirection_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

@end
