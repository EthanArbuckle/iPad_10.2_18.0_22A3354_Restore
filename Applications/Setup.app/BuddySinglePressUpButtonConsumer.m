@implementation BuddySinglePressUpButtonConsumer

- (void)consumeSinglePressUpForButtonKind:(int64_t)a3
{
  id v3;
  void (**v4)(_QWORD);

  v3 = -[BuddyButtonConsumer menuHandler](self, "menuHandler");

  if (v3)
  {
    v4 = (void (**)(_QWORD))-[BuddyButtonConsumer menuHandler](self, "menuHandler");
    v4[2](v4);

  }
}

@end
