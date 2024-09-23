@implementation MPCMusicPlaybackIntentDataSource

- (void)_getPlaybackContextForIntent:(id)a3 withCompletion:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v6 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCMusicPlaybackIntentDataSource.m"), 28, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPCMusicPlaybackIntentDataSource class]"));

  }
}

- (void)getArchiveFromIntent:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v20 = v8;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | intent=%{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke;
  v15[3] = &unk_24CAB7A78;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  -[MPCMusicPlaybackIntentDataSource _getPlaybackContextForIntent:withCompletion:](self, "_getPlaybackContextForIntent:withCompletion:", v14, v15);

}

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  int64_t v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "actionAfterQueueLoad") == 20;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke;
  v13[3] = &unk_24CAB7AC8;
  v15 = v9;
  v16 = a4;
  v14 = v8;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  -[MPCMusicPlaybackIntentDataSource _getPlaybackContextForIntent:withCompletion:](self, "_getPlaybackContextForIntent:withCompletion:", v12, v13);

}

- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  MPCMusicPlaybackIntentDataSource *v15;
  id v16;
  SEL v17;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke;
  v13[3] = &unk_24CAB7B18;
  v16 = v10;
  v17 = a2;
  v14 = v9;
  v15 = self;
  v11 = v9;
  v12 = v10;
  -[MPCMusicPlaybackIntentDataSource _getPlaybackContextForIntent:withCompletion:](self, "_getPlaybackContextForIntent:withCompletion:", a3, v13);

}

void __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (objc_msgSend(v5, "shuffleType") == 1000)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setShuffleType:", objc_msgSend(v7, "musicShuffleType"));

    }
    v8 = objc_alloc_init((Class)objc_msgSend(v6, "queueFeederClass"));
    v9 = *(_QWORD *)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2;
    v14[3] = &unk_24CAB7AF0;
    v10 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v17 = v10;
    v18 = v11;
    v12 = *(void **)(a1 + 32);
    v14[4] = *(_QWORD *)(a1 + 40);
    v15 = v8;
    v16 = v12;
    v13 = v8;
    objc_msgSend(v13, "getRepresentativeMetadataForPlaybackContext:properties:completion:", v6, v9, v14);

  }
}

void __92__MPCMusicPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("MPCMusicPlaybackIntentDataSource.m"), 254, CFSTR("%@ did not produce representative model object or error"), a1[5]);

    }
    objc_msgSend(v7, "flattenedGenericObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithPropertySet:", a1[6]);

    v12 = objc_msgSend(v11, "type");
    v13 = a1[7];
    if (v12)
    {
      (*(void (**)(uint64_t, void *, id, _QWORD))(v13 + 16))(v13, v11, v8, 0);
    }
    else
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v18 = CFSTR("modelObject");
      v19[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), 1, v15, CFSTR("No matching properties for reprentative object: %@"), v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id, void *))(v13 + 16))(v13, 0, v8, v16);

    }
  }

}

void __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  char v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "privateListeningOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrivateListeningOverride:", v4);

  switch(*(_QWORD *)(a1 + 48))
  {
    case 0:
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 1, CFSTR("Cannot get remote playback queue: Destination is unknown"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, CFSTR("playbackContext"));
      objc_msgSend(v3, "siriReferenceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE658D8]);

      objc_msgSend(v3, "privateListeningOverride");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE65970]);

      v9 = objc_alloc(MEMORY[0x24BDDC728]);
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithIdentifier:data:options:", CFSTR("InProcess-com.apple.mediaplayer.playbackcontext"), v10, v6);

      v12 = *(unsigned __int8 *)(a1 + 56);
      v13 = v11;
      goto LABEL_5;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDC728]), "initWithIdentifier:data:", CFSTR("com.apple.mediaplayer.playbackcontext"), v6);
      v11 = v13;
      v12 = *(unsigned __int8 *)(a1 + 56);
LABEL_5:
      objc_msgSend(v13, "setRequestingImmediatePlayback:", v12);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_6:
      break;
    case 3:
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke_2;
      v14[3] = &unk_24CAB7AA0;
      v16 = *(_BYTE *)(a1 + 56);
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v3, "getRemotePlaybackQueueRepresentationWithCompletion:", v14);

      break;
    default:
      break;
  }

}

void __92__MPCMusicPlaybackIntentDataSource_getRemotePlaybackQueueFromIntent_destination_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(unsigned __int8 *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "setRequestingImmediatePlayback:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
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
  id v122;
  void *v123;
  _QWORD v124[4];
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  uint64_t v132;
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  uint64_t v137;
  _QWORD v138[2];
  _QWORD v139[2];
  uint64_t v140;
  uint64_t v141;
  void *v142;
  _QWORD v143[2];
  uint64_t v144;
  uint64_t v145;
  void *v146;
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[2];
  uint64_t v151;
  uint64_t v152;
  void *v153;
  _QWORD v154[2];
  uint64_t v155;
  uint64_t v156;
  void *v157;
  _QWORD v158[2];
  _QWORD v159[3];
  _QWORD v160[2];
  uint64_t v161;
  uint64_t v162;
  void *v163;
  _QWORD v164[2];
  uint64_t v165;
  uint64_t v166;
  void *v167;
  _QWORD v168[2];
  _QWORD v169[19];
  _BYTE buf[24];
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | returning nil [getPlaybackContext failed] error=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "privateListeningOverride");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrivateListeningOverride:", v9);

    v10 = (objc_class *)objc_msgSend(v5, "queueFeederClass");
    if (v10 == (objc_class *)objc_opt_class())
      v10 = (objc_class *)objc_opt_class();
    v122 = objc_alloc_init(v10);
    objc_msgSend(v5, "setShuffleType:", 0);
    v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | validating context [] playbackContext=%{public}@", buf, 0x16u);
    }
    v123 = v5;

    v13 = *(void **)(a1 + 32);
    v121 = a1;
    if (v13)
    {
      v119 = objc_alloc(MEMORY[0x24BDDCB30]);
      v169[0] = *MEMORY[0x24BDDC2F8];
      v14 = objc_alloc(MEMORY[0x24BDDCB30]);
      v15 = *MEMORY[0x24BDDC0D8];
      v168[0] = *MEMORY[0x24BDDC160];
      v168[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v168, 2);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v166 = *MEMORY[0x24BDDC380];
      v16 = (void *)MEMORY[0x24BDDCB30];
      v165 = *MEMORY[0x24BDDBDD0];
      v17 = v165;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v165, 1);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "propertySetWithProperties:", v118);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v167 = v117;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = (void *)objc_msgSend(v14, "initWithProperties:relationships:", v116, v115);
      *(_QWORD *)buf = v114;
      v169[1] = *MEMORY[0x24BDDC278];
      v18 = objc_alloc(MEMORY[0x24BDDCB30]);
      v19 = *MEMORY[0x24BDDBD80];
      v164[0] = *MEMORY[0x24BDDBDA0];
      v164[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v164, 2);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = *MEMORY[0x24BDDC270];
      v20 = (void *)MEMORY[0x24BDDCB30];
      v161 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v161, 1);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "propertySetWithProperties:", v113);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v112;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = (void *)objc_msgSend(v18, "initWithProperties:relationships:", v111, v110);
      *(_QWORD *)&buf[8] = v109;
      v169[2] = *MEMORY[0x24BDDC280];
      v21 = (void *)MEMORY[0x24BDDCB30];
      v22 = *MEMORY[0x24BDDBDC8];
      v160[0] = v17;
      v160[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v160, 2);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "propertySetWithProperties:", v108);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf[16] = v107;
      v169[3] = *MEMORY[0x24BDDC2B8];
      v23 = (void *)MEMORY[0x24BDDCB30];
      v24 = *MEMORY[0x24BDDBF18];
      v159[0] = *MEMORY[0x24BDDBF50];
      v159[1] = v24;
      v159[2] = *MEMORY[0x24BDDBF58];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v159, 3);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "propertySetWithProperties:", v106);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = v105;
      v169[4] = *MEMORY[0x24BDDC300];
      v25 = objc_alloc(MEMORY[0x24BDDCB30]);
      v26 = *MEMORY[0x24BDDC1E0];
      v158[0] = *MEMORY[0x24BDDC238];
      v158[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v158, 2);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = *MEMORY[0x24BDDC3D8];
      v27 = (void *)MEMORY[0x24BDDCB30];
      v155 = *MEMORY[0x24BDDC268];
      v28 = v155;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 1);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "propertySetWithProperties:", v104);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = v103;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = (void *)objc_msgSend(v25, "initWithProperties:relationships:", v102, v101);
      v172 = v100;
      v169[5] = *MEMORY[0x24BDDC308];
      v29 = objc_alloc(MEMORY[0x24BDDCB30]);
      v30 = *MEMORY[0x24BDDC240];
      v154[0] = *MEMORY[0x24BDDC250];
      v154[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v154, 2);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = *MEMORY[0x24BDDC3E8];
      v31 = (void *)MEMORY[0x24BDDCB30];
      v151 = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v151, 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "propertySetWithProperties:", v99);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v153 = v98;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = (void *)objc_msgSend(v29, "initWithProperties:relationships:", v97, v96);
      v173 = v95;
      v169[6] = *MEMORY[0x24BDDC310];
      v32 = (void *)MEMORY[0x24BDDCB30];
      v33 = *MEMORY[0x24BDDC258];
      v150[0] = v28;
      v150[1] = v33;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v150, 2);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "propertySetWithProperties:", v94);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = v93;
      v169[7] = *MEMORY[0x24BDDC2B0];
      v34 = (void *)MEMORY[0x24BDDCB30];
      v35 = *MEMORY[0x24BDDBE90];
      v149[0] = *MEMORY[0x24BDDBED0];
      v149[1] = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v149, 2);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "propertySetWithProperties:", v92);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = v91;
      v169[8] = *MEMORY[0x24BDDC2A8];
      v36 = (void *)MEMORY[0x24BDDCB30];
      v37 = *MEMORY[0x24BDDBE80];
      v148[0] = *MEMORY[0x24BDDBE88];
      v148[1] = v37;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v148, 2);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "propertySetWithProperties:", v90);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = v89;
      v169[9] = *MEMORY[0x24BDDC2C8];
      v38 = objc_alloc(MEMORY[0x24BDDCB30]);
      v40 = *MEMORY[0x24BDDBF78];
      v147[0] = *MEMORY[0x24BDDBFE8];
      v39 = v147[0];
      v147[1] = v40;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v147, 2);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v145 = *MEMORY[0x24BDDC360];
      v41 = (void *)MEMORY[0x24BDDCB30];
      v144 = *MEMORY[0x24BDDBF80];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v144, 1);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "propertySetWithProperties:", v88);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v87;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = (void *)objc_msgSend(v38, "initWithProperties:relationships:", v86, v85);
      v177 = v84;
      v169[10] = *MEMORY[0x24BDDC2D0];
      v42 = objc_alloc(MEMORY[0x24BDDCB30]);
      v43 = *MEMORY[0x24BDDBF88];
      v143[0] = *MEMORY[0x24BDDBFB8];
      v143[1] = v43;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 2);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = *MEMORY[0x24BDDC370];
      v44 = (void *)MEMORY[0x24BDDCB30];
      v140 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v140, 1);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "propertySetWithProperties:", v83);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v142 = v82;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v42, "initWithProperties:relationships:", v81, v80);
      v178 = v79;
      v169[11] = *MEMORY[0x24BDDC2D8];
      v45 = (void *)MEMORY[0x24BDDCB30];
      v46 = *MEMORY[0x24BDDBFF8];
      v139[0] = *MEMORY[0x24BDDC050];
      v139[1] = v46;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 2);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "propertySetWithProperties:", v78);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = v77;
      v169[12] = *MEMORY[0x24BDDC2E0];
      v47 = (void *)MEMORY[0x24BDDCB30];
      v48 = *MEMORY[0x24BDDC018];
      v138[0] = *MEMORY[0x24BDDC040];
      v138[1] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v138, 2);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "propertySetWithProperties:", v76);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = v75;
      v169[13] = *MEMORY[0x24BDDC288];
      v49 = (void *)MEMORY[0x24BDDCB30];
      v137 = *MEMORY[0x24BDDBDD8];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v137, 1);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "propertySetWithProperties:", v74);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = v73;
      v169[14] = *MEMORY[0x24BDDC298];
      v50 = (void *)MEMORY[0x24BDDCB30];
      v51 = *MEMORY[0x24BDDBE38];
      v136[0] = *MEMORY[0x24BDDBE40];
      v136[1] = v51;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v136, 2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "propertySetWithProperties:", v72);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v182 = v52;
      v169[15] = *MEMORY[0x24BDDC290];
      v53 = (void *)MEMORY[0x24BDDCB30];
      v54 = *MEMORY[0x24BDDBDE0];
      v135[0] = *MEMORY[0x24BDDBDE8];
      v135[1] = v54;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "propertySetWithProperties:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v183 = v56;
      v169[16] = *MEMORY[0x24BDDC2F0];
      v57 = (void *)MEMORY[0x24BDDCB30];
      v58 = *MEMORY[0x24BDDC098];
      v134[0] = *MEMORY[0x24BDDC0C0];
      v134[1] = v58;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v134, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "propertySetWithProperties:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v60;
      v169[17] = *MEMORY[0x24BDDC2E8];
      v61 = (void *)MEMORY[0x24BDDCB30];
      v62 = *MEMORY[0x24BDDC088];
      v133[0] = *MEMORY[0x24BDDC090];
      v133[1] = v62;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v133, 2);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "propertySetWithProperties:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = v64;
      v169[18] = *MEMORY[0x24BDDC2A0];
      v65 = (void *)MEMORY[0x24BDDCB30];
      v132 = *MEMORY[0x24BDDBE60];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v132, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "propertySetWithProperties:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v186 = v67;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v169, 19);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = (void *)objc_msgSend(v119, "initWithProperties:relationships:", MEMORY[0x24BDBD1A8], v68);

      v69 = v121;
      v13 = *(void **)(v121 + 32);
    }
    else
    {
      v120 = 0;
      v69 = a1;
    }
    v124[0] = MEMORY[0x24BDAC760];
    v124[1] = 3221225472;
    v124[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_10;
    v124[3] = &unk_24CAB7A50;
    v125 = v13;
    v131 = *(id *)(v69 + 48);
    v126 = v122;
    v127 = v120;
    v128 = *(id *)(v69 + 40);
    v5 = v123;
    v129 = v123;
    v130 = 0;
    v70 = v120;
    v71 = v122;
    objc_msgSend(v71, "getRepresentativeMetadataForPlaybackContext:properties:completion:", v129, v70, v124);

    v6 = 0;
  }

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
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
  id v33;
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
  uint64_t v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  int v66;
  void *v67;
  NSObject *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  _QWORD aBlock[4];
  id v98;
  id v99;
  id v100;
  NSObject *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  _BYTE *v106;
  _QWORD *v107;
  _QWORD v108[4];
  NSObject *v109;
  _BYTE *v110;
  _QWORD v111[4];
  id v112;
  NSObject *v113;
  _QWORD *v114;
  _QWORD v115[5];
  id v116;
  uint8_t v117[4];
  uint64_t v118;
  __int16 v119;
  void *v120;
  _BYTE buf[24];
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v88 = a2;
  v87 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v9 = v8;
  v89 = v7;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | returning nil [getRepresentativeMetadata failed] error=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v88, "identifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | using playback context [valid representative metadata] modelObject.identifiers=%{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "firstModelPlayEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "genericObjectRepresentation");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    v16 = v88;
    if (v14)
      v16 = (void *)v14;
    v85 = v16;

    objc_msgSend(v85, "flattenedGenericObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copyWithPropertySet:", *(_QWORD *)(a1 + 48));

    objc_msgSend(v18, "identifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredStoreStringIdentifierForPersonID:", 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(_QWORD *)(a1 + 32);
    v21 = v18;
    if (v20)
    {
      v22 = objc_alloc_init(MEMORY[0x24BDDCAA8]);
      switch(objc_msgSend(v21, "type"))
      {
        case 0:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_generateNowPlayingContentItemWithMetadataObject_, v20, CFSTR("MPCPlaybackIntent.m"), 401, CFSTR("Cannot handle unknown generic object metadata."));

          goto LABEL_17;
        case 1:
          objc_msgSend(v21, "song");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v25);

          objc_msgSend(v21, "song");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "artist");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v28);

          goto LABEL_34;
        case 2:
          objc_msgSend(v21, "album");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "title");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v30);

          objc_msgSend(v21, "album");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "artist");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v31);

          goto LABEL_34;
        case 3:
          objc_msgSend(v21, "artist");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 4:
          objc_msgSend(v21, "playlist");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 5:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel_generateNowPlayingContentItemWithMetadataObject_, v20, CFSTR("MPCPlaybackIntent.m"), 404, CFSTR("Expected a flattened generic object."));

LABEL_17:
          v33 = 0;
          goto LABEL_36;
        case 6:
          objc_msgSend(v21, "tvEpisode");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "title");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v35);

          objc_msgSend(v21, "tvEpisode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "show");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "title");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v36);

          goto LABEL_34;
        case 7:
          objc_msgSend(v21, "season");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "show");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "title");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v39);

          v40 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SEASON_DISPLAY_FORMAT_%@"), &stru_24CABB5D0, CFSTR("MediaPlayer"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v21, "season");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "numberWithInteger:", objc_msgSend(v42, "number"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringValue");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", v27, v44, v83);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v45);

          goto LABEL_34;
        case 8:
          objc_msgSend(v21, "show");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 9:
          objc_msgSend(v21, "movie");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 10:
          objc_msgSend(v21, "mediaClip");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 11:
          objc_msgSend(v21, "podcast");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "title");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v47);

          objc_msgSend(v21, "podcast");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "author");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v48);

          goto LABEL_34;
        case 12:
          objc_msgSend(v21, "podcastEpisode");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "title");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v50);

          objc_msgSend(v21, "podcastEpisode");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "podcast");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "title");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setSubtitle:", v51);

          goto LABEL_34;
        case 13:
          objc_msgSend(v21, "radioStation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 14:
          objc_msgSend(v21, "composer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 15:
          objc_msgSend(v21, "genre");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 16:
          objc_msgSend(v21, "curator");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 17:
          objc_msgSend(v21, "socialPerson");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 18:
          objc_msgSend(v21, "radioStationEvent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 19:
          objc_msgSend(v21, "recordLabel");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 20:
          objc_msgSend(v21, "creditsArtist");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "name");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
          goto LABEL_34;
        case 21:
          objc_msgSend(v21, "group");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setTitle:", v27);
LABEL_34:

          break;
        default:
          break;
      }
      v33 = v22;
LABEL_36:

    }
    else
    {
      v33 = 0;
    }

    v52 = *(_QWORD *)(a1 + 32);
    v53 = v21;
    v86 = v53;
    if (v52)
    {
      v54 = 0;
      switch(objc_msgSend(v53, "type"))
      {
        case 0:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", sel_artworkCatalogForMetadataModelObject_, v52, CFSTR("MPCPlaybackIntent.m"), 530, CFSTR("Cannot handle unknown generic object metadata."));
LABEL_40:
          v54 = 0;
          goto LABEL_63;
        case 1:
          objc_msgSend(v86, "song");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 2:
          objc_msgSend(v86, "album");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 3:
          objc_msgSend(v86, "artist");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 4:
          objc_msgSend(v86, "playlist");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          if (v57)
          {
            v54 = v57;
          }
          else
          {
            objc_msgSend(v86, "playlist");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "tracksTiledArtworkCatalogWithRows:columns:", 2, 2);
            v54 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_63;
        case 5:
          objc_msgSend(v86, "playlistEntry");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "type");

          switch(v60)
          {
            case 0:
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", sel_artworkCatalogForMetadataModelObject_, v52, CFSTR("MPCPlaybackIntent.m"), 549, CFSTR("Cannot handle unknown playlist entry when capturing metadata."));
              goto LABEL_40;
            case 1:
              objc_msgSend(v86, "playlistEntry");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "song");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "artworkCatalog");
              v54 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_63;
            case 2:
              objc_msgSend(v86, "playlistEntry");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "tvEpisode");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "artworkCatalog");
              v54 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_63;
            case 3:
              goto LABEL_51;
            default:
              goto LABEL_82;
          }
        case 6:
          objc_msgSend(v86, "tvEpisode");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 7:
          objc_msgSend(v86, "season");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 8:
          objc_msgSend(v86, "show");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 9:
LABEL_51:
          objc_msgSend(v86, "movie");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 10:
          objc_msgSend(v86, "mediaClip");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "previewArtworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 11:
          objc_msgSend(v86, "podcast");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 12:
          objc_msgSend(v86, "podcastEpisode");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 13:
          objc_msgSend(v86, "radioStation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 15:
          objc_msgSend(v86, "genre");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 16:
          objc_msgSend(v86, "curator");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "editorialArtworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 17:
          objc_msgSend(v86, "socialPerson");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 18:
          objc_msgSend(v86, "radioStationEvent");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 19:
          objc_msgSend(v86, "recordLabel");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
          goto LABEL_62;
        case 20:
          objc_msgSend(v86, "creditsArtist");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "artworkCatalog");
          v56 = objc_claimAutoreleasedReturnValue();
LABEL_62:
          v54 = (id)v56;
LABEL_63:

          break;
        default:
          break;
      }
    }
    else
    {
LABEL_82:
      v54 = 0;
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v122 = __Block_byref_object_copy__21491;
    v123 = __Block_byref_object_dispose__21492;
    v124 = 0;
    v115[0] = 0;
    v115[1] = v115;
    v115[2] = 0x3032000000;
    v115[3] = __Block_byref_object_copy__21491;
    v115[4] = __Block_byref_object_dispose__21492;
    v116 = 0;
    v61 = dispatch_group_create();
    v62 = v61;
    if (v54)
    {
      dispatch_group_enter(v61);
      v63 = *(void **)(a1 + 56);
      if (v63)
      {
        objc_msgSend(v63, "preferredArtworkSize");
        objc_msgSend(v54, "setFittingSize:");
      }
      v64 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = *(_QWORD *)(a1 + 32);
        v66 = objc_msgSend(v54, "hasExportableArtworkProperties");
        *(_DWORD *)v117 = 134218240;
        v118 = v65;
        v119 = 1024;
        LODWORD(v120) = v66;
        _os_log_impl(&dword_210BD8000, v64, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | hasExportableArtworkProperties=%d", v117, 0x12u);
      }

      if (objc_msgSend(v54, "hasExportableArtworkProperties"))
      {
        dispatch_group_enter(v62);
        v111[0] = MEMORY[0x24BDAC760];
        v111[1] = 3221225472;
        v111[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_11;
        v111[3] = &unk_24CAB7938;
        v112 = *(id *)(a1 + 32);
        v114 = v115;
        v113 = v62;
        objc_msgSend(v54, "requestExportableArtworkPropertiesWithCompletion:", v111);

      }
      v108[0] = MEMORY[0x24BDAC760];
      v108[1] = 3221225472;
      v108[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_14;
      v108[3] = &unk_24CAB7960;
      v110 = buf;
      v109 = v62;
      objc_msgSend(v54, "requestImageWithCompletion:", v108);

    }
    MSVNanoIDCreateTaggedPointer();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2;
    aBlock[3] = &unk_24CAB7A00;
    v98 = *(id *)(a1 + 32);
    v105 = *(id *)(a1 + 80);
    v99 = *(id *)(a1 + 40);
    v100 = *(id *)(a1 + 64);
    v68 = v62;
    v101 = v68;
    v69 = v67;
    v102 = v69;
    v84 = v83;
    v103 = v84;
    v70 = v33;
    v104 = v70;
    v106 = buf;
    v107 = v115;
    v71 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("original"));
    objc_msgSend(v72, "setObject:forKeyedSubscript:", v69, CFSTR("sessionID"));
    if (objc_msgSend(*(id *)(a1 + 40), "supplementalPlaybackContextBehavior") == 1
      && (objc_msgSend(*(id *)(a1 + 40), "supplementalPlaybackContextWithReason:", 3),
          v73 = (void *)objc_claimAutoreleasedReturnValue(),
          (v74 = v73) != 0))
    {
      objc_msgSend(v73, "setShuffleType:", 0);
      objc_msgSend(v74, "setActionAfterQueueLoad:", objc_msgSend(*(id *)(a1 + 64), "actionAfterQueueLoad"));
      v75 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v117 = 134218242;
        v118 = v76;
        v119 = 2114;
        v120 = v74;
        _os_log_impl(&dword_210BD8000, v75, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | validating supplemental context [] supplementalContext=%{public}@", v117, 0x16u);
      }

      v77 = objc_alloc_init((Class)objc_msgSend(v74, "queueFeederClass"));
      v78 = *(_QWORD *)(a1 + 48);
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_130;
      v90[3] = &unk_24CAB7A28;
      v91 = *(id *)(a1 + 32);
      v92 = *(id *)(a1 + 72);
      v93 = v88;
      v94 = v72;
      v79 = v74;
      v95 = v79;
      v96 = v71;
      objc_msgSend(v77, "getRepresentativeMetadataForPlaybackContext:properties:completion:", v79, v78, v90);

    }
    else
    {
      (*((void (**)(void *, void *))v71 + 2))(v71, v72);
    }

    _Block_object_dispose(v115, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6
    || (objc_msgSend(v5, "resolvedURLString"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v17 = 134218242;
      v18 = v8;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | could not resolve artworkImageURL, error=%{public}@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "resolvedURLString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 134218242;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | resolved artworkImageURL=%{public}@", (uint8_t *)&v17, 0x16u);

    }
    v13 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "resolvedURLString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLWithString:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x212BD17C4](a2, *MEMORY[0x24BE65B90]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v27 = v5;
    v28 = 2114;
    v29 = v3;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | creating archive [] payload=%{public}@", buf, 0x16u);
  }

  v25 = 0;
  objc_msgSend(MEMORY[0x24BE65C78], "encodedDataWithRootObject:error:", v3, &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;
  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_254A9D568))
    {
      v8 = *(id *)(a1 + 40);
      if (objc_msgSend(v8, "section:supportsShuffleType:", CFSTR("<ARCHIVE LOADER>"), 1))
        v9 = 6;
      else
        v9 = 0;
      v10 = (void *)objc_opt_class();

      if (objc_msgSend(v10, "supportsAutoPlay"))
        v11 = v9 | 8;
      else
        v11 = v9;
    }
    else
    {
      v11 = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_114;
    block[3] = &unk_24CAB79D8;
    v12 = *(NSObject **)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    v19 = v6;
    v24 = v11;
    v20 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 80);
    v14 = *(_QWORD *)(a1 + 104);
    v21 = v13;
    v23 = v14;
    v16 = *(_OWORD *)(a1 + 88);
    v15 = (id)v16;
    v22 = v16;
    dispatch_group_notify(v12, MEMORY[0x24BDAC9B8], block);

  }
}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_130(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(a1 + 40);
      v22 = 134218242;
      v23 = v17;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | ignoring supplemental context [getRepresentativeMetadata failed] error=%{public}@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 48), "identifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "intersectsSet:", v12);

  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "identifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218498;
      v23 = v19;
      v24 = 2114;
      v25 = v20;
      v26 = 2114;
      v27 = v21;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_ERROR, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | ignoring supplemental context [identifiers do not match] modelObject.identifiers=%{public}@ supplementalModelObject.identifiers=%{public}@", (uint8_t *)&v22, 0x20u);

    }
LABEL_11:

    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v22 = 134217984;
    v23 = v16;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[MPCPlaybackIntent:%p] getArchiveFromIntent: | using supplemental context [identifiers match]", (uint8_t *)&v22, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("supplemental"));
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_114(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  uint64_t v12;

  v2 = objc_alloc(MEMORY[0x24BDDCB08]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2_116;
  v6[3] = &unk_24CAB79B0;
  v7 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 88);
  v8 = v3;
  v12 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 72);
  v5 = (void *)objc_msgSend(v2, "initWithBlock:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_2_116(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  __int128 v10;

  v3 = a2;
  objc_msgSend(v3, "setType:", 1);
  objc_msgSend(v3, "setSessionIdentifier:type:data:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack"), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIdentifier:", v5);

  objc_msgSend(v3, "setSupportedOptions:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v3, "setFallbackStoreIdentifier:", *(_QWORD *)(a1 + 48));
  v6 = objc_alloc(MEMORY[0x24BDDCB10]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_3;
  v8[3] = &unk_24CAB7988;
  v9 = *(id *)(a1 + 56);
  v10 = *(_OWORD *)(a1 + 64);
  v7 = (void *)objc_msgSend(v6, "initWithBlock:", v8);
  objc_msgSend(v3, "setDisplayProperties:", v7);

}

void __82__MPCMusicPlaybackIntentDataSource_getArchiveFromIntent_configuration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v3, "title");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_24CABB5D0;
  objc_msgSend(v10, "setTitle:", v6);

  objc_msgSend(*(id *)(a1 + 32), "subtitle");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = &stru_24CABB5D0;
  objc_msgSend(v10, "setSubtitle:", v9);

  objc_msgSend(v10, "setArtworkImageData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v10, "setArtworkImageURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

@end
