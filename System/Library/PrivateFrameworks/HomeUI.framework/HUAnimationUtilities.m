@implementation HUAnimationUtilities

+ (void)schedulePopAnimation:(id)a3 scaleFactor:(double)a4 beginDuration:(double)a5 endDuration:(double)a6 completion:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v11 = a3;
  v12 = a7;
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  if (v11)
    objc_msgSend(v11, "transform");
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke;
  aBlock[3] = &unk_1E6F4D410;
  v14 = v11;
  v36 = v14;
  v37 = v12;
  v15 = v12;
  v16 = _Block_copy(aBlock);
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_2;
  v29[3] = &unk_1E6F4D440;
  v17 = v14;
  v30 = v17;
  v31 = v38;
  v32 = v39;
  v33 = v40;
  v34 = a4;
  v18 = _Block_copy(v29);
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_3;
  v22[3] = &unk_1E6F4D490;
  v25 = a6;
  v26 = v38;
  v27 = v39;
  v28 = v40;
  v23 = v17;
  v24 = v16;
  v19 = v16;
  v20 = v17;
  v21 = _Block_copy(v22);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0x20000, v18, v21, a5, 0.0);

}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setUserInteractionEnabled:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_2(uint64_t a1)
{
  CGFloat v2;
  __int128 v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  v2 = *(double *)(a1 + 88);
  v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v7.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  v4 = *(void **)(a1 + 32);
  v6 = v8;
  return objc_msgSend(v4, "setTransform:", &v6);
}

void __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  double v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(double *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_4;
  v5[3] = &unk_1E6F4D468;
  v6 = *(id *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 72);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 88);
  objc_msgSend(v2, "animateWithDuration:delay:options:animations:completion:", 0, v5, *(_QWORD *)(a1 + 40), v3, 0.0);

}

uint64_t __94__HUAnimationUtilities_schedulePopAnimation_scaleFactor_beginDuration_endDuration_completion___block_invoke_4(uint64_t a1)
{
  __int128 v1;
  _OWORD v3[3];

  v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v3);
}

@end
