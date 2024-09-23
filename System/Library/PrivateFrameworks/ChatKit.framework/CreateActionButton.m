@implementation CreateActionButton

void ___CreateActionButton_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = qword_18E7CBE90[objc_msgSend(v3, "userInterfaceStyle") == 2];

  v5 = (void *)MEMORY[0x1E0CEABB0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___CreateActionButton_block_invoke_2;
  v7[3] = &unk_1E274C9C0;
  v8 = v2;
  v9 = v4;
  v6 = v2;
  objc_msgSend(v5, "animateWithDuration:delay:options:animations:completion:", 327684, v7, 0, 0.2, 0.0);

}

uint64_t ___CreateActionButton_block_invoke_2(uint64_t a1)
{
  int v2;
  double v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isHighlighted");
  v3 = 1.0;
  if (v2)
    v3 = *(double *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

@end
