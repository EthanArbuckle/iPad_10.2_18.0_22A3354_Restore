@implementation FMUILocationDetailViewController

- (FMUILocationDetailViewControllerDelegate)delegate
{
  return (FMUILocationDetailViewControllerDelegate *)(id)MEMORY[0x24260DA50]((char *)self+ OBJC_IVAR___FMUILocationDetailViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)dealloc
{
  FMUILocationDetailViewController *v2;

  v2 = self;
  LocationDetailViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___FMUILocationDetailViewController_hostingViewController));
  sub_23BB01658((uint64_t)self + OBJC_IVAR___FMUILocationDetailViewController_delegate);

}

- (void)setViewOptions:(id)a3
{
  id v4;
  FMUILocationDetailViewController *v5;

  v4 = a3;
  v5 = self;
  LocationDetailViewController.setViewOptions(_:)(v4);

}

- (void)setRemoteParticipantHandles:(id)a3 localParticipantHandle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  FMUILocationDetailViewController *v9;
  Swift::String v10;

  v5 = sub_23BB8A8EC();
  v6 = sub_23BB8A7B4();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  LocationDetailViewController.set(remoteParticipantHandles:localParticipantHandle:)((Swift::OpaquePointer)v5, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startObservingHandles:(id)a3 callerHandle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  FMUILocationDetailViewController *v9;
  Swift::String_optional v10;

  v6 = sub_23BB8A8EC();
  if (a4)
  {
    v7 = sub_23BB8A7B4();
    a4 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  LocationDetailViewController.startObserving(handles:from:groupName:)((Swift::OpaquePointer)v6, v10, (Swift::String_optional)0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startObservingHandles:(id)a3 callerHandle:(id)a4 groupName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  FMUILocationDetailViewController *v13;
  Swift::String_optional v14;
  Swift::String_optional v15;

  v8 = sub_23BB8A8EC();
  if (!a4)
  {
    v9 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = sub_23BB8A7B4();
  a4 = v10;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v11 = sub_23BB8A7B4();
  a5 = v12;
LABEL_6:
  v13 = self;
  v14.value._countAndFlagsBits = v9;
  v14.value._object = a4;
  v15.value._countAndFlagsBits = v11;
  v15.value._object = a5;
  LocationDetailViewController.startObserving(handles:from:groupName:)((Swift::OpaquePointer)v8, v14, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startObservingContacts:(id)a3
{
  uint64_t v4;
  FMUILocationDetailViewController *v5;

  sub_23B9C60B4(0, (unint64_t *)&qword_256A61440);
  v4 = sub_23BB8A8EC();
  v5 = self;
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v4, (Swift::String_optional)0, (Swift::String_optional)0);

  swift_bridgeObjectRelease();
}

- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  FMUILocationDetailViewController *v9;
  Swift::String_optional v10;

  sub_23B9C60B4(0, (unint64_t *)&qword_256A61440);
  v6 = sub_23BB8A8EC();
  if (a4)
  {
    v7 = sub_23BB8A7B4();
    a4 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  v10.value._countAndFlagsBits = v7;
  v10.value._object = a4;
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v6, v10, (Swift::String_optional)0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)startObservingContacts:(id)a3 fromCallerHandle:(id)a4 groupName:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  FMUILocationDetailViewController *v13;
  Swift::String_optional v14;
  Swift::String_optional v15;

  sub_23B9C60B4(0, (unint64_t *)&qword_256A61440);
  v8 = sub_23BB8A8EC();
  if (!a4)
  {
    v9 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = sub_23BB8A7B4();
  a4 = v10;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v11 = sub_23BB8A7B4();
  a5 = v12;
LABEL_6:
  v13 = self;
  v14.value._countAndFlagsBits = v9;
  v14.value._object = a4;
  v15.value._countAndFlagsBits = v11;
  v15.value._object = a5;
  LocationDetailViewController.startObserving(contacts:from:groupName:)((Swift::OpaquePointer)v8, v14, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)stopObserving
{
  FMUILocationDetailViewController *v2;

  v2 = self;
  LocationDetailViewController.stopObserving()();

}

- (void)pauseSubscriptions
{
  FMUILocationDetailViewController *v2;

  v2 = self;
  LocationDetailViewController.pauseSubscriptions()();

}

- (void)resumeSubscriptions
{
  FMUILocationDetailViewController *v2;

  v2 = self;
  LocationDetailViewController.resumeSubscriptions()();

}

- (void)viewIsAppearing:(BOOL)a3
{
  FMUILocationDetailViewController *v4;

  v4 = self;
  LocationDetailViewController.viewIsAppearing(_:)(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  FMUILocationDetailViewController *v4;

  v4 = self;
  LocationDetailViewController.viewDidDisappear(_:)(a3);

}

- (UINavigationItem)navigationItem
{
  return (UINavigationItem *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___FMUILocationDetailViewController_hostingViewController), sel_navigationItem);
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___FMUILocationDetailViewController_hostingViewController), sel_contentScrollViewForEdge_, a3);
}

- (void)viewDidLoad
{
  FMUILocationDetailViewController *v2;

  v2 = self;
  LocationDetailViewController.viewDidLoad()();

}

- (FMUILocationDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23BB8A7B4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (FMUILocationDetailViewController *)LocationDetailViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (FMUILocationDetailViewController)initWithCoder:(id)a3
{
  return (FMUILocationDetailViewController *)LocationDetailViewController.init(coder:)(a3);
}

@end
