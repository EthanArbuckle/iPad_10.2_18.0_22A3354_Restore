@implementation MPModelLibrarySDKPlaylistEditChangeRequestOperation

- (void)execute
{
  id v3;
  _QWORD v4[5];

  v3 = objc_alloc_init(MEMORY[0x1E0DDBF30]);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__MPModelLibrarySDKPlaylistEditChangeRequestOperation_execute__block_invoke;
  v4[3] = &unk_1E315B1C0;
  v4[4] = self;
  objc_msgSend(v3, "requestCapabilitiesWithCompletionHandler:", v4);

}

- (void)_executeWithCloudLibraryEnabledConfirmed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  MPModelPlaylist *v10;
  MPIdentifierSet *v11;
  void *v12;
  MPIdentifierSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_queue_t v18;
  dispatch_group_t v19;
  void *v20;
  MPMutableSectionedCollection *v21;
  MPCloudControllerItemIDList *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  void *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  MPMutableSectionedCollection *v76;
  int v77;
  void *v78;
  MPModelPlaylist *v79;
  void *v80;
  void *v81;
  void *v83;
  id v84;
  uint64_t v85;
  id *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD block[4];
  id v92;
  MPModelLibrarySDKPlaylistEditChangeRequestOperation *v93;
  id v94;
  MPModelPlaylist *v95;
  uint64_t *v96;
  uint64_t *v97;
  char v98;
  _QWORD v99[4];
  NSObject *v100;
  id v101;
  NSObject *v102;
  _QWORD v103[4];
  NSObject *v104;
  id v105;
  id v106;
  NSObject *v107;
  _QWORD v108[4];
  NSObject *v109;
  id v110;
  id v111;
  NSObject *v112;
  uint8_t buf[8];
  _QWORD v114[4];
  NSObject *v115;
  id v116;
  id v117;
  NSObject *v118;
  _QWORD v119[4];
  NSObject *v120;
  id v121;
  id v122;
  NSObject *v123;
  _QWORD v124[4];
  NSObject *v125;
  id v126;
  id v127;
  NSObject *v128;
  _QWORD v129[4];
  NSObject *v130;
  id v131;
  id v132;
  NSObject *v133;
  _QWORD v134[4];
  NSObject *v135;
  id v136;
  id v137;
  NSObject *v138;
  _QWORD v139[4];
  NSObject *v140;
  id v141;
  id v142;
  NSObject *v143;
  _QWORD v144[4];
  NSObject *v145;
  id v146;
  id v147;
  NSObject *v148;
  _QWORD v149[6];
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  uint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t (*v159)(uint64_t, uint64_t);
  void (*v160)(uint64_t);
  id v161;
  _QWORD v162[4];
  id v163;
  uint64_t *v164;

  -[MPModelLibraryPlaylistEditChangeRequestOperation request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playlist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v4;
  objc_msgSend(v3, "mediaLibrary");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playlistName");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0;
  v86 = (id *)&v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__28901;
  v89 = __Block_byref_object_dispose__28902;
  v90 = 0;
  v84 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v77 = objc_msgSend(v3, "shouldCreatePlaylist");
  if (v77)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "_addPlaylistWithName:externalVendorIdentifier:", v81, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v86[5];
    v86[5] = (id)v7;

    if (v81)
      objc_msgSend(v84, "setObject:forKey:", v81, CFSTR("name"));
    objc_msgSend(v86[5], "valueForProperty:", CFSTR("dateCreated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v84, "setObject:forKey:", v9, CFSTR("dateCreated"));
    if (v6)
      objc_msgSend(v84, "setObject:forKey:", v6, CFSTR("externalVendorIdentifier"));
    if (v86[5])
    {
      v10 = [MPModelPlaylist alloc];
      v11 = [MPIdentifierSet alloc];
      +[MPModelPlaylistKind identityKind](MPModelPlaylistKind, "identityKind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v162[0] = MEMORY[0x1E0C809B0];
      v162[1] = 3221225472;
      v162[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke;
      v162[3] = &unk_1E315B218;
      v163 = v83;
      v164 = &v85;
      v13 = -[MPIdentifierSet initWithSource:modelKind:block:](v11, "initWithSource:modelKind:block:", CFSTR("LibrarySDKPlaylistEdit"), v12, v162);
      v79 = -[MPModelObject initWithIdentifiers:block:](v10, "initWithIdentifiers:block:", v13, &__block_literal_global_104_28947);

    }
    else
    {
      v79 = 0;
    }

    v4 = v78;
  }
  else
  {
    objc_msgSend(v4, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "library");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "persistentID");

    if (v16)
    {
      objc_msgSend(v83, "playlistWithPersistentID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    objc_storeStrong(v86 + 5, v17);
    if (v16)

    v79 = v4;
  }
  if (v86[5])
  {
    v156 = 0;
    v157 = &v156;
    v158 = 0x3032000000;
    v159 = __Block_byref_object_copy__28901;
    v160 = __Block_byref_object_dispose__28902;
    v161 = 0;
    v18 = dispatch_queue_create("com.apple.MediaPlayer.MPModelLibraryPlaylistEditChangeRequestOperation.accessQueue", 0);
    v19 = dispatch_group_create();
    objc_msgSend(v3, "playlistEntries");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPModelLibraryPlaylistEditChangeRequestOperation.mm"), 529, CFSTR("To use the SDK Playlist Edit Change Request, the musicKitPlaylistEntries should be used instead of the playlistEntries property."));

    }
    objc_msgSend(v3, "musicKitPlaylistEntries");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc_init(MPMutableSectionedCollection);
    v150 = 0;
    v151 = &v150;
    v152 = 0x3032000000;
    v153 = __Block_byref_object_copy__28901;
    v154 = __Block_byref_object_dispose__28902;
    v155 = 0;
    v76 = v21;
    -[MPMutableSectionedCollection appendSection:](v21, "appendSection:", &stru_1E3163D10);
    if (v80)
    {
      v22 = objc_alloc_init(MPCloudControllerItemIDList);
      v23 = (void *)v157[5];
      v157[5] = (uint64_t)v22;

      v149[0] = MEMORY[0x1E0C809B0];
      v149[1] = 3221225472;
      v149[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4;
      v149[3] = &unk_1E315B260;
      v149[4] = &v156;
      v149[5] = &v150;
      objc_msgSend(v80, "enumerateItemsUsingBlock:", v149);
    }
    v24 = v81;
    if (v151[5])
    {
      -[MPModelLibraryPlaylistEditChangeRequestOperation completeResponseHandler](self, "completeResponseHandler");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v25 + 16))(v25, v151[5], 0);
      -[MPAsyncOperation finishWithError:](self, "finishWithError:", v151[5]);
LABEL_64:

      _Block_object_dispose(&v150, 8);
      _Block_object_dispose(&v156, 8);

      v4 = v78;
      goto LABEL_65;
    }
    v73 = v81 != 0;
    if (v81)
    {
      dispatch_group_enter(v19);
      v30 = v86[5];
      v144[0] = MEMORY[0x1E0C809B0];
      v144[1] = 3221225472;
      v144[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5;
      v144[3] = &unk_1E31636F0;
      v145 = v18;
      v146 = v84;
      v31 = v81;
      v147 = v31;
      v148 = v19;
      objc_msgSend(v30, "setValue:forProperty:withCompletionBlock:", v31, CFSTR("name"), v144);

    }
    objc_msgSend(v3, "playlistDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      dispatch_group_enter(v19);
      v32 = v86[5];
      v139[0] = MEMORY[0x1E0C809B0];
      v139[1] = 3221225472;
      v139[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7;
      v139[3] = &unk_1E31636F0;
      v140 = v18;
      v141 = v84;
      v33 = v26;
      v142 = v33;
      v143 = v19;
      objc_msgSend(v32, "setValue:forProperty:withCompletionBlock:", v33, CFSTR("descriptionInfo"), v139);

      v73 = 1;
    }
    objc_msgSend(v3, "isPublicPlaylist");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (v75)
    {
      dispatch_group_enter(v19);
      v34 = v86[5];
      v134[0] = MEMORY[0x1E0C809B0];
      v134[1] = 3221225472;
      v134[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9;
      v134[3] = &unk_1E31636F0;
      v135 = v18;
      v136 = v84;
      v35 = v75;
      v137 = v35;
      v138 = v19;
      objc_msgSend(v34, "setValue:forProperty:withCompletionBlock:", v35, CFSTR("cloudIsPublic"), v134);

    }
    objc_msgSend(v3, "isVisiblePlaylist");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      dispatch_group_enter(v19);
      v36 = v86[5];
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_11;
      v129[3] = &unk_1E31636F0;
      v130 = v18;
      v131 = v84;
      v37 = v74;
      v132 = v37;
      v133 = v19;
      objc_msgSend(v36, "setValue:forProperty:withCompletionBlock:", v37, CFSTR("cloudIsVisible"), v129);

    }
    objc_msgSend(v3, "isCuratorPlaylist");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      dispatch_group_enter(v19);
      v38 = v86[5];
      v124[0] = MEMORY[0x1E0C809B0];
      v124[1] = 3221225472;
      v124[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_13;
      v124[3] = &unk_1E31636F0;
      v125 = v18;
      v126 = v84;
      v39 = v72;
      v127 = v39;
      v128 = v19;
      objc_msgSend(v38, "setValue:forProperty:withCompletionBlock:", v39, CFSTR("cloudIsCuratorPlaylist"), v124);

    }
    objc_msgSend(v3, "isOwner");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71)
    {
      dispatch_group_enter(v19);
      v40 = v86[5];
      v119[0] = MEMORY[0x1E0C809B0];
      v119[1] = 3221225472;
      v119[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_15;
      v119[3] = &unk_1E31636F0;
      v120 = v18;
      v121 = v84;
      v41 = v71;
      v122 = v41;
      v123 = v19;
      objc_msgSend(v40, "setValue:forProperty:withCompletionBlock:", v41, CFSTR("iO"), v119);

    }
    objc_msgSend(v3, "authorDisplayName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "length"))
    {
      dispatch_group_enter(v19);
      v43 = v86[5];
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_17;
      v114[3] = &unk_1E31636F0;
      v115 = v18;
      v116 = v84;
      v44 = v42;
      v117 = v44;
      v118 = v19;
      objc_msgSend(v43, "setValue:forProperty:withCompletionBlock:", v44, CFSTR("externalVendorDisplayName"), v114);

      v45 = v115;
    }
    else
    {
      if ((v77 & 1) == 0 && !objc_msgSend(v42, "isEqualToString:", &stru_1E3163D10))
        goto LABEL_61;
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v70 = objc_claimAutoreleasedReturnValue();
      -[NSObject localizedInfoDictionary](v70, "localizedInfoDictionary");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKey:", CFSTR("CFBundleDisplayName"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v47, "length"))
      {
        -[NSObject localizedInfoDictionary](v70, "localizedInfoDictionary");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKey:", CFSTR("CFBundleExecutable"));
        v49 = objc_claimAutoreleasedReturnValue();

        v47 = (void *)v49;
      }
      if (!objc_msgSend(v47, "length"))
      {
        -[NSObject infoDictionary](v70, "infoDictionary");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKey:", CFSTR("CFBundleDisplayName"));
        v51 = objc_claimAutoreleasedReturnValue();

        v47 = (void *)v51;
      }
      -[NSObject infoDictionary](v70, "infoDictionary");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKey:", CFSTR("CFBundleExecutable"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v53, "length"))
      {
        v54 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_193B9B000, v54, OS_LOG_TYPE_ERROR, "Could not resolve default author display name", buf, 2u);
        }

      }
      if (v53)
      {
        dispatch_group_enter(v19);
        v55 = v86[5];
        v108[0] = MEMORY[0x1E0C809B0];
        v108[1] = 3221225472;
        v108[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_116;
        v108[3] = &unk_1E31636F0;
        v109 = v18;
        v110 = v84;
        v56 = v53;
        v111 = v56;
        v112 = v19;
        objc_msgSend(v55, "setValue:forProperty:withCompletionBlock:", v56, CFSTR("externalVendorDisplayName"), v108);

        v57 = v109;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain"), -10004, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPModelLibraryPlaylistEditChangeRequestOperation completeResponseHandler](self, "completeResponseHandler");
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = (void *)v58;
        if (v58)
          (*(void (**)(uint64_t, void *, _QWORD))(v58 + 16))(v58, v57, 0);
        -[MPAsyncOperation finishWithError:](self, "finishWithError:", v57);

      }
      v45 = v70;
    }

LABEL_61:
    if (((v77 | !v73) & 1) == 0)
    {
      dispatch_group_enter(v19);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v86[5];
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_3_118;
      v103[3] = &unk_1E31636F0;
      v104 = v18;
      v105 = v84;
      v106 = v60;
      v107 = v19;
      v62 = v60;
      objc_msgSend(v61, "setValue:forProperty:withCompletionBlock:", v62, CFSTR("dateModified"), v103);

    }
    dispatch_group_enter(v19);
    v63 = v86[5];
    v64 = MEMORY[0x1E0C809B0];
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5_120;
    v99[3] = &unk_1E315B298;
    v100 = v18;
    v65 = v84;
    v101 = v65;
    v66 = v19;
    v102 = v66;
    objc_msgSend(v63, "setValue:forProperty:withCompletionBlock:", MEMORY[0x1E0C9AAB0], CFSTR("isExternalVendorPlaylist"), v99);
    dispatch_get_global_queue(33, 0);
    v67 = objc_claimAutoreleasedReturnValue();
    block[0] = v64;
    block[1] = 3221225472;
    block[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7_122;
    block[3] = &unk_1E315B2E8;
    v68 = v65;
    v98 = v77;
    v92 = v68;
    v93 = self;
    v96 = &v156;
    v97 = &v85;
    v94 = v83;
    v95 = v79;
    dispatch_group_notify(v66, v67, block);

    v24 = v81;
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain"), -10004, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v81;
  -[MPModelLibraryPlaylistEditChangeRequestOperation completeResponseHandler](self, "completeResponseHandler");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v27, 0);
  -[MPAsyncOperation finishWithError:](self, "finishWithError:", v27);

LABEL_65:
  _Block_object_dispose(&v85, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2;
  v5[3] = &unk_1E315B1F0;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v3, v5);

}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personalizedStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cloudID");

  v11 = objc_msgSend(v7, "adamID");
  if (!v11)
  {
    v11 = objc_msgSend(v7, "subscriptionAdamID");
    if (!v11)
      v11 = objc_msgSend(v7, "purchasedAdamID");
  }
  if (v10)
  {
    v12 = 0;
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addCloudItemID:idType:", v10, v12);
    goto LABEL_9;
  }
  if (v11)
  {
    v12 = 1;
    v10 = v11;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v20, "identifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "universalStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "globalPlaylistID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addPlaylistID:", v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPPlaylistUpdateErrorDomain"), -1, CFSTR("Failed to generate the necessary identifiers for an item attempting to be added to a playlist."));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *a4 = 1;
  }
LABEL_9:

}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_10;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_11(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_12;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_13(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_14;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_15(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_16;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_17(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_18;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_116(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2_117;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_3_118(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4_119;
    v4[3] = &unk_1E31635F8;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_sync(v3, v4);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_5_120(uint64_t a1, int a2)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6_121;
    block[3] = &unk_1E3163508;
    v3 = *(NSObject **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    dispatch_sync(v3, block);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_7_122(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t v22;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(id *)(a1 + 32);
    if (v2)
    {
LABEL_5:
      v3 = *(void **)(a1 + 40);
      if (*(_BYTE *)(a1 + 80))
      {
        objc_msgSend(v3, "userIdentity");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "persistentID");
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8_123;
        v19[3] = &unk_1E315B2C0;
        v8 = *(_QWORD *)(a1 + 32);
        v19[4] = *(_QWORD *)(a1 + 40);
        v9 = *(id *)(a1 + 48);
        v10 = *(_QWORD *)(a1 + 72);
        v20 = v9;
        v22 = v10;
        v21 = *(id *)(a1 + 56);
        objc_msgSend(v5, "sdk_createPlaylistWithPersistenID:properties:tracklist:completionHandler:", v6, v8, v7, v19);

        v11 = v20;
      }
      else
      {
        objc_msgSend(v3, "userIdentity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v15 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "persistentID");
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9_124;
        v17[3] = &unk_1E31637A8;
        v17[4] = *(_QWORD *)(a1 + 40);
        v18 = *(id *)(a1 + 56);
        objc_msgSend(v13, "sdk_setPlaylistProperties:trackList:forPlaylistWithPersistentID:completionHandler:", v2, v14, v15, v17);

        v11 = v18;
      }

      return;
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = 0;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "completeResponseHandler");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8_123(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completeResponseHandler");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "removePlaylist:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);
    }
    else
    {
      v4[2](v4, 0, *(_QWORD *)(a1 + 48));
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_9_124(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "completeResponseHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v5, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "finish");

}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6_121(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isExternalVendorPlaylist"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_4_119(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("dateModified"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("externalVendorDisplayName"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("externalVendorDisplayName"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("iO"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("cloudIsCuratorPlaylist"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("cloudIsVisible"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("cloudIsPublic"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("descriptionInfo"));
}

uint64_t __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("name"));
}

void __95__MPModelLibrarySDKPlaylistEditChangeRequestOperation__executeWithCloudLibraryEnabledConfirmed__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "persistentID"));

}

void __62__MPModelLibrarySDKPlaylistEditChangeRequestOperation_execute__block_invoke(uint64_t a1, __int16 a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((a2 & 0x100) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeWithCloudLibraryEnabledConfirmed");
  }
  else
  {
    if (v5)
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain"), -10004, v5, CFSTR("Unable to check cloud service capabilities."));
    else
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPModelLibrarySDKPlaylistEditChangeRequestOperationErrorDomain"), -10005, CFSTR("Add to cloud music library capability is missing."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);

  }
}

@end
