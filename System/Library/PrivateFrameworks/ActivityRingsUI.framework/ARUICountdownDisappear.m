@implementation ARUICountdownDisappear

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.2;
}

+ (id)identifier
{
  return CFSTR("Disappear");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (id)timingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1051361018;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (BOOL)cancelable
{
  return 0;
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  id v17;
  double v18;
  dispatch_time_t v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  double v25;
  double v26;
  _QWORD v27[4];
  id v28;
  double v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ringGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupDiameter");
  v10 = v9;

  objc_msgSend(v6, "ringGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thickness");
  v13 = v12;

  -[ARUICountdownDisappear duration](self, "duration");
  v15 = v14;
  v16 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke;
  v27[3] = &unk_24CEC6040;
  v17 = v6;
  v28 = v17;
  v29 = v10 + v13 * -0.5;
  +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v27, v15);
  -[ARUICountdownDisappear duration](self, "duration");
  v19 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke_2;
  v22[3] = &unk_24CEC6250;
  v25 = v10;
  v26 = v13;
  v23 = v17;
  v24 = v7;
  v20 = v7;
  v21 = v17;
  dispatch_after(v19, MEMORY[0x24BDAC9B8], v22);

}

void __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 40);
  *(float *)&v3 = v3;
  objc_msgSend(v2, "setGroupDiameter:", v3);

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v5, "setThickness:", v4);

}

uint64_t __58__ARUICountdownDisappear_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  void *v6;
  double v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v2, "setOpacity:", v3);

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)(a1 + 48);
  *(float *)&v5 = v5;
  objc_msgSend(v4, "setGroupDiameter:", v5);

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(double *)(a1 + 56);
  *(float *)&v7 = v7;
  objc_msgSend(v6, "setThickness:", v7);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
