@implementation ANFDebugSettingsProvider

- (BOOL)viewportDebuggingEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_viewportDebuggingEnabled);
}

- (void)setViewportDebuggingEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_viewportDebuggingEnabled) = a3;
}

- (BOOL)testingConditionEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_testingConditionEnabled);
}

- (void)setTestingConditionEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_testingConditionEnabled) = a3;
}

- (_TtC12NewsArticles24ANFDebugSettingsProvider)init
{
  return (_TtC12NewsArticles24ANFDebugSettingsProvider *)sub_1B9F0BFF8();
}

- (void).cxx_destruct
{

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles24ANFDebugSettingsProvider_observers), sel_removeObject_, a3);
}

@end
