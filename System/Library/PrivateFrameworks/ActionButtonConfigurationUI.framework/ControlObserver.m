@implementation ControlObserver

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) == 1)
  {
    *((_BYTE *)&self->super.isa
    + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_isActive) = 0;
    objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance), sel_unregisterObserver_, self);
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = ObjectType;
  -[ControlObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_control));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_instance));
  swift_release();
}

- (void)controlInstanceViewModelDidChange:(void *)a3
{
  void (*v4)(__int128 *);
  id v5;
  char *v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[16];
  _BYTE v11[16];
  __int128 v12;

  v4 = *(void (**)(__int128 *))&a1[OBJC_IVAR____TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver_updateHandler];
  v5 = a3;
  v6 = a1;
  sub_235E35C28((uint64_t *)&v7);
  v4(&v7);
  v12 = v7;
  sub_235E369EC((uint64_t)&v12);
  sub_235E30794((uint64_t)&v8, (uint64_t)v11, (uint64_t *)&unk_256385CD0);
  sub_235E369EC((uint64_t)v11);
  sub_235E30794((uint64_t)&v9, (uint64_t)v10, (uint64_t *)&unk_256385CD0);
  sub_235E369EC((uint64_t)v10);

}

- (_TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver)init
{
  _TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver *result;

  result = (_TtC27ActionButtonConfigurationUIP33_71488BF1F1CBF40E6211521E328CAE4615ControlObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
