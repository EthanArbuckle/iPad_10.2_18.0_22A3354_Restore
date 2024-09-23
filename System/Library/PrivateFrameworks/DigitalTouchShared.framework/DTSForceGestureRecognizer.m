@implementation DTSForceGestureRecognizer

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DTSForceGestureRecognizer;
  -[DTSForceGestureRecognizer reset](&v3, sel_reset);
  self->_startTime = 0.0;
  self->_hasSufficientForce = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DTSForceGestureRecognizer;
  v6 = a3;
  -[DTSForceGestureRecognizer touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timestamp");
  self->_startTime = v8;

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  void *v13;
  double v14;
  double v15;
  double startTime;
  unint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DTSForceGestureRecognizer;
  -[DTSForceGestureRecognizer touchesMoved:withEvent:](&v23, sel_touchesMoved_withEvent_, v6, a4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "force", (_QWORD)v19);
        if (!self->_hasSufficientForce)
        {
          self->_hasSufficientForce = v12 >= 2.0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v7, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v15 = v14;
  startTime = self->_startTime;

  v17 = -[DTSForceGestureRecognizer state](self, "state");
  if (!self->_hasSufficientForce && v15 - startTime > 0.2 && v17 <= 1)
    -[DTSForceGestureRecognizer setState:](self, "setState:", 5, v15 - startTime);

}

- (void)setState:(int64_t)a3
{
  objc_super v3;

  if (a3 == 1)
  {
    if (self->_hasSufficientForce)
      a3 = 1;
    else
      a3 = 5;
  }
  v3.receiver = self;
  v3.super_class = (Class)DTSForceGestureRecognizer;
  -[DTSForceGestureRecognizer setState:](&v3, sel_setState_, a3);
}

@end
