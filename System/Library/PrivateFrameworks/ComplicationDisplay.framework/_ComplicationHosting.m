@implementation _ComplicationHosting

- (CLKMonochromeFilterProvider)filterProvider
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider;
  swift_beginAccess();
  return (CLKMonochromeFilterProvider *)(id)MEMORY[0x2199AA76C](v2);
}

- (void)setFilterProvider:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_view));
}

- (BOOL)rendersAsynchronously
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_rendersAsynchronously);
}

- (id)renderStatsHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21305BE5C;
  aBlock[3] = &block_descriptor_38;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setRenderStatsHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_21305E354;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_21305BF48(v7);
}

- (BOOL)shouldCallRenderStatsHandlerOnMainQueue
{
  BOOL *v2;

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldCallRenderStatsHandlerOnMainQueue:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldCallRenderStatsHandlerOnMainQueue;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)shouldAccentDesaturatedView
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldAccentDesaturatedView:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_shouldAccentDesaturatedView;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)supportsComplicationForeground
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground);
}

- (void)setSupportsComplicationForeground:(BOOL)a3
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_supportsComplicationForeground) = a3;
}

+ (id)async
{
  return sub_21305C410((uint64_t)a1, (uint64_t)a2, 1);
}

+ (id)sync
{
  return sub_21305C410((uint64_t)a1, (uint64_t)a2, 0);
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithFrame:(CGRect)a3 async:(BOOL)a4
{
  return (_TtC19ComplicationDisplay20_ComplicationHosting *)_s19ComplicationDisplay01_A7HostingC5frame5asyncACSo6CGRectV_Sbtcfc_0(a4);
}

- (_TtC19ComplicationDisplay20_ComplicationHosting)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_21305E244();
}

- (void)dealloc
{
  void *v3;
  _TtC19ComplicationDisplay20_ComplicationHosting *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController);
  swift_getObjectType();
  v4 = self;
  v5 = v3;
  sub_213068AB0();
  sub_2130686C0();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for _ComplicationHosting();
  -[_ComplicationHosting dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_21305E360((uint64_t)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_filterProvider);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_hostingViewController));

  sub_21305BF48(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_renderStatsHandler));
  sub_21305DD34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData), *(_QWORD *)&self->filterProvider[OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC19ComplicationDisplay20_ComplicationHosting *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  swift_getObjectType();
  v4 = self;
  sub_213068690();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (NSData)viewData
{
  uint64_t *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  v3 = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_21305DCF0(v5, v4);
    v3 = (void *)sub_213068408();
    sub_21305DD34(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setViewData:(id)a3
{
  void *v3;
  _TtC19ComplicationDisplay20_ComplicationHosting *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  _TtC19ComplicationDisplay20_ComplicationHosting *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (void *)sub_213068414();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_viewData);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_21305DD34(v11, v12);

}

- (BOOL)paused
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused;
  swift_beginAccess();
  return *v2;
}

- (void)setPaused:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC19ComplicationDisplay20_ComplicationHosting_paused;
  swift_beginAccess();
  *v4 = a3;
}

- (void)waitForAsyncRendering
{
  _TtC19ComplicationDisplay20_ComplicationHosting *v2;

  v2 = self;
  sub_21305CE48();

}

- (_TtC19ComplicationDisplay20_ComplicationHosting)init
{
  _TtC19ComplicationDisplay20_ComplicationHosting *result;

  result = (_TtC19ComplicationDisplay20_ComplicationHosting *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateMonochromeColor
{
  -[_ComplicationHosting transitionToMonochromeWithFraction:](self, sel_transitionToMonochromeWithFraction_, 1.0);
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  _TtC19ComplicationDisplay20_ComplicationHosting *v3;

  v3 = self;
  _ComplicationHosting.transitionToMonochrome(withFraction:)();

}

@end
