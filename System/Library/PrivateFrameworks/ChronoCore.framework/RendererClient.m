@implementation RendererClient

- (_TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient)init
{
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *result;

  result = (_TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__processHandle));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_connection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_runningAssertion));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__queue_runningAssertionExpirationTimer));
}

- (void)subscribe:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v11;

  v6 = _Block_copy(a4);
  v7 = a3;
  v11 = self;
  v8 = sub_1D29C1668();
  v10 = v9;

  _Block_copy(v6);
  sub_1D28F887C(v8, v10, v11, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_1D273BE68(v8, v10);

}

- (void)unsubscribe:(id)a3
{
  id v4;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v5;

  v4 = a3;
  v5 = self;
  sub_1D28F5CBC(v4);

}

- (void)reloadWidget:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D28F6034(v6, v7);

}

- (void)reloadWidgetIfFailed:(id)a3 reason:(id)a4
{
  id v7;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v8;
  id v9;
  id v10;
  id v11;

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)((char *)&self->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__services)+ 35, (*(_QWORD **)((char *)&self->super.isa+ OBJC_IVAR____TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient__services))[38]);
  v11 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v11, sel_widget);
  v10 = objc_msgSend(v11, sel_metrics);
  LOBYTE(a3) = sub_1D29C3EB8();

  if ((a3 & 1) != 0)
    -[RendererClient reloadWidget:reason:](v8, sel_reloadWidget_reason_, v11, v7);

}

- (void)handleInteraction:(id)a3 keybagLockPolicy:(id)a4 action:(id)a5 handler:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v15;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;
  sub_1D28F6514(v12, v13, v14, (uint64_t)sub_1D27B3278, v11);

  swift_release();
}

- (void)setVisiblySettled:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D28F699C(v6, v7);

}

- (void)setWidgetTaskPriority:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D28F6CBC(v6, v7);

}

- (void)setEnvironmentModifiers:(id)a3 forSession:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtC10ChronoCoreP33_731F44D3DADC24C2E2FB65578CCF91B114RendererClient *v11;

  v6 = a3;
  v7 = a4;
  v11 = self;
  v8 = sub_1D29C1668();
  v10 = v9;

  sub_1D28F71FC(v8, v10, v7);
  sub_1D273BE68(v8, v10);

}

@end
