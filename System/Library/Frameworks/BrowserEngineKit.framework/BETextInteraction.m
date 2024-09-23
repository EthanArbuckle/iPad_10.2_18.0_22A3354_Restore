@implementation BETextInteraction

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BETextInteraction)init
{
  BETextInteraction *v2;
  UIAsyncTextInteraction *v3;
  UIAsyncTextInteraction *interaction;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BETextInteraction;
  v2 = -[BETextInteraction init](&v6, sel_init);
  if (v2)
  {
    v3 = (UIAsyncTextInteraction *)objc_alloc_init(MEMORY[0x24BEBD400]);
    interaction = v2->_interaction;
    v2->_interaction = v3;

    -[UIAsyncTextInteraction setDelegate:](v2->_interaction, "setDelegate:", v2);
  }
  return v2;
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;

  p_view = &self->_view;
  v5 = a3;
  objc_storeWeak((id *)p_view, v5);
  objc_msgSend(v5, "addInteraction:", self->_interaction);

}

- (void)setContextMenuInteractionDelegate:(id)a3
{
  -[UIAsyncTextInteraction setContextMenuInteractionDelegate:](self->_interaction, "setContextMenuInteractionDelegate:", a3);
}

- (void)willMoveToView:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "removeInteraction:", self->_interaction);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction
{
  return (UITextSelectionDisplayInteraction *)-[UIAsyncTextInteraction textSelectionDisplayInteraction](self->_interaction, "textSelectionDisplayInteraction");
}

- (void)editabilityChanged
{
  -[UIAsyncTextInteraction editabilityChanged](self->_interaction, "editabilityChanged");
}

- (id)beTextInput
{
  UIView **p_view;
  id WeakRetained;
  int v4;
  id v5;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_25604EFD8);

  if (v4)
    v5 = objc_loadWeakRetained((id *)p_view);
  else
    v5 = 0;
  return v5;
}

- (void)addShortcutForText:(id)a3 fromRect:(CGRect)a4
{
  -[UIAsyncTextInteraction showTextServiceFor:fromRect:](self->_interaction, "showTextServiceFor:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)shareText:(id)a3 fromRect:(CGRect)a4
{
  -[UIAsyncTextInteraction showShareSheetFor:fromRect:](self->_interaction, "showShareSheetFor:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)showDictionaryForTextInContext:(id)a3 definingTextInRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  -[UIAsyncTextInteraction lookup:withRange:fromRect:](self->_interaction, "lookup:withRange:fromRect:", a3, a4.location, a4.length, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)translateText:(id)a3 fromRect:(CGRect)a4
{
  -[UIAsyncTextInteraction translate:fromRect:](self->_interaction, "translate:fromRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)showReplacementsForText:(id)a3
{
  -[UIAsyncTextInteraction scheduleReplacementsForText:](self->_interaction, "scheduleReplacementsForText:", a3);
}

- (void)transliterateChineseForText:(id)a3
{
  -[UIAsyncTextInteraction scheduleChineseTransliterationForText:](self->_interaction, "scheduleChineseTransliterationForText:", a3);
}

- (void)presentEditMenuForSelection
{
  -[UIAsyncTextInteraction presentEditMenuForSelection](self->_interaction, "presentEditMenuForSelection");
}

- (void)dismissEditMenuForSelection
{
  -[UIAsyncTextInteraction dismissEditMenuForSelection](self->_interaction, "dismissEditMenuForSelection");
}

- (void)refreshKeyboardUI
{
  -[UIAsyncTextInteraction selectionChanged](self->_interaction, "selectionChanged");
}

- (void)selectionChangedWithGestureAtPoint:(CGPoint)a3 gesture:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6
{
  UIAsyncTextInteraction *interaction;
  uint64_t v7;

  interaction = self->_interaction;
  if ((unint64_t)(a4 - 1) > 0xD)
    v7 = 0;
  else
    v7 = qword_233074F30[a4 - 1];
  -[UIAsyncTextInteraction selectionChangedWithGestureAt:withGesture:withState:withFlags:](interaction, "selectionChangedWithGestureAt:withGesture:withState:withFlags:", v7, a5, a6 & 7, a3.x, a3.y);
}

- (void)selectionBoundaryAdjustedToPoint:(CGPoint)a3 touchPhase:(int64_t)a4 flags:(unint64_t)a5
{
  UIAsyncTextInteraction *interaction;

  interaction = self->_interaction;
  if ((unint64_t)a4 >= 5)
    a4 = 5;
  -[UIAsyncTextInteraction selectionChangedWithTouchAt:withSelectionTouch:withFlags:](interaction, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", a4, a5 & 7, a3.x, a3.y);
}

- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate
{
  return (UIContextMenuInteractionDelegate *)-[UIAsyncTextInteraction contextMenuInteractionDelegate](self->_interaction, "contextMenuInteractionDelegate");
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)-[UIAsyncTextInteraction contextMenuInteraction](self->_interaction, "contextMenuInteraction");
}

- (void)selectionWillChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[BETextInteraction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemWillChangeSelectionForInteraction:", self);

  -[BETextInteraction beTextInput](self, "beTextInput");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asyncInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionWillChangeForTextInput:", v6);

}

- (void)selectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[BETextInteraction beTextInput](self, "beTextInput", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asyncInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionDidChangeForTextInput:", v6);

  -[BETextInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemDidChangeSelectionForInteraction:", self);

}

- (BETextInteractionDelegate)delegate
{
  return (BETextInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
