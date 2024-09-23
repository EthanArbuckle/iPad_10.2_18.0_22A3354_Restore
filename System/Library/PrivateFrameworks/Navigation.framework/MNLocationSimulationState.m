@implementation MNLocationSimulationState

uint64_t __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findFirstJunction:");
}

uint64_t __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findOffRouteLocationWithMatchedSegments:stepFinishedHandler:", a2, a3);
}

void __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  MNGetMNNavigationSimulationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "latLng");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lat");
    v10 = v9;
    objc_msgSend(v5, "latLng");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lng");
    v13 = 134218240;
    v14 = v10;
    v15 = 2048;
    v16 = v12;
    _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_DEFAULT, "Looking for route to off route location: %f, %f", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_findRouteToOffRouteLocation:stepFinishedHandler:", v5, v6);

}

void __79___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation__block_invoke_242(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a2;
  if (v4)
  {
    v5 = *MEMORY[0x1E0D26AA8];
    v7 = v4;
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLastRouteCoordinate:", v5);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    v4 = v7;
  }

}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__findFirstJunction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "roadID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
    goto LABEL_2;
  v7 = *(_DWORD *)(a1 + 40);
  if (!v7)
  {
    if (!objc_msgSend(v3, "isDrivable"))
      goto LABEL_2;
    v7 = *(_DWORD *)(a1 + 40);
  }
  if (v7 == 2)
  {
    if (!objc_msgSend(v3, "walkableSide"))
      goto LABEL_2;
    v7 = *(_DWORD *)(a1 + 40);
  }
  if (v7 != 3 || objc_msgSend(v3, "bikeableSide"))
  {
    v6 = 1;
    goto LABEL_12;
  }
LABEL_2:
  v6 = 0;
LABEL_12:

  return v6;
}

uint64_t __70___MNLocationSimulationState_SearchingForOffRoute__nextOffRouteTarget__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "lastCoordinate2D");
  objc_msgSend(v5, "distanceToRouteFrom:");
  v8 = v7;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "lastCoordinate2D");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v9, "distanceToRouteFrom:", v11, v13);
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "compare:", v17);

  return v18;
}

void __100___MNLocationSimulationState_SearchingForOffRoute__findRouteToOffRouteLocation_stepFinishedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v3, 1);

}

uint64_t __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findParkingLocation:");
}

uint64_t __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findRouteToParkingLocation:finishedHandler:", a2, a3);
}

void __93___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingDestination__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = *MEMORY[0x1E0D26AA8];
  v7 = *(void **)(a1 + 32);
  v11 = a3;
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastRouteCoordinate:", v6);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v5;

  (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, 0, 0);
}

void __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke(uint64_t a1, void *a2)
{
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_scoreForRoad:coordinate:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 > *(double *)(v5 + 24))
  {
    *(double *)(v5 + 24) = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

void __84___MNLocationSimulationState_SearchingForParkingBeforeArrival__findParkingLocation___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    v3 = objc_msgSend(v2, "coordinates3d");
    v4 = v3 + 24 * objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "coordinateCount");
    v6 = *(double *)(v4 - 24);
    v5 = *(double *)(v4 - 16);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D27168]), "initWithGEOCoordinate:", v6, v5);
    MNGetMNNavigationSimulationLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "internalRoadName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v9;
      v13 = 2048;
      v14 = v6;
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_1B0AD7000, v8, OS_LOG_TYPE_DEFAULT, "Using \"%@\" for parking (%f, %f)", (uint8_t *)&v11, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    MNGetMNNavigationSimulationLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B0AD7000, v10, OS_LOG_TYPE_ERROR, "Unable to find road for parking.", (uint8_t *)&v11, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __107___MNLocationSimulationState_SearchingForParkingBeforeArrival__findRouteToParkingLocation_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v3, 1);

}

@end
