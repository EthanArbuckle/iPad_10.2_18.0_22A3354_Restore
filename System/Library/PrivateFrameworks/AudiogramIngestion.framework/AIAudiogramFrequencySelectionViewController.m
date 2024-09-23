@implementation AIAudiogramFrequencySelectionViewController

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 selectedFrequencies:(id)a5 delegate:(id)a6 isModal:(BOOL)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = sub_22FB8D160();
  v11 = v10;
  v12 = sub_22FB8D160();
  v14 = v13;
  sub_22FB7E3E8();
  v15 = sub_22FB8D1D8();
  swift_unknownObjectRetain();
  return (AIAudiogramFrequencySelectionViewController *)AudiogramFrequencySelectionViewController.init(title:detailText:selectedFrequencies:delegate:isModal:)(v9, v11, v12, v14, v15, (uint64_t)a6, a7);
}

- (void)viewWillAppear:(BOOL)a3
{
  AIAudiogramFrequencySelectionViewController *v4;

  v4 = self;
  sub_22FB7F2E4(a3);

}

- (void)viewDidLoad
{
  AIAudiogramFrequencySelectionViewController *v2;

  v2 = self;
  sub_22FB7F430();

}

- (void)viewDidLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for AudiogramFrequencySelectionViewController();
  -[OBTableWelcomeController viewDidLayoutSubviews](&v2, sel_viewDidLayoutSubviews);
}

- (void)cancelTapped:(id)a3
{
  AIAudiogramFrequencySelectionViewController *v4;
  void *v5;
  uint64_t v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22FB8D2B0();
  swift_unknownObjectRelease();
  v5 = (void *)MEMORY[0x2348AAEBC]((char *)v4 + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  if (v5)
  {
    objc_msgSend(v5, sel_cancelButtonTapped);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

- (void)doneTapped:(id)a3
{
  AIAudiogramFrequencySelectionViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22FB8D2B0();
  swift_unknownObjectRelease();
  if (*((_BYTE *)&v4->super.super.super.super.super.super.isa
       + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_isModal) == 1)
    -[AIAudiogramFrequencySelectionViewController dismissViewControllerAnimated:completion:](v4, sel_dismissViewControllerAnimated_completion_, 1, 0);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  AIAudiogramFrequencySelectionViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_22FB8D0E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8D0D0();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_22FB7F934(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4;
  id v7;
  AIAudiogramFrequencySelectionViewController *v8;
  int64_t v9;

  v4 = *(unint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_frequencies);
  if (!(v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  v9 = sub_22FB8D364();

  swift_bridgeObjectRelease();
  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  AIAudiogramFrequencySelectionViewController *v11;
  uint64_t v12;

  v6 = sub_22FB8D0E8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22FB8D0D0();
  v10 = a3;
  v11 = self;
  sub_22FB7FE78(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)continueToIndividualSensitivityPointInput:(id)a3
{
  AIAudiogramFrequencySelectionViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_22FB8D2B0();
  swift_unknownObjectRelease();
  sub_22FB809FC();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  AIAudiogramFrequencySelectionViewController *result;

  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5;
  AIAudiogramFrequencySelectionViewController *result;

  v5 = a5;
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  AIAudiogramFrequencySelectionViewController *result;

  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (AIAudiogramFrequencySelectionViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6;
  AIAudiogramFrequencySelectionViewController *result;

  v6 = a5;
  result = (AIAudiogramFrequencySelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22FB810BC((uint64_t)self + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_tableViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_audiogram));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___AIAudiogramFrequencySelectionViewController_doneButton));
}

@end
