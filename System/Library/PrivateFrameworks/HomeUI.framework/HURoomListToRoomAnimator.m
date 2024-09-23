@implementation HURoomListToRoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  id *v22;
  id *v23;
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  double v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (-[HURoomListToRoomAnimator isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v8);

    objc_msgSend(v8, "setFrame:", v10, v12, v14, v16);
    objc_msgSend(v8, "setAlpha:", 0.0);
    v18 = (void *)MEMORY[0x1E0CEABB0];
    -[HURoomListToRoomAnimator transitionDuration:](self, "transitionDuration:", v4);
    v20 = v19;
    v21 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke;
    v39[3] = &unk_1E6F4D988;
    v22 = &v40;
    v40 = v8;
    v37[0] = v21;
    v37[1] = 3221225472;
    v37[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_2;
    v37[3] = &unk_1E6F4E300;
    v23 = &v38;
    v38 = v4;
    v24 = v4;
    v25 = v39;
    v26 = v37;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CEABB0];
    -[HURoomListToRoomAnimator transitionDuration:](self, "transitionDuration:", v4);
    v20 = v27;
    v28 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_3;
    v35[3] = &unk_1E6F4D988;
    v22 = &v36;
    v36 = v7;
    v30 = v28;
    v31 = 3221225472;
    v32 = __46__HURoomListToRoomAnimator_animateTransition___block_invoke_4;
    v33 = &unk_1E6F4E300;
    v23 = &v34;
    v34 = v4;
    v29 = v4;
    v25 = v35;
    v26 = &v30;
  }
  objc_msgSend(v18, "animateWithDuration:delay:options:animations:completion:", 2, v25, v26, v20, 0.0, v30, v31, v32, v33);

}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __46__HURoomListToRoomAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

@end
