@implementation SFClickableButton

- (void)setClickEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _UIClickInteraction *clickInteraction;
  _UIClickInteraction *v6;
  _UIClickInteraction *v7;
  _UIClickInteraction *v8;

  v3 = a3;
  clickInteraction = self->_clickInteraction;
  if (v3)
  {
    if (!clickInteraction)
    {
      v6 = (_UIClickInteraction *)objc_alloc_init(MEMORY[0x1E0DC4078]);
      v7 = self->_clickInteraction;
      self->_clickInteraction = v6;

      -[_UIClickInteraction setDelegate:](self->_clickInteraction, "setDelegate:", self);
      -[SFClickableButton addInteraction:](self, "addInteraction:", self->_clickInteraction);
    }
  }
  else if (clickInteraction)
  {
    -[SFClickableButton removeInteraction:](self, "removeInteraction:");
    v8 = self->_clickInteraction;
    self->_clickInteraction = 0;

  }
}

- (BOOL)isClickEnabled
{
  return self->_clickInteraction != 0;
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)clickInteractionDidClickDown:(id)a3
{
  -[SFClickableButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickInteraction, 0);
}

@end
