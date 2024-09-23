@implementation WKNSKeyEventSimulatorUndoManager

- (BOOL)canUndo
{
  return 1;
}

- (BOOL)canRedo
{
  return 1;
}

- (void)undo
{
  -[WKContentView generateSyntheticEditingCommand:](-[WKNSUndoManager contentView](self, "contentView"), "generateSyntheticEditingCommand:", 0);
}

- (void)redo
{
  -[WKContentView generateSyntheticEditingCommand:](-[WKNSUndoManager contentView](self, "contentView"), "generateSyntheticEditingCommand:", 1);
}

@end
