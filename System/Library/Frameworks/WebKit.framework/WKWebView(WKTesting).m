@implementation WKWebView(WKTesting)

- (uint64_t)_setNowPlayingMetadataObserver:()WKTesting
{
  void *v2;

  *a1 = off_1E34BF120;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_setNowPlayingMetadataObserver:()WKTesting
{
  _WKNowPlayingMetadata *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v4 = objc_alloc_init(_WKNowPlayingMetadata);
  if (*a2)
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v5 = &stru_1E351F1B8;
  -[_WKNowPlayingMetadata setTitle:](v4, "setTitle:", v5);
  if (a2[1])
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v6 = &stru_1E351F1B8;
  -[_WKNowPlayingMetadata setArtist:](v4, "setArtist:", v6);
  if (a2[2])
    v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v7 = &stru_1E351F1B8;
  -[_WKNowPlayingMetadata setAlbum:](v4, "setAlbum:", v7);
  if (a2[3])
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v8 = &stru_1E351F1B8;
  -[_WKNowPlayingMetadata setSourceApplicationIdentifier:](v4, "setSourceApplicationIdentifier:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  if (v4)
    CFRelease(v4);
}

- (uint64_t)_requestActiveNowPlayingSessionInfo:()WKTesting
{
  if (*(_QWORD *)a3)
    WTF::StringImpl::operator NSString *();
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 8) + 16))(*(double *)(a3 + 64), *(double *)(a3 + 72));
}

- (uint64_t)_processWillSuspendForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_doAfterProcessingAllPendingMouseEvents:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementOverrideTimerForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionReportURLsForTesting:()WKTesting destinationURL:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_setPrivateClickMeasurementAppBundleIDForTesting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_dumpPrivateClickMeasurement:()WKTesting
{
  if (*a2)
    WTF::StringImpl::operator NSString *();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_lastNavigationWasAppInitiated:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_appPrivacyReportTestingData:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_clearAppPrivacyReportTestingData:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_isLayerTreeFrozenForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_computePagesForPrinting:()WKTesting completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)_gpuToWebProcessConnectionCountForTesting:()WKTesting
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

@end
