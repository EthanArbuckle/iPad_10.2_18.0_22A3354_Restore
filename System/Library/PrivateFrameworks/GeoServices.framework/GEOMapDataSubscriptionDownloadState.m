@implementation GEOMapDataSubscriptionDownloadState

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t result;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isFullyLoadedForDataType:dataSubtype:version:associatedDataCount:associatedDataSize:", a2, a4, 1, &v12, &v11))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v12;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "isFullyLoadedForDataType:dataSubtype:version:associatedDataCount:associatedDataSize:", a2, a4, 0, 0, 0);
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v10 = 0;
  else
    v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == 0;
  *a5 = v10;
  return result;
}

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = objc_msgSend(a2, "unsignedIntValue");
  v9 = objc_msgSend(v7, "unsignedLongLongValue");

  v11 = 0;
  v12 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "isFullyLoadedForDataType:dataSubtype:version:associatedDataCount:associatedDataSize:", 1024, v8, v9, &v12, &v11);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v12;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) ^ 1;
  return result;
}

uint64_t __199___GEOMapDataSubscriptionDownloadState__updateFromSubscription_metadata_activeOfflineVersions_latestAvailableOfflineVersions_isOfflineDataUpdateAvailable_isOfflineDataUpdateRequired_manifestManager___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = objc_msgSend(a2, "unsignedIntValue");
  v9 = objc_msgSend(v7, "unsignedLongLongValue");

  v11 = 0;
  v12 = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "isFullyLoadedForDataType:dataSubtype:version:associatedDataCount:associatedDataSize:", 1024, v8, v9, &v12, &v11);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v12;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v11;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) ^ 1;
  return result;
}

@end
