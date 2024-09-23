@implementation CKUIVideoEditorController

- (BOOL)wantsWindowedPresentation
{
  *((_BYTE *)&self->super._flags + 4) = 1;
  return 1;
}

- (BOOL)preserveModalPresentationStyle
{
  *((_BYTE *)&self->super._flags + 5) = 0;
  return 0;
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  *((_BYTE *)&self->super._flags + 4) = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  *((_BYTE *)&self->super._flags + 5) = a3;
}

@end
