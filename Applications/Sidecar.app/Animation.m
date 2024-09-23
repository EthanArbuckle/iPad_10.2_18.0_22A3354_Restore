@implementation Animation

- (void)dealloc
{
  _TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation *v2;

  v2 = self;
  sub_10000E838();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->sentCompletion[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion]);
}

- (double)transitionDuration:(id)a3
{
  return sub_10000E8EC();
}

- (void)animateTransition:(id)a3
{
  nullsub_1(a3, a2);
}

- (void)animationEnded:(BOOL)a3
{
  _TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation *v3;

  v3 = self;
  sub_10000E93C();

}

- (_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation)init
{
  sub_10000E9B8();
}

@end
