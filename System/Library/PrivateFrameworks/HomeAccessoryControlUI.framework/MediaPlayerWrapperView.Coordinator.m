@implementation MediaPlayerWrapperView.Coordinator

- (_TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator_useCompactLayout) = 2;
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator_viewSize);
  v4 = (objc_class *)type metadata accessor for MediaPlayerWrapperView.Coordinator();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[MediaPlayerWrapperView.Coordinator init](&v6, sel_init);
}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtCV22HomeAccessoryControlUI22MediaPlayerWrapperView11Coordinator *v14;

  v8 = _Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (!v8)
  {
    v11 = 0;
    if (v9)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_23DFA23DC;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v10;
  v10 = sub_23DFA1CC4;
LABEL_6:
  v13 = a3;
  v14 = self;
  sub_23DFA1520(v13, (uint64_t)v8, v11, (uint64_t)v10, v12);
  sub_23DF9D698((uint64_t)v10);
  sub_23DF9D698((uint64_t)v8);

}

@end
