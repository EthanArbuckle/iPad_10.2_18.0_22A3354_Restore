@implementation GEOSharedNavState

void __43__GEOSharedNavState_Testing___msp_testTrip__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  id v13;
  id v14;

  v2 = objc_alloc_init(*(Class *)(a1 + 32));
  v3 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_34, "setGroupIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_msp_registerTestTrip:", _MergedGlobals_34);
  v14 = objc_alloc_init(MEMORY[0x1E0D27538]);
  objc_msgSend(v14, "setFromIdentifier:", CFSTR("test@testdomain.com.au"));
  objc_msgSend(v14, "setFromDisplayName:", CFSTR("Trip Tester"));
  objc_msgSend(v14, "fromDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalName:", v6);

  objc_msgSend((id)_MergedGlobals_34, "setSenderInfo:", v14);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend((id)_MergedGlobals_34, "setUpdatedTimestamp:");
  objc_msgSend((id)_MergedGlobals_34, "setTransportType:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0D27548]);
  v8 = objc_alloc_init(MEMORY[0x1E0D271E8]);
  objc_msgSend(*(id *)(a1 + 32), "preciseSanFrancisco");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlace:", v9);

  objc_msgSend(v7, "setMapItemStorage:", v8);
  objc_msgSend((id)_MergedGlobals_34, "addWaypointInfo:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setEtaTimestamp:", v11 + 3600.0);
  objc_msgSend(v10, "setRemainingTime:", 3600.0);
  objc_msgSend(v10, "setRemainingDistance:", 12300.0);
  objc_msgSend((id)_MergedGlobals_34, "addEtaInfo:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0D27528]);
  v13 = objc_alloc_init(MEMORY[0x1E0D27140]);
  objc_msgSend(v13, "setLat:", 37.323365);
  objc_msgSend(v13, "setLng:", -122.006453);
  objc_msgSend(v12, "setCoordinate:", v13);
  objc_msgSend((id)_MergedGlobals_34, "setLastLocation:", v12);

}

void __60__GEOSharedNavState_Testing___msp_testTripWithMultipleStops__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;

  v2 = objc_alloc_init(*(Class *)(a1 + 32));
  v3 = (void *)qword_1ED3282D0;
  qword_1ED3282D0 = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED3282D0, "setGroupIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_msp_registerTestTrip:", qword_1ED3282D0);
  v19 = objc_alloc_init(MEMORY[0x1E0D27538]);
  objc_msgSend(v19, "setFromIdentifier:", CFSTR("test@testdomain.com.au"));
  objc_msgSend(v19, "setFromDisplayName:", CFSTR("Trip Tester"));
  objc_msgSend(v19, "fromDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocalName:", v6);

  objc_msgSend((id)qword_1ED3282D0, "setSenderInfo:", v19);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend((id)qword_1ED3282D0, "setUpdatedTimestamp:");
  objc_msgSend((id)qword_1ED3282D0, "setTransportType:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0D27548]);
  v8 = objc_alloc_init(MEMORY[0x1E0D271E8]);
  objc_msgSend(*(id *)(a1 + 32), "preciseSanFrancisco");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlace:", v9);

  objc_msgSend(v7, "setMapItemStorage:", v8);
  objc_msgSend((id)qword_1ED3282D0, "addWaypointInfo:", v7);
  v10 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v10, "setEtaTimestamp:", v11 + 480.0);
  objc_msgSend(v10, "setRemainingTime:", 480.0);
  objc_msgSend(v10, "setRemainingDistance:", 2200.0);
  objc_msgSend((id)qword_1ED3282D0, "addEtaInfo:", v10);

  v12 = objc_alloc_init(MEMORY[0x1E0D27548]);
  v13 = objc_alloc_init(MEMORY[0x1E0D271E8]);
  objc_msgSend(*(id *)(a1 + 32), "preciseChicago");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlace:", v14);

  objc_msgSend(v12, "setMapItemStorage:", v13);
  objc_msgSend((id)qword_1ED3282D0, "addWaypointInfo:", v12);
  v15 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v15, "setEtaTimestamp:", v16 + 720.0);
  objc_msgSend(v15, "setRemainingTime:", 720.0);
  objc_msgSend(v15, "setRemainingDistance:", 3200.0);
  objc_msgSend((id)qword_1ED3282D0, "addEtaInfo:", v15);

  v17 = objc_alloc_init(MEMORY[0x1E0D27528]);
  v18 = objc_alloc_init(MEMORY[0x1E0D27140]);
  objc_msgSend(v18, "setLat:", 37.323365);
  objc_msgSend(v18, "setLng:", -122.006453);
  objc_msgSend(v17, "setCoordinate:", v18);
  objc_msgSend((id)qword_1ED3282D0, "setLastLocation:", v17);

}

uint64_t __72__GEOSharedNavState_Testing___msp_testTripWithMultipleStopsMiddleOfTrip__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_msp_testTripWithMultipleStops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)qword_1ED3282E0;
  qword_1ED3282E0 = v3;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED3282E0, "setGroupIdentifier:", v6);

  objc_msgSend(*(id *)(a1 + 32), "_msp_registerTestTrip:", qword_1ED3282E0);
  return objc_msgSend((id)qword_1ED3282E0, "setCurrentWaypointIndex:", 1);
}

void __46__GEOSharedNavState_Testing___msp_testTripSky__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;

  v2 = objc_alloc_init(*(Class *)(a1 + 32));
  v3 = (void *)qword_1ED3282F0;
  qword_1ED3282F0 = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED3282F0, "setGroupIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_msp_registerTestTrip:", qword_1ED3282F0);
  v11 = objc_alloc_init(MEMORY[0x1E0D27538]);
  objc_msgSend(v11, "setFromIdentifier:", CFSTR("test@testdomain.com.au"));
  objc_msgSend(v11, "setFromDisplayName:", CFSTR("Trip Tester"));
  objc_msgSend(v11, "fromDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocalName:", v6);

  objc_msgSend((id)qword_1ED3282F0, "setSenderInfo:", v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend((id)qword_1ED3282F0, "setUpdatedTimestamp:");
  objc_msgSend((id)qword_1ED3282F0, "setTransportType:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0D271E8]);
  objc_msgSend(*(id *)(a1 + 32), "preciseSanFrancisco");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlace:", v8);

  objc_msgSend((id)qword_1ED3282F0, "setDestinationInfo:", v7);
  v9 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v9, "setEtaTimestamp:", v10 + 3600.0);
  objc_msgSend(v9, "setRemainingTime:", 3600.0);
  objc_msgSend(v9, "setRemainingDistance:", 12300.0);
  objc_msgSend(v9, "setLatitude:", 37.323365);
  objc_msgSend(v9, "setLongitude:", -122.006453);
  objc_msgSend((id)qword_1ED3282F0, "addEtaInfo:", v9);
  objc_msgSend((id)qword_1ED3282F0, "merge:", qword_1ED3282F0);

}

void __59__GEOSharedNavState_Testing___msp_testTripClosedTripInPast__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_msp_testTrip");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "copy");
  v3 = (void *)qword_1ED328300;
  qword_1ED328300 = v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED328300, "setGroupIdentifier:", v5);

  objc_msgSend((id)qword_1ED328300, "setClosed:", 1);
  objc_msgSend((id)qword_1ED328300, "setArrived:", 0);
  objc_msgSend((id)qword_1ED328300, "setHasArrived:", 0);
  v7 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "setEtaTimestamp:", v6 + -1800.0);
  objc_msgSend(v7, "setRemainingTime:", 3600.0);
  objc_msgSend(v7, "setRemainingDistance:", 12300.0);
  objc_msgSend((id)qword_1ED328300, "clearEtaInfos");
  objc_msgSend((id)qword_1ED328300, "addEtaInfo:", v7);

}

void __56__GEOSharedNavState_Testing___msp_testTripsByIdentifier__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ED328310;
  qword_1ED328310 = (uint64_t)v0;

}

void __61__GEOSharedNavState_Testing___msp_blockedTestTripIdentifiers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1ED328320;
  qword_1ED328320 = (uint64_t)v0;

}

void __71__GEOSharedNavState_MSPExtras___createPlaceholderETAInfosForWaypoints___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0D27520]);
  objc_msgSend(v5, "setWaypointIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "addEtaInfo:", v5);

}

uint64_t __44__GEOSharedNavState_MSPExtras__equalityTest__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

void __63__GEOSharedNavState_MSPExtras__stripForSendingUpdatedWaypoints__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setMapItemStorage:", 0);
  objc_msgSend(v2, "setChargingStationInfo:", 0);

}

id __86__GEOSharedNavState_ReceiverCapabilities__instanceCompatibleWithReceiverCapabilities___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v3 == v2)
  {
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v3;
}

@end
