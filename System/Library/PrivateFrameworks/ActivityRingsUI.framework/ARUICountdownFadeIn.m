@implementation ARUICountdownFadeIn

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.1;
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
  return 1;
}

+ (id)identifier
{
  return CFSTR("Fade In");
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
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[ARUICountdownFadeIn duration](self, "duration");
  v9 = v8;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke;
  v17[3] = &unk_24CEC5CE0;
  v18 = v6;
  v11 = v6;
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v17, 0, 0, v9);
  -[ARUICountdownFadeIn duration](self, "duration");
  v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke_2;
  v15[3] = &unk_24CEC5D08;
  v16 = v7;
  v14 = v7;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], v15);

}

void __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setTrackOpacity:", v1);

}

uint64_t __55__ARUICountdownFadeIn_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
