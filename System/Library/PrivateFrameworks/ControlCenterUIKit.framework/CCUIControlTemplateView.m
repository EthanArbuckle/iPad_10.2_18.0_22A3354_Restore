@implementation CCUIControlTemplateView

- (CCUIControlTemplateView)initWithFrame:(CGRect)a3 glyphView:(id)a4
{
  return (CCUIControlTemplateView *)sub_1D030F51C(a4);
}

- (CCUIControlTemplateView)initWithFrame:(CGRect)a3
{
  return (CCUIControlTemplateView *)CCUIControlTemplateView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUIControlTemplateView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (CCUIControlTemplateViewDelegate)delegate
{
  return (CCUIControlTemplateViewDelegate *)(id)MEMORY[0x1D17E090C]((char *)self+ OBJC_IVAR___CCUIControlTemplateView_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (CCUIControlTemplateViewContextMenuDelegate)contextMenuDelegate
{
  return (CCUIControlTemplateViewContextMenuDelegate *)(id)MEMORY[0x1D17E090C]((char *)self+ OBJC_IVAR___CCUIControlTemplateView_contextMenuDelegate, a2);
}

- (void)setContextMenuDelegate:(id)a3
{
  CCUIControlTemplateView *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1D0316910();

  swift_unknownObjectRelease();
}

- (CCUIControlTemplateViewMenuModuleDelegate)menuModuleDelegate
{
  return (CCUIControlTemplateViewMenuModuleDelegate *)(id)MEMORY[0x1D17E090C]((char *)self+ OBJC_IVAR___CCUIControlTemplateView_menuModuleDelegate, a2);
}

- (void)setMenuModuleDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR___CCUIControlTemplateView_backgroundView));
}

- (void)setBackgroundView:(id)a3
{
  sub_1D030FBC4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___CCUIControlTemplateView_backgroundView, sub_1D030FA94);
}

- (UIView)customGlyphView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR___CCUIControlTemplateView_customGlyphView));
}

- (void)setCustomGlyphView:(id)a3
{
  sub_1D030FBC4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___CCUIControlTemplateView_customGlyphView, (void (*)(void *))sub_1D030FC28);
}

- (BOOL)showsMenuAffordance
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance);
}

- (void)setShowsMenuAffordance:(BOOL)a3
{
  int v3;
  CCUIControlTemplateView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView_showsMenuAffordance) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1D030FD7C();

  }
}

- (NSString)title
{
  return (NSString *)sub_1D0310388((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIControlTemplateView_title);
}

- (void)setTitle:(id)a3
{
  sub_1D03103F4((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CCUIControlTemplateView_title, (void (*)(uint64_t, uint64_t))sub_1D030FF74);
}

- (NSString)subtitle
{
  return (NSString *)sub_1D0310388((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIControlTemplateView_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_1D03103F4((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___CCUIControlTemplateView_subtitle, (void (*)(uint64_t, uint64_t))sub_1D0310464);
}

- (BOOL)isRedacted
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted);
}

- (void)setRedacted:(BOOL)a3
{
  int v3;
  unsigned int v4;
  double v5;
  CCUIControlTemplateView *v6;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isRedacted) = a3;
  if (v3 != a3)
  {
    v6 = self;
    v4 = -[CCUIControlTemplateView isRedacted](v6, sel_isRedacted);
    v5 = 0.35;
    if (!v4)
      v5 = 1.0;
    -[CCUIButtonModuleView setGlyphAlpha:](v6, sel_setGlyphAlpha_, v5);

  }
}

- (BOOL)isResizing
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isResizing);
}

- (void)setResizing:(BOOL)a3
{
  _BOOL8 v3;
  CCUIControlTemplateView *v4;

  v3 = a3;
  v4 = self;
  sub_1D0310BA0((id)v3);

}

- (BOOL)isExpanded
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded);
}

- (void)setExpanded:(BOOL)a3
{
  int v3;
  CCUIControlTemplateView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CCUIControlTemplateView__isExpanded) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1D0310260(0);
    -[CCUIControlTemplateView setNeedsLayout](v4, sel_setNeedsLayout);

  }
}

- (int64_t)gridSizeClass
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR___CCUIControlTemplateView_gridSizeClass);
}

- (void)setGridSizeClass:(int64_t)a3
{
  CCUIControlTemplateView *v4;

  v4 = self;
  sub_1D0310EA8((id)a3);

}

- (double)continuousCornerRadius
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius);
}

- (void)setContinuousCornerRadius:(double)a3
{
  double v3;
  CCUIControlTemplateView *v4;

  v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius);
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR___CCUIControlTemplateView_continuousCornerRadius) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1D0310FAC();

  }
}

- (BOOL)supportsAccessibilityContentSizeCategories
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories);
}

- (void)setSupportsAccessibilityContentSizeCategories:(BOOL)a3
{
  int v3;
  CCUIControlTemplateView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories);
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR___CCUIControlTemplateView_supportsAccessibilityContentSizeCategories) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1D0310260(0);
    sub_1D031110C();
    -[CCUIControlTemplateView setNeedsLayout](v4, sel_setNeedsLayout);

  }
}

- (id)createBackgroundView
{
  void *v3;
  CCUIControlTemplateView *v4;
  id result;
  id v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  result = objc_msgSend(v3, sel_controlCenterModuleBackgroundMaterial);
  if (result)
  {
    v6 = result;

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)updateVisibleMenuIfNeeded
{
  CCUIControlTemplateView *v2;

  v2 = self;
  sub_1D03115E0();

}

- (CCUIModuleContentMetrics)contentMetrics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIControlTemplateView;
  return -[CCUIButtonModuleView contentMetrics](&v3, sel_contentMetrics);
}

- (void)setContentMetrics:(id)a3
{
  id v5;
  CCUIControlTemplateView *v6;

  v5 = a3;
  v6 = self;
  CCUIControlTemplateView.contentMetrics.setter(a3);

}

- (CGRect)glyphContentFrame
{
  CCUIControlTemplateView *v2;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect result;

  v2 = self;
  v11 = CCUIControlTemplateView.glyphContentFrame()();
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;

  v7 = x;
  v8 = y;
  v9 = width;
  v10 = height;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)selectionDidChange
{
  id v2;
  void *v3;
  CCUIControlTemplateView *v4;
  CCUIControlTemplateView *v5;
  CCUIControlTemplateView *v6;

  v6 = self;
  v2 = -[CCUIControlTemplateView visualStylingProviderForCategory:](v6, sel_visualStylingProviderForCategory_, 1);
  if (v2)
  {
    v3 = v2;
    v4 = (CCUIControlTemplateView *)v2;
    sub_1D03126A4((uint64_t)v4, 1, v3);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (void)layoutSubviews
{
  CCUIControlTemplateView *v2;

  v2 = self;
  CCUIControlTemplateView.layoutSubviews()();

}

- (void)didMoveToWindow
{
  CCUIControlTemplateView *v2;
  CCUIControlTemplateView *v3;
  CCUIControlTemplateView *v4;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIControlTemplateView;
  v2 = self;
  -[CCUIButtonModuleView didMoveToWindow](&v6, sel_didMoveToWindow);
  if (-[CCUIControlTemplateView _isInAWindow](v2, sel__isInAWindow))
  {
    v5.receiver = v2;
    v5.super_class = (Class)CCUIControlTemplateView;
    v3 = (CCUIControlTemplateView *)-[CCUIControlTemplateView visualStylingProviderForCategory:](&v5, sel_visualStylingProviderForCategory_, 1);
    if (v3)
    {
      v4 = v3;
      -[CCUIControlTemplateView setVisualStylingProvider:forCategory:](v2, sel_setVisualStylingProvider_forCategory_, v3, 1);

      v2 = v4;
    }
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  CCUIControlTemplateView *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0nhI0C_So7CGPointVtF_0();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  CCUIControlTemplateView *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = _sSo23CCUIControlTemplateViewC18ControlCenterUIKitE22contextMenuInteraction_13configuration37highlightPreviewForItemWithIdentifierSo010UITargetedL0CSgSo09UIContexthI0C_So0rH13ConfigurationCSo9NSCopying_ptF_0();

  swift_unknownObjectRelease();
  return v10;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  CCUIControlTemplateView *v4;
  id v5;

  v4 = self;
  v5 = CCUIControlTemplateView.visualStylingProvider(for:)(a3);

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  CCUIControlTemplateView *v2;
  void *v3;

  v2 = self;
  sub_1D031D628();
  objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, 1);
  sub_1D031D610();
  sub_1D031D634();
  sub_1D031D640();
  sub_1D031D61C();

  sub_1D0317E94(0, (unint64_t *)&unk_1EFC120C8);
  v3 = (void *)sub_1D031D568();
  swift_release();
  return (NSArray *)v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v7;
  CCUIControlTemplateView *v8;

  v7 = a3;
  v8 = self;
  sub_1D0313420(a3, a4);

}

- (void)primaryActionTriggered
{
  CCUIControlTemplateViewDelegate *v2;
  unsigned int v3;
  CCUIControlTemplateView *v4;

  v4 = self;
  v2 = -[CCUIControlTemplateView delegate](v4, sel_delegate);
  if (!v2
    || (v3 = -[CCUIControlTemplateViewDelegate performPrimaryActionForControlTemplateView:](v2, sel_performPrimaryActionForControlTemplateView_, v4), swift_unknownObjectRelease(), v3))
  {
    sub_1D0313EB8();
  }

}

- (void)didUpdatePreferredContentSizeCategory
{
  CCUIControlTemplateView *v2;

  v2 = self;
  sub_1D0310260(0);
  sub_1D0310728((SEL *)&selRef_title, (void (*)(uint64_t *, uint64_t))sub_1D0314058, sub_1D0313FD4);
  sub_1D0310728((SEL *)&selRef_subtitle, (void (*)(uint64_t *, uint64_t))sub_1D03141E8, sub_1D0314174);
  sub_1D031110C();

}

- (void).cxx_destruct
{
  sub_1D0317E4C((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_delegate);
  sub_1D0317E4C((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_contextMenuDelegate);
  sub_1D0317E4C((uint64_t)self + OBJC_IVAR___CCUIControlTemplateView_menuModuleDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_customGlyphView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_menuAffordanceView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CCUIControlTemplateView_customContextMenuInteraction));
  sub_1D0317C78(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR___CCUIControlTemplateView_horizontalLayoutLabels));
  sub_1D0317C78(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR___CCUIControlTemplateView_verticalLayoutLabels));
}

@end
