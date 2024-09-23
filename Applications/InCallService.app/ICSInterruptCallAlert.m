@implementation ICSInterruptCallAlert

- (ICSInterruptCallAlert)initWithCallback:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject(&unk_10028C910, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  return (ICSInterruptCallAlert *)sub_1001854A0((uint64_t)sub_10018584C, v4);
}

- (NSString)title
{
  return (NSString *)sub_100185690(self, (uint64_t)a2, sub_100185558);
}

- (NSString)message
{
  return (NSString *)sub_100185690(self, (uint64_t)a2, sub_1001855C0);
}

- (NSString)defaultButtonTitle
{
  return (NSString *)sub_100185690(self, (uint64_t)a2, sub_100185628);
}

- (NSString)otherButtonTitle
{
  return (NSString *)sub_100185690(self, (uint64_t)a2, sub_1001856F4);
}

- (void)defaultResponse
{
  ICSInterruptCallAlert *v2;

  v2 = self;
  sub_100185750();

}

- (ICSInterruptCallAlert)init
{
  sub_1001857BC();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->callback[OBJC_IVAR___ICSInterruptCallAlert_callback]);
}

@end
