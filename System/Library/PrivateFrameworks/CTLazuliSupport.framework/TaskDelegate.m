@implementation TaskDelegate

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v4;
  id v5;

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport12TaskDelegate_task);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport12TaskDelegate_task) = (Class)a4;
  v4 = a4;

}

- (_TtC15CTLazuliSupport12TaskDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport12TaskDelegate_task) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TaskDelegate();
  return -[TaskDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
