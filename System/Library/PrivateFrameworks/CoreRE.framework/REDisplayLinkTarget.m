@implementation REDisplayLinkTarget

- (REDisplayLinkTarget)initWithClock:(void *)a3
{
  REDisplayLinkTarget *v4;
  REDisplayLinkTarget *v5;
  REDisplayLinkTarget *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REDisplayLinkTarget;
  v4 = -[REDisplayLinkTarget init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_clock = a3;
    v6 = v4;
  }

  return v5;
}

- (void)update
{
  re::DisplayLinkClock::update((re::DisplayLinkClock *)self->_clock);
}

- (void)updateOnQueue
{
  NSObject *v3;
  _QWORD block[5];

  v3 = *((id *)self->_clock + 17);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__REDisplayLinkTarget_updateOnQueue__block_invoke;
  block[3] = &unk_24ED2D4C0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __36__REDisplayLinkTarget_updateOnQueue__block_invoke(uint64_t a1)
{
  re::DisplayLinkClock::update(*(re::DisplayLinkClock **)(*(_QWORD *)(a1 + 32) + 8));
}

@end
