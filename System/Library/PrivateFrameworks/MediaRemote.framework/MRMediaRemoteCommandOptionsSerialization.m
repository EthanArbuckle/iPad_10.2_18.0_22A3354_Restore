@implementation MRMediaRemoteCommandOptionsSerialization

uint64_t ___MRMediaRemoteCommandOptionsSerialization_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[82];
  _QWORD v88[84];

  v88[82] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)_MRMediaRemoteCommandOptionsSerialization___serialization;
  _MRMediaRemoteCommandOptionsSerialization___serialization = v0;

  v64 = (void *)_MRMediaRemoteCommandOptionsSerialization___serialization;
  v87[0] = CFSTR("kMRMediaRemoteOptionIsExternalPlayerCommand");
  NSStringFromSelector(sel_externalPlayerCommand);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = v86;
  v87[1] = CFSTR("kMRMediaRemoteOptionIsNegative");
  NSStringFromSelector(sel_negative);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = v85;
  v87[2] = CFSTR("kMRMediaRemoteOptionMediaType");
  NSStringFromSelector(sel_mediaType);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v88[2] = v84;
  v87[3] = CFSTR("kMRMediaRemoteOptionPlaybackPosition");
  NSStringFromSelector(sel_playbackPosition);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v88[3] = v83;
  v87[4] = CFSTR("kMRMediaRemoteOptionBeginSeek");
  NSStringFromSelector(sel_beginSeek);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v88[4] = v82;
  v87[5] = CFSTR("kMRMediaRemoteOptionEndSeek");
  NSStringFromSelector(sel_endSeek);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v88[5] = v81;
  v87[6] = CFSTR("kMRMediaRemoteOptionPlaybackRate");
  NSStringFromSelector(sel_playbackRate);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v88[6] = v80;
  v87[7] = CFSTR("kMRMediaRemoteOptionRepeatMode");
  NSStringFromSelector(sel_repeatMode);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v88[7] = v79;
  v87[8] = CFSTR("kMRMediaRemoteCommandInfoPreservesRepeatModeKey");
  NSStringFromSelector(sel_preservesRepeatMode);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v88[8] = v78;
  v87[9] = CFSTR("kMRMediaRemoteOptionShuffleMode");
  NSStringFromSelector(sel_shuffleMode);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v88[9] = v77;
  v87[10] = CFSTR("kMRMediaRemoteCommandInfoPreservesShuffleModeKey");
  NSStringFromSelector(sel_preservesShuffleMode);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v88[10] = v76;
  v87[11] = CFSTR("kMRMediaRemoteOptionQueueEndAction");
  NSStringFromSelector(sel_queueEndAction);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v88[11] = v75;
  v87[12] = CFSTR("kMRMediaRemoteCommandInfoPreservesQueueEndActionKey");
  NSStringFromSelector(sel_preservesQueueEndAction);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v88[12] = v74;
  v87[13] = CFSTR("kMRMediaRemoteOptionSkipInterval");
  NSStringFromSelector(sel_skipInterval);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v88[13] = v73;
  v87[14] = CFSTR("kMRMediaRemoteOptionSourceID");
  NSStringFromSelector(sel_sourceID);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v88[14] = v72;
  v87[15] = CFSTR("kMRMediaRemoteOptionStationHash");
  NSStringFromSelector(sel_radioStationHash);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v88[15] = v71;
  v87[16] = CFSTR("kMRMediaRemoteOptionStationID");
  NSStringFromSelector(sel_radioStationID);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v88[16] = v70;
  v87[17] = CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData");
  NSStringFromSelector(sel_systemAppPlaybackQueueData);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v88[17] = v69;
  v87[18] = CFSTR("MRMediaRemoteOptionSystemAppPlaybackQueue");
  NSStringFromSelector(sel_systemAppPlaybackQueue);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v88[18] = v68;
  v87[19] = CFSTR("PQso");
  NSStringFromSelector(sel_shouldOverrideManuallyCuratedQueue);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v88[19] = v67;
  v87[20] = CFSTR("kMRMediaRemoteOptionTrackID");
  NSStringFromSelector(sel_trackID);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v88[20] = v66;
  v87[21] = CFSTR("kMRMediaRemoteOptionContentItemID");
  NSStringFromSelector(sel_contentItemID);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v88[21] = v65;
  v87[22] = CFSTR("kMRMediaRemoteOptionDestinationAppDisplayID");
  NSStringFromSelector(sel_destinationAppDisplayID);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v88[22] = v63;
  v87[23] = CFSTR("kMRMediaRemoteOptionSendOptionsNumber");
  NSStringFromSelector(sel_sendOptions);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v88[23] = v62;
  v87[24] = CFSTR("kMRMediaRemoteOptionRequestDefermentToPlaybackQueuePosition");
  NSStringFromSelector(sel_requestDefermentToPlaybackQueuePosition);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v88[24] = v61;
  v87[25] = CFSTR("kMRMediaRemoteOptionRating");
  NSStringFromSelector(sel_rating);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v88[25] = v60;
  v87[26] = CFSTR("kMRMediaRemoteOptionContextID");
  NSStringFromSelector(sel_contextID);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88[26] = v59;
  v87[27] = CFSTR("kMRMediaRemoteOptionDesiredSessionID");
  NSStringFromSelector(sel_desiredSessionID);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v88[27] = v58;
  v87[28] = CFSTR("kMRMediaRemoteOptionStationURL");
  NSStringFromSelector(sel_stationURL);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v88[28] = v57;
  v87[29] = CFSTR("kMRMediaRemoteOptionShouldBeginRadioPlayback");
  NSStringFromSelector(sel_shouldBeginRadioPlayback);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v88[29] = v56;
  v87[30] = CFSTR("kMRMediaRemoteOptionPlaybackQueueInsertionPosition");
  NSStringFromSelector(sel_playbackQueueInsertionPosition);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v88[30] = v55;
  v87[31] = CFSTR("kMRMediaRemoteOptionPlaybackQueueOffset");
  NSStringFromSelector(sel_playbackQueueOffset);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v88[31] = v54;
  v87[32] = CFSTR("kMRMediaRemoteOptionPlaybackQueueDestinationOffset");
  NSStringFromSelector(sel_playbackQueueDestinationOffset);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v88[32] = v53;
  v87[33] = CFSTR("kMRMediaRemoteOptionLanguageOptionData");
  NSStringFromSelector(sel_languageOption);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v88[33] = v52;
  v87[34] = CFSTR("kMRMediaRemoteOptionInsertAfterContentItemID");
  NSStringFromSelector(sel_insertAfterContentItemID);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88[34] = v51;
  v87[35] = CFSTR("kMRMediaRemoteOptionInsertBeforeContentItemID");
  NSStringFromSelector(sel_insertBeforeContentItemID);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v88[35] = v50;
  v87[36] = CFSTR("kMRMediaRemoteOptionNowPlayingContentItemID");
  NSStringFromSelector(sel_nowPlayingContentItemID);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v88[36] = v49;
  v87[37] = CFSTR("PQri");
  NSStringFromSelector(sel_replaceIntent);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v88[37] = v48;
  v87[38] = CFSTR("kMRMediaRemoteOptionCommandID");
  NSStringFromSelector(sel_commandID);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v88[38] = v47;
  v87[39] = CFSTR("kMRMediaRemoteOptionSenderID");
  NSStringFromSelector(sel_senderID);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v88[39] = v46;
  v87[40] = CFSTR("kMRMediaRemoteOptionRemoteControlInterfaceIdentifier");
  NSStringFromSelector(sel_remoteControlInterface);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v88[40] = v45;
  v87[41] = CFSTR("kMRMediaRemoteOptionPlaybackSessionData");
  NSStringFromSelector(sel_playbackSession);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v88[41] = v44;
  v87[42] = CFSTR("kMRMediaRemoteOptionPlaybackSessionIdentifier");
  NSStringFromSelector(sel_playbackSessionIdentifier);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v88[42] = v43;
  v87[43] = CFSTR("kMRMediaRemoteOptionPlaybackSessionType");
  NSStringFromSelector(sel_playbackSessionType);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v88[43] = v42;
  v87[44] = CFSTR("kMRMediaRemoteOptionPlaybackSessionPriority");
  NSStringFromSelector(sel_playbackSessionPriority);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v88[44] = v41;
  v87[45] = CFSTR("kMRMediaRemoteOptionPlaybackSessionFilePath");
  NSStringFromSelector(sel_playbackSessionFilePath);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v88[45] = v40;
  v87[46] = CFSTR("kMRMediaRemoteOptionPlaybackSessionRevision");
  NSStringFromSelector(sel_playbackSessionRevision);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v88[46] = v39;
  v87[47] = CFSTR("kMRMediaRemoteOptionPlaybackSessionMetadata");
  NSStringFromSelector(sel_playbackSessionMetadata);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v88[47] = v38;
  v87[48] = CFSTR("kMRMediaRemoteOptionUserIdentityData");
  NSStringFromSelector(sel_userIdentityData);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v88[48] = v37;
  v87[49] = CFSTR("kMRMediaRemoteOptionHomeKitUserIdentifier");
  NSStringFromSelector(sel_homeKitUserIdentifier);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v88[49] = v36;
  v87[50] = CFSTR("kMRMediaRemoteOptionVerifySupportedCommands");
  NSStringFromSelector(sel_verifySupportedCommands);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v88[50] = v35;
  v87[51] = CFSTR("kMRMediaRemoteOptionAssistantSetQueueTrueCompletion");
  NSStringFromSelector(sel_trueCompletion);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v88[51] = v34;
  v87[52] = CFSTR("kMRMediaRemoteOptionCommandTimeout");
  NSStringFromSelector(sel_commandTimeout);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v88[52] = v33;
  v87[53] = CFSTR("kMRMediaRemoteOptionPlaybackAuthorizationToken");
  NSStringFromSelector(sel_playbackAuthorizationToken);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v88[53] = v32;
  v87[54] = CFSTR("kMRMediaRemoteOptionEventNoticeType");
  NSStringFromSelector(sel_eventNoticeType);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v88[54] = v31;
  v87[55] = CFSTR("kMRMediaRemoteOptionEventNoticeIdentifier");
  NSStringFromSelector(sel_eventNoticeIdentifier);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v88[55] = v30;
  v87[56] = CFSTR("kMRMediaRemoteOptionSharedPlaybackSessionIdentifier");
  NSStringFromSelector(sel_sharedPlaybackSessionIdentifier);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v88[56] = v29;
  v87[57] = CFSTR("kMRMediaRemoteOptionOriginatingDeviceUID");
  NSStringFromSelector(sel_originatingDeviceUID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v88[57] = v28;
  v87[58] = CFSTR("kMRMediaRemoteOptionDestinationDeviceUIDs");
  NSStringFromSelector(sel_destinationDeviceUIDs);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v88[58] = v27;
  v87[59] = CFSTR("kMRMediaRemoteOptionAlwaysIgnoreDuringCall");
  NSStringFromSelector(sel_alwaysIgnoreDuringCall);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88[59] = v26;
  v87[60] = CFSTR("kMRMediaRemoteOptionAlwaysIgnoreDuringSharePlay");
  NSStringFromSelector(sel_alwaysIgnoreDuringSharePlay);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88[60] = v25;
  v87[61] = CFSTR("kMRMediaRemoteOptionCommandSequenceUUID");
  NSStringFromSelector(sel_commandSequenceUUID);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v88[61] = v24;
  v87[62] = CFSTR("kMRMediaRemoteOptionAssistantTTSEndTimestamp");
  NSStringFromSelector(sel_assistantTTSEndTimestamp);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88[62] = v23;
  v87[63] = CFSTR("kMRMediaRemoteOptionAssistantCommandSendTimestamp");
  NSStringFromSelector(sel_assistantCommandSendTimestamp);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v88[63] = v22;
  v87[64] = CFSTR("kMRMediaRemoteOptionVocalsControlActive");
  NSStringFromSelector(sel_vocalsControlActive);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v88[64] = v21;
  v87[65] = CFSTR("kMRMediaRemoteOptionVocalsControlLevel");
  NSStringFromSelector(sel_vocalsControlLevel);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v88[65] = v20;
  v87[66] = CFSTR("kMRMediaRemoteOptionVocalsControlMinLevel");
  NSStringFromSelector(sel_vocalsControlMinLevel);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v88[66] = v19;
  v87[67] = CFSTR("kMRMediaRemoteOptionVocalsControlMaxLevel");
  NSStringFromSelector(sel_vocalsControlMaxLevel);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v88[67] = v18;
  v87[68] = CFSTR("kMRMediaRemoteOptionVocalsControlContinuous");
  NSStringFromSelector(sel_vocalsControlContinuous);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v88[68] = v17;
  v87[69] = CFSTR("kMRMediaRemoteOptionOriginatedFromRemoteDevice");
  NSStringFromSelector(sel_originatedFromRemoteDevice);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v88[69] = v16;
  v87[70] = CFSTR("kMRMediaRemoteOptionSiriTurnIdentifier");
  NSStringFromSelector(sel_siriTurnIdentifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v88[70] = v15;
  v87[71] = CFSTR("kMRMediaRemoteOptionSiriSearchDataSetIdentifier");
  NSStringFromSelector(sel_siriSearchDataSetIdentifier);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v88[71] = v14;
  v87[72] = CFSTR("kMRMediaRemoteOptionPrepareForSetQueueIsProactive");
  NSStringFromSelector(sel_prepareForSetQueueIsProactive);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v88[72] = v13;
  v87[73] = CFSTR("kMRMediaRemoteOptionPrepareForSetQueueProactiveReason");
  NSStringFromSelector(sel_prepareForSetQueueProactiveReason);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v88[73] = v2;
  v87[74] = CFSTR("MRMediaRemoteOptionPrepareForSetQueueProactiveReasonType");
  NSStringFromSelector(sel_prepareForSetQueueProactiveReasonType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v88[74] = v3;
  v87[75] = CFSTR("kMRMediaRemoteOptionApplicationUserIdentity");
  NSStringFromSelector(sel_applicationUserIdentity);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v88[75] = v4;
  v87[76] = CFSTR("kMRMediaRemoteOptionAssociatedParticipantIdentifier");
  NSStringFromSelector(sel_associatedParticipantIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88[76] = v5;
  v87[77] = CFSTR("kMRMediaRemoteOptionDialogOptions");
  NSStringFromSelector(sel_dialogOptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v88[77] = v6;
  v87[78] = CFSTR("kMRMediaRemoteOptionClientPreferredLanguages");
  NSStringFromSelector(sel_clientPreferredLanguages);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88[78] = v7;
  v87[79] = CFSTR("kMRMediaRemoteOptionSleepTimerTime");
  NSStringFromSelector(sel_sleepTimerTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v88[79] = v8;
  v87[80] = CFSTR("kMRMediaRemoteOptionSleepTimerStopMode");
  NSStringFromSelector(sel_sleepTimerStopMode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v88[80] = v9;
  v87[81] = CFSTR("kMRMediaRemoteOptionReferencePosition");
  NSStringFromSelector(sel_referencePosition);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v88[81] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 82);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setDictionaryKeyToProtobufKeyMapping:", v11);

  objc_msgSend((id)_MRMediaRemoteCommandOptionsSerialization___serialization, "setProtobufClass:", objc_opt_class());
  objc_msgSend((id)_MRMediaRemoteCommandOptionsSerialization___serialization, "setDictionaryValueToProtobufValueTransformer:", &__block_literal_global_166);
  objc_msgSend((id)_MRMediaRemoteCommandOptionsSerialization___serialization, "setProtobufValueToDictionaryValueTransformer:", &__block_literal_global_174);
  return objc_msgSend((id)_MRMediaRemoteCommandOptionsSerialization___serialization, "setProtobufValueToDictionaryPostTransformer:", &__block_literal_global_179);
}

id ___MRMediaRemoteCommandOptionsSerialization_block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteOptionRepeatMode"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteOptionShuffleMode")))
  {
    v7 = objc_msgSend(v6, "unsignedIntValue");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    if (v7 - 1 >= 3)
      v9 = 0;
    else
      v9 = v7;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("PQri")))
  {
    v14 = objc_msgSend(v6, "intValue");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    if (v14 == 1)
      v9 = 1;
    else
      v9 = 2 * (v14 == 2);
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteOptionSendOptionsNumber")))
  {
    v15 = objc_msgSend(v6, "intValue");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    v9 = v15 == 1;
LABEL_6:
    v10 = v8;
LABEL_7:
    objc_msgSend(v10, "numberWithInt:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteOptionPlaybackSessionPriority")))
  {
    v16 = (int)objc_msgSend(v6, "intValue");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    if (v16 == 512)
      v17 = 512;
    else
      v17 = 1024;
    if (v16 == 1024)
      v18 = 1024;
    else
      v18 = v17;
    if (v16)
      v9 = v18;
    else
      v9 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("kMRMediaRemoteOptionDialogOptions")))
    goto LABEL_9;
  if ((_NSIsNSDictionary() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRProtobufSerialization *_MRMediaRemoteCommandOptionsSerialization(void)_block_invoke_2");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MRProtobufUtility.m"), 485, CFSTR("Expected dictionary value for kMRMediaRemoteOptionDialogOptions"));

  }
  _MRProtoUtilsProtoDictionaryFromNSDictionary(v6);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v12 = (void *)v11;

  v6 = v12;
LABEL_9:

  return v6;
}

id ___MRMediaRemoteCommandOptionsSerialization_block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  _BOOL8 v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;

  v5 = a3;
  v6 = a4;
  NSStringFromSelector(sel_repeatMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8
    || (NSStringFromSelector(sel_shuffleMode),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v5, "isEqualToString:", v9),
        v9,
        v10))
  {
    v11 = objc_msgSend(v6, "unsignedIntValue");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    if (v11 - 1 >= 3)
      v13 = 0;
    else
      v13 = v11;
LABEL_6:
    objc_msgSend(v12, "numberWithInt:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  NSStringFromSelector(sel_replaceIntent);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v5, "isEqualToString:", v17);

  if (v18)
  {
    v19 = objc_msgSend(v6, "unsignedIntValue");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    if (v19 == 1)
      v13 = 1;
    else
      v13 = 2 * (v19 == 2);
    goto LABEL_6;
  }
  NSStringFromSelector(sel_sendOptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v5, "isEqualToString:", v20);

  if (v21)
  {
    v22 = objc_msgSend(v6, "intValue") == 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromSelector(sel_playbackSessionPriority);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "isEqualToString:", v23);

    if (v24)
    {
      v25 = objc_msgSend(v6, "intValue");
      if (v25)
      {
        if (v25 == 512)
          v26 = 512;
        else
          v26 = 1024;
      }
      else
      {
        v26 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSStringFromSelector(sel_dialogOptions);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v5, "isEqualToString:", v27);

      if (!v28)
        goto LABEL_8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "MRProtobufSerialization *_MRMediaRemoteCommandOptionsSerialization(void)_block_invoke_3");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("MRProtobufUtility.m"), 508, CFSTR("Expected DictionaryProtobuf value for kMRMediaRemoteOptionDialogOptions: %@"), v6);

      }
      _MRProtoUtilsNSDictionaryFromProtoDictionary(v6);
      v14 = objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_7:
  v15 = (void *)v14;

  v6 = v15;
LABEL_8:

  return v6;
}

void ___MRMediaRemoteCommandOptionsSerialization_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *ExternalRepresentation;
  id v9;

  v9 = a2;
  v4 = a3;
  objc_msgSend(v9, "systemAppPlaybackQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v9, "systemAppPlaybackQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MRSystemAppPlaybackQueueCreateFromProtobuf(v6);

    ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation(*MEMORY[0x1E0C9AE00], (uint64_t)v7);
    objc_msgSend(v9, "setSystemAppPlaybackQueueData:", ExternalRepresentation);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", ExternalRepresentation, CFSTR("kMRMediaRemoteOptionSystemAppPlaybackQueueData"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("MRMediaRemoteOptionSystemAppPlaybackQueue"));
    MRSystemAppPlaybackQueueDestroy(v7);

  }
}

@end
