@implementation ContextualSuggestionServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC21AppPredictionInternal26ContextualSuggestionServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1C9E04A90(v7);

  return v9 & 1;
}

- (void)requestSnapshotsForEndpoints:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC21AppPredictionInternal26ContextualSuggestionServer *v6;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  sub_1C9E04E80((uint64_t)v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

}

- (_TtC21AppPredictionInternal26ContextualSuggestionServer)init
{
  _TtC21AppPredictionInternal26ContextualSuggestionServer *result;

  result = (_TtC21AppPredictionInternal26ContextualSuggestionServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal26ContextualSuggestionServer____lazy_storage___xpcListener));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21AppPredictionInternal26ContextualSuggestionServer_suggestionStore));
}

@end
