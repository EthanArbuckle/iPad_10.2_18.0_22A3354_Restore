@implementation MediaControlsInteractionRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  MSVTimer *v11;
  MSVTimer *interactionTimer;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 1);
  -[MSVTimer invalidate](self->_interactionTimer, "invalidate");
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0D4D110]);
  v9 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__MediaControlsInteractionRecognizer_touchesBegan_withEvent___block_invoke;
  v13[3] = &unk_1E5818E18;
  objc_copyWeak(&v14, &location);
  v11 = (MSVTimer *)objc_msgSend(v8, "initWithInterval:queue:block:", v9, v13, 1.0);
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __61__MediaControlsInteractionRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 2);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 2, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  MSVTimer *interactionTimer;

  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 3, a4);
  -[MSVTimer invalidate](self->_interactionTimer, "invalidate");
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = 0;

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  MSVTimer *interactionTimer;

  -[MediaControlsInteractionRecognizer setState:](self, "setState:", 4, a4);
  -[MSVTimer invalidate](self->_interactionTimer, "invalidate");
  interactionTimer = self->_interactionTimer;
  self->_interactionTimer = 0;

}

- (MSVTimer)interactionTimer
{
  return self->_interactionTimer;
}

- (void)setInteractionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_interactionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionTimer, 0);
}

@end
