@implementation ICNoteEditorInputAccessoryContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  ICNoteEditorInputAccessoryContainerView *v5;
  ICNoteEditorInputAccessoryContainerView *v6;
  ICNoteEditorInputAccessoryContainerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorInputAccessoryContainerView;
  -[ICNoteEditorInputAccessoryContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (ICNoteEditorInputAccessoryContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

@end
