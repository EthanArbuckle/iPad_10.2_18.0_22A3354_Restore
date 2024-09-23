@implementation AMSUIMessagePalette

- (AMSUIMessagePalette)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v7;
  id v8;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a5;
  return (AMSUIMessagePalette *)UIMessagePalette.init(request:bag:account:)(v7, (uint64_t)a4, a5);
}

- (AMSUIMessagePalette)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v10 = sub_21124639C();
  v12 = v11;
  v13 = sub_21124639C();
  v15 = v14;
  if (a7)
    a7 = (id)sub_211246324();
  swift_unknownObjectRetain();
  v16 = a6;
  return (AMSUIMessagePalette *)UIMessagePalette.init(serviceType:placement:bag:account:context:)(v10, v12, v13, v15, (uint64_t)a5, a6, a7);
}

- (id)widthProvider
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = sub_2111C96CC();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_2111C971C;
  v6[3] = &block_descriptor_2;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setWidthProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  AMSUIMessagePalette *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_2111CA508;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_2111C97E4((uint64_t)v4, v5);

}

- (void)enqueueImpressionMetrics
{
  AMSUIMessagePalette *v2;

  v2 = self;
  sub_2111C996C();

}

- (AMSUIMessagePalette)initWithContentView:(id)a3
{
  id v3;

  v3 = a3;
  UIMessagePalette.init(contentView:)();
}

- (void).cxx_destruct
{
  sub_2111CA52C((uint64_t)self + OBJC_IVAR___AMSUIMessagePalette_delegate);

  sub_2111C64E4(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___AMSUIMessagePalette_widthProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMSUIMessagePalette_inlineDialogController));
  swift_unknownObjectRelease();
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  UIMessagePalette.messageViewController(_:didLoad:)();
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5;

  v5 = a3;
  self;
  UIMessagePalette.messageViewController(_:didUpdate:)();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  UIMessagePalette.messageViewController(_:didSelectActionWith:)();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  AMSUIMessagePalette *v7;

  v6 = a3;
  v7 = self;
  a4;
  UIMessagePalette.messageViewController(_:didFailWithError:)();
}

@end
