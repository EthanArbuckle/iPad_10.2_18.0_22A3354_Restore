@implementation AXCyclingView

- (void)beginCycling
{
  void *v3;
  unint64_t v4;

  -[AXCyclingView viewsInCycle](self, "viewsInCycle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[AXCyclingView _updateForCycleIndex](self, "_updateForCycleIndex");
    -[AXCyclingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__makeNextViewVisible, 0, 2.0);
  }
}

- (void)endCycling
{
  -[AXCyclingView setCycleIndex:](self, "setCycleIndex:", 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__makeNextViewVisible, 0);
  if (-[AXCyclingView isMakingNextViewVisible](self, "isMakingNextViewVisible"))
    -[AXCyclingView setShouldSkipMakingNextViewVisible:](self, "setShouldSkipMakingNextViewVisible:", 1);
}

- (void)didMoveToWindow
{
  void *v3;

  -[AXCyclingView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__makeNextViewVisible, 0);
}

- (void)_updateForCycleIndex
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  -[AXCyclingView viewsInCycle](self, "viewsInCycle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      if (i == -[AXCyclingView cycleIndex](self, "cycleIndex"))
        v6 = 1.0;
      else
        v6 = 0.0;
      -[AXCyclingView viewsInCycle](self, "viewsInCycle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", v6);

      -[AXCyclingView delegate](self, "delegate");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[AXCyclingView delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          -[AXCyclingView delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXCyclingView viewsInCycle](self, "viewsInCycle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "cyclingViewDidPresentView:", v15);

        }
      }
    }
  }
}

- (void)_makeNextViewVisible
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[AXCyclingView setIsMakingNextViewVisible:](self, "setIsMakingNextViewVisible:", 1);
  -[AXCyclingView setCycleIndex:](self, "setCycleIndex:", -[AXCyclingView cycleIndex](self, "cycleIndex") + 1);
  v3 = -[AXCyclingView cycleIndex](self, "cycleIndex");
  -[AXCyclingView viewsInCycle](self, "viewsInCycle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
    -[AXCyclingView setCycleIndex:](self, "setCycleIndex:", 0);
  v6[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__AXCyclingView__makeNextViewVisible__block_invoke;
  v7[3] = &unk_1E76AB330;
  v7[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__AXCyclingView__makeNextViewVisible__block_invoke_2;
  v6[3] = &unk_1E76ABC88;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v7, v6, 0.3);
}

uint64_t __37__AXCyclingView__makeNextViewVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCycleIndex");
}

uint64_t __37__AXCyclingView__makeNextViewVisible__block_invoke_2(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldSkipMakingNextViewVisible") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__makeNextViewVisible, 0, 2.0);
  objc_msgSend(*(id *)(a1 + 32), "setIsMakingNextViewVisible:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setShouldSkipMakingNextViewVisible:", 0);
}

- (AXCyclingViewDelegate)delegate
{
  return (AXCyclingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (void)setCycleIndex:(unint64_t)a3
{
  self->_cycleIndex = a3;
}

- (BOOL)isMakingNextViewVisible
{
  return self->_isMakingNextViewVisible;
}

- (void)setIsMakingNextViewVisible:(BOOL)a3
{
  self->_isMakingNextViewVisible = a3;
}

- (BOOL)shouldSkipMakingNextViewVisible
{
  return self->_shouldSkipMakingNextViewVisible;
}

- (void)setShouldSkipMakingNextViewVisible:(BOOL)a3
{
  self->_shouldSkipMakingNextViewVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSArray)viewsInCycle
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

@end
