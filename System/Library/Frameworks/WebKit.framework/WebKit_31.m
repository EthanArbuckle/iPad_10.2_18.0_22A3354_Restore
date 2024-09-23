uint64_t WebCore::platformSummaryItems()
{
  return MEMORY[0x1E0DD2220]();
}

uint64_t WebCore::provideGeolocationTo()
{
  return MEMORY[0x1E0DD2230]();
}

uint64_t WebCore::serializationForHTML(WebCore *this, const Color *a2)
{
  return MEMORY[0x1E0DD2238](this, a2);
}

uint64_t WebCore::threadGlobalDataSlow(WebCore *this)
{
  return MEMORY[0x1E0DD2240](this);
}

uint64_t WebCore::AudioHardwareListener::setCreationFunction()
{
  return MEMORY[0x1E0DD2248]();
}

uint64_t WebCore::AudioHardwareListener::resetCreationFunction(WebCore::AudioHardwareListener *this)
{
  return MEMORY[0x1E0DD2250](this);
}

uint64_t WebCore::AudioHardwareListener::create()
{
  return MEMORY[0x1E0DD2258]();
}

uint64_t WebCore::AudioHardwareListener::AudioHardwareListener()
{
  return MEMORY[0x1E0DD2260]();
}

uint64_t WebCore::AudioSampleBufferList::zeroABL(WebCore::AudioSampleBufferList *this, AudioBufferList *a2)
{
  return MEMORY[0x1E0DD2268](this, a2);
}

uint64_t WebCore::AuthenticatorResponse::setExtensions()
{
  return MEMORY[0x1E0DD2270]();
}

uint64_t WebCore::BackForwardController::itemAtIndex(WebCore::BackForwardController *this)
{
  return MEMORY[0x1E0DD2280](this);
}

uint64_t WebCore::BackgroundFetchEngine::addFetchFromStore()
{
  return MEMORY[0x1E0DD2298]();
}

uint64_t WebCore::BackgroundFetchEngine::abortBackgroundFetch()
{
  return MEMORY[0x1E0DD22A0]();
}

uint64_t WebCore::BackgroundFetchEngine::clickBackgroundFetch()
{
  return MEMORY[0x1E0DD22A8]();
}

uint64_t WebCore::BackgroundFetchEngine::pauseBackgroundFetch()
{
  return MEMORY[0x1E0DD22B0]();
}

uint64_t WebCore::BackgroundFetchEngine::resumeBackgroundFetch()
{
  return MEMORY[0x1E0DD22B8]();
}

uint64_t WebCore::BlobDataFileReference::expectedModificationTime(WebCore::BlobDataFileReference *this)
{
  return MEMORY[0x1E0DD22C0](this);
}

uint64_t WebCore::BlobDataFileReference::path(WebCore::BlobDataFileReference *this)
{
  return MEMORY[0x1E0DD22C8](this);
}

uint64_t WebCore::BlobDataFileReference::BlobDataFileReference(WebCore::BlobDataFileReference *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD22D0](this, a2, a3);
}

void WebCore::BlobDataFileReference::~BlobDataFileReference(WebCore::BlobDataFileReference *this)
{
  MEMORY[0x1E0DD22D8](this);
}

uint64_t WebCore::ContentChangeObserver::MouseMovedScope::MouseMovedScope(WebCore::ContentChangeObserver::MouseMovedScope *this, Document *a2)
{
  return MEMORY[0x1E0DD22E0](this, a2);
}

void WebCore::ContentChangeObserver::MouseMovedScope::~MouseMovedScope(WebCore::ContentChangeObserver::MouseMovedScope *this)
{
  MEMORY[0x1E0DD22E8](this);
}

uint64_t WebCore::ContentChangeObserver::isConsideredVisible(WebCore::ContentChangeObserver *this, const Node *a2)
{
  return MEMORY[0x1E0DD22F0](this, a2);
}

uint64_t WebCore::ContentChangeObserver::didCancelPotentialTap(WebCore::ContentChangeObserver *this, WebCore::LocalFrame *a2)
{
  return MEMORY[0x1E0DD22F8](this, a2);
}

uint64_t WebCore::ContentChangeObserver::didRecognizeLongPress(WebCore::ContentChangeObserver *this, WebCore::LocalFrame *a2)
{
  return MEMORY[0x1E0DD2300](this, a2);
}

uint64_t WebCore::ContentChangeObserver::stopContentObservation(WebCore::ContentChangeObserver *this)
{
  return MEMORY[0x1E0DD2308](this);
}

uint64_t WebCore::ContentChangeObserver::didPreventDefaultForEvent(WebCore::ContentChangeObserver *this, WebCore::LocalFrame *a2)
{
  return MEMORY[0x1E0DD2310](this, a2);
}

uint64_t WebCore::ContentChangeObserver::startContentObservationForDuration()
{
  return MEMORY[0x1E0DD2318]();
}

uint64_t WebCore::ContentSecurityPolicy::didReceiveHeaders()
{
  return MEMORY[0x1E0DD2320]();
}

uint64_t WebCore::ContentSecurityPolicy::ContentSecurityPolicy()
{
  return MEMORY[0x1E0DD2328]();
}

void WebCore::ContentSecurityPolicy::~ContentSecurityPolicy(WebCore::ContentSecurityPolicy *this)
{
  MEMORY[0x1E0DD2330](this);
}

uint64_t WebCore::DeprecationReportBody::create()
{
  return MEMORY[0x1E0DD2338]();
}

uint64_t WebCore::DestinationColorSpace::SRGB(WebCore::DestinationColorSpace *this)
{
  return MEMORY[0x1E0DD2340](this);
}

uint64_t WebCore::DestinationColorSpace::DestinationColorSpace()
{
  return MEMORY[0x1E0DD2348]();
}

uint64_t WebCore::DiagnosticLoggingKeys::webViewKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2358](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::occurredKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2360](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::timedOutKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2368](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::networkCacheKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2370](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::internalErrorKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2378](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::userZoomActionKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2380](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::invalidSessionIDKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2388](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::telemetryPageLoadKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2390](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::domainCausingCrashKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2398](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::simulatedPageCrashKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23A0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::backNavigationDeltaKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23A8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::domainCausingJetsamKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23B0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::unknownEntryRequestKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23B8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::networkProcessCrashedKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23C0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::failedLessThan2SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23C8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::failedLessThan5SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23D0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::entryRightlyNotWarmedUpKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23D8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::entryWronglyNotWarmedUpKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23E0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::failedLessThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23E8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::failedMoreThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23F0](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::canceledLessThan2SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD23F8](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::canceledLessThan5SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2400](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::createSharedBufferFailedKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2408](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::synchronousMessageFailedKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2410](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::canceledLessThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2418](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::canceledMoreThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2420](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::exceededActiveMemoryLimitKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2428](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::succeededLessThan2SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2430](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::succeededLessThan5SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2438](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::exceededBackgroundCPULimitKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2440](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::succeededLessThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2448](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::succeededMoreThan20SecondsKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2450](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::exceededInactiveMemoryLimitKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2458](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::wastedSpeculativeWarmupWithRevalidationKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2460](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::wastedSpeculativeWarmupWithoutRevalidationKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2468](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::successfulSpeculativeWarmupWithRevalidationKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2470](this);
}

uint64_t WebCore::DiagnosticLoggingKeys::successfulSpeculativeWarmupWithoutRevalidationKey(WebCore::DiagnosticLoggingKeys *this)
{
  return MEMORY[0x1E0DD2478](this);
}

uint64_t WebCore::GeolocationController::errorOccurred()
{
  return MEMORY[0x1E0DD2480]();
}

uint64_t WebCore::GeolocationController::supplementName(WebCore::GeolocationController *this)
{
  return MEMORY[0x1E0DD2488](this);
}

uint64_t WebCore::GeolocationController::positionChanged()
{
  return MEMORY[0x1E0DD2490]();
}

uint64_t WebCore::HTMLAttachmentElement::updateAttributes()
{
  return MEMORY[0x1E0DD2498]();
}

uint64_t WebCore::HTMLAttachmentElement::updateIconForWideLayout()
{
  return MEMORY[0x1E0DD24A0]();
}

uint64_t WebCore::HTMLAttachmentElement::updateIconForNarrowLayout()
{
  return MEMORY[0x1E0DD24A8]();
}

uint64_t WebCore::HTMLAttachmentElement::updateThumbnailForWideLayout()
{
  return MEMORY[0x1E0DD24B0]();
}

uint64_t WebCore::HTMLAttachmentElement::updateThumbnailForNarrowLayout()
{
  return MEMORY[0x1E0DD24B8]();
}

uint64_t WebCore::HTMLAttachmentElement::updateAssociatedElementWithData()
{
  return MEMORY[0x1E0DD24C0]();
}

uint64_t WebCore::HTMLFrameOwnerElement::scheduleInvalidateStyleAndLayerComposition(WebCore::HTMLFrameOwnerElement *this)
{
  return MEMORY[0x1E0DD24C8](this);
}

uint64_t WebCore::IDBDatabaseIdentifier::databaseDirectoryRelativeToRoot()
{
  return MEMORY[0x1E0DD24F0]();
}

uint64_t WebCore::IDBResourceIdentifier::emptyValue(WebCore::IDBResourceIdentifier *this)
{
  return MEMORY[0x1E0DD24F8](this);
}

uint64_t WebCore::IDBResourceIdentifier::IDBResourceIdentifier()
{
  return MEMORY[0x1E0DD2500]();
}

uint64_t WebCore::InspectorFrontendHost::disconnectClient(WebCore::InspectorFrontendHost *this)
{
  return MEMORY[0x1E0DD2508](this);
}

uint64_t WebCore::InspectorFrontendHost::addSelfToGlobalObjectInWorld(WebCore::InspectorFrontendHost *this, WebCore::DOMWrapperWorld *a2)
{
  return MEMORY[0x1E0DD2510](this, a2);
}

uint64_t WebCore::InspectorFrontendHost::InspectorFrontendHost()
{
  return MEMORY[0x1E0DD2518]();
}

void WebCore::InspectorFrontendHost::~InspectorFrontendHost(WebCore::InspectorFrontendHost *this)
{
  MEMORY[0x1E0DD2520](this);
}

uint64_t WebCore::InspectorOverlayLabel::InspectorOverlayLabel()
{
  return MEMORY[0x1E0DD2528]();
}

uint64_t WebCore::JSCSSStyleDeclaration::toWrapped(WebCore::JSCSSStyleDeclaration *this, JSC::VM *a2, JSValue a3)
{
  return MEMORY[0x1E0DD2530](this, a2, a3.super.isa);
}

uint64_t WebCore::MediaKeySystemRequest::deny(WebCore::MediaKeySystemRequest *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD2540](this, a2);
}

uint64_t WebCore::MediaKeySystemRequest::allow(WebCore::MediaKeySystemRequest *this)
{
  return MEMORY[0x1E0DD2548](this);
}

uint64_t WebCore::MediaRecorderProvider::createMediaRecorderPrivate()
{
  return MEMORY[0x1E0DD2550]();
}

uint64_t WebCore::NetworkStorageSession::getCookies(WebCore::NetworkStorageSession *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD2558](this, a2);
}

uint64_t WebCore::NetworkStorageSession::setCookies()
{
  return MEMORY[0x1E0DD2560]();
}

uint64_t WebCore::NetworkStorageSession::deleteCookie()
{
  return MEMORY[0x1E0DD2568]();
}

{
  return MEMORY[0x1E0DD8210]();
}

uint64_t WebCore::NetworkStorageSession::deleteCookies()
{
  return MEMORY[0x1E0DD2570]();
}

uint64_t WebCore::NetworkStorageSession::getAllCookies(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD2578](this);
}

uint64_t WebCore::NetworkStorageSession::maxAgeCacheCap(WebCore::NetworkStorageSession *this, const WebCore::ResourceRequest *a2)
{
  return MEMORY[0x1E0DD2580](this, a2);
}

uint64_t WebCore::NetworkStorageSession::deleteAllCookies()
{
  return MEMORY[0x1E0DD2588]();
}

uint64_t WebCore::NetworkStorageSession::domCookiesForHost(WebCore::NetworkStorageSession *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD2590](this, a2);
}

uint64_t WebCore::NetworkStorageSession::setManagedDomains()
{
  return MEMORY[0x1E0DD2598]();
}

uint64_t WebCore::NetworkStorageSession::grantStorageAccess()
{
  return MEMORY[0x1E0DD25A0]();
}

uint64_t WebCore::NetworkStorageSession::setAppBoundDomains()
{
  return MEMORY[0x1E0DD25A8]();
}

uint64_t WebCore::NetworkStorageSession::resetManagedDomains(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD25B0](this);
}

uint64_t WebCore::NetworkStorageSession::resetAppBoundDomains(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD25B8](this);
}

uint64_t WebCore::NetworkStorageSession::processMayUseCookieAPI(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD25C0](this);
}

uint64_t WebCore::NetworkStorageSession::removeAllStorageAccess(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD25C8](this);
}

uint64_t WebCore::NetworkStorageSession::getHostnamesWithCookies()
{
  return MEMORY[0x1E0DD25D0]();
}

uint64_t WebCore::NetworkStorageSession::deleteCookiesForHostnames()
{
  return MEMORY[0x1E0DD25D8]();
}

{
  return MEMORY[0x1E0DD25E0]();
}

uint64_t WebCore::NetworkStorageSession::findAdditionalLoginDomain()
{
  return MEMORY[0x1E0DD25E8]();
}

uint64_t WebCore::NetworkStorageSession::capExpiryOfPersistentCookie()
{
  return MEMORY[0x1E0DD25F0]();
}

uint64_t WebCore::NetworkStorageSession::grantCrossPageStorageAccess()
{
  return MEMORY[0x1E0DD25F8]();
}

uint64_t WebCore::NetworkStorageSession::permitProcessToUseCookieAPI(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD2600](this);
}

uint64_t WebCore::NetworkStorageSession::removeStorageAccessForFrame()
{
  return MEMORY[0x1E0DD2608]();
}

uint64_t WebCore::NetworkStorageSession::setTrackingPreventionEnabled(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD2610](this);
}

uint64_t WebCore::NetworkStorageSession::deleteAllCookiesModifiedSince()
{
  return MEMORY[0x1E0DD2618]();
}

uint64_t WebCore::NetworkStorageSession::setAgeCapForClientSideCookies()
{
  return MEMORY[0x1E0DD2620]();
}

uint64_t WebCore::NetworkStorageSession::setAllCookiesToSameSiteStrict()
{
  return MEMORY[0x1E0DD2628]();
}

uint64_t WebCore::NetworkStorageSession::addCookiesEnabledStateObserver()
{
  return MEMORY[0x1E0DD2630]();
}

uint64_t WebCore::NetworkStorageSession::setThirdPartyCookieBlockingMode()
{
  return MEMORY[0x1E0DD2638]();
}

uint64_t WebCore::NetworkStorageSession::storageAccessQuirkForDomainPair()
{
  return MEMORY[0x1E0DD2640]();
}

uint64_t WebCore::NetworkStorageSession::updateStorageAccessPromptQuirks()
{
  return MEMORY[0x1E0DD2648]();
}

uint64_t WebCore::NetworkStorageSession::removeCookiesEnabledStateObserver()
{
  return MEMORY[0x1E0DD2650]();
}

uint64_t WebCore::NetworkStorageSession::loginDomainMatchesRequestingDomain()
{
  return MEMORY[0x1E0DD2658]();
}

uint64_t WebCore::NetworkStorageSession::createCFStorageSessionForIdentifier()
{
  return MEMORY[0x1E0DD2660]();
}

uint64_t WebCore::NetworkStorageSession::storageAccessQuirkForTopFrameDomain(WebCore::NetworkStorageSession *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD2668](this, a2);
}

uint64_t WebCore::NetworkStorageSession::setDomainsWithCrossPageStorageAccess()
{
  return MEMORY[0x1E0DD2670]();
}

uint64_t WebCore::NetworkStorageSession::setCacheMaxAgeCapForPrevalentResources()
{
  return MEMORY[0x1E0DD2678]();
}

uint64_t WebCore::NetworkStorageSession::resetCacheMaxAgeCapForPrevalentResources(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD2680](this);
}

uint64_t WebCore::NetworkStorageSession::setTrackingPreventionDebugLoggingEnabled(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD2688](this);
}

uint64_t WebCore::NetworkStorageSession::setDomainsWithUserInteractionAsFirstParty()
{
  return MEMORY[0x1E0DD2690]();
}

uint64_t WebCore::NetworkStorageSession::stopListeningForCookieChangeNotifications()
{
  return MEMORY[0x1E0DD2698]();
}

uint64_t WebCore::NetworkStorageSession::startListeningForCookieChangeNotifications()
{
  return MEMORY[0x1E0DD26A0]();
}

uint64_t WebCore::NetworkStorageSession::setPrevalentDomainsToBlockButKeepCookiesFor()
{
  return MEMORY[0x1E0DD26A8]();
}

uint64_t WebCore::NetworkStorageSession::setPrevalentDomainsToBlockAndDeleteCookiesFor()
{
  return MEMORY[0x1E0DD26B0]();
}

uint64_t WebCore::NetworkStorageSession::clearPageSpecificDataForResourceLoadStatistics()
{
  return MEMORY[0x1E0DD26B8]();
}

uint64_t WebCore::NetworkStorageSession::resetCrossSiteLoadsWithLinkDecorationForTesting(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD26C0](this);
}

uint64_t WebCore::NetworkStorageSession::didCommitCrossSiteLoadWithDataTransferFromPrevalentResource()
{
  return MEMORY[0x1E0DD26C8]();
}

uint64_t WebCore::NetworkStorageSession::canRequestStorageAccessForLoginOrCompatibilityPurposesWithoutPriorUserInteraction()
{
  return MEMORY[0x1E0DD26D0]();
}

uint64_t WebCore::NetworkStorageSession::setCookie()
{
  return MEMORY[0x1E0DD26D8]();
}

uint64_t WebCore::NetworkStorageSession::NetworkStorageSession()
{
  return MEMORY[0x1E0DD26E8]();
}

void WebCore::NetworkStorageSession::~NetworkStorageSession(WebCore::NetworkStorageSession *this)
{
  MEMORY[0x1E0DD26F0](this);
}

uint64_t WebCore::PageOverlayController::installPageOverlay()
{
  return MEMORY[0x1E0DD26F8]();
}

uint64_t WebCore::PageOverlayController::uninstallPageOverlay()
{
  return MEMORY[0x1E0DD2700]();
}

uint64_t WebCore::PlatformKeyboardEvent::setCurrentModifierState()
{
  return MEMORY[0x1E0DD2708]();
}

uint64_t WebCore::PlatformKeyboardEvent::disambiguateKeyDownEvent()
{
  return MEMORY[0x1E0DD2710]();
}

uint64_t WebCore::PlatformKeyboardEvent::currentStateOfModifierKeys(WebCore::PlatformKeyboardEvent *this)
{
  return MEMORY[0x1E0DD2718](this);
}

uint64_t WebCore::RemoteCommandListener::setCreationFunction()
{
  return MEMORY[0x1E0DD2720]();
}

uint64_t WebCore::RemoteCommandListener::resetCreationFunction(WebCore::RemoteCommandListener *this)
{
  return MEMORY[0x1E0DD2728](this);
}

uint64_t WebCore::RemoteCommandListener::RemoteCommandListener()
{
  return MEMORY[0x1E0DD2730]();
}

void WebCore::RemoteCommandListener::~RemoteCommandListener(WebCore::RemoteCommandListener *this)
{
  MEMORY[0x1E0DD2738](this);
}

uint64_t WebCore::RenderLayerCompositor::layerTreeAsText()
{
  return MEMORY[0x1E0DD2740]();
}

uint64_t WebCore::SQLiteDatabaseTracker::setClient(WebCore::SQLiteDatabaseTracker *this, WebCore::SQLiteDatabaseTrackerClient *a2)
{
  return MEMORY[0x1E0DD2758](this, a2);
}

uint64_t WebCore::SerializedImageBuffer::sinkIntoImageBuffer()
{
  return MEMORY[0x1E0DD2768]();
}

uint64_t WebCore::SerializedScriptValue::deserialize(WebCore::SerializedScriptValue *this, const OpaqueJSContext *a2, const OpaqueJSValue **a3)
{
  return MEMORY[0x1E0DD2770](this, a2, a3);
}

uint64_t WebCore::SerializedScriptValue::create(WebCore::SerializedScriptValue *this, const OpaqueJSContext *a2, const OpaqueJSValue *a3, const OpaqueJSValue **a4)
{
  return MEMORY[0x1E0DD2778](this, a2, a3, a4);
}

uint64_t WebCore::SerializedScriptValue::create()
{
  return MEMORY[0x1E0DD2780]();
}

uint64_t WebCore::SerializedScriptValue::SerializedScriptValue()
{
  return MEMORY[0x1E0DD2788]();
}

{
  return MEMORY[0x1E0DD2790]();
}

void WebCore::SerializedScriptValue::~SerializedScriptValue(WebCore::SerializedScriptValue *this)
{
  MEMORY[0x1E0DD2798](this);
}

uint64_t WebCore::ServiceWorkerProvider::setSharedProvider()
{
  return MEMORY[0x1E0DD27A0]();
}

void WebCore::ServiceWorkerProvider::~ServiceWorkerProvider(WebCore::ServiceWorkerProvider *this)
{
  MEMORY[0x1E0DD27A8](this);
}

uint64_t WebCore::ShareableBitmapHandle::ShareableBitmapHandle()
{
  return MEMORY[0x1E0DD27B0]();
}

uint64_t WebCore::TextRecognitionResult::encodeVKCImageAnalysis()
{
  return MEMORY[0x1E0DD27B8]();
}

uint64_t WebCore::UserContentURLPattern::parse()
{
  return MEMORY[0x1E0DD2800]();
}

uint64_t WebCore::UserContentURLPattern::UserContentURLPattern()
{
  return MEMORY[0x1E0DD2808]();
}

uint64_t WebCore::VideoLayerManagerObjC::VideoLayerManagerObjC(WebCore::VideoLayerManagerObjC *this, const WTF::Logger *a2, const void *a3)
{
  return MEMORY[0x1E0DD2810](this, a2, a3);
}

uint64_t WebCore::ViewportConfiguration::setContentsSize(WebCore::ViewportConfiguration *this, const IntSize *a2)
{
  return MEMORY[0x1E0DD2818](this, a2);
}

uint64_t WebCore::ViewportConfiguration::setViewLayoutSize()
{
  return MEMORY[0x1E0DD2820]();
}

uint64_t WebCore::ViewportConfiguration::testingParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2828](this);
}

uint64_t WebCore::ViewportConfiguration::webpageParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2830](this);
}

uint64_t WebCore::ViewportConfiguration::setViewportArguments()
{
  return MEMORY[0x1E0DD2838]();
}

uint64_t WebCore::ViewportConfiguration::xhtmlMobileParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2840](this);
}

uint64_t WebCore::ViewportConfiguration::setDisabledAdaptations()
{
  return MEMORY[0x1E0DD2848]();
}

uint64_t WebCore::ViewportConfiguration::textDocumentParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2850](this);
}

uint64_t WebCore::ViewportConfiguration::imageDocumentParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2858](this);
}

uint64_t WebCore::ViewportConfiguration::nativeWebpageParameters(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2860](this);
}

uint64_t WebCore::ViewportConfiguration::setDefaultConfiguration(WebCore::ViewportConfiguration *this, const Parameters *a2)
{
  return MEMORY[0x1E0DD2868](this, a2);
}

uint64_t WebCore::ViewportConfiguration::setCanIgnoreScalingConstraints(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2870](this);
}

uint64_t WebCore::ViewportConfiguration::setIsKnownToLayOutWiderThanViewport(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2878](this);
}

uint64_t WebCore::ViewportConfiguration::setMinimumEffectiveDeviceWidthForShrinkToFit(WebCore::ViewportConfiguration *this, double a2)
{
  return MEMORY[0x1E0DD2880](this, a2);
}

uint64_t WebCore::ViewportConfiguration::setMinimumEffectiveDeviceWidthWhenIgnoringScalingConstraints(WebCore::ViewportConfiguration *this, double a2)
{
  return MEMORY[0x1E0DD2888](this, a2);
}

uint64_t WebCore::ViewportConfiguration::ViewportConfiguration(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD2890](this);
}

uint64_t WebCore::WheelEventDeltaFilter::create(WebCore::WheelEventDeltaFilter *this)
{
  return MEMORY[0x1E0DD2898](this);
}

uint64_t WebCore::WheelEventTestMonitor::deferForReason()
{
  return MEMORY[0x1E0DD28A0]();
}

uint64_t WebCore::WheelEventTestMonitor::removeDeferralForReason()
{
  return MEMORY[0x1E0DD28A8]();
}

uint64_t WebCore::WheelEventTestMonitor::receivedWheelEventWithPhases()
{
  return MEMORY[0x1E0DD28B0]();
}

uint64_t WebCore::WheelEventTestMonitor::setTestCallbackAndStartMonitoring()
{
  return MEMORY[0x1E0DD28B8]();
}

uint64_t WebCore::formatLocalizedString(WebCore *this, const __CFString *a2, ...)
{
  return MEMORY[0x1E0DD28C0](this, a2);
}

uint64_t WebCore::isIPAddressDisallowed(WebCore *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD28C8](this, a2);
}

uint64_t WebCore::isQuickLookPreviewURL(WebCore *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD28D0](this, a2);
}

uint64_t WebCore::mainThreadNormalWorld(WebCore *this)
{
  return MEMORY[0x1E0DD28D8](this);
}

uint64_t WebCore::mousePointerEventType(WebCore *this)
{
  return MEMORY[0x1E0DD28E0](this);
}

uint64_t WebCore::releaseGraphicsMemory()
{
  return MEMORY[0x1E0DD28E8]();
}

uint64_t WebCore::resolveCharacterRange()
{
  return MEMORY[0x1E0DD28F0]();
}

uint64_t WebCore::sendCOEPCORPViolation()
{
  return MEMORY[0x1E0DD28F8]();
}

uint64_t WebCore::setPlatformStrategies(WebCore *this, WebCore::PlatformStrategies *a2)
{
  return MEMORY[0x1E0DD2900](this, a2);
}

uint64_t WebCore::toCAValueFunctionType()
{
  return MEMORY[0x1E0DD2908]();
}

uint64_t WebCore::wordRangeFromPosition()
{
  return MEMORY[0x1E0DD2910]();
}

uint64_t WebCore::AcceleratedEffectStack::setEffects()
{
  return MEMORY[0x1E0DD2918]();
}

uint64_t WebCore::AcceleratedEffectStack::setBaseValues()
{
  return MEMORY[0x1E0DD2920]();
}

uint64_t WebCore::AcceleratedEffectStack::AcceleratedEffectStack(WebCore::AcceleratedEffectStack *this)
{
  return MEMORY[0x1E0DD2928](this);
}

uint64_t WebCore::AudioOutputUnitAdaptor::stop(WebCore::AudioOutputUnitAdaptor *this)
{
  return MEMORY[0x1E0DD2930](this);
}

uint64_t WebCore::AudioOutputUnitAdaptor::start(WebCore::AudioOutputUnitAdaptor *this)
{
  return MEMORY[0x1E0DD2938](this);
}

uint64_t WebCore::AudioOutputUnitAdaptor::configure(WebCore::AudioOutputUnitAdaptor *this, float a2)
{
  return MEMORY[0x1E0DD2940](this, a2);
}

uint64_t WebCore::AudioOutputUnitAdaptor::AudioOutputUnitAdaptor()
{
  return MEMORY[0x1E0DD2948]();
}

void WebCore::AudioOutputUnitAdaptor::~AudioOutputUnitAdaptor(WebCore::AudioOutputUnitAdaptor *this)
{
  MEMORY[0x1E0DD2950](this);
}

uint64_t WebCore::CSPViolationReportBody::create()
{
  return MEMORY[0x1E0DD2958]();
}

uint64_t WebCore::FontCustomPlatformData::tryMakeFromSerializationData()
{
  return MEMORY[0x1E0DD2970]();
}

void WebCore::FontCustomPlatformData::~FontCustomPlatformData(WebCore::FontCustomPlatformData *this)
{
  MEMORY[0x1E0DD2978](this);
}

uint64_t WebCore::FragmentedSharedBuffer::fromIPCData()
{
  return MEMORY[0x1E0DD2980]();
}

uint64_t WebCore::FragmentedSharedBuffer::append()
{
  return MEMORY[0x1E0DD2988]();
}

uint64_t WebCore::FragmentedSharedBuffer::create()
{
  return MEMORY[0x1E0DD2990]();
}

{
  return MEMORY[0x1E0DD2998]();
}

{
  return MEMORY[0x1E0DD29A0]();
}

uint64_t WebCore::FragmentedSharedBuffer::create(WebCore::FragmentedSharedBuffer *this, NSData *a2)
{
  return MEMORY[0x1E0DD29A8](this, a2);
}

uint64_t WebCore::FragmentedSharedBuffer::create(WebCore::FragmentedSharedBuffer *this, const __CFData *a2)
{
  return MEMORY[0x1E0DD29B0](this, a2);
}

uint64_t WebCore::FragmentedSharedBuffer::create(WebCore::FragmentedSharedBuffer *this)
{
  return MEMORY[0x1E0DD29B8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::beginQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD29C0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindBuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD29C8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendColor(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4, float a5)
{
  return MEMORY[0x1E0DD29D0](this, a2, a3, a4, a5);
}

uint64_t WebCore::GraphicsContextGLANGLE::bufferData()
{
  return MEMORY[0x1E0DD29D8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::bufferData(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD29E0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::clearColor(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4, float a5)
{
  return MEMORY[0x1E0DD29E8](this, a2, a3, a4, a5);
}

uint64_t WebCore::GraphicsContextGLANGLE::clearDepth(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD29F0](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteSync(WebCore::GraphicsContextGLANGLE *this, void *a2)
{
  return MEMORY[0x1E0DD29F8](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::depthRange(WebCore::GraphicsContextGLANGLE *this, float a2, float a3)
{
  return MEMORY[0x1E0DD2A00](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawArrays(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A08](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::enableiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getShaderi(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isQueryEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::readBuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A28](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::texImage2D()
{
  return MEMORY[0x1E0DD2A30]();
}

uint64_t WebCore::GraphicsContextGLANGLE::texImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, unsigned int a4, int a5, int a6, int a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return MEMORY[0x1E0DD2A38](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::texImage3D()
{
  return MEMORY[0x1E0DD2A40]();
}

uint64_t WebCore::GraphicsContextGLANGLE::texImage3D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int a9, unsigned int a10, uint64_t a11)
{
  return MEMORY[0x1E0DD2A48](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1fv()
{
  return MEMORY[0x1E0DD2A50]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1iv()
{
  return MEMORY[0x1E0DD2A58]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1ui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A60](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2fv()
{
  return MEMORY[0x1E0DD2A68]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2iv()
{
  return MEMORY[0x1E0DD2A70]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2ui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3fv()
{
  return MEMORY[0x1E0DD2A80]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3iv()
{
  return MEMORY[0x1E0DD2A88]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3ui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2A90](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4fv()
{
  return MEMORY[0x1E0DD2A98]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4iv()
{
  return MEMORY[0x1E0DD2AA0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4ui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AA8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::useProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AB0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindSampler(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AB8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindTexture(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AC0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AC8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AD0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::disableiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AD8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawBuffers()
{
  return MEMORY[0x1E0DD2AE0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::endQueryEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2AE8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getBooleanv()
{
  return MEMORY[0x1E0DD2AF0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getIntegerv()
{
  return MEMORY[0x1E0DD2AF8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getProgrami(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B00](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::linkProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B08](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::pixelStorei(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilFunc(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilMask(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1uiv()
{
  return MEMORY[0x1E0DD2B28]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2uiv()
{
  return MEMORY[0x1E0DD2B30]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3uiv()
{
  return MEMORY[0x1E0DD2B38]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4uiv()
{
  return MEMORY[0x1E0DD2B40]();
}

uint64_t WebCore::GraphicsContextGLANGLE::attachShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B48](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::clearStencil(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B50](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createBuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B58](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B60](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteBuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B68](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B70](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::detachShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawElements(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B80](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getInteger64(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B88](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getQueryiEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2B90](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformfv()
{
  return MEMORY[0x1E0DD2B98]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformiv()
{
  return MEMORY[0x1E0DD2BA0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::shaderSource(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD2BA8](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::texStorage2D(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BB0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::texStorage3D(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BB8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::activeTexture(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BC0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::beginQueryEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BC8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendEquation(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BD0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendFunciOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2BD8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bufferSubData()
{
  return MEMORY[0x1E0DD2BE0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::clearBufferfi(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD2BE8](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::clearBufferfv()
{
  return MEMORY[0x1E0DD2BF0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::clearBufferiv()
{
  return MEMORY[0x1E0DD2BF8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::colorMaskiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C00](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::compileShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C08](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createSampler(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createTexture(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C28](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteSampler(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C30](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteTexture(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C38](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getInteger64i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C40](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getIntegeri_v()
{
  return MEMORY[0x1E0DD2C48]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformuiv()
{
  return MEMORY[0x1E0DD2C50]();
}

uint64_t WebCore::GraphicsContextGLANGLE::isFramebuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C58](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isVertexArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C60](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::polygonOffset(WebCore::GraphicsContextGLANGLE *this, float a2, float a3)
{
  return MEMORY[0x1E0DD2C68](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::texParameterf(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD2C70](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::texParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2C78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::texSubImage2D()
{
  return MEMORY[0x1E0DD2C80]();
}

uint64_t WebCore::GraphicsContextGLANGLE::texSubImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return MEMORY[0x1E0DD2C88](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::texSubImage3D()
{
  return MEMORY[0x1E0DD2C90]();
}

uint64_t WebCore::GraphicsContextGLANGLE::texSubImage3D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, unsigned int a10, unsigned int a11, uint64_t a12)
{
  return MEMORY[0x1E0DD2C98](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindBufferBase(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CA0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::clearBufferuiv()
{
  return MEMORY[0x1E0DD2CA8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::clientWaitSync(WebCore::GraphicsContextGLANGLE *this, void *a2)
{
  return MEMORY[0x1E0DD2CB0](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::clipControlEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CB8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::copyTexImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, unsigned int a4, int a5, int a6, int a7, int a8, int a9)
{
  return MEMORY[0x1E0DD2CC0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createQueryEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CC8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteQueryEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CD0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::generateMipmap(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CD8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isRenderbuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2CE0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::sampleCoverage(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD2CE8](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib1f(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD2CF0](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib2f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3)
{
  return MEMORY[0x1E0DD2CF8](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib3f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4)
{
  return MEMORY[0x1E0DD2D00](this, a2, a3, a4);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib4f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4, float a5)
{
  return MEMORY[0x1E0DD2D08](this, a2, a3, a4, a5);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindBufferRange(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindFramebuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindVertexArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blitFramebuffer(WebCore::GraphicsContextGLANGLE *this, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, unsigned int a10, unsigned int a11)
{
  return MEMORY[0x1E0DD2D28](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getActiveAttrib()
{
  return MEMORY[0x1E0DD2D30]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getInteger64EXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D38](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getShaderSource(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D40](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::queryCounterEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D48](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::validateProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D50](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib1fv()
{
  return MEMORY[0x1E0DD2D58]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib2fv()
{
  return MEMORY[0x1E0DD2D60]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib3fv()
{
  return MEMORY[0x1E0DD2D68]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttrib4fv()
{
  return MEMORY[0x1E0DD2D70]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribI4i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindRenderbuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D80](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getActiveUniform()
{
  return MEMORY[0x1E0DD2D88]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getQueryObjectui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D90](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getShaderInfoLog(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2D98](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getTexParameterf(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DA0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getTexParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DA8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::polygonModeANGLE(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DB0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix2fv()
{
  return MEMORY[0x1E0DD2DB8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix3fv()
{
  return MEMORY[0x1E0DD2DC0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix4fv()
{
  return MEMORY[0x1E0DD2DC8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribI4iv()
{
  return MEMORY[0x1E0DD2DD0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribI4ui(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DD8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendEquationiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DE0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendFuncSeparate(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DE8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::copyBufferSubData(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2DF0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::copyTexSubImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  return MEMORY[0x1E0DD2DF8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::copyTexSubImage3D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, int a10)
{
  return MEMORY[0x1E0DD2E00](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createFramebuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E08](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createVertexArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteFramebuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteVertexArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawRangeElements(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E28](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getActiveUniforms()
{
  return MEMORY[0x1E0DD2E30]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getAttribLocation(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD2E38](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::getProgramInfoLog(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E40](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformIndices()
{
  return MEMORY[0x1E0DD2E48]();
}

uint64_t WebCore::GraphicsContextGLANGLE::samplerParameterf(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD2E50](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::samplerParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E58](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilOpSeparate(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E60](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribI4uiv()
{
  return MEMORY[0x1E0DD2E68]();
}

uint64_t WebCore::GraphicsContextGLANGLE::bindAttribLocation(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  return MEMORY[0x1E0DD2E70](this, a2, a3, a4);
}

uint64_t WebCore::GraphicsContextGLANGLE::createRenderbuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteExternalSync(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E80](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteRenderbuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E88](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getQueryObjectiEXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2E90](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformLocation(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD2E98](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix2x3fv()
{
  return MEMORY[0x1E0DD2EA0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix2x4fv()
{
  return MEMORY[0x1E0DD2EA8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix3x2fv()
{
  return MEMORY[0x1E0DD2EB0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix3x4fv()
{
  return MEMORY[0x1E0DD2EB8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix4x2fv()
{
  return MEMORY[0x1E0DD2EC0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformMatrix4x3fv()
{
  return MEMORY[0x1E0DD2EC8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::drawArraysInstanced(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2ED0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getBufferParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2ED8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getFragDataLocation(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD2EE0](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::getInternalformativ()
{
  return MEMORY[0x1E0DD2EE8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::isTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2EF0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::renderbufferStorage(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2EF8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilFuncSeparate(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F00](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilMaskSeparate(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F08](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniformBlockBinding(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F10](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribDivisor(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F18](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribPointer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F20](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexImage2D()
{
  return MEMORY[0x1E0DD2F28]();
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, unsigned int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  return MEMORY[0x1E0DD2F30](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexImage3D()
{
  return MEMORY[0x1E0DD2F38]();
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexImage3D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, unsigned int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10)
{
  return MEMORY[0x1E0DD2F40](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::endTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F48](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::framebufferTexture2D(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F50](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getSamplerParameterf(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F58](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getSamplerParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F60](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getUniformBlockIndex(WebCore::GraphicsContextGLANGLE *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD2F68](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawArraysANGLE()
{
  return MEMORY[0x1E0DD2F70]();
}

uint64_t WebCore::GraphicsContextGLANGLE::provokingVertexANGLE(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F78](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::readPixelsWithStatus()
{
  return MEMORY[0x1E0DD2F80]();
}

uint64_t WebCore::GraphicsContextGLANGLE::vertexAttribIPointer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F88](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::bindTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F90](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendEquationSeparate(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2F98](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendFuncSeparateiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FA0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawElementsInstanced(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FA8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getQueryObjectui64EXT(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FB0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getVertexAttribOffset(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FB8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::invalidateFramebuffer()
{
  return MEMORY[0x1E0DD2FC0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::polygonOffsetClampEXT(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4)
{
  return MEMORY[0x1E0DD2FC8](this, a2, a3, a4);
}

uint64_t WebCore::GraphicsContextGLANGLE::beginTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FD0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::checkFramebufferStatus(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FD8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawElementsANGLE()
{
  return MEMORY[0x1E0DD2FE0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::pauseTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD2FE8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::readPixelsBufferObject(WebCore::GraphicsContextGLANGLE *this, IntRect a2)
{
  return MEMORY[0x1E0DD2FF0](this, *(_QWORD *)&a2.m_location, *(_QWORD *)&a2.m_size);
}

uint64_t WebCore::GraphicsContextGLANGLE::releaseThreadResources()
{
  return MEMORY[0x1E0DD2FF8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexSubImage2D()
{
  return MEMORY[0x1E0DD3000]();
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexSubImage2D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, unsigned int a8, int a9, uint64_t a10)
{
  return MEMORY[0x1E0DD3008](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexSubImage3D()
{
  return MEMORY[0x1E0DD3010]();
}

uint64_t WebCore::GraphicsContextGLANGLE::compressedTexSubImage3D(WebCore::GraphicsContextGLANGLE *this, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, unsigned int a10, int a11, uint64_t a12)
{
  return MEMORY[0x1E0DD3018](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::createTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3020](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::deleteTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3028](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::enableVertexAttribArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3030](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::framebufferRenderbuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3038](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::framebufferTextureLayer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3040](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getActiveUniformBlockiv()
{
  return MEMORY[0x1E0DD3048]();
}

uint64_t WebCore::GraphicsContextGLANGLE::resumeTransformFeedback(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3050](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::disableVertexAttribArray(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3058](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getShaderPrecisionFormat()
{
  return MEMORY[0x1E0DD3060]();
}

uint64_t WebCore::GraphicsContextGLANGLE::invalidateSubFramebuffer()
{
  return MEMORY[0x1E0DD3068]();
}

uint64_t WebCore::GraphicsContextGLANGLE::blendEquationSeparateiOES(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3070](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getActiveUniformBlockName(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3078](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getRenderbufferParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3080](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::transformFeedbackVaryings()
{
  return MEMORY[0x1E0DD3088]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getBufferSubDataWithStatus()
{
  return MEMORY[0x1E0DD3090]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getTransformFeedbackVarying()
{
  return MEMORY[0x1E0DD3098]();
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawArraysInstancedANGLE()
{
  return MEMORY[0x1E0DD30A0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::renderbufferStorageMultisample(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30A8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawElementsInstancedANGLE()
{
  return MEMORY[0x1E0DD30B0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getFramebufferAttachmentParameteri(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30B8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::renderbufferStorageMultisampleANGLE(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30C0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::drawArraysInstancedBaseInstanceANGLE(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30C8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawArraysInstancedBaseInstanceANGLE()
{
  return MEMORY[0x1E0DD30D0]();
}

uint64_t WebCore::GraphicsContextGLANGLE::drawElementsInstancedBaseVertexBaseInstanceANGLE(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30D8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::hint(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30E0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::multiDrawElementsInstancedBaseVertexBaseInstanceANGLE()
{
  return MEMORY[0x1E0DD30E8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::clear(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30F0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::flush(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD30F8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::enable(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3100](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::finish(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3108](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isSync(WebCore::GraphicsContextGLANGLE *this, void *a2)
{
  return MEMORY[0x1E0DD3110](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::disable(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3118](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3120](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::reshape(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3128](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::scissor(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3130](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::addError()
{
  return MEMORY[0x1E0DD3138]();
}

uint64_t WebCore::GraphicsContextGLANGLE::cullFace(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3140](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::endQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3148](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getQuery(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3150](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getSynci(WebCore::GraphicsContextGLANGLE *this, void *a2)
{
  return MEMORY[0x1E0DD3158](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::isBuffer(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3160](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isShader(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3168](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::viewport(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3170](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::waitSync(WebCore::GraphicsContextGLANGLE *this, void *a2)
{
  return MEMORY[0x1E0DD3178](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::blendFunc(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3180](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::colorMask(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3188](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::depthFunc(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3190](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::depthMask(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3198](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::fenceSync(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31A0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::frontFace(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31A8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getErrors(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31B0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::getFloatv()
{
  return MEMORY[0x1E0DD31B8]();
}

uint64_t WebCore::GraphicsContextGLANGLE::getString(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31C0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isEnabled(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31C8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isProgram(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31D0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isSampler(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31D8](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::isTexture(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31E0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::lineWidth(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD31E8](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::stencilOp(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD31F0](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1f(WebCore::GraphicsContextGLANGLE *this, float a2)
{
  return MEMORY[0x1E0DD31F8](this, a2);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform1i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3200](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3)
{
  return MEMORY[0x1E0DD3208](this, a2, a3);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform2i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3210](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4)
{
  return MEMORY[0x1E0DD3218](this, a2, a3, a4);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform3i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3220](this);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4f(WebCore::GraphicsContextGLANGLE *this, float a2, float a3, float a4, float a5)
{
  return MEMORY[0x1E0DD3228](this, a2, a3, a4, a5);
}

uint64_t WebCore::GraphicsContextGLANGLE::uniform4i(WebCore::GraphicsContextGLANGLE *this)
{
  return MEMORY[0x1E0DD3230](this);
}

uint64_t WebCore::GraphicsContextGLCocoa::displayBufferSurface(WebCore::GraphicsContextGLCocoa *this)
{
  return MEMORY[0x1E0DD3238](this);
}

uint64_t WebCore::GraphicsContextGLCocoa::surfaceBufferToVideoFrame()
{
  return MEMORY[0x1E0DD3240]();
}

uint64_t WebCore::GraphicsContextGLCocoa::setDrawingBufferColorSpace(WebCore::GraphicsContextGLCocoa *this, const WebCore::DestinationColorSpace *a2)
{
  return MEMORY[0x1E0DD3248](this, a2);
}

uint64_t WebCore::GraphicsContextGLCocoa::externalImageTextureBindingPoint(WebCore::GraphicsContextGLCocoa *this)
{
  return MEMORY[0x1E0DD3250](this);
}

uint64_t WebCore::GraphicsContextGLCocoa::prepareForDisplayWithFinishedSignal()
{
  return MEMORY[0x1E0DD3258]();
}

uint64_t WebCore::GraphicsContextGLCocoa::asCV(WebCore::GraphicsContextGLCocoa *this)
{
  return MEMORY[0x1E0DD3260](this);
}

uint64_t WebCore::GraphicsContextGLCocoa::create()
{
  return MEMORY[0x1E0DD3268]();
}

uint64_t WebCore::HistoricalVelocityData::velocityForNewData()
{
  return MEMORY[0x1E0DD3290]();
}

uint64_t WebCore::ITUR_2020ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD3298](this);
}

uint64_t WebCore::ImageRotationSessionVT::rotate()
{
  return MEMORY[0x1E0DD32A0]();
}

void WebCore::LibWebRTCProviderCocoa::~LibWebRTCProviderCocoa(WebCore::LibWebRTCProviderCocoa *this)
{
  MEMORY[0x1E0DD32B0](this);
}

uint64_t WebCore::MediaSessionManageriOS::providePresentingApplicationPID(WebCore::MediaSessionManageriOS *this)
{
  return MEMORY[0x1E0DD32B8](this);
}

uint64_t WebCore::MutableStyleProperties::ensureCSSStyleDeclaration(WebCore::MutableStyleProperties *this)
{
  return MEMORY[0x1E0DD32C0](this);
}

void WebCore::MutableStyleProperties::~MutableStyleProperties(WebCore::MutableStyleProperties *this)
{
  MEMORY[0x1E0DD32C8](this);
}

uint64_t WebCore::NotificationController::supplementName(WebCore::NotificationController *this)
{
  return MEMORY[0x1E0DD32D8](this);
}

uint64_t WebCore::NullImageBufferBackend::create()
{
  return MEMORY[0x1E0DD32E0]();
}

void WebCore::NullImageBufferBackend::~NullImageBufferBackend(WebCore::NullImageBufferBackend *this)
{
  MEMORY[0x1E0DD32E8](this);
}

uint64_t WebCore::PixelBufferConformerCV::imageFrom32BGRAPixelBuffer()
{
  return MEMORY[0x1E0DD32F0]();
}

uint64_t WebCore::PixelBufferConformerCV::convert(WebCore::PixelBufferConformerCV *this, __CVBuffer *a2)
{
  return MEMORY[0x1E0DD32F8](this, a2);
}

uint64_t WebCore::PixelBufferConformerCV::PixelBufferConformerCV(WebCore::PixelBufferConformerCV *this, const __CFDictionary *a2)
{
  return MEMORY[0x1E0DD3300](this, a2);
}

uint64_t WebCore::ReferencePathOperation::create()
{
  return MEMORY[0x1E0DD3308]();
}

uint64_t WebCore::ResourceLoadStatistics::reduceTimeResolution()
{
  return MEMORY[0x1E0DD3310]();
}

uint64_t WebCore::SWRegistrationDatabase::importRegistrations(WebCore::SWRegistrationDatabase *this)
{
  return MEMORY[0x1E0DD3318](this);
}

uint64_t WebCore::SWRegistrationDatabase::updateRegistrations()
{
  return MEMORY[0x1E0DD3320]();
}

uint64_t WebCore::SWRegistrationDatabase::clearAllRegistrations(WebCore::SWRegistrationDatabase *this)
{
  return MEMORY[0x1E0DD3328](this);
}

uint64_t WebCore::SWRegistrationDatabase::SWRegistrationDatabase(WebCore::SWRegistrationDatabase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD3330](this, a2);
}

void WebCore::SWRegistrationDatabase::~SWRegistrationDatabase(WebCore::SWRegistrationDatabase *this)
{
  MEMORY[0x1E0DD3338](this);
}

uint64_t WebCore::ScriptExecutionContext::postTaskTo()
{
  return MEMORY[0x1E0DD3340]();
}

uint64_t WebCore::ScriptExecutionContext::setCrossOriginMode()
{
  return MEMORY[0x1E0DD3348]();
}

uint64_t WebCore::ScriptExecutionContext::ensureOnContextThread()
{
  return MEMORY[0x1E0DD3350]();
}

uint64_t WebCore::ScriptExecutionContext::addNotificationCallback()
{
  return MEMORY[0x1E0DD3358]();
}

uint64_t WebCore::ScriptExecutionContext::takeNotificationCallback()
{
  return MEMORY[0x1E0DD3360]();
}

uint64_t WebCore::SharedAudioDestination::create()
{
  return MEMORY[0x1E0DD3368]();
}

uint64_t WebCore::SkewTransformOperation::create()
{
  return MEMORY[0x1E0DD3370]();
}

uint64_t WebCore::StorageEventDispatcher::dispatchLocalStorageEvents()
{
  return MEMORY[0x1E0DD3378]();
}

uint64_t WebCore::StorageEventDispatcher::dispatchSessionStorageEvents()
{
  return MEMORY[0x1E0DD3380]();
}

uint64_t WebCore::buildAttestationObject()
{
  return MEMORY[0x1E0DD33B0]();
}

uint64_t WebCore::counterValueForElement()
{
  return MEMORY[0x1E0DD33B8]();
}

uint64_t WebCore::createBlackPixelBuffer(WebCore *this)
{
  return MEMORY[0x1E0DD33C0](this);
}

uint64_t WebCore::createFragmentFromText()
{
  return MEMORY[0x1E0DD33C8]();
}

uint64_t WebCore::displayP3ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD33D0](this);
}

uint64_t WebCore::externalRepresentation()
{
  return MEMORY[0x1E0DD33D8]();
}

uint64_t WebCore::makeRangeSelectingNode(WebCore *this, Node *a2)
{
  return MEMORY[0x1E0DD33E0](this, a2);
}

uint64_t WebCore::matchesWildcardPattern(WebCore *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD33E8](this, a2, a3);
}

uint64_t WebCore::multipleFileUploadText(WebCore *this)
{
  return MEMORY[0x1E0DD33F0](this);
}

uint64_t WebCore::setContentSizeCategory(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD33F8](this, a2);
}

uint64_t WebCore::startOfEditableContent()
{
  return MEMORY[0x1E0DD3400]();
}

uint64_t WebCore::validateHEVCParameters()
{
  return MEMORY[0x1E0DD3408]();
}

uint64_t WebCore::ApplicationCacheStorage::deleteAllCaches(WebCore::ApplicationCacheStorage *this)
{
  return MEMORY[0x1E0DD3410](this);
}

uint64_t WebCore::ApplicationCacheStorage::ApplicationCacheStorage(WebCore::ApplicationCacheStorage *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD3418](this, a2, a3);
}

uint64_t WebCore::AuthenticationChallenge::AuthenticationChallenge(WebCore::AuthenticationChallenge *this, NSURLAuthenticationChallenge *a2)
{
  return MEMORY[0x1E0DD3420](this, a2);
}

uint64_t WebCore::AuthenticationChallenge::AuthenticationChallenge(WebCore::AuthenticationChallenge *this, const WebCore::ProtectionSpace *a2, const WebCore::Credential *a3, uint64_t a4, const WebCore::ResourceResponse *a5, const WebCore::ResourceError *a6)
{
  return MEMORY[0x1E0DD3428](this, a2, a3, a4, a5, a6);
}

uint64_t WebCore::CORPViolationReportBody::create()
{
  return MEMORY[0x1E0DD3430]();
}

void WebCore::DetachedOffscreenCanvas::~DetachedOffscreenCanvas(WebCore::DetachedOffscreenCanvas *this)
{
  MEMORY[0x1E0DD3438](this);
}

uint64_t WebCore::FragmentDirectiveParser::FragmentDirectiveParser()
{
  return MEMORY[0x1E0DD3440]();
}

uint64_t WebCore::GeolocationPositionData::GeolocationPositionData(WebCore::GeolocationPositionData *this, CLLocation *a2)
{
  return MEMORY[0x1E0DD3448](this, a2);
}

uint64_t WebCore::MediaPlaybackTargetMock::create()
{
  return MEMORY[0x1E0DD3470]();
}

uint64_t WebCore::MediaStreamTrackPrivate::source(WebCore::MediaStreamTrackPrivate *this)
{
  return MEMORY[0x1E0DD3478](this);
}

void WebCore::MediaStreamTrackPrivate::~MediaStreamTrackPrivate(WebCore::MediaStreamTrackPrivate *this)
{
  MEMORY[0x1E0DD3480](this);
}

uint64_t WebCore::PrivateClickMeasurement::setSourceSecretToken()
{
  return MEMORY[0x1E0DD3488]();
}

uint64_t WebCore::PrivateClickMeasurement::parseAttributionRequest(WebCore::PrivateClickMeasurement *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD3490](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::setEphemeralSourceNonce()
{
  return MEMORY[0x1E0DD3498]();
}

uint64_t WebCore::PrivateClickMeasurement::hasPreviouslyBeenReported(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD34A0](this);
}

uint64_t WebCore::PrivateClickMeasurement::setDestinationSecretToken()
{
  return MEMORY[0x1E0DD34A8]();
}

uint64_t WebCore::PrivateClickMeasurement::attributeAndGetEarliestTimeToSend()
{
  return MEMORY[0x1E0DD34B0]();
}

uint64_t WebCore::PrivateClickMeasurement::calculateAndUpdateSourceSecretToken(WebCore::PrivateClickMeasurement *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD34B8](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::setSourceApplicationBundleIDForTesting(WebCore::PrivateClickMeasurement *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD34C0](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::calculateAndUpdateSourceUnlinkableToken(WebCore::PrivateClickMeasurement *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD34C8](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::calculateAndUpdateDestinationSecretToken()
{
  return MEMORY[0x1E0DD34D0]();
}

uint64_t WebCore::PrivateClickMeasurement::calculateAndUpdateDestinationUnlinkableToken(WebCore::PrivateClickMeasurement *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD34D8](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::isNeitherSameSiteNorCrossSiteTriggeringEvent()
{
  return MEMORY[0x1E0DD34E0]();
}

uint64_t WebCore::PrivateClickMeasurement::maxAge(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD34E8](this);
}

uint64_t WebCore::ScaleTransformOperation::create()
{
  return MEMORY[0x1E0DD34F0]();
}

uint64_t WebCore::ScrollingStateFixedNode::ScrollingStateFixedNode()
{
  return MEMORY[0x1E0DD34F8]();
}

uint64_t WebCore::ServiceWorkerClientData::from()
{
  return MEMORY[0x1E0DD3500]();
}

uint64_t WebCore::ShareableResourceHandle::ShareableResourceHandle()
{
  return MEMORY[0x1E0DD3508]();
}

uint64_t WebCore::SharedWorkerThreadProxy::hasInstances(WebCore::SharedWorkerThreadProxy *this)
{
  return MEMORY[0x1E0DD3510](this);
}

uint64_t WebCore::SharedWorkerThreadProxy::SharedWorkerThreadProxy()
{
  return MEMORY[0x1E0DD3518]();
}

void WebCore::SharedWorkerThreadProxy::~SharedWorkerThreadProxy(WebCore::SharedWorkerThreadProxy *this)
{
  MEMORY[0x1E0DD3520](this);
}

uint64_t WebCore::SpeechRecognitionUpdate::createError()
{
  return MEMORY[0x1E0DD3528]();
}

uint64_t WebCore::SpeechRecognitionUpdate::create()
{
  return MEMORY[0x1E0DD3530]();
}

uint64_t WebCore::SpeechRecognitionUpdate::SpeechRecognitionUpdate()
{
  return MEMORY[0x1E0DD3538]();
}

uint64_t WebCore::VideoFullscreenCaptions::setCaptionsFrame(WebCore::VideoFullscreenCaptions *this, const CGRect *a2)
{
  return MEMORY[0x1E0DD3540](this, a2);
}

uint64_t WebCore::VideoFullscreenCaptions::removeCaptionsLayer(WebCore::VideoFullscreenCaptions *this)
{
  return MEMORY[0x1E0DD3548](this);
}

uint64_t WebCore::VideoFullscreenCaptions::setTrackRepresentationImage()
{
  return MEMORY[0x1E0DD3550]();
}

uint64_t WebCore::VideoFullscreenCaptions::setTrackRepresentationHidden(WebCore::VideoFullscreenCaptions *this)
{
  return MEMORY[0x1E0DD3558](this);
}

uint64_t WebCore::VideoFullscreenCaptions::setTrackRepresentationContentsScale(WebCore::VideoFullscreenCaptions *this, float a2)
{
  return MEMORY[0x1E0DD3560](this, a2);
}

uint64_t WebCore::atBoundaryOfGranularity()
{
  return MEMORY[0x1E0DD3568]();
}

uint64_t WebCore::badResponseHeadersError(WebCore *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD3570](this, a2);
}

uint64_t WebCore::buildClientDataJsonHash(WebCore *this, const JSC::ArrayBuffer *a2)
{
  return MEMORY[0x1E0DD3578](this, a2);
}

uint64_t WebCore::collectScreenProperties(WebCore *this)
{
  return MEMORY[0x1E0DD3580](this);
}

uint64_t WebCore::computeSharedStringHash(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD3590](this, a2);
}

uint64_t WebCore::linearSRGBColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD35A0](this);
}

uint64_t WebCore::parseAVCCodecParameters()
{
  return MEMORY[0x1E0DD35A8]();
}

uint64_t WebCore::provideMediaKeySystemTo()
{
  return MEMORY[0x1E0DD35B0]();
}

uint64_t WebCore::readSerializedCryptoKey()
{
  return MEMORY[0x1E0DD35B8]();
}

uint64_t WebCore::setAuxiliaryProcessType()
{
  return MEMORY[0x1E0DD35C0]();
}

uint64_t WebCore::setLocalizedDeviceModel(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD35C8](this, a2);
}

uint64_t WebCore::toCAMediaTimingFunction()
{
  return MEMORY[0x1E0DD35D0]();
}

uint64_t WebCore::wrapSerializedCryptoKey()
{
  return MEMORY[0x1E0DD35D8]();
}

uint64_t WebCore::CAAudioStreamDescription::streamDescription(WebCore::CAAudioStreamDescription *this)
{
  return MEMORY[0x1E0DD35E0](this);
}

{
  return MEMORY[0x1E0DD8468](this);
}

uint64_t WebCore::CAAudioStreamDescription::CAAudioStreamDescription(WebCore::CAAudioStreamDescription *this, const AudioStreamBasicDescription *a2)
{
  return MEMORY[0x1E0DD35E8](this, a2);
}

void WebCore::CAAudioStreamDescription::~CAAudioStreamDescription(WebCore::CAAudioStreamDescription *this)
{
  MEMORY[0x1E0DD35F0](this);
}

uint64_t WebCore::CachedResourceHandleBase::CachedResourceHandleBase(WebCore::CachedResourceHandleBase *this, WebCore::CachedResource *a2)
{
  return MEMORY[0x1E0DD35F8](this, a2);
}

uint64_t WebCore::CachedResourceHandleBase::CachedResourceHandleBase(WebCore::CachedResourceHandleBase *this, const WebCore::CachedResourceHandleBase *a2)
{
  return MEMORY[0x1E0DD3600](this, a2);
}

void WebCore::CachedResourceHandleBase::~CachedResourceHandleBase(WebCore::CachedResourceHandleBase *this)
{
  MEMORY[0x1E0DD3608](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setOpusDecoderEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3610](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setAVFoundationEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3618](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setVorbisDecoderEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3630](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setMockScrollbarsEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3638](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setTrackingPreventionEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3640](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setMediaSourceInlinePaintingEnabled(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3658](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::setShouldManageAudioSessionCategory(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3660](this);
}

uint64_t WebCore::DeprecatedGlobalSettings::shared(WebCore::DeprecatedGlobalSettings *this)
{
  return MEMORY[0x1E0DD3668](this);
}

uint64_t WebCore::DocumentMarkerController::hasMarkers()
{
  return MEMORY[0x1E0DD3670]();
}

uint64_t WebCore::DocumentMarkerController::filterMarkers()
{
  return MEMORY[0x1E0DD3678]();
}

uint64_t WebCore::DocumentMarkerController::removeMarkers()
{
  return MEMORY[0x1E0DD3680]();
}

{
  return MEMORY[0x1E0DD3688]();
}

{
  return MEMORY[0x1E0DD3690]();
}

uint64_t WebCore::DocumentMarkerController::markersInRange()
{
  return MEMORY[0x1E0DD3698]();
}

uint64_t WebCore::DocumentMarkerController::rangesForMarkersInRange()
{
  return MEMORY[0x1E0DD36A0]();
}

uint64_t WebCore::DocumentMarkerController::renderedRectsForMarkers()
{
  return MEMORY[0x1E0DD36A8]();
}

uint64_t WebCore::DocumentMarkerController::addTransparentContentMarker()
{
  return MEMORY[0x1E0DD36B0]();
}

uint64_t WebCore::DocumentMarkerController::addMarker()
{
  return MEMORY[0x1E0DD36B8]();
}

uint64_t WebCore::DocumentParserYieldToken::DocumentParserYieldToken(WebCore::DocumentParserYieldToken *this, Document *a2)
{
  return MEMORY[0x1E0DD36C0](this, a2);
}

void WebCore::DocumentParserYieldToken::~DocumentParserYieldToken(WebCore::DocumentParserYieldToken *this)
{
  MEMORY[0x1E0DD36C8](this);
}

uint64_t WebCore::FloatingPointEnvironment::enableDenormalSupport(WebCore::FloatingPointEnvironment *this)
{
  return MEMORY[0x1E0DD36E0](this);
}

uint64_t WebCore::FloatingPointEnvironment::saveMainThreadEnvironment(WebCore::FloatingPointEnvironment *this)
{
  return MEMORY[0x1E0DD36E8](this);
}

uint64_t WebCore::FloatingPointEnvironment::singleton(WebCore::FloatingPointEnvironment *this)
{
  return MEMORY[0x1E0DD36F0](this);
}

uint64_t WebCore::LocalCurrentContextSaver::LocalCurrentContextSaver(WebCore::LocalCurrentContextSaver *this, CGContext *a2)
{
  return MEMORY[0x1E0DD3700](this, a2);
}

void WebCore::LocalCurrentContextSaver::~LocalCurrentContextSaver(WebCore::LocalCurrentContextSaver *this)
{
  MEMORY[0x1E0DD3708](this);
}

uint64_t WebCore::MatrixTransformOperation::create(WebCore::MatrixTransformOperation *this, const WebCore::TransformationMatrix *a2)
{
  return MEMORY[0x1E0DD3710](this, a2);
}

uint64_t WebCore::MediaPlaybackTargetCocoa::create()
{
  return MEMORY[0x1E0DD3718]();
}

uint64_t WebCore::MediaSessionManagerCocoa::setSampleBufferContentKeySessionSupportEnabled(WebCore::MediaSessionManagerCocoa *this)
{
  return MEMORY[0x1E0DD3720](this);
}

uint64_t WebCore::MockContentFilterManager::setClient()
{
  return MEMORY[0x1E0DD3728]();
}

uint64_t WebCore::MockContentFilterManager::singleton(WebCore::MockContentFilterManager *this)
{
  return MEMORY[0x1E0DD3730](this);
}

uint64_t WebCore::PerformanceLoggingClient::synchronousScrollingReasonsAsString()
{
  return MEMORY[0x1E0DD3738]();
}

uint64_t WebCore::PointerCaptureController::cancelPointer(WebCore::PointerCaptureController *this, uint64_t a2, const IntPoint *a3)
{
  return MEMORY[0x1E0DD3740](this, a2, a3);
}

uint64_t WebCore::PointerCaptureController::touchWithIdentifierWasRemoved(WebCore::PointerCaptureController *this)
{
  return MEMORY[0x1E0DD3748](this);
}

uint64_t WebCore::RemoteMediaPlayerSupport::setRegisterRemotePlayerCallback()
{
  return MEMORY[0x1E0DD3750]();
}

uint64_t WebCore::RotateTransformOperation::create()
{
  return MEMORY[0x1E0DD3758]();
}

uint64_t WebCore::SampleBufferDisplayLayer::setCreator()
{
  return MEMORY[0x1E0DD3760]();
}

uint64_t WebCore::ScreenOrientationManager::ScreenOrientationManager(WebCore::ScreenOrientationManager *this)
{
  return MEMORY[0x1E0DD3768](this);
}

void WebCore::ScreenOrientationManager::~ScreenOrientationManager(WebCore::ScreenOrientationManager *this)
{
  MEMORY[0x1E0DD3770](this);
}

uint64_t WebCore::ScrollingStateStickyNode::ScrollingStateStickyNode()
{
  return MEMORY[0x1E0DD3778]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::startFetch()
{
  return MEMORY[0x1E0DD3780]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::cancelFetch()
{
  return MEMORY[0x1E0DD3788]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::createBlobLoader()
{
  return MEMORY[0x1E0DD3790]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::fireInstallEvent(WebCore::ServiceWorkerThreadProxy *this)
{
  return MEMORY[0x1E0DD3798](this);
}

uint64_t WebCore::ServiceWorkerThreadProxy::fireMessageEvent()
{
  return MEMORY[0x1E0DD37A0]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::fireActivateEvent(WebCore::ServiceWorkerThreadProxy *this)
{
  return MEMORY[0x1E0DD37A8](this);
}

uint64_t WebCore::ServiceWorkerThreadProxy::didSaveScriptsToDisk()
{
  return MEMORY[0x1E0DD37B0]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::navigationPreloadFailed()
{
  return MEMORY[0x1E0DD37B8]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::navigationPreloadIsReady()
{
  return MEMORY[0x1E0DD37C0]();
}

uint64_t WebCore::ServiceWorkerThreadProxy::setLastNavigationWasAppInitiated(WebCore::ServiceWorkerThreadProxy *this)
{
  return MEMORY[0x1E0DD37C8](this);
}

uint64_t WebCore::ServiceWorkerThreadProxy::ServiceWorkerThreadProxy()
{
  return MEMORY[0x1E0DD37D0]();
}

void WebCore::ServiceWorkerThreadProxy::~ServiceWorkerThreadProxy(WebCore::ServiceWorkerThreadProxy *this)
{
  MEMORY[0x1E0DD37D8](this);
}

uint64_t WebCore::SpeechRecognitionRequest::SpeechRecognitionRequest()
{
  return MEMORY[0x1E0DD37E0]();
}

uint64_t WebCore::StorageNamespaceProvider::StorageNamespaceProvider(WebCore::StorageNamespaceProvider *this)
{
  return MEMORY[0x1E0DD37F0](this);
}

void WebCore::StorageNamespaceProvider::~StorageNamespaceProvider(WebCore::StorageNamespaceProvider *this)
{
  MEMORY[0x1E0DD37F8](this);
}

uint64_t WebCore::TemporarySelectionChange::invalidate(WebCore::TemporarySelectionChange *this)
{
  return MEMORY[0x1E0DD3800](this);
}

uint64_t WebCore::TemporarySelectionChange::TemporarySelectionChange()
{
  return MEMORY[0x1E0DD3808]();
}

void WebCore::TemporarySelectionChange::~TemporarySelectionChange(WebCore::TemporarySelectionChange *this)
{
  MEMORY[0x1E0DD3810](this);
}

uint64_t WebCore::TextAlternativeWithRange::TextAlternativeWithRange()
{
  return MEMORY[0x1E0DD3818]();
}

uint64_t WebCore::charactersAroundPosition()
{
  return MEMORY[0x1E0DD3820]();
}

uint64_t WebCore::createFragmentFromMarkup()
{
  return MEMORY[0x1E0DD3828]();
}

uint64_t WebCore::distanceBetweenPositions()
{
  return MEMORY[0x1E0DD3830]();
}

uint64_t WebCore::enclosingTextFormControl()
{
  return MEMORY[0x1E0DD3838]();
}

uint64_t WebCore::keyIdentifierForKeyEvent(WebCore *this, WebEvent *a2)
{
  return MEMORY[0x1E0DD3840](this, a2);
}

uint64_t WebCore::makeVisiblePositionRange()
{
  return MEMORY[0x1E0DD3848]();
}

uint64_t WebCore::parseClearSiteDataHeader(WebCore *this, const WebCore::ResourceResponse *a2)
{
  return MEMORY[0x1E0DD3850](this, a2);
}

uint64_t WebCore::parseHEVCCodecParameters()
{
  return MEMORY[0x1E0DD3858]();
}

uint64_t WebCore::parseXFrameOptionsHeader()
{
  return MEMORY[0x1E0DD3860]();
}

uint64_t WebCore::passesAccessControlCheck()
{
  return MEMORY[0x1E0DD3868]();
}

uint64_t WebCore::presentingApplicationPID(WebCore *this)
{
  return MEMORY[0x1E0DD3870](this);
}

uint64_t WebCore::registerWebKitVP8Decoder(WebCore *this)
{
  return MEMORY[0x1E0DD3878](this);
}

uint64_t WebCore::registerWebKitVP9Decoder(WebCore *this)
{
  return MEMORY[0x1E0DD3880](this);
}

uint64_t WebCore::saveRecentSearchesToFile()
{
  return MEMORY[0x1E0DD3888]();
}

uint64_t WebCore::supportsPictureInPicture(WebCore *this)
{
  return MEMORY[0x1E0DD3890](this);
}

uint64_t WebCore::ApplicationManifestParser::parseWithValidation(WebCore::ApplicationManifestParser *this, const WTF::String *a2, const WTF::URL *a3, const WTF::URL *a4)
{
  return MEMORY[0x1E0DD3898](this, a2, a3, a4);
}

uint64_t WebCore::ApplicationManifestParser::parse(WebCore::ApplicationManifestParser *this, const WTF::String *a2, const WTF::URL *a3, const WTF::URL *a4)
{
  return MEMORY[0x1E0DD38A0](this, a2, a3, a4);
}

uint64_t WebCore::AsyncScrollingCoordinator::willCommitTree()
{
  return MEMORY[0x1E0DD38A8]();
}

uint64_t WebCore::AsyncScrollingCoordinator::applyScrollUpdate()
{
  return MEMORY[0x1E0DD38B0]();
}

uint64_t WebCore::AsyncScrollingCoordinator::setActiveScrollSnapIndices()
{
  return MEMORY[0x1E0DD38B8]();
}

uint64_t WebCore::AsyncScrollingCoordinator::ensureScrollingStateTreeForRootFrameID()
{
  return MEMORY[0x1E0DD38C0]();
}

uint64_t WebCore::AsyncScrollingCoordinator::AsyncScrollingCoordinator()
{
  return MEMORY[0x1E0DD38C8]();
}

void WebCore::AsyncScrollingCoordinator::~AsyncScrollingCoordinator(WebCore::AsyncScrollingCoordinator *this)
{
  MEMORY[0x1E0DD38D0](this);
}

uint64_t WebCore::AudioDestinationResampler::pullRendered(WebCore::AudioDestinationResampler *this)
{
  return MEMORY[0x1E0DD38D8](this);
}

uint64_t WebCore::AudioDestinationResampler::setIsPlaying(WebCore::AudioDestinationResampler *this)
{
  return MEMORY[0x1E0DD38E0](this);
}

uint64_t WebCore::AudioDestinationResampler::render()
{
  return MEMORY[0x1E0DD38E8]();
}

uint64_t WebCore::AudioDestinationResampler::AudioDestinationResampler()
{
  return MEMORY[0x1E0DD38F0]();
}

void WebCore::AudioDestinationResampler::~AudioDestinationResampler(WebCore::AudioDestinationResampler *this)
{
  MEMORY[0x1E0DD38F8](this);
}

uint64_t WebCore::EmptyOriginAccessPatterns::singleton(WebCore::EmptyOriginAccessPatterns *this)
{
  return MEMORY[0x1E0DD3900](this);
}

uint64_t WebCore::KeyboardScrollingAnimator::stopScrollingImmediately(WebCore::KeyboardScrollingAnimator *this)
{
  return MEMORY[0x1E0DD3910](this);
}

uint64_t WebCore::MockContentFilterSettings::singleton(WebCore::MockContentFilterSettings *this)
{
  return MEMORY[0x1E0DD3918](this);
}

uint64_t WebCore::PlatformSpeechSynthesizer::create()
{
  return MEMORY[0x1E0DD3920]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::getCapabilities()
{
  return MEMORY[0x1E0DD3928]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::audioCaptureFactory(WebCore::RealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD3930](this);
}

uint64_t WebCore::RealtimeMediaSourceCenter::videoCaptureFactory(WebCore::RealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD3938](this);
}

uint64_t WebCore::RealtimeMediaSourceCenter::displayCaptureFactory(WebCore::RealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD3940](this);
}

uint64_t WebCore::RealtimeMediaSourceCenter::getMediaStreamDevices()
{
  return MEMORY[0x1E0DD3948]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::setAudioCaptureFactory()
{
  return MEMORY[0x1E0DD3950]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::setVideoCaptureFactory()
{
  return MEMORY[0x1E0DD3958]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::setDisplayCaptureFactory()
{
  return MEMORY[0x1E0DD3960]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::unsetAudioCaptureFactory()
{
  return MEMORY[0x1E0DD3968]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::unsetVideoCaptureFactory()
{
  return MEMORY[0x1E0DD3970]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::addDevicesChangedObserver()
{
  return MEMORY[0x1E0DD3978]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::setCurrentMediaEnvironment()
{
  return MEMORY[0x1E0DD3980]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::unsetDisplayCaptureFactory()
{
  return MEMORY[0x1E0DD3988]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::validateRequestConstraints()
{
  return MEMORY[0x1E0DD3990]();
}

uint64_t WebCore::RealtimeMediaSourceCenter::shouldInterruptAudioOnPageVisibilityChange(WebCore::RealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD3998](this);
}

uint64_t WebCore::RealtimeMediaSourceCenter::singleton(WebCore::RealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD39A0](this);
}

uint64_t WebCore::SerializedPlatformDataCue::create()
{
  return MEMORY[0x1E0DD39B0]();
}

uint64_t WebCore::WebSocketChannelInspector::WebSocketChannelInspector(WebCore::WebSocketChannelInspector *this, Document *a2)
{
  return MEMORY[0x1E0DD39B8](this, a2);
}

void WebCore::WebSocketChannelInspector::~WebSocketChannelInspector(WebCore::WebSocketChannelInspector *this)
{
  MEMORY[0x1E0DD39C0](this);
}

uint64_t WebCore::addPolicyContainerHeaders()
{
  return MEMORY[0x1E0DD39C8]();
}

uint64_t WebCore::adjustMIMETypeIfNecessary()
{
  return MEMORY[0x1E0DD39D0]();
}

uint64_t WebCore::adobeRGB1998ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD39D8](this);
}

uint64_t WebCore::buildCredentialDescriptor()
{
  return MEMORY[0x1E0DD39E0]();
}

uint64_t WebCore::colorSpaceForCGColorSpace(WebCore *this, CGColorSpace *a2)
{
  return MEMORY[0x1E0DD39E8](this, a2);
}

uint64_t WebCore::defaultWebCryptoMasterKey(WebCore *this)
{
  return MEMORY[0x1E0DD39F0](this);
}

uint64_t WebCore::encloseRectToDevicePixels(WebCore *this, const FloatRect *a2, float a3)
{
  return MEMORY[0x1E0DD39F8](this, a2, a3);
}

uint64_t WebCore::extendedSRGBColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD3A08](this);
}

uint64_t WebCore::fileButtonChooseFileLabel(WebCore *this)
{
  return MEMORY[0x1E0DD3A10](this);
}

uint64_t WebCore::genericTouchIDPromptTitle(WebCore *this)
{
  return MEMORY[0x1E0DD3A18](this);
}

uint64_t WebCore::getOutOfLineCachedWrapper()
{
  return MEMORY[0x1E0DD3A20]();
}

uint64_t WebCore::roundAndClampToSRGBALossy(WebCore *this, CGColor *a2)
{
  return MEMORY[0x1E0DD3A30](this, a2);
}

uint64_t WebCore::validatePreflightResponse()
{
  return MEMORY[0x1E0DD3A38]();
}

uint64_t WebCore::windowsKeyCodeForKeyEvent(WebCore *this, WebEvent *a2)
{
  return MEMORY[0x1E0DD3A40](this, a2);
}

uint64_t WebCore::AudioSourceProviderAVFObjC::setAudioCallback()
{
  return MEMORY[0x1E0DD3A48]();
}

uint64_t WebCore::AudioSourceProviderAVFObjC::setConfigureAudioStorageCallback()
{
  return MEMORY[0x1E0DD3A50]();
}

uint64_t WebCore::BasicShapeCenterCoordinate::updateComputedLength(WebCore::BasicShapeCenterCoordinate *this)
{
  return MEMORY[0x1E0DD3A58](this);
}

uint64_t WebCore::ContextDestructionObserver::contextDestroyed(WebCore::ContextDestructionObserver *this)
{
  return MEMORY[0x1E0DD3A60](this);
}

uint64_t WebCore::ElementTargetingController::findTargets()
{
  return MEMORY[0x1E0DD3A70]();
}

uint64_t WebCore::ElementTargetingController::adjustVisibility()
{
  return MEMORY[0x1E0DD3A78]();
}

uint64_t WebCore::ElementTargetingController::resetVisibilityAdjustments()
{
  return MEMORY[0x1E0DD3A80]();
}

uint64_t WebCore::ElementTargetingController::numberOfVisibilityAdjustmentRects(WebCore::ElementTargetingController *this)
{
  return MEMORY[0x1E0DD3A88](this);
}

uint64_t WebCore::ElementTargetingController::snapshotIgnoringVisibilityAdjustment()
{
  return MEMORY[0x1E0DD3A90]();
}

uint64_t WebCore::HTMLTextFormControlElement::setCanShowPlaceholder(WebCore::HTMLTextFormControlElement *this)
{
  return MEMORY[0x1E0DD3AC8](this);
}

uint64_t WebCore::IdentityTransformOperation::create(WebCore::IdentityTransformOperation *this)
{
  return MEMORY[0x1E0DD3AE0](this);
}

uint64_t WebCore::Matrix3DTransformOperation::create(WebCore::Matrix3DTransformOperation *this, const WebCore::TransformationMatrix *a2)
{
  return MEMORY[0x1E0DD3AE8](this, a2);
}

uint64_t WebCore::MediaRecorderPrivateWriter::stopRecording(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD3AF0](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::appendVideoFrame(WebCore::MediaRecorderPrivateWriter *this, WebCore::VideoFrame *a2)
{
  return MEMORY[0x1E0DD3AF8](this, a2);
}

uint64_t WebCore::MediaRecorderPrivateWriter::appendAudioSampleBuffer()
{
  return MEMORY[0x1E0DD3B00]();
}

uint64_t WebCore::MediaRecorderPrivateWriter::close(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD3B08](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::pause(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD3B10](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::create()
{
  return MEMORY[0x1E0DD3B18]();
}

uint64_t WebCore::MediaRecorderPrivateWriter::resume(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD3B20](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::fetchData()
{
  return MEMORY[0x1E0DD3B28]();
}

void WebCore::MediaRecorderPrivateWriter::~MediaRecorderPrivateWriter(WebCore::MediaRecorderPrivateWriter *this)
{
  MEMORY[0x1E0DD3B30](this);
}

void WebCore::MediaStreamTrackDataHolder::~MediaStreamTrackDataHolder(WebCore::MediaStreamTrackDataHolder *this)
{
  MEMORY[0x1E0DD3B38](this);
}

uint64_t WebCore::MessagePortChannelProvider::setSharedProvider()
{
  return MEMORY[0x1E0DD3B40]();
}

uint64_t WebCore::MessagePortChannelRegistry::didCloseMessagePort()
{
  return MEMORY[0x1E0DD3B48]();
}

uint64_t WebCore::MessagePortChannelRegistry::didPostMessageToRemote()
{
  return MEMORY[0x1E0DD3B50]();
}

uint64_t WebCore::MessagePortChannelRegistry::takeAllMessagesForPort()
{
  return MEMORY[0x1E0DD3B58]();
}

uint64_t WebCore::MessagePortChannelRegistry::didEntangleLocalToRemote()
{
  return MEMORY[0x1E0DD3B60]();
}

uint64_t WebCore::MessagePortChannelRegistry::didDisentangleMessagePort()
{
  return MEMORY[0x1E0DD3B68]();
}

uint64_t WebCore::MessagePortChannelRegistry::didCreateMessagePortChannel()
{
  return MEMORY[0x1E0DD3B70]();
}

uint64_t WebCore::MessagePortChannelRegistry::existingChannelContainingPort()
{
  return MEMORY[0x1E0DD3B78]();
}

uint64_t WebCore::MessagePortChannelRegistry::MessagePortChannelRegistry(WebCore::MessagePortChannelRegistry *this)
{
  return MEMORY[0x1E0DD3B80](this);
}

void WebCore::MessagePortChannelRegistry::~MessagePortChannelRegistry(WebCore::MessagePortChannelRegistry *this)
{
  MEMORY[0x1E0DD3B88](this);
}

uint64_t WebCore::NetscapePlugInStreamLoader::create()
{
  return MEMORY[0x1E0DD3B90]();
}

uint64_t WebCore::RTCDataChannelRemoteSource::RTCDataChannelRemoteSource()
{
  return MEMORY[0x1E0DD3B98]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::commitStateAfterChildren()
{
  return MEMORY[0x1E0DD3BA0]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::commitStateBeforeChildren()
{
  return MEMORY[0x1E0DD3BA8]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::handleScrollPositionRequest()
{
  return MEMORY[0x1E0DD3BB0]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::wasScrolledByDelegatedScrolling()
{
  return MEMORY[0x1E0DD3BB8]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::setCurrentVerticalSnapPointIndex()
{
  return MEMORY[0x1E0DD3BC0]();
}

uint64_t WebCore::ScrollingTreeScrollingNode::setCurrentHorizontalSnapPointIndex()
{
  return MEMORY[0x1E0DD3BC8]();
}

uint64_t WebCore::SharedWorkerContextManager::Connection::resumeSharedWorker()
{
  return MEMORY[0x1E0DD3BD8]();
}

uint64_t WebCore::SharedWorkerContextManager::Connection::suspendSharedWorker()
{
  return MEMORY[0x1E0DD3BE0]();
}

uint64_t WebCore::SharedWorkerContextManager::Connection::terminateSharedWorker()
{
  return MEMORY[0x1E0DD3BE8]();
}

uint64_t WebCore::SharedWorkerContextManager::setConnection()
{
  return MEMORY[0x1E0DD3BF0]();
}

uint64_t WebCore::SharedWorkerContextManager::stopAllSharedWorkers(WebCore::SharedWorkerContextManager *this)
{
  return MEMORY[0x1E0DD3BF8](this);
}

uint64_t WebCore::SharedWorkerContextManager::registerSharedWorkerThread()
{
  return MEMORY[0x1E0DD3C00]();
}

uint64_t WebCore::SharedWorkerContextManager::singleton(WebCore::SharedWorkerContextManager *this)
{
  return MEMORY[0x1E0DD3C08](this);
}

uint64_t WebCore::TextManipulationController::completeManipulation()
{
  return MEMORY[0x1E0DD3C10]();
}

uint64_t WebCore::TextManipulationController::startObservingParagraphs()
{
  return MEMORY[0x1E0DD3C18]();
}

uint64_t WebCore::ThreadableWebSocketChannel::webSocketConnectRequest(WebCore::ThreadableWebSocketChannel *this, Document *a2, const WTF::URL *a3)
{
  return MEMORY[0x1E0DD3C28](this, a2, a3);
}

uint64_t WebCore::ThreadableWebSocketChannel::ThreadableWebSocketChannel(WebCore::ThreadableWebSocketChannel *this)
{
  return MEMORY[0x1E0DD3C30](this);
}

uint64_t WebCore::UserTypingGestureIndicator::processingUserTypingGesture(WebCore::UserTypingGestureIndicator *this)
{
  return MEMORY[0x1E0DD3C38](this);
}

uint64_t WebCore::UserTypingGestureIndicator::focusedElementAtGestureStart(WebCore::UserTypingGestureIndicator *this)
{
  return MEMORY[0x1E0DD3C40](this);
}

uint64_t WebCore::UserTypingGestureIndicator::UserTypingGestureIndicator(WebCore::UserTypingGestureIndicator *this, WebCore::LocalFrame *a2)
{
  return MEMORY[0x1E0DD3C48](this, a2);
}

void WebCore::UserTypingGestureIndicator::~UserTypingGestureIndicator(WebCore::UserTypingGestureIndicator *this)
{
  MEMORY[0x1E0DD3C50](this);
}

uint64_t WebCore::convertEnumerationToString()
{
  return MEMORY[0x1E0DD3C68]();
}

{
  return MEMORY[0x1E0DD3C70]();
}

{
  return MEMORY[0x1E0DD3C78]();
}

uint64_t WebCore::encodeES256PublicKeyAsCBOR()
{
  return MEMORY[0x1E0DD3C80]();
}

uint64_t WebCore::loadRecentSearchesFromFile(WebCore *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD3C88](this, a2, a3);
}

uint64_t WebCore::pdfDocumentTypeDescription(WebCore *this)
{
  return MEMORY[0x1E0DD3C90](this);
}

uint64_t WebCore::stopObservingCookieChanges(WebCore *this, WebCore::NetworkStorageSession *a2)
{
  return MEMORY[0x1E0DD3C98](this, a2);
}

uint64_t WebCore::truncatedStringForMenuItem(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD3CA0](this, a2);
}

uint64_t WebCore::unionRectIgnoringZeroRects()
{
  return MEMORY[0x1E0DD3CA8]();
}

uint64_t WebCore::AbsolutePositionConstraints::AbsolutePositionConstraints(WebCore::AbsolutePositionConstraints *this, const FloatSize *a2, const WebCore::FloatPoint *a3)
{
  return MEMORY[0x1E0DD3CB0](this, a2, a3);
}

uint64_t WebCore::AlternativeTextUIController::addAlternatives()
{
  return MEMORY[0x1E0DD3CB8]();
}

uint64_t WebCore::AlternativeTextUIController::removeAlternatives()
{
  return MEMORY[0x1E0DD3CC0]();
}

uint64_t WebCore::AlternativeTextUIController::replaceAlternatives()
{
  return MEMORY[0x1E0DD3CC8]();
}

uint64_t WebCore::AlternativeTextUIController::alternativesForContext()
{
  return MEMORY[0x1E0DD3CD0]();
}

uint64_t WebCore::AlternativeTextUIController::clear(WebCore::AlternativeTextUIController *this)
{
  return MEMORY[0x1E0DD3CD8](this);
}

uint64_t WebCore::ContentFilterUnblockHandler::setUnblockedAfterRequest(WebCore::ContentFilterUnblockHandler *this)
{
  return MEMORY[0x1E0DD3CE0](this);
}

uint64_t WebCore::ContentFilterUnblockHandler::ContentFilterUnblockHandler()
{
  return MEMORY[0x1E0DD3CE8]();
}

uint64_t WebCore::ImageBufferIOSurfaceBackend::calculateMemoryCost()
{
  return MEMORY[0x1E0DD3D00]();
}

uint64_t WebCore::ImageBufferIOSurfaceBackend::calculateBytesPerRow(WebCore::ImageBufferIOSurfaceBackend *this, const IntSize *a2)
{
  return MEMORY[0x1E0DD3D08](this, a2);
}

uint64_t WebCore::ImageBufferIOSurfaceBackend::calculateSafeBackendSize()
{
  return MEMORY[0x1E0DD3D10]();
}

uint64_t WebCore::ImageBufferIOSurfaceBackend::ImageBufferIOSurfaceBackend()
{
  return MEMORY[0x1E0DD3D18]();
}

void WebCore::ImageBufferIOSurfaceBackend::~ImageBufferIOSurfaceBackend(WebCore::ImageBufferIOSurfaceBackend *this)
{
  MEMORY[0x1E0DD3D20](this);
}

uint64_t WebCore::MediaPlayerPrivateInterface::MediaPlayerPrivateInterface(WebCore::MediaPlayerPrivateInterface *this)
{
  return MEMORY[0x1E0DD3D28](this);
}

void WebCore::MediaPlayerPrivateInterface::~MediaPlayerPrivateInterface(WebCore::MediaPlayerPrivateInterface *this)
{
  MEMORY[0x1E0DD3D30](this);
}

uint64_t WebCore::PlatformMediaSessionManager::sharedManager(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D38](this);
}

uint64_t WebCore::PlatformMediaSessionManager::processDidResume(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D40](this);
}

uint64_t WebCore::PlatformMediaSessionManager::processWillSuspend(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D48](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setOpusDecoderEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D50](this);
}

uint64_t WebCore::PlatformMediaSessionManager::sharedManagerIfExists(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D58](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setVorbisDecoderEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D60](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setShouldEnableVP8Decoder(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D68](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setShouldEnableVP9Decoder(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D70](this);
}

uint64_t WebCore::PlatformMediaSessionManager::applicationDidBecomeActive(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D78](this);
}

uint64_t WebCore::PlatformMediaSessionManager::mediaCapabilityGrantsEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D80](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setSWVPDecodersAlwaysEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D88](this);
}

uint64_t WebCore::PlatformMediaSessionManager::addNowPlayingMetadataObserver()
{
  return MEMORY[0x1E0DD3D90]();
}

uint64_t WebCore::PlatformMediaSessionManager::applicationDidEnterBackground(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3D98](this);
}

uint64_t WebCore::PlatformMediaSessionManager::applicationWillBecomeInactive(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3DA0](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setAlternateWebMPlayerEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3DA8](this);
}

uint64_t WebCore::PlatformMediaSessionManager::applicationWillEnterForeground(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3DB0](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setMediaCapabilityGrantsEnabled(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3DB8](this);
}

uint64_t WebCore::PlatformMediaSessionManager::setShouldDeactivateAudioSession(WebCore::PlatformMediaSessionManager *this)
{
  return MEMORY[0x1E0DD3DC0](this);
}

uint64_t WebCore::PlatformMediaSessionManager::removeNowPlayingMetadataObserver()
{
  return MEMORY[0x1E0DD3DC8]();
}

uint64_t WebCore::PlatformMediaSessionManager::processDidReceiveRemoteControlCommand()
{
  return MEMORY[0x1E0DD3DD0]();
}

uint64_t WebCore::RTCDataChannelRemoteHandler::readyToSend(WebCore::RTCDataChannelRemoteHandler *this)
{
  return MEMORY[0x1E0DD3DD8](this);
}

uint64_t WebCore::RTCDataChannelRemoteHandler::didDetectError()
{
  return MEMORY[0x1E0DD3DE0]();
}

uint64_t WebCore::RTCDataChannelRemoteHandler::didReceiveRawData()
{
  return MEMORY[0x1E0DD3DE8]();
}

uint64_t WebCore::RTCDataChannelRemoteHandler::didChangeReadyState()
{
  return MEMORY[0x1E0DD3DF0]();
}

uint64_t WebCore::RTCDataChannelRemoteHandler::didReceiveStringData()
{
  return MEMORY[0x1E0DD3DF8]();
}

uint64_t WebCore::RTCDataChannelRemoteHandler::bufferedAmountIsDecreasing(WebCore::RTCDataChannelRemoteHandler *this)
{
  return MEMORY[0x1E0DD3E00](this);
}

uint64_t WebCore::RealtimeMediaSourceObserver::RealtimeMediaSourceObserver(WebCore::RealtimeMediaSourceObserver *this)
{
  return MEMORY[0x1E0DD3E08](this);
}

void WebCore::RealtimeMediaSourceObserver::~RealtimeMediaSourceObserver(WebCore::RealtimeMediaSourceObserver *this)
{
  MEMORY[0x1E0DD3E10](this);
}

uint64_t WebCore::SVGPreserveAspectRatioValue::SVGPreserveAspectRatioValue()
{
  return MEMORY[0x1E0DD3E18]();
}

uint64_t WebCore::SWServerToContextConnection::setAsInspected()
{
  return MEMORY[0x1E0DD3E20]();
}

uint64_t WebCore::SWServerToContextConnection::didFinishInstall()
{
  return MEMORY[0x1E0DD3E28]();
}

uint64_t WebCore::SWServerToContextConnection::workerTerminated()
{
  return MEMORY[0x1E0DD3E30]();
}

uint64_t WebCore::SWServerToContextConnection::setScriptResource()
{
  return MEMORY[0x1E0DD3E38]();
}

uint64_t WebCore::SWServerToContextConnection::didFinishActivation()
{
  return MEMORY[0x1E0DD3E40]();
}

uint64_t WebCore::SWServerToContextConnection::scriptContextStarted()
{
  return MEMORY[0x1E0DD3E48]();
}

uint64_t WebCore::SWServerToContextConnection::didFailHeartBeatCheck()
{
  return MEMORY[0x1E0DD3E50]();
}

uint64_t WebCore::SWServerToContextConnection::scriptContextFailedToStart()
{
  return MEMORY[0x1E0DD3E58]();
}

uint64_t WebCore::SWServerToContextConnection::findClientByVisibleIdentifier()
{
  return MEMORY[0x1E0DD3E60]();
}

uint64_t WebCore::SWServerToContextConnection::setServiceWorkerHasPendingEvents()
{
  return MEMORY[0x1E0DD3E68]();
}

uint64_t WebCore::SWServerToContextConnection::claim()
{
  return MEMORY[0x1E0DD3E70]();
}

uint64_t WebCore::SWServerToContextConnection::matchAll()
{
  return MEMORY[0x1E0DD3E78]();
}

uint64_t WebCore::SWServerToContextConnection::SWServerToContextConnection()
{
  return MEMORY[0x1E0DD3E80]();
}

void WebCore::SWServerToContextConnection::~SWServerToContextConnection(WebCore::SWServerToContextConnection *this)
{
  MEMORY[0x1E0DD3E88](this);
}

uint64_t WebCore::ScrollingStateScrollingNode::setScrollContainerLayer(WebCore::ScrollingStateScrollingNode *this, const WebCore::LayerRepresentation *a2)
{
  return MEMORY[0x1E0DD3E90](this, a2);
}

uint64_t WebCore::ScrollingStateScrollingNode::setScrolledContentsLayer(WebCore::ScrollingStateScrollingNode *this, const WebCore::LayerRepresentation *a2)
{
  return MEMORY[0x1E0DD3E98](this, a2);
}

uint64_t WebCore::ScrollingTreeFixedNodeCocoa::create()
{
  return MEMORY[0x1E0DD3EA0]();
}

uint64_t WebCore::TranslateTransformOperation::create()
{
  return MEMORY[0x1E0DD3EA8]();
}

uint64_t WebCore::WebAudioSourceProviderCocoa::receivedNewAudioSamples()
{
  return MEMORY[0x1E0DD3EB0]();
}

uint64_t WebCore::WebAudioSourceProviderCocoa::WebAudioSourceProviderCocoa(WebCore::WebAudioSourceProviderCocoa *this)
{
  return MEMORY[0x1E0DD3EB8](this);
}

void WebCore::WebAudioSourceProviderCocoa::~WebAudioSourceProviderCocoa(WebCore::WebAudioSourceProviderCocoa *this)
{
  MEMORY[0x1E0DD3EC0](this);
}

uint64_t WebCore::applicationBundleIdentifier(WebCore *this)
{
  return MEMORY[0x1E0DD3EC8](this);
}

uint64_t WebCore::av1HardwareDecoderAvailable(WebCore *this)
{
  return MEMORY[0x1E0DD3ED0](this);
}

uint64_t WebCore::buildAttestedCredentialData()
{
  return MEMORY[0x1E0DD3ED8]();
}

uint64_t WebCore::createHTTPBodyNSInputStream()
{
  return MEMORY[0x1E0DD3EE0]();
}

uint64_t WebCore::createLibWebRTCDav1dDecoder(WebCore *this)
{
  return MEMORY[0x1E0DD3EE8](this);
}

uint64_t WebCore::createPrivateStorageSession()
{
  return MEMORY[0x1E0DD3EF0]();
}

uint64_t WebCore::extractCharsetFromMediaType()
{
  return MEMORY[0x1E0DD3EF8]();
}

uint64_t WebCore::initializeCommonAtomStrings(WebCore *this)
{
  return MEMORY[0x1E0DD3F00](this);
}

uint64_t WebCore::makeContainerOffsetPosition()
{
  return MEMORY[0x1E0DD3F08]();
}

uint64_t WebCore::overrideAvailableScreenSize(WebCore *this)
{
  return MEMORY[0x1E0DD3F10](this);
}

uint64_t WebCore::parseCacheControlDirectives(WebCore *this, const WebCore::HTTPHeaderMap *a2)
{
  return MEMORY[0x1E0DD3F18](this, a2);
}

uint64_t WebCore::platformDeferredSummaryItem()
{
  return MEMORY[0x1E0DD3F20]();
}

uint64_t WebCore::screenSupportsExtendedColor(WebCore *this, WebCore::Widget *a2)
{
  return MEMORY[0x1E0DD3F28](this, a2);
}

uint64_t WebCore::setPresentingApplicationPID(WebCore *this)
{
  return MEMORY[0x1E0DD3F30](this);
}

uint64_t WebCore::setSupportsPictureInPicture(WebCore *this)
{
  return MEMORY[0x1E0DD3F38](this);
}

uint64_t WebCore::startObservingCookieChanges()
{
  return MEMORY[0x1E0DD3F40]();
}

uint64_t WebCore::verifyVaryingRequestHeaders()
{
  return MEMORY[0x1E0DD3F48]();
}

uint64_t WebCore::vp9HardwareDecoderAvailable(WebCore *this)
{
  return MEMORY[0x1E0DD3F50](this);
}

uint64_t WebCore::FragmentDirectiveRangeFinder::findRangesFromTextDirectives()
{
  return MEMORY[0x1E0DD3F60]();
}

uint64_t WebCore::PlatformSpeechSynthesisVoice::create(WebCore::PlatformSpeechSynthesisVoice *this, const WTF::String *a2, const WTF::String *a3, const WTF::String *a4)
{
  return MEMORY[0x1E0DD3FA8](this, a2, a3, a4);
}

uint64_t WebCore::ScrollingStatePositionedNode::ScrollingStatePositionedNode()
{
  return MEMORY[0x1E0DD3FB0]();
}

uint64_t WebCore::ScrollingTreeStickyNodeCocoa::create()
{
  return MEMORY[0x1E0DD3FB8]();
}

uint64_t WebCore::ServiceWorkerRegistrationKey::emptyKey(WebCore::ServiceWorkerRegistrationKey *this)
{
  return MEMORY[0x1E0DD3FC0](this);
}

uint64_t WebCore::ServiceWorkerRegistrationKey::ServiceWorkerRegistrationKey()
{
  return MEMORY[0x1E0DD3FC8]();
}

uint64_t WebCore::ShareableBitmapConfiguration::calculateBytesPerRow(WebCore::ShareableBitmapConfiguration *this, const IntSize *a2, const WebCore::DestinationColorSpace *a3)
{
  return MEMORY[0x1E0DD3FD0](this, a2, a3);
}

uint64_t WebCore::ShareableBitmapConfiguration::calculateSizeInBytes(WebCore::ShareableBitmapConfiguration *this, const IntSize *a2, const WebCore::DestinationColorSpace *a3)
{
  return MEMORY[0x1E0DD3FD8](this, a2, a3);
}

uint64_t WebCore::ShareableBitmapConfiguration::ShareableBitmapConfiguration()
{
  return MEMORY[0x1E0DD3FE0]();
}

{
  return MEMORY[0x1E0DD3FE8]();
}

uint64_t WebCore::SharedWorkerObjectConnection::notifyWorkerObjectOfLoadCompletion()
{
  return MEMORY[0x1E0DD4000]();
}

uint64_t WebCore::SharedWorkerObjectConnection::SharedWorkerObjectConnection(WebCore::SharedWorkerObjectConnection *this)
{
  return MEMORY[0x1E0DD4008](this);
}

void WebCore::SharedWorkerObjectConnection::~SharedWorkerObjectConnection(WebCore::SharedWorkerObjectConnection *this)
{
  MEMORY[0x1E0DD4010](this);
}

uint64_t WebCore::TextTrackRepresentationCocoa::setContentScale(WebCore::TextTrackRepresentationCocoa *this, float a2)
{
  return MEMORY[0x1E0DD4018](this, a2);
}

uint64_t WebCore::TextTrackRepresentationCocoa::representationFactory(WebCore::TextTrackRepresentationCocoa *this)
{
  return MEMORY[0x1E0DD4020](this);
}

uint64_t WebCore::TextTrackRepresentationCocoa::TextTrackRepresentationCocoa()
{
  return MEMORY[0x1E0DD4028]();
}

void WebCore::TextTrackRepresentationCocoa::~TextTrackRepresentationCocoa(WebCore::TextTrackRepresentationCocoa *this)
{
  MEMORY[0x1E0DD4030](this);
}

uint64_t WebCore::UserMessageHandlerDescriptor::UserMessageHandlerDescriptor(WebCore::UserMessageHandlerDescriptor *this, const AtomString *a2, WebCore::DOMWrapperWorld *a3)
{
  return MEMORY[0x1E0DD4038](this, a2, a3);
}

void WebCore::UserMessageHandlerDescriptor::~UserMessageHandlerDescriptor(WebCore::UserMessageHandlerDescriptor *this)
{
  MEMORY[0x1E0DD4040](this);
}

uint64_t WebCore::collectVaryingRequestHeaders(WebCore *this, WebCore::NetworkStorageSession *a2, const WebCore::ResourceRequest *a3, const WebCore::ResourceResponse *a4)
{
  return MEMORY[0x1E0DD4048](this, a2, a3, a4);
}

uint64_t WebCore::extendedROMMRGBColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD4050](this);
}

uint64_t WebCore::extractMIMETypeFromMediaType(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4058](this, a2);
}

uint64_t WebCore::makeDeprecatedLegacyPosition()
{
  return MEMORY[0x1E0DD4060]();
}

uint64_t WebCore::platformRecurringSummaryItem()
{
  return MEMORY[0x1E0DD4068]();
}

uint64_t WebCore::reportExceptionIfJSDOMWindow()
{
  return MEMORY[0x1E0DD4070]();
}

uint64_t WebCore::sendCOEPInheritenceViolation()
{
  return MEMORY[0x1E0DD4078]();
}

uint64_t WebCore::setImageSourceAllowableTypes()
{
  return MEMORY[0x1E0DD4080]();
}

uint64_t WebCore::unitVectorForScrollDirection()
{
  return MEMORY[0x1E0DD4088]();
}

void WebCore::ApplePaySessionPaymentRequest::~ApplePaySessionPaymentRequest(WebCore::ApplePaySessionPaymentRequest *this)
{
  MEMORY[0x1E0DD4090](this);
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::platformCaptionDisplayMode(WebCore::CaptionUserPreferencesMediaAF *this)
{
  return MEMORY[0x1E0DD4098](this);
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::platformPreferredLanguages(WebCore::CaptionUserPreferencesMediaAF *this)
{
  return MEMORY[0x1E0DD40A0](this);
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::setCachedCaptionDisplayMode()
{
  return MEMORY[0x1E0DD40A8]();
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::setCachedPreferredLanguages()
{
  return MEMORY[0x1E0DD40B0]();
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::platformSetPreferredLanguage(WebCore::CaptionUserPreferencesMediaAF *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD40B8](this, a2);
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::platformSetCaptionDisplayMode()
{
  return MEMORY[0x1E0DD40C0]();
}

uint64_t WebCore::CaptionUserPreferencesMediaAF::setCaptionPreferencesDelegate()
{
  return MEMORY[0x1E0DD40C8]();
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::isAudioCaptureUnitRunning(WebCore::CoreAudioCaptureSourceFactory *this)
{
  return MEMORY[0x1E0DD40D0](this);
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::registerSpeakerSamplesProducer()
{
  return MEMORY[0x1E0DD40D8]();
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::unregisterSpeakerSamplesProducer()
{
  return MEMORY[0x1E0DD40E0]();
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::whenAudioCaptureUnitIsNotRunning()
{
  return MEMORY[0x1E0DD40E8]();
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::shouldAudioCaptureUnitRenderAudio(WebCore::CoreAudioCaptureSourceFactory *this)
{
  return MEMORY[0x1E0DD40F0](this);
}

uint64_t WebCore::CoreAudioCaptureSourceFactory::singleton(WebCore::CoreAudioCaptureSourceFactory *this)
{
  return MEMORY[0x1E0DD40F8](this);
}

uint64_t WebCore::GameControllerGamepadProvider::singleton(WebCore::GameControllerGamepadProvider *this)
{
  return MEMORY[0x1E0DD4100](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::initialize()
{
  return MEMORY[0x1E0DD4108]();
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::clearVideoFrames(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4110](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::enqueueVideoFrame(WebCore::LocalSampleBufferDisplayLayer *this, WebCore::VideoFrame *a2)
{
  return MEMORY[0x1E0DD4118](this, a2);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::updateDisplayMode(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4120](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::flushAndRemoveImage(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4128](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::updateBoundsAndPosition()
{
  return MEMORY[0x1E0DD4130]();
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::setShouldMaintainAspectRatio(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4138](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::flush(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4140](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::create()
{
  return MEMORY[0x1E0DD4148]();
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::rootLayer(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD4150](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::setDevices()
{
  return MEMORY[0x1E0DD4158]();
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::removeDevice(WebCore::MockRealtimeMediaSourceCenter *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4160](this, a2);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::resetDevices(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD4168](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::setDeviceIsEphemeral(WebCore::MockRealtimeMediaSourceCenter *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4170](this, a2);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::setMockCaptureDevicesInterrupted(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD4178](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::mockRealtimeMediaSourceCenterEnabled(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD4180](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::triggerMockCaptureConfigurationChange(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD4188](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::setMockRealtimeMediaSourceCenterEnabled(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD4190](this);
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::addDevice()
{
  return MEMORY[0x1E0DD4198]();
}

uint64_t WebCore::MockRealtimeMediaSourceCenter::singleton(WebCore::MockRealtimeMediaSourceCenter *this)
{
  return MEMORY[0x1E0DD41A0](this);
}

uint64_t WebCore::PerspectiveTransformOperation::create()
{
  return MEMORY[0x1E0DD41A8]();
}

uint64_t WebCore::PlaybackSessionInterfaceAVKit::invalidate(WebCore::PlaybackSessionInterfaceAVKit *this)
{
  return MEMORY[0x1E0DD41B0](this);
}

uint64_t WebCore::PlaybackSessionInterfaceAVKit::create()
{
  return MEMORY[0x1E0DD41B8]();
}

uint64_t WebCore::SQLiteStatementAutoResetScope::SQLiteStatementAutoResetScope(WebCore::SQLiteStatementAutoResetScope *this, WebCore::SQLiteStatement *a2)
{
  return MEMORY[0x1E0DD41C0](this, a2);
}

void WebCore::SQLiteStatementAutoResetScope::~SQLiteStatementAutoResetScope(WebCore::SQLiteStatementAutoResetScope *this)
{
  MEMORY[0x1E0DD41C8](this);
}

uint64_t WebCore::ScrollingTreeFrameHostingNode::create()
{
  return MEMORY[0x1E0DD41D0]();
}

uint64_t WebCore::VideoPresentationInterfaceIOS::invalidate(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD41D8](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::setInlineRect(WebCore::VideoPresentationInterfaceIOS *this, const FloatRect *a2)
{
  return MEMORY[0x1E0DD41E0](this, a2);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::exitFullscreen(WebCore::VideoPresentationInterfaceIOS *this, const FloatRect *a2)
{
  return MEMORY[0x1E0DD41E8](this, a2);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::enterFullscreen(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD41F0](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::cleanupFullscreen(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD41F8](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::setHasVideoContentLayer(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4200](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::preparedToExitFullscreen(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4208](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::preparedToReturnToInline(WebCore::VideoPresentationInterfaceIOS *this, uint64_t a2, const FloatRect *a3)
{
  return MEMORY[0x1E0DD4210](this, a2, a3);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::failedToRestoreFullscreen(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4218](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::preparedToReturnToStandby(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4220](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::setVideoPresentationModel()
{
  return MEMORY[0x1E0DD4228]();
}

uint64_t WebCore::VideoPresentationInterfaceIOS::applicationDidBecomeActive(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4230](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::requestHideAndExitFullscreen(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4238](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::exitFullscreenWithoutAnimationToMode(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4240](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::setMode(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD4248](this);
}

uint64_t WebCore::contextMenuItemTagCopySubject(WebCore *this)
{
  return MEMORY[0x1E0DD4250](this);
}

uint64_t WebCore::contextMenuItemTagLookUpImage(WebCore *this)
{
  return MEMORY[0x1E0DD4258](this);
}

uint64_t WebCore::obtainCrossOriginOpenerPolicy(WebCore *this, const WebCore::ResourceResponse *a2)
{
  return MEMORY[0x1E0DD4270](this, a2);
}

uint64_t WebCore::updateRequestForAccessControl()
{
  return MEMORY[0x1E0DD4278]();
}

uint64_t WebCore::AuthenticatorAssertionResponse::setAuthenticatorData()
{
  return MEMORY[0x1E0DD4280]();
}

uint64_t WebCore::AuthenticatorAssertionResponse::create()
{
  return MEMORY[0x1E0DD4288]();
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::frontendLoaded(WebCore::InspectorFrontendAPIDispatcher *this)
{
  return MEMORY[0x1E0DD4290](this);
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::dispatchMessageAsync(WebCore::InspectorFrontendAPIDispatcher *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4298](this, a2);
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::evaluateExpressionForTesting(WebCore::InspectorFrontendAPIDispatcher *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD42A0](this, a2);
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::dispatchCommandWithResultAsync()
{
  return MEMORY[0x1E0DD42A8]();
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::reset(WebCore::InspectorFrontendAPIDispatcher *this)
{
  return MEMORY[0x1E0DD42B0](this);
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::suspend()
{
  return MEMORY[0x1E0DD42B8]();
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::unsuspend(WebCore::InspectorFrontendAPIDispatcher *this)
{
  return MEMORY[0x1E0DD42C0](this);
}

uint64_t WebCore::InspectorFrontendAPIDispatcher::InspectorFrontendAPIDispatcher()
{
  return MEMORY[0x1E0DD42C8]();
}

void WebCore::InspectorFrontendAPIDispatcher::~InspectorFrontendAPIDispatcher(WebCore::InspectorFrontendAPIDispatcher *this)
{
  MEMORY[0x1E0DD42D0](this);
}

uint64_t WebCore::InspectorInstrumentationWebKit::interceptRequestInternal()
{
  return MEMORY[0x1E0DD42E0]();
}

uint64_t WebCore::InspectorInstrumentationWebKit::interceptResponseInternal()
{
  return MEMORY[0x1E0DD42E8]();
}

uint64_t WebCore::InspectorInstrumentationWebKit::shouldInterceptRequestInternal(WebCore::InspectorInstrumentationWebKit *this, const WebCore::ResourceLoader *a2)
{
  return MEMORY[0x1E0DD42F0](this, a2);
}

uint64_t WebCore::InspectorInstrumentationWebKit::shouldInterceptResponseInternal(WebCore::InspectorInstrumentationWebKit *this, const WebCore::LocalFrame *a2, const WebCore::ResourceResponse *a3)
{
  return MEMORY[0x1E0DD42F8](this, a2, a3);
}

uint64_t WebCore::ScrollingStateFrameHostingNode::create()
{
  return MEMORY[0x1E0DD4300]();
}

uint64_t WebCore::ScrollingTreePluginHostingNode::create()
{
  return MEMORY[0x1E0DD4308]();
}

uint64_t WebCore::SpeechRecognitionCaptureSource::findCaptureDevice(WebCore::SpeechRecognitionCaptureSource *this)
{
  return MEMORY[0x1E0DD4310](this);
}

uint64_t WebCore::SpeechRecognitionCaptureSource::createRealtimeMediaSource()
{
  return MEMORY[0x1E0DD4318]();
}

uint64_t WebCore::SpeechRecognitionCaptureSource::mute(WebCore::SpeechRecognitionCaptureSource *this)
{
  return MEMORY[0x1E0DD4320](this);
}

uint64_t WebCore::closestWordBoundaryForPosition()
{
  return MEMORY[0x1E0DD4330]();
}

uint64_t WebCore::enclosingTextUnitOfGranularity()
{
  return MEMORY[0x1E0DD4338]();
}

uint64_t WebCore::extendedDisplayP3ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD4340](this);
}

uint64_t WebCore::extendedITUR_2020ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD4348](this);
}

uint64_t WebCore::isStatusCodeCacheableByDefault(WebCore *this)
{
  return MEMORY[0x1E0DD4350](this);
}

uint64_t WebCore::makeRangeSelectingNodeContents(WebCore *this, Node *a2)
{
  return MEMORY[0x1E0DD4358](this, a2);
}

uint64_t WebCore::plainTextReplacingNoBreakSpace()
{
  return MEMORY[0x1E0DD4360]();
}

uint64_t WebCore::registerSupplementalVP9Decoder(WebCore *this)
{
  return MEMORY[0x1E0DD4368](this);
}

uint64_t WebCore::setApplicationBundleIdentifier(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4378](this, a2);
}

uint64_t WebCore::CoreLocationGeolocationProvider::requestAuthorization()
{
  return MEMORY[0x1E0DD4380]();
}

uint64_t WebCore::CoreLocationGeolocationProvider::setEnableHighAccuracy(WebCore::CoreLocationGeolocationProvider *this)
{
  return MEMORY[0x1E0DD4388](this);
}

uint64_t WebCore::CoreLocationGeolocationProvider::CoreLocationGeolocationProvider()
{
  return MEMORY[0x1E0DD4390]();
}

void WebCore::CoreLocationGeolocationProvider::~CoreLocationGeolocationProvider(WebCore::CoreLocationGeolocationProvider *this)
{
  MEMORY[0x1E0DD4398](this);
}

uint64_t WebCore::CrossOriginPreflightResultCache::canSkipPreflight()
{
  return MEMORY[0x1E0DD43A0]();
}

uint64_t WebCore::CrossOriginPreflightResultCache::clear(WebCore::CrossOriginPreflightResultCache *this)
{
  return MEMORY[0x1E0DD43A8](this);
}

uint64_t WebCore::CrossOriginPreflightResultCache::singleton(WebCore::CrossOriginPreflightResultCache *this)
{
  return MEMORY[0x1E0DD43B0](this);
}

uint64_t WebCore::MediaEngineConfigurationFactory::clearFactories(WebCore::MediaEngineConfigurationFactory *this)
{
  return MEMORY[0x1E0DD43B8](this);
}

uint64_t WebCore::MediaEngineConfigurationFactory::installFactory()
{
  return MEMORY[0x1E0DD43C0]();
}

uint64_t WebCore::MediaEngineConfigurationFactory::resetFactories(WebCore::MediaEngineConfigurationFactory *this)
{
  return MEMORY[0x1E0DD43C8](this);
}

uint64_t WebCore::MediaEngineConfigurationFactory::createDecodingConfiguration()
{
  return MEMORY[0x1E0DD43D0]();
}

uint64_t WebCore::MediaEngineConfigurationFactory::createEncodingConfiguration()
{
  return MEMORY[0x1E0DD43D8]();
}

uint64_t WebCore::MediaPlaybackTargetContextCocoa::MediaPlaybackTargetContextCocoa()
{
  return MEMORY[0x1E0DD43E0]();
}

void WebCore::MediaPlaybackTargetContextCocoa::~MediaPlaybackTargetContextCocoa(WebCore::MediaPlaybackTargetContextCocoa *this)
{
  MEMORY[0x1E0DD43E8](this);
}

uint64_t WebCore::PaymentInstallmentConfiguration::PaymentInstallmentConfiguration()
{
  return MEMORY[0x1E0DD43F0]();
}

uint64_t WebCore::PlatformImageNativeImageBackend::PlatformImageNativeImageBackend()
{
  return MEMORY[0x1E0DD43F8]();
}

void WebCore::PlatformImageNativeImageBackend::~PlatformImageNativeImageBackend(WebCore::PlatformImageNativeImageBackend *this)
{
  MEMORY[0x1E0DD4400](this);
}

uint64_t WebCore::ReadableStreamDefaultController::enqueue()
{
  return MEMORY[0x1E0DD4408]();
}

uint64_t WebCore::ScrollingStatePluginHostingNode::create()
{
  return MEMORY[0x1E0DD4410]();
}

uint64_t WebCore::ScrollingTreeFrameScrollingNode::commitStateBeforeChildren()
{
  return MEMORY[0x1E0DD4418]();
}

uint64_t WebCore::ScrollingTreeFrameScrollingNode::ScrollingTreeFrameScrollingNode()
{
  return MEMORY[0x1E0DD4420]();
}

void WebCore::ScrollingTreeFrameScrollingNode::~ScrollingTreeFrameScrollingNode(WebCore::ScrollingTreeFrameScrollingNode *this)
{
  MEMORY[0x1E0DD4428](this);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::hasVideoChanged(WebCore::VideoPresentationInterfaceAVKit *this)
{
  return MEMORY[0x1E0DD4430](this);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::setupFullscreen(WebCore::VideoPresentationInterfaceAVKit *this, UIView *a2, const FloatRect *a3, const FloatSize *a4, UIView *a5, unsigned int a6, BOOL a7, BOOL a8, BOOL a9)
{
  return MEMORY[0x1E0DD4438](this, a2, a3, a4, a5);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::setupCaptionsLayer(WebCore::VideoPresentationInterfaceAVKit *this, CALayer *a2, const FloatSize *a3)
{
  return MEMORY[0x1E0DD4440](this, a2, a3);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::setPlayerIdentifier()
{
  return MEMORY[0x1E0DD4448]();
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::create(WebCore::VideoPresentationInterfaceAVKit *this, PlaybackSessionInterfaceIOS *a2)
{
  return MEMORY[0x1E0DD4450](this, a2);
}

uint64_t WebCore::createTemporaryFileForQuickLook(WebCore *this, NSString *a2)
{
  return MEMORY[0x1E0DD4458](this, a2);
}

uint64_t WebCore::extendedLinearSRGBColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD4460](this);
}

uint64_t WebCore::nonAutofillCredentialTypeString()
{
  return MEMORY[0x1E0DD4468]();
}

uint64_t WebCore::obtainCrossOriginEmbedderPolicy()
{
  return MEMORY[0x1E0DD4470]();
}

uint64_t WebCore::AuthenticatorAttestationResponse::create()
{
  return MEMORY[0x1E0DD4478]();
}

void WebCore::IDBDatabaseNameAndVersionRequest::operator delete(void *a1)
{
  MEMORY[0x1E0DD4480](a1);
}

uint64_t WebCore::PlatformSpeechSynthesisUtterance::create()
{
  return MEMORY[0x1E0DD4488]();
}

uint64_t WebCore::PlaybackSessionModelMediaElement::seekToTime(WebCore::PlaybackSessionModelMediaElement *this, double a2, double a3, double a4)
{
  return MEMORY[0x1E0DD4490](this, a2, a3, a4);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::endScanning(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4498](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::toggleMuted(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44A0](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::endScrubbing(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44A8](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::removeClient(WebCore::PlaybackSessionModelMediaElement *this, WebCore::PlaybackSessionModelClient *a2)
{
  return MEMORY[0x1E0DD44B0](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::beginScrubbing(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44B8](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::exitFullscreen(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44C0](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::enterFullscreen(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44C8](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setMediaElement(WebCore::PlaybackSessionModelMediaElement *this, WebCore::HTMLMediaElement *a2)
{
  return MEMORY[0x1E0DD44D0](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setPlaybackRate(WebCore::PlaybackSessionModelMediaElement *this, double a2)
{
  return MEMORY[0x1E0DD44D8](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::togglePlayState(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44E0](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::sendRemoteCommand()
{
  return MEMORY[0x1E0DD44E8]();
}

uint64_t WebCore::PlaybackSessionModelMediaElement::mediaEngineChanged(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44F0](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::beginScanningForward(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD44F8](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::beginScanningBackward(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4500](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::selectAudioMediaOption(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4508](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setDefaultPlaybackRate(WebCore::PlaybackSessionModelMediaElement *this, double a2)
{
  return MEMORY[0x1E0DD4510](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::togglePictureInPicture(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4518](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::selectLegibleMediaOption(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4520](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setPlayingOnSecondScreen(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4528](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::toggleInWindowFullscreen(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4530](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::play(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4538](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::pause(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4540](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::fastSeek(WebCore::PlaybackSessionModelMediaElement *this, double a2)
{
  return MEMORY[0x1E0DD4548](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setMuted(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4550](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::addClient(WebCore::PlaybackSessionModelMediaElement *this, WebCore::PlaybackSessionModelClient *a2)
{
  return MEMORY[0x1E0DD4558](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::setVolume(WebCore::PlaybackSessionModelMediaElement *this, double a2)
{
  return MEMORY[0x1E0DD4560](this, a2);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::PlaybackSessionModelMediaElement(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD4568](this);
}

uint64_t WebCore::ScrollingStateFrameScrollingNode::setFooterLayer(WebCore::ScrollingStateFrameScrollingNode *this, const WebCore::LayerRepresentation *a2)
{
  return MEMORY[0x1E0DD4570](this, a2);
}

uint64_t WebCore::ScrollingStateFrameScrollingNode::setHeaderLayer(WebCore::ScrollingStateFrameScrollingNode *this, const WebCore::LayerRepresentation *a2)
{
  return MEMORY[0x1E0DD4578](this, a2);
}

uint64_t WebCore::ScrollingStateFrameScrollingNode::setCounterScrollingLayer(WebCore::ScrollingStateFrameScrollingNode *this, const WebCore::LayerRepresentation *a2)
{
  return MEMORY[0x1E0DD4580](this, a2);
}

uint64_t WebCore::ScrollingStateFrameScrollingNode::ScrollingStateFrameScrollingNode()
{
  return MEMORY[0x1E0DD4588]();
}

uint64_t WebCore::ScrollingTreePluginScrollingNode::ScrollingTreePluginScrollingNode()
{
  return MEMORY[0x1E0DD4590]();
}

void WebCore::ScrollingTreePluginScrollingNode::~ScrollingTreePluginScrollingNode(WebCore::ScrollingTreePluginScrollingNode *this)
{
  MEMORY[0x1E0DD4598](this);
}

uint64_t WebCore::ScrollingTreePositionedNodeCocoa::create()
{
  return MEMORY[0x1E0DD45A0]();
}

uint64_t WebCore::SecurityPolicyViolationEventInit::SecurityPolicyViolationEventInit()
{
  return MEMORY[0x1E0DD45A8]();
}

uint64_t WebCore::isSimpleCrossOriginAccessRequest(WebCore *this, const WTF::String *a2, const WebCore::HTTPHeaderMap *a3)
{
  return MEMORY[0x1E0DD45B0](this, a2, a3);
}

uint64_t WebCore::isStatusCodePotentiallyCacheable(WebCore *this)
{
  return MEMORY[0x1E0DD45B8](this);
}

uint64_t WebCore::platformDisbursementSummaryItems()
{
  return MEMORY[0x1E0DD45C0]();
}

uint64_t WebCore::setAdditionalSupportedImageTypes()
{
  return MEMORY[0x1E0DD45C8]();
}

uint64_t WebCore::setOverrideEnhanceTextLegibility(WebCore *this)
{
  return MEMORY[0x1E0DD45D0](this);
}

uint64_t WebCore::OriginAccessPatternsForWebProcess::allowAccessTo()
{
  return MEMORY[0x1E0DD45D8]();
}

uint64_t WebCore::OriginAccessPatternsForWebProcess::singleton(WebCore::OriginAccessPatternsForWebProcess *this)
{
  return MEMORY[0x1E0DD45E0](this);
}

void WebCore::RealtimeMediaSourceCenterObserver::~RealtimeMediaSourceCenterObserver(WebCore::RealtimeMediaSourceCenterObserver *this)
{
  MEMORY[0x1E0DD45F0](this);
}

uint64_t WebCore::ScrollingStatePluginScrollingNode::ScrollingStatePluginScrollingNode()
{
  return MEMORY[0x1E0DD45F8]();
}

uint64_t WebCore::allocWebAVPlayerLayerViewInstance(WebCore *this)
{
  return MEMORY[0x1E0DD4600](this);
}

uint64_t WebCore::createWebProcessGraphicsContextGL()
{
  return MEMORY[0x1E0DD4608]();
}

uint64_t WebCore::extendedAdobeRGB1998ColorSpaceRef(WebCore *this)
{
  return MEMORY[0x1E0DD4610](this);
}

uint64_t WebCore::pageConfigurationWithEmptyClients()
{
  return MEMORY[0x1E0DD4618]();
}

uint64_t WebCore::validateCrossOriginResourcePolicy()
{
  return MEMORY[0x1E0DD4620]();
}

{
  return MEMORY[0x1E0DD4628]();
}

uint64_t WebCore::COEPInheritenceViolationReportBody::create()
{
  return MEMORY[0x1E0DD4630]();
}

uint64_t WebCore::ScrollingTreeOverflowScrollingNode::ScrollingTreeOverflowScrollingNode()
{
  return MEMORY[0x1E0DD4638]();
}

void WebCore::ScrollingTreeOverflowScrollingNode::~ScrollingTreeOverflowScrollingNode(WebCore::ScrollingTreeOverflowScrollingNode *this)
{
  MEMORY[0x1E0DD4640](this);
}

uint64_t WebCore::ScrollingTreeScrollingNodeDelegate::totalContentsSize(WebCore::ScrollingTreeScrollingNodeDelegate *this)
{
  return MEMORY[0x1E0DD4648](this);
}

uint64_t WebCore::ScrollingTreeScrollingNodeDelegate::reachableContentsSize(WebCore::ScrollingTreeScrollingNodeDelegate *this)
{
  return MEMORY[0x1E0DD4650](this);
}

uint64_t WebCore::ScrollingTreeScrollingNodeDelegate::ScrollingTreeScrollingNodeDelegate(WebCore::ScrollingTreeScrollingNodeDelegate *this, WebCore::ScrollingTreeScrollingNode *a2)
{
  return MEMORY[0x1E0DD4658](this, a2);
}

void WebCore::ScrollingTreeScrollingNodeDelegate::~ScrollingTreeScrollingNodeDelegate(WebCore::ScrollingTreeScrollingNodeDelegate *this)
{
  MEMORY[0x1E0DD4660](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::removeClient(WebCore::VideoPresentationModelVideoElement *this, WebCore::VideoPresentationModelClient *a2)
{
  return MEMORY[0x1E0DD4668](this, a2);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoElement(WebCore::VideoPresentationModelVideoElement *this, WebCore::HTMLVideoElement *a2)
{
  return MEMORY[0x1E0DD4670](this, a2);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoLayerFrame(WebCore::VideoPresentationModelVideoElement *this, FloatRect a2)
{
  return MEMORY[0x1E0DD4678](this, (__n128)a2, *(__n128 *)((char *)&a2 + 4), *(__n128 *)&a2.m_size.m_width, *(__n128 *)&a2.m_size.m_height);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoSizeFenced()
{
  return MEMORY[0x1E0DD4680]();
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoLayerGravity()
{
  return MEMORY[0x1E0DD4688]();
}

uint64_t WebCore::VideoPresentationModelVideoElement::fullscreenModeChanged(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD4690](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::requestFullscreenMode(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD4698](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoFullscreenFrame(WebCore::VideoPresentationModelVideoElement *this, FloatRect a2)
{
  return MEMORY[0x1E0DD46A0](this, (__n128)a2, *(__n128 *)((char *)&a2 + 4), *(__n128 *)&a2.m_size.m_width, *(__n128 *)&a2.m_size.m_height);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setVideoFullscreenLayer()
{
  return MEMORY[0x1E0DD46A8]();
}

uint64_t WebCore::VideoPresentationModelVideoElement::createVideoFullscreenLayer(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD46B0](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::waitForPreparedForInlineThen()
{
  return MEMORY[0x1E0DD46B8]();
}

uint64_t WebCore::VideoPresentationModelVideoElement::setTextTrackRepresentationBounds(WebCore::VideoPresentationModelVideoElement *this, const IntRect *a2)
{
  return MEMORY[0x1E0DD46C0](this, a2);
}

uint64_t WebCore::VideoPresentationModelVideoElement::setRequiresTextTrackRepresentation(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD46C8](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::requestRouteSharingPolicyAndContextUID()
{
  return MEMORY[0x1E0DD46D0]();
}

uint64_t WebCore::VideoPresentationModelVideoElement::addClient(WebCore::VideoPresentationModelVideoElement *this, WebCore::VideoPresentationModelClient *a2)
{
  return MEMORY[0x1E0DD46D8](this, a2);
}

uint64_t WebCore::VideoPresentationModelVideoElement::VideoPresentationModelVideoElement(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD46E0](this);
}

uint64_t WebCore::createCGColorSpaceForCVPixelBuffer(WebCore *this, __CVBuffer *a2)
{
  return MEMORY[0x1E0DD46E8](this, a2);
}

uint64_t WebCore::fileButtonChooseMultipleFilesLabel(WebCore *this)
{
  return MEMORY[0x1E0DD46F0](this);
}

uint64_t WebCore::platformAutomaticReloadSummaryItem()
{
  return MEMORY[0x1E0DD46F8]();
}

uint64_t WebCore::ScrollingStateOverflowScrollingNode::ScrollingStateOverflowScrollingNode()
{
  return MEMORY[0x1E0DD4708]();
}

uint64_t WebCore::SystemBatteryStatusTestingOverrides::setHasBattery()
{
  return MEMORY[0x1E0DD4710]();
}

uint64_t WebCore::SystemBatteryStatusTestingOverrides::resetOverridesToDefaultValues(WebCore::SystemBatteryStatusTestingOverrides *this)
{
  return MEMORY[0x1E0DD4718](this);
}

uint64_t WebCore::SystemBatteryStatusTestingOverrides::setConfigurationChangedCallback()
{
  return MEMORY[0x1E0DD4720]();
}

uint64_t WebCore::SystemBatteryStatusTestingOverrides::setHasAC()
{
  return MEMORY[0x1E0DD4728]();
}

uint64_t WebCore::SystemBatteryStatusTestingOverrides::singleton(WebCore::SystemBatteryStatusTestingOverrides *this)
{
  return MEMORY[0x1E0DD4730](this);
}

uint64_t WebCore::createAccessControlPreflightRequest(WebCore *this, const WebCore::ResourceRequest *a2, WebCore::SecurityOrigin *a3, const WTF::String *a4)
{
  return MEMORY[0x1E0DD4738](this, a2, a3, a4);
}

uint64_t WebCore::externalRepresentationForLocalFrame()
{
  return MEMORY[0x1E0DD4740]();
}

uint64_t WebCore::isEndOfEditableOrNonEditableContent()
{
  return MEMORY[0x1E0DD4748]();
}

uint64_t WebCore::positionOfNextBoundaryOfGranularity()
{
  return MEMORY[0x1E0DD4750]();
}

uint64_t WebCore::AuthenticationExtensionsClientInputs::fromCBOR()
{
  return MEMORY[0x1E0DD4760]();
}

uint64_t WebCore::ContentSecurityPolicyResponseHeaders::ContentSecurityPolicyResponseHeaders(WebCore::ContentSecurityPolicyResponseHeaders *this, const WebCore::ResourceResponse *a2)
{
  return MEMORY[0x1E0DD4768](this, a2);
}

void WebCore::GraphicsLayerContentsDisplayDelegate::~GraphicsLayerContentsDisplayDelegate(WebCore::GraphicsLayerContentsDisplayDelegate *this)
{
  MEMORY[0x1E0DD4770](this);
}

uint64_t WebCore::MediaPlayerPrivateMediaStreamAVFObjC::setNativeImageCreator()
{
  return MEMORY[0x1E0DD4778]();
}

uint64_t WebCore::contextMenuItemTitleRemoveBackground(WebCore *this)
{
  return MEMORY[0x1E0DD4780](this);
}

uint64_t WebCore::largestRectWithAspectRatioInsideRect(WebCore *this, float a2, const FloatRect *a3)
{
  return MEMORY[0x1E0DD4788](this, a3, a2);
}

uint64_t WebCore::registerMemoryReleaseNotifyCallbacks(WebCore *this)
{
  return MEMORY[0x1E0DD4790](this);
}

uint64_t WebCore::setOwnershipIdentityForCVPixelBuffer()
{
  return MEMORY[0x1E0DD4798]();
}

uint64_t WebCore::standardUserAgentWithApplicationName()
{
  return MEMORY[0x1E0DD47A0]();
}

uint64_t WebCore::visiblePositionForPositionWithOffset()
{
  return MEMORY[0x1E0DD47A8]();
}

uint64_t WebCore::AuthenticationExtensionsClientOutputs::fromCBOR()
{
  return MEMORY[0x1E0DD47B0]();
}

uint64_t WebCore::CrossOriginAccessControlCheckDisabler::setCrossOriginAccessControlCheckEnabled(WebCore::CrossOriginAccessControlCheckDisabler *this)
{
  return MEMORY[0x1E0DD47B8](this);
}

uint64_t WebCore::CrossOriginAccessControlCheckDisabler::singleton(WebCore::CrossOriginAccessControlCheckDisabler *this)
{
  return MEMORY[0x1E0DD47C0](this);
}

uint64_t WebCore::PlatformCALayerDelegatedContentsFence::PlatformCALayerDelegatedContentsFence(WebCore::PlatformCALayerDelegatedContentsFence *this)
{
  return MEMORY[0x1E0DD47C8](this);
}

void WebCore::PlatformCALayerDelegatedContentsFence::~PlatformCALayerDelegatedContentsFence(WebCore::PlatformCALayerDelegatedContentsFence *this)
{
  MEMORY[0x1E0DD47D0](this);
}

uint64_t WebCore::ScrollingStateOverflowScrollProxyNode::ScrollingStateOverflowScrollProxyNode()
{
  return MEMORY[0x1E0DD47D8]();
}

uint64_t WebCore::computeFreshnessLifetimeForHTTPFamily()
{
  return MEMORY[0x1E0DD47E0]();
}

uint64_t WebCore::contextMenuItemTagCopyLinkToHighlight(WebCore *this)
{
  return MEMORY[0x1E0DD47E8](this);
}

uint64_t WebCore::convertStringToAuthenticatorTransport(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD47F0](this, a2);
}

uint64_t WebCore::doCrossOriginOpenerHandlingOfResponse()
{
  return MEMORY[0x1E0DD47F8]();
}

uint64_t WebCore::smallestRectWithAspectRatioAroundRect(WebCore *this, float a2, const FloatRect *a3)
{
  return MEMORY[0x1E0DD4800](this, a3, a2);
}

uint64_t WebCore::synthesizeRedirectResponseIfNecessary(WebCore *this, NSURLRequest *a2, NSURLRequest *a3, NSURLResponse *a4)
{
  return MEMORY[0x1E0DD4808](this, a2, a3, a4);
}

uint64_t WebCore::audioStreamBasicDescriptionForAudioBus()
{
  return MEMORY[0x1E0DD4810]();
}

uint64_t WebCore::setApplicationBundleIdentifierOverride(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4818](this, a2);
}

uint64_t WebCore::updateResponseHeadersAfterRevalidation(WebCore *this, WebCore::ResourceResponse *a2, const WebCore::ResourceResponse *a3)
{
  return MEMORY[0x1E0DD4820](this, a2, a3);
}

uint64_t WebCore::cleanHTTPRequestHeadersForAccessControl()
{
  return MEMORY[0x1E0DD4868]();
}

uint64_t WebCore::convertMediaPlayerToAVLayerVideoGravity()
{
  return MEMORY[0x1E0DD4870]();
}

uint64_t WebCore::rangeExpandedAroundPositionByCharacters()
{
  return MEMORY[0x1E0DD4878]();
}

uint64_t WebCore::mac(WebCore *this, const WebCore::AuthenticationChallenge *a2)
{
  return MEMORY[0x1E0DD4880](this, a2);
}

uint64_t WebCore::CrossOriginOpenerPolicyEnforcementResult::from()
{
  return MEMORY[0x1E0DD4888]();
}

uint64_t WebCore::setDeviceHasAGXCompilerServiceForTesting(WebCore *this)
{
  return MEMORY[0x1E0DD4890](this);
}

uint64_t WebCore::setPresentingApplicationBundleIdentifier(WebCore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4898](this, a2);
}

uint64_t WebCore::AudioMediaStreamTrackRendererInternalUnit::setCreateFunction()
{
  return MEMORY[0x1E0DD48A0]();
}

uint64_t WebCore::AudioMediaStreamTrackRendererInternalUnit::create()
{
  return MEMORY[0x1E0DD48A8]();
}

uint64_t WebCore::ScrollingTreeOverflowScrollProxyNodeCocoa::create()
{
  return MEMORY[0x1E0DD48B0]();
}

uint64_t WebCore::wordBoundaryForPositionWithoutCrossingLine()
{
  return MEMORY[0x1E0DD48C8]();
}

uint64_t WebCore::AdditionalNetworkLoadMetricsForWebInspector::create()
{
  return MEMORY[0x1E0DD48D0]();
}

uint64_t WebCore::coopValuesRequireBrowsingContextGroupSwitch()
{
  return MEMORY[0x1E0DD48D8]();
}

uint64_t WebCore::contextMenuItemTagAddHighlightToNewQuickNote(WebCore *this)
{
  return MEMORY[0x1E0DD48E8](this);
}

uint64_t WebCore::removeRecentlyModifiedRecentSearchesFromFile()
{
  return MEMORY[0x1E0DD48F0]();
}

uint64_t WebCore::get_CoreVideo_kCVPixelBufferPixelFormatTypeKey(WebCore *this)
{
  return MEMORY[0x1E0DD48F8](this);
}

uint64_t WebCore::visibleImageElementsInRangeWithNonLoadedImages()
{
  return MEMORY[0x1E0DD4900]();
}

uint64_t WebCore::clearApplicationBundleIdentifierTestingOverride(WebCore *this)
{
  return MEMORY[0x1E0DD4908](this);
}

uint64_t WebCore::traitCollectionWithAdjustedIdiomForSystemColors(WebCore *this, UITraitCollection *a2)
{
  return MEMORY[0x1E0DD4910](this, a2);
}

uint64_t WebCore::closestEditablePositionInElementForAbsolutePoint()
{
  return MEMORY[0x1E0DD4918]();
}

uint64_t WebCore::contextMenuItemTagAddHighlightToCurrentQuickNote(WebCore *this)
{
  return MEMORY[0x1E0DD4920](this);
}

uint64_t WebCore::contentTypeMeetsContainerAndCodecTypeRequirements()
{
  return MEMORY[0x1E0DD4930]();
}

uint64_t WebCore::File::create()
{
  return MEMORY[0x1E0DD4950]();
}

uint64_t WebCore::Font::create()
{
  return MEMORY[0x1E0DD4958]();
}

{
  return MEMORY[0x1E0DD4960]();
}

void WebCore::Font::~Font(WebCore::Font *this)
{
  MEMORY[0x1E0DD4968](this);
}

uint64_t WebCore::Icon::create()
{
  return MEMORY[0x1E0DD4978]();
}

uint64_t WebCore::Icon::create(WebCore::Icon *this, UIImage *a2)
{
  return MEMORY[0x1E0DD4980](this, a2);
}

void WebCore::Icon::~Icon(WebCore::Icon *this)
{
  MEMORY[0x1E0DD4988](this);
}

uint64_t WebCore::Node::appendChild(WebCore::Node *this, Node *a2)
{
  return MEMORY[0x1E0DD4998](this, a2);
}

uint64_t WebCore::Node::removeChild(WebCore::Node *this, WebCore::Node *a2)
{
  return MEMORY[0x1E0DD49A0](this, a2);
}

uint64_t WebCore::Node::insertBefore()
{
  return MEMORY[0x1E0DD49A8]();
}

uint64_t WebCore::Node::removedLastRef(WebCore::Node *this)
{
  return MEMORY[0x1E0DD49B8](this);
}

uint64_t WebCore::Node::setTextContent()
{
  return MEMORY[0x1E0DD49C0]();
}

uint64_t WebCore::Node::absoluteBoundingRect(WebCore::Node *this, BOOL *a2)
{
  return MEMORY[0x1E0DD49D8](this, a2);
}

uint64_t WebCore::Node::inspect(WebCore::Node *this)
{
  return MEMORY[0x1E0DD49F8](this);
}

uint64_t WebCore::Page::findString()
{
  return MEMORY[0x1E0DD4A08]();
}

uint64_t WebCore::Page::pluginData(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4A10](this);
}

uint64_t WebCore::Page::forEachPage()
{
  return MEMORY[0x1E0DD4A18]();
}

uint64_t WebCore::Page::setGroupName(WebCore::Page *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4A20](this, a2);
}

uint64_t WebCore::Page::setMainFrame()
{
  return MEMORY[0x1E0DD4A30]();
}

uint64_t WebCore::Page::setPagination()
{
  return MEMORY[0x1E0DD4A50]();
}

uint64_t WebCore::Page::layoutIfNeeded()
{
  return MEMORY[0x1E0DD4A58]();
}

uint64_t WebCore::Page::setInspectable(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4A60](this);
}

uint64_t WebCore::Page::setIsPrerender(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4A68](this);
}

uint64_t WebCore::Page::setMediaVolume(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4A70](this, a2);
}

uint64_t WebCore::Page::setOpenedByDOM(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4A78](this);
}

uint64_t WebCore::Page::findTextMatches()
{
  return MEMORY[0x1E0DD4A88]();
}

uint64_t WebCore::Page::setMainFrameURL(WebCore::Page *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD4A90](this, a2);
}

uint64_t WebCore::Page::updateRendering(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4A98](this);
}

uint64_t WebCore::Page::countFindMatches()
{
  return MEMORY[0x1E0DD4AA0]();
}

uint64_t WebCore::Page::setActivityState()
{
  return MEMORY[0x1E0DD4AA8]();
}

uint64_t WebCore::Page::setCanStartMedia(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AB0](this);
}

uint64_t WebCore::Page::setDefersLoading(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AB8](this);
}

uint64_t WebCore::Page::stopMediaCapture()
{
  return MEMORY[0x1E0DD4AC0]();
}

uint64_t WebCore::Page::userAgentChanged(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AC8](this);
}

uint64_t WebCore::Page::serviceWorkerPage()
{
  return MEMORY[0x1E0DD4AD0]();
}

uint64_t WebCore::Page::settingsDidChange(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AD8](this);
}

uint64_t WebCore::Page::clearIDBConnection(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AE0](this);
}

uint64_t WebCore::Page::hasLocalDataForURL(WebCore::Page *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD4AE8](this, a2);
}

uint64_t WebCore::Page::imageAnalysisQueue(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4AF0](this);
}

uint64_t WebCore::Page::setPageScaleFactor(WebCore::Page *this, float a2, const IntPoint *a3)
{
  return MEMORY[0x1E0DD4B00](this, a3, a2);
}

uint64_t WebCore::Page::setSceneIdentifier()
{
  return MEMORY[0x1E0DD4B08]();
}

uint64_t WebCore::Page::setTopContentInset(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4B10](this, a2);
}

uint64_t WebCore::Page::setViewScaleFactor(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4B18](this, a2);
}

uint64_t WebCore::Page::addLayoutMilestones()
{
  return MEMORY[0x1E0DD4B20]();
}

uint64_t WebCore::Page::mediaPlaybackExists(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B28](this);
}

uint64_t WebCore::Page::setDelegatesScaling(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B30](this);
}

uint64_t WebCore::Page::setFullscreenInsets()
{
  return MEMORY[0x1E0DD4B38]();
}

uint64_t WebCore::Page::userContentProvider(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B48](this);
}

uint64_t WebCore::Page::injectUserStyleSheet()
{
  return MEMORY[0x1E0DD4B50]();
}

uint64_t WebCore::Page::scrollingCoordinator(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B58](this);
}

uint64_t WebCore::Page::setDeviceScaleFactor(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4B60](this, a2);
}

uint64_t WebCore::Page::setupForRemoteWorker()
{
  return MEMORY[0x1E0DD4B68]();
}

uint64_t WebCore::Page::unmarkAllTextMatches(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B70](this);
}

uint64_t WebCore::Page::forceRepaintAllFrames(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B78](this);
}

uint64_t WebCore::Page::markAllMatchesForText()
{
  return MEMORY[0x1E0DD4B80]();
}

uint64_t WebCore::Page::mediaPlaybackIsPaused(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B88](this);
}

uint64_t WebCore::Page::optionalIDBConnection(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B90](this);
}

uint64_t WebCore::Page::pauseAllMediaPlayback(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4B98](this);
}

uint64_t WebCore::Page::replaceRangesWithText()
{
  return MEMORY[0x1E0DD4BA0]();
}

uint64_t WebCore::Page::resumeAllMediaPlayback(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BA8](this);
}

uint64_t WebCore::Page::revealCurrentSelection(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BB0](this);
}

uint64_t WebCore::Page::dispatchAfterPrintEvent(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BC8](this);
}

uint64_t WebCore::Page::finalizeRenderingUpdate()
{
  return MEMORY[0x1E0DD4BD0]();
}

uint64_t WebCore::Page::isolatedUpdateRendering(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BD8](this);
}

uint64_t WebCore::Page::resumeAllMediaBuffering(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BE0](this);
}

uint64_t WebCore::Page::scheduleRenderingUpdate()
{
  return MEMORY[0x1E0DD4BE8]();
}

uint64_t WebCore::Page::suspendAllMediaPlayback(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BF0](this);
}

uint64_t WebCore::Page::dispatchBeforePrintEvent(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4BF8](this);
}

uint64_t WebCore::Page::replaceSelectionWithText(WebCore::Page *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4C00](this, a2);
}

uint64_t WebCore::Page::setCORSDisablingPatterns()
{
  return MEMORY[0x1E0DD4C08]();
}

uint64_t WebCore::Page::setEditableRegionEnabled(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C10](this);
}

uint64_t WebCore::Page::setImageAnimationEnabled(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C18](this);
}

uint64_t WebCore::Page::suspendAllMediaBuffering(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C20](this);
}

uint64_t WebCore::Page::didCompleteRenderingFrame(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C28](this);
}

uint64_t WebCore::Page::didEndWritingToolsSession()
{
  return MEMORY[0x1E0DD4C30]();
}

uint64_t WebCore::Page::notifyToInjectUserScripts(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C38](this);
}

uint64_t WebCore::Page::screenPropertiesDidChange(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C40](this);
}

uint64_t WebCore::Page::serviceWorkerGlobalObject(WebCore::Page *this, WebCore::DOMWrapperWorld *a2)
{
  return MEMORY[0x1E0DD4C48](this, a2);
}

uint64_t WebCore::Page::analyzeImagesForFindInPage()
{
  return MEMORY[0x1E0DD4C50]();
}

uint64_t WebCore::Page::applicationDidBecomeActive(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C58](this);
}

uint64_t WebCore::Page::clearWheelEventTestMonitor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C60](this);
}

uint64_t WebCore::Page::startMonitoringWheelEvents(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C68](this);
}

uint64_t WebCore::Page::applicationWillResignActive(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C70](this);
}

uint64_t WebCore::Page::didBeginWritingToolsSession()
{
  return MEMORY[0x1E0DD4C78]();
}

uint64_t WebCore::Page::setPrefersNonBlinkingCursor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4C88](this);
}

uint64_t WebCore::Page::setUnobscuredSafeAreaInsets()
{
  return MEMORY[0x1E0DD4C90]();
}

uint64_t WebCore::Page::setVerticalScrollElasticity()
{
  return MEMORY[0x1E0DD4C98]();
}

uint64_t WebCore::Page::setZoomedOutPageScaleFactor(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4CA0](this, a2);
}

uint64_t WebCore::Page::disableICECandidateFiltering(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4CA8](this);
}

uint64_t WebCore::Page::effectiveAppearanceDidChange(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4CB0](this);
}

uint64_t WebCore::Page::removeInjectedUserStyleSheet()
{
  return MEMORY[0x1E0DD4CB8]();
}

uint64_t WebCore::Page::setOverrideViewportArguments()
{
  return MEMORY[0x1E0DD4CC8]();
}

uint64_t WebCore::Page::willBeginWritingToolsSession()
{
  return MEMORY[0x1E0DD4CD0]();
}

uint64_t WebCore::Page::applicationDidEnterBackground(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4CD8](this);
}

uint64_t WebCore::Page::clearPreviousItemFromAllPages(WebCore::Page *this, WebCore::HistoryItem *a2)
{
  return MEMORY[0x1E0DD4CE0](this, a2);
}

uint64_t WebCore::Page::setFullscreenAutoHideDuration()
{
  return MEMORY[0x1E0DD4CE8]();
}

uint64_t WebCore::Page::setHorizontalScrollElasticity()
{
  return MEMORY[0x1E0DD4CF0]();
}

uint64_t WebCore::Page::accessibilitySettingsDidChange(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4CF8](this);
}

uint64_t WebCore::Page::applicationWillEnterForeground(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D00](this);
}

uint64_t WebCore::Page::setUserInterfaceLayoutDirection()
{
  return MEMORY[0x1E0DD4D08]();
}

uint64_t WebCore::Page::willStartRenderingUpdateDisplay(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D10](this);
}

uint64_t WebCore::Page::checkedElementTargetingController(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D20](this);
}

uint64_t WebCore::Page::didCompleteRenderingUpdateDisplay(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D28](this);
}

uint64_t WebCore::Page::recomputeTextAutoSizingInAllFrames(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D30](this);
}

uint64_t WebCore::Page::setInitialScaleIgnoringContentSize(WebCore::Page *this, float a2)
{
  return MEMORY[0x1E0DD4D38](this, a2);
}

uint64_t WebCore::Page::fragmentDirectiveURLForSelectedText(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D40](this);
}

uint64_t WebCore::Page::resumeActiveDOMObjectsAndAnimations(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D48](this);
}

uint64_t WebCore::Page::setUnderPageBackgroundColorOverride()
{
  return MEMORY[0x1E0DD4D50]();
}

uint64_t WebCore::Page::updateStyleAfterChangeInEnvironment(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D58](this);
}

uint64_t WebCore::Page::writingToolsSessionDidReceiveAction()
{
  return MEMORY[0x1E0DD4D60]();
}

uint64_t WebCore::Page::setAllowsMediaDocumentInlinePlayback(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D68](this);
}

uint64_t WebCore::Page::setShouldSuppressScrollbarAnimations(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D70](this);
}

uint64_t WebCore::Page::suspendActiveDOMObjectsAndAnimations(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D78](this);
}

uint64_t WebCore::Page::proofreadingSessionDidReceiveSuggestions()
{
  return MEMORY[0x1E0DD4D88]();
}

uint64_t WebCore::Page::updateMediaElementRateChangeRestrictions(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D90](this);
}

uint64_t WebCore::Page::updateStateForSelectedSuggestionIfNeeded(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4D98](this);
}

uint64_t WebCore::Page::setDOMTimerAlignmentIntervalIncreaseLimit()
{
  return MEMORY[0x1E0DD4DA0]();
}

uint64_t WebCore::Page::proofreadingSessionDidUpdateStateForSuggestion()
{
  return MEMORY[0x1E0DD4DB0]();
}

uint64_t WebCore::Page::compositionSessionDidReceiveTextWithReplacementRange()
{
  return MEMORY[0x1E0DD4DB8]();
}

uint64_t WebCore::Page::updateStyleForAllPagesAfterGlobalChangeInEnvironment(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4DC0](this);
}

uint64_t WebCore::Page::group(WebCore::Page *this)
{
  return MEMORY[0x1E0DD4DC8](this);
}

uint64_t WebCore::Page::create()
{
  return MEMORY[0x1E0DD4DD0]();
}

uint64_t WebCore::Page::goToItem()
{
  return MEMORY[0x1E0DD4DD8]();
}

uint64_t WebCore::Page::setMuted()
{
  return MEMORY[0x1E0DD4DE0]();
}

void WebCore::Page::~Page(WebCore::Page *this)
{
  MEMORY[0x1E0DD4DE8](this);
}

uint64_t WebCore::Path::addRoundedRect()
{
  return MEMORY[0x1E0DD4DF0]();
}

uint64_t WebCore::Path::addRect(WebCore::Path *this, const FloatRect *a2)
{
  return MEMORY[0x1E0DD4DF8](this, a2);
}

uint64_t WebCore::Path::Path()
{
  return MEMORY[0x1E0DD4E00]();
}

uint64_t WebCore::Path::Path(WebCore::Path *this, const WebCore::Path *a2)
{
  return MEMORY[0x1E0DD4E08](this, a2);
}

uint64_t WebCore::toJS()
{
  return MEMORY[0x1E0DD4E20]();
}

{
  return MEMORY[0x1E0DD4E28]();
}

uint64_t WebCore::rangeExpandedByCharactersInDirectionAtWordBoundary()
{
  return MEMORY[0x1E0DD4E30]();
}

uint64_t WebCore::WebTransportBidirectionalStreamConstructionParameters::WebTransportBidirectionalStreamConstructionParameters()
{
  return MEMORY[0x1E0DD4E38]();
}

{
  return MEMORY[0x1E0DD4E40]();
}

void WebCore::WebTransportBidirectionalStreamConstructionParameters::~WebTransportBidirectionalStreamConstructionParameters(WebCore::WebTransportBidirectionalStreamConstructionParameters *this)
{
  MEMORY[0x1E0DD4E48](this);
}

uint64_t WebCore::Color::createAndPreserveColorSpace()
{
  return MEMORY[0x1E0DD4E50]();
}

uint64_t WebCore::Color::Color()
{
  return MEMORY[0x1E0DD4E58]();
}

{
  return MEMORY[0x1E0DD4E60]();
}

uint64_t WebCore::Color::Color(WebCore::Color *this, const Color *a2)
{
  return MEMORY[0x1E0DD4E68](this, a2);
}

uint64_t WebCore::Color::operator=()
{
  return MEMORY[0x1E0DD4E70]();
}

{
  return MEMORY[0x1E0DD4E78]();
}

uint64_t WebCore::Event::create()
{
  return MEMORY[0x1E0DD4E80]();
}

uint64_t WebCore::Frame::openedFrames(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD4E90](this);
}

uint64_t WebCore::Frame::setOwnerElement(WebCore::Frame *this, WebCore::HTMLFrameOwnerElement *a2)
{
  return MEMORY[0x1E0DD4E98](this, a2);
}

uint64_t WebCore::Frame::takeWindowProxyFrom(WebCore::Frame *this, WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD4EA0](this, a2);
}

uint64_t WebCore::Frame::disconnectOwnerElement(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD4EA8](this);
}

uint64_t WebCore::Frame::detachFromAllOpenedFrames(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD4EB0](this);
}

uint64_t WebCore::Frame::setOwnerPermissionsPolicy()
{
  return MEMORY[0x1E0DD4EB8]();
}

uint64_t WebCore::Frame::setOpener(WebCore::Frame *this, WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD4EC0](this, a2);
}

uint64_t WebCore::Image::supportsType(WebCore::Image *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD4EC8](this, a2);
}

uint64_t WebCore::Image::setSystemAllowsAnimationControls(WebCore::Image *this)
{
  return MEMORY[0x1E0DD4ED0](this);
}

uint64_t WebCore::Image::create()
{
  return MEMORY[0x1E0DD4ED8]();
}

uint64_t WebCore::Image::setData()
{
  return MEMORY[0x1E0DD4EE0]();
}

uint64_t WebCore::Image::nullImage(WebCore::Image *this)
{
  return MEMORY[0x1E0DD4EE8](this);
}

uint64_t WebCore::Model::create()
{
  return MEMORY[0x1E0DD4EF0]();
}

void WebCore::Model::~Model(WebCore::Model *this)
{
  MEMORY[0x1E0DD4EF8](this);
}

uint64_t WebCore::Range::selectNode(WebCore::Range *this, WebCore::Node *a2)
{
  return MEMORY[0x1E0DD4F08](this, a2);
}

uint64_t WebCore::Range::selectNodeContents(WebCore::Range *this, WebCore::Node *a2)
{
  return MEMORY[0x1E0DD4F58](this, a2);
}

uint64_t WebCore::Range::create(WebCore::Range *this, Document *a2)
{
  return MEMORY[0x1E0DD4F68](this, a2);
}

uint64_t WebCore::Range::setEnd()
{
  return MEMORY[0x1E0DD4F78]();
}

uint64_t WebCore::Range::collapse(WebCore::Range *this)
{
  return MEMORY[0x1E0DD4F80](this);
}

uint64_t WebCore::Range::setStart()
{
  return MEMORY[0x1E0DD4F88]();
}

uint64_t WebCore::Chrome::getToolTip()
{
  return MEMORY[0x1E0DD4F98]();
}

uint64_t WebCore::Chrome::createWindow(WebCore::Chrome *this, WebCore::LocalFrame *a2, const WebCore::WindowFeatures *a3, const WebCore::NavigationAction *a4)
{
  return MEMORY[0x1E0DD4FA8](this, a2, a3, a4);
}

uint64_t WebCore::Chrome::setWindowRect(WebCore::Chrome *this, const FloatRect *a2)
{
  return MEMORY[0x1E0DD4FB0](this, a2);
}

uint64_t WebCore::Chrome::print(WebCore::Chrome *this, WebCore::LocalFrame *a2)
{
  return MEMORY[0x1E0DD4FB8](this, a2);
}

uint64_t WebCore::Cookie::Cookie(WebCore::Cookie *this, NSHTTPCookie *a2)
{
  return MEMORY[0x1E0DD4FC0](this, a2);
}

uint64_t WebCore::Cursor::fromType()
{
  return MEMORY[0x1E0DD4FC8]();
}

uint64_t WebCore::Cursor::Cursor(WebCore::Cursor *this, WebCore::Image *a2, const IntPoint *a3)
{
  return MEMORY[0x1E0DD4FD0](this, a2, a3);
}

uint64_t WebCore::Editor::insertText()
{
  return MEMORY[0x1E0DD4FE8]();
}

uint64_t WebCore::Editor::closeTyping(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD4FF0](this);
}

uint64_t WebCore::Editor::setComposition()
{
  return MEMORY[0x1E0DD5000]();
}

uint64_t WebCore::Editor::fontForSelection(WebCore::Editor *this, BOOL *a2)
{
  return MEMORY[0x1E0DD5010](this, a2);
}

uint64_t WebCore::Editor::insertAttachment()
{
  return MEMORY[0x1E0DD5018]();
}

uint64_t WebCore::Editor::confirmComposition(WebCore::Editor *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD5030](this, a2);
}

uint64_t WebCore::Editor::confirmComposition(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD5038](this);
}

uint64_t WebCore::Editor::insertDictatedText()
{
  return MEMORY[0x1E0DD5040]();
}

uint64_t WebCore::Editor::deleteWithDirection()
{
  return MEMORY[0x1E0DD5050]();
}

uint64_t WebCore::Editor::setWritingSuggestion()
{
  return MEMORY[0x1E0DD5060]();
}

uint64_t WebCore::Editor::applyStyleToSelection()
{
  return MEMORY[0x1E0DD5068]();
}

uint64_t WebCore::Editor::insertTextPlaceholder(WebCore::Editor *this, const IntSize *a2)
{
  return MEMORY[0x1E0DD5070](this, a2);
}

uint64_t WebCore::Editor::removeTextPlaceholder()
{
  return MEMORY[0x1E0DD5078]();
}

uint64_t WebCore::Editor::promisedAttachmentInfo()
{
  return MEMORY[0x1E0DD5088]();
}

uint64_t WebCore::Editor::writeImageToPasteboard()
{
  return MEMORY[0x1E0DD5090]();
}

uint64_t WebCore::Editor::changeSelectionListType(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD5098](this);
}

uint64_t WebCore::Editor::setBaseWritingDirection()
{
  return MEMORY[0x1E0DD50A0]();
}

uint64_t WebCore::Editor::replaceSelectionWithText()
{
  return MEMORY[0x1E0DD50C0]();
}

uint64_t WebCore::Editor::replaceNodeFromPasteboard()
{
  return MEMORY[0x1E0DD50C8]();
}

uint64_t WebCore::Editor::setIgnoreSelectionChanges()
{
  return MEMORY[0x1E0DD50D0]();
}

uint64_t WebCore::Editor::decreaseSelectionListLevel(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD50D8](this);
}

uint64_t WebCore::Editor::increaseSelectionListLevel(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD50E0](this);
}

uint64_t WebCore::Editor::readSelectionFromPasteboard(WebCore::Editor *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD50E8](this, a2);
}

uint64_t WebCore::Editor::handleAlternativeTextUIResult(WebCore::Editor *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD5108](this, a2);
}

uint64_t WebCore::Editor::insertMultiRepresentationHEIC()
{
  return MEMORY[0x1E0DD5110]();
}

uint64_t WebCore::Editor::deleteSelectionWithSmartDelete()
{
  return MEMORY[0x1E0DD5118]();
}

uint64_t WebCore::Editor::fontAttributesAtSelectionStart(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD5120](this);
}

uint64_t WebCore::Editor::insertParagraphSeparatorInQuotedContent(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD5148](this);
}

uint64_t WebCore::Editor::command(WebCore::Editor *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD5168](this, a2);
}

uint64_t WebCore::Editor::copyURL(WebCore::Editor *this, const WTF::URL *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD5170](this, a2, a3);
}

uint64_t WebCore::FETile::create()
{
  return MEMORY[0x1E0DD5178]();
}

uint64_t WebCore::JSNode::toWrapped(WebCore::JSNode *this, JSC::VM *a2, JSValue a3)
{
  return MEMORY[0x1E0DD5180](this, a2, a3.super.isa);
}

uint64_t WebCore::Length::Length()
{
  return MEMORY[0x1E0DD5188]();
}

uint64_t WebCore::Quirks::needsIPhoneUserAgent(WebCore::Quirks *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD5190](this, a2);
}

uint64_t WebCore::Quirks::needsDesktopUserAgent(WebCore::Quirks *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD5198](this, a2);
}

uint64_t WebCore::Quirks::needsIPadMiniUserAgent(WebCore::Quirks *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD51A0](this, a2);
}

uint64_t WebCore::Quirks::updateStorageAccessUserAgentStringQuirks()
{
  return MEMORY[0x1E0DD51A8]();
}

uint64_t WebCore::Quirks::shouldAllowNavigationToCustomProtocolWithoutUserGesture()
{
  return MEMORY[0x1E0DD51B0]();
}

uint64_t WebCore::Region::Shape::Shape()
{
  return MEMORY[0x1E0DD51B8]();
}

uint64_t WebCore::Region::unite()
{
  return MEMORY[0x1E0DD51C0]();
}

uint64_t WebCore::Region::subtract()
{
  return MEMORY[0x1E0DD51C8]();
}

uint64_t WebCore::Region::Region()
{
  return MEMORY[0x1E0DD51D0]();
}

{
  return MEMORY[0x1E0DD51D8]();
}

uint64_t WebCore::Region::Region(WebCore::Region *this, const IntRect *a2)
{
  return MEMORY[0x1E0DD51E0](this, a2);
}

uint64_t WebCore::Region::Region(WebCore::Region *this, const WebCore::Region *a2)
{
  return MEMORY[0x1E0DD51E8](this, a2);
}

uint64_t WebCore::Region::Region(WebCore::Region *this)
{
  return MEMORY[0x1E0DD51F0](this);
}

void WebCore::Region::~Region(WebCore::Region *this)
{
  MEMORY[0x1E0DD51F8](this);
}

uint64_t WebCore::Region::operator=()
{
  return MEMORY[0x1E0DD5200]();
}

{
  return MEMORY[0x1E0DD5208]();
}

uint64_t WebCore::Report::create()
{
  return MEMORY[0x1E0DD5210]();
}

void WebCore::Report::~Report(WebCore::Report *this)
{
  MEMORY[0x1E0DD5218](this);
}

void WebCore::Report::operator delete(void *a1)
{
  MEMORY[0x1E0DD5220](a1);
}

uint64_t WebCore::WebGPU::create()
{
  return MEMORY[0x1E0DD5228]();
}

uint64_t WebCore::WebRTC::extractMessages()
{
  return MEMORY[0x1E0DD5230]();
}

uint64_t WebCore::WebRTC::getSTUNOrTURNMessageLengths()
{
  return MEMORY[0x1E0DD5238]();
}

uint64_t WebCore::Widget::setFrameRect(WebCore::Widget *this, const IntRect *a2)
{
  return MEMORY[0x1E0DD5240](this, a2);
}

uint64_t WebCore::Widget::removeFromParent(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD5248](this);
}

uint64_t WebCore::Widget::hide(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD5258](this);
}

uint64_t WebCore::Widget::show(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD5260](this);
}

uint64_t WebCore::Widget::setParent(WebCore::Widget *this, WebCore::ScrollView *a2)
{
  return MEMORY[0x1E0DD5268](this, a2);
}

uint64_t WebCore::Widget::Widget()
{
  return MEMORY[0x1E0DD5270]();
}

void WebCore::Widget::~Widget(WebCore::Widget *this)
{
  MEMORY[0x1E0DD5278](this);
}

uint64_t WebCore::get_MediaAccessibility_kMAXCaptionAppearanceSettingsChangedNotification(WebCore *this)
{
  return MEMORY[0x1E0DD5280](this);
}

uint64_t WebCore::Archive::saveResourcesToDisk(WebCore::Archive *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD5288](this, a2);
}

uint64_t WebCore::Element::setAttribute(WebCore::Element *this, const AtomString *a2, const AtomString *a3)
{
  return MEMORY[0x1E0DD52C0](this, a2, a3);
}

uint64_t WebCore::Element::fromIdentifier()
{
  return MEMORY[0x1E0DD52D8]();
}

uint64_t WebCore::Element::getClientRects(WebCore::Element *this)
{
  return MEMORY[0x1E0DD52E0](this);
}

uint64_t WebCore::Element::boundingClientRect(WebCore::Element *this)
{
  return MEMORY[0x1E0DD5318](this);
}

uint64_t WebCore::Element::boundsInRootViewSpace(WebCore::Element *this)
{
  return MEMORY[0x1E0DD5360](this);
}

uint64_t WebCore::Element::scrollIntoViewIfNotVisible(WebCore::Element *this)
{
  return MEMORY[0x1E0DD5398](this);
}

uint64_t WebCore::Element::invalidateStyleAndLayerComposition(WebCore::Element *this)
{
  return MEMORY[0x1E0DD53A8](this);
}

uint64_t WebCore::Element::setAttributeWithoutSynchronization(WebCore::Element *this, const WebCore::QualifiedName *a2, const AtomString *a3)
{
  return MEMORY[0x1E0DD53B0](this, a2, a3);
}

uint64_t WebCore::Element::innerText(WebCore::Element *this)
{
  return MEMORY[0x1E0DD53D8](this);
}

uint64_t WebCore::FEBlend::create()
{
  return MEMORY[0x1E0DD53E8]();
}

uint64_t WebCore::FEFlood::create()
{
  return MEMORY[0x1E0DD53F0]();
}

uint64_t WebCore::FEImage::create()
{
  return MEMORY[0x1E0DD53F8]();
}

uint64_t WebCore::FEMerge::create()
{
  return MEMORY[0x1E0DD5400]();
}

uint64_t WebCore::IntRect::intersect(WebCore::IntRect *this, const IntRect *a2)
{
  return MEMORY[0x1E0DD5408](this, a2);
}

uint64_t WebCore::IntRect::IntRect(WebCore::IntRect *this, const FloatRect *a2)
{
  return MEMORY[0x1E0DD5410](this, a2);
}

uint64_t WebCore::IntSize::IntSize(WebCore::IntSize *this, const CGSize *a2)
{
  return MEMORY[0x1E0DD5418](this, a2);
}

uint64_t WebCore::IntSize::IntSize(WebCore::IntSize *this, const FloatSize *a2)
{
  return MEMORY[0x1E0DD5420](this, a2);
}

uint64_t WebCore::JSRange::toWrapped(WebCore::JSRange *this, JSC::VM *a2, JSValue a3)
{
  return MEMORY[0x1E0DD5430](this, a2, a3.super.isa);
}

uint64_t WebCore::Pattern::create()
{
  return MEMORY[0x1E0DD5438]();
}

void WebCore::Pattern::~Pattern(WebCore::Pattern *this)
{
  MEMORY[0x1E0DD5440](this);
}

uint64_t WebCore::Payment::Payment()
{
  return MEMORY[0x1E0DD5448]();
}

void WebCore::Payment::~Payment(WebCore::Payment *this)
{
  MEMORY[0x1E0DD5450](this);
}

uint64_t WebCore::Process::identifier(WebCore::Process *this)
{
  return MEMORY[0x1E0DD5458](this);
}

uint64_t WebCore::Process::setIdentifier()
{
  return MEMORY[0x1E0DD5460]();
}

uint64_t WebCore::dataURL()
{
  return MEMORY[0x1E0DD5470]();
}

uint64_t WebCore::AudioBus::setChannelMemory(WebCore::AudioBus *this, uint64_t a2, float *a3)
{
  return MEMORY[0x1E0DD5478](this, a2, a3);
}

uint64_t WebCore::Document::allDocuments(WebCore::Document *this)
{
  return MEMORY[0x1E0DD54C0](this);
}

uint64_t WebCore::Document::ensureQuirks(WebCore::Document *this)
{
  return MEMORY[0x1E0DD54C8](this);
}

uint64_t WebCore::Document::updateLayout()
{
  return MEMORY[0x1E0DD54D0]();
}

uint64_t WebCore::Document::createElement(WebCore::Document *this, const WebCore::QualifiedName *a2)
{
  return MEMORY[0x1E0DD54E8](this, a2);
}

uint64_t WebCore::Document::ensureMarkers(WebCore::Document *this)
{
  return MEMORY[0x1E0DD54F0](this);
}

uint64_t WebCore::Document::createTextNode()
{
  return MEMORY[0x1E0DD5520]();
}

uint64_t WebCore::Document::allDocumentsMap(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5538](this);
}

uint64_t WebCore::Document::addConsoleMessage()
{
  return MEMORY[0x1E0DD5570]();
}

uint64_t WebCore::Document::setFocusedElement(WebCore::Document *this, WebCore::Element *a2)
{
  return MEMORY[0x1E0DD55A0](this, a2);
}

uint64_t WebCore::Document::appHighlightStorage(WebCore::Document *this)
{
  return MEMORY[0x1E0DD55B8](this);
}

uint64_t WebCore::Document::forEachMediaElement()
{
  return MEMORY[0x1E0DD55D0]();
}

uint64_t WebCore::Document::updateStyleIfNeeded(WebCore::Document *this)
{
  return MEMORY[0x1E0DD55E0](this);
}

uint64_t WebCore::Document::appHighlightRegistry(WebCore::Document *this)
{
  return MEMORY[0x1E0DD55E8](this);
}

uint64_t WebCore::Document::ensureReportingScope(WebCore::Document *this)
{
  return MEMORY[0x1E0DD55F0](this);
}

uint64_t WebCore::Document::setRTCNetworkManager()
{
  return MEMORY[0x1E0DD5600]();
}

uint64_t WebCore::Document::contentChangeObserver(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5608](this);
}

uint64_t WebCore::Document::ensureFullscreenManager(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5628](this);
}

uint64_t WebCore::Document::addMediaCanStartListener()
{
  return MEMORY[0x1E0DD5638]();
}

uint64_t WebCore::Document::createElementForBindings(WebCore::Document *this, const AtomString *a2)
{
  return MEMORY[0x1E0DD5640](this, a2);
}

uint64_t WebCore::Document::navigateFromServiceWorker()
{
  return MEMORY[0x1E0DD5660]();
}

uint64_t WebCore::Document::textManipulationController(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5670](this);
}

uint64_t WebCore::Document::updateCachedCookiesEnabled(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5678](this);
}

uint64_t WebCore::Document::removeMediaCanStartListener()
{
  return MEMORY[0x1E0DD5688]();
}

uint64_t WebCore::Document::setNeedsDOMWindowResizeEvent(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5690](this);
}

uint64_t WebCore::Document::simulateDeviceOrientationChange(WebCore::Document *this, double a2, double a3, double a4)
{
  return MEMORY[0x1E0DD5698](this, a2, a3, a4);
}

uint64_t WebCore::Document::dispatchSystemPreviewActionEvent()
{
  return MEMORY[0x1E0DD56A0]();
}

uint64_t WebCore::Document::enqueueSecurityPolicyViolationEvent()
{
  return MEMORY[0x1E0DD56A8]();
}

uint64_t WebCore::Document::updateLayoutIgnorePendingStylesheets()
{
  return MEMORY[0x1E0DD56B0]();
}

uint64_t WebCore::Document::wasLoadedWithDataTransferFromPrevalentResource(WebCore::Document *this)
{
  return MEMORY[0x1E0DD56B8](this);
}

uint64_t WebCore::Document::hasRequestedPageSpecificStorageAccessWithUserInteraction()
{
  return MEMORY[0x1E0DD56D0]();
}

uint64_t WebCore::Document::setHasRequestedPageSpecificStorageAccessWithUserInteraction()
{
  return MEMORY[0x1E0DD56D8]();
}

uint64_t WebCore::Document::editor(WebCore::Document *this)
{
  return MEMORY[0x1E0DD5708](this);
}

uint64_t WebCore::Document::hitTest()
{
  return MEMORY[0x1E0DD5738]();
}

uint64_t WebCore::Document::postTask()
{
  return MEMORY[0x1E0DD5758]();
}

uint64_t WebCore::DragData::DragData()
{
  return MEMORY[0x1E0DD5780]();
}

{
  return MEMORY[0x1E0DD5788]();
}

uint64_t WebCore::FEOffset::create()
{
  return MEMORY[0x1E0DD5790]();
}

void WebCore::FileList::operator delete(void *a1)
{
  MEMORY[0x1E0DD5798](a1);
}

uint64_t WebCore::FileList::operator new(WebCore::FileList *this)
{
  return MEMORY[0x1E0DD57A0](this);
}

uint64_t WebCore::FormData::appendBlob(WebCore::FormData *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD57A8](this, a2);
}

uint64_t WebCore::FormData::appendData()
{
  return MEMORY[0x1E0DD57B0]();
}

uint64_t WebCore::FormData::appendFileRange()
{
  return MEMORY[0x1E0DD57B8]();
}

uint64_t WebCore::FormData::resolveBlobReferences(WebCore::FormData *this, WebCore::BlobRegistryImpl *a2)
{
  return MEMORY[0x1E0DD57C0](this, a2);
}

uint64_t WebCore::FormData::create()
{
  return MEMORY[0x1E0DD57C8]();
}

{
  return MEMORY[0x1E0DD57D0]();
}

uint64_t WebCore::FormData::create(WebCore::FormData *this)
{
  return MEMORY[0x1E0DD57D8](this);
}

void WebCore::FormData::~FormData(WebCore::FormData *this)
{
  MEMORY[0x1E0DD57E0](this);
}

void WebCore::FormData::operator delete(void *a1)
{
  MEMORY[0x1E0DD57E8](a1);
}

uint64_t WebCore::Gradient::create()
{
  return MEMORY[0x1E0DD57F0]();
}

uint64_t WebCore::IDBError::IDBError()
{
  return MEMORY[0x1E0DD57F8]();
}

uint64_t WebCore::IDBValue::IDBValue()
{
  return MEMORY[0x1E0DD5800]();
}

uint64_t WebCore::IntPoint::IntPoint(WebCore::IntPoint *this, const CGPoint *a2)
{
  return MEMORY[0x1E0DD5808](this, a2);
}

uint64_t WebCore::IntPoint::IntPoint(WebCore::IntPoint *this, const WebCore::FloatPoint *a2)
{
  return MEMORY[0x1E0DD5810](this, a2);
}

uint64_t WebCore::Position::Position()
{
  return MEMORY[0x1E0DD5818]();
}

{
  return MEMORY[0x1E0DD5820]();
}

uint64_t WebCore::RTCError::RTCError()
{
  return MEMORY[0x1E0DD5830]();
}

uint64_t WebCore::SWServer::Connection::abortBackgroundFetch()
{
  return MEMORY[0x1E0DD5840]();
}

uint64_t WebCore::SWServer::Connection::matchBackgroundFetch()
{
  return MEMORY[0x1E0DD5848]();
}

uint64_t WebCore::SWServer::Connection::startBackgroundFetch()
{
  return MEMORY[0x1E0DD5850]();
}

uint64_t WebCore::SWServer::Connection::whenRegistrationReady()
{
  return MEMORY[0x1E0DD5858]();
}

uint64_t WebCore::SWServer::Connection::doRegistrationMatching(WebCore::SWServer::Connection *this, const WebCore::SecurityOriginData *a2, const WTF::URL *a3)
{
  return MEMORY[0x1E0DD5860](this, a2, a3);
}

uint64_t WebCore::SWServer::Connection::retrieveRecordResponse()
{
  return MEMORY[0x1E0DD5868]();
}

uint64_t WebCore::SWServer::Connection::storeRegistrationsOnDisk()
{
  return MEMORY[0x1E0DD5870]();
}

uint64_t WebCore::SWServer::Connection::backgroundFetchIdentifiers()
{
  return MEMORY[0x1E0DD5878]();
}

uint64_t WebCore::SWServer::Connection::backgroundFetchInformation()
{
  return MEMORY[0x1E0DD5880]();
}

uint64_t WebCore::SWServer::Connection::retrieveRecordResponseBody()
{
  return MEMORY[0x1E0DD5888]();
}

uint64_t WebCore::SWServer::Connection::finishFetchingScriptInServer()
{
  return MEMORY[0x1E0DD5890]();
}

uint64_t WebCore::SWServer::Connection::didResolveRegistrationPromise(WebCore::SWServer::Connection *this, const WebCore::ServiceWorkerRegistrationKey *a2)
{
  return MEMORY[0x1E0DD5898](this, a2);
}

uint64_t WebCore::SWServer::Connection::addServiceWorkerRegistrationInServer()
{
  return MEMORY[0x1E0DD58A0]();
}

uint64_t WebCore::SWServer::Connection::removeServiceWorkerRegistrationInServer()
{
  return MEMORY[0x1E0DD58A8]();
}

uint64_t WebCore::SWServer::Connection::Connection()
{
  return MEMORY[0x1E0DD58B0]();
}

void WebCore::SWServer::Connection::~Connection(WebCore::SWServer::Connection *this)
{
  MEMORY[0x1E0DD58B8](this);
}

uint64_t WebCore::SWServer::scheduleJob()
{
  return MEMORY[0x1E0DD58C0]();
}

uint64_t WebCore::SWServer::addConnection()
{
  return MEMORY[0x1E0DD58C8]();
}

uint64_t WebCore::SWServer::getAllOrigins()
{
  return MEMORY[0x1E0DD58D0]();
}

uint64_t WebCore::SWServer::setInspectable()
{
  return MEMORY[0x1E0DD58D8]();
}

uint64_t WebCore::SWServer::getRegistration()
{
  return MEMORY[0x1E0DD58E0]();
}

uint64_t WebCore::SWServer::gatherClientData()
{
  return MEMORY[0x1E0DD58E8]();
}

uint64_t WebCore::SWServer::getRegistrations(WebCore::SWServer *this, const WebCore::SecurityOriginData *a2, const WTF::URL *a3)
{
  return MEMORY[0x1E0DD58F0](this, a2, a3);
}

uint64_t WebCore::SWServer::removeConnection()
{
  return MEMORY[0x1E0DD58F8]();
}

uint64_t WebCore::SWServer::processPushMessage()
{
  return MEMORY[0x1E0DD5900]();
}

uint64_t WebCore::SWServer::addContextConnection(WebCore::SWServer *this, WebCore::SWServerToContextConnection *a2)
{
  return MEMORY[0x1E0DD5908](this, a2);
}

uint64_t WebCore::SWServer::backgroundFetchEngine(WebCore::SWServer *this)
{
  return MEMORY[0x1E0DD5910](this);
}

uint64_t WebCore::SWServer::scheduleUnregisterJob()
{
  return MEMORY[0x1E0DD5918]();
}

uint64_t WebCore::SWServer::whenImportIsCompleted()
{
  return MEMORY[0x1E0DD5920]();
}

uint64_t WebCore::SWServer::forEachClientForOrigin()
{
  return MEMORY[0x1E0DD5928]();
}

uint64_t WebCore::SWServer::handleLowMemoryWarning(WebCore::SWServer *this)
{
  return MEMORY[0x1E0DD5930](this);
}

uint64_t WebCore::SWServer::createContextConnection()
{
  return MEMORY[0x1E0DD5938]();
}

uint64_t WebCore::SWServer::removeContextConnection(WebCore::SWServer *this, WebCore::SWServerToContextConnection *a2)
{
  return MEMORY[0x1E0DD5940](this, a2);
}

uint64_t WebCore::SWServer::processNotificationEvent()
{
  return MEMORY[0x1E0DD5948]();
}

uint64_t WebCore::SWServer::storeRegistrationsOnDisk()
{
  return MEMORY[0x1E0DD5950]();
}

uint64_t WebCore::SWServer::didSaveWorkerScriptsToDisk()
{
  return MEMORY[0x1E0DD5958]();
}

uint64_t WebCore::SWServer::getOriginsWithRegistrations()
{
  return MEMORY[0x1E0DD5960]();
}

uint64_t WebCore::SWServer::registerServiceWorkerClient()
{
  return MEMORY[0x1E0DD5968]();
}

uint64_t WebCore::SWServer::runServiceWorkerIfNecessary()
{
  return MEMORY[0x1E0DD5970]();
}

uint64_t WebCore::SWServer::unregisterServiceWorkerClient()
{
  return MEMORY[0x1E0DD5978]();
}

uint64_t WebCore::SWServer::postMessageToServiceWorkerClient()
{
  return MEMORY[0x1E0DD5980]();
}

uint64_t WebCore::SWServer::contextConnectionForRegistrableDomain()
{
  return MEMORY[0x1E0DD5988]();
}

uint64_t WebCore::SWServer::terminateContextConnectionWhenPossible()
{
  return MEMORY[0x1E0DD5990]();
}

uint64_t WebCore::SWServer::releaseServiceWorkerClientPendingMessage()
{
  return MEMORY[0x1E0DD5998]();
}

uint64_t WebCore::SWServer::clear()
{
  return MEMORY[0x1E0DD59A0]();
}

{
  return MEMORY[0x1E0DD59A8]();
}

uint64_t WebCore::SWServer::create()
{
  return MEMORY[0x1E0DD59B0]();
}

uint64_t WebCore::SWServer::clearAll()
{
  return MEMORY[0x1E0DD59B8]();
}

void WebCore::SWServer::~SWServer(WebCore::SWServer *this)
{
  MEMORY[0x1E0DD59C0](this);
}

uint64_t WebCore::Settings::setDefaultFontSize(WebCore::Settings *this, double a2)
{
  return MEMORY[0x1E0DD59C8](this, a2);
}

uint64_t WebCore::Settings::setMinimumFontSize(WebCore::Settings *this, double a2)
{
  return MEMORY[0x1E0DD59D0](this, a2);
}

uint64_t WebCore::Settings::setShowDebugBorders(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD59D8](this);
}

uint64_t WebCore::Settings::setCoreMathMLEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD59E0](this);
}

uint64_t WebCore::Settings::setColorFilterEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD59E8](this);
}

uint64_t WebCore::Settings::setShowRepaintCounter(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD59F0](this);
}

uint64_t WebCore::Settings::setCanvasFiltersEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD59F8](this);
}

uint64_t WebCore::Settings::setDefaultFixedFontSize(WebCore::Settings *this, double a2)
{
  return MEMORY[0x1E0DD5A00](this, a2);
}

uint64_t WebCore::Settings::setUsesBackForwardCache(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A08](this);
}

uint64_t WebCore::Settings::setDNSPrefetchingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A10](this);
}

uint64_t WebCore::Settings::setStorageBlockingPolicy()
{
  return MEMORY[0x1E0DD5A18]();
}

uint64_t WebCore::Settings::setTextAreasAreResizable(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A20](this);
}

uint64_t WebCore::Settings::setTextAutosizingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A28](this);
}

uint64_t WebCore::Settings::setVisualViewportEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A30](this);
}

uint64_t WebCore::Settings::setMinimumLogicalFontSize(WebCore::Settings *this, double a2)
{
  return MEMORY[0x1E0DD5A38](this, a2);
}

uint64_t WebCore::Settings::setUserStyleSheetLocation(WebCore::Settings *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD5A40](this, a2);
}

uint64_t WebCore::Settings::setLoadsImagesAutomatically(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A48](this);
}

uint64_t WebCore::Settings::setAcceleratedFiltersEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A50](this);
}

uint64_t WebCore::Settings::setMockCaptureDevicesEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A58](this);
}

uint64_t WebCore::Settings::setAsyncFrameScrollingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A60](this);
}

uint64_t WebCore::Settings::setAuthorAndUserStylesEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A68](this);
}

uint64_t WebCore::Settings::setLayerBasedSVGEngineEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A70](this);
}

uint64_t WebCore::Settings::setResourceUsageOverlayVisible(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A78](this);
}

uint64_t WebCore::Settings::setICECandidateFilteringEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A80](this);
}

uint64_t WebCore::Settings::setAcceleratedCompositingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A88](this);
}

uint64_t WebCore::Settings::setAsyncOverflowScrollingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A90](this);
}

uint64_t WebCore::Settings::setCSSWordBreakAutoPhraseEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5A98](this);
}

uint64_t WebCore::Settings::setGraphicsContextFiltersEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AA0](this);
}

uint64_t WebCore::Settings::setShouldAllowUserInstalledFonts(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AA8](this);
}

uint64_t WebCore::Settings::setShouldEnableTextAutosizingBoost(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AB8](this);
}

uint64_t WebCore::Settings::setBackgroundShouldExtendBeyondPage(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AC0](this);
}

uint64_t WebCore::Settings::setTextAutosizingUsesIdempotentMode(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AC8](this);
}

uint64_t WebCore::Settings::setPunchOutWhiteBackgroundsInDarkMode(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AD0](this);
}

uint64_t WebCore::Settings::setScrollingPerformanceTestingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AD8](this);
}

uint64_t WebCore::Settings::disableUnstableFeaturesForModernWebKit(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AE0](this);
}

uint64_t WebCore::Settings::setHiddenPageDOMTimerThrottlingEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AE8](this);
}

uint64_t WebCore::Settings::setLayoutViewportHeightExpansionFactor(WebCore::Settings *this, double a2)
{
  return MEMORY[0x1E0DD5AF0](this, a2);
}

uint64_t WebCore::Settings::setLegacyOverflowScrollingTouchEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5AF8](this);
}

uint64_t WebCore::Settings::setLegacyLineLayoutVisualCoverageEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5B00](this);
}

uint64_t WebCore::Settings::setHiddenPageCSSAnimationSuspensionEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5B08](this);
}

uint64_t WebCore::Settings::disableGlobalUnstableFeaturesForModernWebKit(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5B10](this);
}

uint64_t WebCore::Settings::setHiddenPageDOMTimerThrottlingAutoIncreases(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5B18](this);
}

uint64_t WebCore::Settings::setSampleBufferContentKeySessionSupportEnabled(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD5B20](this);
}

uint64_t WebCore::contains()
{
  return MEMORY[0x1E0DD5B28]();
}

uint64_t WebCore::copyRows(WebCore *this, uint64_t a2, const unsigned __int8 *a3, uint64_t a4, unsigned __int8 *a5)
{
  return MEMORY[0x1E0DD5B30](this, a2, a3, a4, a5);
}

uint64_t WebCore::isReload()
{
  return MEMORY[0x1E0DD5B38]();
}

uint64_t WebCore::midpoint()
{
  return MEMORY[0x1E0DD5B40]();
}

uint64_t WebCore::toString()
{
  return MEMORY[0x1E0DD5B48]();
}

uint64_t WebCore::Animation::Animation(WebCore::Animation *this)
{
  return MEMORY[0x1E0DD5B50](this);
}

void WebCore::Animation::~Animation(WebCore::Animation *this)
{
  MEMORY[0x1E0DD5B58](this);
}

uint64_t WebCore::CSSFilter::create()
{
  return MEMORY[0x1E0DD5B60]();
}

uint64_t WebCore::CSSParser::parseColorWithoutContext(WebCore::CSSParser *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD5B68](this, a2);
}

uint64_t WebCore::CaretBase::computeCaretColor()
{
  return MEMORY[0x1E0DD5B70]();
}

uint64_t WebCore::CookieJar::sameSiteInfo()
{
  return MEMORY[0x1E0DD5B78]();
}

uint64_t WebCore::CookieJar::shouldIncludeSecureCookies(WebCore::CookieJar *this, const WebCore::Document *a2, const WTF::URL *a3)
{
  return MEMORY[0x1E0DD5B80](this, a2, a3);
}

uint64_t WebCore::CookieJar::CookieJar()
{
  return MEMORY[0x1E0DD5B98]();
}

void WebCore::CookieJar::~CookieJar(WebCore::CookieJar *this)
{
  MEMORY[0x1E0DD5BA0](this);
}

uint64_t WebCore::DragImage::DragImage()
{
  return MEMORY[0x1E0DD5BA8]();
}

void WebCore::DragImage::~DragImage(WebCore::DragImage *this)
{
  MEMORY[0x1E0DD5BB0](this);
}

uint64_t WebCore::FloatRect::scale(WebCore::FloatRect *this, float a2, float a3)
{
  return MEMORY[0x1E0DD5BB8](this, a2, a3);
}

uint64_t WebCore::FloatRect::unite(WebCore::FloatRect *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD5BC0](this, a2);
}

uint64_t WebCore::FloatRect::intersect(WebCore::FloatRect *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD5BC8](this, a2);
}

uint64_t WebCore::FloatRect::FloatRect(WebCore::FloatRect *this, const CGRect *a2)
{
  return MEMORY[0x1E0DD5BD0](this, a2);
}

uint64_t WebCore::FloatRect::FloatRect(WebCore::FloatRect *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD5BD8](this, a2);
}

uint64_t WebCore::FloatSize::FloatSize(WebCore::FloatSize *this, const CGSize *a2)
{
  return MEMORY[0x1E0DD5BE0](this, a2);
}

uint64_t WebCore::FontCache::invalidateAllFontCaches()
{
  return MEMORY[0x1E0DD5C00]();
}

uint64_t WebCore::FrameTree::removeChild(WebCore::FrameTree *this, WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD5C10](this, a2);
}

uint64_t WebCore::FrameTree::setSpecifiedName(WebCore::FrameTree *this, const AtomString *a2)
{
  return MEMORY[0x1E0DD5C18](this, a2);
}

uint64_t WebCore::FrameTree::clearName(WebCore::FrameTree *this)
{
  return MEMORY[0x1E0DD5C20](this);
}

uint64_t WebCore::IDBClient::IDBConnectionProxy::deref(WebCore::IDBClient::IDBConnectionProxy *this)
{
  return MEMORY[0x1E0DD6250](this);
}

void WebCore::IDBClient::IDBConnectionProxy::operator delete(void *a1)
{
  MEMORY[0x1E0DD6258](a1);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didGetCount(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6260](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didPutOrAdd(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6268](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didGetRecord(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6270](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didOpenCursor(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6278](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didCreateIndex(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6280](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didDeleteIndex(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6288](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didRenameIndex(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6290](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didDeleteRecord(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD6298](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didOpenDatabase(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62A0](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didGetAllRecords(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62A8](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didIterateCursor(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62B0](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didDeleteDatabase(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62B8](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didCloseFromServer()
{
  return MEMORY[0x1E0DD62C0]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didAbortTransaction()
{
  return MEMORY[0x1E0DD62C8]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didClearObjectStore(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62D0](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didStartTransaction()
{
  return MEMORY[0x1E0DD62D8]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didCommitTransaction()
{
  return MEMORY[0x1E0DD62E0]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didCreateObjectStore(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62E8](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didDeleteObjectStore(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62F0](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didRenameObjectStore(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResultData *a2)
{
  return MEMORY[0x1E0DD62F8](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::connectionToServerLost()
{
  return MEMORY[0x1E0DD6300]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::fireVersionChangeEvent()
{
  return MEMORY[0x1E0DD6308]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::notifyOpenDBRequestBlocked(WebCore::IDBClient::IDBConnectionToServer *this, const WebCore::IDBResourceIdentifier *a2)
{
  return MEMORY[0x1E0DD6310](this, a2);
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::didGetAllDatabaseNamesAndVersions()
{
  return MEMORY[0x1E0DD6318]();
}

uint64_t WebCore::IDBClient::IDBConnectionToServer::create()
{
  return MEMORY[0x1E0DD6320]();
}

void WebCore::IDBClient::IDBConnectionToServer::operator delete(void *a1)
{
  MEMORY[0x1E0DD6328](a1);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::handleDelete()
{
  return MEMORY[0x1E0DD6330]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::immediateClose(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD6338](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::handleLowMemoryWarning(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD6340](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::openDBRequestCancelled(WebCore::IDBServer::UniqueIDBDatabase *this, const WebCore::IDBResourceIdentifier *a2)
{
  return MEMORY[0x1E0DD6348](this, a2);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::openDatabaseConnection()
{
  return MEMORY[0x1E0DD6350]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::abortActiveTransactions(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD6358](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::tryClose(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD6360](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::UniqueIDBDatabase()
{
  return MEMORY[0x1E0DD6368]();
}

void WebCore::IDBServer::UniqueIDBDatabase::~UniqueIDBDatabase(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  MEMORY[0x1E0DD6370](this);
}

uint64_t WebCore::IDBServer::IDBConnectionToClient::connectionToClientClosed(WebCore::IDBServer::IDBConnectionToClient *this)
{
  return MEMORY[0x1E0DD6378](this);
}

uint64_t WebCore::IDBServer::IDBConnectionToClient::didGetAllDatabaseNamesAndVersions()
{
  return MEMORY[0x1E0DD6380]();
}

uint64_t WebCore::IDBServer::IDBConnectionToClient::create()
{
  return MEMORY[0x1E0DD6388]();
}

uint64_t WebCore::IDBServer::MemoryIDBBackingStore::MemoryIDBBackingStore()
{
  return MEMORY[0x1E0DD6390]();
}

uint64_t WebCore::IDBServer::SQLiteIDBBackingStore::decodeDatabaseName(WebCore::IDBServer::SQLiteIDBBackingStore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6398](this, a2);
}

uint64_t WebCore::IDBServer::SQLiteIDBBackingStore::databasesSizeForDirectory(WebCore::IDBServer::SQLiteIDBBackingStore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD63A0](this, a2);
}

uint64_t WebCore::IDBServer::SQLiteIDBBackingStore::fullDatabasePathForDirectory(WebCore::IDBServer::SQLiteIDBBackingStore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD63A8](this, a2);
}

uint64_t WebCore::IDBServer::SQLiteIDBBackingStore::databaseNameAndVersionFromFile(WebCore::IDBServer::SQLiteIDBBackingStore *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD63B0](this, a2);
}

uint64_t WebCore::IDBServer::SQLiteIDBBackingStore::SQLiteIDBBackingStore()
{
  return MEMORY[0x1E0DD63B8]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseConnection::establishTransaction()
{
  return MEMORY[0x1E0DD63C0]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseConnection::didFireVersionChangeEvent()
{
  return MEMORY[0x1E0DD63C8]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseConnection::connectionClosedFromClient(WebCore::IDBServer::UniqueIDBDatabaseConnection *this)
{
  return MEMORY[0x1E0DD63D0](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseConnection::didFinishHandlingVersionChange(WebCore::IDBServer::UniqueIDBDatabaseConnection *this, const WebCore::IDBResourceIdentifier *a2)
{
  return MEMORY[0x1E0DD63D8](this, a2);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseConnection::connectionPendingCloseFromClient(WebCore::IDBServer::UniqueIDBDatabaseConnection *this)
{
  return MEMORY[0x1E0DD63E0](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::openCursor()
{
  return MEMORY[0x1E0DD63E8]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::createIndex()
{
  return MEMORY[0x1E0DD63F0]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::deleteIndex()
{
  return MEMORY[0x1E0DD63F8]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::renameIndex()
{
  return MEMORY[0x1E0DD6400]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::deleteRecord()
{
  return MEMORY[0x1E0DD6408]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::getAllRecords()
{
  return MEMORY[0x1E0DD6410]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::iterateCursor()
{
  return MEMORY[0x1E0DD6418]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::clearObjectStore()
{
  return MEMORY[0x1E0DD6420]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::createObjectStore()
{
  return MEMORY[0x1E0DD6428]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::deleteObjectStore()
{
  return MEMORY[0x1E0DD6430]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::renameObjectStore()
{
  return MEMORY[0x1E0DD6438]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::abortWithoutCallback(WebCore::IDBServer::UniqueIDBDatabaseTransaction *this)
{
  return MEMORY[0x1E0DD6440](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::abort(WebCore::IDBServer::UniqueIDBDatabaseTransaction *this)
{
  return MEMORY[0x1E0DD6448](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::commit(WebCore::IDBServer::UniqueIDBDatabaseTransaction *this)
{
  return MEMORY[0x1E0DD6450](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::getCount()
{
  return MEMORY[0x1E0DD6458]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::putOrAdd()
{
  return MEMORY[0x1E0DD6460]();
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::getRecord()
{
  return MEMORY[0x1E0DD6468]();
}

uint64_t WebCore::IOSurface::moveToPool()
{
  return MEMORY[0x1E0DD6558]();
}

uint64_t WebCore::IOSurface::createImage(WebCore::IOSurface *this, CGContext *a2)
{
  return MEMORY[0x1E0DD6560](this, a2);
}

uint64_t WebCore::IOSurface::maximumSize(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD6568](this);
}

uint64_t WebCore::IOSurface::setVolatile(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD6570](this);
}

uint64_t WebCore::IOSurface::sinkIntoImage()
{
  return MEMORY[0x1E0DD6578]();
}

uint64_t WebCore::IOSurface::setMaximumSize()
{
  return MEMORY[0x1E0DD6580]();
}

uint64_t WebCore::IOSurface::convertToFormat()
{
  return MEMORY[0x1E0DD6588]();
}

uint64_t WebCore::IOSurface::createFromImage(WebCore::IOSurface *this, WebCore::IOSurfacePool *a2, CGImage *a3)
{
  return MEMORY[0x1E0DD6590](this, a2, a3);
}

uint64_t WebCore::IOSurface::createFromSendRight()
{
  return MEMORY[0x1E0DD6598]();
}

uint64_t WebCore::IOSurface::bytesPerRowAlignment(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD65A0](this);
}

uint64_t WebCore::IOSurface::setOwnershipIdentity()
{
  return MEMORY[0x1E0DD65A8]();
}

uint64_t WebCore::IOSurface::createPlatformContext(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD65B0](this);
}

uint64_t WebCore::IOSurface::nameForRenderingPurpose()
{
  return MEMORY[0x1E0DD65B8]();
}

uint64_t WebCore::IOSurface::setBytesPerRowAlignment(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD65C0](this);
}

uint64_t WebCore::IOSurface::createBitmapPlatformContext(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD65C8](this);
}

uint64_t WebCore::IOSurface::allowConversionFromFormatToFormat()
{
  return MEMORY[0x1E0DD65D0]();
}

uint64_t WebCore::IOSurface::create()
{
  return MEMORY[0x1E0DD65D8]();
}

void WebCore::IOSurface::~IOSurface(WebCore::IOSurface *this)
{
  MEMORY[0x1E0DD65E0](this);
}

uint64_t WebCore::IPAddress::fromString(WebCore::IPAddress *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD65E8](this, a2);
}

uint64_t WebCore::LayerPool::LayerPool(WebCore::LayerPool *this)
{
  return MEMORY[0x1E0DD6600](this);
}

void WebCore::LayerPool::~LayerPool(WebCore::LayerPool *this)
{
  MEMORY[0x1E0DD6608](this);
}

uint64_t WebCore::LegacyCDM::createSession()
{
  return MEMORY[0x1E0DD6610]();
}

uint64_t WebCore::LegacyCDM::clearFactories(WebCore::LegacyCDM *this)
{
  return MEMORY[0x1E0DD6618](this);
}

uint64_t WebCore::LegacyCDM::resetFactories(WebCore::LegacyCDM *this)
{
  return MEMORY[0x1E0DD6620](this);
}

uint64_t WebCore::LegacyCDM::supportsKeySystem(WebCore::LegacyCDM *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6628](this, a2);
}

uint64_t WebCore::LegacyCDM::registerCDMFactory()
{
  return MEMORY[0x1E0DD6630]();
}

uint64_t WebCore::LegacyCDM::keySystemSupportsMimeType(WebCore::LegacyCDM *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD6638](this, a2, a3);
}

uint64_t WebCore::LegacyCDM::create(WebCore::LegacyCDM *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6640](this, a2);
}

void WebCore::LegacyCDM::~LegacyCDM(WebCore::LegacyCDM *this)
{
  MEMORY[0x1E0DD6648](this);
}

uint64_t WebCore::MeterPart::create()
{
  return MEMORY[0x1E0DD6670]();
}

uint64_t WebCore::PageGroup::ensureCaptionPreferences(WebCore::PageGroup *this)
{
  return MEMORY[0x1E0DD6678](this);
}

uint64_t WebCore::PageGroup::pageGroup(WebCore::PageGroup *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6680](this, a2);
}

uint64_t WebCore::SVGFilter::mergeEffects()
{
  return MEMORY[0x1E0DD6688]();
}

uint64_t WebCore::SVGFilter::ensureResults()
{
  return MEMORY[0x1E0DD6690]();
}

uint64_t WebCore::SVGFilter::create()
{
  return MEMORY[0x1E0DD6698]();
}

uint64_t WebCore::Scrollbar::setFrameRect(WebCore::Scrollbar *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD66A0](this, a2);
}

uint64_t WebCore::Scrollbar::setProportion(WebCore::Scrollbar *this)
{
  return MEMORY[0x1E0DD66A8](this);
}

uint64_t WebCore::Scrollbar::createNativeScrollbar()
{
  return MEMORY[0x1E0DD66B0]();
}

uint64_t WebCore::Scrollbar::maxOverlapBetweenPages(WebCore::Scrollbar *this)
{
  return MEMORY[0x1E0DD66B8](this);
}

uint64_t WebCore::Scrollbar::setSteps(WebCore::Scrollbar *this)
{
  return MEMORY[0x1E0DD66C0](this);
}

uint64_t WebCore::TimerBase::stopSlowCase(WebCore::TimerBase *this)
{
  return MEMORY[0x1E0DD66D0](this);
}

uint64_t WebCore::TimerBase::start()
{
  return MEMORY[0x1E0DD66D8]();
}

uint64_t WebCore::TimerBase::TimerBase(WebCore::TimerBase *this)
{
  return MEMORY[0x1E0DD66E0](this);
}

void WebCore::TimerBase::~TimerBase(WebCore::TimerBase *this)
{
  MEMORY[0x1E0DD66E8](this);
}

uint64_t WebCore::TreeScope::elementsFromPoint()
{
  return MEMORY[0x1E0DD66F8]();
}

uint64_t WebCore::addMarker()
{
  return MEMORY[0x1E0DD6700]();
}

uint64_t WebCore::endOfLine()
{
  return MEMORY[0x1E0DD6708]();
}

uint64_t WebCore::endOfWord()
{
  return MEMORY[0x1E0DD6710]();
}

uint64_t WebCore::plainText()
{
  return MEMORY[0x1E0DD6718]();
}

uint64_t WebCore::unionRect()
{
  return MEMORY[0x1E0DD6720]();
}

uint64_t WebCore::operator<<()
{
  return MEMORY[0x1E0DD6738]();
}

{
  return MEMORY[0x1E0DD6740]();
}

{
  return MEMORY[0x1E0DD6748]();
}

{
  return MEMORY[0x1E0DD6750]();
}

uint64_t bmalloc::api::isoAllocate()
{
  return MEMORY[0x1E0CC00F8]();
}

uint64_t bmalloc::api::isoDeallocate(bmalloc::api *this, void *a2)
{
  return MEMORY[0x1E0CC0100](this, a2);
}

uint64_t Gigacage::forbidDisablingPrimitiveGigacage(Gigacage *this)
{
  return MEMORY[0x1E0CC0108](this);
}

uint64_t Inspector::AgentRegistry::discardValues(Inspector::AgentRegistry *this)
{
  return MEMORY[0x1E0CC0110](this);
}

uint64_t Inspector::AgentRegistry::didCreateFrontendAndBackend()
{
  return MEMORY[0x1E0CC0118]();
}

uint64_t Inspector::AgentRegistry::willDestroyFrontendAndBackend()
{
  return MEMORY[0x1E0CC0120]();
}

uint64_t Inspector::AgentRegistry::append()
{
  return MEMORY[0x1E0CC0128]();
}

uint64_t Inspector::AgentRegistry::AgentRegistry(Inspector::AgentRegistry *this)
{
  return MEMORY[0x1E0CC0130](this);
}

void Inspector::AgentRegistry::~AgentRegistry(Inspector::AgentRegistry *this)
{
  MEMORY[0x1E0CC0138](this);
}

uint64_t Inspector::FrontendRouter::connectFrontend()
{
  return MEMORY[0x1E0CC0178]();
}

uint64_t Inspector::FrontendRouter::disconnectFrontend()
{
  return MEMORY[0x1E0CC0180]();
}

uint64_t Inspector::FrontendRouter::disconnectAllFrontends(Inspector::FrontendRouter *this)
{
  return MEMORY[0x1E0CC0188](this);
}

uint64_t Inspector::FrontendRouter::create(Inspector::FrontendRouter *this)
{
  return MEMORY[0x1E0CC0190](this);
}

uint64_t Inspector::InspectorTarget::setResumeCallback()
{
  return MEMORY[0x1E0CC01E0]();
}

uint64_t Inspector::InspectorTarget::resume(Inspector::InspectorTarget *this)
{
  return MEMORY[0x1E0CC01E8](this);
}

uint64_t Inspector::RemoteInspector::connectToWebInspector(Inspector::RemoteInspector *this)
{
  return MEMORY[0x1E0CC01F8](this);
}

uint64_t Inspector::RemoteInspector::clientCapabilitiesDidChange(Inspector::RemoteInspector *this)
{
  return MEMORY[0x1E0CC0208](this);
}

uint64_t Inspector::RemoteInspector::setParentProcessInformation()
{
  return MEMORY[0x1E0CC0210]();
}

void Inspector::RemoteInspector::Client::~Client(Inspector::RemoteInspector::Client *this)
{
  MEMORY[0x1E0CC0228](this);
}

uint64_t Inspector::RemoteInspector::setClient(Inspector::RemoteInspector *this, Inspector::RemoteInspector::Client *a2)
{
  return MEMORY[0x1E0CC0230](this, a2);
}

uint64_t Inspector::RemoteInspector::singleton(Inspector::RemoteInspector *this)
{
  return MEMORY[0x1E0CC0238](this);
}

void Inspector::ScriptCallStack::~ScriptCallStack(Inspector::ScriptCallStack *this)
{
  MEMORY[0x1E0CC0258](this);
}

uint64_t Inspector::BackendDispatcher::getBoolean(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC0268](this, a2, a3);
}

uint64_t Inspector::BackendDispatcher::getInteger(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC0270](this, a2, a3);
}

uint64_t Inspector::BackendDispatcher::CallbackBase::sendFailure(Inspector::BackendDispatcher::CallbackBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0278](this, a2);
}

uint64_t Inspector::BackendDispatcher::CallbackBase::sendSuccess()
{
  return MEMORY[0x1E0CC0280]();
}

uint64_t Inspector::BackendDispatcher::CallbackBase::CallbackBase()
{
  return MEMORY[0x1E0CC0288]();
}

uint64_t Inspector::BackendDispatcher::sendResponse()
{
  return MEMORY[0x1E0CC0290]();
}

uint64_t Inspector::BackendDispatcher::reportProtocolError()
{
  return MEMORY[0x1E0CC0298]();
}

uint64_t Inspector::BackendDispatcher::registerDispatcherForDomain()
{
  return MEMORY[0x1E0CC02A0]();
}

uint64_t Inspector::BackendDispatcher::create()
{
  return MEMORY[0x1E0CC02A8]();
}

uint64_t Inspector::BackendDispatcher::dispatch(Inspector::BackendDispatcher *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC02B0](this, a2);
}

uint64_t Inspector::BackendDispatcher::getArray(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC02B8](this, a2, a3);
}

uint64_t Inspector::BackendDispatcher::getDouble(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC02C0](this, a2, a3);
}

uint64_t Inspector::BackendDispatcher::getObject(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC02C8](this, a2, a3);
}

uint64_t Inspector::BackendDispatcher::getString(Inspector::BackendDispatcher *this, WTF::JSONImpl::Object *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC02D0](this, a2, a3);
}

uint64_t Inspector::InspectorTargetAgent::targetCreated(Inspector::InspectorTargetAgent *this, Inspector::InspectorTarget *a2)
{
  return MEMORY[0x1E0CC0370](this, a2);
}

uint64_t Inspector::InspectorTargetAgent::targetDestroyed(Inspector::InspectorTargetAgent *this, Inspector::InspectorTarget *a2)
{
  return MEMORY[0x1E0CC0378](this, a2);
}

uint64_t Inspector::InspectorTargetAgent::didCommitProvisionalTarget(Inspector::InspectorTargetAgent *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC0380](this, a2, a3);
}

uint64_t Inspector::InspectorTargetAgent::sendMessageFromTargetToFrontend(Inspector::InspectorTargetAgent *this, const WTF::String *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0CC0388](this, a2, a3);
}

uint64_t Inspector::InspectorTargetAgent::InspectorTargetAgent(Inspector::InspectorTargetAgent *this, Inspector::FrontendRouter *a2, Inspector::BackendDispatcher *a3)
{
  return MEMORY[0x1E0CC0390](this, a2, a3);
}

uint64_t Inspector::createScriptCallStack()
{
  return MEMORY[0x1E0CC0528]();
}

uint64_t Inspector::RemoteAutomationTarget::setIsPaired(Inspector::RemoteAutomationTarget *this)
{
  return MEMORY[0x1E0CC0658](this);
}

void Inspector::RemoteAutomationTarget::~RemoteAutomationTarget(Inspector::RemoteAutomationTarget *this)
{
  MEMORY[0x1E0CC0660](this);
}

uint64_t Inspector::RemoteInspectionTarget::setInspectable(Inspector::RemoteInspectionTarget *this)
{
  return MEMORY[0x1E0CC0668](this);
}

uint64_t Inspector::RemoteInspectionTarget::setPresentingApplicationPID()
{
  return MEMORY[0x1E0CC0670]();
}

uint64_t Inspector::BrowserBackendDispatcher::create()
{
  return MEMORY[0x1E0CC0698]();
}

uint64_t Inspector::RemoteControllableTarget::init(Inspector::RemoteControllableTarget *this)
{
  return MEMORY[0x1E0CC0720](this);
}

uint64_t Inspector::RemoteControllableTarget::update(Inspector::RemoteControllableTarget *this)
{
  return MEMORY[0x1E0CC0728](this);
}

void Inspector::RemoteControllableTarget::~RemoteControllableTarget(Inspector::RemoteControllableTarget *this)
{
  MEMORY[0x1E0CC0730](this);
}

uint64_t Inspector::BrowserFrontendDispatcher::extensionsEnabled()
{
  return MEMORY[0x1E0CC0758]();
}

uint64_t Inspector::BrowserFrontendDispatcher::extensionsDisabled()
{
  return MEMORY[0x1E0CC0760]();
}

uint64_t Inspector::SupplementalBackendDispatcher::SupplementalBackendDispatcher(Inspector::SupplementalBackendDispatcher *this, Inspector::BackendDispatcher *a2)
{
  return MEMORY[0x1E0CC0918](this, a2);
}

void Inspector::SupplementalBackendDispatcher::~SupplementalBackendDispatcher(Inspector::SupplementalBackendDispatcher *this)
{
  MEMORY[0x1E0CC0920](this);
}

void Inspector::BrowserBackendDispatcherHandler::~BrowserBackendDispatcherHandler(Inspector::BrowserBackendDispatcherHandler *this)
{
  MEMORY[0x1E0CC0948](this);
}

uint64_t OpaqueJSString::string(OpaqueJSString *this)
{
  return MEMORY[0x1E0CC0A30](this);
}

uint64_t JSC::PropertySlot::customGetter()
{
  return MEMORY[0x1E0CC0A60]();
}

uint64_t JSC::PropertySlot::functionGetter()
{
  return MEMORY[0x1E0CC0A68]();
}

uint64_t JSC::Yarr::RegularExpression::match()
{
  return MEMORY[0x1E0CC0AE0]();
}

uint64_t JSC::JSObject::hasProperty()
{
  return MEMORY[0x1E0CC0B40]();
}

uint64_t JSC::Profiler::Database::toJSON(JSC::Profiler::Database *this)
{
  return MEMORY[0x1E0CC0B50](this);
}

uint64_t PAL::TextEncoding::decode()
{
  return MEMORY[0x1E0DD6758]();
}

uint64_t WTF::StringImpl::startsWith()
{
  return MEMORY[0x1E0CC0B98]();
}

{
  return MEMORY[0x1E0CC0BA0]();
}

uint64_t WTF::StringImpl::hashSlowCase(WTF::StringImpl *this)
{
  return MEMORY[0x1E0CC0BA8](this);
}

uint64_t WTF::StringImpl::endsWithIgnoringASCIICase()
{
  return MEMORY[0x1E0CC0BC0]();
}

uint64_t WTF::StringView::startsWith()
{
  return MEMORY[0x1E0CC0BE0]();
}

uint64_t WTF::StringView::createNSString(WTF::StringView *this)
{
  return MEMORY[0x1E0CC0BF0](this);
}

uint64_t WTF::StringView::convertToASCIILowercase(WTF::StringView *this)
{
  return MEMORY[0x1E0CC0C18](this);
}

uint64_t WTF::StringView::endsWithIgnoringASCIICase()
{
  return MEMORY[0x1E0CC0C28]();
}

uint64_t WTF::StringView::getCharactersWithASCIICase()
{
  return MEMORY[0x1E0CC0C30]();
}

{
  return MEMORY[0x1E0CC0C38]();
}

uint64_t WTF::StringView::createNSStringWithoutCopying(WTF::StringView *this)
{
  return MEMORY[0x1E0CC0C58](this);
}

uint64_t WTF::StringView::find()
{
  return MEMORY[0x1E0CC0C68]();
}

uint64_t WTF::StringView::utf8()
{
  return MEMORY[0x1E0CC0C70]();
}

uint64_t WTF::StringView::endsWith()
{
  return MEMORY[0x1E0CC0C78]();
}

{
  return MEMORY[0x1E0CC0C80]();
}

uint64_t WTF::ASCIILiteral::createNSString(WTF::ASCIILiteral *this)
{
  return MEMORY[0x1E0CC0C88](this);
}

uint64_t WTF::MonotonicTime::toMachAbsoluteTime(WTF::MonotonicTime *this)
{
  return MEMORY[0x1E0CC0C98](this);
}

uint64_t WTF::MonotonicTime::approximateWallTime(WTF::MonotonicTime *this)
{
  return MEMORY[0x1E0CC0CA0](this);
}

uint64_t WTF::StringBuilder::reifyString(WTF::StringBuilder *this)
{
  return MEMORY[0x1E0CC0CA8](this);
}

uint64_t WTF::TimeWithDynamicClockType::nowWithSameClock(WTF::TimeWithDynamicClockType *this)
{
  return MEMORY[0x1E0CC0CD0](this);
}

uint64_t WTF::TimeWithDynamicClockType::operator<()
{
  return MEMORY[0x1E0CC0CD8]();
}

uint64_t WTF::URL::protocolIs()
{
  return MEMORY[0x1E0CC0CE0]();
}

uint64_t WTF::URL::createCFURL(WTF::URL *this)
{
  return MEMORY[0x1E0CC0CE8](this);
}

uint64_t WTF::URL::hostAndPort(WTF::URL *this)
{
  return MEMORY[0x1E0CC0CF8](this);
}

uint64_t WTF::URL::isAboutBlank(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D00](this);
}

uint64_t WTF::URL::fileSystemPath(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D10](this);
}

uint64_t WTF::URL::hasSpecialScheme(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D28](this);
}

uint64_t WTF::URL::lastPathComponent(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D30](this);
}

uint64_t WTF::URL::fragmentIdentifier(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D38](this);
}

uint64_t WTF::URL::protocolHostAndPort(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D40](this);
}

uint64_t WTF::URL::protocolIsJavaScript(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D48](this);
}

uint64_t WTF::URL::truncatedForUseAsBase(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D50](this);
}

uint64_t WTF::URL::stringCenterEllipsizedToLength(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D70](this);
}

uint64_t WTF::URL::stringWithoutFragmentIdentifier(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D78](this);
}

uint64_t WTF::URL::viewWithoutQueryOrFragmentIdentifier(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D80](this);
}

uint64_t WTF::URL::host(WTF::URL *this)
{
  return MEMORY[0x1E0CC0D98](this);
}

uint64_t WTF::URL::path(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DA0](this);
}

uint64_t WTF::URL::port(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DA8](this);
}

uint64_t WTF::URL::user(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DB0](this);
}

uint64_t WTF::URL::query(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DB8](this);
}

uint64_t WTF::URL::password(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DC0](this);
}

uint64_t WTF::URL::protocol(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DC8](this);
}

uint64_t WTF::URL::pathStart(WTF::URL *this)
{
  return MEMORY[0x1E0CC0DD0](this);
}

uint64_t WTF::URL::operator NSURL *()
{
  return MEMORY[0x1E0CC0DD8]();
}

uint64_t WTF::UUID::toString(WTF::UUID *this)
{
  return MEMORY[0x1E0CC0DE0](this);
}

uint64_t WTF::UUID::operator NSUUID *()
{
  return MEMORY[0x1E0CC0DE8]();
}

uint64_t WTF::Logger::LogSiteIdentifier::toString(WTF::Logger::LogSiteIdentifier *this)
{
  return MEMORY[0x1E0CC0DF0](this);
}

uint64_t WTF::String::createCFString(WTF::String *this)
{
  return MEMORY[0x1E0CC0DF8](this);
}

uint64_t WTF::String::convertToASCIILowercase(WTF::String *this)
{
  return MEMORY[0x1E0CC0E18](this);
}

uint64_t WTF::String::convertToASCIIUppercase(WTF::String *this)
{
  return MEMORY[0x1E0CC0E20](this);
}

uint64_t WTF::String::trim()
{
  return MEMORY[0x1E0CC0E58]();
}

uint64_t WTF::String::utf8()
{
  return MEMORY[0x1E0CC0E60]();
}

uint64_t WTF::String::ascii(WTF::String *this)
{
  return MEMORY[0x1E0CC0E68](this);
}

uint64_t WTF::String::split()
{
  return MEMORY[0x1E0CC0E70]();
}

{
  return MEMORY[0x1E0CC0E78]();
}

uint64_t WTF::String::latin1(WTF::String *this)
{
  return MEMORY[0x1E0CC0E88](this);
}

uint64_t WTF::String::toDouble(WTF::String *this, BOOL *a2)
{
  return MEMORY[0x1E0CC0EA0](this, a2);
}

uint64_t WTF::RunLoop::TimerBase::secondsUntilFire(WTF::RunLoop::TimerBase *this)
{
  return MEMORY[0x1E0CC0EB0](this);
}

uint64_t WTF::RunLoop::TimerBase::isActive(WTF::RunLoop::TimerBase *this)
{
  return MEMORY[0x1E0CC0EB8](this);
}

uint64_t WTF::RunLoop::isCurrent(WTF::RunLoop *this)
{
  return MEMORY[0x1E0CC0EC0](this);
}

uint64_t WTF::JSONImpl::ObjectBase::getBoolean(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0EE0](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getInteger(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0EE8](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getArray(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0EF0](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getDouble(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0F00](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getObject(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0F08](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getString(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC0F10](this, a2);
}

uint64_t WTF::JSONImpl::Value::toJSONString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x1E0CC0F28](this);
}

uint64_t WTF::JSONImpl::Value::asString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x1E0CC0F38](this);
}

uint64_t WTF::JSONImpl::ArrayBase::get(WTF::JSONImpl::ArrayBase *this)
{
  return MEMORY[0x1E0CC0F58](this);
}

uint64_t WTF::WallTime::approximateMonotonicTime(WTF::WallTime *this)
{
  return MEMORY[0x1E0CC0F60](this);
}

uint64_t WTF::MediaTime::toJSONString(WTF::MediaTime *this)
{
  return MEMORY[0x1E0CC0F80](this);
}

uint64_t WTF::MediaTime::compare(WTF::MediaTime *this, const WTF::MediaTime *a2)
{
  return MEMORY[0x1E0CC0F90](this, a2);
}

uint64_t WTF::MediaTime::toDouble(WTF::MediaTime *this)
{
  return MEMORY[0x1E0CC0F98](this);
}

uint64_t WTF::MediaTime::operator-()
{
  return MEMORY[0x1E0CC0FB8]();
}

uint64_t WTF::MediaTime::operator+()
{
  return MEMORY[0x1E0CC0FD8]();
}

uint64_t WTF::WorkQueue::ref(WTF::WorkQueue *this)
{
  return MEMORY[0x1E0CC0FE0](this);
}

uint64_t WTF::WorkQueue::deref(WTF::WorkQueue *this)
{
  return MEMORY[0x1E0CC0FE8](this);
}

uint64_t rtc::SocketAddress::IsUnresolvedIP(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDBF8](this);
}

uint64_t rtc::SocketAddress::HostAsURIString(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDC00](this);
}

uint64_t rtc::SocketAddress::Hash(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDC08](this);
}

uint64_t rtc::SocketAddress::port(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDC10](this);
}

uint64_t rtc::SocketAddress::IsNil(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDC18](this);
}

uint64_t rtc::SocketAddress::ipaddr(rtc::SocketAddress *this)
{
  return MEMORY[0x1E0DCDC20](this);
}

uint64_t rtc::SocketAddress::operator==()
{
  return MEMORY[0x1E0DCDC28]();
}

uint64_t rtc::IPAddress::ipv4_address(rtc::IPAddress *this)
{
  return MEMORY[0x1E0DCDC58](this);
}

uint64_t rtc::IPAddress::ipv6_address(rtc::IPAddress *this)
{
  return MEMORY[0x1E0DCDC60](this);
}

uint64_t rtc::IPAddress::IsNil(rtc::IPAddress *this)
{
  return MEMORY[0x1E0DCDC68](this);
}

uint64_t rtc::IPAddress::ToString(rtc::IPAddress *this)
{
  return MEMORY[0x1E0DCDC70](this);
}

uint64_t rtc::IPAddress::operator==()
{
  return MEMORY[0x1E0DCDC78]();
}

uint64_t rtc::IPAddress::operator!=()
{
  return MEMORY[0x1E0DCDC80]();
}

uint64_t apdu::ApduCommand::getEncodedCommand(apdu::ApduCommand *this)
{
  return MEMORY[0x1E0DD6768](this);
}

uint64_t cbor::CBORValue::getInteger(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6770](this);
}

uint64_t cbor::CBORValue::getByteString(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6778](this);
}

uint64_t cbor::CBORValue::clone(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6780](this);
}

uint64_t cbor::CBORValue::getMap(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6788](this);
}

uint64_t cbor::CBORValue::getBool(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6790](this);
}

uint64_t cbor::CBORValue::getArray(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD6798](this);
}

uint64_t cbor::CBORValue::getString(cbor::CBORValue *this)
{
  return MEMORY[0x1E0DD67A0](this);
}

uint64_t fido::FidoHidMessage::numPackets(fido::FidoHidMessage *this)
{
  return MEMORY[0x1E0DD67A8](this);
}

uint64_t fido::FidoHidMessage::messageComplete(fido::FidoHidMessage *this)
{
  return MEMORY[0x1E0DD67B0](this);
}

uint64_t fido::FidoHidMessage::getMessagePayload(fido::FidoHidMessage *this)
{
  return MEMORY[0x1E0DD67B8](this);
}

uint64_t fido::FidoHidInitPacket::getSerializedData(fido::FidoHidInitPacket *this)
{
  return MEMORY[0x1E0DD67C0](this);
}

uint64_t fido::FidoHidContinuationPacket::getSerializedData(fido::FidoHidContinuationPacket *this)
{
  return MEMORY[0x1E0DD67C8](this);
}

uint64_t fido::pin::TokenRequest::sharedKey(fido::pin::TokenRequest *this)
{
  return MEMORY[0x1E0DD67D0](this);
}

uint64_t fido::pin::TokenResponse::pinAuth()
{
  return MEMORY[0x1E0DD67D8]();
}

uint64_t webrtc::VideoFrame::video_frame_buffer(webrtc::VideoFrame *this)
{
  return MEMORY[0x1E0DCDCA8](this);
}

uint64_t WebCore::Credential::nsCredential(WebCore::Credential *this)
{
  return MEMORY[0x1E0DD67E0](this);
}

uint64_t WebCore::Credential::ipcData(WebCore::Credential *this)
{
  return MEMORY[0x1E0DD67E8](this);
}

uint64_t WebCore::Credential::isEmpty(WebCore::Credential *this)
{
  return MEMORY[0x1E0DD67F0](this);
}

uint64_t WebCore::FileHandle::handle(WebCore::FileHandle *this)
{
  return MEMORY[0x1E0DD67F8](this);
}

uint64_t WebCore::FloatPoint::constrainedBetween(WebCore::FloatPoint *this, const WebCore::FloatPoint *a2, const WebCore::FloatPoint *a3)
{
  return MEMORY[0x1E0DD6800](this, a2, a3);
}

uint64_t WebCore::FloatPoint::operator CGPoint()
{
  return MEMORY[0x1E0DD6808]();
}

uint64_t WebCore::LocalFrame::contentRenderer(WebCore::LocalFrame *this)
{
  return MEMORY[0x1E0DD6830](this);
}

uint64_t WebCore::LocalFrame::frameScaleFactor(WebCore::LocalFrame *this)
{
  return MEMORY[0x1E0DD6840](this);
}

uint64_t WebCore::LocalFrame::visiblePositionForPoint(WebCore::LocalFrame *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6858](this, a2);
}

uint64_t WebCore::LocalFrame::displayStringModifiedByEncoding(WebCore::LocalFrame *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6878](this, a2);
}

uint64_t WebCore::LocalFrame::window(WebCore::LocalFrame *this)
{
  return MEMORY[0x1E0DD6880](this);
}

uint64_t WebCore::PluginData::supportsMimeType()
{
  return MEMORY[0x1E0DD6888]();
}

uint64_t WebCore::PluginData::webVisibleMimeTypes(WebCore::PluginData *this)
{
  return MEMORY[0x1E0DD6890](this);
}

uint64_t WebCore::PluginData::supportsWebVisibleMimeType()
{
  return MEMORY[0x1E0DD6898]();
}

uint64_t WebCore::PluginData::supportsWebVisibleMimeTypeForURL()
{
  return MEMORY[0x1E0DD68A0]();
}

uint64_t WebCore::RenderView::usesCompositing(WebCore::RenderView *this)
{
  return MEMORY[0x1E0DD68B8](this);
}

uint64_t WebCore::RenderView::unscaledDocumentRect(WebCore::RenderView *this)
{
  return MEMORY[0x1E0DD68C0](this);
}

uint64_t WebCore::ScrollView::contentsSize(WebCore::ScrollView *this)
{
  return MEMORY[0x1E0DD68D0](this);
}

uint64_t WebCore::ScrollView::scrollbarModes()
{
  return MEMORY[0x1E0DD68E0]();
}

uint64_t WebCore::ScrollView::fixedLayoutSize(WebCore::ScrollView *this)
{
  return MEMORY[0x1E0DD68F0](this);
}

uint64_t WebCore::ScrollView::contentsToScreen(WebCore::ScrollView *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD68F8](this, a2);
}

uint64_t WebCore::ScrollView::contentsToWindow(WebCore::ScrollView *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD6900](this, a2);
}

uint64_t WebCore::ScrollView::contentsToWindow(WebCore::ScrollView *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6908](this, a2);
}

uint64_t WebCore::ScrollView::windowToContents(WebCore::ScrollView *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD6910](this, a2);
}

uint64_t WebCore::ScrollView::windowToContents(WebCore::ScrollView *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6918](this, a2);
}

uint64_t WebCore::ScrollView::contentsToRootView(WebCore::ScrollView *this, const WebCore::FloatPoint *a2)
{
  return MEMORY[0x1E0DD6920](this, a2);
}

uint64_t WebCore::ScrollView::contentsToRootView(WebCore::ScrollView *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD6928](this, a2);
}

uint64_t WebCore::ScrollView::contentsToRootView(WebCore::ScrollView *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6930](this, a2);
}

uint64_t WebCore::ScrollView::contentsToRootView(WebCore::ScrollView *this, const FloatQuad *a2)
{
  return MEMORY[0x1E0DD6938](this, a2);
}

uint64_t WebCore::ScrollView::contentsToRootView(WebCore::ScrollView *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD6940](this, a2);
}

uint64_t WebCore::ScrollView::exposedContentRect(WebCore::ScrollView *this)
{
  return MEMORY[0x1E0DD6948](this);
}

uint64_t WebCore::ScrollView::rootViewToContents(WebCore::ScrollView *this, const WebCore::FloatPoint *a2)
{
  return MEMORY[0x1E0DD6950](this, a2);
}

uint64_t WebCore::ScrollView::rootViewToContents(WebCore::ScrollView *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6958](this, a2);
}

uint64_t WebCore::ScrollView::rootViewToContents(WebCore::ScrollView *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD6960](this, a2);
}

uint64_t WebCore::ScrollView::unobscuredContentRect()
{
  return MEMORY[0x1E0DD6968]();
}

uint64_t WebCore::ScrollView::unobscuredContentSize(WebCore::ScrollView *this)
{
  return MEMORY[0x1E0DD6970](this);
}

uint64_t WebCore::ScrollView::contentsScrollPosition(WebCore::ScrollView *this)
{
  return MEMORY[0x1E0DD6978](this);
}

uint64_t WebCore::SeekTarget::toString(WebCore::SeekTarget *this)
{
  return MEMORY[0x1E0DD6980](this);
}

uint64_t WebCore::StorageMap::length(WebCore::StorageMap *this)
{
  return MEMORY[0x1E0DD6988](this);
}

uint64_t WebCore::StorageMap::getItem(WebCore::StorageMap *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6990](this, a2);
}

uint64_t WebCore::StorageMap::contains(WebCore::StorageMap *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD6998](this, a2);
}

uint64_t WebCore::TimeRanges::length(WebCore::TimeRanges *this)
{
  return MEMORY[0x1E0DD69B0](this);
}

uint64_t WebCore::CachedImage::imageSizeForRenderer()
{
  return MEMORY[0x1E0DD69C0]();
}

uint64_t WebCore::CachedImage::image(WebCore::CachedImage *this)
{
  return MEMORY[0x1E0DD69C8](this);
}

uint64_t WebCore::ContentType::toJSONString(WebCore::ContentType *this)
{
  return MEMORY[0x1E0DD69D0](this);
}

uint64_t WebCore::ControlPart::controlFactory(WebCore::ControlPart *this)
{
  return MEMORY[0x1E0DD69D8](this);
}

uint64_t WebCore::DataSegment::data(WebCore::DataSegment *this)
{
  return MEMORY[0x1E0DD69E0](this);
}

uint64_t WebCore::DataSegment::size(WebCore::DataSegment *this)
{
  return MEMORY[0x1E0DD69E8](this);
}

uint64_t WebCore::DisplayList::DrawGlyphs::apply(WebCore::DisplayList::DrawGlyphs *this, WebCore::GraphicsContext *a2, const WebCore::Font *a3)
{
  return MEMORY[0x1E0DD69F0](this, a2, a3);
}

uint64_t WebCore::DisplayList::SetLineCap::apply(WebCore::DisplayList::SetLineCap *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD69F8](this, a2);
}

uint64_t WebCore::DisplayList::StrokeLine::apply(WebCore::DisplayList::StrokeLine *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A00](this, a2);
}

uint64_t WebCore::DisplayList::StrokePath::apply(WebCore::DisplayList::StrokePath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A08](this, a2);
}

uint64_t WebCore::DisplayList::StrokeRect::apply(WebCore::DisplayList::StrokeRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A10](this, a2);
}

uint64_t WebCore::DisplayList::DrawEllipse::apply(WebCore::DisplayList::DrawEllipse *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A18](this, a2);
}

uint64_t WebCore::DisplayList::DrawPattern::apply(WebCore::DisplayList::DrawPattern *this, WebCore::GraphicsContext *a2, WebCore::SourceImage *a3)
{
  return MEMORY[0x1E0DD6A20](this, a2, a3);
}

uint64_t WebCore::DisplayList::FillEllipse::apply(WebCore::DisplayList::FillEllipse *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A28](this, a2);
}

uint64_t WebCore::DisplayList::SetLineDash::apply(WebCore::DisplayList::SetLineDash *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A30](this, a2);
}

uint64_t WebCore::DisplayList::SetLineJoin::apply(WebCore::DisplayList::SetLineJoin *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A38](this, a2);
}

uint64_t WebCore::DisplayList::ClipOutToPath::apply(WebCore::DisplayList::ClipOutToPath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A40](this, a2);
}

uint64_t WebCore::DisplayList::FillClosedArc::apply(WebCore::DisplayList::FillClosedArc *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A48](this, a2);
}

uint64_t WebCore::DisplayList::FillQuadCurve::apply(WebCore::DisplayList::FillQuadCurve *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A50](this, a2);
}

uint64_t WebCore::DisplayList::SetMiterLimit::apply(WebCore::DisplayList::SetMiterLimit *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A58](this, a2);
}

uint64_t WebCore::DisplayList::StrokeEllipse::apply(WebCore::DisplayList::StrokeEllipse *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A60](this, a2);
}

uint64_t WebCore::DisplayList::ConcatenateCTM::apply(WebCore::DisplayList::ConcatenateCTM *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A68](this, a2);
}

uint64_t WebCore::DisplayList::ClearDropShadow::apply(WebCore::DisplayList::ClearDropShadow *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A70](this, a2);
}

uint64_t WebCore::DisplayList::ClipRoundedRect::apply(WebCore::DisplayList::ClipRoundedRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A78](this, a2);
}

uint64_t WebCore::DisplayList::DrawControlPart::apply(WebCore::DisplayList::DrawControlPart *this, WebCore::GraphicsContext *a2, WebCore::ControlFactory *a3)
{
  return MEMORY[0x1E0DD6A80](this, a2, a3);
}

uint64_t WebCore::DisplayList::DrawImageBuffer::apply(WebCore::DisplayList::DrawImageBuffer *this, WebCore::GraphicsContext *a2, WebCore::ImageBuffer *a3)
{
  return MEMORY[0x1E0DD6A88](this, a2, a3);
}

uint64_t WebCore::DisplayList::DrawNativeImage::apply()
{
  return MEMORY[0x1E0DD6A90]();
}

uint64_t WebCore::DisplayList::DrawSystemImage::apply(WebCore::DisplayList::DrawSystemImage *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6A98](this, a2);
}

uint64_t WebCore::DisplayList::FillBezierCurve::apply(WebCore::DisplayList::FillBezierCurve *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AA0](this, a2);
}

uint64_t WebCore::DisplayList::FillPathSegment::apply(WebCore::DisplayList::FillPathSegment *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AA8](this, a2);
}

uint64_t WebCore::DisplayList::FillRoundedRect::apply(WebCore::DisplayList::FillRoundedRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AB0](this, a2);
}

uint64_t WebCore::DisplayList::SetInlineStroke::apply(WebCore::DisplayList::SetInlineStroke *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AB8](this, a2);
}

uint64_t WebCore::DisplayList::StrokeClosedArc::apply(WebCore::DisplayList::StrokeClosedArc *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AC0](this, a2);
}

uint64_t WebCore::DisplayList::StrokeQuadCurve::apply(WebCore::DisplayList::StrokeQuadCurve *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AC8](this, a2);
}

uint64_t WebCore::DisplayList::ApplyFillPattern::apply(WebCore::DisplayList::ApplyFillPattern *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AD0](this, a2);
}

uint64_t WebCore::DisplayList::DrawLinesForText::apply(WebCore::DisplayList::DrawLinesForText *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AD8](this, a2);
}

uint64_t WebCore::DisplayList::ClipToImageBuffer::apply(WebCore::DisplayList::ClipToImageBuffer *this, WebCore::GraphicsContext *a2, WebCore::ImageBuffer *a3)
{
  return MEMORY[0x1E0DD6AE0](this, a2, a3);
}

uint64_t WebCore::DisplayList::DrawFocusRingPath::apply(WebCore::DisplayList::DrawFocusRingPath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AE8](this, a2);
}

uint64_t WebCore::DisplayList::FillRectWithColor::apply(WebCore::DisplayList::FillRectWithColor *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AF0](this, a2);
}

uint64_t WebCore::DisplayList::StrokeBezierCurve::apply(WebCore::DisplayList::StrokeBezierCurve *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6AF8](this, a2);
}

uint64_t WebCore::DisplayList::StrokePathSegment::apply(WebCore::DisplayList::StrokePathSegment *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B00](this, a2);
}

uint64_t WebCore::DisplayList::ApplyStrokePattern::apply(WebCore::DisplayList::ApplyStrokePattern *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B08](this, a2);
}

uint64_t WebCore::DisplayList::ClipOutRoundedRect::apply(WebCore::DisplayList::ClipOutRoundedRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B10](this, a2);
}

uint64_t WebCore::DisplayList::DrawFocusRingRects::apply(WebCore::DisplayList::DrawFocusRingRects *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B18](this, a2);
}

uint64_t WebCore::DisplayList::FillCompositedRect::apply(WebCore::DisplayList::FillCompositedRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B20](this, a2);
}

uint64_t WebCore::DisplayList::SetInlineFillColor::apply(WebCore::DisplayList::SetInlineFillColor *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B28](this, a2);
}

uint64_t WebCore::DisplayList::DrawDecomposedGlyphs::apply()
{
  return MEMORY[0x1E0DD6B30]();
}

uint64_t WebCore::DisplayList::DrawDisplayListItems::apply()
{
  return MEMORY[0x1E0DD6B38]();
}

uint64_t WebCore::DisplayList::EndTransparencyLayer::apply(WebCore::DisplayList::EndTransparencyLayer *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B40](this, a2);
}

uint64_t WebCore::DisplayList::FillRectWithGradient::apply(WebCore::DisplayList::FillRectWithGradient *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B48](this, a2);
}

uint64_t WebCore::DisplayList::ApplyDeviceScaleFactor::apply(WebCore::DisplayList::ApplyDeviceScaleFactor *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B50](this, a2);
}

uint64_t WebCore::DisplayList::BeginTransparencyLayer::apply(WebCore::DisplayList::BeginTransparencyLayer *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B58](this, a2);
}

uint64_t WebCore::DisplayList::DrawFilteredImageBuffer::apply()
{
  return MEMORY[0x1E0DD6B60]();
}

uint64_t WebCore::DisplayList::FillRectWithRoundedHole::apply(WebCore::DisplayList::FillRectWithRoundedHole *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B68](this, a2);
}

uint64_t WebCore::DisplayList::DrawDotsForDocumentMarker::apply(WebCore::DisplayList::DrawDotsForDocumentMarker *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B70](this, a2);
}

uint64_t WebCore::DisplayList::FillRectWithGradientAndSpaceTransform::apply(WebCore::DisplayList::FillRectWithGradientAndSpaceTransform *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B78](this, a2);
}

uint64_t WebCore::DisplayList::BeginTransparencyLayerWithCompositeMode::apply(WebCore::DisplayList::BeginTransparencyLayerWithCompositeMode *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B80](this, a2);
}

uint64_t WebCore::DisplayList::Clip::apply(WebCore::DisplayList::Clip *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B88](this, a2);
}

uint64_t WebCore::DisplayList::Save::apply(WebCore::DisplayList::Save *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B90](this, a2);
}

uint64_t WebCore::DisplayList::Scale::apply(WebCore::DisplayList::Scale *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6B98](this, a2);
}

uint64_t WebCore::DisplayList::Rotate::apply(WebCore::DisplayList::Rotate *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BA0](this, a2);
}

uint64_t WebCore::DisplayList::SetCTM::apply(WebCore::DisplayList::SetCTM *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BA8](this, a2);
}

uint64_t WebCore::DisplayList::ClipOut::apply(WebCore::DisplayList::ClipOut *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BB0](this, a2);
}

uint64_t WebCore::DisplayList::FillArc::apply(WebCore::DisplayList::FillArc *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BB8](this, a2);
}

uint64_t WebCore::DisplayList::Restore::apply(WebCore::DisplayList::Restore *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BC0](this, a2);
}

uint64_t WebCore::DisplayList::ClipPath::apply(WebCore::DisplayList::ClipPath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BC8](this, a2);
}

uint64_t WebCore::DisplayList::DrawLine::apply(WebCore::DisplayList::DrawLine *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BD0](this, a2);
}

uint64_t WebCore::DisplayList::DrawPath::apply(WebCore::DisplayList::DrawPath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BD8](this, a2);
}

uint64_t WebCore::DisplayList::DrawRect::apply(WebCore::DisplayList::DrawRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BE0](this, a2);
}

uint64_t WebCore::DisplayList::FillLine::apply(WebCore::DisplayList::FillLine *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BE8](this, a2);
}

uint64_t WebCore::DisplayList::FillPath::apply(WebCore::DisplayList::FillPath *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BF0](this, a2);
}

uint64_t WebCore::DisplayList::FillRect::apply(WebCore::DisplayList::FillRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6BF8](this, a2);
}

uint64_t WebCore::DisplayList::SetState::apply(WebCore::DisplayList::SetState *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6C00](this, a2);
}

uint64_t WebCore::DisplayList::ClearRect::apply(WebCore::DisplayList::ClearRect *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6C08](this, a2);
}

uint64_t WebCore::DisplayList::ResetClip::apply(WebCore::DisplayList::ResetClip *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6C10](this, a2);
}

uint64_t WebCore::DisplayList::StrokeArc::apply(WebCore::DisplayList::StrokeArc *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6C18](this, a2);
}

uint64_t WebCore::DisplayList::Translate::apply(WebCore::DisplayList::Translate *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD6C20](this, a2);
}

uint64_t WebCore::EventRegion::touchActionsForPoint(WebCore::EventRegion *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6C28](this, a2);
}

uint64_t WebCore::EventRegion::containsEditableElementsInRect(WebCore::EventRegion *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD6C30](this, a2);
}

uint64_t WebCore::EventRegion::eventListenerRegionTypesForPoint(WebCore::EventRegion *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD6C38](this, a2);
}

uint64_t WebCore::FontChanges::createEditingStyle(WebCore::FontChanges *this)
{
  return MEMORY[0x1E0DD6C48](this);
}

uint64_t WebCore::FrameLoader::activeDocumentLoader(WebCore::FrameLoader *this)
{
  return MEMORY[0x1E0DD6C60](this);
}

uint64_t WebCore::FrameLoader::effectiveSandboxFlags(WebCore::FrameLoader *this)
{
  return MEMORY[0x1E0DD6C68](this);
}

uint64_t WebCore::FrameLoader::loaderForWebsitePolicies()
{
  return MEMORY[0x1E0DD6C70]();
}

uint64_t WebCore::FrameLoader::frame(WebCore::FrameLoader *this)
{
  return MEMORY[0x1E0DD6C78](this);
}

uint64_t WebCore::FrameLoader::frameID(WebCore::FrameLoader *this)
{
  return MEMORY[0x1E0DD6C80](this);
}

uint64_t WebCore::FrameLoader::loadType(WebCore::FrameLoader *this)
{
  return MEMORY[0x1E0DD6C88](this);
}

uint64_t WebCore::Geolocation::frame(WebCore::Geolocation *this)
{
  return MEMORY[0x1E0DD6C90](this);
}

uint64_t WebCore::HTMLElement::spellcheck(WebCore::HTMLElement *this)
{
  return MEMORY[0x1E0DD6C98](this);
}

uint64_t WebCore::HTMLElement::canonicalInputMode(WebCore::HTMLElement *this)
{
  return MEMORY[0x1E0DD6CB0](this);
}

uint64_t WebCore::HTMLElement::canonicalEnterKeyHint(WebCore::HTMLElement *this)
{
  return MEMORY[0x1E0DD6CB8](this);
}

uint64_t WebCore::HistoryItem::isTargetItem(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6CD8](this);
}

uint64_t WebCore::HistoryItem::documentState(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6CE0](this);
}

uint64_t WebCore::HistoryItem::scrollPosition(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6CF0](this);
}

uint64_t WebCore::HistoryItem::formContentType(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6CF8](this);
}

uint64_t WebCore::HistoryItem::pageScaleFactor(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D00](this);
}

uint64_t WebCore::HistoryItem::originalURLString(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D08](this);
}

uint64_t WebCore::HistoryItem::shouldRestoreScrollPosition(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D18](this);
}

uint64_t WebCore::HistoryItem::shouldOpenExternalURLsPolicy(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D20](this);
}

uint64_t WebCore::HistoryItem::url(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D28](this);
}

uint64_t WebCore::HistoryItem::title(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D38](this);
}

uint64_t WebCore::HistoryItem::target(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D40](this);
}

uint64_t WebCore::HistoryItem::children(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D48](this);
}

uint64_t WebCore::HistoryItem::referrer(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D50](this);
}

uint64_t WebCore::HistoryItem::urlString(WebCore::HistoryItem *this)
{
  return MEMORY[0x1E0DD6D58](this);
}

uint64_t WebCore::ImageBuffer::backendSize(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D68](this);
}

uint64_t WebCore::ImageBuffer::getPixelBuffer()
{
  return MEMORY[0x1E0DD6D70]();
}

uint64_t WebCore::ImageBuffer::copyNativeImage(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D78](this);
}

uint64_t WebCore::ImageBuffer::volatilityState(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D80](this);
}

uint64_t WebCore::ImageBuffer::backendGeneration(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D88](this);
}

uint64_t WebCore::ImageBuffer::createNativeImageReference(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D90](this);
}

uint64_t WebCore::ImageBuffer::clone(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6D98](this);
}

uint64_t WebCore::ImageBuffer::toData()
{
  return MEMORY[0x1E0DD6DA0]();
}

uint64_t WebCore::ImageBuffer::isInUse(WebCore::ImageBuffer *this)
{
  return MEMORY[0x1E0DD6DA8](this);
}

uint64_t WebCore::MediaPlayer::identifier(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DB0](this);
}

uint64_t WebCore::MediaPlayer::readyState(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DB8](this);
}

uint64_t WebCore::MediaPlayer::currentTime(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DC0](this);
}

uint64_t WebCore::MediaPlayer::getStartDate(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DC8](this);
}

uint64_t WebCore::MediaPlayer::effectiveRate(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DD0](this);
}

uint64_t WebCore::MediaPlayer::getRawCookies()
{
  return MEMORY[0x1E0DD6DD8]();
}

uint64_t WebCore::MediaPlayer::isCrossOrigin(WebCore::MediaPlayer *this, const WebCore::SecurityOrigin *a2)
{
  return MEMORY[0x1E0DD6DE0](this, a2);
}

uint64_t WebCore::MediaPlayer::movieLoadType(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DE8](this);
}

uint64_t WebCore::MediaPlayer::platformLayer(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DF0](this);
}

uint64_t WebCore::MediaPlayer::waitingForKey(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6DF8](this);
}

uint64_t WebCore::MediaPlayer::videoLayerSize(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E00](this);
}

uint64_t WebCore::MediaPlayer::maxTimeSeekable(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E08](this);
}

uint64_t WebCore::MediaPlayer::minTimeSeekable(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E10](this);
}

uint64_t WebCore::MediaPlayer::canSaveMediaData(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E18](this);
}

uint64_t WebCore::MediaPlayer::supportsScanning(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E20](this);
}

uint64_t WebCore::MediaPlayer::engineDescription(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E28](this);
}

uint64_t WebCore::MediaPlayer::hasClosedCaptions(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E30](this);
}

uint64_t WebCore::MediaPlayer::platformErrorCode(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E38](this);
}

uint64_t WebCore::MediaPlayer::timeIsProgressing(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E40](this);
}

uint64_t WebCore::MediaPlayer::canShowWhileLocked(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E48](this);
}

uint64_t WebCore::MediaPlayer::didLoadingProgress()
{
  return MEMORY[0x1E0DD6E50]();
}

uint64_t WebCore::MediaPlayer::maxFastForwardRate(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E58](this);
}

uint64_t WebCore::MediaPlayer::minFastReverseRate(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E60](this);
}

uint64_t WebCore::MediaPlayer::supportsFullscreen(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E68](this);
}

uint64_t WebCore::MediaPlayer::allowedMediaCodecTypes(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E70](this);
}

uint64_t WebCore::MediaPlayer::didPassCORSAccessCheck(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E78](this);
}

uint64_t WebCore::MediaPlayer::documentSecurityOrigin(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E80](this);
}

uint64_t WebCore::MediaPlayer::hasAvailableVideoFrame(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E88](this);
}

uint64_t WebCore::MediaPlayer::supportsPlayAtHostTime(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E90](this);
}

uint64_t WebCore::MediaPlayer::supportsPauseAtHostTime(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6E98](this);
}

uint64_t WebCore::MediaPlayer::isVideoFullscreenStandby(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EA0](this);
}

uint64_t WebCore::MediaPlayer::supportsPictureInPicture(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EA8](this);
}

uint64_t WebCore::MediaPlayer::allowedMediaAudioCodecIDs(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EB0](this);
}

uint64_t WebCore::MediaPlayer::allowedMediaVideoCodecIDs(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EB8](this);
}

uint64_t WebCore::MediaPlayer::allowedMediaContainerTypes(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EC0](this);
}

uint64_t WebCore::MediaPlayer::wirelessPlaybackTargetName(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EC8](this);
}

uint64_t WebCore::MediaPlayer::wirelessPlaybackTargetType(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6ED0](this);
}

uint64_t WebCore::MediaPlayer::languageOfPrimaryAudioTrack(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6ED8](this);
}

uint64_t WebCore::MediaPlayer::sourceApplicationIdentifier(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EE0](this);
}

uint64_t WebCore::MediaPlayer::supportsAcceleratedRendering(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EE8](this);
}

uint64_t WebCore::MediaPlayer::preferredAudioCharacteristics(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EF0](this);
}

uint64_t WebCore::MediaPlayer::wirelessVideoPlaybackDisabled(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6EF8](this);
}

uint64_t WebCore::MediaPlayer::allowedMediaCaptionFormatTypes(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F00](this);
}

uint64_t WebCore::MediaPlayer::canPlayToWirelessPlaybackTarget(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F08](this);
}

uint64_t WebCore::MediaPlayer::maximumDurationToCacheMediaTime(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F10](this);
}

uint64_t WebCore::MediaPlayer::mediaPlayerNetworkInterfaceName(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F18](this);
}

uint64_t WebCore::MediaPlayer::mediaContentTypesRequiringHardwareSupport(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F20](this);
}

uint64_t WebCore::MediaPlayer::muted(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F28](this);
}

uint64_t WebCore::MediaPlayer::paused(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F30](this);
}

uint64_t WebCore::MediaPlayer::volume(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F38](this);
}

uint64_t WebCore::MediaPlayer::buffered(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F40](this);
}

uint64_t WebCore::MediaPlayer::duration(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F48](this);
}

uint64_t WebCore::MediaPlayer::errorLog(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F50](this);
}

uint64_t WebCore::MediaPlayer::hasAudio(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F58](this);
}

uint64_t WebCore::MediaPlayer::hasVideo(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F60](this);
}

uint64_t WebCore::MediaPlayer::referrer(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F68](this);
}

uint64_t WebCore::MediaPlayer::accessLog(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F70](this);
}

uint64_t WebCore::MediaPlayer::startTime(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F78](this);
}

uint64_t WebCore::MediaPlayer::userAgent(WebCore::MediaPlayer *this)
{
  return MEMORY[0x1E0DD6F80](this);
}

uint64_t WebCore::MemoryCache::originsWithCache()
{
  return MEMORY[0x1E0DD6F88]();
}

uint64_t WebCore::NativeImage::colorSpace(WebCore::NativeImage *this)
{
  return MEMORY[0x1E0DD6F90](this);
}

uint64_t WebCore::NativeImage::platformImage(WebCore::NativeImage *this)
{
  return MEMORY[0x1E0DD6F98](this);
}

uint64_t WebCore::NativeImage::size(WebCore::NativeImage *this)
{
  return MEMORY[0x1E0DD6FA0](this);
}

uint64_t WebCore::PageOverlay::bounds(WebCore::PageOverlay *this)
{
  return MEMORY[0x1E0DD6FA8](this);
}

uint64_t WebCore::RenderLayer::scrollableArea(WebCore::RenderLayer *this)
{
  return MEMORY[0x1E0DD6FB0](this);
}

uint64_t WebCore::RenderLayer::enclosingScrollableLayer()
{
  return MEMORY[0x1E0DD6FB8]();
}

uint64_t WebCore::RenderLayer::isTransparentRespectingParentFrames(WebCore::RenderLayer *this)
{
  return MEMORY[0x1E0DD6FC0](this);
}

uint64_t WebCore::RenderStyle::usedUserSelect(WebCore::RenderStyle *this)
{
  return MEMORY[0x1E0DD6FD8](this);
}

uint64_t WebCore::RenderStyle::fontDescription(WebCore::RenderStyle *this)
{
  return MEMORY[0x1E0DD6FE0](this);
}

uint64_t WebCore::RenderStyle::scrollbarGutter(WebCore::RenderStyle *this)
{
  return MEMORY[0x1E0DD6FE8](this);
}

uint64_t WebCore::RenderStyle::computedLineHeight(WebCore::RenderStyle *this)
{
  return MEMORY[0x1E0DD6FF0](this);
}

uint64_t WebCore::RenderStyle::metricsOfPrimaryFont(WebCore::RenderStyle *this)
{
  return MEMORY[0x1E0DD6FF8](this);
}

uint64_t WebCore::RenderStyle::colorResolvingCurrentColor(WebCore::RenderStyle *this, const WebCore::StyleColor *a2)
{
  return MEMORY[0x1E0DD7000](this, a2);
}

uint64_t WebCore::RenderTheme::activeSelectionBackgroundColor()
{
  return MEMORY[0x1E0DD7010]();
}

uint64_t WebCore::RenderTheme::inactiveSelectionBackgroundColor()
{
  return MEMORY[0x1E0DD7018]();
}

uint64_t WebCore::RenderVideo::videoElement(WebCore::RenderVideo *this)
{
  return MEMORY[0x1E0DD7020](this);
}

uint64_t WebCore::RenderVideo::videoBox(WebCore::RenderVideo *this)
{
  return MEMORY[0x1E0DD7028](this);
}

uint64_t WebCore::SourceBrush::gradientIdentifier(WebCore::SourceBrush *this)
{
  return MEMORY[0x1E0DD7030](this);
}

uint64_t WebCore::SourceBrush::gradientSpaceTransform(WebCore::SourceBrush *this)
{
  return MEMORY[0x1E0DD7038](this);
}

uint64_t WebCore::SourceBrush::pattern(WebCore::SourceBrush *this)
{
  return MEMORY[0x1E0DD7040](this);
}

uint64_t WebCore::SourceImage::imageIdentifier(WebCore::SourceImage *this)
{
  return MEMORY[0x1E0DD7048](this);
}

uint64_t WebCore::SourceImage::imageBufferIfExists(WebCore::SourceImage *this)
{
  return MEMORY[0x1E0DD7050](this);
}

uint64_t WebCore::SourceImage::nativeImageIfExists(WebCore::SourceImage *this)
{
  return MEMORY[0x1E0DD7058](this);
}

uint64_t WebCore::BlobDataItem::length(WebCore::BlobDataItem *this)
{
  return MEMORY[0x1E0DD70A0](this);
}

uint64_t WebCore::EventHandler::hitTestResultAtPoint()
{
  return MEMORY[0x1E0DD70C8]();
}

uint64_t WebCore::EventHandler::capsLockStateMayHaveChanged(WebCore::EventHandler *this)
{
  return MEMORY[0x1E0DD70D0](this);
}

uint64_t WebCore::RenderObject::enclosingLayer(WebCore::RenderObject *this)
{
  return MEMORY[0x1E0DD70F8](this);
}

uint64_t WebCore::RenderObject::repaintRectangle(WebCore::RenderObject *this, const WebCore::LayoutRect *a2)
{
  return MEMORY[0x1E0DD7110](this, a2);
}

uint64_t WebCore::RenderObject::styleColorOptions(WebCore::RenderObject *this)
{
  return MEMORY[0x1E0DD7118](this);
}

uint64_t WebCore::RenderObject::localToContainerQuad()
{
  return MEMORY[0x1E0DD7120]();
}

uint64_t WebCore::RenderObject::localToContainerPoint()
{
  return MEMORY[0x1E0DD7128]();
}

uint64_t WebCore::RenderObject::absoluteBoundingBoxRect(WebCore::RenderObject *this, uint64_t a2, BOOL *a3)
{
  return MEMORY[0x1E0DD7130](this, a2, a3);
}

uint64_t WebCore::RenderObject::hasNonEmptyVisibleRectRespectingParentFrames(WebCore::RenderObject *this)
{
  return MEMORY[0x1E0DD7140](this);
}

uint64_t WebCore::RenderObject::theme(WebCore::RenderObject *this)
{
  return MEMORY[0x1E0DD7148](this);
}

uint64_t WebCore::ScriptBuffer::containsSingleFileMappedSegment(WebCore::ScriptBuffer *this)
{
  return MEMORY[0x1E0DD7150](this);
}

uint64_t WebCore::ScriptBuffer::ipcData(WebCore::ScriptBuffer *this)
{
  return MEMORY[0x1E0DD7158](this);
}

uint64_t WebCore::SharedBuffer::createCFData(WebCore::SharedBuffer *this)
{
  return MEMORY[0x1E0DD7160](this);
}

uint64_t WebCore::SharedBuffer::createNSData(WebCore::SharedBuffer *this)
{
  return MEMORY[0x1E0DD7168](this);
}

uint64_t WebCore::SharedBuffer::data(WebCore::SharedBuffer *this)
{
  return MEMORY[0x1E0DD7170](this);
}

uint64_t WebCore::SharedMemory::createSharedBuffer(WebCore::SharedMemory *this)
{
  return MEMORY[0x1E0DD7178](this);
}

uint64_t WebCore::TextIterator::node(WebCore::TextIterator *this)
{
  return MEMORY[0x1E0DD7180](this);
}

uint64_t WebCore::TextIterator::range(WebCore::TextIterator *this)
{
  return MEMORY[0x1E0DD7188](this);
}

uint64_t WebCore::BoundaryPoint::protectedDocument(WebCore::BoundaryPoint *this)
{
  return MEMORY[0x1E0DD7190](this);
}

uint64_t WebCore::ContainerNode::countChildNodes(WebCore::ContainerNode *this)
{
  return MEMORY[0x1E0DD71C0](this);
}

uint64_t WebCore::HTTPHeaderMap::getUncommonHeader()
{
  return MEMORY[0x1E0DD71E8]();
}

uint64_t WebCore::HTTPHeaderMap::get()
{
  return MEMORY[0x1E0DD71F0]();
}

uint64_t WebCore::HTTPHeaderMap::contains()
{
  return MEMORY[0x1E0DD71F8]();
}

uint64_t WebCore::HitTestResult::isSelected(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7200](this);
}

uint64_t WebCore::HitTestResult::targetFrame(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7208](this);
}

uint64_t WebCore::HitTestResult::textContent(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7210](this);
}

uint64_t WebCore::HitTestResult::mediaIsVideo(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7218](this);
}

uint64_t WebCore::HitTestResult::mediaHasAudio(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7220](this);
}

uint64_t WebCore::HitTestResult::targetElement(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7228](this);
}

uint64_t WebCore::HitTestResult::absolutePDFURL(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7230](this);
}

uint64_t WebCore::HitTestResult::hasEntireImage(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7238](this);
}

uint64_t WebCore::HitTestResult::innerNodeFrame(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7240](this);
}

uint64_t WebCore::HitTestResult::absoluteLinkURL(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7248](this);
}

uint64_t WebCore::HitTestResult::hasMediaElement(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7250](this);
}

uint64_t WebCore::HitTestResult::absoluteImageURL(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7260](this);
}

uint64_t WebCore::HitTestResult::absoluteMediaURL(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7268](this);
}

uint64_t WebCore::HitTestResult::isContentEditable(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7278](this);
}

uint64_t WebCore::HitTestResult::titleDisplayString(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7280](this);
}

uint64_t WebCore::HitTestResult::isDownloadableMedia(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7288](this);
}

uint64_t WebCore::HitTestResult::listBasedTestResult(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7290](this);
}

uint64_t WebCore::HitTestResult::mediaIsInFullscreen(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD7298](this);
}

uint64_t WebCore::HitTestResult::linkSuggestedFilename(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72A0](this);
}

uint64_t WebCore::HitTestResult::hasLocalDataForLinkURL(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72A8](this);
}

uint64_t WebCore::HitTestResult::isOverTextInsideFormControlElement(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72B0](this);
}

uint64_t WebCore::HitTestResult::frame(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72B8](this);
}

uint64_t WebCore::HitTestResult::image(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72C0](this);
}

uint64_t WebCore::HitTestResult::imageRect(WebCore::HitTestResult *this)
{
  return MEMORY[0x1E0DD72D0](this);
}

uint64_t WebCore::IDBResultData::getAllResult(WebCore::IDBResultData *this)
{
  return MEMORY[0x1E0DD72E0](this);
}

uint64_t WebCore::IDBResultData::getResult(WebCore::IDBResultData *this)
{
  return MEMORY[0x1E0DD72F0](this);
}

uint64_t WebCore::ImageDocument::imageElement(WebCore::ImageDocument *this)
{
  return MEMORY[0x1E0DD72F8](this);
}

uint64_t WebCore::KeyboardEvent::charCode(WebCore::KeyboardEvent *this)
{
  return MEMORY[0x1E0DD7308](this);
}

uint64_t WebCore::MIMETypeCache::isEmpty(WebCore::MIMETypeCache *this)
{
  return MEMORY[0x1E0DD7310](this);
}

uint64_t WebCore::MediaStrategy::mockMediaSourceEnabled(WebCore::MediaStrategy *this)
{
  return MEMORY[0x1E0DD7318](this);
}

uint64_t WebCore::MediaStrategy::createNowPlayingManager(WebCore::MediaStrategy *this)
{
  return MEMORY[0x1E0DD7320](this);
}

uint64_t WebCore::RenderElement::imageOrientation(WebCore::RenderElement *this)
{
  return MEMORY[0x1E0DD7328](this);
}

uint64_t WebCore::ResourceError::blockedKnownTracker(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7330](this);
}

uint64_t WebCore::ResourceError::errorRecoveryMethod(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7338](this);
}

uint64_t WebCore::ResourceError::blockedTrackerHostName(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7340](this);
}

uint64_t WebCore::ResourceError::cfError(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7348](this);
}

uint64_t WebCore::ResourceError::ipcData(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7350](this);
}

uint64_t WebCore::ResourceError::nsError(WebCore::ResourceError *this)
{
  return MEMORY[0x1E0DD7358](this);
}

uint64_t WebCore::ResourceError::operator NSError *()
{
  return MEMORY[0x1E0DD7360]();
}

uint64_t WebCore::ScrollingTree::layoutViewport(WebCore::ScrollingTree *this)
{
  return MEMORY[0x1E0DD7370](this);
}

uint64_t WebCore::ScrollingTree::mainFrameScrollPosition(WebCore::ScrollingTree *this)
{
  return MEMORY[0x1E0DD7378](this);
}

uint64_t WebCore::ScrollingTree::mainFrameVerticalOverscrollBehavior(WebCore::ScrollingTree *this)
{
  return MEMORY[0x1E0DD7380](this);
}

uint64_t WebCore::ScrollingTree::mainFrameHorizontalOverscrollBehavior(WebCore::ScrollingTree *this)
{
  return MEMORY[0x1E0DD7388](this);
}

uint64_t WebCore::ScrollingTree::nodeForID()
{
  return MEMORY[0x1E0DD7390]();
}

uint64_t WebCore::CredentialBase::persistence(WebCore::CredentialBase *this)
{
  return MEMORY[0x1E0DD73A0](this);
}

uint64_t WebCore::CredentialBase::serializationForBasicAuthorizationHeader(WebCore::CredentialBase *this)
{
  return MEMORY[0x1E0DD73A8](this);
}

uint64_t WebCore::CredentialBase::user(WebCore::CredentialBase *this)
{
  return MEMORY[0x1E0DD73B0](this);
}

uint64_t WebCore::CredentialBase::password(WebCore::CredentialBase *this)
{
  return MEMORY[0x1E0DD73B8](this);
}

uint64_t WebCore::DocumentLoader::frameLoader(WebCore::DocumentLoader *this)
{
  return MEMORY[0x1E0DD73C0](this);
}

uint64_t WebCore::DocumentLoader::subresource(WebCore::DocumentLoader *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD73C8](this, a2);
}

uint64_t WebCore::DocumentLoader::urlForHistory(WebCore::DocumentLoader *this)
{
  return MEMORY[0x1E0DD73E0](this);
}

uint64_t WebCore::DocumentLoader::mainResourceData(WebCore::DocumentLoader *this)
{
  return MEMORY[0x1E0DD73E8](this);
}

uint64_t WebCore::DocumentLoader::mouseEventPolicy(WebCore::DocumentLoader *this)
{
  return MEMORY[0x1E0DD73F0](this);
}

uint64_t WebCore::DocumentLoader::mainResourceLoader(WebCore::DocumentLoader *this)
{
  return MEMORY[0x1E0DD7400](this);
}

uint64_t WebCore::FontAttributes::createDictionary(WebCore::FontAttributes *this)
{
  return MEMORY[0x1E0DD7420](this);
}

uint64_t WebCore::FrameSelection::rootEditableElementOrDocumentElement(WebCore::FrameSelection *this)
{
  return MEMORY[0x1E0DD7470](this);
}

uint64_t WebCore::FrameSelection::contains()
{
  return MEMORY[0x1E0DD7478]();
}

uint64_t WebCore::IDBRequestData::transactionIdentifier(WebCore::IDBRequestData *this)
{
  return MEMORY[0x1E0DD7488](this);
}

uint64_t WebCore::LocalDOMWindow::pendingUnloadEventListeners(WebCore::LocalDOMWindow *this)
{
  return MEMORY[0x1E0DD74A0](this);
}

uint64_t WebCore::LocalDOMWindow::frame(WebCore::LocalDOMWindow *this)
{
  return MEMORY[0x1E0DD74A8](this);
}

uint64_t WebCore::LocalFrameView::renderView(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74B0](this);
}

uint64_t WebCore::LocalFrameView::needsLayout(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74B8](this);
}

uint64_t WebCore::LocalFrameView::paintBehavior(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74C0](this);
}

uint64_t WebCore::LocalFrameView::scrollingNodeID(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74C8](this);
}

uint64_t WebCore::LocalFrameView::wasScrolledByUser(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74D0](this);
}

uint64_t WebCore::LocalFrameView::layoutViewportRect(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74D8](this);
}

uint64_t WebCore::LocalFrameView::visualViewportRect(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74E0](this);
}

uint64_t WebCore::LocalFrameView::baseBackgroundColor(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD74E8](this);
}

uint64_t WebCore::LocalFrameView::clientToDocumentRect()
{
  return MEMORY[0x1E0DD74F0]();
}

uint64_t WebCore::LocalFrameView::documentToClientRect()
{
  return MEMORY[0x1E0DD74F8]();
}

uint64_t WebCore::LocalFrameView::clientToDocumentPoint()
{
  return MEMORY[0x1E0DD7508]();
}

uint64_t WebCore::LocalFrameView::baseLayoutViewportSize(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7510](this);
}

uint64_t WebCore::LocalFrameView::documentBackgroundColor(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7518](this);
}

uint64_t WebCore::LocalFrameView::absoluteToLayoutViewportRect()
{
  return MEMORY[0x1E0DD7520]();
}

uint64_t WebCore::LocalFrameView::absoluteToLayoutViewportPoint()
{
  return MEMORY[0x1E0DD7528]();
}

uint64_t WebCore::LocalFrameView::hasViewportConstrainedObjects(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7530](this);
}

uint64_t WebCore::LocalFrameView::maxStableLayoutViewportOrigin(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7538](this);
}

uint64_t WebCore::LocalFrameView::minStableLayoutViewportOrigin(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7540](this);
}

uint64_t WebCore::LocalFrameView::viewportConstrainedObjectsRect(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7548](this);
}

uint64_t WebCore::LocalFrameView::scrollableAreaForScrollingNodeID()
{
  return MEMORY[0x1E0DD7550]();
}

uint64_t WebCore::LocalFrameView::frame(WebCore::LocalFrameView *this)
{
  return MEMORY[0x1E0DD7558](this);
}

uint64_t WebCore::PaymentContact::pkContact(WebCore::PaymentContact *this)
{
  return MEMORY[0x1E0DD7560](this);
}

uint64_t WebCore::ResourceLoader::frameLoader(WebCore::ResourceLoader *this)
{
  return MEMORY[0x1E0DD7570](this);
}

uint64_t WebCore::ResourceLoader::shouldIncludeCertificateInfo(WebCore::ResourceLoader *this)
{
  return MEMORY[0x1E0DD7578](this);
}

uint64_t WebCore::ResourceLoader::isAllowedToAskUserForCredentials(WebCore::ResourceLoader *this)
{
  return MEMORY[0x1E0DD7580](this);
}

uint64_t WebCore::SWServerWorker::registration(WebCore::SWServerWorker *this)
{
  return MEMORY[0x1E0DD7588](this);
}

uint64_t WebCore::SWServerWorker::findClientByIdentifier()
{
  return MEMORY[0x1E0DD7590]();
}

uint64_t WebCore::SWServerWorker::isClientActiveServiceWorker()
{
  return MEMORY[0x1E0DD7598]();
}

uint64_t WebCore::SWServerWorker::serviceWorkerPageIdentifier(WebCore::SWServerWorker *this)
{
  return MEMORY[0x1E0DD75A0](this);
}

uint64_t WebCore::SWServerWorker::origin(WebCore::SWServerWorker *this)
{
  return MEMORY[0x1E0DD75A8](this);
}

uint64_t WebCore::ScrollableArea::scrollAnimator(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75B8](this);
}

uint64_t WebCore::ScrollableArea::edgePinnedState(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75C0](this);
}

uint64_t WebCore::ScrollableArea::snapOffsetsInfo(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75C8](this);
}

uint64_t WebCore::ScrollableArea::scrollbarIntrusion(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75D0](this);
}

uint64_t WebCore::ScrollableArea::visibleContentRect()
{
  return MEMORY[0x1E0DD75D8]();
}

uint64_t WebCore::ScrollableArea::scrollbarsController(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75E0](this);
}

uint64_t WebCore::ScrollableArea::scrollbarsCanBeActive(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75E8](this);
}

uint64_t WebCore::ScrollableArea::allowsVerticalScrolling(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75F0](this);
}

uint64_t WebCore::ScrollableArea::mouseMovedInContentArea(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD75F8](this);
}

uint64_t WebCore::ScrollableArea::allowsHorizontalScrolling(WebCore::ScrollableArea *this)
{
  return MEMORY[0x1E0DD7600](this);
}

uint64_t WebCore::ScrollableArea::getRectToExposeForScrollIntoView()
{
  return MEMORY[0x1E0DD7608]();
}

uint64_t WebCore::ScrollableArea::visibleContentRectIncludingScrollbars()
{
  return MEMORY[0x1E0DD7610]();
}

uint64_t WebCore::SecurityOrigin::canDisplay()
{
  return MEMORY[0x1E0DD7618]();
}

uint64_t WebCore::SecurityOrigin::canRequest()
{
  return MEMORY[0x1E0DD7620]();
}

uint64_t WebCore::SecurityOrigin::toRawString(WebCore::SecurityOrigin *this)
{
  return MEMORY[0x1E0DD7628](this);
}

uint64_t WebCore::SecurityOrigin::isSameSiteAs(WebCore::SecurityOrigin *this, const WebCore::SecurityOrigin *a2)
{
  return MEMORY[0x1E0DD7630](this, a2);
}

uint64_t WebCore::SecurityOrigin::isolatedCopy(WebCore::SecurityOrigin *this)
{
  return MEMORY[0x1E0DD7638](this);
}

uint64_t WebCore::SecurityOrigin::isSameOriginAs(WebCore::SecurityOrigin *this, const WebCore::SecurityOrigin *a2)
{
  return MEMORY[0x1E0DD7640](this, a2);
}

uint64_t WebCore::SecurityOrigin::isSameOriginDomain(WebCore::SecurityOrigin *this, const WebCore::SecurityOrigin *a2)
{
  return MEMORY[0x1E0DD7648](this, a2);
}

uint64_t WebCore::SecurityOrigin::isSameSchemeHostPort(WebCore::SecurityOrigin *this, const WebCore::SecurityOrigin *a2)
{
  return MEMORY[0x1E0DD7650](this, a2);
}

uint64_t WebCore::SecurityOrigin::toString(WebCore::SecurityOrigin *this)
{
  return MEMORY[0x1E0DD7668](this);
}

uint64_t WebCore::TestReportBody::message(WebCore::TestReportBody *this)
{
  return MEMORY[0x1E0DD7678](this);
}

uint64_t WebCore::TileController::contentsScale(WebCore::TileController *this)
{
  return MEMORY[0x1E0DD7680](this);
}

uint64_t WebCore::AffineTransform::isIdentity(WebCore::AffineTransform *this)
{
  return MEMORY[0x1E0DD7688](this);
}

uint64_t WebCore::AffineTransform::inverse(WebCore::AffineTransform *this)
{
  return MEMORY[0x1E0DD7690](this);
}

uint64_t WebCore::AffineTransform::mapRect(WebCore::AffineTransform *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD7698](this, a2);
}

uint64_t WebCore::AffineTransform::mapRect(WebCore::AffineTransform *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD76A0](this, a2);
}

uint64_t WebCore::AffineTransform::mapPoint(WebCore::AffineTransform *this, const WebCore::FloatPoint *a2)
{
  return MEMORY[0x1E0DD76A8](this, a2);
}

uint64_t WebCore::AffineTransform::mapPoint(WebCore::AffineTransform *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD76B0](this, a2);
}

uint64_t WebCore::AffineTransform::operator CGAffineTransform()
{
  return MEMORY[0x1E0DD76B8]();
}

uint64_t WebCore::BackgroundFetch::information(WebCore::BackgroundFetch *this)
{
  return MEMORY[0x1E0DD76C0](this);
}

uint64_t WebCore::CertificateInfo::containsNonRootSHA1SignedCertificate(WebCore::CertificateInfo *this)
{
  return MEMORY[0x1E0DD76D0](this);
}

uint64_t WebCore::FocusController::focusedOrMainFrame(WebCore::FocusController *this)
{
  return MEMORY[0x1E0DD76D8](this);
}

uint64_t WebCore::GraphicsContext::scaleFactor(WebCore::GraphicsContext *this)
{
  return MEMORY[0x1E0DD76E0](this);
}

uint64_t WebCore::GraphicsContext::createImageBuffer()
{
  return MEMORY[0x1E0DD76E8]();
}

uint64_t WebCore::GraphicsContext::createScaledImageBuffer()
{
  return MEMORY[0x1E0DD76F0]();
}

{
  return MEMORY[0x1E0DD76F8]();
}

uint64_t WebCore::HTMLAreaElement::imageElement(WebCore::HTMLAreaElement *this)
{
  return MEMORY[0x1E0DD7708](this);
}

uint64_t WebCore::IDBGetAllResult::allBlobFilePaths(WebCore::IDBGetAllResult *this)
{
  return MEMORY[0x1E0DD7748](this);
}

uint64_t WebCore::IDBGetAllResult::keys(WebCore::IDBGetAllResult *this)
{
  return MEMORY[0x1E0DD7750](this);
}

uint64_t WebCore::IDBGetAllResult::values(WebCore::IDBGetAllResult *this)
{
  return MEMORY[0x1E0DD7758](this);
}

uint64_t WebCore::PlatformCALayer::canHaveBackingStore(WebCore::PlatformCALayer *this)
{
  return MEMORY[0x1E0DD7770](this);
}

uint64_t WebCore::PlatformCALayer::needsPlatformContext(WebCore::PlatformCALayer *this)
{
  return MEMORY[0x1E0DD7778](this);
}

uint64_t WebCore::PlatformCALayer::maskLayer(WebCore::PlatformCALayer *this)
{
  return MEMORY[0x1E0DD7780](this);
}

uint64_t WebCore::ProcessIdentity::operator BOOL()
{
  return MEMORY[0x1E0DD7788]();
}

uint64_t WebCore::ProtectionSpace::getPlatformDataToSerialize(WebCore::ProtectionSpace *this)
{
  return MEMORY[0x1E0DD7790](this);
}

uint64_t WebCore::ProtectionSpace::receivesCredentialSecurely(WebCore::ProtectionSpace *this)
{
  return MEMORY[0x1E0DD7798](this);
}

uint64_t WebCore::ProtectionSpace::nsSpace(WebCore::ProtectionSpace *this)
{
  return MEMORY[0x1E0DD77A0](this);
}

uint64_t WebCore::ResourceRequest::nsURLRequest()
{
  return MEMORY[0x1E0DD77A8]();
}

uint64_t WebCore::ResourceRequest::getRequestDataToSerialize(WebCore::ResourceRequest *this)
{
  return MEMORY[0x1E0DD77B0](this);
}

uint64_t WebCore::RunLoopObserver::isScheduled(WebCore::RunLoopObserver *this)
{
  return MEMORY[0x1E0DD77B8](this);
}

uint64_t WebCore::SecurityContext::securityOrigin(WebCore::SecurityContext *this)
{
  return MEMORY[0x1E0DD77C0](this);
}

uint64_t WebCore::ShareableBitmap::createHandle()
{
  return MEMORY[0x1E0DD77C8]();
}

uint64_t WebCore::ShareableBitmap::createReadOnlyHandle(WebCore::ShareableBitmap *this)
{
  return MEMORY[0x1E0DD77D0](this);
}

uint64_t WebCore::ShareableBitmap::span(WebCore::ShareableBitmap *this)
{
  return MEMORY[0x1E0DD77D8](this);
}

uint64_t WebCore::StyleProperties::mutableCopy(WebCore::StyleProperties *this)
{
  return MEMORY[0x1E0DD77E0](this);
}

uint64_t WebCore::StyleProperties::propertyAsColor()
{
  return MEMORY[0x1E0DD77E8]();
}

uint64_t WebCore::StyleProperties::propertyAsValueID()
{
  return MEMORY[0x1E0DD77F0]();
}

uint64_t WebCore::VisiblePosition::absoluteCaretBounds(WebCore::VisiblePosition *this, BOOL *a2)
{
  return MEMORY[0x1E0DD7800](this, a2);
}

uint64_t WebCore::VisiblePosition::absoluteSelectionBoundsForLine(WebCore::VisiblePosition *this)
{
  return MEMORY[0x1E0DD7808](this);
}

uint64_t WebCore::VisiblePosition::next()
{
  return MEMORY[0x1E0DD7820]();
}

uint64_t WebCore::VisiblePosition::previous()
{
  return MEMORY[0x1E0DD7830]();
}

uint64_t WebCore::AttributedString::nsAttributedString(WebCore::AttributedString *this)
{
  return MEMORY[0x1E0DD7838](this);
}

uint64_t WebCore::AttributedString::documentAttributesAsNSDictionary(WebCore::AttributedString *this)
{
  return MEMORY[0x1E0DD7840](this);
}

uint64_t WebCore::BlobRegistryImpl::filesInBlob()
{
  return MEMORY[0x1E0DD7850]();
}

uint64_t WebCore::BlobRegistryImpl::getBlobDataFromURL()
{
  return MEMORY[0x1E0DD7858]();
}

uint64_t WebCore::FontPlatformData::attributes(WebCore::FontPlatformData *this)
{
  return MEMORY[0x1E0DD7870](this);
}

uint64_t WebCore::FontPlatformData::toIPCData(WebCore::FontPlatformData *this)
{
  return MEMORY[0x1E0DD7878](this);
}

uint64_t WebCore::HTMLInputElement::isURLField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78C0](this);
}

uint64_t WebCore::HTMLInputElement::isDateField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78C8](this);
}

uint64_t WebCore::HTMLInputElement::isTextField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78D0](this);
}

uint64_t WebCore::HTMLInputElement::isTimeField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78D8](this);
}

uint64_t WebCore::HTMLInputElement::isWeekField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78E0](this);
}

uint64_t WebCore::HTMLInputElement::isEmailField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD78F8](this);
}

uint64_t WebCore::HTMLInputElement::isFileUpload(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7900](this);
}

uint64_t WebCore::HTMLInputElement::isMonthField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7908](this);
}

uint64_t WebCore::HTMLInputElement::valueAsColor(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7910](this);
}

uint64_t WebCore::HTMLInputElement::isNumberField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7918](this);
}

uint64_t WebCore::HTMLInputElement::isSearchField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7920](this);
}

uint64_t WebCore::HTMLInputElement::valueAsNumber(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7928](this);
}

uint64_t WebCore::HTMLInputElement::isColorControl(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7930](this);
}

uint64_t WebCore::HTMLInputElement::isPasswordField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7938](this);
}

uint64_t WebCore::HTMLInputElement::suggestedColors(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7940](this);
}

uint64_t WebCore::HTMLInputElement::isTelephoneField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7948](this);
}

uint64_t WebCore::HTMLInputElement::isDateTimeLocalField(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7960](this);
}

uint64_t WebCore::HTMLInputElement::dataListButtonElement(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7968](this);
}

uint64_t WebCore::HTMLInputElement::isFocusingWithDataListDropdown(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7970](this);
}

uint64_t WebCore::HTMLInputElement::list(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7980](this);
}

uint64_t WebCore::HTMLInputElement::value(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD7988](this);
}

uint64_t WebCore::HTMLInputElement::isText(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD79A0](this);
}

uint64_t WebCore::HTMLInputElement::multiple(WebCore::HTMLInputElement *this)
{
  return MEMORY[0x1E0DD79A8](this);
}

uint64_t WebCore::HTMLMediaElement::videoLayerSize(WebCore::HTMLMediaElement *this)
{
  return MEMORY[0x1E0DD79E8](this);
}

uint64_t WebCore::HTMLMediaElement::playerIdentifier(WebCore::HTMLMediaElement *this)
{
  return MEMORY[0x1E0DD79F0](this);
}

uint64_t WebCore::HTMLMediaElement::isVisibleInViewport(WebCore::HTMLMediaElement *this)
{
  return MEMORY[0x1E0DD79F8](this);
}

uint64_t WebCore::HTMLMediaElement::paused(WebCore::HTMLMediaElement *this)
{
  return MEMORY[0x1E0DD7A10](this);
}

uint64_t WebCore::HTMLMediaElement::seeking(WebCore::HTMLMediaElement *this)
{
  return MEMORY[0x1E0DD7A20](this);
}

uint64_t WebCore::HTMLVideoElement::videoWidth(WebCore::HTMLVideoElement *this)
{
  return MEMORY[0x1E0DD7A58](this);
}

uint64_t WebCore::HTMLVideoElement::videoHeight(WebCore::HTMLVideoElement *this)
{
  return MEMORY[0x1E0DD7A60](this);
}

uint64_t WebCore::HTMLVideoElement::webkitSupportsPresentationMode()
{
  return MEMORY[0x1E0DD7A68]();
}

uint64_t WebCore::NotificationData::dictionaryRepresentation(WebCore::NotificationData *this)
{
  return MEMORY[0x1E0DD7A78](this);
}

uint64_t WebCore::ResourceResponse::nsURLResponse(WebCore::ResourceResponse *this)
{
  return MEMORY[0x1E0DD7A80](this);
}

uint64_t WebCore::SWContextManager::connection(WebCore::SWContextManager *this)
{
  return MEMORY[0x1E0DD7A88](this);
}

uint64_t WebCore::SWContextManager::serviceWorkerThreadProxy()
{
  return MEMORY[0x1E0DD7A90]();
}

uint64_t WebCore::SWContextManager::serviceWorkerThreadProxyFromBackgroundThread()
{
  return MEMORY[0x1E0DD7A98]();
}

uint64_t WebCore::SpeechRecognizer::clientIdentifier(WebCore::SpeechRecognizer *this)
{
  return MEMORY[0x1E0DD7AA0](this);
}

uint64_t WebCore::TrackPrivateBase::hasClients(WebCore::TrackPrivateBase *this)
{
  return MEMORY[0x1E0DD7AA8](this);
}

uint64_t WebCore::TrackPrivateBase::operator==()
{
  return MEMORY[0x1E0DD7AB0]();
}

uint64_t WebCore::UserMediaRequest::topLevelDocumentOrigin(WebCore::UserMediaRequest *this)
{
  return MEMORY[0x1E0DD7AF0](this);
}

uint64_t WebCore::UserMediaRequest::userMediaDocumentOrigin(WebCore::UserMediaRequest *this)
{
  return MEMORY[0x1E0DD7AF8](this);
}

uint64_t WebCore::UserMediaRequest::document(WebCore::UserMediaRequest *this)
{
  return MEMORY[0x1E0DD7B00](this);
}

uint64_t WebCore::VisibleSelection::firstRange(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B08](this);
}

uint64_t WebCore::VisibleSelection::hasEditableStyle(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B10](this);
}

uint64_t WebCore::VisibleSelection::isContentEditable(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B18](this);
}

uint64_t WebCore::VisibleSelection::isInPasswordField(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B20](this);
}

uint64_t WebCore::VisibleSelection::toNormalizedRange(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B28](this);
}

uint64_t WebCore::VisibleSelection::rootEditableElement(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B30](this);
}

uint64_t WebCore::VisibleSelection::isContentRichlyEditable(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B38](this);
}

uint64_t WebCore::VisibleSelection::canEnableWritingSuggestions(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B40](this);
}

uint64_t WebCore::VisibleSelection::isInAutoFilledAndViewableField(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B48](this);
}

uint64_t WebCore::VisibleSelection::range(WebCore::VisibleSelection *this)
{
  return MEMORY[0x1E0DD7B58](this);
}

uint64_t WebCore::CredentialStorage::originsWithCredentials(WebCore::CredentialStorage *this)
{
  return MEMORY[0x1E0DD7B60](this);
}

uint64_t WebCore::FullscreenManager::fullscreenElement(WebCore::FullscreenManager *this)
{
  return MEMORY[0x1E0DD7B68](this);
}

uint64_t WebCore::GraphicsContextCG::platformContext(WebCore::GraphicsContextCG *this)
{
  return MEMORY[0x1E0DD7B78](this);
}

uint64_t WebCore::HTMLAnchorElement::href(WebCore::HTMLAnchorElement *this)
{
  return MEMORY[0x1E0DD7B80](this);
}

uint64_t WebCore::HTMLOptionElement::displayLabel(WebCore::HTMLOptionElement *this)
{
  return MEMORY[0x1E0DD7B98](this);
}

uint64_t WebCore::HTMLOptionElement::ownerSelectElement(WebCore::HTMLOptionElement *this)
{
  return MEMORY[0x1E0DD7BA0](this);
}

uint64_t WebCore::HTMLOptionElement::isDisabledFormControl(WebCore::HTMLOptionElement *this)
{
  return MEMORY[0x1E0DD7BA8](this);
}

uint64_t WebCore::HTMLOptionElement::index(WebCore::HTMLOptionElement *this)
{
  return MEMORY[0x1E0DD7BC0](this);
}

uint64_t WebCore::HTMLOptionElement::selected()
{
  return MEMORY[0x1E0DD7BD8]();
}

uint64_t WebCore::HTMLSelectElement::selectedIndex(WebCore::HTMLSelectElement *this)
{
  return MEMORY[0x1E0DD7BF0](this);
}

uint64_t WebCore::HTMLSelectElement::listItems(WebCore::HTMLSelectElement *this)
{
  return MEMORY[0x1E0DD7C08](this);
}

uint64_t WebCore::LibWebRTCProvider::isEnumeratingAllNetworkInterfacesEnabled(WebCore::LibWebRTCProvider *this)
{
  return MEMORY[0x1E0DD7C10](this);
}

uint64_t WebCore::MouseRelatedEvent::locationInRootViewCoordinates(WebCore::MouseRelatedEvent *this)
{
  return MEMORY[0x1E0DD7C18](this);
}

uint64_t WebCore::PublicSuffixStore::publicSuffix(WebCore::PublicSuffixStore *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD7C20](this, a2);
}

uint64_t WebCore::PublicSuffixStore::isPublicSuffix()
{
  return MEMORY[0x1E0DD7C28]();
}

uint64_t WebCore::PublicSuffixStore::topPrivatelyControlledDomain()
{
  return MEMORY[0x1E0DD7C30]();
}

uint64_t WebCore::ResourceErrorBase::isolatedCopy(WebCore::ResourceErrorBase *this)
{
  return MEMORY[0x1E0DD7C40](this);
}

uint64_t WebCore::ResourceErrorBase::lazyInit(WebCore::ResourceErrorBase *this)
{
  return MEMORY[0x1E0DD7C48](this);
}

uint64_t WebCore::SQLiteTransaction::wasRolledBackBySqlite(WebCore::SQLiteTransaction *this)
{
  return MEMORY[0x1E0DD7C50](this);
}

uint64_t WebCore::ScrollingTreeNode::isRootNode(WebCore::ScrollingTreeNode *this)
{
  return MEMORY[0x1E0DD7C58](this);
}

uint64_t WebCore::SelectionGeometry::rect(WebCore::SelectionGeometry *this)
{
  return MEMORY[0x1E0DD7C60](this);
}

uint64_t WebCore::SubresourceLoader::originalHeaders(WebCore::SubresourceLoader *this)
{
  return MEMORY[0x1E0DD7C68](this);
}

uint64_t WebCore::DOMWindowExtension::frame(WebCore::DOMWindowExtension *this)
{
  return MEMORY[0x1E0DD7C70](this);
}

uint64_t WebCore::MediaSourcePrivate::hasBufferedData(WebCore::MediaSourcePrivate *this)
{
  return MEMORY[0x1E0DD7CA0](this);
}

uint64_t WebCore::MediaSourcePrivate::ensureOnDispatcher()
{
  return MEMORY[0x1E0DD7CA8]();
}

uint64_t WebCore::MediaSourcePrivate::client(WebCore::MediaSourcePrivate *this)
{
  return MEMORY[0x1E0DD7CB0](this);
}

uint64_t WebCore::MediaSourcePrivate::buffered(WebCore::MediaSourcePrivate *this)
{
  return MEMORY[0x1E0DD7CB8](this);
}

uint64_t WebCore::MediaSourcePrivate::duration(WebCore::MediaSourcePrivate *this)
{
  return MEMORY[0x1E0DD7CC0](this);
}

uint64_t WebCore::MediaStreamPrivate::hasVideo(WebCore::MediaStreamPrivate *this)
{
  return MEMORY[0x1E0DD7CC8](this);
}

uint64_t WebCore::MessagePortChannel::hasAnyMessagesPendingOrInFlight(WebCore::MessagePortChannel *this)
{
  return MEMORY[0x1E0DD7CD0](this);
}

uint64_t WebCore::NetworkLoadMetrics::isolatedCopy(WebCore::NetworkLoadMetrics *this)
{
  return MEMORY[0x1E0DD7CD8](this);
}

uint64_t WebCore::ParsedContentRange::headerValue(WebCore::ParsedContentRange *this)
{
  return MEMORY[0x1E0DD7CE0](this);
}

uint64_t WebCore::PlatformPasteboard::readBuffer()
{
  return MEMORY[0x1E0DD7CE8]();
}

uint64_t WebCore::PlatformPasteboard::readString(WebCore::PlatformPasteboard *this, uint64_t a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD7CF0](this, a2, a3);
}

uint64_t WebCore::PlatformPasteboard::changeCount(WebCore::PlatformPasteboard *this)
{
  return MEMORY[0x1E0DD7CF8](this);
}

uint64_t WebCore::PlatformPasteboard::bufferForType(WebCore::PlatformPasteboard *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD7D00](this, a2);
}

uint64_t WebCore::PlatformPasteboard::numberOfFiles(WebCore::PlatformPasteboard *this)
{
  return MEMORY[0x1E0DD7D08](this);
}

uint64_t WebCore::PlatformPasteboard::stringForType(WebCore::PlatformPasteboard *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD7D10](this, a2);
}

uint64_t WebCore::PlatformPasteboard::allStringsForType(WebCore::PlatformPasteboard *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD7D18](this, a2);
}

uint64_t WebCore::PlatformPasteboard::getPathnamesForType()
{
  return MEMORY[0x1E0DD7D20]();
}

uint64_t WebCore::PlatformPasteboard::typesSafeForDOMToReadAndWrite(WebCore::PlatformPasteboard *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD7D28](this, a2);
}

uint64_t WebCore::PlatformPasteboard::containsStringSafeForDOMToReadForType(WebCore::PlatformPasteboard *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD7D30](this, a2);
}

uint64_t WebCore::PlatformPasteboard::count(WebCore::PlatformPasteboard *this)
{
  return MEMORY[0x1E0DD7D38](this);
}

uint64_t WebCore::PlatformPasteboard::readURL(WebCore::PlatformPasteboard *this, uint64_t a2, WTF::String *a3)
{
  return MEMORY[0x1E0DD7D40](this, a2, a3);
}

uint64_t WebCore::PlatformPasteboard::getTypes()
{
  return MEMORY[0x1E0DD7D48]();
}

uint64_t WebCore::PlatformTimeRanges::maximumBufferedTime(WebCore::PlatformTimeRanges *this)
{
  return MEMORY[0x1E0DD7D50](this);
}

uint64_t WebCore::PlatformTimeRanges::end(WebCore::PlatformTimeRanges *this)
{
  return MEMORY[0x1E0DD7D58](this);
}

uint64_t WebCore::PlatformTimeRanges::start(WebCore::PlatformTimeRanges *this)
{
  return MEMORY[0x1E0DD7D60](this);
}

uint64_t WebCore::PlatformTimeRanges::toString(WebCore::PlatformTimeRanges *this)
{
  return MEMORY[0x1E0DD7D68](this);
}

uint64_t WebCore::RenderLayerBacking::contentsBox(WebCore::RenderLayerBacking *this)
{
  return MEMORY[0x1E0DD7D70](this);
}

uint64_t WebCore::RenderLayerBacking::compositedBounds(WebCore::RenderLayerBacking *this)
{
  return MEMORY[0x1E0DD7D78](this);
}

uint64_t WebCore::ScrollingStateTree::rootStateNode(WebCore::ScrollingStateTree *this)
{
  return MEMORY[0x1E0DD7D80](this);
}

uint64_t WebCore::SecurityOriginData::securityOrigin(WebCore::SecurityOriginData *this)
{
  return MEMORY[0x1E0DD7D88](this);
}

uint64_t WebCore::SecurityOriginData::databaseIdentifier(WebCore::SecurityOriginData *this)
{
  return MEMORY[0x1E0DD7D90](this);
}

uint64_t WebCore::SecurityOriginData::toURL(WebCore::SecurityOriginData *this)
{
  return MEMORY[0x1E0DD7D98](this);
}

uint64_t WebCore::SecurityOriginData::toString(WebCore::SecurityOriginData *this)
{
  return MEMORY[0x1E0DD7DA0](this);
}

uint64_t WebCore::SharedMemoryHandle::setOwnershipOfMemory()
{
  return MEMORY[0x1E0DD7DA8]();
}

uint64_t WebCore::SharedMemoryHandle::takeOwnershipOfMemory()
{
  return MEMORY[0x1E0DD7DB0]();
}

uint64_t WebCore::DragCaretController::isContentRichlyEditable(WebCore::DragCaretController *this)
{
  return MEMORY[0x1E0DD7E08](this);
}

uint64_t WebCore::DragCaretController::caretRectInRootViewCoordinates(WebCore::DragCaretController *this)
{
  return MEMORY[0x1E0DD7E10](this);
}

uint64_t WebCore::DragCaretController::editableElementRectInRootViewCoordinates(WebCore::DragCaretController *this)
{
  return MEMORY[0x1E0DD7E18](this);
}

uint64_t WebCore::HTMLOptGroupElement::groupLabelText(WebCore::HTMLOptGroupElement *this)
{
  return MEMORY[0x1E0DD7E20](this);
}

uint64_t WebCore::HTMLOptGroupElement::ownerSelectElement(WebCore::HTMLOptGroupElement *this)
{
  return MEMORY[0x1E0DD7E28](this);
}

uint64_t WebCore::HTMLTextAreaElement::value(WebCore::HTMLTextAreaElement *this)
{
  return MEMORY[0x1E0DD7E48](this);
}

uint64_t WebCore::ImageDecoderAVFObjC::frameCount(WebCore::ImageDecoderAVFObjC *this)
{
  return MEMORY[0x1E0DD7E50](this);
}

uint64_t WebCore::ImageDecoderAVFObjC::frameInfos(WebCore::ImageDecoderAVFObjC *this)
{
  return MEMORY[0x1E0DD7E58](this);
}

uint64_t WebCore::ImageDecoderAVFObjC::size(WebCore::ImageDecoderAVFObjC *this)
{
  return MEMORY[0x1E0DD7E60](this);
}

uint64_t WebCore::InspectorController::isUnderTest(WebCore::InspectorController *this)
{
  return MEMORY[0x1E0DD7E68](this);
}

uint64_t WebCore::InspectorController::getHighlight()
{
  return MEMORY[0x1E0DD7E70]();
}

uint64_t WebCore::InspectorController::drawHighlight(WebCore::InspectorController *this, WebCore::GraphicsContext *a2)
{
  return MEMORY[0x1E0DD7E78](this, a2);
}

uint64_t WebCore::NotificationPayload::dictionaryRepresentation(WebCore::NotificationPayload *this)
{
  return MEMORY[0x1E0DD7E80](this);
}

uint64_t WebCore::PaymentSessionError::platformError(WebCore::PaymentSessionError *this)
{
  return MEMORY[0x1E0DD7E88](this);
}

uint64_t WebCore::ProtectionSpaceBase::isPasswordBased(WebCore::ProtectionSpaceBase *this)
{
  return MEMORY[0x1E0DD7E90](this);
}

uint64_t WebCore::ProtectionSpaceBase::isProxy(WebCore::ProtectionSpaceBase *this)
{
  return MEMORY[0x1E0DD7E98](this);
}

uint64_t WebCore::RealtimeMediaSource::intrinsicSize(WebCore::RealtimeMediaSource *this)
{
  return MEMORY[0x1E0DD7EA0](this);
}

uint64_t WebCore::RealtimeMediaSource::deviceIDHashSalts(WebCore::RealtimeMediaSource *this)
{
  return MEMORY[0x1E0DD7EA8](this);
}

uint64_t WebCore::RequestedScrollData::destinationPosition()
{
  return MEMORY[0x1E0DD7EB0]();
}

uint64_t WebCore::ResourceRequestBase::httpMethod(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EB8](this);
}

uint64_t WebCore::ResourceRequestBase::httpOrigin(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EC0](this);
}

uint64_t WebCore::ResourceRequestBase::isSameSite(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EC8](this);
}

uint64_t WebCore::ResourceRequestBase::cachePolicy(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7ED0](this);
}

uint64_t WebCore::ResourceRequestBase::httpReferrer(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7ED8](this);
}

uint64_t WebCore::ResourceRequestBase::isThirdParty(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EE0](this);
}

uint64_t WebCore::ResourceRequestBase::httpUserAgent(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EE8](this);
}

uint64_t WebCore::ResourceRequestBase::isConditional(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EF0](this);
}

uint64_t WebCore::ResourceRequestBase::httpContentType(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7EF8](this);
}

uint64_t WebCore::ResourceRequestBase::httpHeaderField()
{
  return MEMORY[0x1E0DD7F00]();
}

{
  return MEMORY[0x1E0DD7F08]();
}

uint64_t WebCore::ResourceRequestBase::timeoutInterval(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F10](this);
}

uint64_t WebCore::ResourceRequestBase::httpHeaderFields(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F18](this);
}

uint64_t WebCore::ResourceRequestBase::redirectedRequest()
{
  return MEMORY[0x1E0DD7F20]();
}

uint64_t WebCore::ResourceRequestBase::hasHTTPHeaderField()
{
  return MEMORY[0x1E0DD7F28]();
}

uint64_t WebCore::ResourceRequestBase::firstPartyForCookies(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F30](this);
}

uint64_t WebCore::ResourceRequestBase::url(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F38](this);
}

uint64_t WebCore::ResourceRequestBase::isNull(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F40](this);
}

uint64_t WebCore::ResourceRequestBase::isEmpty(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F48](this);
}

uint64_t WebCore::ResourceRequestBase::httpBody(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F50](this);
}

uint64_t WebCore::ResourceRequestBase::priority(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F58](this);
}

uint64_t WebCore::ResourceRequestBase::hasUpload(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F60](this);
}

uint64_t WebCore::ResourceRequestBase::isTopSite(WebCore::ResourceRequestBase *this)
{
  return MEMORY[0x1E0DD7F68](this);
}

uint64_t WebCore::SourceBufferPrivate::isBufferFullFor(WebCore::SourceBufferPrivate *this)
{
  return MEMORY[0x1E0DD7F70](this);
}

uint64_t WebCore::SourceBufferPrivate::ensureOnDispatcher()
{
  return MEMORY[0x1E0DD7F78]();
}

uint64_t WebCore::SourceBufferPrivate::trackBuffersRanges(WebCore::SourceBufferPrivate *this)
{
  return MEMORY[0x1E0DD7F80](this);
}

uint64_t WebCore::SourceBufferPrivate::client(WebCore::SourceBufferPrivate *this)
{
  return MEMORY[0x1E0DD7F88](this);
}

uint64_t WebCore::SourceBufferPrivate::canAppend(WebCore::SourceBufferPrivate *this)
{
  return MEMORY[0x1E0DD7F90](this);
}

uint64_t WebCore::AVAssetMIMETypeCache::isAvailable(WebCore::AVAssetMIMETypeCache *this)
{
  return MEMORY[0x1E0DD7FA0](this);
}

uint64_t WebCore::ByteArrayPixelBuffer::span(WebCore::ByteArrayPixelBuffer *this)
{
  return MEMORY[0x1E0DD7FA8](this);
}

uint64_t WebCore::FontAttributeChanges::editAction(WebCore::FontAttributeChanges *this)
{
  return MEMORY[0x1E0DD7FC0](this);
}

uint64_t WebCore::FontAttributeChanges::createEditingStyle(WebCore::FontAttributeChanges *this)
{
  return MEMORY[0x1E0DD7FC8](this);
}

uint64_t WebCore::HTMLTableCellElement::cellAbove(WebCore::HTMLTableCellElement *this)
{
  return MEMORY[0x1E0DD7FE8](this);
}

uint64_t WebCore::ImageBufferCGBackend::applyBaseTransform(WebCore::ImageBufferCGBackend *this, WebCore::GraphicsContextCG *a2)
{
  return MEMORY[0x1E0DD8008](this, a2);
}

uint64_t WebCore::LowPowerModeNotifier::isLowPowerModeEnabled(WebCore::LowPowerModeNotifier *this)
{
  return MEMORY[0x1E0DD8010](this);
}

uint64_t WebCore::ResourceResponseBase::httpVersion(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8020](this);
}

uint64_t WebCore::ResourceResponseBase::isAttachment(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8028](this);
}

uint64_t WebCore::ResourceResponseBase::isRedirection(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8030](this);
}

uint64_t WebCore::ResourceResponseBase::httpStatusCode(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8038](this);
}

uint64_t WebCore::ResourceResponseBase::isInHTTPFamily(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8040](this);
}

uint64_t WebCore::ResourceResponseBase::getResponseData(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8048](this);
}

uint64_t WebCore::ResourceResponseBase::httpHeaderField()
{
  return MEMORY[0x1E0DD8050]();
}

uint64_t WebCore::ResourceResponseBase::httpHeaderFields(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8058](this);
}

uint64_t WebCore::ResourceResponseBase::textEncodingName(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8060](this);
}

uint64_t WebCore::ResourceResponseBase::suggestedFilename(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8068](this);
}

uint64_t WebCore::ResourceResponseBase::cacheControlMaxAge(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8070](this);
}

uint64_t WebCore::ResourceResponseBase::expectedContentLength(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8078](this);
}

uint64_t WebCore::ResourceResponseBase::includeCertificateInfo()
{
  return MEMORY[0x1E0DD8080]();
}

uint64_t WebCore::ResourceResponseBase::hasCacheValidatorFields(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8088](this);
}

uint64_t WebCore::ResourceResponseBase::isAttachmentWithFilename(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8090](this);
}

uint64_t WebCore::ResourceResponseBase::containsInvalidHTTPHeaders(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD8098](this);
}

uint64_t WebCore::ResourceResponseBase::cacheControlContainsNoCache(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80A0](this);
}

uint64_t WebCore::ResourceResponseBase::cacheControlContainsNoStore(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80A8](this);
}

uint64_t WebCore::ResourceResponseBase::cacheControlStaleWhileRevalidate(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80B0](this);
}

uint64_t WebCore::ResourceResponseBase::url(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80B8](this);
}

uint64_t WebCore::ResourceResponseBase::source(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80C0](this);
}

uint64_t WebCore::ResourceResponseBase::expires(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80C8](this);
}

uint64_t WebCore::ResourceResponseBase::isHTTP09(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80D0](this);
}

uint64_t WebCore::ResourceResponseBase::mimeType(WebCore::ResourceResponseBase *this)
{
  return MEMORY[0x1E0DD80D8](this);
}

uint64_t WebCore::ResourceResponseData::isolatedCopy(WebCore::ResourceResponseData *this)
{
  return MEMORY[0x1E0DD80E0](this);
}

uint64_t WebCore::SWServerRegistration::shouldSoftUpdate()
{
  return MEMORY[0x1E0DD80E8]();
}

uint64_t WebCore::SWServerRegistration::data(WebCore::SWServerRegistration *this)
{
  return MEMORY[0x1E0DD80F0](this);
}

uint64_t WebCore::ScrollingCoordinator::page(WebCore::ScrollingCoordinator *this)
{
  return MEMORY[0x1E0DD80F8](this);
}

uint64_t WebCore::SharedVideoFrameInfo::storageSize(WebCore::SharedVideoFrameInfo *this)
{
  return MEMORY[0x1E0DD8100](this);
}

uint64_t WebCore::SharedVideoFrameInfo::isReadWriteSupported(WebCore::SharedVideoFrameInfo *this)
{
  return MEMORY[0x1E0DD8108](this);
}

uint64_t WebCore::SharedVideoFrameInfo::createCompatibleBufferPool(WebCore::SharedVideoFrameInfo *this)
{
  return MEMORY[0x1E0DD8110](this);
}

uint64_t WebCore::TransformationMatrix::isInvertible(WebCore::TransformationMatrix *this)
{
  return MEMORY[0x1E0DD8118](this);
}

uint64_t WebCore::TransformationMatrix::operator CATransform3D()
{
  return MEMORY[0x1E0DD8120]();
}

uint64_t WebCore::ARKitBadgeSystemImage::imageIdentifier(WebCore::ARKitBadgeSystemImage *this)
{
  return MEMORY[0x1E0DD8128](this);
}

uint64_t WebCore::AuthenticatorResponse::attachment(WebCore::AuthenticatorResponse *this)
{
  return MEMORY[0x1E0DD8130](this);
}

uint64_t WebCore::AuthenticatorResponse::extensions(WebCore::AuthenticatorResponse *this)
{
  return MEMORY[0x1E0DD8138](this);
}

uint64_t WebCore::AuthenticatorResponse::rawId(WebCore::AuthenticatorResponse *this)
{
  return MEMORY[0x1E0DD8140](this);
}

uint64_t WebCore::BackForwardController::forwardCount(WebCore::BackForwardController *this)
{
  return MEMORY[0x1E0DD8148](this);
}

uint64_t WebCore::BackForwardController::backCount(WebCore::BackForwardController *this)
{
  return MEMORY[0x1E0DD8158](this);
}

uint64_t WebCore::BackgroundFetchEngine::backgroundFetch(WebCore::BackgroundFetchEngine *this, const WebCore::ServiceWorkerRegistrationKey *a2, const WTF::String *a3)
{
  return MEMORY[0x1E0DD8160](this, a2, a3);
}

uint64_t WebCore::ContentSecurityPolicy::responseHeaders(WebCore::ContentSecurityPolicy *this)
{
  return MEMORY[0x1E0DD8168](this);
}

uint64_t WebCore::ContentSecurityPolicy::allowFrameAncestors()
{
  return MEMORY[0x1E0DD8170]();
}

uint64_t WebCore::ContentSecurityPolicy::allowConnectToSource()
{
  return MEMORY[0x1E0DD8178]();
}

uint64_t WebCore::ContentSecurityPolicy::allowScriptFromSource()
{
  return MEMORY[0x1E0DD8180]();
}

uint64_t WebCore::ContentSecurityPolicy::allowWorkerFromSource()
{
  return MEMORY[0x1E0DD8188]();
}

uint64_t WebCore::ContentSecurityPolicy::overridesXFrameOptions(WebCore::ContentSecurityPolicy *this)
{
  return MEMORY[0x1E0DD8190](this);
}

uint64_t WebCore::ContentSecurityPolicy::upgradeInsecureRequestIfNeeded()
{
  return MEMORY[0x1E0DD8198]();
}

uint64_t WebCore::DestinationColorSpace::supportsOutput(WebCore::DestinationColorSpace *this)
{
  return MEMORY[0x1E0DD81A0](this);
}

uint64_t WebCore::HTMLAttachmentElement::attachmentType(WebCore::HTMLAttachmentElement *this)
{
  return MEMORY[0x1E0DD81A8](this);
}

uint64_t WebCore::HTMLAttachmentElement::attachmentTitle(WebCore::HTMLAttachmentElement *this)
{
  return MEMORY[0x1E0DD81B0](this);
}

uint64_t WebCore::HTMLAttachmentElement::file(WebCore::HTMLAttachmentElement *this)
{
  return MEMORY[0x1E0DD81B8](this);
}

uint64_t WebCore::MediaKeySystemRequest::topLevelDocumentOrigin(WebCore::MediaKeySystemRequest *this)
{
  return MEMORY[0x1E0DD81F8](this);
}

uint64_t WebCore::MediaKeySystemRequest::document(WebCore::MediaKeySystemRequest *this)
{
  return MEMORY[0x1E0DD8200](this);
}

uint64_t WebCore::NetworkStorageSession::hasCookies()
{
  return MEMORY[0x1E0DD8208]();
}

uint64_t WebCore::NetworkStorageSession::cookieStorage(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD8218](this);
}

uint64_t WebCore::NetworkStorageSession::cookiesForDOM()
{
  return MEMORY[0x1E0DD8220]();
}

uint64_t WebCore::NetworkStorageSession::getRawCookies()
{
  return MEMORY[0x1E0DD8228]();
}

uint64_t WebCore::NetworkStorageSession::cookiesEnabled()
{
  return MEMORY[0x1E0DD8230]();
}

uint64_t WebCore::NetworkStorageSession::nsCookieStorage(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD8238](this);
}

uint64_t WebCore::NetworkStorageSession::hasStorageAccess()
{
  return MEMORY[0x1E0DD8240]();
}

uint64_t WebCore::NetworkStorageSession::setCookieFromDOM()
{
  return MEMORY[0x1E0DD8248]();
}

uint64_t WebCore::NetworkStorageSession::setCookiesFromDOM()
{
  return MEMORY[0x1E0DD8250]();
}

uint64_t WebCore::NetworkStorageSession::cookieAcceptPolicy(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD8258](this);
}

uint64_t WebCore::NetworkStorageSession::shouldBlockCookies()
{
  return MEMORY[0x1E0DD8260]();
}

{
  return MEMORY[0x1E0DD8268]();
}

uint64_t WebCore::NetworkStorageSession::cookiesForDOMAsVector()
{
  return MEMORY[0x1E0DD8270]();
}

uint64_t WebCore::NetworkStorageSession::trackingPreventionEnabled(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD8278](this);
}

uint64_t WebCore::NetworkStorageSession::getAllStorageAccessEntries(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD8280](this);
}

uint64_t WebCore::NetworkStorageSession::shouldBlockThirdPartyCookies()
{
  return MEMORY[0x1E0DD8288]();
}

uint64_t WebCore::NetworkStorageSession::cookieRequestHeaderFieldValue()
{
  return MEMORY[0x1E0DD8290]();
}

uint64_t WebCore::NetworkStorageSession::trackingPreventionDebugLoggingEnabled(WebCore::NetworkStorageSession *this)
{
  return MEMORY[0x1E0DD82A0](this);
}

uint64_t WebCore::NetworkStorageSession::shouldBlockThirdPartyCookiesButKeepFirstPartyCookiesFor()
{
  return MEMORY[0x1E0DD82A8]();
}

uint64_t WebCore::RemoteCommandListener::supportsSeeking(WebCore::RemoteCommandListener *this)
{
  return MEMORY[0x1E0DD82B0](this);
}

uint64_t WebCore::RemoteCommandListener::supportedCommands(WebCore::RemoteCommandListener *this)
{
  return MEMORY[0x1E0DD82B8](this);
}

uint64_t WebCore::ScrollSnapOffsetsInfo<float,WebCore::FloatRect>::closestSnapOffset<WebCore::FloatSize,WebCore::FloatPoint>()
{
  return MEMORY[0x1E0DD82C0]();
}

uint64_t WebCore::ShareableBitmapHandle::setOwnershipOfMemory()
{
  return MEMORY[0x1E0DD82C8]();
}

uint64_t WebCore::ShareableBitmapHandle::takeOwnershipOfMemory()
{
  return MEMORY[0x1E0DD82D0]();
}

uint64_t WebCore::UserContentURLPattern::matchesHost(WebCore::UserContentURLPattern *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD82D8](this, a2);
}

uint64_t WebCore::UserContentURLPattern::matchesPath(WebCore::UserContentURLPattern *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD82E0](this, a2);
}

uint64_t WebCore::UserContentURLPattern::originalHost(WebCore::UserContentURLPattern *this)
{
  return MEMORY[0x1E0DD82E8](this);
}

uint64_t WebCore::UserContentURLPattern::matchesScheme(WebCore::UserContentURLPattern *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD82F0](this, a2);
}

uint64_t WebCore::UserContentURLPattern::matchesScheme(WebCore::UserContentURLPattern *this, const WebCore::UserContentURLPattern *a2)
{
  return MEMORY[0x1E0DD82F8](this, a2);
}

uint64_t WebCore::UserContentURLPattern::operator==()
{
  return MEMORY[0x1E0DD8300]();
}

uint64_t WebCore::ViewportConfiguration::layoutSize(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8308](this);
}

uint64_t WebCore::ViewportConfiguration::layoutWidth(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8310](this);
}

uint64_t WebCore::ViewportConfiguration::initialScale(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8318](this);
}

uint64_t WebCore::ViewportConfiguration::minimumScale(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8320](this);
}

uint64_t WebCore::ViewportConfiguration::allowsUserScaling(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8328](this);
}

uint64_t WebCore::ViewportConfiguration::initialScaleIgnoringContentSize(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8330](this);
}

uint64_t WebCore::ViewportConfiguration::allowsUserScalingIgnoringAlwaysScalable(WebCore::ViewportConfiguration *this)
{
  return MEMORY[0x1E0DD8338](this);
}

uint64_t WebCore::AcceleratedEffectStack::hasEffects(WebCore::AcceleratedEffectStack *this)
{
  return MEMORY[0x1E0DD8340](this);
}

uint64_t WebCore::DefaultFilterOperation::representedType(WebCore::DefaultFilterOperation *this)
{
  return MEMORY[0x1E0DD8348](this);
}

uint64_t WebCore::FontCustomPlatformData::serializedData(WebCore::FontCustomPlatformData *this)
{
  return MEMORY[0x1E0DD8350](this);
}

uint64_t WebCore::FragmentedSharedBuffer::forEachSegment()
{
  return MEMORY[0x1E0DD8358]();
}

uint64_t WebCore::FragmentedSharedBuffer::makeContiguous(WebCore::FragmentedSharedBuffer *this)
{
  return MEMORY[0x1E0DD8360](this);
}

uint64_t WebCore::FragmentedSharedBuffer::tryCreateArrayBuffer(WebCore::FragmentedSharedBuffer *this)
{
  return MEMORY[0x1E0DD8370](this);
}

uint64_t WebCore::FragmentedSharedBuffer::forEachSegmentAsSharedBuffer()
{
  return MEMORY[0x1E0DD8378]();
}

uint64_t WebCore::FragmentedSharedBuffer::copy(WebCore::FragmentedSharedBuffer *this)
{
  return MEMORY[0x1E0DD8380](this);
}

uint64_t WebCore::FragmentedSharedBuffer::toIPCData(WebCore::FragmentedSharedBuffer *this)
{
  return MEMORY[0x1E0DD8388](this);
}

uint64_t WebCore::HTMLFormControlElement::autofillData(WebCore::HTMLFormControlElement *this)
{
  return MEMORY[0x1E0DD83B0](this);
}

uint64_t WebCore::HTMLFormControlElement::shouldAutocorrect(WebCore::HTMLFormControlElement *this)
{
  return MEMORY[0x1E0DD83B8](this);
}

uint64_t WebCore::HTMLFormControlElement::autocapitalizeType(WebCore::HTMLFormControlElement *this)
{
  return MEMORY[0x1E0DD83C0](this);
}

uint64_t WebCore::ResourceLoadStatistics::toString(WebCore::ResourceLoadStatistics *this)
{
  return MEMORY[0x1E0DD83D0](this);
}

uint64_t WebCore::ScriptExecutionContext::globalObject(WebCore::ScriptExecutionContext *this)
{
  return MEMORY[0x1E0DD83D8](this);
}

uint64_t WebCore::AcceleratedEffectValues::computedTransformationMatrix(WebCore::AcceleratedEffectValues *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD83E8](this, a2);
}

uint64_t WebCore::AcceleratedEffectValues::clone(WebCore::AcceleratedEffectValues *this)
{
  return MEMORY[0x1E0DD83F0](this);
}

uint64_t WebCore::FrameLoaderStateMachine::isDisplayingInitialEmptyDocument(WebCore::FrameLoaderStateMachine *this)
{
  return MEMORY[0x1E0DD8408](this);
}

uint64_t WebCore::PrivateClickMeasurement::tokenPublicKeyURL(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8410](this);
}

uint64_t WebCore::PrivateClickMeasurement::tokenSignatureURL(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8418](this);
}

uint64_t WebCore::PrivateClickMeasurement::tokenSignatureJSON(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8420](this);
}

uint64_t WebCore::PrivateClickMeasurement::attributionReportJSON(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8428](this);
}

uint64_t WebCore::PrivateClickMeasurement::hasHigherPriorityThan(WebCore::PrivateClickMeasurement *this, const WebCore::PrivateClickMeasurement *a2)
{
  return MEMORY[0x1E0DD8430](this, a2);
}

uint64_t WebCore::PrivateClickMeasurement::attributionReportClickSourceURL(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8438](this);
}

uint64_t WebCore::PrivateClickMeasurement::attributionReportClickDestinationURL(WebCore::PrivateClickMeasurement *this)
{
  return MEMORY[0x1E0DD8440](this);
}

uint64_t WebCore::SpeechRecognitionUpdate::error(WebCore::SpeechRecognitionUpdate *this)
{
  return MEMORY[0x1E0DD8448](this);
}

uint64_t WebCore::SpeechRecognitionUpdate::result(WebCore::SpeechRecognitionUpdate *this)
{
  return MEMORY[0x1E0DD8450](this);
}

uint64_t WebCore::CAAudioStreamDescription::sampleRate(WebCore::CAAudioStreamDescription *this)
{
  return MEMORY[0x1E0DD8458](this);
}

uint64_t WebCore::CAAudioStreamDescription::bytesPerFrame(WebCore::CAAudioStreamDescription *this)
{
  return MEMORY[0x1E0DD8460](this);
}

uint64_t WebCore::CAAudioStreamDescription::numberOfChannelStreams(WebCore::CAAudioStreamDescription *this)
{
  return MEMORY[0x1E0DD8470](this);
}

uint64_t WebCore::CAAudioStreamDescription::operator==()
{
  return MEMORY[0x1E0DD8478]();
}

uint64_t WebCore::CachedResourceHandleBase::get(WebCore::CachedResourceHandleBase *this)
{
  return MEMORY[0x1E0DD8480](this);
}

uint64_t WebCore::DocumentMarkerController::markersFor()
{
  return MEMORY[0x1E0DD8488]();
}

uint64_t WebCore::AsyncScrollingCoordinator::frameViewForScrollingNode()
{
  return MEMORY[0x1E0DD8490]();
}

uint64_t WebCore::PlatformSpeechSynthesizer::voiceList(WebCore::PlatformSpeechSynthesizer *this)
{
  return MEMORY[0x1E0DD8498](this);
}

uint64_t WebCore::WebSocketChannelInspector::didCloseWebSocket(WebCore::WebSocketChannelInspector *this)
{
  return MEMORY[0x1E0DD84A0](this);
}

uint64_t WebCore::WebSocketChannelInspector::didCreateWebSocket(WebCore::WebSocketChannelInspector *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD84A8](this, a2);
}

uint64_t WebCore::WebSocketChannelInspector::progressIdentifier(WebCore::WebSocketChannelInspector *this)
{
  return MEMORY[0x1E0DD84B0](this);
}

uint64_t WebCore::WebSocketChannelInspector::didSendWebSocketFrame()
{
  return MEMORY[0x1E0DD84B8]();
}

uint64_t WebCore::WebSocketChannelInspector::willSendWebSocketHandshakeRequest(WebCore::WebSocketChannelInspector *this, const WebCore::ResourceRequest *a2)
{
  return MEMORY[0x1E0DD84C0](this, a2);
}

uint64_t WebCore::WebSocketChannelInspector::didReceiveWebSocketHandshakeResponse(WebCore::WebSocketChannelInspector *this, const WebCore::ResourceResponse *a2)
{
  return MEMORY[0x1E0DD84C8](this, a2);
}

uint64_t WebCore::HTMLTextFormControlElement::lastChangeWasUserEdit(WebCore::HTMLTextFormControlElement *this)
{
  return MEMORY[0x1E0DD84E8](this);
}

uint64_t WebCore::HTMLTextFormControlElement::visiblePositionForIndex(WebCore::HTMLTextFormControlElement *this)
{
  return MEMORY[0x1E0DD84F0](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::audioBitRate(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD84F8](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::videoBitRate(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD8500](this);
}

uint64_t WebCore::MediaRecorderPrivateWriter::mimeType(WebCore::MediaRecorderPrivateWriter *this)
{
  return MEMORY[0x1E0DD8508](this);
}

uint64_t WebCore::MediaTrackConstraintSetMap::isValid(WebCore::MediaTrackConstraintSetMap *this)
{
  return MEMORY[0x1E0DD8510](this);
}

uint64_t WebCore::ScrollingTreeScrollingNode::snapOffsetsInfo(WebCore::ScrollingTreeScrollingNode *this)
{
  return MEMORY[0x1E0DD8518](this);
}

uint64_t WebCore::ScrollingTreeScrollingNode::currentVerticalSnapPointIndex(WebCore::ScrollingTreeScrollingNode *this)
{
  return MEMORY[0x1E0DD8520](this);
}

uint64_t WebCore::ScrollingTreeScrollingNode::currentHorizontalSnapPointIndex(WebCore::ScrollingTreeScrollingNode *this)
{
  return MEMORY[0x1E0DD8528](this);
}

uint64_t WebCore::SharedWorkerContextManager::connection(WebCore::SharedWorkerContextManager *this)
{
  return MEMORY[0x1E0DD8530](this);
}

uint64_t WebCore::ValidatedFormListedElement::isFocusingWithValidationMessage(WebCore::ValidatedFormListedElement *this)
{
  return MEMORY[0x1E0DD8540](this);
}

uint64_t WebCore::AuthenticationChallengeBase::failureResponse(WebCore::AuthenticationChallengeBase *this)
{
  return MEMORY[0x1E0DD8548](this);
}

uint64_t WebCore::AuthenticationChallengeBase::protectionSpace(WebCore::AuthenticationChallengeBase *this)
{
  return MEMORY[0x1E0DD8550](this);
}

uint64_t WebCore::AuthenticationChallengeBase::proposedCredential(WebCore::AuthenticationChallengeBase *this)
{
  return MEMORY[0x1E0DD8558](this);
}

uint64_t WebCore::AuthenticationChallengeBase::previousFailureCount(WebCore::AuthenticationChallengeBase *this)
{
  return MEMORY[0x1E0DD8560](this);
}

uint64_t WebCore::AuthenticationChallengeBase::error(WebCore::AuthenticationChallengeBase *this)
{
  return MEMORY[0x1E0DD8568](this);
}

uint64_t WebCore::ContentFilterUnblockHandler::needsUIProcess(WebCore::ContentFilterUnblockHandler *this)
{
  return MEMORY[0x1E0DD8570](this);
}

uint64_t WebCore::ContentFilterUnblockHandler::canHandleRequest(WebCore::ContentFilterUnblockHandler *this, const WebCore::ResourceRequest *a2)
{
  return MEMORY[0x1E0DD8578](this, a2);
}

uint64_t WebCore::ContentFilterUnblockHandler::requestUnblockAsync()
{
  return MEMORY[0x1E0DD8580]();
}

uint64_t WebCore::ContentFilterUnblockHandler::webFilterEvaluatorData(WebCore::ContentFilterUnblockHandler *this)
{
  return MEMORY[0x1E0DD8588](this);
}

uint64_t WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel(WebCore::PlaybackSessionInterfaceIOS *this)
{
  return MEMORY[0x1E0DD8590](this);
}

uint64_t WebCore::RealtimeMediaSourceSettings::difference()
{
  return MEMORY[0x1E0DD8598]();
}

uint64_t WebCore::SWServerToContextConnection::server(WebCore::SWServerToContextConnection *this)
{
  return MEMORY[0x1E0DD85A0](this);
}

uint64_t WebCore::ServiceWorkerRegistrationKey::clientOrigin(WebCore::ServiceWorkerRegistrationKey *this)
{
  return MEMORY[0x1E0DD85A8](this);
}

uint64_t WebCore::TextTrackRepresentationCocoa::setHidden(WebCore::TextTrackRepresentationCocoa *this)
{
  return MEMORY[0x1E0DD85B0](this);
}

uint64_t WebCore::LocalSampleBufferDisplayLayer::didFail(WebCore::LocalSampleBufferDisplayLayer *this)
{
  return MEMORY[0x1E0DD85E8](this);
}

uint64_t WebCore::PushSubscriptionSetIdentifier::debugDescription(WebCore::PushSubscriptionSetIdentifier *this)
{
  return MEMORY[0x1E0DD85F0](this);
}

uint64_t WebCore::VideoPresentationInterfaceIOS::playerIdentifier(WebCore::VideoPresentationInterfaceIOS *this)
{
  return MEMORY[0x1E0DD85F8](this);
}

uint64_t WebCore::MediaPlaybackTargetContextCocoa::outputContext(WebCore::MediaPlaybackTargetContextCocoa *this)
{
  return MEMORY[0x1E0DD8600](this);
}

uint64_t WebCore::PaymentInstallmentConfiguration::platformConfiguration(WebCore::PaymentInstallmentConfiguration *this)
{
  return MEMORY[0x1E0DD8608](this);
}

uint64_t WebCore::PaymentInstallmentConfiguration::applePayInstallmentConfiguration(WebCore::PaymentInstallmentConfiguration *this)
{
  return MEMORY[0x1E0DD8610](this);
}

uint64_t WebCore::PlatformImageNativeImageBackend::colorSpace(WebCore::PlatformImageNativeImageBackend *this)
{
  return MEMORY[0x1E0DD8618](this);
}

uint64_t WebCore::PlatformImageNativeImageBackend::platformImage(WebCore::PlatformImageNativeImageBackend *this)
{
  return MEMORY[0x1E0DD8620](this);
}

uint64_t WebCore::PlatformImageNativeImageBackend::size(WebCore::PlatformImageNativeImageBackend *this)
{
  return MEMORY[0x1E0DD8628](this);
}

uint64_t WebCore::PlatformImageNativeImageBackend::hasAlpha(WebCore::PlatformImageNativeImageBackend *this)
{
  return MEMORY[0x1E0DD8630](this);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::avPlayerViewController(WebCore::VideoPresentationInterfaceAVKit *this)
{
  return MEMORY[0x1E0DD8638](this);
}

uint64_t WebCore::VideoPresentationInterfaceAVKit::mayAutomaticallyShowVideoPictureInPicture(WebCore::VideoPresentationInterfaceAVKit *this)
{
  return MEMORY[0x1E0DD8640](this);
}

uint64_t WebCore::PlaybackSessionModelMediaElement::legibleMediaSelectedIndex(WebCore::PlaybackSessionModelMediaElement *this)
{
  return MEMORY[0x1E0DD8650](this);
}

uint64_t WebCore::ScrollingStateFrameScrollingNode::isMainFrame(WebCore::ScrollingStateFrameScrollingNode *this)
{
  return MEMORY[0x1E0DD8658](this);
}

uint64_t WebCore::ApplePayPaymentAuthorizationResult::isFinalState(WebCore::ApplePayPaymentAuthorizationResult *this)
{
  return MEMORY[0x1E0DD8668](this);
}

uint64_t WebCore::ScrollingTreeScrollingNodeDelegate::scrollOrigin(WebCore::ScrollingTreeScrollingNodeDelegate *this)
{
  return MEMORY[0x1E0DD8670](this);
}

uint64_t WebCore::ScrollingTreeScrollingNodeDelegate::scrollingTree(WebCore::ScrollingTreeScrollingNodeDelegate *this)
{
  return MEMORY[0x1E0DD8678](this);
}

uint64_t WebCore::VideoPresentationModelVideoElement::logIdentifier(WebCore::VideoPresentationModelVideoElement *this)
{
  return MEMORY[0x1E0DD8680](this);
}

uint64_t WebCore::AuthenticationExtensionsClientInputs::toCBOR(WebCore::AuthenticationExtensionsClientInputs *this)
{
  return MEMORY[0x1E0DD8688](this);
}

uint64_t WebCore::AuthenticationExtensionsClientOutputs::toCBOR(WebCore::AuthenticationExtensionsClientOutputs *this)
{
  return MEMORY[0x1E0DD8690](this);
}

uint64_t WebCore::PCM::AttributionTriggerData::tokenPublicKeyURL(WebCore::PCM::AttributionTriggerData *this)
{
  return MEMORY[0x1E0DD8698](this);
}

uint64_t WebCore::PCM::AttributionTriggerData::tokenSignatureURL(WebCore::PCM::AttributionTriggerData *this)
{
  return MEMORY[0x1E0DD86A0](this);
}

uint64_t WebCore::PCM::AttributionTriggerData::tokenSignatureJSON(WebCore::PCM::AttributionTriggerData *this)
{
  return MEMORY[0x1E0DD86A8](this);
}

uint64_t WebCore::Blob::size(WebCore::Blob *this)
{
  return MEMORY[0x1E0DD86B8](this);
}

uint64_t WebCore::Font::renderingResourceIdentifier(WebCore::Font *this)
{
  return MEMORY[0x1E0DD86C8](this);
}

uint64_t WebCore::Node::shadowHost(WebCore::Node *this)
{
  return MEMORY[0x1E0DD86D0](this);
}

uint64_t WebCore::Node::textContent(WebCore::Node *this)
{
  return MEMORY[0x1E0DD86E0](this);
}

uint64_t WebCore::Node::isContentEditable(WebCore::Node *this)
{
  return MEMORY[0x1E0DD86F0](this);
}

uint64_t WebCore::Node::computeEditability()
{
  return MEMORY[0x1E0DD86F8]();
}

uint64_t WebCore::Node::rootEditableElement(WebCore::Node *this)
{
  return MEMORY[0x1E0DD8718](this);
}

uint64_t WebCore::Node::containsIncludingShadowDOM(WebCore::Node *this, const WebCore::Node *a2)
{
  return MEMORY[0x1E0DD8728](this, a2);
}

uint64_t WebCore::Node::isDescendantOrShadowDescendantOf(WebCore::Node *this, const WebCore::Node *a2)
{
  return MEMORY[0x1E0DD8730](this, a2);
}

uint64_t WebCore::Node::contains(WebCore::Node *this, const WebCore::Node *a2)
{
  return MEMORY[0x1E0DD8740](this, a2);
}

uint64_t WebCore::Page::themeColor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8750](this);
}

uint64_t WebCore::Page::renderTreeSize(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8760](this);
}

uint64_t WebCore::Page::forEachDocument()
{
  return MEMORY[0x1E0DD8768]();
}

uint64_t WebCore::Page::allowsLoadFromURL()
{
  return MEMORY[0x1E0DD8778]();
}

uint64_t WebCore::Page::useDarkAppearance(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8780](this);
}

uint64_t WebCore::Page::isVisibleAndActive(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8788](this);
}

uint64_t WebCore::Page::protectedMainFrame(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8790](this);
}

uint64_t WebCore::Page::sampledPageTopColor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8798](this);
}

uint64_t WebCore::Page::accessibilityTreeData(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87A0](this);
}

uint64_t WebCore::Page::wheelEventTestMonitor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87A8](this);
}

uint64_t WebCore::Page::checkedFocusController(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87B0](this);
}

uint64_t WebCore::Page::editableElementsInRect(WebCore::Page *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD87B8](this, a2);
}

uint64_t WebCore::Page::diagnosticLoggingClient(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87C0](this);
}

uint64_t WebCore::Page::isMonitoringWheelEvents(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87C8](this);
}

uint64_t WebCore::Page::logMediaDiagnosticMessage()
{
  return MEMORY[0x1E0DD87D0]();
}

uint64_t WebCore::Page::pageExtendedBackgroundColor(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87D8](this);
}

uint64_t WebCore::Page::contextRangeForSessionWithID(WebCore::Page *this, const WTF::UUID *a2)
{
  return MEMORY[0x1E0DD87E0](this, a2);
}

uint64_t WebCore::Page::hasCachedTextRecognitionResult(WebCore::Page *this, const WebCore::HTMLElement *a2)
{
  return MEMORY[0x1E0DD87E8](this, a2);
}

uint64_t WebCore::Page::preferredRenderingUpdateInterval(WebCore::Page *this)
{
  return MEMORY[0x1E0DD87F0](this);
}

uint64_t WebCore::Page::reloadExecutionContextsForOrigin()
{
  return MEMORY[0x1E0DD87F8]();
}

uint64_t WebCore::Page::pageCountAssumingLayoutIsUpToDate(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8800](this);
}

uint64_t WebCore::Page::preferredRenderingUpdateFramesPerSecond()
{
  return MEMORY[0x1E0DD8818]();
}

uint64_t WebCore::Page::selection(WebCore::Page *this)
{
  return MEMORY[0x1E0DD8830](this);
}

uint64_t WebCore::Path::platformPath(WebCore::Path *this)
{
  return MEMORY[0x1E0DD8840](this);
}

uint64_t WebCore::Path::fastBoundingRect(WebCore::Path *this)
{
  return MEMORY[0x1E0DD8848](this);
}

uint64_t WebCore::Path::isEmpty(WebCore::Path *this)
{
  return MEMORY[0x1E0DD8850](this);
}

uint64_t WebCore::Path::segments(WebCore::Path *this)
{
  return MEMORY[0x1E0DD8858](this);
}

uint64_t WebCore::Color::data(WebCore::Color *this)
{
  return MEMORY[0x1E0DD8868](this);
}

uint64_t WebCore::Color::lightness(WebCore::Color *this)
{
  return MEMORY[0x1E0DD8870](this);
}

uint64_t WebCore::Frame::ownerRenderer(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD8878](this);
}

uint64_t WebCore::Frame::checkedHistory(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD8880](this);
}

uint64_t WebCore::Frame::ownerPermissionsPolicy(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD8888](this);
}

uint64_t WebCore::Frame::pageID(WebCore::Frame *this)
{
  return MEMORY[0x1E0DD8890](this);
}

uint64_t WebCore::Image::toShareableBitmap(WebCore::Image *this)
{
  return MEMORY[0x1E0DD8898](this);
}

uint64_t WebCore::Image::mimeType(WebCore::Image *this)
{
  return MEMORY[0x1E0DD88A0](this);
}

uint64_t WebCore::Chrome::windowRect(WebCore::Chrome *this)
{
  return MEMORY[0x1E0DD88E0](this);
}

uint64_t WebCore::Cookie::operator NSHTTPCookie *()
{
  return MEMORY[0x1E0DD88E8]();
}

uint64_t WebCore::Cursor::platformCursor(WebCore::Cursor *this)
{
  return MEMORY[0x1E0DD88F0](this);
}

uint64_t WebCore::Cursor::setAsPlatformCursor(WebCore::Cursor *this)
{
  return MEMORY[0x1E0DD88F8](this);
}

uint64_t WebCore::Editor::selectedText(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8900](this);
}

uint64_t WebCore::Editor::compositionRange(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8910](this);
}

uint64_t WebCore::Editor::firstRectForRange()
{
  return MEMORY[0x1E0DD8918]();
}

uint64_t WebCore::Editor::nodeBeforeWritingSuggestions(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8920](this);
}

uint64_t WebCore::Editor::applyEditingStyleToBodyElement(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8928](this);
}

uint64_t WebCore::Editor::baseWritingDirectionForSelectionStart(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8930](this);
}

uint64_t WebCore::Editor::canCut(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8938](this);
}

uint64_t WebCore::Editor::client(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8940](this);
}

uint64_t WebCore::Editor::Command::isSupported(WebCore::Editor::Command *this)
{
  return MEMORY[0x1E0DD8948](this);
}

uint64_t WebCore::Editor::Command::state()
{
  return MEMORY[0x1E0DD8950]();
}

uint64_t WebCore::Editor::Command::execute()
{
  return MEMORY[0x1E0DD8960]();
}

uint64_t WebCore::Editor::Command::isEnabled()
{
  return MEMORY[0x1E0DD8968]();
}

uint64_t WebCore::Editor::canCopy(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8970](this);
}

uint64_t WebCore::Editor::canEdit(WebCore::Editor *this)
{
  return MEMORY[0x1E0DD8978](this);
}

uint64_t WebCore::Length::nonNanCalculatedValue(WebCore::Length *this, float a2)
{
  return MEMORY[0x1E0DD8980](this, a2);
}

uint64_t WebCore::Length::ref(WebCore::Length *this)
{
  return MEMORY[0x1E0DD8988](this);
}

uint64_t WebCore::Length::deref(WebCore::Length *this)
{
  return MEMORY[0x1E0DD8990](this);
}

uint64_t WebCore::Length::ipcData(WebCore::Length *this)
{
  return MEMORY[0x1E0DD8998](this);
}

uint64_t WebCore::Quirks::needsYouTubeMouseOutQuirk(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89A0](this);
}

uint64_t WebCore::Quirks::allowLayeredFullscreenVideos(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89A8](this);
}

uint64_t WebCore::Quirks::shouldAvoidUsingIOS13ForGmail(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89B0](this);
}

uint64_t WebCore::Quirks::shouldAvoidResizingWhenInputViewBoundsChange(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89B8](this);
}

uint64_t WebCore::Quirks::shouldAvoidScrollingWhenFocusedContentIsVisible(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89C0](this);
}

uint64_t WebCore::Quirks::blocksReturnToFullscreenFromPictureInPictureQuirk(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89C8](this);
}

uint64_t WebCore::Quirks::shouldIgnoreViewportArgumentsToAvoidExcessiveZoom(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89D0](this);
}

uint64_t WebCore::Quirks::shouldUseEphemeralPartitionedStorageForDOMCookies(WebCore::Quirks *this, const WTF::URL *a2)
{
  return MEMORY[0x1E0DD89D8](this, a2);
}

uint64_t WebCore::Quirks::shouldIgnoreAriaForFastPathContentObservationCheck(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89E0](this);
}

uint64_t WebCore::Quirks::shouldDispatchSyntheticMouseEventsWhenModifyingSelection(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89E8](this);
}

uint64_t WebCore::Quirks::blocksEnteringStandardFullscreenFromPictureInPictureQuirk(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89F0](this);
}

uint64_t WebCore::Quirks::shouldUseLegacySelectPopoverDismissalBehaviorInDataActivation(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD89F8](this);
}

uint64_t WebCore::Quirks::shouldLayOutAtMinimumWindowWidthWhenIgnoringScalingConstraints(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD8A00](this);
}

uint64_t WebCore::Quirks::shouldSuppressAutocorrectionAndAutocapitalizationInHiddenEditableAreas(WebCore::Quirks *this)
{
  return MEMORY[0x1E0DD8A08](this);
}

uint64_t WebCore::Region::intersects(WebCore::Region *this, const WebCore::Region *a2)
{
  return MEMORY[0x1E0DD8A10](this, a2);
}

uint64_t WebCore::Region::Shape::isValid(WebCore::Region::Shape *this)
{
  return MEMORY[0x1E0DD8A18](this);
}

uint64_t WebCore::Region::rects(WebCore::Region *this)
{
  return MEMORY[0x1E0DD8A20](this);
}

uint64_t WebCore::Region::contains(WebCore::Region *this, const WebCore::IntPoint *a2)
{
  return MEMORY[0x1E0DD8A28](this, a2);
}

uint64_t WebCore::Region::contains(WebCore::Region *this, const WebCore::Region *a2)
{
  return MEMORY[0x1E0DD8A30](this, a2);
}

uint64_t WebCore::Region::totalArea(WebCore::Region *this)
{
  return MEMORY[0x1E0DD8A38](this);
}

uint64_t WebCore::Report::url(WebCore::Report *this)
{
  return MEMORY[0x1E0DD8A40](this);
}

uint64_t WebCore::Report::body(WebCore::Report *this)
{
  return MEMORY[0x1E0DD8A48](this);
}

uint64_t WebCore::Report::type(WebCore::Report *this)
{
  return MEMORY[0x1E0DD8A50](this);
}

uint64_t WebCore::Widget::protectedParent(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD8A60](this);
}

uint64_t WebCore::Widget::parent(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD8A68](this);
}

uint64_t WebCore::Widget::frameRect(WebCore::Widget *this)
{
  return MEMORY[0x1E0DD8A70](this);
}

uint64_t WebCore::Element::identifier(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8A88](this);
}

uint64_t WebCore::Element::screenRect(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8A90](this);
}

uint64_t WebCore::Element::getAttribute(WebCore::Element *this, const AtomString *a2)
{
  return MEMORY[0x1E0DD8A98](this, a2);
}

uint64_t WebCore::Element::getAttribute(WebCore::Element *this, const WebCore::QualifiedName *a2)
{
  return MEMORY[0x1E0DD8AA0](this, a2);
}

uint64_t WebCore::Element::hasAttribute(WebCore::Element *this, const AtomString *a2)
{
  return MEMORY[0x1E0DD8AA8](this, a2);
}

uint64_t WebCore::Element::absoluteLinkURL(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8AC8](this);
}

uint64_t WebCore::Element::getURLAttribute(WebCore::Element *this, const WebCore::QualifiedName *a2)
{
  return MEMORY[0x1E0DD8AD0](this, a2);
}

uint64_t WebCore::Element::isWritingSuggestionsEnabled(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8AE0](this);
}

uint64_t WebCore::Element::renderOrDisplayContentsStyle(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8AF0](this);
}

uint64_t WebCore::Element::boundingBoxInRootViewCoordinates(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8AF8](this);
}

uint64_t WebCore::Element::boundingAbsoluteRectWithoutLayout(WebCore::Element *this)
{
  return MEMORY[0x1E0DD8B00](this);
}

uint64_t WebCore::IntRect::intersects(WebCore::IntRect *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD8B18](this, a2);
}

uint64_t WebCore::IntRect::toRectWithExtentsClippedToNumericLimits(WebCore::IntRect *this)
{
  return MEMORY[0x1E0DD8B20](this);
}

uint64_t WebCore::IntRect::isValid(WebCore::IntRect *this)
{
  return MEMORY[0x1E0DD8B28](this);
}

uint64_t WebCore::IntRect::contains(WebCore::IntRect *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD8B30](this, a2);
}

uint64_t WebCore::IntRect::operator CGRect()
{
  return MEMORY[0x1E0DD8B38]();
}

uint64_t WebCore::IntSize::operator CGSize()
{
  return MEMORY[0x1E0DD8B40]();
}

uint64_t WebCore::Payment::pkPayment(WebCore::Payment *this)
{
  return MEMORY[0x1E0DD8B48](this);
}

uint64_t WebCore::Document::completeURL()
{
  return MEMORY[0x1E0DD8B70]();
}

uint64_t WebCore::Document::topDocument(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8B88](this);
}

uint64_t WebCore::Document::axObjectCache(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BA0](this);
}

uint64_t WebCore::Document::isTopDocument(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BA8](this);
}

uint64_t WebCore::Document::bodyOrFrameset(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BB0](this);
}

uint64_t WebCore::Document::parentDocument(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BB8](this);
}

uint64_t WebCore::Document::urlForBindings(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BC0](this);
}

uint64_t WebCore::Document::viewportArguments(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BD0](this);
}

uint64_t WebCore::Document::isViewportDocument(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8BD8](this);
}

uint64_t WebCore::Document::endpointURIForToken(WebCore::Document *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD8BE0](this, a2);
}

uint64_t WebCore::Document::attachmentForIdentifier(WebCore::Document *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD8BF8](this, a2);
}

uint64_t WebCore::Document::crossOriginOpenerPolicy(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C00](this);
}

uint64_t WebCore::Document::shouldBypassMainWorldContentSecurityPolicy(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C38](this);
}

uint64_t WebCore::Document::body(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C40](this);
}

uint64_t WebCore::Document::loader(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C58](this);
}

uint64_t WebCore::Document::pageID(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C60](this);
}

uint64_t WebCore::Document::topOrigin(WebCore::Document *this)
{
  return MEMORY[0x1E0DD8C90](this);
}

uint64_t WebCore::FormData::isolatedCopy(WebCore::FormData *this)
{
  return MEMORY[0x1E0DD8CA8](this);
}

uint64_t WebCore::FormData::lengthInBytes(WebCore::FormData *this)
{
  return MEMORY[0x1E0DD8CB0](this);
}

uint64_t WebCore::FormData::asSharedBuffer(WebCore::FormData *this)
{
  return MEMORY[0x1E0DD8CB8](this);
}

uint64_t WebCore::FormData::asBlobURL(WebCore::FormData *this)
{
  return MEMORY[0x1E0DD8CC0](this);
}

uint64_t WebCore::IntPoint::constrainedWithin(WebCore::IntPoint *this, const WebCore::IntRect *a2)
{
  return MEMORY[0x1E0DD8CD0](this, a2);
}

uint64_t WebCore::IntPoint::constrainedBetween(WebCore::IntPoint *this, const WebCore::IntPoint *a2, const WebCore::IntPoint *a3)
{
  return MEMORY[0x1E0DD8CD8](this, a2, a3);
}

uint64_t WebCore::IntPoint::operator CGPoint()
{
  return MEMORY[0x1E0DD8CE0]();
}

uint64_t WebCore::Position::downstream()
{
  return MEMORY[0x1E0DD8CE8]();
}

uint64_t WebCore::Position::containerNode(WebCore::Position *this)
{
  return MEMORY[0x1E0DD8CF0](this);
}

uint64_t WebCore::Position::computeNodeAfterPosition(WebCore::Position *this)
{
  return MEMORY[0x1E0DD8CF8](this);
}

uint64_t WebCore::Position::computeNodeBeforePosition(WebCore::Position *this)
{
  return MEMORY[0x1E0DD8D08](this);
}

uint64_t WebCore::Position::offsetForPositionAfterAnchor(WebCore::Position *this)
{
  return MEMORY[0x1E0DD8D10](this);
}

uint64_t WebCore::Position::previous()
{
  return MEMORY[0x1E0DD8D18]();
}

uint64_t WebCore::Position::upstream()
{
  return MEMORY[0x1E0DD8D20]();
}

uint64_t WebCore::SWServer::workerByID()
{
  return MEMORY[0x1E0DD8D28]();
}

uint64_t WebCore::SWServer::canHandleScheme()
{
  return MEMORY[0x1E0DD8D30]();
}

uint64_t WebCore::SWServer::serviceWorkerClientWithOriginByID()
{
  return MEMORY[0x1E0DD8D38]();
}

uint64_t WebCore::SWServer::advancedPrivacyProtectionsFromClient(WebCore::SWServer *this, const WebCore::ClientOrigin *a2)
{
  return MEMORY[0x1E0DD8D40](this, a2);
}

uint64_t WebCore::SWServer::topLevelServiceWorkerClientFromPageIdentifier()
{
  return MEMORY[0x1E0DD8D48]();
}

uint64_t WebCore::Settings::showDebugBorders(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD8D50](this);
}

uint64_t WebCore::Settings::showRepaintCounter(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD8D58](this);
}

uint64_t WebCore::Settings::needsSiteSpecificQuirks(WebCore::Settings *this)
{
  return MEMORY[0x1E0DD8D60](this);
}

uint64_t WebCore::FloatQuad::boundingBox(WebCore::FloatQuad *this)
{
  return MEMORY[0x1E0DD8D70](this);
}

uint64_t WebCore::FloatQuad::containsQuad(WebCore::FloatQuad *this, const WebCore::FloatQuad *a2)
{
  return MEMORY[0x1E0DD8D78](this, a2);
}

uint64_t WebCore::FloatQuad::containsPoint(WebCore::FloatQuad *this, const WebCore::FloatPoint *a2)
{
  return MEMORY[0x1E0DD8D80](this, a2);
}

uint64_t WebCore::FloatQuad::isRectilinear(WebCore::FloatQuad *this)
{
  return MEMORY[0x1E0DD8D88](this);
}

uint64_t WebCore::FloatRect::intersects(WebCore::FloatRect *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD8D90](this, a2);
}

uint64_t WebCore::FloatRect::toJSONString(WebCore::FloatRect *this)
{
  return MEMORY[0x1E0DD8D98](this);
}

uint64_t WebCore::FloatRect::inclusivelyIntersects(WebCore::FloatRect *this, const WebCore::FloatRect *a2)
{
  return MEMORY[0x1E0DD8DA0](this, a2);
}

uint64_t WebCore::FloatRect::contains()
{
  return MEMORY[0x1E0DD8DA8]();
}

uint64_t WebCore::FloatRect::operator CGRect()
{
  return MEMORY[0x1E0DD8DB0]();
}

uint64_t WebCore::FloatSize::toJSONString(WebCore::FloatSize *this)
{
  return MEMORY[0x1E0DD8DB8](this);
}

uint64_t WebCore::FloatSize::operator CGSize()
{
  return MEMORY[0x1E0DD8DC0]();
}

uint64_t WebCore::FrameTree::childCount(WebCore::FrameTree *this)
{
  return MEMORY[0x1E0DD8DC8](this);
}

uint64_t WebCore::FrameTree::uniqueName(WebCore::FrameTree *this)
{
  return MEMORY[0x1E0DD8DD0](this);
}

uint64_t WebCore::FrameTree::scopedChild(WebCore::FrameTree *this)
{
  return MEMORY[0x1E0DD8DD8](this);
}

uint64_t WebCore::FrameTree::traverseNext(WebCore::FrameTree *this, const WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD8DE8](this, a2);
}

uint64_t WebCore::FrameTree::isDescendantOf(WebCore::FrameTree *this, const WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD8DF0](this, a2);
}

uint64_t WebCore::FrameTree::findByUniqueName(WebCore::FrameTree *this, const AtomString *a2, WebCore::Frame *a3)
{
  return MEMORY[0x1E0DD8DF8](this, a2, a3);
}

uint64_t WebCore::FrameTree::traverseNextRendered(WebCore::FrameTree *this, const WebCore::Frame *a2)
{
  return MEMORY[0x1E0DD8E08](this, a2);
}

uint64_t WebCore::FrameTree::scopedChildByUniqueName(WebCore::FrameTree *this, const AtomString *a2)
{
  return MEMORY[0x1E0DD8E10](this, a2);
}

uint64_t WebCore::FrameTree::parent(WebCore::FrameTree *this)
{
  return MEMORY[0x1E0DD8E18](this);
}

uint64_t WebCore::FrameView::topContentInset()
{
  return MEMORY[0x1E0DD8E20]();
}

uint64_t WebCore::FrameView::convertFromContainingViewToRenderer(WebCore::FrameView *this, const WebCore::RenderElement *a2, const WebCore::IntRect *a3)
{
  return MEMORY[0x1E0DD8E28](this, a2, a3);
}

uint64_t WebCore::FrameView::convertFromContainingViewToRenderer(WebCore::FrameView *this, const WebCore::RenderElement *a2, const WebCore::IntPoint *a3)
{
  return MEMORY[0x1E0DD8E30](this, a2, a3);
}

uint64_t WebCore::FrameView::convertFromRendererToContainingView(WebCore::FrameView *this, const WebCore::RenderElement *a2, const WebCore::IntRect *a3)
{
  return MEMORY[0x1E0DD8E38](this, a2, a3);
}

uint64_t WebCore::FrameView::convertFromRendererToContainingView(WebCore::FrameView *this, const WebCore::RenderElement *a2, const WebCore::IntPoint *a3)
{
  return MEMORY[0x1E0DD8E40](this, a2, a3);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::nameAndVersion(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD8E50](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::hasDataInMemory(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD8E58](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabase::filePath(WebCore::IDBServer::UniqueIDBDatabase *this)
{
  return MEMORY[0x1E0DD8E60](this);
}

uint64_t WebCore::IDBServer::UniqueIDBDatabaseTransaction::isVersionChange(WebCore::IDBServer::UniqueIDBDatabaseTransaction *this)
{
  return MEMORY[0x1E0DD8E68](this);
}

uint64_t WebCore::IOSurface::bytesPerRow(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD8E70](this);
}

uint64_t WebCore::IOSurface::createSendRight(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD8E78](this);
}

uint64_t WebCore::IOSurface::asCAIOSurfaceLayerContents(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD8E80](this);
}

uint64_t WebCore::IOSurface::isInUse(WebCore::IOSurface *this)
{
  return MEMORY[0x1E0DD8E88](this);
}

uint64_t WebCore::IPAddress::isLoopback(WebCore::IPAddress *this)
{
  return MEMORY[0x1E0DD8E90](this);
}

uint64_t WebCore::IPAddress::isolatedCopy(WebCore::IPAddress *this)
{
  return MEMORY[0x1E0DD8E98](this);
}

uint64_t WebCore::IPAddress::matchingNetMaskLength(WebCore::IPAddress *this, const WebCore::IPAddress *a2)
{
  return MEMORY[0x1E0DD8EA0](this, a2);
}

uint64_t WebCore::LegacyCDM::mediaPlayer(WebCore::LegacyCDM *this)
{
  return MEMORY[0x1E0DD8EA8](this);
}

uint64_t WebCore::LegacyCDM::supportsMIMEType(WebCore::LegacyCDM *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD8EB0](this, a2);
}

uint64_t WebCore::RenderBox::borderRadii(WebCore::RenderBox *this)
{
  return MEMORY[0x1E0DD8ED0](this);
}

uint64_t WebCore::RenderBox::clientWidth(WebCore::RenderBox *this)
{
  return MEMORY[0x1E0DD8ED8](this);
}

uint64_t WebCore::RenderBox::clientHeight(WebCore::RenderBox *this)
{
  return MEMORY[0x1E0DD8EE0](this);
}

uint64_t WebCore::RenderBox::absoluteContentQuad(WebCore::RenderBox *this)
{
  return MEMORY[0x1E0DD8EE8](this);
}

uint64_t WebCore::RenderBox::flippedClientBoxRect(WebCore::RenderBox *this)
{
  return MEMORY[0x1E0DD8EF0](this);
}

uint64_t WebCore::TimerBase::nextFireInterval(WebCore::TimerBase *this)
{
  return MEMORY[0x1E0DD8EF8](this);
}

uint64_t WebCore::TreeScope::getElementById(WebCore::TreeScope *this, const WTF::String *a2)
{
  return MEMORY[0x1E0DD8F08](this, a2);
}

uint64_t Inspector::FrontendRouter::hasLocalFrontend(Inspector::FrontendRouter *this)
{
  return MEMORY[0x1E0CC1000](this);
}

uint64_t Inspector::FrontendRouter::sendEvent(Inspector::FrontendRouter *this, const WTF::String *a2)
{
  return MEMORY[0x1E0CC1010](this, a2);
}

uint64_t Inspector::ScriptCallStack::firstNonNativeCallFrame(Inspector::ScriptCallStack *this)
{
  return MEMORY[0x1E0CC1070](this);
}

uint64_t Inspector::RemoteInspectionTarget::inspectable(Inspector::RemoteInspectionTarget *this)
{
  return MEMORY[0x1E0CC10B0](this);
}

uint64_t WTF::URL::isolatedCopy()
{
  return MEMORY[0x1E0CC10B8]();
}

{
  return MEMORY[0x1E0CC10C8]();
}

uint64_t WTF::String::isolatedCopy()
{
  return MEMORY[0x1E0CC10C0]();
}

{
  return MEMORY[0x1E0CC10D0]();
}

uint64_t WebCore::SecurityOriginData::isolatedCopy()
{
  return MEMORY[0x1E0DD8F28]();
}

{
  return MEMORY[0x1E0DD8F50]();
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x1E0DE41A0](retstr, this);
}

uint64_t WebCore::NotificationData::isolatedCopy()
{
  return MEMORY[0x1E0DD8F30]();
}

uint64_t WebCore::ContentExtensions::Action::isolatedCopy()
{
  return MEMORY[0x1E0DD8F38]();
}

uint64_t WebCore::ContentExtensions::Trigger::isolatedCopy()
{
  return MEMORY[0x1E0DD8F40]();
}

uint64_t WebCore::ServiceWorkerData::isolatedCopy()
{
  return MEMORY[0x1E0DD8F48]();
}

uint64_t WebCore::PrivateClickMeasurement::isolatedCopy()
{
  return MEMORY[0x1E0DD8F58]();
}

uint64_t WebCore::ServiceWorkerClientData::isolatedCopy()
{
  return MEMORY[0x1E0DD8F60]();
}

uint64_t WebCore::ShareableResourceHandle::tryWrapInSharedBuffer()
{
  return MEMORY[0x1E0DD8F68]();
}

uint64_t WebCore::ServiceWorkerContextData::isolatedCopy()
{
  return MEMORY[0x1E0DD8F70]();
}

uint64_t WebCore::ServiceWorkerRegistrationKey::isolatedCopy()
{
  return MEMORY[0x1E0DD8F78]();
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x1E0DE47C0](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

void *__cdecl std::align(size_t __align, size_t __sz, void **__ptr, size_t *__space)
{
  return (void *)MEMORY[0x1E0DE4A88](__align, __sz, __ptr, __space);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E34A9920();
}

void operator delete(void *__p)
{
  off_1E34A9928(__p);
}

uint64_t operator delete()
{
  return off_1E34A9930();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E34A9938(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E34A9940(__sz, a2);
}

uint64_t operator new()
{
  return off_1E34A9948();
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1E0C9AA78]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

uint64_t _class_setCustomDeallocInitiation()
{
  return MEMORY[0x1E0DE7940]();
}

uint64_t _dyld_register_dlsym_notifier()
{
  return MEMORY[0x1E0C80F48]();
}

uint64_t _objc_deallocOnMainThreadHelper()
{
  return MEMORY[0x1E0DE7980]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1E0DE7A40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A60](cls, protocol);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

const char *__cdecl class_getImageName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AA0](cls);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1E0DE7AE8](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D60](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82D80](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x1E0C82D98](channel, low_water);
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82DA0](channel, offset, data, queue, io_handler);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F70](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x1E0C83048](__path);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C83088](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1E0C833B8]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1E0C833C0]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1E0C83730](*(_QWORD *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C838F0](a1, a2);
  return result;
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1E0C83950](a1);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C83A48](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_guard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return MEMORY[0x1E0C83D38](*(_QWORD *)&task, *(_QWORD *)&name, guard, *(_QWORD *)&strict);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_unguard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard)
{
  return MEMORY[0x1E0C83D90](*(_QWORD *)&task, *(_QWORD *)&name, guard);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1E0C83EA0]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1E0C83EA8](zone);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  MEMORY[0x1E0C83FA8](zone, stats);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1E0CCEFE8](connection);
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCEFF8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

uint64_t nw_connection_reset_traffic_class()
{
  return MEMORY[0x1E0CCF158]();
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x1E0CCF238](context);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF340](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x1E0CCF3B8]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF410](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF428](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF440](endpoint);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1E0CCF468](error);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1E0CCF710](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF728](interface);
}

void nw_ip_options_set_version(nw_protocol_options_t options, nw_ip_version_t version)
{
  MEMORY[0x1E0CCF7C0](options, *(_QWORD *)&version);
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x1E0CCF7C8](listener);
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1E0CCF7D8](parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return MEMORY[0x1E0CCF7F0](listener);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x1E0CCF810](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF820](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF828](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x1E0CCF830](listener);
}

uint64_t nw_nat64_does_interface_index_support_nat64()
{
  return MEMORY[0x1E0CCF858]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF980](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

uint64_t nw_parameters_set_account_id()
{
  return MEMORY[0x1E0CCFA50]();
}

uint64_t nw_parameters_set_is_known_tracker()
{
  return MEMORY[0x1E0CCFB20]();
}

uint64_t nw_parameters_set_is_third_party_web_content()
{
  return MEMORY[0x1E0CCFB28]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
  MEMORY[0x1E0CCFB38](parameters, local_endpoint);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x1E0CCFC18](parameters, reuse_local_address);
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x1E0CCFC38]();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return MEMORY[0x1E0CCFC40]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x1E0CCFC68]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1E0CCFCD0]();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
  MEMORY[0x1E0CCFD18](path, enumerate_block);
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCFFD0](stack);
}

uint64_t nw_proxy_config_copy_agent_data()
{
  return MEMORY[0x1E0CD0068]();
}

uint64_t nw_proxy_config_get_identifier()
{
  return MEMORY[0x1E0CD0080]();
}

uint64_t nw_resolution_report_get_dns_failure_reason()
{
  return MEMORY[0x1E0CD0268]();
}

uint64_t nw_resolution_report_get_extended_dns_error_extra_text()
{
  return MEMORY[0x1E0CD0270]();
}

uint64_t nw_resolution_report_get_provider_name()
{
  return MEMORY[0x1E0CD0288]();
}

uint64_t nw_settings_get_unified_http_enabled()
{
  return MEMORY[0x1E0CD0348]();
}

void nw_tcp_options_set_no_delay(nw_protocol_options_t options, BOOL no_delay)
{
  MEMORY[0x1E0CD03A8](options, no_delay);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D28](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1E0DE8008](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

uint64_t os_log_copy_message_string()
{
  return MEMORY[0x1E0C84720]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

uint64_t os_log_set_hook()
{
  return MEMORY[0x1E0C84758]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C84918](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_trace_get_mode()
{
  return MEMORY[0x1E0C84958]();
}

uint64_t os_trace_set_mode()
{
  return MEMORY[0x1E0C84960]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x1E0DE8080](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE80A0](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x1E0C84EE8]();
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C85190]();
}

uint64_t sandbox_enable_state_flag()
{
  return MEMORY[0x1E0C85198]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_issue_generic()
{
  return MEMORY[0x1E0C851C8]();
}

uint64_t sandbox_extension_issue_iokit_registry_entry_class()
{
  return MEMORY[0x1E0C851D8]();
}

uint64_t sandbox_extension_issue_iokit_registry_entry_class_to_process()
{
  return MEMORY[0x1E0C851E0]();
}

uint64_t sandbox_extension_issue_mach()
{
  return MEMORY[0x1E0C851E8]();
}

uint64_t sandbox_extension_issue_mach_to_process()
{
  return MEMORY[0x1E0C851F0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1E0DE80D8](lhs, rhs);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C852C8](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D0](*(_QWORD *)&task, *(_QWORD *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852D8](*(_QWORD *)&semaphore);
}

kern_return_t semaphore_timedwait(semaphore_t semaphore, mach_timespec_t wait_time)
{
  return ((uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0C852E8])(*(_QWORD *)&semaphore, wait_time);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1E0C852F0](*(_QWORD *)&semaphore);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t svm_load_model()
{
  return MEMORY[0x1E0D178D8]();
}

uint64_t svm_predict_values()
{
  return MEMORY[0x1E0D178E0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int system(const char *a1)
{
  return MEMORY[0x1E0C857D8](a1);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1E0DE5960](*(_QWORD *)&c);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C859D0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

uint64_t voucher_replace_default_voucher()
{
  return MEMORY[0x1E0C85B78]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1E0C85F80]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1E0C860A8]();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_copy_bootstrap()
{
  return MEMORY[0x1E0C860F0]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1E0C86200]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x1E0C86358](xdict, key, *(_QWORD *)&fd);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1E0C86378]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_main(xpc_connection_handler_t handler)
{
  MEMORY[0x1E0C86608](handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreTelephony(double a1)
{
  dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 0);
  atomic_store(1u, (unsigned int *)&dlopenHelperFlag_CoreTelephony);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___CoreTelephonyClient(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_CoreTelephony))
    return dlopenHelper_CoreTelephony(result);
  return result;
}

