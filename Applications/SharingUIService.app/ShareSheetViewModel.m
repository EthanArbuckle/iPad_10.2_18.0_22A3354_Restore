@implementation ShareSheetViewModel

- (BOOL)isSharingExpanded
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded);
}

- (void)setIsSharingExpanded:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isSharingExpanded) = a3;
}

- (NSArray)metadataValues
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues);
  sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setMetadataValues:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_10000ABC0(0, (unint64_t *)&unk_10003F350, LPLinkMetadata_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues) = v6;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)isLoadingMetadata
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata);
}

- (void)setIsLoadingMetadata:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isLoadingMetadata) = a3;
}

- (NSArray)urlRequests
{
  return (NSArray *)sub_100011664((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests, (void (*)(_QWORD))&type metadata accessor for URLRequest);
}

- (void)setUrlRequests:(id)a3
{
  sub_1000116C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))&type metadata accessor for URLRequest, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests);
}

- (NSArray)urlSandboxExtensions
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions));
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void)setUrlSandboxExtensions:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  if (a3)
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for Data);
  else
    v4 = 0;
  v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions) = v4;
  swift_bridgeObjectRelease(v5);
}

- (BOOL)showOptions
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions);
}

- (void)setShowOptions:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showOptions) = a3;
}

- (NSString)customOptionsTitle
{
  return (NSString *)sub_100011940((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle);
}

- (void)setCustomOptionsTitle:(id)a3
{
  sub_1000119A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle);
}

- (BOOL)showCustomHeaderButton
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton);
}

- (void)setShowCustomHeaderButton:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showCustomHeaderButton) = a3;
}

- (BOOL)showHeaderSpecialization
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization);
}

- (void)setShowHeaderSpecialization:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_showHeaderSpecialization) = a3;
}

- (NSAttributedString)customHeaderButtonTitle
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle));
}

- (void)setCustomHeaderButtonTitle:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle) = (Class)a3;
  v3 = a3;

}

- (UIColor)customHeaderButtonColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor));
}

- (void)setCustomHeaderButtonColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor) = (Class)a3;
  v3 = a3;

}

- (BOOL)isModeSwitchDisabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled);
}

- (void)setIsModeSwitchDisabled:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isModeSwitchDisabled) = a3;
}

- (BOOL)supportsCollaboration
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration);
}

- (void)setSupportsCollaboration:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsCollaboration) = a3;
}

- (BOOL)supportsSendCopy
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy);
}

- (void)setSupportsSendCopy:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_supportsSendCopy) = a3;
}

- (BOOL)isCollaborative
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative);
}

- (void)setIsCollaborative:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_isCollaborative) = a3;
}

- (NSString)collaborationModeTitle
{
  return (NSString *)sub_100011940((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle);
}

- (void)setCollaborationModeTitle:(id)a3
{
  sub_1000119A4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle);
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return (SLCollaborationFooterViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel));
}

- (void)setCollaborationFooterViewModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel) = (Class)a3;
  v3 = a3;

}

- (UIViewController)customViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController));
}

- (void)setCustomViewController:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController) = (Class)a3;
  v3 = a3;

}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper));
}

- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper) = (Class)a3;
  v3 = a3;

}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper));
}

- (void)setCustomViewControllerSectionHeightWrapper:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper) = (Class)a3;
  v3 = a3;

}

- (NSArray)peopleSuggestionProxies
{
  return (NSArray *)sub_100011B64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies, &qword_10003FC38);
}

- (void)setPeopleSuggestionProxies:(id)a3
{
  sub_100011BC8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_10003FC38, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies);
}

- (NSArray)shareProxies
{
  return (NSArray *)sub_100011B64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies, &qword_10003FC40);
}

- (void)setShareProxies:(id)a3
{
  sub_100011BC8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_10003FC40, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies);
}

- (NSArray)actionProxies
{
  return (NSArray *)sub_100011B64((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies, &qword_10003FC40);
}

- (void)setActionProxies:(id)a3
{
  sub_100011BC8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &qword_10003FC40, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies);
}

- (NSNumber)nearbyCountSlotID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID));
}

- (void)setNearbyCountSlotID:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID) = (Class)a3;
  v3 = a3;

}

- (NSDictionary)activitiesByUUID
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID);
  type metadata accessor for UUID(0);
  sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
  sub_100012C50((unint64_t *)&unk_10003FC58, (uint64_t)&protocol conformance descriptor for UUID);
  swift_bridgeObjectRetain(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (void)setActivitiesByUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;

  v5 = type metadata accessor for UUID(0);
  v6 = sub_10000ABC0(0, &qword_10003FC50, UIActivity_ptr);
  v7 = sub_100012C50((unint64_t *)&unk_10003FC58, (uint64_t)&protocol conformance descriptor for UUID);
  v8 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6, v7);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID) = v8;
  swift_bridgeObjectRelease(v9);
}

- (NSArray)applicationActivityTypes
{
  return (NSArray *)sub_100011664((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes, type metadata accessor for ActivityType);
}

- (void)setApplicationActivityTypes:(id)a3
{
  sub_1000116C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))type metadata accessor for ActivityType, &OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes);
}

- (BOOL)reloadData
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData);
}

- (void)setReloadData:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_reloadData) = a3;
}

- (BOOL)updateProxiesWithAnimation
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation);
}

- (void)setUpdateProxiesWithAnimation:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_updateProxiesWithAnimation) = a3;
}

- (_TtC16SharingUIService19ShareSheetViewModel)init
{
  _TtC16SharingUIService19ShareSheetViewModel *result;

  result = (_TtC16SharingUIService19ShareSheetViewModel *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.ShareSheetViewModel", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_metadataValues));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlRequests));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_urlSandboxExtensions));
  swift_bridgeObjectRelease(*(_QWORD *)&self->isSharingExpanded[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customOptionsTitle]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonTitle));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customHeaderButtonColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->isSharingExpanded[OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationModeTitle]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_collaborationFooterViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerVerticalInsetWrapper));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_customViewControllerSectionHeightWrapper));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_peopleSuggestionProxies));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_shareProxies));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_actionProxies));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_nearbyCountSlotID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_activitiesByUUID));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService19ShareSheetViewModel_applicationActivityTypes));
}

@end
