@implementation LAUIPhysicalButtonViewBounceAnimation

- (double)duration
{
  return 1.35;
}

- (void)beginWithDelay:(double)a3
{
  if (!-[LAUIPhysicalButtonViewAnimation isRunning](self, "isRunning"))
  {
    -[LAUIPhysicalButtonViewBounceAnimation _currentLength](self, "_currentLength");
    -[LAUIPhysicalButtonViewBounceAnimation _animateWithLength:delay:](self, "_animateWithLength:delay:");
  }
}

- (void)update
{
  double v3;

  if (-[LAUIPhysicalButtonViewAnimation isRunning](self, "isRunning"))
  {
    -[LAUIPhysicalButtonViewBounceAnimation _currentLength](self, "_currentLength");
    if (self->_lastLength != v3)
      -[LAUIPhysicalButtonViewBounceAnimation _animateWithLength:delay:](self, "_animateWithLength:delay:");
  }
}

- (double)_currentLength
{
  LAUIPhysicalButtonView **p_physicalButtonView;
  id WeakRetained;
  id v4;
  int v5;
  id v6;
  double v7;
  double v8;
  double v9;

  p_physicalButtonView = &self->super._physicalButtonView;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._physicalButtonView);
  if (!objc_msgSend(WeakRetained, "edge"))
  {

    goto LABEL_5;
  }
  v4 = objc_loadWeakRetained((id *)p_physicalButtonView);
  v5 = objc_msgSend(v4, "edge");

  if (v5 == 2)
  {
LABEL_5:
    v6 = objc_loadWeakRetained((id *)p_physicalButtonView);
    objc_msgSend(v6, "bounds");
    v8 = v9;
    goto LABEL_6;
  }
  v6 = objc_loadWeakRetained((id *)p_physicalButtonView);
  objc_msgSend(v6, "bounds");
  v8 = v7;
LABEL_6:

  return v8;
}

- (void)_animateWithLength:(double)a3 delay:(double)a4
{
  id WeakRetained;
  int v8;
  int v9;
  const __CFString *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  _QWORD v25[6];
  _QWORD v26[8];

  v26[7] = *MEMORY[0x24BDAC8D0];
  -[LAUIPhysicalButtonViewAnimation end](self, "end");
  self->_lastLength = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._physicalButtonView);
  v8 = objc_msgSend(WeakRetained, "edge");

  v9 = 0;
  switch(v8)
  {
    case 0:
      goto LABEL_3;
    case 1:
      goto LABEL_6;
    case 2:
      v9 = 1;
LABEL_3:
      v10 = CFSTR("position.x");
      break;
    case 3:
      v9 = 1;
LABEL_6:
      v10 = CFSTR("position.y");
      break;
    default:
      v10 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdditive:", 1);
  objc_msgSend(v11, "setBeginTimeMode:", *MEMORY[0x24BDE5858]);
  objc_msgSend(v11, "setBeginTime:", a4);
  -[LAUIPhysicalButtonViewBounceAnimation duration](self, "duration");
  objc_msgSend(v11, "setDuration:");
  objc_msgSend(v11, "setCalculationMode:", *MEMORY[0x24BDE5848]);
  v26[0] = &unk_24C284EE8;
  if (v9)
    v12 = -1.7;
  else
    v12 = 1.7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12 * self->_lastLength);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v13;
  v26[2] = &unk_24C284EE8;
  v26[3] = &unk_24C284EE8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12 * self->_lastLength);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v26[5] = &unk_24C284EE8;
  v26[6] = &unk_24C284EE8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValues:", v15);

  objc_msgSend(v11, "setKeyTimes:", &unk_24C285428);
  LODWORD(v16) = 1051372203;
  LODWORD(v17) = 1059760811;
  LODWORD(v18) = 0;
  LODWORD(v19) = 1.0;
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v16, v18, v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v20;
  v25[1] = v21;
  v25[2] = v20;
  v25[3] = v20;
  v25[4] = v21;
  v25[5] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimingFunctions:", v22);

  LODWORD(v23) = 2139095040;
  objc_msgSend(v11, "setRepeatCount:", v23);
  v24 = objc_loadWeakRetained((id *)&self->super._layer);
  -[LAUIPhysicalButtonViewAnimation addAdditiveAnimation:to:keyPath:](self, "addAdditiveAnimation:to:keyPath:", v11, v24, 0);

}

@end
