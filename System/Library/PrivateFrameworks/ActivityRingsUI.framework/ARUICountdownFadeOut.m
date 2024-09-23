@implementation ARUICountdownFadeOut

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.2;
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
  return CFSTR("Fade Out");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  double v14;
  dispatch_time_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ringGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setPercentage:ofRingAtIndex:", 0, v9);

  -[ARUICountdownFadeOut duration](self, "duration");
  v10 = MEMORY[0x24BDAC760];
  v12 = v11 + v11;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke;
  v19[3] = &unk_24CEC5CE0;
  v20 = v6;
  v13 = v6;
  +[ARUIRingGroup animateWithDuration:animations:](ARUIRingGroup, "animateWithDuration:animations:", v19, v12);
  -[ARUICountdownFadeOut duration](self, "duration");
  v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke_2;
  v17[3] = &unk_24CEC5D08;
  v18 = v7;
  v16 = v7;
  dispatch_after(v15, MEMORY[0x24BDAC9B8], v17);

}

void __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 0;
  objc_msgSend(v2, "setTrackOpacity:", v1);

}

uint64_t __56__ARUICountdownFadeOut_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
