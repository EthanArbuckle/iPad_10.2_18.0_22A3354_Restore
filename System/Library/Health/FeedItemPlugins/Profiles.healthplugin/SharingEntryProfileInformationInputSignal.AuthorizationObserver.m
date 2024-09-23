@implementation SharingEntryProfileInformationInputSignal.AuthorizationObserver

- (void)sharingRecipientAuthorizationWasRevokedForStore:(id)a3
{
  id v4;
  _TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver *v5;

  v4 = a3;
  v5 = self;
  sub_231DC951C();

}

- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4
{
  id v5;
  _TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver *v6;

  v5 = a3;
  v6 = self;
  sub_231DC951C();

}

- (_TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver)init
{
  _TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver *result;

  result = (_TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self
     + OBJC_IVAR____TtCC8Profiles41SharingEntryProfileInformationInputSignalP33_E10E3388A4AD6554C4BB6D43AFDF1EC821AuthorizationObserver_uuid;
  v3 = sub_231E0DB30();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_weakDestroy();
}

@end
