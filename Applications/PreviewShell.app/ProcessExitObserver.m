@implementation ProcessExitObserver

- (void)processDidExit:(id)a3
{
  id v4;
  _TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver *v5;

  v4 = a3;
  v5 = self;
  sub_1000063AC();

}

- (_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver)init
{
  _TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver *result;

  result = (_TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver *)_swift_stdlib_reportUnimplementedInitializer("PreviewShell.ProcessExitObserver", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_process));
  sub_100006728(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler), *(_QWORD *)&self->process[OBJC_IVAR____TtC12PreviewShellP33_73072BBD51AADBBF8F40B684FE9C377E19ProcessExitObserver_didExitHandler]);
}

@end
