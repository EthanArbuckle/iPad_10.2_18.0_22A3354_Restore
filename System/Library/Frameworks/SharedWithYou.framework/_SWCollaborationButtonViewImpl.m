@implementation _SWCollaborationButtonViewImpl

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  return (UICloudSharingControllerDelegate *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_cloudSharingControllerDelegate);
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setCloudSharingControllerDelegate_, a3);
}

- (unint64_t)activeParticipantCount
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  return *v2;
}

- (void)setActiveParticipantCount:(unint64_t)a3
{
  unint64_t *v5;
  _SWCollaborationButtonViewImpl *v6;

  v5 = (unint64_t *)((char *)self + OBJC_IVAR____SWCollaborationButtonViewImpl_activeParticipantCount);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_18EAD2994(a3);

}

- (NSString)headerTitle
{
  return (NSString *)sub_18EAD2B8C();
}

- (void)setHeaderTitle:(id)a3
{
  sub_18EAD2C58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_SWCollaborationButtonViewImpl.headerTitle.setter);
}

- (NSString)headerSubtitle
{
  return (NSString *)sub_18EAD2B8C();
}

- (void)setHeaderSubtitle:(id)a3
{
  sub_18EAD2C58(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))_SWCollaborationButtonViewImpl.headerSubtitle.setter);
}

- (UIImage)headerImage
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_headerImage);
  swift_beginAccess();
  return (UIImage *)*v2;
}

- (void)setHeaderImage:(id)a3
{
  _SWCollaborationButtonViewImpl *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18EAD6EE4(a3);

}

- (SWCollaborationView)outerButton
{
  return (SWCollaborationView *)sub_18EAD32D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_outerButton);
}

- (void)setOuterButton:(id)a3
{
  sub_18EAD3370();
}

- (SWCollaborationViewDelegate)delegate
{
  return (SWCollaborationViewDelegate *)sub_18EAD32D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_18EAD3370();
}

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[_SWCollaborationButtonViewImpl layoutSubviews](&v2, sel_layoutSubviews);
}

- (_SWCollaborationButtonViewImpl)initWithCoder:(id)a3
{
  sub_18EAD4684(a3);
  return 0;
}

- (void)tintColorDidChange
{
  _SWCollaborationButtonViewImpl *v2;

  v2 = self;
  _SWCollaborationButtonViewImpl.tintColorDidChange()();

}

- (void)buttonTapped:(id)a3
{
  _SWCollaborationButtonViewImpl *v4;
  _SWCollaborationButtonViewImpl *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18EAE7054();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_18EAD4A88();

  sub_18EAD7AD0((uint64_t)v6);
}

- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  _SWCollaborationButtonViewImpl *v5;

  v5 = self;
  sub_18EAE694C();

}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _SWCollaborationButtonViewImpl *v10;
  _SWCollaborationButtonViewImpl *v11;
  _QWORD v12[6];

  v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v8 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
    v6 = sub_18EAD7AC4;
    v12[4] = sub_18EAD7AC4;
    v12[5] = v7;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 1107296256;
    v12[2] = sub_18EAD26EC;
    v12[3] = &block_descriptor_54;
    v9 = _Block_copy(v12);
    v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    v8 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
    v11 = self;
    v9 = 0;
  }
  objc_msgSend(v8, sel_dismissViewControllerAnimated_completion_, v4, v9);
  _Block_release(v9);
  sub_18EAD7A90((uint64_t)v6);

}

- (_SWCollaborationButtonViewImpl)initWithFrame:(CGRect)a3
{
  _SWCollaborationButtonViewImpl *result;

  result = (_SWCollaborationButtonViewImpl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_sharedWithYouCenter));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_centerXAnchorHiddenLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_attributionViewXAnchorVisibleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_labelXAnchorHidden));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_containerLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_containerTrailingConstraint));
  swift_unknownObjectWeakDestroy();
  sub_18EACEE38((uint64_t)self + OBJC_IVAR____SWCollaborationButtonViewImpl_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController));

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4;
  _SWCollaborationButtonViewImpl *v5;

  v4 = a3;
  v5 = self;
  sub_18EAD7560((SEL *)&selRef_collaborationViewWillPresentPopover_);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _SWCollaborationButtonViewImpl *v5;

  v4 = a3;
  v5 = self;
  sub_18EAD7560((SEL *)&selRef_collaborationViewDidDismissPopover_);

}

- (NSItemProvider)itemProvider
{
  return (NSItemProvider *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_itemProvider);
}

- (void)setItemProvider:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setItemProvider_, a3);
}

- (BOOL)isContentShared
{
  void *v2;
  _SWCollaborationButtonViewImpl *v3;
  id v4;

  if ((*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl__isContentShared) & 1) != 0)
    return 1;
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  v3 = self;
  v4 = objc_msgSend(v2, sel_collaborationHighlight);

  if (v4)
  {

    return 1;
  }
  return 0;
}

- (void)setIsContentShared:(BOOL)a3
{
  _SWCollaborationButtonViewImpl *v4;

  v4 = self;
  _SWCollaborationButtonViewImpl.isContentShared.setter(a3);

}

- (_SWCollaborationButtonViewImpl)initWithItemProvider:(id)a3
{
  objc_class *ObjectType;
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  v6 = a3;
  v7 = objc_msgSend(v5, sel_initWithItemProvider_impl_, v6);
  v8 = objc_allocWithZone(ObjectType);
  v9 = sub_18EAD3484(v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_SWCollaborationButtonViewImpl *)v9;
}

- (void)setManageButtonTitle:(id)a3
{
  void *v4;
  _SWCollaborationButtonViewImpl *v5;
  id v6;

  sub_18EAE6ED4();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController);
  v5 = self;
  v6 = (id)sub_18EAE6EB0();
  objc_msgSend(v4, sel_setManageButtonTitle_, v6);

  swift_bridgeObjectRelease();
}

- (void)setShowManageButton:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setShowManageButton_, a3);
}

- (void)setDetailViewListContent:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setListContentView_, a3);
}

@end
