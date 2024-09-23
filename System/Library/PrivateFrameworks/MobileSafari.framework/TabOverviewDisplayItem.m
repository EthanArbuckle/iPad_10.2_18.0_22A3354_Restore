@implementation TabOverviewDisplayItem

- (void)applyContentBlurRadius
{
  _TtC12MobileSafari22TabOverviewDisplayItem *v2;

  v2 = self;
  sub_18B8E2950();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  _TtC12MobileSafari22TabOverviewDisplayItem *v5;

  v4 = a3;
  v5 = self;
  sub_18B8EA5CC(v4);

}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_18B894A9C((uint64_t)self + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_layout, (uint64_t (*)(_QWORD))_s6LayoutVMa);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_navigationBarToHUDConstraint));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_searchController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_barBackgroundContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_blurrableBarBackgroundContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_bottomBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_capsuleAndToolbarSeparator));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_capsuleView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_controlsContainerView));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_navigationBar));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_navigationBarTitleView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_navigationItem));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_profileHeaderBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_profileHeaderButton));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem____lazy_storage___tabOverviewSwitcher));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_topBarBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem_transitionContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem____lazy_storage___capsuleViewOffsetForRubberBanding));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari22TabOverviewDisplayItem____lazy_storage___hudOffsetForRubberBanding));
}

@end
