@implementation NTKStopwatchComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 4;
}

- (void)_deactivate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)hasTapAction
{
  return 1;
}

- (void)performTapActionForDisplayWrapper:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E98];
  v5 = a3;
  objc_msgSend(v4, "URLWithString:", CFSTR("nanostopwatch://"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKComplicationController _openAppWithURL:forDisplayWrapper:](self, "_openAppWithURL:forDisplayWrapper:", v6, v5);

}

- (id)complicationApplicationIdentifier
{
  return CFSTR("com.apple.NanoStopwatch");
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKStopwatchComplicationController;
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](&v6, sel_setDisplayProperties_forDisplayWrapper_, a3, a4);
  -[NTKComplicationController legacyDisplay](self, "legacyDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKStopwatchComplicationController _configureForLegacyDisplay:](self, "_configureForLegacyDisplay:", v5);

}

- (void)_handleStopwatchChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NTKStopwatchComplicationController__handleStopwatchChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __60__NTKStopwatchComplicationController__handleStopwatchChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplay");
}

- (void)_updateDisplay
{
  -[NTKComplicationController enumerateDisplayWrappersWithBlock:](self, "enumerateDisplayWrappersWithBlock:", &__block_literal_global_49);
}

void __52__NTKStopwatchComplicationController__updateDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "display");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStopwatchState:elapsedTime:shouldPauseTextCountdown:timeTravelDate:", 0, 1, 0, 0.0);

}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  -[NTKStopwatchComplicationController _updateDisplay](self, "_updateDisplay");
}

- (NSDate)timeTravelDate
{
  return self->_timeTravelDate;
}

- (void)setTimeTravelDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
}

@end
