@implementation TabOverview

- (_TtC12MobileSafari11TabOverview)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari11TabOverview *)sub_18B8AA034(a3);
}

- (void)contentSizeCategoryDidChange
{
  _TtC12MobileSafari11TabOverview *v2;

  v2 = self;
  sub_18B8AD2DC();

}

- (int64_t)indexInAllItemsForItemView:(id)a3
{
  id v4;
  _TtC12MobileSafari11TabOverview *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = sub_18B8AE860(v4);

  return v6;
}

- (int64_t)totalItemCount
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _TtC12MobileSafari11TabOverview *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  _OWORD v12[11];

  v2 = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[8] = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR____TtC12MobileSafari11TabOverview_content + 24);
  v12[9] = v2;
  v12[10] = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.right
                      + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v3 = *(_OWORD *)((char *)&self->super.super._window + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[4] = *(_OWORD *)((char *)&self->super.super._layerRetained + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[5] = v3;
  v4 = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR____TtC12MobileSafari11TabOverview_content + 8);
  v12[6] = *(_OWORD *)((char *)&self->super.super._viewDelegate + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[7] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[1] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super._swiftAnimationInfo + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[2] = *(_OWORD *)((char *)&self->super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v12[3] = v6;
  v7 = self;
  sub_18B8D1630((uint64_t)v12);
  v8 = sub_18BABFD34();
  v9 = sub_18B8BA52C(v8);
  swift_bridgeObjectRelease();
  sub_18B8D1294((uint64_t)v12);
  v10 = *(_QWORD *)(v9 + 16);

  swift_bridgeObjectRelease();
  return v10;
}

- (void)layoutSubviews
{
  _TtC12MobileSafari11TabOverview *v2;

  v2 = self;
  sub_18B8AFCA8();

}

- (BOOL)becomeFirstResponder
{
  return sub_18B8B1398(self, (uint64_t)a2, (SEL *)&selRef_becomeFirstResponder);
}

- (BOOL)canBecomeFirstResponder
{
  return sub_18B8B1398(self, (uint64_t)a2, (SEL *)&selRef_canBecomeFirstResponder);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  id v5;
  _TtC12MobileSafari11TabOverview *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void (*v16)(uint64_t);
  uint64_t v17;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12MobileSafari11TabOverview_closingItemsContainerView);
  v5 = a3;
  v6 = self;
  v7 = sub_18B8A958C();
  objc_msgSend(v7, sel_bounds);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v4, sel_setBounds_, v9, v11, v13, v15);
  -[TabOverview setNeedsLayout](v6, sel_setNeedsLayout);
  v16 = *(void (**)(uint64_t))((char *)&v6->super.super.super.super.isa
                                       + OBJC_IVAR____TtC12MobileSafari11TabOverview_didScroll);
  v17 = sub_18BABFBB4();
  v16(v17);

  swift_release();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  double y;
  double (*v9)(double, double);
  id v10;
  CGFloat v11;
  _TtC12MobileSafari11TabOverview *v12;

  x = a5->x;
  y = a5->y;
  v9 = *(double (**)(double, double))(**(_QWORD **)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC12MobileSafari11TabOverview_gridLayout)
                                               + 1032);
  v10 = a3;
  v12 = self;
  a5->x = v9(x, y);
  a5->y = v11;

}

- (_TtC12MobileSafari11TabOverview)initWithFrame:(CGRect)a3
{
  _TtC12MobileSafari11TabOverview *result;

  result = (_TtC12MobileSafari11TabOverview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[272];
  _OWORD v10[11];

  v3 = *(UIViewController **)((char *)&self->super.super._viewDelegate
                            + OBJC_IVAR____TtC12MobileSafari11TabOverview_configuration);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v9, (char *)self + OBJC_IVAR____TtC12MobileSafari11TabOverview_handlers, sizeof(v9));
  sub_18B8D1174((uint64_t)v9);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[8] = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR____TtC12MobileSafari11TabOverview_content + 24);
  v10[9] = v4;
  v10[10] = *(_OWORD *)((char *)&self->super.super._minimumSafeAreaInsets.right
                      + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v5 = *(_OWORD *)((char *)&self->super.super._window + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[4] = *(_OWORD *)((char *)&self->super.super._layerRetained + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super._viewFlags + OBJC_IVAR____TtC12MobileSafari11TabOverview_content + 8);
  v10[6] = *(_OWORD *)((char *)&self->super.super._viewDelegate + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[7] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[1] = v7;
  v8 = *(_OWORD *)((char *)&self->super.super._swiftAnimationInfo + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[2] = *(_OWORD *)((char *)&self->super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_content);
  v10[3] = v8;
  sub_18B8D1294((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_18B894A1C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari11TabOverview_targetScrollPositionForNextLayoutPass, (uint64_t *)&unk_1EDFE9FE0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_closingItemsContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_transitionContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_contentBelowSearchBarView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_overlayContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_peekingOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari11TabOverview_searchBarContainerView));
  swift_unknownObjectWeakDestroy();
}

@end
