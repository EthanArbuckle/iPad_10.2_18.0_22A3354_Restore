@implementation _MKDirectionalArrowRecognizer

- (_MKDirectionalArrowRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  _MKDirectionalArrowRecognizer *v7;
  _MKDirectionalArrowRecognizer *v8;
  _MKDirectionalArrowRecognizer *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MKDirectionalArrowRecognizer;
  v7 = -[_MKDirectionalArrowRecognizer init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_action = a4;
    v9 = v8;
  }

  return v8;
}

- (void)setState:(int64_t)a3
{
  id WeakRetained;

  self->_state = a3;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_msgSend(WeakRetained, "performSelector:withObject:", self->_action, self);

}

- (void)handleArrowMask:(int64_t)a3
{
  int64_t arrows;
  int64_t v6;

  arrows = self->_arrows;
  self->_arrows = a3;
  self->_lastArrows = arrows;
  v6 = -[_MKDirectionalArrowRecognizer state](self, "state");
  if (a3)
  {
    if (v6 != 1 && -[_MKDirectionalArrowRecognizer state](self, "state") != 2)
      -[_MKDirectionalArrowRecognizer setState:](self, "setState:", 1);
    -[_MKDirectionalArrowRecognizer setState:](self, "setState:", 2);
  }
  else if (v6 == 1 || -[_MKDirectionalArrowRecognizer state](self, "state") == 2)
  {
    -[_MKDirectionalArrowRecognizer setState:](self, "setState:", 3);
    self->_lastArrows = 0;
  }
}

- (void)keyDown:(id)a3
{
  int64_t arrows;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "key");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_modifierFlags = objc_msgSend(v6, "modifierFlags");
  arrows = self->_arrows;
  v5 = objc_msgSend(v6, "keyCode");
  switch(v5)
  {
    case 'O':
      arrows |= 0x10uLL;
      goto LABEL_8;
    case 'P':
      arrows |= 8uLL;
      goto LABEL_8;
    case 'Q':
      goto LABEL_6;
    case 'R':
      goto LABEL_5;
    default:
      if (v5 == 45)
      {
LABEL_6:
        arrows |= 4uLL;
      }
      else if (v5 == 46)
      {
LABEL_5:
        arrows |= 2uLL;
      }
LABEL_8:
      -[_MKDirectionalArrowRecognizer handleArrowMask:](self, "handleArrowMask:", arrows);

      return;
  }
}

- (void)keyUp:(id)a3
{
  void *v4;
  int64_t arrows;
  uint64_t v6;
  id v7;

  self->_modifierFlags = 0;
  objc_msgSend(a3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  arrows = self->_arrows;
  v7 = v4;
  v6 = objc_msgSend(v4, "keyCode");
  switch(v6)
  {
    case 'O':
      arrows &= ~0x10uLL;
      goto LABEL_8;
    case 'P':
      arrows &= ~8uLL;
      goto LABEL_8;
    case 'Q':
      goto LABEL_6;
    case 'R':
      goto LABEL_5;
    default:
      if (v6 == 45)
      {
LABEL_6:
        arrows &= ~4uLL;
      }
      else if (v6 == 46)
      {
LABEL_5:
        arrows &= ~2uLL;
      }
LABEL_8:
      -[_MKDirectionalArrowRecognizer handleArrowMask:](self, "handleArrowMask:", arrows);

      return;
  }
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)arrows
{
  return self->_arrows;
}

- (int64_t)lastArrows
{
  return self->_lastArrows;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
