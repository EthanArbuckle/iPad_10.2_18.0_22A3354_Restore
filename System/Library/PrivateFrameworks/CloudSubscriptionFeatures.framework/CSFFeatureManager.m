@implementation CSFFeatureManager

+ (id)addFeatureChangeObserverWithChange:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  if (qword_1ED110E10 != -1)
    swift_once();
  v5 = NotificationObservation.addObserver(change:)((uint64_t)sub_1A5BA98C8, v4);
  swift_release();
  return v5;
}

+ (void)getFeatureEligibilityForFeatureWithId:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v5 = _Block_copy(a5);
  v6 = sub_1A5BC9B60();
  v8 = v7;
  v9 = sub_1A5BC9B60();
  v11 = v10;
  _Block_copy(v5);
  sub_1A5B53160(v6, v8, v9, v11, v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)requestFeatureWithId:(id)a3 completion:(id)a4
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t ObjCClassMetadata;

  v4 = _Block_copy(a4);
  v5 = sub_1A5BC9B60();
  v7 = v6;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v4);
  sub_1A5B549B8(v5, v7, ObjCClassMetadata, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

+ (id)registerForFeatureChangeNotificationsUsingBlock:(id)a3
{
  return +[CSFFeatureManager addFeatureChangeObserverWithChange:](CSFFeatureManager, "addFeatureChangeObserverWithChange:", a3);
}

+ (void)unregisterForFeatureChangeNotificationsUsingObserver:(id)a3
{
  +[CSFFeatureManager removeFeatureChangeObserverWithToken:](CSFFeatureManager, "removeFeatureChangeObserverWithToken:", a3);
}

+ (void)processPushNotificationDictionary:(id)a3
{
  +[CSFFeatureManager processPushNotificationWithDictionary:](CSFFeatureManager, "processPushNotificationWithDictionary:", a3);
}

+ (void)clearCacheAndNotify
{
  +[CSFFeatureManager clearFeatureCacheAndNotify](CSFFeatureManager, "clearFeatureCacheAndNotify");
}

+ (void)refreshGeoclassificationCache
{
  +[CSFFeatureManager refreshGeoclassificationCache](CSFFeatureManager, "refreshGeoclassificationCache");
}

+ (void)getTicketForFeature:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CSFFeatureManager_getTicketForFeature_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E4F6E368;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a1, "getTicketForFeature:completionHandler:", a3, v8);

}

void __63__CSFFeatureManager_getTicketForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  uint64_t v9;
  CSFTicketObject *v10;
  void *v11;
  CSFTicketObject *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v13)
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v13, "status");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "_statusFromSwiftTicketStatus:", v8);

      v10 = [CSFTicketObject alloc];
      objc_msgSend(v13, "ticket");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[CSFTicketObject initWithTicket:withStatus:](v10, "initWithTicket:withStatus:", v11, v9);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

+ (void)getTicketStatusForFeature:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CSFFeatureManager_getTicketStatusForFeature_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E4F6E390;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a1, "getTicketStatusForFeature:completionHandler:", a3, v8);

}

void __69__CSFFeatureManager_getTicketStatusForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (*v6)(void);
  id v7;

  v7 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v7)
      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "_statusFromSwiftTicketStatus:", v7), 0);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

+ (unint64_t)_statusFromSwiftTicketStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v3 = a3;
  objc_msgSend(v3, "rawValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TicketStatus notYetQueued](_TtC25CloudSubscriptionFeatures12TicketStatus, "notYetQueued");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "rawValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TicketStatus enqueued](_TtC25CloudSubscriptionFeatures12TicketStatus, "enqueued");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rawValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v3, "rawValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[TicketStatus active](_TtC25CloudSubscriptionFeatures12TicketStatus, "active");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rawValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqualToString:", v15);

      if (v16)
        v8 = 2;
      else
        v8 = 3;
    }
  }

  return v8;
}

+ (void)postCFUIfEligible
{
  objc_msgSend(a1, "postCFUIfEligibleWithCompletionHandler:", &__block_literal_global_2);
}

void __38__CSFFeatureManager_postCFUIfEligible__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _CSFGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1A5B4D000, v3, OS_LOG_TYPE_DEFAULT, "Finished attempting to post CFU with error: %@", (uint8_t *)&v4, 0xCu);
  }

}

+ (id)cachedFeatureObjectWithId:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = sub_1A5BC9B60();
  v5 = sub_1A5B5100C(v3, v4);
  if (v5)
  {
    v6 = v5;
    v7 = CloudFeature.cloudFeatureObject.getter();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = 0;
  }
  return v7;
}

+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = _Block_copy(a7);
  v9 = sub_1A5BC9B60();
  v11 = v10;
  v12 = sub_1A5BC9B60();
  v14 = v13;
  v15 = sub_1A5BC9B60();
  v17 = v16;
  _Block_copy(v8);
  sub_1A5BA5DB0(v9, v11, v12, v14, v15, v17, a6, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjCClassMetadata;

  v7 = _Block_copy(a6);
  v8 = sub_1A5BC9B60();
  v10 = v9;
  v11 = sub_1A5BC9B60();
  v13 = v12;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  sub_1A5BA6050(v8, v10, v11, v13, a5, ObjCClassMetadata, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)addTicketChangeObserverWithFeatureName:(id)a3 change:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjCClassMetadata;
  _QWORD *v10;
  id v11;

  v4 = _Block_copy(a4);
  v5 = sub_1A5BC9B60();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  if (qword_1ED110E10 != -1)
    swift_once();
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = ObjCClassMetadata;
  v10[3] = v5;
  v10[4] = v7;
  v10[5] = sub_1A5BA9878;
  v10[6] = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  v11 = NotificationObservation.addTicketObserver(change:)((uint64_t)sub_1A5BA6370, (uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v11;
}

+ (uint64_t)removeFeatureChangeObserverWithToken:(void *)a3
{
  uint64_t v4;

  v4 = qword_1ED110E10;
  swift_unknownObjectRetain();
  if (v4 != -1)
    swift_once();
  _s25CloudSubscriptionFeatures23NotificationObservationC14removeObserver5tokenySo8NSObject_p_tF_0(a3);
  return swift_unknownObjectRelease();
}

+ (void)processPushNotificationWithDictionary:(id)a3
{
  if (a3)
    sub_1A5BC9AE8();
  swift_getObjCClassMetadata();
  static CSFFeatureManager.processPushNotification(dictionary:)();
  swift_bridgeObjectRelease();
}

+ (void)clearFeatureCacheAndNotify
{
  sub_1A5BA6374("Cache clear request", sub_1A5B97D9C);
}

+ (void)clearTicketCacheAndNotify
{
  sub_1A5BA6374("Ticket cache clear request received.", sub_1A5B97DD4);
}

+ (BOOL)isCloudSubscriber
{
  return _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE02isC10SubscriberSbyFZ_0();
}

+ (id)urlForRSVPDataDetectorsWithContext:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1A5BC9878();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1A5BC9AE8();
  _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE23urlForRSVPDataDetectors7context10Foundation3URLVSDySSypG_tFZ_0(v7, v6);
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1A5BC9848();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

+ (BOOL)shouldShowRSVPDataDetectors
{
  return _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE27shouldShowRSVPDataDetectorsSbyFZ_0() & 1;
}

+ (void)getTicketStatusForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE7FAC30;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE7FAC38;
  v14[5] = v13;
  v15 = a3;
  sub_1A5BA5750((uint64_t)v9, (uint64_t)&unk_1EE7FAC40, (uint64_t)v14);
  swift_release();
}

+ (void)getTicketStatusFromCacheForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE7FAC10;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE7FAC18;
  v14[5] = v13;
  v15 = a3;
  sub_1A5BA5750((uint64_t)v9, (uint64_t)&unk_1EE7FAC20, (uint64_t)v14);
  swift_release();
}

+ (void)getTicketForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE7FABF0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE7FABF8;
  v14[5] = v13;
  v15 = a3;
  sub_1A5BA5750((uint64_t)v9, (uint64_t)&unk_1EE7FAC00, (uint64_t)v14);
  swift_release();
}

+ (void)deviceHasAnyTicketWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE7FABD0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7FABD8;
  v12[5] = v11;
  sub_1A5BA5750((uint64_t)v7, (uint64_t)&unk_1EE7FABE0, (uint64_t)v12);
  swift_release();
}

+ (void)clearCFUWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE7FABB0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7FABB8;
  v12[5] = v11;
  sub_1A5BA5750((uint64_t)v7, (uint64_t)&unk_1EE7FABC0, (uint64_t)v12);
  swift_release();
}

+ (void)postCFUIfEligibleWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE7FAB90;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7FAB98;
  v12[5] = v11;
  sub_1A5BA5750((uint64_t)v7, (uint64_t)&unk_1EE7FABA0, (uint64_t)v12);
  swift_release();
}

+ (void)gmOptInToggleWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE7FAB70;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7FAB78;
  v12[5] = v11;
  sub_1A5BA5750((uint64_t)v7, (uint64_t)&unk_1EE7FAB80, (uint64_t)v12);
  swift_release();
}

+ (void)forcePostCFUWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1112B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1A5BC9CF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE7FAB30;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE7FAB40;
  v12[5] = v11;
  sub_1A5BA5750((uint64_t)v7, (uint64_t)&unk_1EE7FAB50, (uint64_t)v12);
  swift_release();
}

@end
