@implementation VCServerBag

- (VCServerBag)init
{
  VCServerBag *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCServerBag;
  v2 = -[VCServerBag init](&v4, sel_init);
  pthread_mutex_init(&v2->isLoadedMutex, 0);
  pthread_cond_init(&v2->isLoadedCondition, 0);
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1)
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_94);
  return (id)sharedInstance_bag;
}

VCServerBag *__29__VCServerBag_sharedInstance__block_invoke()
{
  VCServerBag *result;

  result = objc_alloc_init(VCServerBag);
  sharedInstance_bag = (uint64_t)result;
  return result;
}

- (void)waitForBagLoad
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  VCServerBag *v11;
  void *v12;
  timespec v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0D34350], "sharedInstance");
  pthread_mutex_lock(&self->isLoadedMutex);
  v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (!self->isLoaded)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v15 = v4;
        v16 = 2080;
        v17 = "-[VCServerBag waitForBagLoad]";
        v18 = 1024;
        v19 = 50;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for bag load.", buf, 0x1Cu);
      }
    }
    v6 = objc_msgSend(v3, "isLoaded");
    self->isLoaded = v6;
    if ((v6 & 1) == 0)
    {
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __29__VCServerBag_waitForBagLoad__block_invoke;
      v10 = &unk_1E9E52238;
      v11 = self;
      v12 = v3;
      if (waitForBagLoad_onceToken != -1)
        dispatch_once(&waitForBagLoad_onceToken, &v7);
      objc_msgSend(v3, "startBagLoad", v7, v8, v9, v10, v11, v12, v13.tv_sec, v13.tv_nsec);
      v13 = (timespec)xmmword_1D91103A0;
      pthread_cond_timedwait_relative_np(&self->isLoadedCondition, &self->isLoadedMutex, &v13);
    }
  }
  pthread_mutex_unlock(&self->isLoadedMutex);
}

uint64_t __29__VCServerBag_waitForBagLoad__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = *MEMORY[0x1E0D34200];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__VCServerBag_waitForBagLoad__block_invoke_2;
  v6[3] = &unk_1E9E58510;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  result = objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v3, v4, 0, v6);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

uint64_t __29__VCServerBag_waitForBagLoad__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v9 = 136315906;
      v10 = v4;
      v11 = 2080;
      v12 = "-[VCServerBag waitForBagLoad]_block_invoke_2";
      v13 = 1024;
      v14 = 68;
      v15 = 2080;
      v16 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bag Load Notification came in %s", (uint8_t *)&v9, 0x26u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 1;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 128))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    v7 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v7 + 128) = 0;
  pthread_cond_broadcast((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 8));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 56));
}

+ (void)pullStoreBagKeys
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  const char *v58;
  _QWORD v59[2];
  const __CFString *v60;
  _QWORD v61[5];
  const __CFString *v62;
  _QWORD v63[2];
  _QWORD v64[9];
  _QWORD v65[7];
  const __CFString *v66;
  _QWORD v67[3];
  _QWORD v68[8];
  _QWORD v69[3];
  _QWORD v70[9];
  _QWORD v71[16];
  _QWORD v72[44];
  _QWORD v73[14];
  _QWORD v74[21];
  _QWORD v75[56];

  v75[53] = *MEMORY[0x1E0C80C00];
  v38 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[VCServerBag waitForBagLoad](+[VCServerBag sharedInstance](VCServerBag, "sharedInstance"), "waitForBagLoad");
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75[0] = CFSTR("gk-cdx");
  v75[1] = CFSTR("gk-commnat-main0");
  v75[2] = CFSTR("gk-commnat-main1");
  v75[3] = CFSTR("gk-commnat-cohort");
  v75[4] = CFSTR("gk-commnat-main0-name");
  v75[5] = CFSTR("gk-commnat-main1-name");
  v75[6] = CFSTR("gk-commnat-cohort-name");
  v75[7] = CFSTR("gk-p2p-ice-timeout");
  v75[8] = CFSTR("gk-p2p-nat-type-timeout");
  v75[9] = CFSTR("gk-p2p-blob-size-max");
  v75[10] = CFSTR("gk-p2p-relay-bitrate-max");
  v75[11] = CFSTR("gk-p2p-tcp-relay-bitrate-max");
  v75[12] = CFSTR("gk-p2p-pre-relay-timeout");
  v75[13] = CFSTR("gk-p2p-remote-packets-timeout");
  v75[14] = CFSTR("gk-p2p-network-conditions-timeout");
  v75[15] = CFSTR("gk-p2p-video-throttling-timeout");
  v75[16] = CFSTR("gk-p2p-startup-timeout");
  v75[17] = CFSTR("gk-p2p-tcp-check-url");
  v75[18] = CFSTR("gk-p2p-ssl-check-url");
  v75[19] = CFSTR("gk-p2p-bitrate-max-2g");
  v75[20] = CFSTR("gk-p2p-bitrate-max-3g");
  v75[21] = CFSTR("gk-p2p-bitrate-max-lte");
  v75[22] = CFSTR("gk-p2p-bitrate-max-lte-v2");
  v75[23] = CFSTR("gk-p2p-bitrate-max-5g");
  v75[24] = CFSTR("gk-min-jitter-queue-size-5g");
  v75[25] = CFSTR("gk-p2p-bitrate-max-wifi");
  v75[26] = CFSTR("gk-p2p-video-degraded-threshold");
  v75[27] = CFSTR("vc-enable-irat-recommendation");
  v75[28] = CFSTR("vc-rate-controller-type");
  v75[29] = CFSTR("vc-decryption-timeout-interval");
  v75[30] = CFSTR("vc-decryption-mkm-recovery-interval");
  v75[31] = CFSTR("vc-new-session-joining-interval");
  v75[32] = CFSTR("vc-remote-media-stall-timeout");
  v75[33] = CFSTR("vc-no-remote-duplication-threshold-fast");
  v75[34] = CFSTR("vc-viewpoint-correction-enabled");
  v75[35] = CFSTR("vc-facetime-photos-use-best-videorule");
  v75[36] = CFSTR("vc-facetime-jb-high-start");
  v75[37] = CFSTR("vc-facetime-jitter-buffer-mode");
  v75[38] = CFSTR("vc-facetime-30-fps-support");
  v75[39] = CFSTR("vc-primary-conn-health-allowed-delay");
  v75[40] = CFSTR("gk-p2p-video-near-degraded-threshold");
  v75[41] = CFSTR("gk-p2p-media-degraded-threshold");
  v75[42] = CFSTR("vc-wrm-pending-bitrate-cap-delta");
  v75[43] = CFSTR("vc-duplication-media-driven-duplication-enabled");
  v75[44] = CFSTR("vc-ids-link-suggestion-enabled");
  v75[45] = CFSTR("vc-core-motion-detection-enabled");
  v75[46] = CFSTR("vc-send-feedback-controller-report");
  v75[47] = CFSTR("vc-captions-enabled");
  v75[48] = CFSTR("vc-motion-based-duplication-enabled");
  v75[49] = CFSTR("vc-force-relay-when-screen-enabled");
  v75[50] = CFSTR("vc-server-should-use-second-aggregator");
  v75[51] = CFSTR("vc-u-plus-one-auth-tag-enabled");
  v75[52] = CFSTR("vc-prefer-wired-over-wifi");
  v42 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 53);
  v74[0] = CFSTR("rtc-ac-bitrate-max-2g");
  v74[1] = CFSTR("rtc-ac-bitrate-max-3g");
  v74[2] = CFSTR("rtc-ac-bitrate-max-lte");
  v74[3] = CFSTR("rtc-ac-relay-bitrate-max");
  v74[4] = CFSTR("rtc-ac-tcp-relay-bitrate-max");
  v74[5] = CFSTR("rtc-ss-bitrate-max-2g");
  v74[6] = CFSTR("rtc-ss-bitrate-max-3g");
  v74[7] = CFSTR("rtc-ss-bitrate-max-lte");
  v74[8] = CFSTR("vc-enable-evs-audio-codec");
  v74[9] = CFSTR("vc-enable-red-audio");
  v74[10] = CFSTR("vc-red-state-value-A");
  v74[11] = CFSTR("vc-max-bitrate-2g-uplink");
  v74[12] = CFSTR("vc-max-bitrate-3g-uplink");
  v74[13] = CFSTR("vc-max-bitrate-lte-uplink");
  v74[14] = CFSTR("vc-max-bitrate-nonexpensive-uplink");
  v74[15] = CFSTR("vc-max-bitrate-wifi-uplink");
  v74[16] = CFSTR("vc-max-bitrate-2g-downlink");
  v74[17] = CFSTR("vc-max-bitrate-3g-downlink");
  v74[18] = CFSTR("vc-max-bitrate-lte-downlink");
  v74[19] = CFSTR("vc-max-bitrate-nonexpensive-downlink");
  v74[20] = CFSTR("vc-max-bitrate-wifi-downlink");
  v40 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 21);
  v73[0] = CFSTR("vc-adaptive-learning-enabled");
  v73[1] = CFSTR("vc-short-term-history-length");
  v73[2] = CFSTR("vc-long-term-history-length");
  v73[3] = CFSTR("vc-adaptive-learning-A");
  v73[4] = CFSTR("vc-adjustment-factor-A");
  v73[5] = CFSTR("vc-short-term-value-weight-A");
  v73[6] = CFSTR("vc-long-term-value-weight-A");
  v73[7] = CFSTR("vc-adaptive-learning-B");
  v73[8] = CFSTR("vc-adjustment-factor-B");
  v73[9] = CFSTR("vc-short-term-value-weight-B");
  v73[10] = CFSTR("vc-long-term-value-weight-B");
  v73[11] = CFSTR("vc-adjustment-factor-C");
  v73[12] = CFSTR("vc-short-term-value-weight-C");
  v73[13] = CFSTR("vc-long-term-value-weight-C");
  v39 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 14);
  v72[0] = CFSTR("vc-prefer-relay-over-p2p-threshold");
  v72[1] = CFSTR("vc-always-on-audio-redundancy-enable-threshold");
  v72[2] = CFSTR("vc-high-fec-enable-threshold");
  v72[3] = CFSTR("vc-low-fps-video-enable-threshold");
  v72[4] = CFSTR("vc-vplr-fec-enable-threshold");
  v72[5] = CFSTR("vc-video-redundancy-percentage-max");
  v72[6] = CFSTR("vc-ab-testing-use-video-jitter-for-video-playout");
  v72[7] = CFSTR("vc-fast-media-duplication-enable-threshold");
  v72[8] = CFSTR("vc-iRAT-rtp-enable-threshold");
  v72[9] = CFSTR("vc-pre-warm-cell-enable-threshold");
  v72[10] = CFSTR("vc-duplicate-important-pkts-enable-threshold");
  v72[11] = CFSTR("vc-allow-bursty-loss-ramp-down-enable-threshold");
  v72[12] = CFSTR("vc-hevc-wifi-tiers-enable-threshold");
  v72[13] = CFSTR("vc-viewpoint-correction-enable-threshold");
  v72[14] = CFSTR("vc-heif-hevc-live-photos-enable-threshold");
  v72[15] = CFSTR("vc-wifi-low-tier-redundancy-enable-threshold");
  v72[16] = CFSTR("vc-cellular-low-tier-redundancy-enable-threshold");
  v72[17] = CFSTR("vc-iRAT-metrics-enable-threshold");
  v72[18] = CFSTR("vc-fec-header-v1-enable-threshold");
  v72[19] = CFSTR("vc-updated-AFRC-header-enable-threshold");
  v72[20] = CFSTR("vc-secure-messaging-enable-threshold");
  v72[21] = CFSTR("vc-disable-SIP-enable-threshold");
  v72[22] = CFSTR("vc-wifi-assist-duplication-enable-threshold");
  v72[23] = CFSTR("vc-wifi-assist-budget-status-enable-threshold");
  v72[24] = CFSTR("vc-wifi-assist-status-bar-enable-threshold");
  v72[25] = CFSTR("vc-low-network-mode-enable-threshold");
  v72[26] = CFSTR("vc-duplication-enhancement-enable-threshold");
  v72[27] = CFSTR("vc-video-jb-enable-threshold-v2");
  v72[28] = CFSTR("vc-iRAT-duplication-enable-threshold");
  v72[29] = CFSTR("vc-wrm-rssi-threshold-enable-threshold");
  v72[30] = CFSTR("vc-wrm-rssi-threshold-distribution");
  v72[31] = CFSTR("vc-media-driven-duplication-enable-threshold");
  v72[32] = CFSTR("vc-ab-test-master-local-switches");
  v72[33] = CFSTR("vc-ab-test-audio-enhancement-feature-combinations");
  v72[34] = CFSTR("vc-ab-test-video-enhancement-feature-combinations");
  v72[35] = CFSTR("vc-ab-test-network-enhancement-feature-combinations");
  v72[36] = CFSTR("vc-ab-test-rate-control-enhancement-feature-combinations");
  v72[37] = CFSTR("vc-ab-test-media-duplication-enhancement-feature-combinations");
  v72[38] = CFSTR("vc-ab-testing-state");
  v72[39] = CFSTR("vc-ab-testing-use-rtt-for-fir-throttling");
  v72[40] = CFSTR("vc-ab-test-enable-max-camera-bitrate-video-quality-v2-threshold");
  v72[41] = CFSTR("vc-limit-multiway-bandwidth-when-constrained");
  v72[42] = CFSTR("vc-raise-u-one-bandwidth-limit-when-constrained");
  v72[43] = CFSTR("vc-ab-testing-higher-audio-RED-cutover");
  v37 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 44);
  v71[0] = CFSTR("vc-link-probing-capability-version");
  v71[1] = CFSTR("vc-link-probing-feature-threshold");
  v71[2] = CFSTR("vc-link-probing-interval");
  v71[3] = CFSTR("vc-link-probing-timeout");
  v71[4] = CFSTR("vc-link-probing-query-results-interval");
  v71[5] = CFSTR("vc-link-probing-exponential-moving-mean-factor");
  v71[6] = CFSTR("vc-link-probing-envelope-attack-factor");
  v71[7] = CFSTR("vc-link-probing-envelope-decay-factor");
  v71[8] = CFSTR("vc-link-probing-connection-lockdown-period");
  v71[9] = CFSTR("vc-link-probing-plr-buckets");
  v71[10] = CFSTR("vc-link-probing-duplication-wait-timeout");
  v71[11] = CFSTR("vc-link-probing-identical-query-result-max");
  v71[12] = CFSTR("vc-link-probing-lockdown-period");
  v71[13] = CFSTR("vc-link-probing-qr-stat-request-frequency");
  v71[14] = CFSTR("vc-link-probing-qr-stat-request-max-count");
  v71[15] = CFSTR("vc-link-probing-qr-stat-request-max-rtt");
  v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 16);
  v70[0] = CFSTR("vc-network-condition-detection-enabled");
  v70[1] = CFSTR("vc-bad-wifi-channel-quality-score-threshold");
  v70[2] = CFSTR("vc-bad-cell-signal-strength-bars-threshold-factor");
  v70[3] = CFSTR("vc-bad-cell-signal-strength-bars-threshold-offset");
  v70[4] = CFSTR("vc-wifi-channel-quality-score-envelope-attack-factor");
  v70[5] = CFSTR("vc-wifi-channel-quality-score-envelope-decay-factor");
  v70[6] = CFSTR("vc-cell-signal-strength-bars-envelope-attack-factor");
  v70[7] = CFSTR("vc-cell-signal-strength-bars-envelope-decay-factor");
  v70[8] = CFSTR("vc-network-backhaul-detection-trigger-threshold");
  v35 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 9);
  v34 = +[VCRateControlServerBag keysWithMode:](VCRateControlServerBag, "keysWithMode:", 1);
  v33 = +[VCRateControlServerBag keysWithMode:](VCRateControlServerBag, "keysWithMode:", 6);
  v69[0] = CFSTR("vc-mediaQueue-schedule-no-wait");
  v69[1] = CFSTR("vc-mediaQueue-min-bitrate-no-throttling");
  v69[2] = CFSTR("vc-mediaQueue-min-bitrate-no-throttling-3d");
  v32 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 3);
  v68[0] = CFSTR("vc-fec-vectorization-enabled");
  v68[1] = CFSTR("vc-fec-generator-enabled");
  v68[2] = CFSTR("vc-fec-feedback-version");
  v68[3] = CFSTR("vc-fec-feedback-analyzer-level-match-percentile");
  v68[4] = CFSTR("vc-fec-feedback-analyzer-buffer-max-length");
  v68[5] = CFSTR("vc-fec-feedback-analyzer-report-min-period");
  v68[6] = CFSTR("vc-fec-feedback-analyzer-vplr-window-size");
  v68[7] = CFSTR("vc-fec-feedback-analyzer-interpolation-threshold");
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 8);
  v67[0] = CFSTR("vc-video-priority-enabled");
  v67[1] = CFSTR("vc-low-quality-audio-stream-on-demand");
  v67[2] = CFSTR("vc-low-quality-video-stream-on-demand");
  v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 3);
  v66 = CFSTR("vc-nw-connection-monitor-enabled");
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v65[0] = CFSTR("vc-video-jitter-buffer-for-video-playout");
  v65[1] = CFSTR("vc-video-player-enable-loose-sync-for-facetime");
  v65[2] = CFSTR("vc-video-player-enable-reference-frame-for-facetime");
  v65[3] = CFSTR("vc-video-enable-late-frame-recovery");
  v65[4] = CFSTR("vc-video-transmitter-minimum-key-frame-generation-interval-for-facetime");
  v65[5] = CFSTR("vc-video-receiver-deferred-assembly-offset");
  v65[6] = CFSTR("vc-middle-tier-ml-enhance-disabled");
  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 7);
  v64[0] = CFSTR("vc-server-video-packet-retransmission-enabled");
  v64[1] = CFSTR("vc-nack-generator-population-percentage-with-additional-delay-budget");
  v64[2] = CFSTR("vc-nack-generator-nack-bit-rate-limiting-max-ratio");
  v64[3] = CFSTR("vc-nack-generator-seq-num-aging-time");
  v64[4] = CFSTR("vc-nack-generator-nack-throttling-plr-buckets");
  v64[5] = CFSTR("vc-nack-generator-nack-throttling-factor-buckets");
  v64[6] = CFSTR("vc-nack-generator-storebag-config-version");
  v64[7] = CFSTR("vc-nack-generator-nack-generation-max-plr");
  v64[8] = CFSTR("vc-nack-generator-nack-generation-max-rtt");
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 9);
  v63[0] = CFSTR("vc-rtcp-psfb-for-loss-feedback");
  v63[1] = CFSTR("vc-rtcp-psfb-for-ltr-ack");
  v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v62 = CFSTR("vc-screen-capture-private-content-capture-disabled");
  v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v61[0] = CFSTR("vc-reporting-audio-connection-time-symptom-threshold");
  v61[1] = CFSTR("vc-reporting-audio-erasure-percentage-symptom-threshold");
  v61[2] = CFSTR("vc-reporting-poor-connection-percentage-symptom-threshold");
  v61[3] = CFSTR("vc-reporting-video-connection-time-symptom-threshold");
  v61[4] = CFSTR("vc-reporting-video-stall-percentage-symptom-threshold");
  v9 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
  v60 = CFSTR("vc-enhanced-jb-adaptations");
  v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v59[0] = CFSTR("vc-out-of-process-video-decoding");
  v59[1] = CFSTR("vc-out-of-process-audio-decoding");
  v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  objc_msgSend(v2, "addObjectsFromArray:", v42);
  objc_msgSend(v2, "addObjectsFromArray:", v40);
  objc_msgSend(v2, "addObjectsFromArray:", v39);
  objc_msgSend(v2, "addObjectsFromArray:", v37);
  objc_msgSend(v2, "addObjectsFromArray:", v34);
  objc_msgSend(v2, "addObjectsFromArray:", v33);
  objc_msgSend(v2, "addObjectsFromArray:", v32);
  objc_msgSend(v2, "addObjectsFromArray:", v36);
  objc_msgSend(v2, "addObjectsFromArray:", v31);
  objc_msgSend(v2, "addObjectsFromArray:", v3);
  objc_msgSend(v2, "addObjectsFromArray:", v4);
  objc_msgSend(v2, "addObjectsFromArray:", v5);
  objc_msgSend(v2, "addObjectsFromArray:", v6);
  objc_msgSend(v2, "addObjectsFromArray:", v7);
  objc_msgSend(v2, "addObjectsFromArray:", v35);
  objc_msgSend(v2, "addObjectsFromArray:", v8);
  objc_msgSend(v2, "addObjectsFromArray:", v9);
  objc_msgSend(v2, "addObjectsFromArray:", v10);
  objc_msgSend(v2, "addObjectsFromArray:", v11);
  v12 = v2;
  objc_msgSend(v2, "addObject:", CFSTR("vc-enable-hevc-v2"));
  v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = +[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings");
  v14 = (void *)objc_msgSend(MEMORY[0x1E0D34350], "sharedInstance");
  v43 = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
      {
        v17 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
        if (v13)
        {
LABEL_5:
          v18 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316162;
          v50 = v15;
          v51 = 2080;
          v52 = "+[VCServerBag pullStoreBagKeys]";
          v53 = 1024;
          v54 = 178;
          v55 = 2080;
          v56 = v17;
          v57 = 2080;
          v58 = v18;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pulling bag to see if we need anything:%s, currentSettings = %s", buf, 0x30u);
          v14 = v43;
          goto LABEL_9;
        }
      }
      else
      {
        v17 = "<nil>";
        if (v13)
          goto LABEL_5;
      }
      v18 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(v12);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (!objc_msgSend(v13, "objectForKeyedSubscript:", v23))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v24 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v23)
                v26 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
              else
                v26 = "<nil>";
              *(_DWORD *)buf = 136315906;
              v50 = v24;
              v51 = 2080;
              v52 = "+[VCServerBag pullStoreBagKeys]";
              v53 = 1024;
              v54 = 185;
              v55 = 2080;
              v56 = v26;
              _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Missing bag value for key %s, we'll pull from the store bag ourselves", buf, 0x26u);
            }
          }
          v27 = (id)objc_msgSend(v14, "objectForKey:", v23);
          if (v27)
          {
            objc_msgSend(v41, "setObject:forKeyedSubscript:", v27, v23);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v23)
                v30 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
              else
                v30 = "<nil>";
              *(_DWORD *)buf = 136315906;
              v50 = v28;
              v51 = 2080;
              v52 = "+[VCServerBag pullStoreBagKeys]";
              v53 = 1024;
              v54 = 194;
              v55 = 2080;
              v56 = v30;
              _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to get store bag value for key = %s", buf, 0x26u);
            }
          }

          v14 = v43;
        }
      }
      v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
    }
    while (v20);
  }
  if (objc_msgSend(v41, "count"))
    +[GKSConnectivitySettings setServerAddresses:](GKSConnectivitySettings, "setServerAddresses:", v41);

}

+ (void)clearBagWithRefreshIntervalInSeconds:(int)a3
{
  +[GKSConnectivitySettings clearAllSettingsWithRefreshIntervalInSeconds:](GKSConnectivitySettings, "clearAllSettingsWithRefreshIntervalInSeconds:", *(_QWORD *)&a3);
}

+ (void)checkKeysAgainstHardcodedPrefs:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFArray *v5;
  CFDictionaryRef v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v5 = CFPreferencesCopyKeyList(CFSTR("com.apple.facetime"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = CFPreferencesCopyMultiple(v5, CFSTR("com.apple.facetime"), v3, v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend((id)objc_msgSend(CFSTR("com.apple.facetime"), "description"), "UTF8String");
      if (v6)
        v10 = (const char *)objc_msgSend((id)-[__CFDictionary description](v6, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v11 = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "+[VCServerBag checkKeysAgainstHardcodedPrefs:]";
      v15 = 1024;
      v16 = 222;
      v17 = 2080;
      v18 = v9;
      v19 = 2080;
      v20 = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d This is what we are reading in %s = %s", (uint8_t *)&v11, 0x30u);
    }
  }
  if (v5)
    CFRelease(v5);
  if (v6)
    CFRelease(v6);
}

+ (void)retrieveBag
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0D34350], "sharedInstance");
  if ((objc_msgSend(v2, "isLoaded") & 1) == 0)
    objc_msgSend(v2, "startBagLoad");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136316674;
      v6 = v3;
      v7 = 2080;
      v8 = "+[VCServerBag retrieveBag]";
      v9 = 1024;
      v10 = 235;
      v11 = 1024;
      v12 = objc_msgSend(v2, "isLoaded");
      v13 = 2048;
      v14 = v2;
      v15 = 1024;
      v16 = objc_msgSend(v2, "isServerAvailable");
      v17 = 1024;
      v18 = objc_msgSend(v2, "isLoading");
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Retrieving server bag %d, %p, %d, %d", (uint8_t *)&v5, 0x38u);
    }
  }
}

+ (BOOL)verifyRequiredKeys:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = +[GKSConnectivitySettings getAllSettings](GKSConnectivitySettings, "getAllSettings");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!objc_msgSend(v6, "objectForKeyedSubscript:", v11))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v11)
                v17 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              else
                v17 = "<nil>";
              v18 = 136315906;
              v19 = v15;
              v20 = 2080;
              v21 = "+[VCServerBag verifyRequiredKeys:withError:]";
              v22 = 1024;
              v23 = 246;
              v24 = 2080;
              v25 = v17;
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We don't have the required keys %s.  Please file.", (uint8_t *)&v18, 0x26u);
            }
          }
          +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32000, 112, 0, CFSTR("No store bag is present so we failed the call."), CFSTR("Missing required store bag keys."));
          return 0;
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v8)
        continue;
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = v12;
      v20 = 2080;
      v21 = "+[VCServerBag verifyRequiredKeys:withError:]";
      v22 = 1024;
      v23 = 253;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d verifyRequiredKeys finished.", (uint8_t *)&v18, 0x1Cu);
    }
  }
  return 1;
}

+ (BOOL)verifyRequiredVoiceChatKeys:(id *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("gk-commnat-main0"), CFSTR("gk-commnat-main1"), CFSTR("gk-commnat-cohort"), 0);
  LOBYTE(a3) = objc_msgSend(a1, "verifyRequiredKeys:withError:", v5, a3);

  return (char)a3;
}

+ (BOOL)verifyRequiredKeys:(id *)a3
{
  void *v5;
  char v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("gk-commnat-main0"), CFSTR("gk-commnat-main1"), CFSTR("gk-commnat-cohort"), CFSTR("gk-commnat-main0-name"), CFSTR("gk-commnat-main1-name"), CFSTR("gk-commnat-cohort-name"), 0);
  v6 = objc_msgSend(a1, "verifyRequiredKeys:withError:", v5, a3);
  if ((v6 & 1) == 0 && VRTraceIsInternalOSInstalled())
    objc_msgSend(a1, "checkKeysAgainstHardcodedPrefs:", v5);

  return v6;
}

@end
