@implementation ENUIPublicHealthAgencyModel

- (ENRegion)region
{
  return (ENRegion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region));
}

- (NSString)name
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)appBundleId
{
  return (NSString *)sub_21CD015FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_appBundleId);
}

- (NSString)introductoryText
{
  return (NSString *)sub_21CD017D0();
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)header
{
  return (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_header);
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)legalese
{
  return (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_legalese);
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)consentStatus
{
  return (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_consentStatus);
}

- (NSString)consentVersion
{
  return (NSString *)sub_21CD017D0();
}

- (ENUserAuthorization)diagnosisKeysPreAuthorization
{
  return (ENUserAuthorization *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_diagnosisKeysPreAuthorization));
}

- (BOOL)isAssociatedDomainAllowed
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAssociatedDomainAllowed);
}

- (BOOL)isPreauthorizationDomainAllowed
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isPreauthorizationDomainAllowed);
}

- (BOOL)isAuthorized
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAuthorized);
}

- (int64_t)regionVersion
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionVersion);
}

- (NSURL)regionWebsiteURL
{
  return (NSURL *)sub_21CD0185C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionWebsiteURL);
}

- (NSURL)regionFAQWebsiteURL
{
  return (NSURL *)sub_21CD0185C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionFAQWebsiteURL);
}

- (unsigned)featureFlags
{
  return *(_DWORD *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_featureFlags);
}

- (BOOL)wantsAnalytics
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_wantsAnalytics);
}

- (int64_t)analyticsConsentStatus
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setAnalyticsConsentStatus:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentStatus);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)analyticsConsentText
{
  return (NSString *)sub_21CD015FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_analyticsConsentText);
}

- (NSString)verificationIntroductoryText
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)selfReportIntroductoryText
{
  return (NSString *)sub_21CD017D0();
}

- (NSURL)verificationCodeHelpURL
{
  return (NSURL *)sub_21CD0185C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationCodeHelpURL);
}

- (NSString)verificationSymptomOnsetText
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)verificationTravelStatusText
{
  return (NSString *)sub_21CD017D0();
}

- (NSString)vaccinationQuestionText
{
  return (NSString *)sub_21CD017D0();
}

- (NSURL)webReportURL
{
  return (NSURL *)sub_21CD0185C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_webReportURL);
}

- (BOOL)isSymptomOnsetNeeded
{
  return sub_21CD01954((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationSymptomOnsetText);
}

- (BOOL)isTravelStatusNeeded
{
  return sub_21CD01954((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationTravelStatusText);
}

- (BOOL)isVaccinationQuestionNeeded
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  BOOL v3;

  v2 = self;
  v3 = ENUIPublicHealthAgencyModel.isVaccinationQuestionNeeded.getter();

  return v3;
}

- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)initWithRegion:(id)a3 name:(id)a4 appBundleId:(id)a5 introductoryText:(id)a6 header:(id)a7 legalese:(id)a8 consentStatus:(id)a9 consentVersion:(id)a10 diagnosisKeysPreAuthorization:(id)a11 isAssociatedDomainAllowed:(BOOL)a12 isPreauthorizationDomainAllowed:(BOOL)a13 isAuthorized:(BOOL)a14 regionVersion:(int64_t)a15 regionWebsiteURL:(id)a16 regionFAQWebsiteURL:(id)a17 featureFlags:(unsigned int)a18 wantsAnalytics:(BOOL)a19 analyticsConsentStatus:(int64_t)a20 analyticsConsentText:(id)a21 verificationIntroductoryText:(id)a22 selfReportIntroductoryText:(id)a23 verificationCodeHelpURL:(id)a24 verificationSymptomOnsetText:(id)a25 verificationTravelStatusText:(id)a26 vaccinationQuestionText:(id)a27 webReportURL:(id)a28
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, _QWORD, uint64_t, uint64_t);
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v102;
  uint64_t v103;
  _BOOL4 v104;
  _BOOL4 v105;
  _BOOL4 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  id v115;
  id v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  id v134;
  id v135;

  v134 = a8;
  v135 = a7;
  v133 = a3;
  v127 = self;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B3B10);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v102 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30);
  v131 = (uint64_t)&v102 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v132 = (uint64_t)&v102 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v102 - v37;
  v39 = sub_21CD765B0();
  v125 = v40;
  v126 = v39;
  v124 = v32;
  if (a5)
  {
    v41 = sub_21CD765B0();
    v121 = v42;
    v122 = v41;
  }
  else
  {
    v121 = 0;
    v122 = 0;
  }
  v43 = sub_21CD765B0();
  v119 = v44;
  v120 = v43;
  if (a10)
  {
    v45 = sub_21CD765B0();
    v117 = v46;
    v118 = v45;
  }
  else
  {
    v117 = 0;
    v118 = 0;
  }
  v129 = a26;
  v130 = a27;
  v128 = a25;
  v123 = v38;
  if (a16)
  {
    sub_21CD762C8();
    v47 = sub_21CD762E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v38, 0, 1, v47);
  }
  else
  {
    v48 = sub_21CD762E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v38, 1, 1, v48);
  }
  v115 = a11;
  v116 = a9;
  v114 = a28;
  if (a17)
  {
    v49 = v132;
    sub_21CD762C8();
    v50 = sub_21CD762E0();
    v51 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56);
    v52 = v133;
    v53 = v135;
    v54 = v134;
    v55 = a9;
    v56 = a11;
    v57 = a21;
    v58 = a22;
    v59 = a23;
    v60 = a24;
    v61 = v128;
    v62 = v129;
    v63 = v130;
    v64 = a28;
    v51(v49, 0, 1, v50);
    if (a21)
    {
LABEL_12:
      v113 = sub_21CD765B0();
      v112 = v65;

      goto LABEL_15;
    }
  }
  else
  {
    v66 = sub_21CD762E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 56))(v132, 1, 1, v66);
    v67 = v133;
    v68 = v135;
    v69 = v134;
    v70 = a9;
    v71 = a11;
    v72 = a21;
    v73 = a22;
    v74 = a23;
    v75 = a24;
    v76 = v128;
    v77 = v129;
    v78 = v130;
    v79 = a28;
    if (a21)
      goto LABEL_12;
  }
  v113 = 0;
  v112 = 0;
LABEL_15:
  v111 = sub_21CD765B0();
  v110 = v80;

  v109 = sub_21CD765B0();
  v108 = v81;

  if (a24)
  {
    v82 = v131;
    sub_21CD762C8();

    v83 = sub_21CD762E0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))(v82, 0, 1, v83);
  }
  else
  {
    v84 = sub_21CD762E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v84 - 8) + 56))(v131, 1, 1, v84);
  }
  v103 = a20;
  v107 = a15;
  v106 = a14;
  v105 = a13;
  v104 = a12;
  v85 = v128;
  v86 = sub_21CD765B0();
  v88 = v87;

  v89 = v129;
  v90 = sub_21CD765B0();
  v92 = v91;

  v93 = v130;
  v94 = sub_21CD765B0();
  v96 = v95;

  v97 = v114;
  if (v114)
  {
    v98 = (uint64_t)v124;
    sub_21CD762C8();

    v99 = sub_21CD762E0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v99 - 8) + 56))(v98, 0, 1, v99);
  }
  else
  {
    v100 = sub_21CD762E0();
    v98 = (uint64_t)v124;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56))(v124, 1, 1, v100);
  }
  return (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)ENUIPublicHealthAgencyModel.init(region:name:appBundleId:introductoryText:header:legalese:consentStatus:consentVersion:diagnosisKeysPreAuthorization:isAssociatedDomainAllowed:isPreauthorizationDomainAllowed:isAuthorized:regionVersion:regionWebsiteURL:regionFAQWebsiteURL:featureFlags:wantsAnalytics:analyticsConsentStatus:analyticsConsentText:verificationIntroductoryText:selfReportIntroductoryText:verificationCodeHelpURL:verificationSymptomOnsetText:verificationTravelStatusText:vaccinationQuestionText:webReportURL:)((uint64_t)v133, v126, v125, v122, v121, v120, v119, (uint64_t)v135, (uint64_t)v134, (uint64_t)v116, v118, v117, (uint64_t)v115, v104, v105, v106, v107, (uint64_t)v123, v132,
                                                                              a18,
                                                                              a19,
                                                                              v103,
                                                                              v113,
                                                                              v112,
                                                                              v111,
                                                                              v110,
                                                                              v109,
                                                                              v108,
                                                                              v131,
                                                                              v86,
                                                                              v88,
                                                                              v90,
                                                                              v92,
                                                                              v94,
                                                                              v96,
                                                                              v98);
}

- (BOOL)isAppInstalled
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ENUIPublicHealthAgencyModel.isAppInstalled.getter();

  return v3 & 1;
}

- (BOOL)isRegionUsingApp
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  char v3;
  char v4;

  v2 = self;
  ENUIPublicHealthAgencyModel.isRegionUsingApp.getter();
  v4 = v3;

  return v4 & 1;
}

- (BOOL)isAppInstalledAndRegionYetToBeOnboarded
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  char v3;
  char v4;

  v2 = self;
  if ((ENUIPublicHealthAgencyModel.isAppInstalled.getter() & 1) != 0)
  {
    v3 = *((_BYTE *)&v2->super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_isAuthorized);

    v4 = v3 ^ 1;
  }
  else
  {

    v4 = 0;
  }
  return v4 & 1;
}

- (NSString)installedAppName
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  ENUIPublicHealthAgencyModel.installedAppName.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_21CD7658C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (UIImage)installedAppIcon
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v2;
  void *v3;
  void *v4;

  v2 = self;
  ENUIPublicHealthAgencyModel.installedAppIcon.getter();
  v4 = v3;

  return (UIImage *)v4;
}

- (BOOL)regionIsPlaceholder
{
  void *v2;
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region);
  v3 = self;
  v4 = objc_msgSend(v2, sel_regionCode);
  v5 = sub_21CD765B0();
  v7 = v6;

  if (qword_255326220 != -1)
    swift_once();
  if (v5 == static ENUIPublicHealthAgencyModel.dummyRegionCountryCode && v7 == unk_25532B950)
    v9 = 1;
  else
    v9 = sub_21CD76970();

  swift_bridgeObjectRelease();
  return v9 & 1;
}

+ (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)activeRegion
{
  swift_beginAccess();
  return (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)(id)static ENUIPublicHealthAgencyModel.activeRegion;
}

+ (void)setActiveRegion:(id)a3
{
  sub_21CD03680((uint64_t)a1, (uint64_t)a2, a3, (void **)&static ENUIPublicHealthAgencyModel.activeRegion);
}

+ (NSArray)authorizedRegions
{
  return (NSArray *)sub_21CD034B0((uint64_t)a1, (uint64_t)a2, &qword_2540B3B30);
}

+ (void)setAuthorizedRegions:(id)a3
{
  sub_21CD03550((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_2540B3B30, &static ENUIPublicHealthAgencyModel.authorizedRegions);
}

+ (NSArray)availableRegions
{
  return (NSArray *)sub_21CD034B0((uint64_t)a1, (uint64_t)a2, &qword_255326218);
}

+ (void)setAvailableRegions:(id)a3
{
  sub_21CD03550((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, &qword_255326218, &static ENUIPublicHealthAgencyModel.availableRegions);
}

+ (ENEntity)turndownEntity
{
  swift_beginAccess();
  return (ENEntity *)(id)static ENUIPublicHealthAgencyModel.turndownEntity;
}

+ (void)setTurndownEntity:(id)a3
{
  sub_21CD03680((uint64_t)a1, (uint64_t)a2, a3, (void **)&static ENUIPublicHealthAgencyModel.turndownEntity);
}

+ (NSString)dummyRegionCountryCode
{
  void *v2;

  if (qword_255326220 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21CD7658C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSArray)allRegions
{
  void *v2;

  _s28HealthExposureNotificationUI010ENUIPublicA11AgencyModelC10allRegionsSayACGvgZ_0();
  type metadata accessor for ENUIPublicHealthAgencyModel(0);
  v2 = (void *)sub_21CD76610();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

+ (id)regionForRegionCode:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = sub_21CD765B0();
  v5 = v4;
  v6 = _s28HealthExposureNotificationUI010ENUIPublicA11AgencyModelC10allRegionsSayACGvgZ_0();
  swift_bridgeObjectRetain();
  v7 = sub_21CD069AC(v6, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v7;
}

- (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel)init
{
  _TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *result;

  result = (_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_region));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_header));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_legalese));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_consentStatus));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_diagnosisKeysPreAuthorization));
  sub_21CD068DC((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionWebsiteURL);
  sub_21CD068DC((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_regionFAQWebsiteURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21CD068DC((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_verificationCodeHelpURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21CD068DC((uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_webReportURL);
}

+ (void)refreshRegionsWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static ENUIPublicHealthAgencyModel.refreshRegions(completion:)((uint64_t)sub_21CD081F8, v4);
  swift_release();
}

+ (id)defaultModelWithBundleId:(id)a3 isAuthorized:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v4 = a4;
  v5 = sub_21CD765B0();
  v7 = sub_21CD07CC0(v5, v6, v4);
  swift_bridgeObjectRelease();
  return v7;
}

- (BOOL)supportsFeatures:(unsigned int)a3
{
  return (a3 & ~*(_DWORD *)((char *)&self->super.isa
                          + OBJC_IVAR____TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel_featureFlags)) == 0;
}

@end
