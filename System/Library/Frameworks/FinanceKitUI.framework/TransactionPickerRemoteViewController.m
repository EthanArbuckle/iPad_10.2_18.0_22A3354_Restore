@implementation TransactionPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2561118A0);
}

+ (id)exportedInterface
{
  return (id)_s12FinanceKitUI35TransactionPickerExportedInterfacesO14remoteProtocolSo14NSXPCInterfaceCyFZ_0();
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_2339A2EBC(a3);

}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController *v11;
  objc_super v13;

  if (a3)
  {
    sub_2339D42E4();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
    *v6 = 0;
    v6[1] = 0;
    v7 = a4;
    v8 = (void *)sub_2339D42C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
    *v9 = 0;
    v9[1] = 0;
    v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TransactionPickerRemoteViewController();
  v11 = -[TransactionPickerRemoteViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v8, a4);

  return v11;
}

- (_TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController_delegate);
  v6 = (objc_class *)type metadata accessor for TransactionPickerRemoteViewController();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[TransactionPickerRemoteViewController initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)foundWithTransactions:(id)a3
{
  id v4;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2339A32E8(v4);

}

- (void)cancelled
{
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController *v2;

  v2 = self;
  sub_2339A358C();

}

- (void)failedWith:(id)a3
{
  id v4;
  _TtC12FinanceKitUIP33_6287C40558B61A6945C038C9D260157B37TransactionPickerRemoteViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2339A36EC(v4);

}

@end
