@implementation AAUIBadge

- (AAUIBadge)init
{
  AAUIBadge *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIBadge;
  result = -[AAUIBadge init](&v3, sel_init);
  if (result)
    result->_position = (CGPoint)*MEMORY[0x24BDBEFB0];
  return result;
}

- (void)setMaxRotationY:(double)a3
{
  self->_maxRotationY = a3;
  self->_locksRotationY = 1;
}

- (double)rotationY
{
  return self->_rotationY;
}

- (void)setRotationY:(double)a3
{
  double maxRotationY;

  if (self->_locksRotationY)
  {
    maxRotationY = self->_maxRotationY;
    if (-maxRotationY >= a3)
      a3 = -maxRotationY;
    if (a3 >= maxRotationY)
      a3 = self->_maxRotationY;
  }
  self->_rotationY = a3;
}

- (double)rotationX
{
  return self->_rotationX;
}

- (id)_newAnimatablePropertyForType:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  id *v6;
  id *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  objc_initWeak(&location, self);
  if (a3 == 2)
  {
    v9 = objc_alloc(MEMORY[0x24BE01C78]);
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_5;
    v17[3] = &unk_24E0B2BE8;
    v6 = &v18;
    objc_copyWeak(&v18, &location);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_6;
    v15[3] = &unk_24E0B2C10;
    v7 = &v16;
    objc_copyWeak(&v16, &location);
    v8 = objc_msgSend(v9, "initWithGetter:setter:", v17, v15);
  }
  else if (a3 == 1)
  {
    v11 = objc_alloc(MEMORY[0x24BE01C78]);
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_3;
    v21[3] = &unk_24E0B2BE8;
    v6 = &v22;
    objc_copyWeak(&v22, &location);
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_4;
    v19[3] = &unk_24E0B2C10;
    v7 = &v20;
    objc_copyWeak(&v20, &location);
    v8 = objc_msgSend(v11, "initWithGetter:setter:", v21, v19);
  }
  else
  {
    if (a3)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v4 = objc_alloc(MEMORY[0x24BE01C78]);
    v5 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke;
    v25[3] = &unk_24E0B2BE8;
    v6 = &v26;
    objc_copyWeak(&v26, &location);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_2;
    v23[3] = &unk_24E0B2C10;
    v7 = &v24;
    objc_copyWeak(&v24, &location);
    v8 = objc_msgSend(v4, "initWithGetter:setter:", v25, v23);
  }
  v13 = (void *)v8;
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
LABEL_9:
  objc_destroyWeak(&location);
  return v13;
}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD1968];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "position");
  objc_msgSend(v1, "valueWithCGPoint:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;

  objc_msgSend(a2, "CGPointValue");
  v4 = v3;
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPosition:", v4, v6);

}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rotationX");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_4(uint64_t a1, void *a2)
{
  float v3;
  double v4;
  id WeakRetained;

  objc_msgSend(a2, "floatValue");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRotationX:", v4);

}

id __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;
  void *v3;

  v1 = (void *)MEMORY[0x24BDD16E0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rotationY");
  objc_msgSend(v1, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __43__AAUIBadge__newAnimatablePropertyForType___block_invoke_6(uint64_t a1, void *a2)
{
  float v3;
  double v4;
  id WeakRetained;

  objc_msgSend(a2, "floatValue");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRotationY:", v4);

}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (void)setRotationX:(double)a3
{
  self->_rotationX = a3;
}

- (BOOL)locksRotationY
{
  return self->_locksRotationY;
}

- (double)maxRotationY
{
  return self->_maxRotationY;
}

@end
