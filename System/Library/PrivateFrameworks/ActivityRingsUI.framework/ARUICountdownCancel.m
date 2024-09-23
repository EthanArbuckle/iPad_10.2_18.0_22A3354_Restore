@implementation ARUICountdownCancel

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.25;
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

+ (id)identifier
{
  return CFSTR("Cancel");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  id v11;
  double v12;
  dispatch_time_t v13;
  id v14;
  _QWORD block[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[ARUICountdownCancel duration](self, "duration");
  v9 = v8;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke;
  v19[3] = &unk_24CEC5CE0;
  v20 = v6;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_2;
  v17[3] = &unk_24CEC5CE0;
  v18 = v20;
  v11 = v20;
  +[ARUIRingGroup animateWithDuration:animations:completion:](ARUIRingGroup, "animateWithDuration:animations:completion:", v19, v17, v9);
  -[ARUICountdownCancel duration](self, "duration");
  v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_4;
  block[3] = &unk_24CEC5D08;
  v16 = v7;
  v14 = v7;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setPercentage:ofRingAtIndex:", 0, v1);

}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_3;
  v1[3] = &unk_24CEC5CE0;
  v2 = *(id *)(a1 + 32);
  +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v1, 0.2);

}

void __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_3(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setTrackOpacity:", v1);

}

uint64_t __55__ARUICountdownCancel_applyToCountdownView_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
