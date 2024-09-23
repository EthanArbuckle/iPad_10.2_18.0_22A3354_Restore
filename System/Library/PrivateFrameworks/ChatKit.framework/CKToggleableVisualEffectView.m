@implementation CKToggleableVisualEffectView

- (BOOL)isEffectActive
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEffectActive:(BOOL)a3
{
  _BOOL4 v3;
  _BYTE *v5;
  id v6;
  CKToggleableVisualEffectView *v7;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive;
  swift_beginAccess();
  v6 = 0;
  *v5 = v3;
  if (v3)
    v6 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect));
  v7 = self;
  -[CKToggleableVisualEffectView setEffect:](v7, sel_setEffect_, v6);

}

- (CKToggleableVisualEffectView)initWithEffect:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive) = 1;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToggleableVisualEffectView();
  return -[CKToggleableVisualEffectView initWithEffect:](&v5, sel_initWithEffect_, a3);
}

- (CKToggleableVisualEffectView)initWithCoder:(id)a3
{
  id v4;
  CKToggleableVisualEffectView *result;

  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR___CKToggleableVisualEffectView_isEffectActive) = 1;
  v4 = a3;

  result = (CKToggleableVisualEffectView *)sub_18E769320();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CKToggleableVisualEffectView_toggleableEffect));
}

@end
