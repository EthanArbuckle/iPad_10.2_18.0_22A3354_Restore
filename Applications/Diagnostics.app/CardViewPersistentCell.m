@implementation CardViewPersistentCell

- (void)handleLaunchURLWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11Diagnostics22CardViewPersistentCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100080390();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11Diagnostics22CardViewPersistentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics22CardViewPersistentCell *)sub_10008067C(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics22CardViewPersistentCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics22CardViewPersistentCell *)sub_1000807E8(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell_viewQueue));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentEnrollingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentEnrollFinishedPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentRunningPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentFinishedPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentUploadingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___persistentUnenrollingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___enhancedLoggingConsentNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell__completeUploadConsentController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics22CardViewPersistentCell____lazy_storage___reviewFilesController));
}

@end
