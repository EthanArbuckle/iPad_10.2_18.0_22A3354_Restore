@implementation MRUSessionsContainerViewController

- (void)viewDidLoad
{
  MRUSessionsContainerViewController *v2;

  v2 = self;
  sub_1AAAB80D0();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (MPMediaControlsConfiguration)configuration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUSessionsContainerViewController_configuration);
  swift_beginAccess();
  return (MPMediaControlsConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___MRUSessionsContainerViewController_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)dismissalBlock
{
  return sub_1AAAB85DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock, (uint64_t)sub_1AAA887B8, (uint64_t)&block_descriptor_23_0);
}

- (void)setDismissalBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AAAB907C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1AAA8E77C(v7);
}

- (id)customRowTappedBlock
{
  return sub_1AAAB85DC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock, (uint64_t)sub_1AAAB8694, (uint64_t)&block_descriptor_17);
}

- (void)setCustomRowTappedBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AAAB903C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1AAA8E77C(v7);
}

- (void)transitionToVisible:(BOOL)a3 animated:(BOOL)a4
{
  MRUSessionsContainerViewController *v6;

  v6 = self;
  sub_1AAAB87D4(a3, a4);

}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  MRUSessionsContainerViewController *v10;

  v4 = a3;
  v10 = self;
  v5 = *sub_1AAA81D2C();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (Class *)((char *)&v10->super.super.super.isa
               + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  v8 = *(uint64_t *)((char *)&v10->super.super.super.isa
                  + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  *v7 = sub_1AAAB8A90;
  v7[1] = v6;
  v9 = v4;
  sub_1AAA8E77C(v8);

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void (*v3)(id);
  MRUSessionsContainerViewController *v6;

  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize);
  if (v3)
  {
    swift_unknownObjectRetain();
    v6 = self;
    sub_1AAA8E76C((uint64_t)v3);
    v3(objc_msgSend(a3, sel_preferredContentSize));
    sub_1AAA8E77C((uint64_t)v3);
    swift_unknownObjectRelease();

  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  void (*v6)(void);
  uint64_t v7;
  MRUSessionsContainerViewController *v8;

  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0xE8);
  v5 = a3;
  v8 = self;
  v6 = (void (*)(void))v4();
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6();
    sub_1AAA8E77C(v7);
  }

}

- (MRUSessionsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1AAABA478();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (MRUSessionsContainerViewController *)sub_1AAAB8D28(v5, v7, a4);
}

- (MRUSessionsContainerViewController)initWithCoder:(id)a3
{
  return (MRUSessionsContainerViewController *)sub_1AAAB8E64(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___popoverSourceView));
  sub_1AAA842C0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___sessionsTransitioningDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController____lazy_storage___sessionsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MRUSessionsContainerViewController_configuration));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MRUSessionsContainerViewController_dismissalBlock));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MRUSessionsContainerViewController_customRowTappedBlock));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___MRUSessionsContainerViewController_updatePopoverContentSize));
}

@end
