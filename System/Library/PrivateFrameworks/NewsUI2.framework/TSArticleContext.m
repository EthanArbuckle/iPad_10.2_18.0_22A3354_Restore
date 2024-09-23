@implementation TSArticleContext

- (NSURL)url
{
  return (NSURL *)sub_1D65611FC((uint64_t)self, (uint64_t)a2, (unint64_t *)&qword_1ED5E0210, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8], &OBJC_IVAR___TSArticleContext_url, MEMORY[0x1E0CAFE38]);
}

- (NSString)title
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_title);
}

- (NSString)sourceApplication
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_sourceApplication);
}

- (NSString)previousArticleID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_previousArticleID);
}

- (NSString)previousArticleVersion
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_previousArticleVersion);
}

- (NSString)adPreviewSessionID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adPreviewSessionID);
}

- (NSString)adPreviewID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adPreviewID);
}

- (NSString)adQToken
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_adQToken);
}

- (int64_t)maximumAdRequestsForCurrentAdPreviewID
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TSArticleContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (NSDate)userActionDate
{
  return (NSDate *)sub_1D65611FC((uint64_t)self, (uint64_t)a2, (unint64_t *)&qword_1ED5E0280, (void (*)(uint64_t))MEMORY[0x1E0CB0870], &OBJC_IVAR___TSArticleContext_userActionDate, MEMORY[0x1E0CB06B8]);
}

- (int64_t)presentationReason
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_presentationReason);
}

- (NSString)notificationID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_notificationID);
}

- (NSString)notificationSenderChannelID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSArticleContext_notificationSenderChannelID);
}

- (BOOL)shouldAutoPlayVideo
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSArticleContext_shouldAutoPlayVideo);
}

- (TSAnalyticsReferral)referral
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_referral);
  swift_beginAccess();
  return (TSAnalyticsReferral *)*v2;
}

- (void)setReferral:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSArticleContext_referral);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (TSArticleContext)initWithUrl:(id)a3 title:(id)a4 sourceApplication:(id)a5 previousArticleID:(id)a6 previousArticleVersion:(id)a7 adPreviewSessionID:(id)a8 adPreviewID:(id)a9 adQToken:(id)a10 maximumAdRequestsForCurrentAdPreviewID:(int64_t)a11 userActionDate:(id)a12 presentationReason:(int64_t)a13 notificationID:(id)a14 notificationSenderChannelID:(id)a15 referral:(id)a16 shouldAutoPlayVideo:(BOOL)a17
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  TSArticleContext *v61;
  _QWORD v63[4];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  TSArticleContext *v77;
  id v78;
  id v79;
  uint64_t v80;

  v77 = self;
  sub_1D5E8481C(0, (unint64_t *)&qword_1ED5E0280, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v23);
  v80 = (uint64_t)v63 - v24;
  sub_1D5E8481C(0, (unint64_t *)&qword_1ED5E0210, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)v63 - v26;
  if (a3)
  {
    sub_1D6E15B78();
    v28 = sub_1D6E15BE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 0, 1, v28);
  }
  else
  {
    v29 = sub_1D6E15BE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v27, 1, 1, v29);
  }
  if (a4)
  {
    v30 = sub_1D6E26978();
    v74 = v31;
    v75 = v30;
  }
  else
  {
    v74 = 0;
    v75 = 0;
  }
  v78 = a9;
  v79 = a12;
  if (a5)
  {
    v32 = sub_1D6E26978();
    v72 = v33;
    v73 = v32;
    v76 = v27;
    if (a6)
    {
LABEL_9:
      v34 = sub_1D6E26978();
      v70 = v35;
      v71 = v34;
      goto LABEL_12;
    }
  }
  else
  {
    v72 = 0;
    v73 = 0;
    v76 = v27;
    if (a6)
      goto LABEL_9;
  }
  v70 = 0;
  v71 = 0;
LABEL_12:
  v36 = a7;
  v37 = a8;
  v38 = v78;
  v63[1] = a10;
  v39 = a10;
  v40 = v79;
  v63[2] = a14;
  v41 = a14;
  v63[3] = a15;
  v42 = a15;
  v69 = a16;
  if (v36)
  {
    v43 = sub_1D6E26978();
    v67 = v44;
    v68 = v43;

    if (v37)
      goto LABEL_14;
  }
  else
  {
    v67 = 0;
    v68 = 0;
    if (v37)
    {
LABEL_14:
      v45 = sub_1D6E26978();
      v65 = v46;
      v66 = v45;

      if (v38)
        goto LABEL_15;
      goto LABEL_20;
    }
  }
  v65 = 0;
  v66 = 0;
  if (v38)
  {
LABEL_15:
    v78 = (id)sub_1D6E26978();
    v64 = v47;

    if (v39)
      goto LABEL_16;
LABEL_21:
    v48 = 0;
    v50 = 0;
    if (v40)
      goto LABEL_17;
    goto LABEL_22;
  }
LABEL_20:
  v78 = 0;
  v64 = 0;
  if (!v39)
    goto LABEL_21;
LABEL_16:
  v48 = sub_1D6E26978();
  v50 = v49;

  if (v40)
  {
LABEL_17:
    v51 = v80;
    sub_1D6E15E60();

    v52 = sub_1D6E15ECC();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v51, 0, 1, v52);
    goto LABEL_23;
  }
LABEL_22:
  v53 = sub_1D6E15ECC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v80, 1, 1, v53);
LABEL_23:
  if (v41)
  {
    v54 = sub_1D6E26978();
    v56 = v55;

  }
  else
  {
    v54 = 0;
    v56 = 0;
  }
  if (v42)
  {
    v57 = sub_1D6E26978();
    v59 = v58;

  }
  else
  {
    v57 = 0;
    v59 = 0;
  }
  v60 = v69;
  v61 = (TSArticleContext *)sub_1D6561BB0((uint64_t)v76, v75, v74, v73, v72, v71, v70, v68, v67, v66, v65, (uint64_t)v78, v64, v48, v50, a11, v80, a13, v54,
                              v56,
                              v57,
                              v59,
                              v69,
                              a17);

  return v61;
}

- (TSArticleContext)init
{
  TSArticleContext *result;

  result = (TSArticleContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR___TSArticleContext_url, (unint64_t *)&qword_1ED5E0210, (void (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1D5E82E34((uint64_t)self + OBJC_IVAR___TSArticleContext_userActionDate, (unint64_t *)&qword_1ED5E0280, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
