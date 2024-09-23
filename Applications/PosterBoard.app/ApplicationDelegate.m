@implementation ApplicationDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  return 1;
}

- (_TtC11PosterBoard19ApplicationDelegate)init
{
  uint64_t v3;
  void *v4;
  _TtC11PosterBoard19ApplicationDelegate *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC11PosterBoard19ApplicationDelegate_glue;
  v4 = (void *)objc_opt_self(PBFPosterExtensionDataStoreXPCServiceGlue);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)objc_msgSend(v4, "sharedInstance");

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return -[ApplicationDelegate init](&v7, "init");
}

- (void).cxx_destruct
{

}

@end
