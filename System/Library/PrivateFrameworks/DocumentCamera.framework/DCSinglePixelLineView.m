@implementation DCSinglePixelLineView

- (void)updateConstraints
{
  objc_super v3;

  -[DCSinglePixelLineView setUpHeightConstraintIfNecessary](self, "setUpHeightConstraintIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)DCSinglePixelLineView;
  -[DCSinglePixelLineView updateConstraints](&v3, sel_updateConstraints);
}

- (void)setUpHeightConstraintIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  if (!-[DCSinglePixelLineView hasSetUpSizeConstraint](self, "hasSetUpSizeConstraint"))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "tableSeparatorColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DCSinglePixelLineView setBackgroundColor:](self, "setBackgroundColor:", v3);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scale");
    v6 = 1.0 / v5;

    -[DCSinglePixelLineView findSizeLayoutConstraintIfExists](self, "findSizeLayoutConstraintIfExists");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[DCSinglePixelLineView addSizeConstraint](self, "addSizeConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(v7, "setConstant:", v6);
    -[DCSinglePixelLineView setHasSetUpSizeConstraint:](self, "setHasSetUpSizeConstraint:", 1);

  }
}

- (id)findSizeLayoutConstraintIfExists
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  DCSinglePixelLineView *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  DCSinglePixelLineView *v11;
  void *v12;
  DCSinglePixelLineView *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[DCSinglePixelLineView sizeLayoutAttribute](self, "sizeLayoutAttribute");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[DCSinglePixelLineView constraints](self, "constraints", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      if (objc_msgSend(v10, "firstAttribute") == v3)
      {
        objc_msgSend(v10, "firstItem");
        v11 = (DCSinglePixelLineView *)objc_claimAutoreleasedReturnValue();
        if (v11 != self)
          goto LABEL_8;
        objc_msgSend(v10, "secondItem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = v10;
          v11 = v7;
          v7 = v13;
LABEL_8:

        }
      }
      ++v9;
    }
    while (v6 != v9);
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v6 = v14;
  }
  while (v14);
LABEL_16:

  return v7;
}

- (id)addSizeConstraint
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[DCSinglePixelLineView sizeLayoutAttribute](self, "sizeLayoutAttribute");
  v4 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, v3, 0, 0, 0, 1.0, 1.0 / v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1628];
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v9);

  return v7;
}

- (BOOL)hasSetUpSizeConstraint
{
  return self->_hasSetUpSizeConstraint;
}

- (void)setHasSetUpSizeConstraint:(BOOL)a3
{
  self->_hasSetUpSizeConstraint = a3;
}

@end
