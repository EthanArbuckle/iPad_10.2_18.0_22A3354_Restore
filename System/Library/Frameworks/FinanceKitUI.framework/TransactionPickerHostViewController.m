@implementation TransactionPickerHostViewController

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithCoder:(id)a3
{
  _QWORD *v3;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *result;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_delegate);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler) = 0;

  result = (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *)sub_2339D4A04();
  __break(1u);
  return result;
}

- (void)dealloc
{
  void *v3;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler);
  v4 = self;
  if (v3)

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TransactionPickerHostViewController();
  -[TransactionPickerHostViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_cancelRequestHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_activityIndicator));
}

- (void)viewWillLayoutSubviews
{
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *v2;

  v2 = self;
  sub_2339A246C();

}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *result;

  v4 = a4;
  result = (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B35TransactionPickerHostViewController_remoteViewController));
}

@end
