@implementation __ASCLayoutProxy

+ (id)adLockupLayoutWithTraitCollection:(id)a3 artworkView:(id)a4 headingText:(id)a5 titleText:(id)a6 subtitleText:(id)a7 offerText:(id)a8 offerButton:(id)a9 starRatingView:(id)a10 ratingCountLabel:(id)a11 adTransparencyButton:(id)a12 editorsChoiceView:(id)a13 descriptionLabel:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v33 = a3;
  v19 = a4;
  v32 = a5;
  v20 = a6;
  v21 = a7;
  v31 = a8;
  v22 = a9;
  v30 = a10;
  v29 = a11;
  v28 = a12;
  v27 = a13;
  v23 = a14;
  v24 = sub_1BCBE065C(v19, a5, v20, v21, a8, v22, a10, a11, a12, a13, v23);

  return v24;
}

+ (int64_t)numberOfViewsInLockupMediaLayoutFor:(id)a3 with:(id)a4 and:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  int64_t v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _s18AppStoreComponents14ASCLayoutProxyC32numberOfViewsInLockupMediaLayout3for4with3andSiSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0((uint64_t)a3, (uint64_t)a4, a5);
  v12 = v11;

  return v12;
}

+ (id)lockupMediaSizingLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7
{
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v11 = sub_1BCC00E1C();
  swift_getObjCClassMetadata();
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = static ASCLayoutProxy.lockupMediaSizingLayout(for:screenshots:trailers:containerView:mediaViews:)((uint64_t)a3, (uint64_t)a4, a5, v15, v11);

  swift_bridgeObjectRelease();
  return v16;
}

+ (id)lockupMediaLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7
{
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v11 = sub_1BCC00E1C();
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = _s18AppStoreComponents14ASCLayoutProxyC17lockupMediaLayout3for11screenshots8trailers13containerView10mediaViewsACSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgSo6UIViewCSayATGtFZ_0((uint64_t)a3, (uint64_t)a4, a5, v15, v11);

  swift_bridgeObjectRelease();
  return v16;
}

+ (CGSize)lockupMediaPreferredMediaSizeWithFitting:(CGSize)a3 for:(id)a4 with:(id)a5 and:(id)a6 in:(id)a7
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  CGSize result;

  v11 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  v14 = a4;
  v15 = a5;
  v16 = a6;
  swift_unknownObjectRetain();
  sub_1BCBDF2FC((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)v13);
  sub_1BCBF0C78((uint64_t)v13, (uint64_t)a7);
  v18 = v17;
  v20 = v19;
  sub_1BCBE31A4((uint64_t)v13, type metadata accessor for LockupMediaLayout.Metrics);

  swift_unknownObjectRelease();
  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

+ (id)artworkFrom:(id)a3 and:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  sub_1BCBED560((uint64_t)a3, a4, 0, 1);

  sub_1BCBE32A8(0, &qword_1EF48D440);
  v8 = (void *)sub_1BCC00E10();
  swift_bridgeObjectRelease();
  return v8;
}

+ (CGSize)estimatedMediaContentSizeFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 fitting:(CGSize)a6 in:(id)a7
{
  double width;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  width = a6.width;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_unknownObjectRetain();
  v15 = _s18AppStoreComponents14ASCLayoutProxyC25estimatedMediaContentSize3for11screenshots8trailers7fitting2inSo6CGSizeVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgAKSo18UITraitEnvironment_ptFZ_0((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a7, width);
  v17 = v16;

  swift_unknownObjectRelease();
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

+ (double)containerViewRotationAngleFor:(id)a3 screenshots:(id)a4 trailers:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _s18AppStoreComponents14ASCLayoutProxyC26containerViewRotationAngle3for11screenshots8trailers12CoreGraphics7CGFloatVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0((uint64_t)a3, (uint64_t)a4, a5);
  v12 = v11;

  return v12;
}

+ (UIEdgeInsets)layoutMarginsFor:(id)a3 existingLayoutMargins:(UIEdgeInsets)a4
{
  double top;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  top = a4.top;
  v6 = a3;
  v7 = _s18AppStoreComponents14ASCLayoutProxyC13layoutMargins3for014existingLayoutG0So12UIEdgeInsetsVSo16ASCLockupContextaSg_AHtFZ_0(a3, top);
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (double)lockupTitlePointSizeProvider:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = _s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)lockupSubtitlePointSizeProvider:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = _s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)lockupHeadingPointSizeProvider:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = _s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)adTransparencyButtonTitlePointSizeProvider:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = _s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0();

  return v4;
}

+ (double)adTransparencyButtonScaledCapInset:(double)a3 in:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_1;
  double v14;
  double v15;
  uint64_t v18[5];

  v5 = sub_1BCC00654();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = qword_1EF48D000;
  v10 = a4;
  if (v9 != -1)
    swift_once();
  v11 = sub_1BCC0078C();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EF48D418);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v12, v11);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0D418D8], v5);
  v18[3] = v5;
  v18[4] = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v8, v5);
  sub_1BCC0063C();
  v15 = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v15;
}

+ (double)adTransparencyDeveloperNamePointSizeProvider:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = _s18AppStoreComponents14ASCLayoutProxyC44adTransparencyDeveloperNamePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0();

  return v4;
}

+ (CGSize)miniLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = a4;
  v6 = _s18AppStoreComponents14ASCLayoutProxyC23miniLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0((uint64_t)v5, width);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)smallOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = a4;
  v6 = sub_1BCBE6374(v5, &qword_1ED1BC1D0, (uint64_t)&unk_1ED1BC270, width);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)mediumOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = a4;
  v6 = sub_1BCBE6374(v5, &qword_1EF48D048, (uint64_t)&unk_1EF48D660, width);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)smallLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v4 = qword_1ED1BC388;
  v5 = a4;
  if (v4 != -1)
    swift_once();
  v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1BC370);
  sub_1BCC00C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1BCC09540;
  *(_QWORD *)(v8 + 32) = v5;
  sub_1BCC00E28();
  v9 = v5;
  v10 = (void *)sub_1BCC00C60();
  v11 = sub_1BCBE59C4(v7, v10);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (CGSize)mediumLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v5 = a4;
  v6 = _s18AppStoreComponents14ASCLayoutProxyC25mediumLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(v5, width);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)lockupLayoutOfSize:(id)a3 traitCollection:(id)a4 artworkView:(id)a5 headingText:(id)a6 titleText:(id)a7 subtitleText:(id)a8 offerText:(id)a9 offerButton:(id)a10 badge:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v26;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v26 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = (void *)_s18AppStoreComponents14ASCLayoutProxyC12lockupLayout6ofSize15traitCollection11artworkView11headingText05titleO008subtitleO005offerO00R6Button5badgeACSo09ASCLockupmI0a_So07UITraitK0CSo6UIViewCSo7UILabelCSgA2uv2SSgtFZ_0((uint64_t)v16, v17, v18, a6, v19, v20, a9, v22);

  return v24;
}

+ (CGSize)miniProductPagePreferredArtworkSize
{
  double v2;
  double v3;
  CGSize result;

  if (qword_1EF48D068 != -1)
    swift_once();
  v3 = *((double *)&xmmword_1EF48DAF0 + 1);
  v2 = *(double *)&xmmword_1EF48DAF0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)miniProductPageLayoutWithTraitCollection:(id)a3 iconArtwork:(id)a4 title:(id)a5 subtitle:(id)a6 metadata:(id)a7 description:(id)a8 screenshots:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = sub_1BCBE88E0();

  return v21;
}

+ (double)offerButtonHeightForSize:(id)a3
{
  double v3;
  _OWORD v5[4];
  double v6;

  sub_1BCC00DE0();
  swift_getObjCClassMetadata();
  sub_1BCBEA038(v5);
  v3 = v6;
  sub_1BCBE85EC((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerProgressDiameterForSize:(id)a3
{
  double v3;
  _OWORD v5[3];

  sub_1BCC00DE0();
  swift_getObjCClassMetadata();
  sub_1BCBEA250(v5);
  v3 = *((double *)v5 + 1);
  sub_1BCBE8F54((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)axOfferButtonHeightForSize:(id)a3
{
  double v3;

  sub_1BCC00DE0();
  swift_getObjCClassMetadata();
  v3 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerButtonRegularWidthForSize:(id)a3
{
  double v3;
  _OWORD v5[3];

  sub_1BCC00DE0();
  swift_getObjCClassMetadata();
  sub_1BCBEA468(v5);
  v3 = *(double *)v5;
  sub_1BCBE8F54((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerButtonFixedHeightForSize:(id)a3
{
  double v3;

  sub_1BCC00DE0();
  swift_getObjCClassMetadata();
  v3 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)offerEmptyLayoutWithImageView:(id)a3 titleView:(id)a4 subtitleView:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = _s18AppStoreComponents14ASCLayoutProxyC16offerEmptyLayout9imageView05titleJ008subtitleJ0ACSo6UIViewC_AISgAJtFZ_0(v7, a4, a5);

  return v10;
}

+ (id)offerIconLayoutForSize:(id)a3 imageView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldTrailingAlign:(BOOL)a10
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v15 = sub_1BCC00DE0();
  v17 = v16;
  swift_getObjCClassMetadata();
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = static ASCLayoutProxy.offerIconLayoutForSize(_:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:)(a9, v15, v17, v18, a5, a6, a7, a8, a10);

  swift_bridgeObjectRelease();
  return v21;
}

+ (id)offerTextLayoutForSize:(id)a3 titleBackgroundView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldExpandBackground:(BOOL)a10
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v16 = sub_1BCC00DE0();
  v18 = v17;
  swift_getObjCClassMetadata();
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = static ASCLayoutProxy.offerTextLayoutForSize(_:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:)(a9, v16, v18, v19, v20, a6, a7, a8, a10);

  swift_bridgeObjectRelease();
  return v22;
}

+ (id)offerDisclosureLayoutWithDisclosureIndicator:(id)a3
{
  objc_class *ObjCClassMetadata;
  id v5;
  id v6;
  id v7;
  objc_super v9;
  _QWORD v10[6];
  _QWORD v11[5];

  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v11[3] = &type metadata for OfferDisclosureLayout;
  v11[4] = sub_1BCBE9F08();
  v11[0] = swift_allocObject();
  sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v5 = a3;
  sub_1BCC00720();
  v10[3] = &type metadata for PlaceableLayoutProxy;
  v10[4] = sub_1BCBE84D0();
  v10[5] = sub_1BCBE8514();
  v10[0] = swift_allocObject();
  sub_1BCBE857C((uint64_t)v11, v10[0] + 16);
  v6 = objc_allocWithZone(ObjCClassMetadata);
  sub_1BCBE0C18((uint64_t)v10, (uint64_t)v6 + OBJC_IVAR_____ASCLayoutProxy_base);
  v9.receiver = v6;
  v9.super_class = ObjCClassMetadata;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_1BCBE85B8((uint64_t)v11);

  return v7;
}

+ (id)tvTextPillOverlayWithBackgroundView:(id)a3 textView:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = _s18AppStoreComponents14ASCLayoutProxyC17tvTextPillOverlay14backgroundView04textK0ACSo6UIViewC_AHtFZ_0(v5, v6);

  return v7;
}

+ (id)traitEnvironmentWithTraitCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = objc_allocWithZone((Class)sub_1BCC00C54());
  v5 = a3;
  v6 = (void *)sub_1BCC00C48();

  return v6;
}

+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 inTraitEnvironment:(id)a4 relativeTo:(CGRect)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  swift_unknownObjectRetain();
  v6 = objc_msgSend(a4, sel_traitCollection);
  objc_msgSend(v6, sel_layoutDirection);

  sub_1BCC00EA0();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  swift_unknownObjectRelease();
  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 layoutDirection:(int64_t)a4 relativeTo:(CGRect)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  sub_1BCC00EA0();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)measuredSizeFittingSize:(CGSize)a3 inTraitEnvironment:(id)a4
{
  __ASCLayoutProxy *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR_____ASCLayoutProxy_base), *(_QWORD *)&self->base[OBJC_IVAR_____ASCLayoutProxy_base + 16]);
  swift_unknownObjectRetain();
  v5 = self;
  sub_1BCC00714();
  v7 = v6;
  v9 = v8;
  swift_unknownObjectRelease();

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)alignmentInsetsInTraitEnvironment:(id)a3
{
  __ASCLayoutProxy *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = ASCLayoutProxy.alignmentInsets(in:)((uint64_t)a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  swift_unknownObjectRelease();

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)placeChildrenRelativeToRect:(CGRect)a3 inTraitEnvironment:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __ASCLayoutProxy *v9;
  uint64_t v10;

  v5 = sub_1BCC006B4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR_____ASCLayoutProxy_base), *(_QWORD *)&self->base[OBJC_IVAR_____ASCLayoutProxy_base + 16]);
  swift_unknownObjectRetain();
  v9 = self;
  sub_1BCC00CC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_unknownObjectRelease();

}

- (NSString)description
{
  __ASCLayoutProxy *v2;
  void *v3;

  v2 = self;
  sub_1BCC00EE8();
  sub_1BCC00DF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8B8);
  sub_1BCC00F18();
  sub_1BCC00DF8();

  v3 = (void *)sub_1BCC00DBC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (__ASCLayoutProxy)init
{
  __ASCLayoutProxy *result;

  result = (__ASCLayoutProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR_____ASCLayoutProxy_base);
}

@end
