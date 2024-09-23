@implementation ARUICountdownWindUp

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.67;
}

- (BOOL)cancelable
{
  return 1;
}

+ (id)identifier
{
  return CFSTR("Wind Up");
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
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  -[ARUICountdownWindUp duration](self, "duration");
  v9 = v8;
  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke;
  v19[3] = &unk_24CEC5CE0;
  v11 = v6;
  v20 = v11;
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v19, 3, 0, v9);
  -[ARUICountdownWindUp duration](self, "duration");
  v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke_2;
  block[3] = &unk_24CEC6308;
  v17 = v11;
  v18 = v7;
  v14 = v11;
  v15 = v7;
  dispatch_after(v13, MEMORY[0x24BDAC9B8], block);

}

void __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 1.0;
  objc_msgSend(v2, "setPercentage:ofRingAtIndex:", 0, v3);

  objc_msgSend(*(id *)(a1 + 32), "backingTrackRingGroup");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thickness");
  objc_msgSend(v5, "setThickness:");

}

void __55__ARUICountdownWindUp_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "backingTrackRingGroup");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setOpacity:", v3);

}

@end
