@implementation SUISNavigationController

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[SHSheetDraggingEvent eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:](SHSheetDraggingEvent, "eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", a4, a3, a5.x, a5.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SUISNavigationController sheetInteractionDelegate](self, "sheetInteractionDelegate"));
  objc_msgSend(v6, "sheetInteractionController:didReceiveDraggingEvent:", self, v7);

}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[SHSheetDraggingEvent eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:](SHSheetDraggingEvent, "eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", a5, a6, a3.x, a3.y, a4.x, a4.y));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SUISNavigationController sheetInteractionDelegate](self, "sheetInteractionDelegate"));
  objc_msgSend(v7, "sheetInteractionController:didReceiveDraggingEvent:", self, v8);

}

- (void)_sheetInteractionDraggingDidEnd
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[SHSheetDraggingEvent eventForDraggingDidEnd](SHSheetDraggingEvent, "eventForDraggingDidEnd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SUISNavigationController sheetInteractionDelegate](self, "sheetInteractionDelegate"));
  objc_msgSend(v3, "sheetInteractionController:didReceiveDraggingEvent:", self, v4);

}

- (SUISSheetInteractionControllerDelegate)sheetInteractionDelegate
{
  return (SUISSheetInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_sheetInteractionDelegate);
}

- (void)setSheetInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sheetInteractionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sheetInteractionDelegate);
}

@end
