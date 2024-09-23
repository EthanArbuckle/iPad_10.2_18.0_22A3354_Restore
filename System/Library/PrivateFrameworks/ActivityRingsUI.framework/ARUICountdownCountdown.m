@implementation ARUICountdownCountdown

- (ARUICountdownCountdown)initWithPercent:(double)a3 andStep:(unint64_t)a4 cancelable:(BOOL)a5
{
  ARUICountdownCountdown *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARUICountdownCountdown;
  result = -[ARUICountdownCountdown init](&v9, sel_init);
  if (result)
  {
    result->_percent = a3;
    result->_step = a4;
    result->_cancelable = a5;
  }
  return result;
}

- (double)delay
{
  return 0.3;
}

- (double)duration
{
  return 0.7;
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
  return self->_cancelable;
}

+ (id)identifier
{
  return CFSTR("Countdown");
}

- (id)identifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "identifier");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARUICountdownCountdown;
  -[ARUICountdownDefaultAnimation description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %lu>"), v4, self->_step);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  double v16;
  dispatch_time_t v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  id v22;
  ARUICountdownCountdown *v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ringGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setZRotation:", v9);

  objc_msgSend(v6, "ringGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1051931443;
  objc_msgSend(v10, "setEmptyOpacity:", v11);

  -[ARUICountdownCountdown duration](self, "duration");
  v13 = v12;
  v14 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke;
  v21[3] = &unk_24CEC6278;
  v22 = v6;
  v23 = self;
  v15 = v6;
  +[ARUIRingGroup animateWithDuration:animations:curve:completion:](ARUIRingGroup, "animateWithDuration:animations:curve:completion:", v21, 3, 0, v13);
  -[ARUICountdownCountdown duration](self, "duration");
  v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
  block[0] = v14;
  block[1] = 3221225472;
  block[2] = __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke_2;
  block[3] = &unk_24CEC5D08;
  v20 = v7;
  v18 = v7;
  dispatch_after(v17, MEMORY[0x24BDAC9B8], block);

}

void __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "ringGroup");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "percent");
  *(float *)&v2 = v2;
  objc_msgSend(v3, "setPercentage:ofRingAtIndex:", 0, v2);

}

uint64_t __58__ARUICountdownCountdown_applyToCountdownView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (unint64_t)countdownStep
{
  return self->_step;
}

- (double)percent
{
  return self->_percent;
}

- (void)setPercent:(double)a3
{
  self->_percent = a3;
}

@end
