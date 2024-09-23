@implementation MOAngelRootViewController

- (_TtC16MomentsUIService25MOAngelRootViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC16MomentsUIService25MOAngelRootViewController *result;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_angelWrapper, 0);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_presentedSheetController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_currentlyPresentedOptions) = 0;
  v5 = a3;

  result = (_TtC16MomentsUIService25MOAngelRootViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001BLL, 0x80000001001AB340, "MomentsUIService/MOSuggestionSheetViewController.swift", 54, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOAngelRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  @objc MOAngelRootViewController.init(nibName:bundle:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MomentsUIService.MOAngelRootViewController", 42);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_angelWrapper);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_privacyBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_presentedSheetController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_currentlyPresentedOptions));
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4;
  _TtC16MomentsUIService25MOAngelRootViewController *v5;

  v4 = a3;
  v5 = self;
  MOAngelRootViewController.sheetPresentationControllerDidChangeSelectedDetentIdentifier(_:)((UISheetPresentationController)v4);

}

@end
