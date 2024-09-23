@implementation TSAnalyticsReferral

- (NSString)userActivityType
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_userActivityType);
}

- (NSString)creativeID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_creativeID);
}

- (NSString)campaignID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_campaignID);
}

- (NSString)campaignType
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_campaignType);
}

- (NSString)referringApplication
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_referringApplication);
}

- (NSString)referringURL
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_referringURL);
}

- (NSString)widgetModeGroupID
{
  return (NSString *)sub_1D6561350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSAnalyticsReferral_widgetModeGroupID);
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return (NTPBWidgetEngagement *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___TSAnalyticsReferral_widgetEngagement));
}

- (BOOL)appOpenedByUserActivity
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appOpenedByUserActivity);
}

- (int)appSessionStartMethod
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appSessionStartMethod);
}

- (int)appSessionStartNotificationType
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSAnalyticsReferral_appSessionStartNotificationType);
}

- (TSAnalyticsReferral)initWithUserActivityType:(id)a3 creativeID:(id)a4 campaignID:(id)a5 campaignType:(id)a6 referringApplication:(id)a7 referringURL:(id)a8 widgetModeGroupID:(id)a9 widgetEngagement:(id)a10 appOpenedByUserActivity:(BOOL)a11 appSessionStartMethod:(int)a12 appSessionStartNotificationType:(int)a13
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  if (a3)
  {
    v18 = sub_1D6E26978();
    v48 = v19;
    v49 = v18;
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v48 = 0;
    v49 = 0;
    if (a4)
    {
LABEL_3:
      v20 = sub_1D6E26978();
      v46 = v21;
      v47 = v20;
      v22 = a9;
      v23 = a10;
      if (a5)
        goto LABEL_4;
LABEL_8:
      v44 = 0;
      v45 = 0;
      if (a6)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  v46 = 0;
  v47 = 0;
  v22 = a9;
  v23 = a10;
  if (!a5)
    goto LABEL_8;
LABEL_4:
  v24 = sub_1D6E26978();
  v44 = v25;
  v45 = v24;
  if (a6)
  {
LABEL_5:
    v26 = sub_1D6E26978();
    v42 = v27;
    v43 = v26;
    goto LABEL_10;
  }
LABEL_9:
  v42 = 0;
  v43 = 0;
LABEL_10:
  v28 = a7;
  v29 = a8;
  v30 = v22;
  v41 = v23;
  if (v28)
  {
    v31 = sub_1D6E26978();
    v33 = v32;

    if (v29)
    {
LABEL_12:
      v34 = sub_1D6E26978();
      v36 = v35;

      goto LABEL_15;
    }
  }
  else
  {
    v31 = 0;
    v33 = 0;
    if (v29)
      goto LABEL_12;
  }
  v34 = 0;
  v36 = 0;
LABEL_15:
  if (v30)
  {
    v37 = sub_1D6E26978();
    v39 = v38;

  }
  else
  {
    v37 = 0;
    v39 = 0;
  }
  return (TSAnalyticsReferral *)AnalyticsReferral.init(userActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:widgetModeGroupID:widgetEngagement:appOpenedByUserActivity:appSessionStartMethod:appSessionStartNotificationType:)(v49, v48, v47, v46, v45, v44, v43, v42, v31, v33, v34, v36, v37, v39, (uint64_t)v41, a11, a12, a13);
}

- (TSAnalyticsReferral)init
{
  TSAnalyticsReferral *result;

  result = (TSAnalyticsReferral *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
