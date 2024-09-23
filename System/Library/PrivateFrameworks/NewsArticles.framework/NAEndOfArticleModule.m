@implementation NAEndOfArticleModule

- (id)createViewControllerFor:(id)a3 presentationOptions:(id)a4
{
  id v6;
  id v7;
  NAEndOfArticleModule *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)EndOfArticleModule.createViewController(for:presentationOptions:)(v6, v7);

  return v9;
}

- (NAEndOfArticleModule)init
{
  NAEndOfArticleModule *result;

  result = (NAEndOfArticleModule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NAEndOfArticleModule_resolver);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___NAEndOfArticleModule_contextBuilder);
}

@end
