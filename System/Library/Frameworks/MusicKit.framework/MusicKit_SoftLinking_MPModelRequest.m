@implementation MusicKit_SoftLinking_MPModelRequest

- (MPModelRequest)_underlyingRequest
{
  return self->_underlyingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingRequest, 0);
}

+ (id)_playlistSupportedProperties
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  id *v26;
  void *v27;
  id *v28;
  void *v29;
  id *v30;
  void *v31;
  id *v32;
  void *v33;
  id *v34;
  void *v35;
  id *v36;
  void *v37;
  id *v38;
  void *v39;
  id *v40;
  void *v41;
  id *v42;
  void *v43;
  id *v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  id *v49;
  void *v50;
  id v51;
  id *v52;
  void *v53;
  id v54;
  void *v55;
  id *v56;
  void *v57;
  id v58;
  id *v59;
  void *v60;
  id v61;
  id *v62;
  void *v63;
  id v64;
  id *v65;
  void *v66;
  id v67;
  id *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id *v74;
  void *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[4];
  id v122;
  void *v123;
  _QWORD v124[39];

  v124[37] = *MEMORY[0x24BDAC8D0];
  v115 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyPlaylistName();
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v114;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v2 = (id *)getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_6();
    v2 = (id *)dlsym(v3, "MPModelPropertyPlaylistEditorNotes");
    v118[3] = (uint64_t)v2;
    getMPModelPropertyPlaylistEditorNotesSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v117, 8);
  if (!v2)
    goto LABEL_97;
  v108 = *v2;
  v124[1] = v108;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v4 = (id *)getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyPlaylistShortEditorNotes");
    v118[3] = (uint64_t)v4;
    getMPModelPropertyPlaylistShortEditorNotesSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v117, 8);
  if (!v4)
    goto LABEL_97;
  v107 = *v4;
  v124[2] = v107;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v6 = (id *)getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyPlaylistReleaseDateComponents");
    v118[3] = (uint64_t)v6;
    getMPModelPropertyPlaylistReleaseDateComponentsSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v117, 8);
  if (!v6)
    goto LABEL_97;
  v106 = *v6;
  v124[3] = v106;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v8 = (id *)getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelPropertyPlaylistLastModifiedDateComponents");
    v118[3] = (uint64_t)v8;
    getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v117, 8);
  if (!v8)
    goto LABEL_97;
  v105 = *v8;
  v124[4] = v105;
  getMPModelPropertyPlaylistArtwork();
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v124[5] = v113;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v10 = (id *)getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v10 = (id *)dlsym(v11, "MPModelPropertyPlaylistCoverArtworkRecipe");
    v118[3] = (uint64_t)v10;
    getMPModelPropertyPlaylistCoverArtworkRecipeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v117, 8);
  if (!v10)
    goto LABEL_97;
  v104 = *v10;
  v124[6] = v104;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertyPlaylistEditorialArtwork");
    v118[3] = (uint64_t)v12;
    getMPModelPropertyPlaylistEditorialArtworkSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v117, 8);
  if (!v12)
    goto LABEL_97;
  v103 = *v12;
  v124[7] = v103;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v14 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelPropertyPlaylistTracksTiledArtwork");
    v118[3] = (uint64_t)v14;
    getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v117, 8);
  if (!v14)
    goto LABEL_97;
  v102 = *v14;
  v124[8] = v102;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v16 = (id *)getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v16 = (id *)dlsym(v17, "MPModelPropertyPlaylistHasCleanContent");
    v118[3] = (uint64_t)v16;
    getMPModelPropertyPlaylistHasCleanContentSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v117, 8);
  if (!v16)
    goto LABEL_97;
  v101 = *v16;
  v124[9] = v101;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v18 = (id *)getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertyPlaylistHasExplicitContent");
    v118[3] = (uint64_t)v18;
    getMPModelPropertyPlaylistHasExplicitContentSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v117, 8);
  if (!v18)
    goto LABEL_97;
  v100 = *v18;
  v124[10] = v100;
  getMPModelPropertyPlaylistType();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v124[11] = v112;
  getMPModelPropertyPlaylistIsFavorite();
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v124[12] = v111;
  getMPModelPropertyPlaylistDateFavorited();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v124[13] = v110;
  getMPModelPropertyPlaylistLibraryAdded();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v124[14] = v109;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v20 = (id *)getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr)
  {
    v21 = (void *)MediaPlayerLibrary_6();
    v20 = (id *)dlsym(v21, "MPModelPropertyPlaylistLibraryAddedDate");
    v118[3] = (uint64_t)v20;
    getMPModelPropertyPlaylistLibraryAddedDateSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v117, 8);
  if (!v20)
    goto LABEL_97;
  v99 = *v20;
  v124[15] = v99;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v22 = (id *)getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr)
  {
    v23 = (void *)MediaPlayerLibrary_6();
    v22 = (id *)dlsym(v23, "MPModelPropertyPlaylistDownloadedDate");
    v118[3] = (uint64_t)v22;
    getMPModelPropertyPlaylistDownloadedDateSymbolLoc_ptr = (uint64_t)v22;
  }
  _Block_object_dispose(&v117, 8);
  if (!v22)
    goto LABEL_97;
  v98 = *v22;
  v124[16] = v98;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v24 = (id *)getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v25 = (void *)MediaPlayerLibrary_6();
    v24 = (id *)dlsym(v25, "MPModelPropertyPlaylistLastDevicePlaybackDate");
    v118[3] = (uint64_t)v24;
    getMPModelPropertyPlaylistLastDevicePlaybackDateSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v117, 8);
  if (!v24)
    goto LABEL_97;
  v97 = *v24;
  v124[17] = v97;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v26 = (id *)getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr)
  {
    v27 = (void *)MediaPlayerLibrary_6();
    v26 = (id *)dlsym(v27, "MPModelPropertyPlaylistKeepLocalEnableState");
    v118[3] = (uint64_t)v26;
    getMPModelPropertyPlaylistKeepLocalEnableStateSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v117, 8);
  if (!v26)
    goto LABEL_97;
  v96 = *v26;
  v124[18] = v96;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v28 = (id *)getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr)
  {
    v29 = (void *)MediaPlayerLibrary_6();
    v28 = (id *)dlsym(v29, "MPModelPropertyPlaylistKeepLocalManagedStatus");
    v118[3] = (uint64_t)v28;
    getMPModelPropertyPlaylistKeepLocalManagedStatusSymbolLoc_ptr = (uint64_t)v28;
  }
  _Block_object_dispose(&v117, 8);
  if (!v28)
    goto LABEL_97;
  v95 = *v28;
  v124[19] = v95;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v30 = (id *)getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    v31 = (void *)MediaPlayerLibrary_6();
    v30 = (id *)dlsym(v31, "MPModelPropertyPlaylistKeepLocalManagedStatusReason");
    v118[3] = (uint64_t)v30;
    getMPModelPropertyPlaylistKeepLocalManagedStatusReasonSymbolLoc_ptr = (uint64_t)v30;
  }
  _Block_object_dispose(&v117, 8);
  if (!v30)
    goto LABEL_97;
  v94 = *v30;
  v124[20] = v94;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v32 = (id *)getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr)
  {
    v33 = (void *)MediaPlayerLibrary_6();
    v32 = (id *)dlsym(v33, "MPModelPropertyPlaylistIsOwner");
    v118[3] = (uint64_t)v32;
    getMPModelPropertyPlaylistIsOwnerSymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v117, 8);
  if (!v32)
    goto LABEL_97;
  v93 = *v32;
  v124[21] = v93;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v34 = (id *)getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr)
  {
    v35 = (void *)MediaPlayerLibrary_6();
    v34 = (id *)dlsym(v35, "MPModelPropertyPlaylistIsCollaborative");
    v118[3] = (uint64_t)v34;
    getMPModelPropertyPlaylistIsCollaborativeSymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v117, 8);
  if (!v34)
    goto LABEL_97;
  v92 = *v34;
  v124[22] = v92;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v36 = (id *)getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr)
  {
    v37 = (void *)MediaPlayerLibrary_6();
    v36 = (id *)dlsym(v37, "MPModelPropertyPlaylistCuratorPlaylist");
    v118[3] = (uint64_t)v36;
    getMPModelPropertyPlaylistCuratorPlaylistSymbolLoc_ptr = (uint64_t)v36;
  }
  _Block_object_dispose(&v117, 8);
  if (!v36)
    goto LABEL_97;
  v91 = *v36;
  v124[23] = v91;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v38 = (id *)getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr)
  {
    v39 = (void *)MediaPlayerLibrary_6();
    v38 = (id *)dlsym(v39, "MPModelPropertyPlaylistPublicPlaylist");
    v118[3] = (uint64_t)v38;
    getMPModelPropertyPlaylistPublicPlaylistSymbolLoc_ptr = (uint64_t)v38;
  }
  _Block_object_dispose(&v117, 8);
  if (!v38)
    goto LABEL_97;
  v90 = *v38;
  v124[24] = v90;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v40 = (id *)getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr)
  {
    v41 = (void *)MediaPlayerLibrary_6();
    v40 = (id *)dlsym(v41, "MPModelPropertyPlaylistVisiblePlaylist");
    v118[3] = (uint64_t)v40;
    getMPModelPropertyPlaylistVisiblePlaylistSymbolLoc_ptr = (uint64_t)v40;
  }
  _Block_object_dispose(&v117, 8);
  if (!v40)
    goto LABEL_97;
  v89 = *v40;
  v124[25] = v89;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v42 = (id *)getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr)
  {
    v43 = (void *)MediaPlayerLibrary_6();
    v42 = (id *)dlsym(v43, "MPModelPropertyPlaylistSubscribed");
    v118[3] = (uint64_t)v42;
    getMPModelPropertyPlaylistSubscribedSymbolLoc_ptr = (uint64_t)v42;
  }
  _Block_object_dispose(&v117, 8);
  if (!v42)
    goto LABEL_97;
  v88 = *v42;
  v124[26] = v88;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v44 = (id *)getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr)
  {
    v45 = (void *)MediaPlayerLibrary_6();
    v44 = (id *)dlsym(v45, "MPModelPropertyPlaylistUserEditableComponents");
    v118[3] = (uint64_t)v44;
    getMPModelPropertyPlaylistUserEditableComponentsSymbolLoc_ptr = (uint64_t)v44;
  }
  _Block_object_dispose(&v117, 8);
  if (!v44)
    goto LABEL_97;
  v87 = *v44;
  v124[27] = v87;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v46 = (id *)getMPModelPropertyPlaylistShareURLSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistShareURLSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistShareURLSymbolLoc_ptr)
  {
    v47 = (void *)MediaPlayerLibrary_6();
    v46 = (id *)dlsym(v47, "MPModelPropertyPlaylistShareURL");
    v118[3] = (uint64_t)v46;
    getMPModelPropertyPlaylistShareURLSymbolLoc_ptr = (uint64_t)v46;
  }
  _Block_object_dispose(&v117, 8);
  if (!v46)
    goto LABEL_97;
  v48 = *v46;
  v124[28] = v48;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v49 = (id *)getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr)
  {
    v50 = (void *)MediaPlayerLibrary_6();
    v49 = (id *)dlsym(v50, "MPModelPropertyPlaylistDescriptionText");
    v118[3] = (uint64_t)v49;
    getMPModelPropertyPlaylistDescriptionTextSymbolLoc_ptr = (uint64_t)v49;
  }
  _Block_object_dispose(&v117, 8);
  if (!v49)
    goto LABEL_97;
  v51 = *v49;
  v124[29] = v51;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v52 = (id *)getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr)
  {
    v53 = (void *)MediaPlayerLibrary_6();
    v52 = (id *)dlsym(v53, "MPModelPropertyPlaylistCloudVersionHash");
    v118[3] = (uint64_t)v52;
    getMPModelPropertyPlaylistCloudVersionHashSymbolLoc_ptr = (uint64_t)v52;
  }
  _Block_object_dispose(&v117, 8);
  if (!v52)
    goto LABEL_97;
  v54 = *v52;
  v124[30] = v54;
  getMPModelPropertyPlaylistTraits();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v124[31] = v55;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v56 = (id *)getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr)
  {
    v57 = (void *)MediaPlayerLibrary_6();
    v56 = (id *)dlsym(v57, "MPModelPropertyPlaylistCollaborationInvitationURL");
    v118[3] = (uint64_t)v56;
    getMPModelPropertyPlaylistCollaborationInvitationURLSymbolLoc_ptr = (uint64_t)v56;
  }
  _Block_object_dispose(&v117, 8);
  if (!v56)
    goto LABEL_97;
  v58 = *v56;
  v124[32] = v58;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v59 = (id *)getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr)
  {
    v60 = (void *)MediaPlayerLibrary_6();
    v59 = (id *)dlsym(v60, "MPModelPropertyPlaylistCollaborationInvitationURLExpirationDate");
    v118[3] = (uint64_t)v59;
    getMPModelPropertyPlaylistCollaborationInvitationURLExpirationDateSymbolLoc_ptr = (uint64_t)v59;
  }
  _Block_object_dispose(&v117, 8);
  if (!v59)
    goto LABEL_97;
  v61 = *v59;
  v124[33] = v61;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v62 = (id *)getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr)
  {
    v63 = (void *)MediaPlayerLibrary_6();
    v62 = (id *)dlsym(v63, "MPModelPropertyPlaylistCollaboratorStatus");
    v118[3] = (uint64_t)v62;
    getMPModelPropertyPlaylistCollaboratorStatusSymbolLoc_ptr = (uint64_t)v62;
  }
  _Block_object_dispose(&v117, 8);
  if (!v62)
    goto LABEL_97;
  v64 = *v62;
  v124[34] = v64;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v65 = (id *)getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr)
  {
    v66 = (void *)MediaPlayerLibrary_6();
    v65 = (id *)dlsym(v66, "MPModelPropertyPlaylistCollaborationSharingMode");
    v118[3] = (uint64_t)v65;
    getMPModelPropertyPlaylistCollaborationSharingModeSymbolLoc_ptr = (uint64_t)v65;
  }
  _Block_object_dispose(&v117, 8);
  if (!v65)
    goto LABEL_97;
  v67 = *v65;
  v124[35] = v67;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v68 = (id *)getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr;
  v120 = getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr)
  {
    v69 = (void *)MediaPlayerLibrary_6();
    v68 = (id *)dlsym(v69, "MPModelPropertyPlaylistParentPersistentID");
    v118[3] = (uint64_t)v68;
    getMPModelPropertyPlaylistParentPersistentIDSymbolLoc_ptr = (uint64_t)v68;
  }
  _Block_object_dispose(&v117, 8);
  if (!v68)
    goto LABEL_97;
  v70 = *v68;
  v124[36] = v70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v124, 37);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)objc_msgSend(v115, "initWithArray:", v71);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertyPlaylistIsDisliked();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "addObject:", v72);

  }
  v73 = objc_alloc((Class)getMPPropertySetClass());
  v117 = 0;
  v118 = &v117;
  v119 = 0x2020000000;
  v74 = (id *)getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr;
  v120 = getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr)
  {
    v75 = (void *)MediaPlayerLibrary_6();
    v74 = (id *)dlsym(v75, "MPModelRelationshipPlaylistCurator");
    v118[3] = (uint64_t)v74;
    getMPModelRelationshipPlaylistCuratorSymbolLoc_ptr = (uint64_t)v74;
  }
  _Block_object_dispose(&v117, 8);
  if (!v74)
  {
LABEL_97:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v76 = *v74;
  v122 = v76;
  v77 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyCuratorName();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v78;
  getMPModelPropertyCuratorKind();
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v79;
  getMPModelPropertyCuratorSubKind();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v121[2] = v80;
  getMPModelPropertyCuratorHandle();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v121[3] = v81;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (void *)objc_msgSend(v77, "initWithProperties:relationships:", v82, MEMORY[0x24BDBD1B8]);
  v123 = v83;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)objc_msgSend(v73, "initWithProperties:relationships:", v116, v84);

  return v85;
}

- (id)_initWithUnderlyingRequest:(id)a3
{
  id v5;
  MusicKit_SoftLinking_MPModelRequest *v6;
  MusicKit_SoftLinking_MPModelRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPModelRequest;
  v6 = -[MusicKit_SoftLinking_MPModelRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingRequest, a3);

  return v7;
}

+ (id)_supportedPropertiesForModelObjectType:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  id v16[2];

  v3 = 0;
  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_albumSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2:
      objc_msgSend(a1, "_artistSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3:
      objc_msgSend(a1, "_composerSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 5:
      objc_msgSend(a1, "_curatorSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 9:
      objc_msgSend(a1, "_genreSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 12:
      objc_msgSend(a1, "_lyricsSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 13:
      objc_msgSend(a1, "_movieSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 14:
    case 26:
    case 30:
    case 34:
    case 35:
      objc_msgSend(a1, "_songSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 15:
    case 19:
    case 20:
      objc_msgSend(a1, "_playlistSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 16:
      objc_msgSend(a1, "_playlistAuthorSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 17:
      objc_msgSend(a1, "_playlistEntrySupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 18:
      objc_msgSend(a1, "_playlistEntryReactionSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 23:
      objc_msgSend(a1, "_recentlyAddedObjectSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 29:
      v5 = objc_alloc((Class)getMPPropertySetClass());
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v6 = (id *)getMPModelPropertySectionTitleSymbolLoc_ptr;
      v15 = getMPModelPropertySectionTitleSymbolLoc_ptr;
      if (!getMPModelPropertySectionTitleSymbolLoc_ptr)
      {
        v7 = (void *)MediaPlayerLibrary_6();
        v6 = (id *)dlsym(v7, "MPModelPropertySectionTitle");
        v13[3] = (uint64_t)v6;
        getMPModelPropertySectionTitleSymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v12, 8);
      if (!v6)
      {
        +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
        __break(1u);
      }
      v16[0] = *v6;
      v8 = (void *)MEMORY[0x24BDBCE30];
      v9 = v16[0];
      objc_msgSend(v8, "arrayWithObjects:count:", v16, 1, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = (void *)objc_msgSend(v5, "initWithProperties:relationships:", v10, MEMORY[0x24BDBD1B8]);
      return v3;
    case 31:
      objc_msgSend(a1, "_tvEpisodeSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 32:
      objc_msgSend(a1, "_tvSeasonSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 33:
      objc_msgSend(a1, "_tvShowSupportedProperties");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v3 = (void *)v4;
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)_songSupportedProperties
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id MPPropertySetClass;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id *v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[3];
  void *v126;
  void *v127;
  _QWORD v128[4];
  _QWORD v129[3];
  void *v130;
  _QWORD v131[4];
  _QWORD v132[6];
  id v133;
  _QWORD v134[7];
  _QWORD v135[32];
  id v136;
  void *v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v119 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertySongTitle();
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v117;
  getMPModelPropertySongDuration();
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v115;
  get_MPModelPropertySongTrackCount();
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v135[2] = v113;
  getMPModelPropertySongTrackNumber();
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v135[3] = v111;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v2 = (id *)getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  v124 = getMPModelPropertySongDiscNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongDiscNumberSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_6();
    v2 = (id *)dlsym(v3, "MPModelPropertySongDiscNumber");
    v122[3] = (uint64_t)v2;
    getMPModelPropertySongDiscNumberSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v121, 8);
  if (!v2)
    goto LABEL_52;
  v85 = *v2;
  v135[4] = v85;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v4 = (id *)getMPModelPropertySongGroupingSymbolLoc_ptr;
  v124 = getMPModelPropertySongGroupingSymbolLoc_ptr;
  if (!getMPModelPropertySongGroupingSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertySongGrouping");
    v122[3] = (uint64_t)v4;
    getMPModelPropertySongGroupingSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v121, 8);
  if (!v4)
    goto LABEL_52;
  v83 = *v4;
  v135[5] = v83;
  getMPModelPropertySongExplicit();
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v135[6] = v109;
  getMPModelPropertySongArtistUploadedContent();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v135[7] = v107;
  getMPModelPropertySongHasVideo();
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v135[8] = v105;
  getMPModelPropertySongArtwork();
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v135[9] = v103;
  getMPModelPropertySongShouldShowComposer();
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v135[10] = v101;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v6 = (id *)getMPModelPropertySongCopyrightTextSymbolLoc_ptr;
  v124 = getMPModelPropertySongCopyrightTextSymbolLoc_ptr;
  if (!getMPModelPropertySongCopyrightTextSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertySongCopyrightText");
    v122[3] = (uint64_t)v6;
    getMPModelPropertySongCopyrightTextSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v121, 8);
  if (!v6)
    goto LABEL_52;
  v81 = *v6;
  v135[11] = v81;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v8 = (id *)getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr;
  v124 = getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr;
  if (!getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelPropertySongVolumeNormalization");
    v122[3] = (uint64_t)v8;
    getMPModelPropertySongVolumeNormalizationSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v121, 8);
  if (!v8)
    goto LABEL_52;
  v79 = *v8;
  v135[12] = v79;
  getMPModelPropertySongIsFavorite();
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v135[13] = v99;
  getMPModelPropertySongDateFavorited();
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v135[14] = v97;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v10 = (id *)getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr;
  v124 = getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v10 = (id *)dlsym(v11, "MPModelPropertySongLastDevicePlaybackDate");
    v122[3] = (uint64_t)v10;
    getMPModelPropertySongLastDevicePlaybackDateSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v121, 8);
  if (!v10)
    goto LABEL_52;
  v77 = *v10;
  v135[15] = v77;
  getMPModelPropertySongLibraryAdded();
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v135[16] = v95;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v12 = (id *)getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr;
  v124 = getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertySongLibraryAddedDate");
    v122[3] = (uint64_t)v12;
    getMPModelPropertySongLibraryAddedDateSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v121, 8);
  if (!v12)
    goto LABEL_52;
  v75 = *v12;
  v135[17] = v75;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v14 = (id *)getMPModelPropertySongPlayCountSymbolLoc_ptr;
  v124 = getMPModelPropertySongPlayCountSymbolLoc_ptr;
  if (!getMPModelPropertySongPlayCountSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelPropertySongPlayCount");
    v122[3] = (uint64_t)v14;
    getMPModelPropertySongPlayCountSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v121, 8);
  if (!v14)
    goto LABEL_52;
  v73 = *v14;
  v135[18] = v73;
  getMPModelPropertySongKeepLocalEnableState();
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v135[19] = v93;
  getMPModelPropertySongKeepLocalManagedStatus();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v135[20] = v91;
  getMPModelPropertySongKeepLocalManagedStatusReason();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v135[21] = v89;
  getMPModelPropertySongLibraryAddEligible();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v135[22] = v87;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v16 = (id *)getMPModelPropertySongClassicalMovementSymbolLoc_ptr;
  v124 = getMPModelPropertySongClassicalMovementSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v16 = (id *)dlsym(v17, "MPModelPropertySongClassicalMovement");
    v122[3] = (uint64_t)v16;
    getMPModelPropertySongClassicalMovementSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v121, 8);
  if (!v16)
    goto LABEL_52;
  v71 = *v16;
  v135[23] = v71;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v18 = (id *)getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr;
  v124 = getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertySongClassicalMovementCount");
    v122[3] = (uint64_t)v18;
    getMPModelPropertySongClassicalMovementCountSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v121, 8);
  if (!v18)
    goto LABEL_52;
  v69 = *v18;
  v135[24] = v69;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v20 = (id *)getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr;
  v124 = getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr)
  {
    v21 = (void *)MediaPlayerLibrary_6();
    v20 = (id *)dlsym(v21, "MPModelPropertySongClassicalMovementNumber");
    v122[3] = (uint64_t)v20;
    getMPModelPropertySongClassicalMovementNumberSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v121, 8);
  if (!v20)
    goto LABEL_52;
  v22 = *v20;
  v135[25] = v22;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v23 = (id *)getMPModelPropertySongClassicalWorkSymbolLoc_ptr;
  v124 = getMPModelPropertySongClassicalWorkSymbolLoc_ptr;
  if (!getMPModelPropertySongClassicalWorkSymbolLoc_ptr)
  {
    v24 = (void *)MediaPlayerLibrary_6();
    v23 = (id *)dlsym(v24, "MPModelPropertySongClassicalWork");
    v122[3] = (uint64_t)v23;
    getMPModelPropertySongClassicalWorkSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v121, 8);
  if (!v23)
    goto LABEL_52;
  v25 = *v23;
  v135[26] = v25;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v26 = (id *)getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr;
  v124 = getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr;
  if (!getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr)
  {
    v27 = (void *)MediaPlayerLibrary_6();
    v26 = (id *)dlsym(v27, "MPModelPropertySongHasCloudSyncSource");
    v122[3] = (uint64_t)v26;
    getMPModelPropertySongHasCloudSyncSourceSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v121, 8);
  if (!v26)
    goto LABEL_52;
  v28 = *v26;
  v135[27] = v28;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v29 = (id *)getMPModelPropertySongYearSymbolLoc_ptr;
  v124 = getMPModelPropertySongYearSymbolLoc_ptr;
  if (!getMPModelPropertySongYearSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v29 = (id *)dlsym(v30, "MPModelPropertySongYear");
    v122[3] = (uint64_t)v29;
    getMPModelPropertySongYearSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v121, 8);
  if (!v29)
    goto LABEL_52;
  v31 = *v29;
  v135[28] = v31;
  getMPModelPropertySongUserRating();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v135[29] = v32;
  getMPModelPropertySongCloudStatus();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v135[30] = v33;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v34 = (id *)getMPModelPropertySongGaplessInfoSymbolLoc_ptr;
  v124 = getMPModelPropertySongGaplessInfoSymbolLoc_ptr;
  if (!getMPModelPropertySongGaplessInfoSymbolLoc_ptr)
  {
    v35 = (void *)MediaPlayerLibrary_6();
    v34 = (id *)dlsym(v35, "MPModelPropertySongGaplessInfo");
    v122[3] = (uint64_t)v34;
    getMPModelPropertySongGaplessInfoSymbolLoc_ptr = (uint64_t)v34;
  }
  _Block_object_dispose(&v121, 8);
  if (!v34)
    goto LABEL_52;
  v36 = *v34;
  v135[31] = v36;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v37 = (id *)getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr;
  v124 = getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr;
  if (!getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr)
  {
    v38 = (void *)MediaPlayerLibrary_6();
    v37 = (id *)dlsym(v38, "MPModelPropertySongVolumeAdjustment");
    v122[3] = (uint64_t)v37;
    getMPModelPropertySongVolumeAdjustmentSymbolLoc_ptr = (uint64_t)v37;
  }
  _Block_object_dispose(&v121, 8);
  if (!v37)
    goto LABEL_52;
  v136 = *v37;
  v39 = v136;
  getMPModelPropertySongTraits();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = (void *)objc_msgSend(v119, "initWithArray:", v41);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertySongIsDisliked();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "addObject:", v42);

  }
  v63 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipSongAlbum();
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v118;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyAlbumTitle();
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v116;
  getMPModelPropertyAlbumReleaseDateComponents();
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v131[1] = v114;
  getMPModelPropertyAlbumYear();
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v131[2] = v112;
  getMPModelPropertyAlbumTrackCount();
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v131[3] = v110;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 4);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v108);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v106;
  getMPModelRelationshipSongArtist();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v104;
  v44 = getMPPropertySetClass();
  getMPModelPropertyArtistName();
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = v102;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v130, 1);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "propertySetWithProperties:", v100);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v98;
  getMPModelRelationshipSongLocalFileAsset();
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v132[2] = v96;
  v45 = getMPPropertySetClass();
  getMPModelPropertyFileAssetNonPurgeable();
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v94;
  getMPModelPropertyFileAssetProtectionType();
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v92;
  getMPModelPropertyFileAssetTraits();
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v129, 3);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "propertySetWithProperties:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v86;
  getMPModelRelationshipSongStoreAsset();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v132[3] = v84;
  v46 = getMPPropertySetClass();
  getMPModelPropertyStoreAssetRedownloadable();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v82;
  getMPModelPropertyStoreAssetSubscriptionRequired();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v128[1] = v80;
  getMPModelPropertyStoreAssetNeedsUserUpload();
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v128[2] = v78;
  getMPModelPropertyStoreAssetEndpointType();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v128[3] = v76;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v128, 4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "propertySetWithProperties:", v74);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v72;
  getMPModelRelationshipSongHomeSharingAsset();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v132[4] = v70;
  v47 = getMPPropertySetClass();
  getMPModelPropertyHomeSharingAssetAvailable();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v68;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v127, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "propertySetWithProperties:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v66;
  getMPModelRelationshipSongComposer();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v132[5] = v65;
  v48 = getMPPropertySetClass();
  getMPModelPropertyComposerName();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v126, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "propertySetWithProperties:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v51;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v52 = (id *)getMPModelRelationshipSongLyricsSymbolLoc_ptr;
  v124 = getMPModelRelationshipSongLyricsSymbolLoc_ptr;
  if (!getMPModelRelationshipSongLyricsSymbolLoc_ptr)
  {
    v53 = (void *)MediaPlayerLibrary_6();
    v52 = (id *)dlsym(v53, "MPModelRelationshipSongLyrics");
    v122[3] = (uint64_t)v52;
    getMPModelRelationshipSongLyricsSymbolLoc_ptr = (uint64_t)v52;
  }
  _Block_object_dispose(&v121, 8);
  if (!v52)
  {
LABEL_52:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v133 = *v52;
  v54 = v133;
  v55 = getMPPropertySetClass();
  getMPModelPropertyLyricsHasLibraryLyrics();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v56;
  getMPModelPropertyLyricsHasStoreLyrics();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v57;
  getMPModelPropertyLyricsHasTimeSyncedLyrics();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v58;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v125, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "propertySetWithProperties:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v134[6] = v60;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v134, v132, 7);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (id)objc_msgSend(v63, "initWithProperties:relationships:", v120, v61);

  return v64;
}

+ (MusicKit_SoftLinking_MPModelRequest)defaultUnpersonalizedRequest
{
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  id v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[6];
  id v58;
  _QWORD v59[7];
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v54 = &v53;
  v55 = 0x2050000000;
  v3 = (void *)getMPModelRequestClass_softClass;
  v56 = getMPModelRequestClass_softClass;
  if (!getMPModelRequestClass_softClass)
  {
    v48 = MEMORY[0x24BDAC760];
    v49 = 3221225472;
    v50 = (uint64_t)__getMPModelRequestClass_block_invoke;
    v51 = &unk_24CD1CC68;
    v52 = &v53;
    __getMPModelRequestClass_block_invoke((uint64_t)&v48);
    v3 = (void *)v54[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v53, 8);
  v47 = objc_alloc_init(v4);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2050000000;
  v5 = (void *)getMPModelKindClass_softClass;
  v56 = getMPModelKindClass_softClass;
  if (!getMPModelKindClass_softClass)
  {
    v48 = MEMORY[0x24BDAC760];
    v49 = 3221225472;
    v50 = (uint64_t)__getMPModelKindClass_block_invoke;
    v51 = &unk_24CD1CC68;
    v52 = &v53;
    __getMPModelKindClass_block_invoke((uint64_t)&v48);
    v5 = (void *)v54[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v53, 8);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2050000000;
  v7 = (void *)getMPModelStoreBrowseContentItemClass_softClass_0;
  v56 = getMPModelStoreBrowseContentItemClass_softClass_0;
  if (!getMPModelStoreBrowseContentItemClass_softClass_0)
  {
    v48 = MEMORY[0x24BDAC760];
    v49 = 3221225472;
    v50 = (uint64_t)__getMPModelStoreBrowseContentItemClass_block_invoke_0;
    v51 = &unk_24CD1CC68;
    v52 = &v53;
    __getMPModelStoreBrowseContentItemClass_block_invoke_0((uint64_t)&v48);
    v7 = (void *)v54[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v53, 8);
  objc_msgSend(v6, "kindWithModelClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setItemKind:", v9);

  v42 = objc_alloc((Class)getMPPropertySetClass());
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v10 = (id *)getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v10 = (id *)dlsym(v11, "MPModelStoreBrowseContentItemPropertyItemType");
    *(_QWORD *)(v49 + 24) = v10;
    getMPModelStoreBrowseContentItemPropertyItemTypeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v48, 8);
  if (!v10)
    goto LABEL_32;
  v41 = *v10;
  v60[0] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v12 = (id *)getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelStoreBrowseContentItemRelationshipAlbum");
    *(_QWORD *)(v49 + 24) = v12;
    getMPModelStoreBrowseContentItemRelationshipAlbumSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v48, 8);
  if (!v12)
    goto LABEL_32;
  v40 = *v12;
  v57[0] = v40;
  objc_msgSend(a1, "_albumSupportedProperties");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v46;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v14 = (id *)getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelStoreBrowseContentItemRelationshipArtist");
    *(_QWORD *)(v49 + 24) = v14;
    getMPModelStoreBrowseContentItemRelationshipArtistSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v48, 8);
  if (!v14)
    goto LABEL_32;
  v39 = *v14;
  v57[1] = v39;
  objc_msgSend(a1, "_artistSupportedProperties");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v45;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v16 = (id *)getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v16 = (id *)dlsym(v17, "MPModelStoreBrowseContentItemRelationshipSong");
    *(_QWORD *)(v49 + 24) = v16;
    getMPModelStoreBrowseContentItemRelationshipSongSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v48, 8);
  if (!v16)
    goto LABEL_32;
  v38 = *v16;
  v57[2] = v38;
  objc_msgSend(a1, "_songSupportedProperties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v44;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v18 = (id *)getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelStoreBrowseContentItemRelationshipMovie");
    *(_QWORD *)(v49 + 24) = v18;
    getMPModelStoreBrowseContentItemRelationshipMovieSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v48, 8);
  if (!v18)
    goto LABEL_32;
  v37 = *v18;
  v57[3] = v37;
  objc_msgSend(a1, "_movieSupportedProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v20;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v21 = (id *)getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr)
  {
    v22 = (void *)MediaPlayerLibrary_6();
    v21 = (id *)dlsym(v22, "MPModelStoreBrowseContentItemRelationshipPlaylist");
    *(_QWORD *)(v49 + 24) = v21;
    getMPModelStoreBrowseContentItemRelationshipPlaylistSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v48, 8);
  if (!v21)
    goto LABEL_32;
  v23 = *v21;
  v57[4] = v23;
  objc_msgSend(a1, "_playlistSupportedProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v24;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v25 = (id *)getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr)
  {
    v26 = (void *)MediaPlayerLibrary_6();
    v25 = (id *)dlsym(v26, "MPModelStoreBrowseContentItemRelationshipTVEpisode");
    *(_QWORD *)(v49 + 24) = v25;
    getMPModelStoreBrowseContentItemRelationshipTVEpisodeSymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v48, 8);
  if (!v25)
    goto LABEL_32;
  v27 = *v25;
  v57[5] = v27;
  objc_msgSend(a1, "_tvEpisodeSupportedProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v28;
  v48 = 0;
  v49 = (uint64_t)&v48;
  v50 = 0x2020000000;
  v29 = (id *)getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr;
  v51 = (void *)getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr;
  if (!getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v29 = (id *)dlsym(v30, "MPModelStoreBrowseContentItemRelationshipTVSeason");
    *(_QWORD *)(v49 + 24) = v29;
    getMPModelStoreBrowseContentItemRelationshipTVSeasonSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v48, 8);
  if (!v29)
  {
LABEL_32:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v58 = *v29;
  v31 = v58;
  objc_msgSend(a1, "_tvSeasonSupportedProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v57, 7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v42, "initWithProperties:relationships:", v43, v33);
  objc_msgSend(v47, "setItemProperties:", v34);

  v35 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithUnderlyingRequest:", v47);
  return (MusicKit_SoftLinking_MPModelRequest *)v35;
}

+ (id)_playbackSectionSupportedProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  id v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipGenericAlbum();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(a1, "_albumSupportedPropertiesForPlayback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  getMPModelRelationshipGenericPlaylist();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  objc_msgSend(a1, "_playlistSupportedPropertiesForPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = (id *)getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  v20 = getMPModelRelationshipGenericRadioStationSymbolLoc_ptr;
  if (!getMPModelRelationshipGenericRadioStationSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelRelationshipGenericRadioStation");
    v18[3] = (uint64_t)v8;
    getMPModelRelationshipGenericRadioStationSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v17, 8);
  if (!v8)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v22 = *v8;
  v10 = v22;
  objc_msgSend(a1, "_radioStationSupportedPropertiesForPlayback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v11;
  getMPModelRelationshipGenericTVSeason();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  objc_msgSend(a1, "_tvSeasonSupportedPropertiesForPlayback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v21, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v14);

  return v15;
}

+ (id)_playbackItemSupportedProperties
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v4 = (id *)getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr;
  v24 = getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr;
  if (!getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelRelationshipGenericPlaylistEntry");
    v22[3] = (uint64_t)v4;
    getMPModelRelationshipGenericPlaylistEntrySymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v21, 8);
  if (!v4)
    goto LABEL_11;
  v6 = *v4;
  v25[0] = v6;
  objc_msgSend(a1, "_playlistEntrySupportedPropertiesForPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v8 = (id *)getMPModelRelationshipGenericSongSymbolLoc_ptr_0;
  v24 = getMPModelRelationshipGenericSongSymbolLoc_ptr_0;
  if (!getMPModelRelationshipGenericSongSymbolLoc_ptr_0)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelRelationshipGenericSong");
    v22[3] = (uint64_t)v8;
    getMPModelRelationshipGenericSongSymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v21, 8);
  if (!v8)
    goto LABEL_11;
  v10 = *v8;
  v25[1] = v10;
  objc_msgSend(a1, "_songSupportedPropertiesForPlayback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  getMPModelRelationshipGenericMovie();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v12;
  objc_msgSend(a1, "_movieSupportedPropertiesForPlayback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v13;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v14 = (id *)getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0;
  v24 = getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0;
  if (!getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelRelationshipGenericTVEpisode");
    v22[3] = (uint64_t)v14;
    getMPModelRelationshipGenericTVEpisodeSymbolLoc_ptr_0 = (uint64_t)v14;
  }
  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
LABEL_11:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v26 = *v14;
  v16 = v26;
  objc_msgSend(a1, "_tvEpisodeSupportedPropertiesForPlayback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v25, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v18);

  return v19;
}

+ (id)_propertySetForRawProperties:(id)a3 relationships:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __82__MusicKit_SoftLinking_MPModelRequest__propertySetForRawProperties_relationships___block_invoke;
  v17 = &unk_24CD1D4E0;
  v18 = v9;
  v19 = a1;
  v10 = v9;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v14);

  v11 = objc_alloc((Class)getMPPropertySetClass());
  v12 = (void *)objc_msgSend(v11, "initWithProperties:relationships:", v8, v10, v14, v15, v16, v17);

  return v12;
}

+ (id)_albumSupportedProperties
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  id v31;
  id *v32;
  void *v33;
  id v34;
  id *v35;
  void *v36;
  id v37;
  id *v38;
  void *v39;
  id v40;
  id *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
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
  id v57;
  void *v58;
  void *v59;
  id *v60;
  void *v61;
  id v62;
  void *v63;
  id *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[2];
  id v97;
  _QWORD v98[3];
  _QWORD v99[6];
  _QWORD v100[25];
  id v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v90 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyAlbumTitle();
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v89;
  getMPModelPropertyAlbumTrackCount();
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v88;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v2 = (id *)getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_6();
    v2 = (id *)dlsym(v3, "MPModelPropertyAlbumMaximumItemTrackNumber");
    v93[3] = (uint64_t)v2;
    getMPModelPropertyAlbumMaximumItemTrackNumberSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v92, 8);
  if (!v2)
    goto LABEL_61;
  v79 = *v2;
  v100[2] = v79;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v4 = (id *)getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyAlbumHasCleanContent");
    v93[3] = (uint64_t)v4;
    getMPModelPropertyAlbumHasCleanContentSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v92, 8);
  if (!v4)
    goto LABEL_61;
  v78 = *v4;
  v100[3] = v78;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v6 = (id *)getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyAlbumHasExplicitContent");
    v93[3] = (uint64_t)v6;
    getMPModelPropertyAlbumHasExplicitContentSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v92, 8);
  if (!v6)
    goto LABEL_61;
  v77 = *v6;
  v100[4] = v77;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v8 = (id *)getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelPropertyAlbumIsCompilation");
    v93[3] = (uint64_t)v8;
    getMPModelPropertyAlbumIsCompilationSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v92, 8);
  if (!v8)
    goto LABEL_61;
  v76 = *v8;
  v100[5] = v76;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v10 = (id *)getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v10 = (id *)dlsym(v11, "MPModelPropertyAlbumIsClassical");
    v93[3] = (uint64_t)v10;
    getMPModelPropertyAlbumIsClassicalSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v92, 8);
  if (!v10)
    goto LABEL_61;
  v75 = *v10;
  v100[6] = v75;
  getMPModelPropertyAlbumIsFavorite();
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v100[7] = v87;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v12 = (id *)getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertyAlbumClassicalExperienceAvailable");
    v93[3] = (uint64_t)v12;
    getMPModelPropertyAlbumClassicalExperienceAvailableSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v92, 8);
  if (!v12)
    goto LABEL_61;
  v74 = *v12;
  v100[8] = v74;
  getMPModelPropertyAlbumDateFavorited();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v100[9] = v86;
  getMPModelPropertyAlbumReleaseDateComponents();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v100[10] = v85;
  getMPModelPropertyAlbumArtwork();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v100[11] = v84;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v14 = (id *)getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelPropertyAlbumLastDevicePlaybackDate");
    v93[3] = (uint64_t)v14;
    getMPModelPropertyAlbumLastDevicePlaybackDateSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v92, 8);
  if (!v14)
    goto LABEL_61;
  v73 = *v14;
  v100[12] = v73;
  getMPModelPropertyAlbumLibraryAddEligible();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v100[13] = v83;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v16 = (id *)getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v16 = (id *)dlsym(v17, "MPModelPropertyAlbumDownloadedDate");
    v93[3] = (uint64_t)v16;
    getMPModelPropertyAlbumDownloadedDateSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v92, 8);
  if (!v16)
    goto LABEL_61;
  v72 = *v16;
  v100[14] = v72;
  getMPModelPropertyAlbumYear();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v100[15] = v82;
  getMPModelPropertyAlbumLibraryAdded();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v100[16] = v81;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v18 = (id *)getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertyAlbumLibraryAddedDate");
    v93[3] = (uint64_t)v18;
    getMPModelPropertyAlbumLibraryAddedDateSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v92, 8);
  if (!v18)
    goto LABEL_61;
  v71 = *v18;
  v100[17] = v71;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v20 = (id *)getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr)
  {
    v21 = (void *)MediaPlayerLibrary_6();
    v20 = (id *)dlsym(v21, "MPModelPropertyAlbumKeepLocalEnableState");
    v93[3] = (uint64_t)v20;
    getMPModelPropertyAlbumKeepLocalEnableStateSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v92, 8);
  if (!v20)
    goto LABEL_61;
  v22 = *v20;
  v100[18] = v22;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v23 = (id *)getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr)
  {
    v24 = (void *)MediaPlayerLibrary_6();
    v23 = (id *)dlsym(v24, "MPModelPropertyAlbumKeepLocalManagedStatus");
    v93[3] = (uint64_t)v23;
    getMPModelPropertyAlbumKeepLocalManagedStatusSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v92, 8);
  if (!v23)
    goto LABEL_61;
  v25 = *v23;
  v100[19] = v25;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v26 = (id *)getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    v27 = (void *)MediaPlayerLibrary_6();
    v26 = (id *)dlsym(v27, "MPModelPropertyAlbumKeepLocalManagedStatusReason");
    v93[3] = (uint64_t)v26;
    getMPModelPropertyAlbumKeepLocalManagedStatusReasonSymbolLoc_ptr = (uint64_t)v26;
  }
  _Block_object_dispose(&v92, 8);
  if (!v26)
    goto LABEL_61;
  v28 = *v26;
  v100[20] = v28;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v29 = (id *)getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v29 = (id *)dlsym(v30, "MPModelPropertyAlbumCopyrightText");
    v93[3] = (uint64_t)v29;
    getMPModelPropertyAlbumCopyrightTextSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v92, 8);
  if (!v29)
    goto LABEL_61;
  v31 = *v29;
  v100[21] = v31;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v32 = (id *)getMPModelPropertyAlbumPreorderSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumPreorderSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumPreorderSymbolLoc_ptr)
  {
    v33 = (void *)MediaPlayerLibrary_6();
    v32 = (id *)dlsym(v33, "MPModelPropertyAlbumPreorder");
    v93[3] = (uint64_t)v32;
    getMPModelPropertyAlbumPreorderSymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v92, 8);
  if (!v32)
    goto LABEL_61;
  v34 = *v32;
  v100[22] = v34;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v35 = (id *)getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr)
  {
    v36 = (void *)MediaPlayerLibrary_6();
    v35 = (id *)dlsym(v36, "MPModelPropertyAlbumEditorNotes");
    v93[3] = (uint64_t)v35;
    getMPModelPropertyAlbumEditorNotesSymbolLoc_ptr = (uint64_t)v35;
  }
  _Block_object_dispose(&v92, 8);
  if (!v35)
    goto LABEL_61;
  v37 = *v35;
  v100[23] = v37;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v38 = (id *)getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr)
  {
    v39 = (void *)MediaPlayerLibrary_6();
    v38 = (id *)dlsym(v39, "MPModelPropertyAlbumShortEditorNotes");
    v93[3] = (uint64_t)v38;
    getMPModelPropertyAlbumShortEditorNotesSymbolLoc_ptr = (uint64_t)v38;
  }
  _Block_object_dispose(&v92, 8);
  if (!v38)
    goto LABEL_61;
  v40 = *v38;
  v100[24] = v40;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v41 = (id *)getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr;
  v95 = getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr;
  if (!getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr)
  {
    v42 = (void *)MediaPlayerLibrary_6();
    v41 = (id *)dlsym(v42, "MPModelPropertyAlbumVolumeNormalization");
    v93[3] = (uint64_t)v41;
    getMPModelPropertyAlbumVolumeNormalizationSymbolLoc_ptr = (uint64_t)v41;
  }
  _Block_object_dispose(&v92, 8);
  if (!v41)
    goto LABEL_61;
  v101 = *v41;
  v43 = v101;
  getMPModelPropertyAlbumTraits();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v100, 27);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend(v90, "initWithArray:", v45);

  v46 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyArtistName();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v47;
  getMPModelPropertyArtistSongCount();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v48;
  getMPModelPropertyArtistAlbumCount();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v49;
  getMPModelPropertyArtistLibraryAddedDate();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v50;
  getMPModelPropertyArtistIsFavorite();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v99[4] = v51;
  getMPModelPropertyArtistDateFavorited();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v99[5] = v52;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 6);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v46, "initWithArray:", v53);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertyAlbumIsDisliked();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v55);

    getMPModelPropertyArtistIsDisliked();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObject:", v56);

  }
  v57 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipAlbumArtist();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v58;
  objc_msgSend(getMPPropertySetClass(), "propertySetWithProperties:", v54);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v59;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v60 = (id *)getMPModelRelationshipAlbumGenreSymbolLoc_ptr;
  v95 = getMPModelRelationshipAlbumGenreSymbolLoc_ptr;
  if (!getMPModelRelationshipAlbumGenreSymbolLoc_ptr)
  {
    v61 = (void *)MediaPlayerLibrary_6();
    v60 = (id *)dlsym(v61, "MPModelRelationshipAlbumGenre");
    v93[3] = (uint64_t)v60;
    getMPModelRelationshipAlbumGenreSymbolLoc_ptr = (uint64_t)v60;
  }
  _Block_object_dispose(&v92, 8);
  if (!v60)
    goto LABEL_61;
  v62 = *v60;
  v96[1] = v62;
  objc_msgSend(a1, "_genreSupportedProperties");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v63;
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v64 = (id *)getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr;
  v95 = getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr;
  if (!getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr)
  {
    v65 = (void *)MediaPlayerLibrary_6();
    v64 = (id *)dlsym(v65, "MPModelRelationshipAlbumRepresentativeSong");
    v93[3] = (uint64_t)v64;
    getMPModelRelationshipAlbumRepresentativeSongSymbolLoc_ptr = (uint64_t)v64;
  }
  _Block_object_dispose(&v92, 8);
  if (!v64)
  {
LABEL_61:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v97 = *v64;
  v66 = v97;
  objc_msgSend(a1, "_representativeSongSupportedProperties");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v67;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v96, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v57, "initWithProperties:relationships:", v91, v68);

  return v69;
}

+ (id)_albumSupportedPropertiesForPlayback
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id MPPropertySetClass;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[10];

  v27[9] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyAlbumArtwork();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  getMPModelPropertyAlbumLibraryAdded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v3;
  getMPModelPropertyAlbumLibraryAddEligible();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v4;
  getMPModelPropertyAlbumIsFavorite();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v5;
  getMPModelPropertyAlbumDateFavorited();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v6;
  getMPModelPropertyAlbumTitle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v7;
  getMPModelPropertyAlbumTrackCount();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v8;
  getMPModelPropertyAlbumTraits();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  getMPModelPropertyAlbumYear();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v2, "initWithArray:", v11);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertyAlbumIsDisliked();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

  }
  v14 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipAlbumArtist();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v15;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyArtistName();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v14, "initWithProperties:relationships:", v12, v20);

  return v21;
}

+ (id)_artistSupportedProperties
{
  id v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyArtistName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v4 = (id *)getMPModelPropertyArtistArtworkSymbolLoc_ptr;
  v23 = getMPModelPropertyArtistArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyArtistArtworkSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyArtistArtwork");
    v21[3] = (uint64_t)v4;
    getMPModelPropertyArtistArtworkSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v20, 8);
  if (!v4)
    goto LABEL_10;
  v6 = *v4;
  v24[1] = v6;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = (id *)getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr;
  v23 = getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr;
  if (!getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyArtistClassicalExperienceAvailable");
    v21[3] = (uint64_t)v7;
    getMPModelPropertyArtistClassicalExperienceAvailableSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
LABEL_10:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v25 = *v7;
  v9 = v25;
  getMPModelPropertyArtistSongCount();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  getMPModelPropertyArtistAlbumCount();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  getMPModelPropertyArtistLibraryAddedDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  getMPModelPropertyArtistIsFavorite();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  getMPModelPropertyArtistDateFavorited();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v2, "initWithArray:", v15);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertyArtistIsDisliked();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  v18 = (void *)objc_msgSend(objc_alloc((Class)getMPPropertySetClass()), "initWithProperties:relationships:", v16, MEMORY[0x24BDBD1B8]);

  return v18;
}

+ (id)_curatorSupportedProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyCuratorHandle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  getMPModelPropertyCuratorKind();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  getMPModelPropertyCuratorSubKind();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  getMPModelPropertyCuratorName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v7, MEMORY[0x24BDBD1B8]);

  return v8;
}

+ (id)_composerSupportedProperties
{
  id v2;
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyComposerName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = (id *)getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr;
  v14 = getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyComposerLibraryAddedDate");
    v12[3] = (uint64_t)v4;
    getMPModelPropertyComposerLibraryAddedDateSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v16 = *v4;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = v16;
  objc_msgSend(v6, "arrayWithObjects:count:", &v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v8, MEMORY[0x24BDBD1B8]);
  return v9;
}

+ (id)_genreSupportedProperties
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v3 = (id *)getMPModelPropertyGenreNameSymbolLoc_ptr;
  v16 = getMPModelPropertyGenreNameSymbolLoc_ptr;
  if (!getMPModelPropertyGenreNameSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertyGenreName");
    v14[3] = (uint64_t)v3;
    getMPModelPropertyGenreNameSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v13, 8);
  if (!v3)
    goto LABEL_8;
  v5 = *v3;
  v17 = v5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = (id *)getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr;
  v16 = getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyGenreLibraryAddedDate");
    v14[3] = (uint64_t)v6;
    getMPModelPropertyGenreLibraryAddedDateSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
LABEL_8:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v18 = *v6;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = v18;
  objc_msgSend(v8, "arrayWithObjects:count:", &v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v10, MEMORY[0x24BDBD1B8]);
  return v11;
}

+ (id)_localFileAssetSupportedProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyFileAssetNonPurgeable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  getMPModelPropertyFileAssetProtectionType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  getMPModelPropertyFileAssetTraits();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v6, MEMORY[0x24BDBD1B8], v9, v10);

  return v7;
}

+ (id)_lyricsSupportedProperties
{
  id MPPropertySetClass;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyLyricsHasLibraryLyrics();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  getMPModelPropertyLyricsHasStoreLyrics();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  getMPModelPropertyLyricsHasTimeSyncedLyrics();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v6 = (id *)getMPModelPropertyLyricsTextSymbolLoc_ptr;
  v16 = getMPModelPropertyLyricsTextSymbolLoc_ptr;
  if (!getMPModelPropertyLyricsTextSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyLyricsText");
    v14[3] = (uint64_t)v6;
    getMPModelPropertyLyricsTextSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v13, 8);
  if (!v6)
  {
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v18 = *v6;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = v18;
  objc_msgSend(v8, "arrayWithObjects:count:", v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_movieSupportedProperties
{
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  void *v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  id *v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  id v61;
  _QWORD v62[3];
  _QWORD v63[18];

  v63[16] = *MEMORY[0x24BDAC8D0];
  v50 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyMovieArtwork();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v55;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v3 = (id *)getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertyMovieDownloadedDate");
    v57[3] = (uint64_t)v3;
    getMPModelPropertyMovieDownloadedDateSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v56, 8);
  if (!v3)
    goto LABEL_41;
  v49 = *v3;
  v63[1] = v49;
  getMPModelPropertyMovieDuration();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v54;
  getMPModelPropertyMovieHasCloudSyncSource();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v63[3] = v53;
  getMPModelPropertyMovieLibraryAdded();
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v63[4] = v52;
  getMPModelPropertyMovieLibraryAddEligible();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v63[5] = v51;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v5 = (id *)getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlayerLibrary_6();
    v5 = (id *)dlsym(v6, "MPModelPropertyMovieKeepLocalEnableState");
    v57[3] = (uint64_t)v5;
    getMPModelPropertyMovieKeepLocalEnableStateSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v56, 8);
  if (!v5)
    goto LABEL_41;
  v48 = *v5;
  v63[6] = v48;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v7 = (id *)getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyMovieKeepLocalManagedStatus");
    v57[3] = (uint64_t)v7;
    getMPModelPropertyMovieKeepLocalManagedStatusSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v56, 8);
  if (!v7)
    goto LABEL_41;
  v47 = *v7;
  v63[7] = v47;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v9 = (id *)getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_6();
    v9 = (id *)dlsym(v10, "MPModelPropertyMovieKeepLocalManagedStatusReason");
    v57[3] = (uint64_t)v9;
    getMPModelPropertyMovieKeepLocalManagedStatusReasonSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v56, 8);
  if (!v9)
    goto LABEL_41;
  v46 = *v9;
  v63[8] = v46;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v11 = (id *)getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v12 = (void *)MediaPlayerLibrary_6();
    v11 = (id *)dlsym(v12, "MPModelPropertyMovieLastDevicePlaybackDate");
    v57[3] = (uint64_t)v11;
    getMPModelPropertyMovieLastDevicePlaybackDateSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v56, 8);
  if (!v11)
    goto LABEL_41;
  v45 = *v11;
  v63[9] = v45;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v13 = (id *)getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr)
  {
    v14 = (void *)MediaPlayerLibrary_6();
    v13 = (id *)dlsym(v14, "MPModelPropertyMovieLibraryAddedDate");
    v57[3] = (uint64_t)v13;
    getMPModelPropertyMovieLibraryAddedDateSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v56, 8);
  if (!v13)
    goto LABEL_41;
  v44 = *v13;
  v63[10] = v44;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v15 = (id *)getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr;
  v59 = getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr;
  if (!getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v15 = (id *)dlsym(v16, "MPModelPropertyMovieInfoDictionary");
    v57[3] = (uint64_t)v15;
    getMPModelPropertyMovieInfoDictionarySymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v56, 8);
  if (!v15)
    goto LABEL_41;
  v43 = *v15;
  v63[11] = v43;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v17 = (id *)getMPModelPropertyMovieReleaseDateSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieReleaseDateSymbolLoc_ptr;
  if (!getMPModelPropertyMovieReleaseDateSymbolLoc_ptr)
  {
    v18 = (void *)MediaPlayerLibrary_6();
    v17 = (id *)dlsym(v18, "MPModelPropertyMovieReleaseDate");
    v57[3] = (uint64_t)v17;
    getMPModelPropertyMovieReleaseDateSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v56, 8);
  if (!v17)
    goto LABEL_41;
  v42 = *v17;
  v63[12] = v42;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v19 = (id *)getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr)
  {
    v20 = (void *)MediaPlayerLibrary_6();
    v19 = (id *)dlsym(v20, "MPModelPropertyMovieDescriptionText");
    v57[3] = (uint64_t)v19;
    getMPModelPropertyMovieDescriptionTextSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v56, 8);
  if (!v19)
    goto LABEL_41;
  v41 = *v19;
  v63[13] = v41;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v21 = (id *)getMPModelPropertyMovieTaglineSymbolLoc_ptr;
  v59 = getMPModelPropertyMovieTaglineSymbolLoc_ptr;
  if (!getMPModelPropertyMovieTaglineSymbolLoc_ptr)
  {
    v22 = (void *)MediaPlayerLibrary_6();
    v21 = (id *)dlsym(v22, "MPModelPropertyMovieTagline");
    v57[3] = (uint64_t)v21;
    getMPModelPropertyMovieTaglineSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v56, 8);
  if (!v21)
    goto LABEL_41;
  v40 = *v21;
  v63[14] = v40;
  getMPModelPropertyMovieTitle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63[15] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v25 = (id *)getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr;
  v59 = getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr;
  if (!getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr)
  {
    v26 = (void *)MediaPlayerLibrary_6();
    v25 = (id *)dlsym(v26, "MPModelRelationshipMoviePlaybackPosition");
    v57[3] = (uint64_t)v25;
    getMPModelRelationshipMoviePlaybackPositionSymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v56, 8);
  if (!v25)
    goto LABEL_41;
  v27 = *v25;
  v60[0] = v27;
  objc_msgSend(a1, "_playbackPositionSupportedProperties");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v28;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v29 = (id *)getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr;
  v59 = getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v29 = (id *)dlsym(v30, "MPModelRelationshipMovieLocalFileAsset");
    v57[3] = (uint64_t)v29;
    getMPModelRelationshipMovieLocalFileAssetSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v56, 8);
  if (!v29)
    goto LABEL_41;
  v31 = *v29;
  v60[1] = v31;
  objc_msgSend(a1, "_localFileAssetSupportedProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v32;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v33 = (id *)getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr;
  v59 = getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr)
  {
    v34 = (void *)MediaPlayerLibrary_6();
    v33 = (id *)dlsym(v34, "MPModelRelationshipMovieStoreAsset");
    v57[3] = (uint64_t)v33;
    getMPModelRelationshipMovieStoreAssetSymbolLoc_ptr = (uint64_t)v33;
  }
  _Block_object_dispose(&v56, 8);
  if (!v33)
  {
LABEL_41:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v61 = *v33;
  v35 = v61;
  objc_msgSend(a1, "_storeAssetSupportedProperties");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v60, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v50, "initWithProperties:relationships:", v24, v37);

  return v38;
}

+ (id)_movieSupportedPropertiesForPlayback
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyMovieArtwork();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  getMPModelPropertyMovieDuration();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  getMPModelPropertyMovieHasCloudSyncSource();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  getMPModelPropertyMovieLibraryAdded();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  getMPModelPropertyMovieLibraryAddEligible();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  getMPModelPropertyMovieTitle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v9, MEMORY[0x24BDBD1B8]);

  return v10;
}

+ (id)_playlistSupportedPropertiesForPlayback
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertyPlaylistArtwork();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  getMPModelPropertyPlaylistName();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  getMPModelPropertyPlaylistType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v5;
  getMPModelPropertyPlaylistLibraryAdded();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  getMPModelPropertyPlaylistTraits();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  getMPModelPropertyPlaylistIsFavorite();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  getMPModelPropertyPlaylistDateFavorited();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v2, "initWithArray:", v10, v15, v16, v17, v18, v19, v20);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertyPlaylistIsDisliked();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
  v13 = (void *)objc_msgSend(objc_alloc((Class)getMPPropertySetClass()), "initWithProperties:relationships:", v11, MEMORY[0x24BDBD1B8]);

  return v13;
}

+ (id)_playlistAuthorSupportedProperties
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v4 = (id *)getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr;
  v21 = getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyPlaylistAuthorIsPendingApproval");
    v19[3] = (uint64_t)v4;
    getMPModelPropertyPlaylistAuthorIsPendingApprovalSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v18, 8);
  if (!v4)
    goto LABEL_11;
  v6 = *v4;
  v24[0] = v6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = (id *)getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr;
  v21 = getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyPlaylistAuthorRole");
    v19[3] = (uint64_t)v7;
    getMPModelPropertyPlaylistAuthorRoleSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v18, 8);
  if (!v7)
    goto LABEL_11;
  v9 = *v7;
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v11 = (id *)getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr;
  v21 = getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr)
  {
    v12 = (void *)MediaPlayerLibrary_6();
    v11 = (id *)dlsym(v12, "MPModelRelationshipPlaylistAuthorSocialProfile");
    v19[3] = (uint64_t)v11;
    getMPModelRelationshipPlaylistAuthorSocialProfileSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_11:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v22 = *v11;
  v13 = v22;
  objc_msgSend(a1, "_socialPersonSupportedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", v10, v15);

  return v16;
}

+ (id)_playlistEntrySupportedProperties
{
  id v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  id v30;
  _QWORD v31[4];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v4 = (id *)getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyPlaylistEntryPosition");
    v26[3] = (uint64_t)v4;
    getMPModelPropertyPlaylistEntryPositionSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v25, 8);
  if (!v4)
    goto LABEL_11;
  v23 = *v4;
  v32[0] = v23;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v6 = (id *)getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyPlaylistEntryUniversalIdentifier");
    v26[3] = (uint64_t)v6;
    getMPModelPropertyPlaylistEntryUniversalIdentifierSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v25, 8);
  if (!v6)
    goto LABEL_11;
  v22 = v3;
  v21 = *v6;
  v32[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelRelationshipPlaylistEntrySong();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v8;
  objc_msgSend(a1, "_songSupportedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v9;
  getMPModelRelationshipPlaylistEntryMovie();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(a1, "_movieSupportedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  getMPModelRelationshipPlaylistEntryTVEpisode();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v12;
  objc_msgSend(a1, "_tvEpisodeSupportedProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v13;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v14 = (id *)getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr;
  v28 = getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr)
  {
    v15 = (void *)MediaPlayerLibrary_6();
    v14 = (id *)dlsym(v15, "MPModelRelationshipPlaylistEntrySocialContributor");
    v26[3] = (uint64_t)v14;
    getMPModelRelationshipPlaylistEntrySocialContributorSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v25, 8);
  if (!v14)
  {
LABEL_11:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v30 = *v14;
  v16 = v30;
  objc_msgSend(a1, "_socialPersonSupportedProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v29, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v22, "initWithProperties:relationships:", v24, v18);

  return v19;
}

+ (id)_playlistEntrySupportedPropertiesForPlayback
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipPlaylistEntrySong();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(a1, "_songSupportedPropertiesForPlayback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  getMPModelRelationshipPlaylistEntryMovie();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(a1, "_movieSupportedPropertiesForPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  getMPModelRelationshipPlaylistEntryTVEpisode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(a1, "_tvEpisodeSupportedPropertiesForPlayback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v10);

  return v11;
}

+ (id)_playlistEntryReactionSupportedProperties
{
  id v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v4 = (id *)getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr;
  v21 = getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyPlaylistEntryReactionText");
    v19[3] = (uint64_t)v4;
    getMPModelPropertyPlaylistEntryReactionTextSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v18, 8);
  if (!v4)
    goto LABEL_11;
  v6 = *v4;
  v24[0] = v6;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v7 = (id *)getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr;
  v21 = getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr;
  if (!getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyPlaylistEntryReactionDate");
    v19[3] = (uint64_t)v7;
    getMPModelPropertyPlaylistEntryReactionDateSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v18, 8);
  if (!v7)
    goto LABEL_11;
  v9 = *v7;
  v24[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v11 = (id *)getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr;
  v21 = getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr;
  if (!getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr)
  {
    v12 = (void *)MediaPlayerLibrary_6();
    v11 = (id *)dlsym(v12, "MPModelRelationshipPlaylistEntryReactionSocialProfile");
    v19[3] = (uint64_t)v11;
    getMPModelRelationshipPlaylistEntryReactionSocialProfileSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v18, 8);
  if (!v11)
  {
LABEL_11:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v22 = *v11;
  v13 = v22;
  objc_msgSend(a1, "_socialPersonSupportedProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", v10, v15);

  return v16;
}

+ (id)_playbackPositionSupportedProperties
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v3 = (id *)getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertyPlaybackPositionBookmarkTime");
    v26[3] = (uint64_t)v3;
    getMPModelPropertyPlaybackPositionBookmarkTimeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v25, 8);
  if (!v3)
    goto LABEL_20;
  v5 = *v3;
  v29[0] = v5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v6 = (id *)getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyPlaybackPositionShouldRememberBookmarkTime");
    v26[3] = (uint64_t)v6;
    getMPModelPropertyPlaybackPositionShouldRememberBookmarkTimeSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v25, 8);
  if (!v6)
    goto LABEL_20;
  v8 = *v6;
  v29[1] = v8;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v9 = (id *)getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_6();
    v9 = (id *)dlsym(v10, "MPModelPropertyPlaybackPositionHasBeenPlayed");
    v26[3] = (uint64_t)v9;
    getMPModelPropertyPlaybackPositionHasBeenPlayedSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v25, 8);
  if (!v9)
    goto LABEL_20;
  v11 = *v9;
  v29[2] = v11;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v12 = (id *)getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertyPlaybackPositionUserPlayCount");
    v26[3] = (uint64_t)v12;
    getMPModelPropertyPlaybackPositionUserPlayCountSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v25, 8);
  if (!v12)
    goto LABEL_20;
  v14 = *v12;
  v29[3] = v14;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v15 = (id *)getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v15 = (id *)dlsym(v16, "MPModelPropertyPlaybackPositionStartTime");
    v26[3] = (uint64_t)v15;
    getMPModelPropertyPlaybackPositionStartTimeSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v25, 8);
  if (!v15)
    goto LABEL_20;
  v17 = *v15;
  v29[4] = v17;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v18 = (id *)getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr;
  v28 = getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr;
  if (!getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertyPlaybackPositionStopTime");
    v26[3] = (uint64_t)v18;
    getMPModelPropertyPlaybackPositionStopTimeSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v25, 8);
  if (!v18)
  {
LABEL_20:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v30 = *v18;
  v20 = (void *)MEMORY[0x24BDBCE30];
  v21 = v30;
  objc_msgSend(v20, "arrayWithObjects:count:", v29, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v22, MEMORY[0x24BDBD1B8]);
  return v23;
}

+ (id)_radioStationSupportedPropertiesForPlayback
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[7];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v3 = (id *)getMPModelPropertyRadioStationNameSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationNameSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationNameSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertyRadioStationName");
    v32[3] = (uint64_t)v3;
    getMPModelPropertyRadioStationNameSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v31, 8);
  if (!v3)
    goto LABEL_26;
  v5 = *v3;
  v35[0] = v5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v6 = (id *)getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyRadioStationAttributionLabel");
    v32[3] = (uint64_t)v6;
    getMPModelPropertyRadioStationAttributionLabelSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v31, 8);
  if (!v6)
    goto LABEL_26;
  v8 = *v6;
  v35[1] = v8;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v9 = (id *)getMPModelPropertyRadioStationTypeSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationTypeSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationTypeSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_6();
    v9 = (id *)dlsym(v10, "MPModelPropertyRadioStationType");
    v32[3] = (uint64_t)v9;
    getMPModelPropertyRadioStationTypeSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v31, 8);
  if (!v9)
    goto LABEL_26;
  v11 = *v9;
  v35[2] = v11;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v12 = (id *)getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertyRadioStationSubtype");
    v32[3] = (uint64_t)v12;
    getMPModelPropertyRadioStationSubtypeSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v31, 8);
  if (!v12)
    goto LABEL_26;
  v14 = *v12;
  v35[3] = v14;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v15 = (id *)getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v15 = (id *)dlsym(v16, "MPModelPropertyRadioStationProviderUniversalLink");
    v32[3] = (uint64_t)v15;
    getMPModelPropertyRadioStationProviderUniversalLinkSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v31, 8);
  if (!v15)
    goto LABEL_26;
  v17 = *v15;
  v35[4] = v17;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v18 = (id *)getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertyRadioStationProviderBundleIdentifier");
    v32[3] = (uint64_t)v18;
    getMPModelPropertyRadioStationProviderBundleIdentifierSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v31, 8);
  if (!v18)
    goto LABEL_26;
  v20 = *v18;
  v35[5] = v20;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v21 = (id *)getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr)
  {
    v22 = (void *)MediaPlayerLibrary_6();
    v21 = (id *)dlsym(v22, "MPModelPropertyRadioStationProviderID");
    v32[3] = (uint64_t)v21;
    getMPModelPropertyRadioStationProviderIDSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v31, 8);
  if (!v21)
    goto LABEL_26;
  v23 = *v21;
  v35[6] = v23;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v24 = (id *)getMPModelPropertyRadioStationArtworkSymbolLoc_ptr;
  v34 = getMPModelPropertyRadioStationArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyRadioStationArtworkSymbolLoc_ptr)
  {
    v25 = (void *)MediaPlayerLibrary_6();
    v24 = (id *)dlsym(v25, "MPModelPropertyRadioStationArtwork");
    v32[3] = (uint64_t)v24;
    getMPModelPropertyRadioStationArtworkSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(&v31, 8);
  if (!v24)
  {
LABEL_26:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v36 = *v24;
  v26 = (void *)MEMORY[0x24BDBCE30];
  v27 = v36;
  objc_msgSend(v26, "arrayWithObjects:count:", v35, 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v28, MEMORY[0x24BDBD1B8]);
  return v29;
}

+ (id)_recentlyAddedObjectSupportedProperties
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipGenericAlbum();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  objc_msgSend(a1, "_albumSupportedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  getMPModelRelationshipGenericMovie();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(a1, "_movieSupportedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  getMPModelRelationshipGenericPlaylist();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  objc_msgSend(a1, "_playlistSupportedProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  getMPModelRelationshipGenericTVSeason();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(a1, "_tvSeasonSupportedProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v12);

  return v13;
}

+ (id)_representativeSongSupportedProperties
{
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
  void *v12;
  id MPPropertySetClass;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
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
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  _QWORD v57[3];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[21];

  v60[19] = *MEMORY[0x24BDAC8D0];
  v52 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertySongArtistUploadedContent();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v50;
  getMPModelPropertySongArtwork();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v48;
  getMPModelPropertySongCloudStatus();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v46;
  getMPModelPropertySongDuration();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v44;
  getMPModelPropertySongExplicit();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v60[4] = v42;
  getMPModelPropertySongHasVideo();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v60[5] = v40;
  getMPModelPropertySongIsFavorite();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v60[6] = v38;
  getMPModelPropertySongDateFavorited();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v60[7] = v36;
  getMPModelPropertySongKeepLocalEnableState();
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v60[8] = v33;
  getMPModelPropertySongKeepLocalManagedStatus();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v60[9] = v31;
  getMPModelPropertySongKeepLocalManagedStatusReason();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v60[10] = v2;
  getMPModelPropertySongLibraryAdded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60[11] = v3;
  getMPModelPropertySongLibraryAddEligible();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v60[12] = v4;
  getMPModelPropertySongShouldShowComposer();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60[13] = v5;
  getMPModelPropertySongTitle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v60[14] = v6;
  get_MPModelPropertySongTrackCount();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60[15] = v7;
  getMPModelPropertySongTrackNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60[16] = v8;
  getMPModelPropertySongTraits();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v60[17] = v9;
  getMPModelPropertySongUserRating();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60[18] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "initWithArray:", v11);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertySongIsDisliked();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObject:", v12);

  }
  v34 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipSongLocalFileAsset();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v51;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyFileAssetNonPurgeable();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v49;
  getMPModelPropertyFileAssetProtectionType();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v47;
  getMPModelPropertyFileAssetTraits();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v57[2] = v45;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v41;
  getMPModelRelationshipSongStoreAsset();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v39;
  v14 = getMPPropertySetClass();
  getMPModelPropertyStoreAssetRedownloadable();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v37;
  getMPModelPropertyStoreAssetSubscriptionRequired();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v32;
  getMPModelPropertyStoreAssetNeedsUserUpload();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v30;
  getMPModelPropertyStoreAssetEndpointType();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertySetWithProperties:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v27;
  getMPModelRelationshipSongHomeSharingAsset();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v15;
  v16 = getMPPropertySetClass();
  getMPModelPropertyHomeSharingAssetAvailable();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "propertySetWithProperties:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v19;
  getMPModelRelationshipSongArtist();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v20;
  v21 = getMPPropertySetClass();
  getMPModelPropertyArtistName();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "propertySetWithProperties:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v34, "initWithProperties:relationships:", v53, v25);

  return v35;
}

+ (id)_socialPersonSupportedProperties
{
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v3 = (id *)getMPModelPropertySocialPersonArtworkSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonArtworkSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonArtworkSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertySocialPersonArtwork");
    v26[3] = (uint64_t)v3;
    getMPModelPropertySocialPersonArtworkSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v25, 8);
  if (!v3)
    goto LABEL_20;
  v5 = *v3;
  v29[0] = v5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v6 = (id *)getMPModelPropertySocialPersonHandleSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonHandleSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonHandleSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertySocialPersonHandle");
    v26[3] = (uint64_t)v6;
    getMPModelPropertySocialPersonHandleSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v25, 8);
  if (!v6)
    goto LABEL_20;
  v8 = *v6;
  v29[1] = v8;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v9 = (id *)getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_6();
    v9 = (id *)dlsym(v10, "MPModelPropertySocialPersonHasLightweightProfile");
    v26[3] = (uint64_t)v9;
    getMPModelPropertySocialPersonHasLightweightProfileSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v25, 8);
  if (!v9)
    goto LABEL_20;
  v11 = *v9;
  v29[2] = v11;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v12 = (id *)getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr)
  {
    v13 = (void *)MediaPlayerLibrary_6();
    v12 = (id *)dlsym(v13, "MPModelPropertySocialPersonIsPrivate");
    v26[3] = (uint64_t)v12;
    getMPModelPropertySocialPersonIsPrivateSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v25, 8);
  if (!v12)
    goto LABEL_20;
  v14 = *v12;
  v29[3] = v14;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v15 = (id *)getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v15 = (id *)dlsym(v16, "MPModelPropertySocialPersonIsVerified");
    v26[3] = (uint64_t)v15;
    getMPModelPropertySocialPersonIsVerifiedSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v25, 8);
  if (!v15)
    goto LABEL_20;
  v17 = *v15;
  v29[4] = v17;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v18 = (id *)getMPModelPropertySocialPersonNameSymbolLoc_ptr;
  v28 = getMPModelPropertySocialPersonNameSymbolLoc_ptr;
  if (!getMPModelPropertySocialPersonNameSymbolLoc_ptr)
  {
    v19 = (void *)MediaPlayerLibrary_6();
    v18 = (id *)dlsym(v19, "MPModelPropertySocialPersonName");
    v26[3] = (uint64_t)v18;
    getMPModelPropertySocialPersonNameSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v25, 8);
  if (!v18)
  {
LABEL_20:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v30 = *v18;
  v20 = (void *)MEMORY[0x24BDBCE30];
  v21 = v30;
  objc_msgSend(v20, "arrayWithObjects:count:", v29, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v22, MEMORY[0x24BDBD1B8]);
  return v23;
}

+ (id)_songSupportedPropertiesForPlayback
{
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
  void *v12;
  id MPPropertySetClass;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  id v29;
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
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  void *v44;
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[18];

  v47[16] = *MEMORY[0x24BDAC8D0];
  v40 = objc_alloc(MEMORY[0x24BDBCEB8]);
  getMPModelPropertySongArtistUploadedContent();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v38;
  getMPModelPropertySongArtwork();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v36;
  getMPModelPropertySongCloudStatus();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v34;
  getMPModelPropertySongDuration();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v32;
  getMPModelPropertySongExplicit();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v30;
  getMPModelPropertySongHasVideo();
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v47[5] = v27;
  getMPModelPropertySongIsFavorite();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v26;
  getMPModelPropertySongDateFavorited();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v2;
  getMPModelPropertySongLibraryAdded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v3;
  getMPModelPropertySongLibraryAddEligible();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v4;
  getMPModelPropertySongShouldShowComposer();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v5;
  getMPModelPropertySongTitle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v6;
  get_MPModelPropertySongTrackCount();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v7;
  getMPModelPropertySongTrackNumber();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v8;
  getMPModelPropertySongTraits();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v9;
  getMPModelPropertySongUserRating();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "initWithArray:", v11);

  if (_os_feature_enabled_impl())
  {
    getMPModelPropertySongIsDisliked();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v12);

  }
  v28 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelRelationshipSongComposer();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v39;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyComposerName();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v33;
  getMPModelRelationshipSongAlbum();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v31;
  v14 = getMPPropertySetClass();
  getMPModelPropertyAlbumTitle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v15;
  getMPModelPropertyAlbumYear();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertySetWithProperties:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v18;
  getMPModelRelationshipSongArtist();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v19;
  v20 = getMPPropertySetClass();
  getMPModelPropertyArtistName();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "propertySetWithProperties:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v28, "initWithProperties:relationships:", v41, v24);

  return v29;
}

+ (id)_storeAssetSupportedProperties
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyStoreAssetRedownloadable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  getMPModelPropertyStoreAssetSubscriptionRequired();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  getMPModelPropertyStoreAssetNeedsUserUpload();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  getMPModelPropertyStoreAssetEndpointType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v7, MEMORY[0x24BDBD1B8]);

  return v8;
}

+ (id)_tvEpisodeSupportedProperties
{
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  id *v7;
  void *v8;
  id *v9;
  void *v10;
  id *v11;
  void *v12;
  id *v13;
  void *v14;
  id *v15;
  void *v16;
  id *v17;
  void *v18;
  id *v19;
  void *v20;
  id *v21;
  void *v22;
  id *v23;
  void *v24;
  id *v25;
  void *v26;
  id *v27;
  void *v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  id MPPropertySetClass;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
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
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  _QWORD v79[3];
  id v80;
  void *v81;
  _QWORD v82[5];
  _QWORD v83[21];

  v83[19] = *MEMORY[0x24BDAC8D0];
  v60 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyTVEpisodeArtwork();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v72;
  getMPModelPropertyTVEpisodeDuration();
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v71;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v3 = (id *)getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr)
  {
    v4 = (void *)MediaPlayerLibrary_6();
    v3 = (id *)dlsym(v4, "MPModelPropertyTVEpisodeTypeDisplayName");
    v74[3] = (uint64_t)v3;
    getMPModelPropertyTVEpisodeTypeDisplayNameSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v73, 8);
  if (!v3)
    goto LABEL_47;
  v59 = *v3;
  v83[2] = v59;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v5 = (id *)getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr)
  {
    v6 = (void *)MediaPlayerLibrary_6();
    v5 = (id *)dlsym(v6, "MPModelPropertyTVEpisodeDownloadedDate");
    v74[3] = (uint64_t)v5;
    getMPModelPropertyTVEpisodeDownloadedDateSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v73, 8);
  if (!v5)
    goto LABEL_47;
  v58 = *v5;
  v83[3] = v58;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v7 = (id *)getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyTVEpisodeExplicitRating");
    v74[3] = (uint64_t)v7;
    getMPModelPropertyTVEpisodeExplicitRatingSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v73, 8);
  if (!v7)
    goto LABEL_47;
  v57 = *v7;
  v83[4] = v57;
  getMPModelPropertyTVEpisodeHasCloudSyncSource();
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v83[5] = v70;
  getMPModelPropertyTVEpisodeLibraryAdded();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v83[6] = v69;
  getMPModelPropertyTVEpisodeLibraryAddEligible();
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v83[7] = v68;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v9 = (id *)getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr)
  {
    v10 = (void *)MediaPlayerLibrary_6();
    v9 = (id *)dlsym(v10, "MPModelPropertyTVEpisodeMusicShow");
    v74[3] = (uint64_t)v9;
    getMPModelPropertyTVEpisodeMusicShowSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v73, 8);
  if (!v9)
    goto LABEL_47;
  v56 = *v9;
  v83[8] = v56;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v11 = (id *)getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr)
  {
    v12 = (void *)MediaPlayerLibrary_6();
    v11 = (id *)dlsym(v12, "MPModelPropertyTVEpisodeKeepLocalEnableState");
    v74[3] = (uint64_t)v11;
    getMPModelPropertyTVEpisodeKeepLocalEnableStateSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v73, 8);
  if (!v11)
    goto LABEL_47;
  v55 = *v11;
  v83[9] = v55;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v13 = (id *)getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr)
  {
    v14 = (void *)MediaPlayerLibrary_6();
    v13 = (id *)dlsym(v14, "MPModelPropertyTVEpisodeKeepLocalManagedStatus");
    v74[3] = (uint64_t)v13;
    getMPModelPropertyTVEpisodeKeepLocalManagedStatusSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v73, 8);
  if (!v13)
    goto LABEL_47;
  v54 = *v13;
  v83[10] = v54;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v15 = (id *)getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr)
  {
    v16 = (void *)MediaPlayerLibrary_6();
    v15 = (id *)dlsym(v16, "MPModelPropertyTVEpisodeKeepLocalManagedStatusReason");
    v74[3] = (uint64_t)v15;
    getMPModelPropertyTVEpisodeKeepLocalManagedStatusReasonSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v73, 8);
  if (!v15)
    goto LABEL_47;
  v53 = *v15;
  v83[11] = v53;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v17 = (id *)getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr)
  {
    v18 = (void *)MediaPlayerLibrary_6();
    v17 = (id *)dlsym(v18, "MPModelPropertyTVEpisodeLastDevicePlaybackDate");
    v74[3] = (uint64_t)v17;
    getMPModelPropertyTVEpisodeLastDevicePlaybackDateSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v73, 8);
  if (!v17)
    goto LABEL_47;
  v52 = *v17;
  v83[12] = v52;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v19 = (id *)getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr)
  {
    v20 = (void *)MediaPlayerLibrary_6();
    v19 = (id *)dlsym(v20, "MPModelPropertyTVEpisodeLibraryAddedDate");
    v74[3] = (uint64_t)v19;
    getMPModelPropertyTVEpisodeLibraryAddedDateSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v73, 8);
  if (!v19)
    goto LABEL_47;
  v51 = *v19;
  v83[13] = v51;
  getMPModelPropertyTVEpisodeNumber();
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v83[14] = v67;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v21 = (id *)getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr)
  {
    v22 = (void *)MediaPlayerLibrary_6();
    v21 = (id *)dlsym(v22, "MPModelPropertyTVEpisodeReleaseDate");
    v74[3] = (uint64_t)v21;
    getMPModelPropertyTVEpisodeReleaseDateSymbolLoc_ptr = (uint64_t)v21;
  }
  _Block_object_dispose(&v73, 8);
  if (!v21)
    goto LABEL_47;
  v50 = *v21;
  v83[15] = v50;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v23 = (id *)getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr;
  v76 = getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr)
  {
    v24 = (void *)MediaPlayerLibrary_6();
    v23 = (id *)dlsym(v24, "MPModelPropertyTVEpisodeDescriptionText");
    v74[3] = (uint64_t)v23;
    getMPModelPropertyTVEpisodeDescriptionTextSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v73, 8);
  if (!v23)
    goto LABEL_47;
  v49 = *v23;
  v83[16] = v49;
  getMPModelPropertyTVEpisodeTitle();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v83[17] = v66;
  getMPModelPropertyTVEpisodeType();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v83[18] = v65;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v83, 19);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v25 = (id *)getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr;
  v76 = getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr)
  {
    v26 = (void *)MediaPlayerLibrary_6();
    v25 = (id *)dlsym(v26, "MPModelRelationshipTVEpisodePlaybackPosition");
    v74[3] = (uint64_t)v25;
    getMPModelRelationshipTVEpisodePlaybackPositionSymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v73, 8);
  if (!v25)
    goto LABEL_47;
  v48 = *v25;
  v79[0] = v48;
  objc_msgSend(a1, "_playbackPositionSupportedProperties");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v64;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v27 = (id *)getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr;
  v76 = getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr)
  {
    v28 = (void *)MediaPlayerLibrary_6();
    v27 = (id *)dlsym(v28, "MPModelRelationshipTVEpisodeStoreAsset");
    v74[3] = (uint64_t)v27;
    getMPModelRelationshipTVEpisodeStoreAssetSymbolLoc_ptr = (uint64_t)v27;
  }
  _Block_object_dispose(&v73, 8);
  if (!v27)
    goto LABEL_47;
  v47 = *v27;
  v79[1] = v47;
  objc_msgSend(a1, "_storeAssetSupportedProperties");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v63;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v29 = (id *)getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr;
  v76 = getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr)
  {
    v30 = (void *)MediaPlayerLibrary_6();
    v29 = (id *)dlsym(v30, "MPModelRelationshipTVEpisodeLocalFileAsset");
    v74[3] = (uint64_t)v29;
    getMPModelRelationshipTVEpisodeLocalFileAssetSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v73, 8);
  if (!v29)
    goto LABEL_47;
  v31 = *v29;
  v79[2] = v31;
  objc_msgSend(a1, "_localFileAssetSupportedProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v32;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v33 = (id *)getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr;
  v76 = getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr;
  if (!getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr)
  {
    v34 = (void *)MediaPlayerLibrary_6();
    v33 = (id *)dlsym(v34, "MPModelRelationshipTVEpisodeSeason");
    v74[3] = (uint64_t)v33;
    getMPModelRelationshipTVEpisodeSeasonSymbolLoc_ptr = (uint64_t)v33;
  }
  _Block_object_dispose(&v73, 8);
  if (!v33)
  {
LABEL_47:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v80 = *v33;
  v46 = v80;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyTVSeasonNumber();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v36;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v38;
  getMPModelRelationshipTVEpisodeShow();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v39;
  v40 = getMPPropertySetClass();
  getMPModelPropertyTVShowTitle();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "propertySetWithProperties:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v82[4] = v43;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v79, 5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v60, "initWithProperties:relationships:", v62, v44);

  return v61;
}

+ (id)_tvEpisodeSupportedPropertiesForPlayback
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id MPPropertySetClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[9];

  v23[8] = *MEMORY[0x24BDAC8D0];
  v14 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyTVEpisodeArtwork();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  getMPModelPropertyTVEpisodeDuration();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v18;
  getMPModelPropertyTVEpisodeHasCloudSyncSource();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v17;
  getMPModelPropertyTVEpisodeLibraryAdded();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v16;
  getMPModelPropertyTVEpisodeLibraryAddEligible();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v15;
  getMPModelPropertyTVEpisodeNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v2;
  getMPModelPropertyTVEpisodeTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v3;
  getMPModelPropertyTVEpisodeType();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelRelationshipTVEpisodeShow();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyTVShowTitle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithProperties:relationships:", v5, v11);

  return v12;
}

+ (id)_tvSeasonSupportedProperties
{
  id *v2;
  void *v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id MPPropertySetClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[11];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v33 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyTVSeasonArtwork();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v38;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v2 = (id *)getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr)
  {
    v3 = (void *)MediaPlayerLibrary_6();
    v2 = (id *)dlsym(v3, "MPModelPropertyTVSeasonDownloadedDate");
    v40[3] = (uint64_t)v2;
    getMPModelPropertyTVSeasonDownloadedDateSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v39, 8);
  if (!v2)
    goto LABEL_23;
  v32 = *v2;
  v46[1] = v32;
  getMPModelPropertyTVSeasonEpisodesCount();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v37;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v4 = (id *)getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyTVSeasonHasCleanContent");
    v40[3] = (uint64_t)v4;
    getMPModelPropertyTVSeasonHasCleanContentSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v39, 8);
  if (!v4)
    goto LABEL_23;
  v31 = *v4;
  v46[3] = v31;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v6 = (id *)getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr)
  {
    v7 = (void *)MediaPlayerLibrary_6();
    v6 = (id *)dlsym(v7, "MPModelPropertyTVSeasonHasExplicitContent");
    v40[3] = (uint64_t)v6;
    getMPModelPropertyTVSeasonHasExplicitContentSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v39, 8);
  if (!v6)
    goto LABEL_23;
  v30 = *v6;
  v46[4] = v30;
  getMPModelPropertyTVSeasonLibraryAdded();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v36;
  getMPModelPropertyTVSeasonLibraryAddEligible();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v35;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v8 = (id *)getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr)
  {
    v9 = (void *)MediaPlayerLibrary_6();
    v8 = (id *)dlsym(v9, "MPModelPropertyTVSeasonLibraryAddedDate");
    v40[3] = (uint64_t)v8;
    getMPModelPropertyTVSeasonLibraryAddedDateSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v39, 8);
  if (!v8)
    goto LABEL_23;
  v29 = *v8;
  v46[7] = v29;
  getMPModelPropertyTVSeasonNumber();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v34;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v10 = (id *)getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr)
  {
    v11 = (void *)MediaPlayerLibrary_6();
    v10 = (id *)dlsym(v11, "MPModelPropertyTVSeasonSortType");
    v40[3] = (uint64_t)v10;
    getMPModelPropertyTVSeasonSortTypeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v39, 8);
  if (!v10)
    goto LABEL_23;
  v12 = *v10;
  v46[9] = v12;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v13 = (id *)getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr)
  {
    v14 = (void *)MediaPlayerLibrary_6();
    v13 = (id *)dlsym(v14, "MPModelPropertyTVSeasonDescriptionText");
    v40[3] = (uint64_t)v13;
    getMPModelPropertyTVSeasonDescriptionTextSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v39, 8);
  if (!v13)
    goto LABEL_23;
  v15 = *v13;
  v46[10] = v15;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v16 = (id *)getMPModelPropertyTVSeasonYearSymbolLoc_ptr;
  v42 = getMPModelPropertyTVSeasonYearSymbolLoc_ptr;
  if (!getMPModelPropertyTVSeasonYearSymbolLoc_ptr)
  {
    v17 = (void *)MediaPlayerLibrary_6();
    v16 = (id *)dlsym(v17, "MPModelPropertyTVSeasonYear");
    v40[3] = (uint64_t)v16;
    getMPModelPropertyTVSeasonYearSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v39, 8);
  if (!v16)
  {
LABEL_23:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v47 = *v16;
  v18 = (void *)MEMORY[0x24BDBCE30];
  v19 = v47;
  objc_msgSend(v18, "arrayWithObjects:count:", v46, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelRelationshipTVSeasonShow();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v21;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyTVShowTitle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v33, "initWithProperties:relationships:", v20, v26);

  return v27;
}

+ (id)_tvSeasonSupportedPropertiesForPlayback
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id MPPropertySetClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyTVSeasonArtwork();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  getMPModelPropertyTVSeasonEpisodesCount();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v15;
  getMPModelPropertyTVSeasonLibraryAdded();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v3;
  getMPModelPropertyTVSeasonLibraryAddEligible();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  getMPModelPropertyTVSeasonNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getMPModelRelationshipTVSeasonShow();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v7;
  MPPropertySetClass = getMPPropertySetClass();
  getMPModelPropertyTVShowTitle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MPPropertySetClass, "propertySetWithProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v6, v12);

  return v13;
}

+ (id)_tvShowSupportedProperties
{
  id v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc((Class)getMPPropertySetClass());
  getMPModelPropertyTVShowTitle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v4 = (id *)getMPModelPropertyTVShowArtworkSymbolLoc_ptr;
  v17 = getMPModelPropertyTVShowArtworkSymbolLoc_ptr;
  if (!getMPModelPropertyTVShowArtworkSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlayerLibrary_6();
    v4 = (id *)dlsym(v5, "MPModelPropertyTVShowArtwork");
    v15[3] = (uint64_t)v4;
    getMPModelPropertyTVShowArtworkSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v14, 8);
  if (!v4)
    goto LABEL_8;
  v6 = *v4;
  v18[1] = v6;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v7 = (id *)getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr;
  v17 = getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr;
  if (!getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_6();
    v7 = (id *)dlsym(v8, "MPModelPropertyTVShowEpisodeCount");
    v15[3] = (uint64_t)v7;
    getMPModelPropertyTVShowEpisodeCountSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v14, 8);
  if (!v7)
  {
LABEL_8:
    +[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
    __break(1u);
  }
  v19 = *v7;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = v19;
  objc_msgSend(v9, "arrayWithObjects:count:", v18, 3, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v11, MEMORY[0x24BDBD1B8]);
  return v12;
}

@end
