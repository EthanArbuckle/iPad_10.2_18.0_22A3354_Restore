@implementation SKButtonNodeSprite

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKButtonNodeSprite)init
{
  SKButtonNodeSprite *v2;
  SKButtonNodeSprite *v3;
  uint64_t v4;
  SKAction *downAction;
  uint64_t v6;
  SKAction *upAction;
  id downBlock;
  id upBlock;
  id upInsideBlock;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SKButtonNodeSprite;
  v2 = -[SKSpriteNode init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SKNode setUserInteractionEnabled:](v2, "setUserInteractionEnabled:", 1);
    v3->_touches = 0;
    +[SKScale scaleBy:duration:](SKScale, "scaleBy:duration:", 1.3, 0.05);
    v4 = objc_claimAutoreleasedReturnValue();
    downAction = v3->_downAction;
    v3->_downAction = (SKAction *)v4;

    +[SKScale scaleBy:duration:](SKScale, "scaleBy:duration:", 0.769230769, 0.1);
    v6 = objc_claimAutoreleasedReturnValue();
    upAction = v3->_upAction;
    v3->_upAction = (SKAction *)v6;

    objc_storeWeak((id *)&v3->_delegate, 0);
    downBlock = v3->_downBlock;
    v3->_downBlock = 0;

    upBlock = v3->_upBlock;
    v3->_upBlock = 0;

    upInsideBlock = v3->_upInsideBlock;
    v3->_upInsideBlock = 0;

  }
  return v3;
}

+ (id)buttonWithFontNamed:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "labelNodeWithFontNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SKButtonNodeSprite)initWithCoder:(id)a3
{
  id v4;
  SKButtonNodeSprite *v5;
  SKButtonNodeSprite *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKButtonNodeSprite;
  v5 = -[SKSpriteNode initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[SKNode setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    v6->_touches = 0;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_downAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKButtonNodeSprite setDownAction:](v6, "setDownAction:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_upAction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKButtonNodeSprite setUpAction:](v6, "setUpAction:", v8);

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKButtonNodeSprite;
  v4 = a3;
  -[SKSpriteNode encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_downAction, CFSTR("_downAction"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_upAction, CFSTR("_upAction"));

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[SKNode scene](self, "scene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        v15 = v9;
        if (v13)
        {
          objc_msgSend(v12, "locationInNode:", v13);
          -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v13);
          v15 = v16;
          v14 = v17;
        }
        -[SKButtonNodeSprite touchBegan:location:](self, "touchBegan:location:", objc_msgSend(v12, "hash"), v15, v14);

        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        -[SKNode scene](self, "scene");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v10;
        v15 = v9;
        if (v13)
        {
          objc_msgSend(v12, "locationInNode:", v13);
          -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v13);
          v15 = v16;
          v14 = v17;
        }
        -[SKButtonNodeSprite touchEnded:location:](self, "touchEnded:location:", objc_msgSend(v12, "hash"), v15, v14);

        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

- (void)touchBegan:(unint64_t)a3 location:(CGPoint)a4
{
  int touches;
  id WeakRetained;
  id v7;
  void (**downBlock)(id, SKButtonNodeSprite *);

  touches = self->_touches;
  self->_touches = touches + 1;
  if (!touches)
  {
    if (self->_downAction)
    {
      -[SKNode removeActionForKey:](self, "removeActionForKey:", CFSTR("SKButtonNode.action.up"), a4.x, a4.y);
      -[SKNode runAction:withKey:](self, "runAction:withKey:", self->_downAction, CFSTR("SKButtonNode.action.down"));
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "touchDownInsideButton:", self);

    }
    downBlock = (void (**)(id, SKButtonNodeSprite *))self->_downBlock;
    if (downBlock)
      downBlock[2](downBlock, self);
  }
}

- (void)touchEnded:(unint64_t)a3 location:(CGPoint)a4
{
  int touches;
  BOOL v5;
  double y;
  double x;
  SKAction *upAction;
  void *v10;
  void (**upBlock)(id, SKButtonNodeSprite *);
  id WeakRetained;
  id v13;
  void (**upInsideBlock)(id, SKButtonNodeSprite *);

  touches = self->_touches;
  v5 = __OFSUB__(touches--, 1);
  self->_touches = touches;
  if ((touches < 0) ^ v5 | (touches == 0))
  {
    y = a4.y;
    x = a4.x;
    self->_touches = 0;
    upAction = self->_upAction;
    if (upAction)
    {
      +[SKRunAction runAction:afterActionWithKey:](SKRunAction, "runAction:afterActionWithKey:", upAction, CFSTR("SKButtonNode.action.down"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKNode runAction:withKey:](self, "runAction:withKey:", v10, CFSTR("SKButtonNode.action.up"));

    }
    upBlock = (void (**)(id, SKButtonNodeSprite *))self->_upBlock;
    if (upBlock)
      upBlock[2](upBlock, self);
    if (-[SKNode containsPoint:](self, "containsPoint:", x, y))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v13, "touchUpInsideButton:", self);

      }
      upInsideBlock = (void (**)(id, SKButtonNodeSprite *))self->_upInsideBlock;
      if (upInsideBlock)
        upInsideBlock[2](upInsideBlock, self);
    }
  }
}

- (void)onTouchUpInside:(id)a3
{
  void *v4;
  id upInsideBlock;

  v4 = (void *)MEMORY[0x1DF0CFCB0](a3, a2);
  upInsideBlock = self->_upInsideBlock;
  self->_upInsideBlock = v4;

}

- (void)onTouchUp:(id)a3
{
  void *v4;
  id upBlock;

  v4 = (void *)MEMORY[0x1DF0CFCB0](a3, a2);
  upBlock = self->_upBlock;
  self->_upBlock = v4;

}

- (void)onTouchDownInside:(id)a3
{
  void *v4;
  id downBlock;

  v4 = (void *)MEMORY[0x1DF0CFCB0](a3, a2);
  downBlock = self->_downBlock;
  self->_downBlock = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKButtonNodeSprite;
  v4 = -[SKSpriteNode copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 22, self->_downAction);
  objc_storeStrong(v4 + 23, self->_upAction);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak(v4 + 21, WeakRetained);

  return v4;
}

- (SKButtonNodeSpriteDelegate)delegate
{
  return (SKButtonNodeSpriteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SKAction)downAction
{
  return self->_downAction;
}

- (void)setDownAction:(id)a3
{
  objc_storeStrong((id *)&self->_downAction, a3);
}

- (SKAction)upAction
{
  return self->_upAction;
}

- (void)setUpAction:(id)a3
{
  objc_storeStrong((id *)&self->_upAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upInsideBlock, 0);
  objc_storeStrong(&self->_upBlock, 0);
  objc_storeStrong(&self->_downBlock, 0);
  objc_storeStrong((id *)&self->_upAction, 0);
  objc_storeStrong((id *)&self->_downAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
