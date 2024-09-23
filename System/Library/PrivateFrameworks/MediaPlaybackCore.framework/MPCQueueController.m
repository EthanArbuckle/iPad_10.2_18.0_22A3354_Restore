@implementation MPCQueueController

uint64_t __42__MPCQueueController_allKnownSessionTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allKnownSessionTypes");
}

- (NSString)engineID
{
  void *v2;
  void *v3;

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "engineID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MPCQueueControllerPlaybackEngine)playbackEngine
{
  return (MPCQueueControllerPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (id)contentItemIDsFromOffset:(int64_t)a3 toOffset:(int64_t)a4 mode:(int64_t)a5 nowPlayingIndex:(int64_t *)a6
{
  void *v8;
  NSString **p_targetContentItemID;
  NSString *v14;
  _BOOL4 v15;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  NSString *v30;
  NSString *targetContentItemID;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (self->_loadingContentItemID)
  {
    *a6 = 0;
    v32[0] = self->_loadingContentItemID;
    v8 = (void *)MEMORY[0x24BDBCE30];
    p_targetContentItemID = (NSString **)v32;
LABEL_7:
    objc_msgSend(v8, "arrayWithObjects:count:", p_targetContentItemID, 1, a5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = self->_targetContentItemID;
  if (-[NSString hasPrefix:](v14, "hasPrefix:", CFSTR("⏳")))
  {

LABEL_6:
    *a6 = 0;
    targetContentItemID = self->_targetContentItemID;
    v8 = (void *)MEMORY[0x24BDBCE30];
    p_targetContentItemID = &targetContentItemID;
    goto LABEL_7;
  }
  v15 = -[NSString hasPrefix:](v14, "hasPrefix:", CFSTR("♻️"));

  if (v15)
    goto LABEL_6;
  if (self->_targetContentItemID)
  {
    if (!(a4 | a3))
    {
      *a6 = 0;
      v30 = self->_targetContentItemID;
      v8 = (void *)MEMORY[0x24BDBCE30];
      p_targetContentItemID = &v30;
      goto LABEL_7;
    }
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4 - a3 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 0)
    {
      -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", self->_targetContentItemID, a5, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && -a3 >= 1)
      {
        v19 = 0;
        v29 = -(a4 & (a4 >> 63));
        do
        {
          objc_msgSend(v18, "nextObject", v29);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
            break;
          v21 = (void *)v20;
          if (v19 >= v29)
            objc_msgSend(v17, "insertObject:atIndex:", v20, 0);

          ++v19;
        }
        while (-a3 != v19);
      }

    }
    if (a3 <= 0 && (a4 & 0x8000000000000000) == 0)
    {
      *a6 = objc_msgSend(v17, "count");
      if (!self->_targetContentItemID)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 598, CFSTR("ContentItemID was nil [current item]"));

      }
      objc_msgSend(v17, "addObject:");
    }
    if (a4 >= 1)
    {
      -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", self->_targetContentItemID, a5, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v24 = a3 & ~(a3 >> 63);
      do
      {
        objc_msgSend(v22, "nextObject");
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
          break;
        v26 = (void *)v25;
        if (v23 >= v24)
          objc_msgSend(v17, "addObject:", v25);
        ++v23;

      }
      while (a4 != v23);

    }
    v27 = (void *)objc_msgSend(v17, "copy");

    return v27;
  }
  else
  {
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
    return MEMORY[0x24BDBD1A8];
  }
}

- (int64_t)displayIndexForContentItemID:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  int v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  char v19;

  v4 = a3;
  v5 = self->_targetContentItemID;
  -[MPCQueueController music](self, "music");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MPCQueueController music](self, "music");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentItemIDWithoutRepeatIteration:", v4);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();

    -[MPCQueueController music](self, "music");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentItemIDWithoutRepeatIteration:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (NSString *)v10;
  }
  else
  {
    v8 = (NSString *)v4;
  }
  v11 = v5;
  if (v8 == v11)
  {

  }
  else
  {
    v12 = -[NSString isEqual:](v8, "isEqual:", v11);

    if (!v12)
    {
      v13 = 0;
      goto LABEL_18;
    }
  }
  -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nextObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v13 = 0;
    while (1)
    {
      v17 = v16;
      if (v8 == v17)
        break;
      v18 = v17;
      v19 = -[NSString isEqual:](v8, "isEqual:", v17);

      if ((v19 & 1) != 0)
        goto LABEL_16;
      ++v13;
      objc_msgSend(v14, "nextObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v18 = 0;
        goto LABEL_16;
      }
    }

    v18 = v8;
LABEL_16:

  }
  else
  {
    v13 = 0;
  }

LABEL_18:
  return v13;
}

- (MPCQueueControllerBehaviorMusic)music
{
  MPCQueueControllerBehaviorImplementation *behaviorImpl;

  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254AA4248))behaviorImpl = self->_behaviorImpl;
  else
    behaviorImpl = 0;
  return behaviorImpl;
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 reason:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSMapTable *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  __CFString *v16;
  int v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  +[_MPCQueueControllerRegistry shared](_MPCQueueControllerRegistry, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transportableExtensions");
  v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  NSMapGet(v11, (const void *)self->_behaviorType);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "allKnownSessionTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v8) & 1) == 0)
  {
    if (a5)
    {
      v15 = 0;
      v16 = CFSTR("other behavior session type");
LABEL_9:
      *a5 = v16;
      goto LABEL_21;
    }
LABEL_10:
    v15 = 0;
    goto LABEL_21;
  }
  v14 = v9;
  if (objc_msgSend(v14, "hasPrefix:", CFSTR("⏳")))
  {

    goto LABEL_7;
  }
  v17 = objc_msgSend(v14, "hasPrefix:", CFSTR("♻️"));

  if (v17)
  {
LABEL_7:
    if (a5)
    {
      v15 = 0;
      v16 = CFSTR("QC-Placeholder content item ID");
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__18041;
  v36 = __Block_byref_object_dispose__18042;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__MPCQueueController_isExportableSessionType_forContentItemID_reason___block_invoke;
  v22[3] = &unk_24CAB65D0;
  v26 = &v28;
  v23 = v8;
  v24 = v14;
  v25 = v12;
  v27 = &v32;
  if (-[MPCQueueController _withTransportableBehavior:](self, "_withTransportableBehavior:", v22))
  {
    v18 = *((unsigned __int8 *)v29 + 24);
    if (a5 && !*((_BYTE *)v29 + 24))
    {
      v19 = (__CFString *)objc_retainAutorelease((id)v33[5]);
      v20 = CFSTR("not supported by transportableBehavior");
      if (v19)
        v20 = v19;
      *a5 = v20;
      v18 = *((unsigned __int8 *)v29 + 24);
    }
    v15 = v18 != 0;
  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = CFSTR("current Behavior is non-transportable");
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

LABEL_21:
  return v15;
}

+ (BOOL)isSupportedSessionType:(id)a3 forEngine:(id)a4 reason:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSMapTable *v10;
  unint64_t i;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v18;
  __CFString *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  +[_MPCQueueControllerRegistry shared](_MPCQueueControllerRegistry, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transportableExtensions");
  v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 6; ++i)
  {
    NSMapGet(v10, (const void *)i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKnownSessionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "containsObject:", v7))
    {
      if (+[MPCPlaybackEngine isSystemMusic](MPCPlaybackEngine, "isSystemMusic"))
        v15 = i >= 4;
      else
        v15 = 0;
      if (!v15 || i == 5)
      {
        if (!+[MPCPlaybackEngine isSystemPodcasts](MPCPlaybackEngine, "isSystemPodcasts")
          || i <= 5 && ((1 << i) & 0x33) != 0)
        {
          v14 = objc_msgSend(v12, "isSupportedSessionType:reason:", v7, a5);
LABEL_18:

          goto LABEL_19;
        }
        if (a5)
        {
          v18 = (void *)MEMORY[0x24BDD17C8];
          if (i - 2 >= 4)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown/%lld"), i);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v19 = off_24CAB6910[i - 2];
          }
          objc_msgSend(v18, "stringWithFormat:", CFSTR("behavior[%@] unavailable in SystemPodcastsApplication"), v19);
          goto LABEL_32;
        }
      }
      else if (a5)
      {
        v20 = (void *)MEMORY[0x24BDD17C8];
        if (i == 4)
        {
          v19 = CFSTR("podcasts");
        }
        else if (i == 5)
        {
          v19 = CFSTR("test");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown/%lld"), i);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "stringWithFormat:", CFSTR("behavior[%@] unavailable in SystemMusicApplication"), v19);
LABEL_32:
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = 0;
      goto LABEL_18;
    }

  }
  v14 = 0;
  if (a5)
    *a5 = CFSTR("unknown sessionType [QC]");
LABEL_19:

  return v14;
}

- (BOOL)_withTransportableBehavior:(id)a3
{
  void (**v4)(id, MPCQueueControllerBehaviorImplementation *);
  int v5;

  v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  v5 = -[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A98DC8);
  if (v5)
    v4[2](v4, self->_behaviorImpl);

  return v5;
}

void __70__MPCQueueController_isExportableSessionType_forContentItemID_reason___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id obj;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(a2, "isExportableSessionType:forContentItemID:extension:reason:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;
}

+ (id)allKnownSessionTypes
{
  void *v2;
  NSMapTable *v3;
  void *v4;
  void *v5;

  +[_MPCQueueControllerRegistry shared](_MPCQueueControllerRegistry, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportableExtensions");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();

  NSAllMapTableValues(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "msv_flatMap:", &__block_literal_global_18290);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)canPreviousTrackForContentItemID:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  __CFString *v9;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v8 = 0;
      v9 = CFSTR("no item");
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("⏳")) & 1) == 0
    && !objc_msgSend(v7, "hasPrefix:", CFSTR("♻️")))
  {
    v8 = -[MPCQueueControllerBehaviorImplementation canPreviousItemFromContentItemID:reason:](self->_behaviorImpl, "canPreviousItemFromContentItemID:reason:", v7, a4);
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_9;
  v8 = 0;
  v9 = CFSTR("QC-Placeholder");
LABEL_8:
  *a4 = v9;
LABEL_11:

  return v8;
}

- (BOOL)canNextTrackForContentItemID:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  __CFString *v9;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v8 = 0;
      v9 = CFSTR("no item");
      goto LABEL_8;
    }
LABEL_9:
    v8 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("⏳")) & 1) == 0
    && !objc_msgSend(v7, "hasPrefix:", CFSTR("♻️")))
  {
    v8 = -[MPCQueueControllerBehaviorImplementation canNextItemFromContentItemID:reason:](self->_behaviorImpl, "canNextItemFromContentItemID:reason:", v7, a4);
    goto LABEL_11;
  }
  if (!a4)
    goto LABEL_9;
  v8 = 0;
  v9 = CFSTR("QC-Placeholder");
LABEL_8:
  *a4 = v9;
LABEL_11:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_emitEventsForItemChangeFromItem:(id)a3 toCurrentItem:(id)a4
{
  void *v4;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  char v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  id v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int v83;
  const __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
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
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  int v136;
  const __CFString *v137;
  void *v138;
  void *v139;
  void *v140;
  char v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  _BOOL4 v169;
  void *v170;
  _BOOL4 v171;
  void *v172;
  void *v173;
  _BOOL4 v174;
  uint64_t v175;
  void *v176;
  void *v177;
  _BOOL4 v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  id v185;
  _QWORD v186[4];
  id v187;
  uint64_t *v188;
  uint64_t *v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t *v192;
  uint64_t *v193;
  uint64_t *v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  char v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  char v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t (*v214)(uint64_t, uint64_t);
  void (*v215)(uint64_t);
  id v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  char v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t (*v224)(uint64_t, uint64_t);
  void (*v225)(uint64_t);
  id v226;
  _QWORD v227[3];
  _QWORD v228[3];
  _QWORD v229[23];
  _QWORD v230[23];
  _QWORD v231[7];
  _QWORD v232[7];
  _QWORD v233[5];
  _QWORD v234[5];
  _QWORD v235[4];
  _QWORD v236[4];
  _QWORD v237[2];
  _QWORD v238[2];
  _QWORD v239[4];
  _QWORD v240[6];

  v240[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v185 = v7;
  objc_msgSend(v7, "modelPlayEvent");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v181, "genericObjectRepresentation");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelPlayEvent");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "genericObjectRepresentation");
  v9 = objc_claimAutoreleasedReturnValue();
  v179 = (void *)v9;
  v10 = 0;
  v11 = v180 == 0;
  if (!v9)
    v11 = 0;
  v171 = v11;
  if (v9)
    v12 = 0;
  else
    v12 = v180 != 0;
  v174 = v12;
  if (v180 && v9)
  {
    objc_msgSend(v8, "queueSectionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "queueSectionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", v14))
    {
      objc_msgSend(v180, "identifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "identifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "intersectsSet:", v16) ^ 1;

    }
    else
    {
      v10 = 1;
    }

  }
  v17 = 0;
  if (v8)
    v18 = v185 == 0;
  else
    v18 = 0;
  v169 = v18;
  if (v8)
    v19 = 0;
  else
    v19 = v185 != 0;
  if (v185 && v8)
  {
    objc_msgSend(v185, "contentItemID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentItemID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    v23 = v21;
    if (v22 == v23)
    {

    }
    else
    {
      v24 = objc_msgSend(v22, "isEqual:", v23);

      if (!v24)
      {
        v17 = 1;
LABEL_25:

        goto LABEL_26;
      }
    }
    v17 = objc_msgSend(v185, "didReachEnd");
    goto LABEL_25;
  }
LABEL_26:
  objc_msgSend(v185, "queueItemID");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v8;
  else
    v25 = 0;
  v26 = v25;
  v184 = v26;
  if (v185 == v8
    && (objc_msgSend(v26, "previousQueueItemID"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v27,
        v27))
  {
    objc_msgSend(v184, "previousQueueItemID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "queueItemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v28;
    v31 = v29;
    if (v30 == v31)
      v32 = 1;
    else
      v32 = objc_msgSend(v30, "isEqual:", v31);
    v4 = v184;

    objc_msgSend(v184, "previousQueueItemID");
    v33 = objc_claimAutoreleasedReturnValue();

    if ((v32 & 1) != 0)
    {
      v17 = 0;
      v178 = 0;
    }
    else
    {
      objc_msgSend(v184, "jingleTimedMetadata");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = v34 != 0;

      v17 = 1;
    }
    v177 = (void *)v33;
  }
  else
  {
    v178 = 0;
  }
  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v19 | v17) == 1)
  {
    v35 = (void *)MEMORY[0x24BDD16E0];
    v36 = v185;
    objc_msgSend(v36, "time");
    v38 = v37;
    v39 = v36;
    objc_msgSend(v39, "durationIfAvailable");
    if (v40 >= v38)
      v41 = v38;
    else
      v41 = v40;
    v42 = fmax(v41, 0.0);

    objc_msgSend(v35, "numberWithDouble:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "eventStream");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "isPlaceholder"))
      v45 = CFSTR("item-placeholder-end");
    else
      v45 = CFSTR("item-end");
    v239[0] = CFSTR("queue-section-id");
    objc_msgSend(v39, "queueSectionID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v240[0] = v46;
    v240[1] = v177;
    v239[1] = CFSTR("queue-item-id");
    v239[2] = CFSTR("item-end-position");
    v47 = (uint64_t)v43;
    if (v178)
    {
      objc_msgSend(v8, "lastMetadataChangeTime");
      v48 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v48;
      if (v48)
        v47 = v48;
      else
        v47 = (uint64_t)v43;
    }
    v240[2] = v47;
    v239[3] = CFSTR("item-did-play-to-end");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v39, "didReachEnd"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v240[3] = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v240, v239, 4);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "emitEventType:payload:", v45, v50);

    if (v178)
  }
  if ((v174 | v10) == 1)
  {
    objc_msgSend(v181, "genericObjectRepresentation");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "anyObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "identifiers");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v53, "isPlaceholder") & 1) == 0)
    {
      objc_msgSend(v183, "eventStream");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v237[0] = CFSTR("queue-section-id");
      objc_msgSend(v185, "queueSectionID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v237[1] = CFSTR("container-ids");
      v238[0] = v55;
      v56 = v53;
      if (!v53)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v238[1] = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v238, v237, 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "emitEventType:payload:", CFSTR("container-end"), v57);

      if (!v53)
    }

  }
  if ((v171 | v10) == 1)
  {
    objc_msgSend(v182, "genericObjectRepresentation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "anyObject");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "identifiers");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v60, "isPlaceholder") & 1) == 0)
    {
      v221 = 0;
      v222 = &v221;
      v223 = 0x3032000000;
      v224 = __Block_byref_object_copy__18041;
      v225 = __Block_byref_object_dispose__18042;
      v226 = 0;
      v217 = 0;
      v218 = &v217;
      v219 = 0x2020000000;
      v220 = 0;
      v211 = 0;
      v212 = &v211;
      v213 = 0x3032000000;
      v214 = __Block_byref_object_copy__18041;
      v215 = __Block_byref_object_dispose__18042;
      v216 = 0;
      v207 = 0;
      v208 = &v207;
      v209 = 0x2020000000;
      v210 = 0;
      v203 = 0;
      v204 = &v203;
      v205 = 0x2020000000;
      v206 = 0;
      v199 = 0;
      v200 = &v199;
      v201 = 0x2020000000;
      v202 = 0;
      v195 = 0;
      v196 = &v195;
      v197 = 0x2020000000;
      v198 = 0;
      v61 = (void *)MEMORY[0x24BDDC928];
      v186[0] = MEMORY[0x24BDAC760];
      v186[1] = 3221225472;
      v186[2] = __69__MPCQueueController__emitEventsForItemChangeFromItem_toCurrentItem___block_invoke;
      v186[3] = &unk_24CAB67A0;
      v188 = &v221;
      v187 = v182;
      v189 = &v199;
      v190 = &v195;
      v191 = &v203;
      v192 = &v211;
      v193 = &v207;
      v194 = &v217;
      objc_msgSend(v61, "performWithoutEnforcement:", v186);
      objc_msgSend(v183, "eventStream");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v235[0] = CFSTR("queue-section-id");
      objc_msgSend(v8, "queueSectionID");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v236[0] = v172;
      v235[1] = CFSTR("container-kind");
      objc_msgSend(v60, "modelKind");
      v175 = objc_claimAutoreleasedReturnValue();
      v62 = v175;
      if (!v175)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v62 = objc_claimAutoreleasedReturnValue();
      }
      v159 = (void *)v62;
      v236[1] = v62;
      v235[2] = CFSTR("container-ids");
      v63 = (uint64_t)v60;
      if (!v60)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v63 = objc_claimAutoreleasedReturnValue();
      }
      v157 = (void *)v63;
      v236[2] = v63;
      v235[3] = CFSTR("container-metadata");
      v233[0] = CFSTR("container-title");
      v64 = v222[5];
      v163 = v64;
      if (!v64)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v64 = objc_claimAutoreleasedReturnValue();
      }
      v155 = (void *)v64;
      v234[0] = v64;
      v233[1] = CFSTR("container-radio-type");
      if (*((_BYTE *)v204 + 24))
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v200[3]);
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      v234[1] = v167;
      v233[2] = CFSTR("container-radio-subtype");
      if (*((_BYTE *)v204 + 24))
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v196[3]);
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v234[2] = v65;
      v233[3] = CFSTR("container-playlist-version-hash");
      v66 = v218;
      if (*((_BYTE *)v218 + 24) && (v67 = (void *)v212[5]) != 0)
      {
        v68 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 1;
        v66 = v218;
      }
      v234[3] = v67;
      v233[4] = CFSTR("container-is-collaborative-playlist");
      if (*((_BYTE *)v66 + 24))
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v208 + 24));
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v234[4] = v69;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v234, v233, 5);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v236[3] = v70;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v236, v235, 4);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "emitEventType:payload:", CFSTR("container-begin"), v71);

      if (v68)
      if (!v163)

      if (!v60)
      v72 = (void *)v175;
      if (!v175)
      {

        v72 = 0;
      }

      _Block_object_dispose(&v195, 8);
      _Block_object_dispose(&v199, 8);
      _Block_object_dispose(&v203, 8);
      _Block_object_dispose(&v207, 8);
      _Block_object_dispose(&v211, 8);

      _Block_object_dispose(&v217, 8);
      _Block_object_dispose(&v221, 8);

    }
  }
  if ((v169 | v17) == 1)
  {
    objc_msgSend(v8, "modelGenericObject");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "flattenedGenericObject");
    v173 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v173, "anyObject");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "identifiers");
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v173, "type") == 1)
    {
      objc_msgSend(v173, "song");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "isArtistUploadedContent");

    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v8, "durationIfAvailable");
    v78 = v77;
    objc_msgSend(v8, "playbackInfo");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_expectedStartTimeWithPlaybackInfo:", v170);
    v80 = v79;
    objc_msgSend(v8, "_expectedStopTimeWithPlaybackInfo:", v170);
    v82 = v81;
    objc_msgSend(v183, "eventStream");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v8, "isPlaceholder");
    v84 = CFSTR("item-begin");
    if (v83)
      v84 = CFSTR("item-placeholder-begin");
    v137 = v84;
    v231[0] = CFSTR("queue-section-id");
    objc_msgSend(v8, "queueSectionID");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v232[0] = v149;
    v231[1] = CFSTR("queue-item-id");
    objc_msgSend(v8, "queueItemID");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v232[1] = v148;
    v231[2] = CFSTR("item-kind");
    objc_msgSend(v176, "modelKind");
    v85 = objc_claimAutoreleasedReturnValue();
    v151 = (void *)v85;
    if (!v85)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v85 = objc_claimAutoreleasedReturnValue();
    }
    v133 = (void *)v85;
    v232[2] = v85;
    v231[3] = CFSTR("item-ids");
    v86 = (uint64_t)v176;
    if (!v176)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v86 = objc_claimAutoreleasedReturnValue();
    }
    v132 = (void *)v86;
    v232[3] = v86;
    v231[4] = CFSTR("item-metadata");
    v229[0] = CFSTR("item-duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v78);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v230[0] = v147;
    v229[1] = CFSTR("item-title");
    objc_msgSend(v8, "mainTitle");
    v87 = objc_claimAutoreleasedReturnValue();
    v168 = (void *)v87;
    if (!v87)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v87 = objc_claimAutoreleasedReturnValue();
    }
    v131 = (void *)v87;
    v230[1] = v87;
    v229[2] = CFSTR("item-has-video");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v8, "type") == 2);
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v230[2] = v146;
    v229[3] = CFSTR("item-initial-position");
    objc_msgSend(v8, "lastMetadataChangeTime");
    v150 = objc_claimAutoreleasedReturnValue();
    v88 = v150;
    if (v150)
    {
      v136 = 0;
    }
    else
    {
      objc_msgSend(v8, "initialPlaybackStartTime");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (uint64_t)v118;
      if (v118)
      {
        v136 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v118 = 0;
        v136 = 1;
        v88 = objc_claimAutoreleasedReturnValue();
      }
    }
    v135 = (void *)v88;
    v230[3] = v88;
    v229[4] = CFSTR("item-start-boundary");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v80);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v230[4] = v145;
    v229[5] = CFSTR("item-end-boundary");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v82);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v230[5] = v144;
    v229[6] = CFSTR("item-artist-uploaded");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v76);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v230[6] = v143;
    v229[7] = CFSTR("item-is-start-item");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isStartItem"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v230[7] = v142;
    v229[8] = CFSTR("item-is-placeholder");
    v141 = objc_msgSend(v8, "isPlaceholder");
    if ((v141 & 1) != 0)
    {
      v89 = MEMORY[0x24BDBD1C8];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v89 = objc_claimAutoreleasedReturnValue();
    }
    v134 = (void *)v89;
    v230[8] = v89;
    v229[9] = CFSTR("requires-mpaf");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v184, "shouldReportPlayEventsToStore"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v230[9] = v140;
    v229[10] = CFSTR("uses-bookmarking");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "usesBookmarking"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v230[10] = v139;
    v229[11] = CFSTR("explicit-treatment");
    objc_msgSend(v8, "explicitBadge");
    v90 = objc_claimAutoreleasedReturnValue();
    v166 = (void *)v90;
    if (!v90)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v90 = objc_claimAutoreleasedReturnValue();
    }
    v130 = (void *)v90;
    v230[11] = v90;
    v229[12] = CFSTR("podcast-store-id");
    objc_msgSend(v8, "podcastStoreID");
    v91 = objc_claimAutoreleasedReturnValue();
    v164 = (void *)v91;
    if (!v91)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v91 = objc_claimAutoreleasedReturnValue();
    }
    v129 = (void *)v91;
    v230[12] = v91;
    v229[13] = CFSTR("podcast-feed-url");
    objc_msgSend(v8, "podcastFeedURL");
    v92 = objc_claimAutoreleasedReturnValue();
    v153 = (void *)v92;
    if (!v92)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v92 = objc_claimAutoreleasedReturnValue();
    }
    v128 = (void *)v92;
    v230[13] = v92;
    v229[14] = CFSTR("podcast-asset-url");
    objc_msgSend(v8, "podcastAssetURL");
    v93 = objc_claimAutoreleasedReturnValue();
    v162 = (void *)v93;
    if (!v93)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v93 = objc_claimAutoreleasedReturnValue();
    }
    v127 = (void *)v93;
    v230[14] = v93;
    v229[15] = CFSTR("podcast-item-type");
    objc_msgSend(v8, "podcastItemType");
    v94 = objc_claimAutoreleasedReturnValue();
    v161 = (void *)v94;
    if (!v94)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v94 = objc_claimAutoreleasedReturnValue();
    }
    v126 = (void *)v94;
    v230[15] = v94;
    v229[16] = CFSTR("podcast-media-type");
    objc_msgSend(v8, "podcastMediaType");
    v95 = objc_claimAutoreleasedReturnValue();
    v160 = (void *)v95;
    if (!v95)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v95 = objc_claimAutoreleasedReturnValue();
    }
    v125 = (void *)v95;
    v230[16] = v95;
    v229[17] = CFSTR("podcast-price-type");
    objc_msgSend(v8, "podcastPriceType");
    v96 = objc_claimAutoreleasedReturnValue();
    v152 = (void *)v96;
    if (!v96)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v96 = objc_claimAutoreleasedReturnValue();
    }
    v124 = (void *)v96;
    v230[17] = v96;
    v229[18] = CFSTR("podcast-content-guid");
    objc_msgSend(v8, "podcastContentGUID");
    v97 = objc_claimAutoreleasedReturnValue();
    v158 = (void *)v97;
    if (!v97)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v97 = objc_claimAutoreleasedReturnValue();
    }
    v123 = (void *)v97;
    v230[18] = v97;
    v229[19] = CFSTR("podcast-subscription-state");
    objc_msgSend(v8, "podcastSubscriptionState");
    v98 = objc_claimAutoreleasedReturnValue();
    v156 = (void *)v98;
    if (!v98)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v98 = objc_claimAutoreleasedReturnValue();
    }
    v122 = (void *)v98;
    v230[19] = v98;
    v229[20] = CFSTR("podcast-news-subscription-information");
    objc_msgSend(v8, "newsSubscriptionInformation");
    v99 = objc_claimAutoreleasedReturnValue();
    v154 = (void *)v99;
    if (!v99)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v99 = objc_claimAutoreleasedReturnValue();
    }
    v121 = (void *)v99;
    v230[20] = v99;
    v229[21] = CFSTR("podcast-music-subscription-information");
    objc_msgSend(v8, "musicSubscriptionInformation");
    v100 = objc_claimAutoreleasedReturnValue();
    v101 = (void *)v100;
    if (!v100)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v100 = objc_claimAutoreleasedReturnValue();
    }
    v120 = (void *)v100;
    v230[21] = v100;
    v229[22] = CFSTR("podcast-subscribable");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "podcastIsSubscribable"));
    v102 = objc_claimAutoreleasedReturnValue();
    v103 = (void *)v102;
    if (!v102)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v102 = objc_claimAutoreleasedReturnValue();
    }
    v119 = (void *)v102;
    v230[22] = v102;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v230, v229, 23);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v232[4] = v104;
    v231[5] = CFSTR("item-start-position");
    objc_msgSend(v8, "initialPlaybackStartTime");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105;
    if (!v105)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v232[5] = v106;
    v231[6] = CFSTR("radio-track-info");
    objc_msgSend(v184, "trackInfoData");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v107;
    if (!v107)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v232[6] = v108;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v232, v231, 7);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "emitEventType:payload:", v137, v109);

    if (!v107)
    if (!v105)

    if (!v103)
    if (!v101)

    if (!v154)
    if (!v156)

    if (!v158)
    if (!v152)

    if (!v160)
    if (!v161)

    if (!v162)
    if (!v153)

    if (!v164)
    if (!v166)

    if ((v141 & 1) == 0)
    if (v136)

    v110 = (void *)v150;
    if (!v150)
    {

      v110 = 0;
    }

    if (!v168)
    if (!v176)

    v111 = v151;
    if (!v151)
    {

      v111 = 0;
    }

  }
  if (v178)
  {
    objc_msgSend(v183, "eventStream");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v227[0] = CFSTR("queue-section-id");
    objc_msgSend(v8, "queueSectionID");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v228[0] = v113;
    v227[1] = CFSTR("queue-item-id");
    objc_msgSend(v8, "queueItemID");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v228[1] = v114;
    v227[2] = CFSTR("item-timed-metadata");
    objc_msgSend(v184, "jingleTimedMetadata");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v115;
    if (!v115)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v228[2] = v116;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v228, v227, 3);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "emitEventType:payload:", CFSTR("item-timed-metadata-ping"), v117);

    if (!v115)
  }

}

- (MPCPlaybackEngineEventStream)eventStream
{
  void *v2;
  void *v3;

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MPCPlaybackEngineEventStream *)v3;
}

- (MPCQueueControllerUpNextBehavior)upNextBehavior
{
  MPCQueueControllerBehaviorImplementation *behaviorImpl;

  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A98C00))behaviorImpl = self->_behaviorImpl;
  else
    behaviorImpl = 0;
  return behaviorImpl;
}

- (MPCQueueControllerBehaviorMusicSharePlay)musicSharePlay
{
  MPCQueueControllerBehaviorImplementation *behaviorImpl;

  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254ABC6B8))behaviorImpl = self->_behaviorImpl;
  else
    behaviorImpl = 0;
  return behaviorImpl;
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (NSString)revisionString
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_coderVersions, "objectForKeyedSubscript:", CFSTR("behavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("behavior=%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)didRestoreVersion:(int64_t)a3 forSegment:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coderVersions, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)_currentItemDidChangeFromItem:(id)a3 toItem:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double lastSavedTime;
  id v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentItemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138544130;
    v34 = v10;
    v35 = 2114;
    v36 = v11;
    v37 = 2114;
    v38 = v12;
    v39 = 2114;
    v40 = v13;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | emitting events for item change", (uint8_t *)&v33, 0x2Au);

  }
  -[MPCQueueController _emitEventsForItemChangeFromItem:toCurrentItem:](self, "_emitEventsForItemChangeFromItem:toCurrentItem:", v6, v7);
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentItemID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138544130;
    v34 = v15;
    v35 = 2114;
    v36 = v16;
    v37 = 2114;
    v38 = v17;
    v39 = 2114;
    v40 = v18;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | updating current item", (uint8_t *)&v33, 0x2Au);

  }
  -[MPAVItem setObserver:](self->_currentItem, "setObserver:", 0);
  objc_storeStrong((id *)&self->_currentItem, a4);
  -[MPAVItem setObserver:](self->_currentItem, "setObserver:", self);
  if (v6
    && objc_msgSend(v6, "isPlaceholder")
    && -[MPCQueueControllerBehaviorImplementation playbackPositionRestorationPolicy](self->_behaviorImpl, "playbackPositionRestorationPolicy") == 1)
  {
    objc_msgSend(v7, "initialPlaybackStartTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    self->_lastSavedTime = v20;

    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentItemID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentItemID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      lastSavedTime = self->_lastSavedTime;
      v33 = 138544386;
      v34 = v22;
      v35 = 2114;
      v36 = v23;
      v37 = 2114;
      v38 = v24;
      v39 = 2114;
      v40 = v25;
      v41 = 2048;
      v42 = lastSavedTime;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _currentItemDidChangeFromItem:%{public}@ toItem:%{public}@ | updating saved time [item changed] lastSavedTime=%f", (uint8_t *)&v33, 0x34u);

    }
  }
  -[MPCQueueController _updateQueueIndexForItemIfNeeded:](self, "_updateQueueIndexForItemIfNeeded:", self->_currentItem);
  objc_msgSend(v6, "contentItemID");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "hasPrefix:", CFSTR("⏳")))
  {

LABEL_14:
    v27 = 0;
LABEL_15:
    v29 = 0;
    goto LABEL_16;
  }
  v28 = objc_msgSend(v27, "hasPrefix:", CFSTR("♻️"));

  if (v28)
    goto LABEL_14;
  if (!v27)
    goto LABEL_15;
  -[MPCQueueControllerBehaviorImplementation componentsForContentItemID:](self->_behaviorImpl, "componentsForContentItemID:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  objc_msgSend(v7, "contentItemID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[MPCQueueControllerBehaviorImplementation componentsForContentItemID:](self->_behaviorImpl, "componentsForContentItemID:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v32 = objc_msgSend(v29, "behaviorFlags");
  if (v32 != objc_msgSend(v31, "behaviorFlags"))
    -[MPCQueueControllerBehaviorImplementation activeItemFlagsDidChange:](self->_behaviorImpl, "activeItemFlagsDidChange:", objc_msgSend(v31, "behaviorFlags"));
  -[MPCQueueControllerBehaviorImplementation currentItemDidChangeFromContentItemID:toContentItemID:](self->_behaviorImpl, "currentItemDidChangeFromContentItemID:toContentItemID:", v27, v30);
  -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("metadata"));

}

- (id)_itemForContentItemID:(id)a3 allowReuse:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  MPAVItem *v9;
  id v10;
  int v11;
  void *v12;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  int v17;
  id WeakRetained;
  NSObject *v19;
  void *v20;
  void *v21;
  double lastSavedTime;
  void *v23;
  NSString *restoreLastStartTimePositionToContentItemID;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_10;
  }
  if (v4)
  {
    -[MPAVItem contentItemID](self->_currentItem, "contentItemID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v6);

    if (v8)
    {
      v9 = self->_currentItem;
      goto LABEL_10;
    }
  }
  v10 = v6;
  if (objc_msgSend(v10, "hasPrefix:", CFSTR("⏳")))
  {

LABEL_9:
    v9 = (MPAVItem *)objc_opt_new();
    -[MPCQueueController sessionID](self, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVItem setContentItemID:queueSectionID:queueItemID:](v9, "setContentItemID:queueSectionID:queueItemID:", v10, CFSTR("QC"), v12);

    goto LABEL_10;
  }
  v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("♻️"));

  if (v11)
    goto LABEL_9;
  -[MPCQueueControllerBehaviorImplementation _itemForContentItemID:](self->_behaviorImpl, "_itemForContentItemID:", v10);
  v9 = (MPAVItem *)objc_claimAutoreleasedReturnValue();
  -[MPCQueueController _updateQueueIndexForItemIfNeeded:](self, "_updateQueueIndexForItemIfNeeded:", v9);
  if (-[MPCQueueControllerBehaviorImplementation playbackPositionRestorationPolicy](self->_behaviorImpl, "playbackPositionRestorationPolicy") == 1&& self->_lastSavedTime > 0.0)
  {
    -[MPAVItem contentItemID](v9, "contentItemID");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_restoreLastStartTimePositionToContentItemID;
    if (v14 == v15)
    {

    }
    else
    {
      v16 = v15;
      v17 = -[NSString isEqual:](v14, "isEqual:", v15);

      if (!v17)
        goto LABEL_10;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      lastSavedTime = self->_lastSavedTime;
      v25 = 138544130;
      v26 = v20;
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v10;
      v31 = 2048;
      v32 = lastSavedTime;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _itemForContentItemID:%{public}@ | restoring time [id matches last saved time ID] lastSavedTime=%g", (uint8_t *)&v25, 0x2Au);

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastSavedTime);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAVItem setInitialPlaybackStartTimeOverride:](v9, "setInitialPlaybackStartTimeOverride:", v23);

    restoreLastStartTimePositionToContentItemID = self->_restoreLastStartTimePositionToContentItemID;
    self->_restoreLastStartTimePositionToContentItemID = 0;

    self->_lastSavedTime = 0.0;
  }
LABEL_10:

  return v9;
}

- (NSString)sessionID
{
  return (NSString *)-[MPCQueueControllerBehaviorImplementation sessionID](self->_behaviorImpl, "sessionID");
}

- (void)_updateQueueIndexForItemIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  int64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "isRadioItem") & 1) == 0
    && (objc_msgSend((id)objc_opt_class(), "isPlaceholder") & 1) == 0)
  {
    objc_msgSend(v5, "contentItemID");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_targetContentItemID;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = -[NSString isEqual:](v6, "isEqual:", v7);

      if (!v9)
        goto LABEL_21;
    }
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v11 = os_signpost_id_generate(v10);

    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v25) = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "qc:_updateContentItemQueueIndexForItem", ", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v5, "contentItemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MPCQueueController displayIndexForContentItemID:](self, "displayIndexForContentItemID:", v14);

    v16 = -[MPCQueueController displayItemCount](self, "displayItemCount");
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE65868]);

    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE65820]);

    }
    if (objc_msgSend(v17, "count"))
    {
      v20 = objc_alloc(MEMORY[0x24BDDCAA8]);
      objc_msgSend(v5, "contentItemID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v20, "initWithIdentifier:", v21);

      objc_msgSend(v22, "setNowPlayingInfo:", v17);
    }
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v24 = v23;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = 134218240;
      v26 = v15;
      v27 = 2048;
      v28 = v16;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v24, OS_SIGNPOST_INTERVAL_END, v11, "qc:_updateContentItemQueueIndexForItem", "index=%ld count=%ld", (uint8_t *)&v25, 0x16u);
    }

  }
LABEL_21:

}

- (int64_t)displayItemCount
{
  void *v2;
  int64_t v3;

  -[MPCQueueController upNextBehavior](self, "upNextBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayItemCount");

  return v3;
}

- (MPCQueueControllerBehaviorImplementation)behaviorImpl
{
  return self->_behaviorImpl;
}

- (void)incrementVersionForSegment:(id)a3
{
  void *v4;
  NSMutableDictionary *coderVersions;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDD16E0];
  coderVersions = self->_coderVersions;
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](coderVersions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_coderVersions, "setObject:forKeyedSubscript:", v8, v6);

  -[MPCQueueController delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queueController:didIncrementVersionForSegment:", self, v6);

}

- (MPCQueueControllerDelegate)delegate
{
  return (MPCQueueControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (void)registerPublisher:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[_MPCQueueControllerRegistry shared](_MPCQueueControllerRegistry, "shared");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v3);

}

- (NSString)playerID
{
  void *v2;
  void *v3;

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

uint64_t __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "engineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] finalizeStateRestorationWithLoadingItemReady:… | clearing loading content item", (uint8_t *)&v9, 0x16u);

  }
  if (!*(_QWORD *)(a1 + 48))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 7;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queueController:didChangeTargetContentItemID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (int64_t)targetContentItemSource
{
  if (self->_loadingContentItemID)
    return 100;
  else
    return self->_targetContentItemSource;
}

- (id)itemForContentItemID:(id)a3
{
  return -[MPCQueueController _itemForContentItemID:allowReuse:](self, "_itemForContentItemID:allowReuse:", a3, 1);
}

- (MPAVItem)currentItem
{
  return self->_currentItem;
}

- (void)playerItemDidBecomeCurrent:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] playerItemDidBecomeCurrent:%{public}@", (uint8_t *)&v10, 0x20u);

  }
  if (-[MPCQueueController _playerItemDidBecomeActiveWithContentItemID:](self, "_playerItemDidBecomeActiveWithContentItemID:", v5))
  {
    -[MPCQueueController _currentItemDidChangeFromItem:toItem:](self, "_currentItemDidChangeFromItem:toItem:", self->_currentItem, v4);
  }

}

- (BOOL)_playerItemDidBecomeActiveWithContentItemID:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *loadingContentItemID;
  int64_t syncResetAttempts;
  int64_t v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int64_t v25;
  int64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  -[MPCQueueController targetContentItemID](self, "targetContentItemID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v5)
  {

  }
  else
  {
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (!v8)
    {
      -[MPCQueueController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_loadingContentItemID)
      {
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "engineID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self, "sessionID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          loadingContentItemID = self->_loadingContentItemID;
          syncResetAttempts = self->_syncResetAttempts;
          *(_DWORD *)buf = 138544386;
          v35 = v11;
          v36 = 2114;
          v37 = v12;
          v38 = 2114;
          v39 = v5;
          v40 = 2114;
          v41 = loadingContentItemID;
          v42 = 2048;
          v43 = syncResetAttempts;
          _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | resetting player [unexpected transition, loading] expectedNextTargetID=%{public}@ attempts=%ld", buf, 0x34u);

        }
        v15 = self->_syncResetAttempts;
        self->_syncResetAttempts = v15 + 1;
        if (v15 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1006, CFSTR("MF did not synchronize within 5 resets: %@ != %@"), v5, self->_loadingContentItemID);

        }
        objc_msgSend(v9, "queueController:didDetectMismatchForActiveContentItemID:targetContentItemID:", self, v5, self->_loadingContentItemID);
        v16 = 0;
        goto LABEL_25;
      }
      v33 = 0;
      -[MPCQueueController contentItemIDWithCurrentItemOffset:mode:didReachEnd:](self, "contentItemIDWithCurrentItemOffset:mode:didReachEnd:", v5 != 0, 3, &v33);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20 == v5)
      {

      }
      else
      {
        v21 = objc_msgSend(v5, "isEqual:", v20);

        if (!v21)
        {
          v22 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(WeakRetained, "engineID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MPCQueueController sessionID](self, "sessionID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = self->_syncResetAttempts;
            *(_DWORD *)buf = 138544386;
            v35 = v23;
            v36 = 2114;
            v37 = v24;
            v38 = 2114;
            v39 = v5;
            v40 = 2114;
            v41 = (NSString *)v20;
            v42 = 2048;
            v43 = v25;
            _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | resetting player [unexpected transition] expectedNextTargetID=%{public}@ attempts=%ld", buf, 0x34u);

          }
          v26 = self->_syncResetAttempts;
          self->_syncResetAttempts = v26 + 1;
          if (v26 >= 4)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1022, CFSTR("MF did not synchronize within 5 resets: %@ != %@"), v5, v20);

          }
          objc_msgSend(v9, "queueController:didDetectMismatchForActiveContentItemID:targetContentItemID:", self, v5, v20);
          v16 = v33 != 0;
LABEL_24:

LABEL_25:
          goto LABEL_26;
        }
      }
      v27 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "engineID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPCQueueController sessionID](self, "sessionID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v28;
        v36 = 2114;
        v37 = v29;
        v38 = 2114;
        v39 = v5;
        _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | updating target [expected natural transition]", buf, 0x20u);

      }
      -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v5, 3);
      self->_syncResetAttempts = 0;
      v16 = 1;
      goto LABEL_24;
    }
  }
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v18;
    v36 = 2114;
    v37 = v19;
    v38 = 2114;
    v39 = v5;
    v40 = 2114;
    v41 = (NSString *)v7;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _playerItemDidBecomeActiveWithContentItemID:%{public}@ | achieved sync [] targetItemID=%{public}@", buf, 0x2Au);

  }
  self->_syncResetAttempts = 0;
  v16 = 1;
LABEL_26:

  return v16;
}

- (NSString)targetContentItemID
{
  NSString *loadingContentItemID;

  loadingContentItemID = self->_loadingContentItemID;
  if (!loadingContentItemID)
    loadingContentItemID = self->_targetContentItemID;
  return loadingContentItemID;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didConnectToPlaybackEngine:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("session-id");
  -[MPCQueueController sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("behavior-type");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[MPCQueueController behaviorType](self, "behaviorType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEventType:payload:", CFSTR("session-begin"), v7);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPCQueueControllerBehaviorImplementation didConnectToHost:](self->_behaviorImpl, "didConnectToHost:", self);
  if (self->_currentItem)
    -[MPCQueueController _emitEventsForItemChangeFromItem:toCurrentItem:](self, "_emitEventsForItemChangeFromItem:toCurrentItem:", 0);
}

void __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_3;
  v6[3] = &unk_24CAB7B40;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (MPCQueueController)initWithCoder:(id)a3
{
  id v5;
  MPCQueueController *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _MPCQueueControllerBehaviorMusic *v10;
  MPCQueueController *v11;
  MPCQueueControllerBehaviorImplementation *v12;
  _MPCQueueControllerBehaviorMusic *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  uint64_t v20;
  NSString *targetContentItemID;
  double v22;
  void *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  MPCQueueController *v30;
  _QWORD v31[4];
  MPCQueueController *v32;

  v5 = a3;
  v6 = -[MPCQueueController init](self, "init");
  if (!v6)
    goto LABEL_19;
  v7 = objc_msgSend(v5, "containsValueForKey:", CFSTR("bet"));
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("bet"));
    v6->_behaviorType = v9;
    if (v9 == 4)
    {
      v14 = (void *)MEMORY[0x24BDBCF20];
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    }
    else
    {
      if (v9 != 2)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPCQueueController.m"), 439, CFSTR("Attempt to decode unsupported behaviorType: %lld"), v6->_behaviorType);
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0, v27, v28);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v17, CFSTR("be"));
    v18 = objc_claimAutoreleasedReturnValue();
    behaviorImpl = v6->_behaviorImpl;
    v6->_behaviorImpl = (MPCQueueControllerBehaviorImplementation *)v18;

LABEL_10:
    if (!v6->_behaviorImpl)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPCQueueController.m"), 443, CFSTR("Failed to decode behaviorImpl"));

    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tci"));
    v20 = objc_claimAutoreleasedReturnValue();
    targetContentItemID = v6->_targetContentItemID;
    v6->_targetContentItemID = (NSString *)v20;

    v6->_targetContentItemSource = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("tcis"));
    goto LABEL_13;
  }
  v10 = -[_MPCQueueControllerBehaviorMusic initWithSessionID:]([_MPCQueueControllerBehaviorMusic alloc], "initWithSessionID:", 0);
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __36__MPCQueueController_initWithCoder___block_invoke;
  v31[3] = &unk_24CAB6620;
  v11 = v6;
  v32 = v11;
  -[_MPCQueueControllerBehaviorMusic restoreWithSharedCoder:block:](v10, "restoreWithSharedCoder:block:", v5, v31);
  v11->_behaviorType = 2;
  v12 = v11->_behaviorImpl;
  v11->_behaviorImpl = (MPCQueueControllerBehaviorImplementation *)v10;
  v13 = v10;

LABEL_13:
  if (v6->_targetContentItemID && objc_msgSend(v5, "containsValueForKey:", CFSTR("lst")))
  {
    objc_storeStrong((id *)&v6->_restoreLastStartTimePositionToContentItemID, v6->_targetContentItemID);
    objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("lst"));
    v6->_lastSavedTime = v22;
  }
  -[MPCQueueControllerBehaviorImplementation sessionID](v6->_behaviorImpl, "sessionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MPCQueueController.m"), 464, CFSTR("behaviorImpl must have sessionID: %@"), v6->_behaviorImpl);

  }
  -[MPCQueueControllerBehaviorImplementation connectToHost:](v6->_behaviorImpl, "connectToHost:", v6);
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __36__MPCQueueController_initWithCoder___block_invoke_2;
  v29[3] = &unk_24CAB65F8;
  v30 = v6;
  -[MPCQueueController _withExternalSyncBehavior:](v30, "_withExternalSyncBehavior:", v29);

LABEL_19:
  return v6;
}

- (void)willConnectToPlaybackEngine:(id)a3
{
  MPCQueueControllerPlaybackEngine **p_playbackEngine;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  p_playbackEngine = &self->_playbackEngine;
  v5 = a3;
  objc_storeWeak((id *)p_playbackEngine, v5);
  objc_msgSend(v5, "addEngineObserver:", self);
  -[MPCQueueControllerBehaviorImplementation connectToHost:](self->_behaviorImpl, "connectToHost:", self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__MPCQueueController_willConnectToPlaybackEngine___block_invoke;
  v8[3] = &unk_24CAB65F8;
  v8[4] = self;
  -[MPCQueueController _withExternalSyncBehavior:](self, "_withExternalSyncBehavior:", v8);
  -[MPCQueueController music](self, "music");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostingSharedSessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHostingSharedSessionID:reason:", v7, CFSTR("Local Session Setup [continuing GroupSession]"));
}

- (MPCQueueController)init
{
  MPCQueueController *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *coderVersions;
  uint64_t v6;
  NSMapTable *activeEdits;
  MPCQueueController *v8;
  _QWORD v10[5];
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)MPCQueueController;
  v2 = -[MPCQueueController init](&v11, sel_init);
  if (v2)
  {
    v12[0] = CFSTR("behavior");
    v12[1] = CFSTR("metadata");
    v13[0] = &unk_24CB16D70;
    v13[1] = &unk_24CB16D70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");
    coderVersions = v2->_coderVersions;
    v2->_coderVersions = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    activeEdits = v2->_activeEdits;
    v2->_activeEdits = (NSMapTable *)v6;

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __26__MPCQueueController_init__block_invoke;
    v10[3] = &unk_24CAB7248;
    v10[4] = v2;
    v8 = v2;
    v8->_stateHandle = __26__MPCQueueController_init__block_invoke((uint64_t)v10);

  }
  return v2;
}

uint64_t __26__MPCQueueController_init__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  id v4;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v1 = MEMORY[0x24BDAC9B8];
  objc_copyWeak(&v4, &location);
  v2 = MSVLogAddStateHandler();
  objc_destroyWeak(&v4);

  objc_destroyWeak(&location);
  return v2;
}

- (void)_withExternalSyncBehavior:(id)a3
{
  void (**v4)(id, MPCQueueControllerBehaviorImplementation *);

  v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254ABC790))v4[2](v4, self->_behaviorImpl);

}

- (void)finalizeStateRestorationWithLoadingItemReady:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  NSString *v12;
  void *loadingContentItemID;
  NSString **p_loadingContentItemID;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSString *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  MPCQueueController *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  NSString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__18041;
  v34 = __Block_byref_object_dispose__18042;
  v35 = 0;
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke;
  v25 = &unk_24CAB66B0;
  v29 = &v30;
  v26 = self;
  v9 = WeakRetained;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  if (-[MPCQueueController _withRestorableBehavior:](self, "_withRestorableBehavior:", &v22))
  {
    v11 = (void *)v31[5];
    if (v11)
    {
      v12 = v11;
      p_loadingContentItemID = &self->_loadingContentItemID;
      loadingContentItemID = self->_loadingContentItemID;
      self->_loadingContentItemID = v12;
    }
    else
    {
      -[MPCQueueController sessionID](self, "sessionID", v22, v23, v24, v25, v26, v27);
      loadingContentItemID = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("♻️-"), "stringByAppendingString:", loadingContentItemID);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      p_loadingContentItemID = &self->_loadingContentItemID;
      v17 = self->_loadingContentItemID;
      self->_loadingContentItemID = v16;

    }
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "engineID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *p_loadingContentItemID;
      *(_DWORD *)buf = 138543874;
      v37 = v19;
      v38 = 2114;
      v39 = v20;
      v40 = 2114;
      v41 = v21;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] finalizeStateRestorationWithLoadingItemReady:… | updating loading content item [] loadingContentItemID=%{public}@", buf, 0x20u);

    }
    v6[2](v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 59, CFSTR("State restoration is not supported"), v22, v23, v24, v25, v26, v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v15);

  }
  _Block_object_dispose(&v30, 8);

}

- (BOOL)_withRestorableBehavior:(id)a3
{
  void (**v4)(id, MPCQueueControllerBehaviorImplementation *);
  int v5;

  v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  v5 = -[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A989B0);
  if (v5)
    v4[2](v4, self->_behaviorImpl);

  return v5;
}

void __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v10[0] = MEMORY[0x24BDAC760];
  v10[2] = __78__MPCQueueController_finalizeStateRestorationWithLoadingItemReady_completion___block_invoke_2;
  v10[3] = &unk_24CAB9CA8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(v4 + 56);
  v10[1] = 3221225472;
  v10[4] = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  objc_msgSend(a2, "finalizeStateRestorationWithTargetContentItemID:completion:", v6, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

+ (id)describePlayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDDCAC8], "infoCenterForPlayerID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queueController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("# Player: %@\n\n"), v3);
        objc_msgSend(v7, "debugDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v9);
      }
      else
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Unexpected queueController class found: %@"), v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No queue controller for %@"), v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No player found for %@"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (MPCQueueController)initWithBehaviorType:(int64_t)a3 sessionID:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  MPCQueueController *v10;
  MPCQueueController *v11;

  v6 = a4;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      objc_opt_class();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 5:
      v8 = (id)__testBehaviorClass;
LABEL_4:
      v7 = (objc_class *)v8;
      break;
    default:
      v7 = 0;
      break;
  }
  v9 = (void *)objc_msgSend([v7 alloc], "initWithSessionID:", v6);
  v10 = -[MPCQueueController init](self, "init");
  v11 = v10;
  if (v10)
  {
    v10->_behaviorType = a3;
    objc_storeStrong((id *)&v10->_behaviorImpl, v9);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x212BD20AC](self->_stateHandle, a2);
  v3.receiver = self;
  v3.super_class = (Class)MPCQueueController;
  -[MPCQueueController dealloc](&v3, sel_dealloc);
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("## QueueController <%p>\n"), self);
  -[MPCQueueController _stateDictionaryIncludingQueue:](self, "_stateDictionaryIncludingQueue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 11, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);

  return (NSString *)v3;
}

- (BOOL)containsRestorableContent
{
  BOOL v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (self->_loadingContentItemID)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__MPCQueueController_containsRestorableContent__block_invoke;
  v4[3] = &unk_24CAB6568;
  v4[4] = &v5;
  -[MPCQueueController _withRestorableBehavior:](self, "_withRestorableBehavior:", v4);
  v2 = *((_BYTE *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)willDisconnectFromPlaybackEngine:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[MPCQueueController music](self, "music");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostingSharedSessionID:reason:", 0, CFSTR("Local Session Teardown [GroupSession will continue]"));

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__MPCQueueController_willDisconnectFromPlaybackEngine___block_invoke;
  v6[3] = &unk_24CAB65F8;
  v6[4] = self;
  -[MPCQueueController _withExternalSyncBehavior:](self, "_withExternalSyncBehavior:", v6);
  -[MPCQueueControllerBehaviorImplementation disconnectFromHost:](self->_behaviorImpl, "disconnectFromHost:", self);
  objc_msgSend(v4, "removeEngineObserver:", self);

  objc_storeWeak((id *)&self->_playbackEngine, 0);
}

- (void)didDisconnectFromPlaybackEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_currentItem)
  {
    objc_storeWeak((id *)&self->_playbackEngine, v4);
    -[MPCQueueController _emitEventsForItemChangeFromItem:toCurrentItem:](self, "_emitEventsForItemChangeFromItem:toCurrentItem:", self->_currentItem, 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MPCQueueControllerBehaviorImplementation didDisconnectFromHost:](self->_behaviorImpl, "didDisconnectFromHost:", self);
  objc_msgSend(v4, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("session-id");
  -[MPCQueueController sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEventType:payload:", CFSTR("session-end"), v7);

  objc_storeWeak((id *)&self->_playbackEngine, 0);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t behaviorType;
  id v5;

  behaviorType = self->_behaviorType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", behaviorType, CFSTR("bet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_behaviorImpl, CFSTR("be"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_targetContentItemID, CFSTR("tci"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_targetContentItemSource, CFSTR("tcis"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("lst"), self->_lastSavedTime);

}

- (id)segmentForCodingKey:(id)a3
{
  if (a3 == CFSTR("be"))
    return CFSTR("behavior");
  else
    return CFSTR("metadata");
}

- (int64_t)versionForSegment:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_coderVersions, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)contentItemIDAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = a3 + 1;
      do
      {
        if (!--v7)
          break;

        objc_msgSend(v5, "nextObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v6);
    }
  }

  return v6;
}

- (id)contentItemIDWithCurrentItemOffset:(int64_t)a3 mode:(int64_t)a4 didReachEnd:(BOOL *)a5
{
  return -[MPCQueueController _contentItemIDWithOffset:fromItemID:mode:didReachEnd:](self, "_contentItemIDWithOffset:fromItemID:mode:didReachEnd:", a3, self->_targetContentItemID, a4, a5);
}

- (void)enumerateContentItemIDsInMode:(int64_t)a3 block:(id)a4
{
  void (**v6)(id, NSString *, _BYTE *);
  NSString *loadingContentItemID;
  NSString *v8;
  _BOOL4 v9;
  void *v10;
  NSString *v11;
  uint64_t v12;
  char v13;

  v6 = (void (**)(id, NSString *, _BYTE *))a4;
  v13 = 0;
  loadingContentItemID = self->_loadingContentItemID;
  if (loadingContentItemID)
    goto LABEL_6;
  v8 = self->_targetContentItemID;
  if (-[NSString hasPrefix:](v8, "hasPrefix:", CFSTR("⏳")))
  {

LABEL_5:
    loadingContentItemID = self->_targetContentItemID;
LABEL_6:
    v6[2](v6, loadingContentItemID, &v13);
    goto LABEL_7;
  }
  v9 = -[NSString hasPrefix:](v8, "hasPrefix:", CFSTR("♻️"));

  if (v9)
    goto LABEL_5;
  if (self->_targetContentItemID)
  {
    -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    do
    {
      v6[2](v6, v11, &v13);
      if (v13)
        break;
      objc_msgSend(v10, "nextObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (NSString *)v12;
    }
    while (v12);

  }
LABEL_7:

}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MPCQueueController music](self, "music");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItemIDWithoutRepeatIteration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (void)performSetQueue:(id)a3 loadingItemReady:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id WeakRetained;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *loadingContentItemID;
  NSString *v20;
  NSString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  MPCQueueController *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  NSString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  behaviorImpl = self->_behaviorImpl;
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke;
  v30 = &unk_24CAB6648;
  v31 = self;
  v13 = WeakRetained;
  v32 = v13;
  v14 = v8;
  v33 = v14;
  v15 = v9;
  v34 = v15;
  -[MPCQueueControllerBehaviorImplementation performLoadCommand:completion:](behaviorImpl, "performLoadCommand:completion:", v14, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    loadingContentItemID = self->_loadingContentItemID;
    self->_loadingContentItemID = v18;
  }
  else
  {
    -[MPCQueueController sessionID](self, "sessionID", v27, v28, v29, v30, v31, v32, v33);
    loadingContentItemID = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("⏳-"), "stringByAppendingString:", loadingContentItemID);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = self->_loadingContentItemID;
    self->_loadingContentItemID = v20;

  }
  v22 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "engineID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "commandID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self->_loadingContentItemID;
    *(_DWORD *)buf = 138544130;
    v36 = v23;
    v37 = 2114;
    v38 = v24;
    v39 = 2114;
    v40 = v25;
    v41 = 2114;
    v42 = v26;
    _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performSetQueue:%{public}@ … | updating loading content item [] loadingContentItemID=%{public}@", buf, 0x2Au);

  }
  v10[2](v10);

}

- (void)performAfterEdits:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSUInteger v11;
  void *v12;
  void *v13;
  void *v14;
  id postEditContinuation;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(_QWORD);
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSUInteger v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  if (-[NSMapTable count](self->_activeEdits, "count"))
  {
    -[NSMapTable objectEnumerator](self->_activeEdits, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "msv_map:", &__block_literal_global_85_18197);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSMapTable count](self->_activeEdits, "count");
      *(_DWORD *)buf = 138544130;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      v28 = 2048;
      v29 = v11;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | storing continuation [%ld edits remain] activeEdits=%{public}@", buf, 0x2Au);

    }
    v12 = _Block_copy(self->_postEditContinuation);
    v13 = v12;
    if (v12)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __40__MPCQueueController_performAfterEdits___block_invoke_86;
      v21[3] = &unk_24CAB7570;
      v22 = v12;
      v23 = v4;
      v14 = _Block_copy(v21);
      postEditContinuation = self->_postEditContinuation;
      self->_postEditContinuation = v14;

      v16 = v22;
    }
    else
    {
      v20 = _Block_copy(v4);
      v16 = self->_postEditContinuation;
      self->_postEditContinuation = v20;
    }

  }
  else
  {
    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      v26 = 2114;
      v27 = v19;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", buf, 0x16u);

    }
    v4[2](v4);
  }

}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  return -[MPCQueueControllerBehaviorImplementation canJumpToContentItemID:reason:](self->_behaviorImpl, "canJumpToContentItemID:reason:", a3, a4);
}

- (void)_setTargetContentItemID:(id)a3 source:(int64_t)a4
{
  NSString *v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSString *targetContentItemID;
  NSString *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (NSString *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("Unknown");
    switch(a4)
    {
      case 0:
        break;
      case 1:
        v11 = CFSTR("StartItem");
        break;
      case 2:
        v11 = CFSTR("UserSelected");
        break;
      case 3:
        v11 = CFSTR("NaturalTransition");
        break;
      case 4:
        v11 = CFSTR("ExternalSync");
        break;
      case 5:
        v11 = CFSTR("Redirect");
        break;
      case 6:
        v11 = CFSTR("QueueBoundary");
        break;
      case 7:
        v11 = CFSTR("Restored");
        break;
      default:
        if (a4 == 100)
        {
          v11 = CFSTR("Loading");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/%ld"), a4);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    *(_DWORD *)buf = 138544130;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] setTargetContentItemID:%{public}@ source:%{public}@ | updating target", buf, 0x2Au);

  }
  targetContentItemID = self->_targetContentItemID;
  self->_targetContentItemID = v6;
  v13 = v6;

  self->_targetContentItemSource = a4;
  -[MPCQueueController _evaluateContextAwareTriggersWithReason:](self, "_evaluateContextAwareTriggersWithReason:", CFSTR("targetItem changed"));
  -[MPCQueueController delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queueController:didChangeTargetContentItemID:", self, v13);

  -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("metadata"));
}

- (void)jumpToContentItemID:(id)a3 direction:(int64_t)a4
{
  id v7;
  id WeakRetained;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  BOOL v14;
  MPCQueueControllerBehaviorImplementation *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const char *v19;
  NSString *targetContentItemID;
  BOOL v21;
  NSString *v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  MPCQueueControllerBehaviorImplementation *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  MPCQueueControllerBehaviorImplementation *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  if ((unint64_t)(a4 + 1) > 6)
    v9 = CFSTR("MPCPlayerDirectionReverseJump");
  else
    v9 = off_24CAB6930[a4 + 1];
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544386;
    v33 = v11;
    v34 = 2114;
    v35 = v12;
    v36 = 2114;
    v37 = v7;
    v38 = 2114;
    v39 = v9;
    v40 = 2114;
    v41 = behaviorImpl;
    _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | validating item [] behavior=%{public}@", buf, 0x34u);

  }
  switch(a4)
  {
    case -2:
    case 2:
      v31 = 0;
      v14 = -[MPCQueueController canJumpToContentItemID:reason:](self, "canJumpToContentItemID:reason:", v7, &v31);
      v15 = (MPCQueueControllerBehaviorImplementation *)v31;
      if (v14)
        goto LABEL_15;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      objc_msgSend(WeakRetained, "engineID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v33 = v17;
      v34 = 2114;
      v35 = v18;
      v36 = 2114;
      v37 = v7;
      v38 = 2114;
      v39 = v9;
      v40 = 2114;
      v41 = v15;
      v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing jump [%{public}@]";
      goto LABEL_21;
    case -1:
      targetContentItemID = self->_targetContentItemID;
      v30 = 0;
      v21 = -[MPCQueueController canPreviousTrackForContentItemID:reason:](self, "canPreviousTrackForContentItemID:reason:", targetContentItemID, &v30);
      v15 = (MPCQueueControllerBehaviorImplementation *)v30;
      if (v21)
        goto LABEL_15;
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      objc_msgSend(WeakRetained, "engineID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v33 = v17;
      v34 = 2114;
      v35 = v18;
      v36 = 2114;
      v37 = v7;
      v38 = 2114;
      v39 = v9;
      v40 = 2114;
      v41 = v15;
      v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing previous [%{public}@]";
      goto LABEL_21;
    case 0:
    case 5:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v15 = (MPCQueueControllerBehaviorImplementation *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueControllerBehaviorImplementation handleFailureInMethod:object:file:lineNumber:description:](v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 781, CFSTR("Unsupported jump direction: %ld"), a4);
      goto LABEL_23;
    case 1:
      v22 = self->_targetContentItemID;
      v29 = 0;
      v23 = -[MPCQueueController canNextTrackForContentItemID:reason:](self, "canNextTrackForContentItemID:reason:", v22, &v29);
      v15 = (MPCQueueControllerBehaviorImplementation *)v29;
      if (v23)
      {
LABEL_15:

LABEL_16:
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "engineID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self, "sessionID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v33 = v25;
          v34 = 2114;
          v35 = v26;
          v36 = 2114;
          v37 = v7;
          v38 = 2114;
          v39 = v9;
          _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | updating target", buf, 0x2Au);

        }
        -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v7, 2);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __52__MPCQueueController_jumpToContentItemID_direction___block_invoke;
        v27[3] = &unk_24CAB65F8;
        v28 = (MPCQueueControllerBehaviorImplementation *)v7;
        -[MPCQueueController _withExternalSyncBehavior:](self, "_withExternalSyncBehavior:", v27);
        v15 = v28;
      }
      else
      {
        v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(WeakRetained, "engineID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self, "sessionID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v33 = v17;
          v34 = 2114;
          v35 = v18;
          v36 = 2114;
          v37 = v7;
          v38 = 2114;
          v39 = v9;
          v40 = 2114;
          v41 = v15;
          v19 = "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ direction:%{public}@ | failing next [%{public}@]";
LABEL_21:
          _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0x34u);

        }
LABEL_22:

      }
LABEL_23:

      return;
    default:
      goto LABEL_16;
  }
}

- (void)jumpToContentItemID:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  MPCQueueControllerBehaviorImplementation *v10;
  char v11;
  MPCQueueControllerBehaviorImplementation *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  MPCQueueControllerBehaviorImplementation *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v6 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544130;
    v23 = v7;
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v4;
    v28 = 2114;
    v29 = behaviorImpl;
    _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | validating item [] behavior=%{public}@", buf, 0x2Au);

  }
  v10 = self->_behaviorImpl;
  v21 = 0;
  v11 = -[MPCQueueControllerBehaviorImplementation canJumpToContentItemID:reason:](v10, "canJumpToContentItemID:reason:", v4, &v21);
  v12 = (MPCQueueControllerBehaviorImplementation *)v21;
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  v14 = v13;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v15;
      v24 = 2114;
      v25 = v16;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | updating target", buf, 0x20u);

    }
    -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v4, 2);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __42__MPCQueueController_jumpToContentItemID___block_invoke;
    v19[3] = &unk_24CAB65F8;
    v20 = v4;
    -[MPCQueueController _withExternalSyncBehavior:](self, "_withExternalSyncBehavior:", v19);
    v14 = v20;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(WeakRetained, "engineID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v23 = v17;
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v4;
    v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[PSYNC:%{public}@:%{public}@] jumpToContentItemID:%{public}@ | failing skip [%{public}@]", buf, 0x2Au);

  }
}

- (void)jumpToFirstContentItemWithSource:(int64_t)a3
{
  id WeakRetained;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  void *v11;
  MPCQueueControllerBehaviorImplementation *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  MPCQueueControllerBehaviorImplementation *v16;
  _QWORD v17[4];
  MPCQueueControllerBehaviorImplementation *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  MPCQueueControllerBehaviorImplementation *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v6 = CFSTR("Unknown");
  switch(a3)
  {
    case 0:
      break;
    case 1:
      v6 = CFSTR("StartItem");
      break;
    case 2:
      v6 = CFSTR("UserSelected");
      break;
    case 3:
      v6 = CFSTR("NaturalTransition");
      break;
    case 4:
      v6 = CFSTR("ExternalSync");
      break;
    case 5:
      v6 = CFSTR("Redirect");
      break;
    case 6:
      v6 = CFSTR("QueueBoundary");
      break;
    case 7:
      v6 = CFSTR("Restored");
      break;
    default:
      if (a3 == 100)
      {
        v6 = CFSTR("Loading");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/%ld"), a3);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    behaviorImpl = self->_behaviorImpl;
    *(_DWORD *)buf = 138544130;
    v20 = v8;
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = behaviorImpl;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToFirstContentItemWithSource:%{public}@ | enumerating behavior from nil [] behavior=%{public}@", buf, 0x2Au);

  }
  -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextObject");
  v12 = (MPCQueueControllerBehaviorImplementation *)objc_claimAutoreleasedReturnValue();
  v13 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = v14;
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] jumpToFirstContentItemWithSource:%{public}@ | updating target [] firstContentItemID=%{public}@", buf, 0x2Au);

  }
  -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v12, a3);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__MPCQueueController_jumpToFirstContentItemWithSource___block_invoke;
  v17[3] = &unk_24CAB65F8;
  v18 = v12;
  v16 = v12;
  -[MPCQueueController _withExternalSyncBehavior:](self, "_withExternalSyncBehavior:", v17);

}

- (void)_withDynamicBehavior:(id)a3
{
  void (**v4)(id, MPCQueueControllerBehaviorImplementation *);

  v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A98D28))v4[2](v4, self->_behaviorImpl);

}

- (void)_withUpNextBehavior:(id)a3
{
  void (**v4)(id, MPCQueueControllerBehaviorImplementation *);

  v4 = (void (**)(id, MPCQueueControllerBehaviorImplementation *))a3;
  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A98C80))v4[2](v4, self->_behaviorImpl);

}

- (MPCQueueControllerBehavior)behavior
{
  return self->_behaviorImpl;
}

- (MPCQueueControllerReusableBehavior)reusableBehavior
{
  MPCQueueControllerBehaviorImplementation *behaviorImpl;

  if (-[MPCQueueControllerBehaviorImplementation conformsToProtocol:](self->_behaviorImpl, "conformsToProtocol:", &unk_254A98E48))behaviorImpl = self->_behaviorImpl;
  else
    behaviorImpl = 0;
  return behaviorImpl;
}

- (id)beginEditWithReason:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  MPCQueueControllerEdit *v10;
  NSMapTable *activeEdits;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  MPCQueueControllerEdit *v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 895, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("-"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[MPCQueueControllerEdit initWithQueueController:label:]([MPCQueueControllerEdit alloc], "initWithQueueController:label:", self, v9);
  if (-[MPCQueueControllerEdit allowsChangingCurrentItem](v10, "allowsChangingCurrentItem"))
    -[NSMutableArray addObject:](self->_potentialCurrentItemEdits, "addObject:", v10);
  activeEdits = self->_activeEdits;
  -[MPCQueueControllerEdit identifier](v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](activeEdits, "setObject:forKey:", v10, v12);

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "engineID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] beginEditWithReason:… | created edit [] edit=%{public}@", buf, 0x20u);

  }
  return v10;
}

- (void)behaviorDidChange
{
  -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("behavior"));
}

- (void)upNextBehaviorDidChange
{
  void *v3;
  void *v4;

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaRemotePublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publishIfNeeded");

  -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("behavior"));
}

- (id)beginExternalSyncEditWithReason:(id)a3
{
  id v5;
  MPCQueueControllerExternalSyncEdit *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  MPCQueueControllerExternalSyncEdit *v11;
  NSMapTable *activeEdits;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  MPCQueueControllerExternalSyncEdit *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 931, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = [MPCQueueControllerExternalSyncEdit alloc];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MPCQueueControllerEdit initWithQueueController:label:](v6, "initWithQueueController:label:", self, v10);

  if (-[MPCQueueControllerEdit allowsChangingCurrentItem](v11, "allowsChangingCurrentItem"))
    -[NSMutableArray addObject:](self->_potentialCurrentItemEdits, "addObject:", v11);
  activeEdits = self->_activeEdits;
  -[MPCQueueControllerEdit identifier](v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](activeEdits, "setObject:forKey:", v11, v13);

  -[MPCQueueController playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "engineID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] beginExternalSyncEditWithReason:… | created edit [] edit=%{public}@", buf, 0x20u);

  }
  return v11;
}

- (void)engine:(id)a3 didReachEndOfQueueWithReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] engine:didReachEndOfQueueWithReason:\"%{public}@\", buf, 0x20u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__MPCQueueController_engine_didReachEndOfQueueWithReason___block_invoke;
  v12[3] = &unk_24CAB66D8;
  v13 = v7;
  v11 = v7;
  -[MPCQueueController _withUpNextBehavior:](self, "_withUpNextBehavior:", v12);
  -[MPCQueueController jumpToFirstContentItemWithSource:](self, "jumpToFirstContentItemWithSource:", 6);

}

- (void)engine:(id)a3 didChangeToState:(unint64_t)a4
{
  id v6;
  MPAVItem *currentItem;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  double lastSavedTime;
  int v15;
  MPCQueueController *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[MPCQueueControllerBehaviorImplementation playbackPositionRestorationPolicy](self->_behaviorImpl, "playbackPositionRestorationPolicy") == 1&& (a4 == 4 || a4 == 2))
  {
    currentItem = self->_currentItem;
    if (currentItem)
    {
      if ((-[MPAVItem isPlaceholder](currentItem, "isPlaceholder") & 1) == 0)
      {
        objc_msgSend(v6, "player");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "currentTime");
        v10 = v9;

        if (self->_lastSavedTime != v10)
        {
          self->_lastSavedTime = v10;
          v11 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = off_24CAB6968[a4 - 2];
            -[MPAVItem contentItemID](self->_currentItem, "contentItemID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            lastSavedTime = self->_lastSavedTime;
            v15 = 134218754;
            v16 = self;
            v17 = 2114;
            v18 = v12;
            v19 = 2114;
            v20 = v13;
            v21 = 2048;
            v22 = lastSavedTime;
            _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "queueController %p: engine:didChangeToState: updating saved time [changed to state %{public}@] currentItem=%{public}@ lastSavedTime=%f", (uint8_t *)&v15, 0x2Au);

          }
          -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("metadata"));
        }
      }
    }
  }

}

- (void)engine:(id)a3 didChangeItemElapsedTime:(double)a4 rate:(float)a5
{
  id v8;
  void *v9;
  char v10;
  MPAVItem *currentItem;
  void *v12;
  void *v13;
  double lastSavedTime;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "disablePeriodicStateRestore");

  if ((v10 & 1) == 0
    && -[MPCQueueControllerBehaviorImplementation playbackPositionRestorationPolicy](self->_behaviorImpl, "playbackPositionRestorationPolicy") == 1)
  {
    currentItem = self->_currentItem;
    if (currentItem)
    {
      if ((-[MPAVItem isPlaceholder](currentItem, "isPlaceholder") & 1) == 0)
      {
        objc_msgSend(v8, "mediaRemotePublisher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "infoCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "playbackState") == 1)
        {
          lastSavedTime = self->_lastSavedTime;

          if (lastSavedTime != a4)
          {
            self->_lastSavedTime = a4;
            v15 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v8, "engineID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPCQueueController sessionID](self, "sessionID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[MPAVItem contentItemID](self->_currentItem, "contentItemID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = 138544386;
              v20 = v16;
              v21 = 2114;
              v22 = v17;
              v23 = 2048;
              v24 = a4;
              v25 = 2048;
              v26 = a5;
              v27 = 2114;
              v28 = v18;
              _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[SNM:%{public}@:%{public}@] engine:didChangeItemElapsedTime:%f rate:%f | updating saved time [engine time changed] activeItemID=%{public}@", (uint8_t *)&v19, 0x34u);

            }
            -[MPCQueueController incrementVersionForSegment:](self, "incrementVersionForSegment:", CFSTR("metadata"));
          }
        }
        else
        {

        }
      }
    }
  }

}

- (void)didSignificantlyChangeItem:(id)a3
{
  if (self->_currentItem == a3)
    -[MPCQueueController _emitEventsForItemChangeFromItem:toCurrentItem:](self, "_emitEventsForItemChangeFromItem:toCurrentItem:", a3, a3);
}

- (void)_evaluateCurrentItemWithEdit:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSString *v15;
  _BOOL4 v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSString *targetContentItemID;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  void *v45;
  const char *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  MPCQueueController *v58;
  id v59;
  NSObject *v60;
  _BOOL4 v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  os_log_t log;
  NSObject *loga;
  os_log_t logb;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  uint8_t buf[4];
  os_log_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  NSString *v82;
  __int16 v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v8 = objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "label");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v76 = v8;
    v77 = 2114;
    v78 = v9;
    v79 = 2114;
    v80 = (uint64_t)v10;
    v81 = 2114;
    v82 = v11;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | committed %{public}@", buf, 0x2Au);

  }
  -[MPCQueueController delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v5;
    objc_msgSend(v13, "targetContentItemID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (NSString *)v14;
      v16 = -[NSString isEqualToString:](self->_targetContentItemID, "isEqualToString:", v14);
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v18)
        {
          objc_msgSend(WeakRetained, "engineID");
          v37 = objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self, "sessionID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v76 = v37;
          v77 = 2114;
          v78 = v38;
          v79 = 2114;
          v80 = (uint64_t)v39;
          v81 = 2114;
          v82 = v15;
          _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [external sync] targetContentItemID=%{public}@", buf, 0x2Au);

        }
        -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v15, 4);
        goto LABEL_31;
      }
      if (!v18)
      {
LABEL_9:

LABEL_31:
        -[NSObject queueControllerDidChangeContents:](v12, "queueControllerDidChangeContents:", self);
LABEL_62:

        goto LABEL_63;
      }
      objc_msgSend(WeakRetained, "engineID");
      v19 = objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v19;
      v77 = 2114;
      v78 = v20;
      v79 = 2114;
      v80 = (uint64_t)v21;
      v81 = 2114;
      v82 = v15;
      v22 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [external sync, c"
            "urrent target valid] targetContentItemID=%{public}@";
LABEL_8:
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, v22, buf, 0x2Au);

      goto LABEL_9;
    }

  }
  objc_msgSend(v5, "suggestedStartingContentItemID");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "allowsChangingCurrentItem") & 1) == 0)
  {
    targetContentItemID = self->_targetContentItemID;
    if (targetContentItemID)
    {
LABEL_21:
      v15 = targetContentItemID;
      if (-[NSString hasPrefix:](v15, "hasPrefix:", CFSTR("⏳")))
      {

      }
      else
      {
        v32 = -[NSString hasPrefix:](v15, "hasPrefix:", CFSTR("♻️"));

        if (!v32)
        {
          if (v15)
          {
            if (-[MPCQueueControllerBehaviorImplementation itemExistsForContentItemID:](self->_behaviorImpl, "itemExistsForContentItemID:", v15))
            {
              v17 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                goto LABEL_9;
              objc_msgSend(WeakRetained, "engineID");
              v19 = objc_claimAutoreleasedReturnValue();
              -[MPCQueueController sessionID](self, "sessionID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v76 = v19;
              v77 = 2114;
              v78 = v20;
              v79 = 2114;
              v80 = (uint64_t)v21;
              v81 = 2114;
              v82 = v15;
              v22 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [current "
                    "target valid] targetContentItemID=%{public}@";
              goto LABEL_8;
            }
            objc_msgSend(v5, "suggestedContentItemIDsForDeletedContentItemIDs");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectForKeyedSubscript:", v15);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              _MPCLogCategoryQueueController();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(WeakRetained, "engineID");
                v71 = objc_claimAutoreleasedReturnValue();
                -[MPCQueueController sessionID](self, "sessionID");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "identifier");
                v51 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v76 = v71;
                v77 = 2114;
                v78 = v50;
                v79 = 2114;
                v80 = v51;
                v52 = (void *)v51;
                v81 = 2114;
                v82 = v15;
                v83 = 2114;
                v84 = v13;
                _os_log_impl(&dword_210BD8000, v49, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 1: current target invalid, edit suggested replacement] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);

              }
              -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v48, 5);
              goto LABEL_61;
            }
          }
LABEL_49:
          -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", v15, 2, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "nextObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (v53)
          {
            if (-[NSString isEqualToString:](v15, "isEqualToString:", v53))
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCQueueController.m"), 1190, CFSTR("Bug in %@: itemExistsForContentItemID returned NO while contentItemIDEnumeratorStartingAfterContentItemID returned the same contentItemID: %@"), objc_opt_class(), v15);

            }
            v54 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(WeakRetained, "engineID");
              log = v12;
              v55 = objc_claimAutoreleasedReturnValue();
              -[MPCQueueController sessionID](self, "sessionID");
              v72 = v48;
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "identifier");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v76 = v55;
              v77 = 2114;
              v78 = v56;
              v79 = 2114;
              v80 = (uint64_t)v57;
              v81 = 2114;
              v82 = v15;
              v83 = 2114;
              v84 = v53;
              _os_log_impl(&dword_210BD8000, v54, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 2: current target invalid, enumerated from invalid item] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);

              v48 = v72;
              v12 = log;
            }

            v58 = self;
            v59 = v53;
          }
          else
          {
            v60 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
            v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
            if (!v13)
            {
              if (v61)
              {
                objc_msgSend(WeakRetained, "engineID");
                logb = (os_log_t)objc_claimAutoreleasedReturnValue();
                -[MPCQueueController sessionID](self, "sessionID");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "identifier");
                v74 = v48;
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v76 = logb;
                v77 = 2114;
                v78 = v65;
                v79 = 2114;
                v80 = (uint64_t)v66;
                v81 = 2114;
                v82 = v15;
                _os_log_impl(&dword_210BD8000, v60, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | queue boundary [prong 4: current target invalid, no replacement found] invalidID=%{public}@", buf, 0x2Au);

                v48 = v74;
              }

              -[NSObject queueControllerDidReachUnexpectedEndOfQueue:](v12, "queueControllerDidReachUnexpectedEndOfQueue:", self);
              goto LABEL_60;
            }
            if (v61)
            {
              objc_msgSend(WeakRetained, "engineID");
              v62 = objc_claimAutoreleasedReturnValue();
              -[MPCQueueController sessionID](self, "sessionID");
              loga = v60;
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "identifier");
              v73 = v48;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v76 = v62;
              v77 = 2114;
              v78 = v63;
              v79 = 2114;
              v80 = (uint64_t)v64;
              v81 = 2114;
              v82 = v15;
              v83 = 2114;
              v84 = v13;
              _os_log_impl(&dword_210BD8000, loga, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [prong 3: current target invalid, edit suggested start item] invalidID=%{public}@ targetContentItemID=%{public}@", buf, 0x34u);

              v48 = v73;
              v60 = loga;

            }
            v58 = self;
            v59 = v13;
          }
          -[MPCQueueController _setTargetContentItemID:source:](v58, "_setTargetContentItemID:source:", v59, 5);
LABEL_60:

LABEL_61:
          goto LABEL_62;
        }
      }
      if (self->_loadingContentItemID)
      {
        v33 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "engineID");
          v34 = objc_claimAutoreleasedReturnValue();
          -[MPCQueueController sessionID](self, "sessionID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v76 = v34;
          v77 = 2114;
          v78 = v35;
          v79 = 2114;
          v80 = (uint64_t)v36;
          v81 = 2114;
          v82 = v15;
          _os_log_impl(&dword_210BD8000, v33, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [targetContentItemID is QC-Placeholder] targetContentItemID=%{public}@", buf, 0x2Au);

        }
        goto LABEL_62;
      }

      v15 = 0;
      goto LABEL_49;
    }
  }
  if (!v13)
  {
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v29 = objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v29;
      v77 = 2114;
      v78 = v30;
      v79 = 2114;
      v80 = (uint64_t)v31;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no suggested start item [edit allows item change]", buf, 0x20u);

    }
    -[NSObject queueControllerDidChangeContents:](v12, "queueControllerDidChangeContents:", self);
    targetContentItemID = self->_targetContentItemID;
    goto LABEL_21;
  }
  if (-[NSString isEqualToString:](self->_targetContentItemID, "isEqualToString:", v13))
  {
    v24 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "engineID");
      v25 = objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v25;
      v77 = 2114;
      v78 = v26;
      v79 = 2114;
      v80 = (uint64_t)v27;
      v81 = 2114;
      v82 = (NSString *)v13;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | no change detected [edit allows item change] targetContentItemID=%{public}@", buf, 0x2Au);

    }
    goto LABEL_44;
  }
  v40 = -[MPCQueueControllerBehaviorImplementation itemExistsForContentItemID:](self->_behaviorImpl, "itemExistsForContentItemID:", v13);
  v41 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (v40)
  {
    if (v42)
    {
      objc_msgSend(WeakRetained, "engineID");
      v43 = objc_claimAutoreleasedReturnValue();
      -[MPCQueueController sessionID](self, "sessionID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v76 = v43;
      v77 = 2114;
      v78 = v44;
      v79 = 2114;
      v80 = (uint64_t)v45;
      v81 = 2114;
      v82 = (NSString *)v13;
      v46 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating target [edit allows item ch"
            "ange] targetContentItemID=%{public}@";
LABEL_42:
      _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, v46, buf, 0x2Au);

    }
  }
  else if (v42)
  {
    objc_msgSend(WeakRetained, "engineID");
    v43 = objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v76 = v43;
    v77 = 2114;
    v78 = v44;
    v79 = 2114;
    v80 = (uint64_t)v45;
    v81 = 2114;
    v82 = (NSString *)v13;
    v46 = "[PSYNC:%{public}@:%{public}@] _evaluateCurrentItemWithEdit:%{public}@ | updating to UNKNOWN target [edit allow"
          "s item change - item does NOT exist] targetContentItemID=%{public}@";
    goto LABEL_42;
  }

  objc_storeStrong((id *)&self->_preferredFirstContentItemID, v13);
  -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v13, 1);
LABEL_44:
  -[NSObject queueControllerDidChangeContents:](v12, "queueControllerDidChangeContents:", self);
LABEL_63:

}

- (void)_commitEdit:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_on_main_queue();

}

- (void)_rollbackEdit:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  msv_dispatch_on_main_queue();

}

- (id)_contentItemIDWithOffset:(int64_t)a3 fromItemID:(id)a4 mode:(int64_t)a5 didReachEnd:(BOOL *)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  int64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  MPCQueueControllerBehaviorImplementation *behaviorImpl;
  BOOL v19;

  v10 = a4;
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  if (!a3)
  {
    v12 = v10;
    goto LABEL_29;
  }
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("⏳")) & 1) != 0
    || (objc_msgSend(v11, "hasPrefix:", CFSTR("♻️")) & 1) != 0)
  {
LABEL_5:
    v12 = 0;
  }
  else
  {
    -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", v11, a5, (unint64_t)a3 >> 63);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (a3 >= 0)
      v14 = a3;
    else
      v14 = -a3;
    v15 = v14 + 1;
    while (1)
    {
      objc_msgSend(v13, "nextObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        break;
      v17 = v16;

      behaviorImpl = self->_behaviorImpl;
      if (a3 < 1)
      {
        if ((-[MPCQueueControllerBehaviorImplementation canPreviousItemFromContentItemID:reason:](behaviorImpl, "canPreviousItemFromContentItemID:reason:", v17, 0) & 1) == 0)
        {
LABEL_20:
          v12 = v17;

          goto LABEL_28;
        }
      }
      else if ((-[MPCQueueControllerBehaviorImplementation canNextItemFromContentItemID:reason:](behaviorImpl, "canNextItemFromContentItemID:reason:", v17, 0) & 1) == 0)
      {
        goto LABEL_20;
      }

      --v15;
      v12 = v17;
      if (v15 <= 1)
      {
        v19 = 0;
        v12 = v17;
        goto LABEL_22;
      }
    }
    if (a3 < 1)
    {
      v19 = 0;
    }
    else
    {

      v12 = 0;
      v19 = 1;
    }
LABEL_22:
    if (a6)
      *a6 = v19;
    if (v12)
      v19 = 1;
    if (!v19)
      v12 = v11;
LABEL_28:

  }
LABEL_29:

  return v12;
}

- (void)_evaluateContextAwareTriggersWithReason:(id)a3
{
  id v5;
  id WeakRetained;
  NSString *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSString *targetContentItemID;
  _QWORD v13[5];
  id v14;
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  v7 = self->_targetContentItemID;
  if (-[NSString hasPrefix:](v7, "hasPrefix:", CFSTR("⏳")))
  {

  }
  else
  {
    v8 = -[NSString hasPrefix:](v7, "hasPrefix:", CFSTR("♻️"));

    if (!v8)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke;
      v13[3] = &unk_24CAB6768;
      v13[4] = self;
      v14 = WeakRetained;
      v15 = v5;
      v16 = a2;
      -[MPCQueueController _withDynamicBehavior:](self, "_withDynamicBehavior:", v13);

      goto LABEL_8;
    }
  }
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "engineID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCQueueController sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    targetContentItemID = self->_targetContentItemID;
    *(_DWORD *)buf = 138544130;
    v18 = v10;
    v19 = 2114;
    v20 = v11;
    v21 = 2114;
    v22 = v5;
    v23 = 2114;
    v24 = targetContentItemID;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:%{public}@ | skipping [targetContentItemID is QC-Placeholder] targetContentItemID=%{public}@", buf, 0x2Au);

  }
LABEL_8:

}

- (void)performAllowingEditsToChangeCurrentItem:(id)a3
{
  void (**v4)(_QWORD);
  pthread_key_t v5;
  NSMutableArray *v6;
  NSMutableArray *potentialCurrentItemEdits;
  void *v8;
  id v9;

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken != -1)
    dispatch_once(&_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken, &__block_literal_global_724);
  v5 = _MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey;
  pthread_setspecific(_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey, (const void *)1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  potentialCurrentItemEdits = self->_potentialCurrentItemEdits;
  self->_potentialCurrentItemEdits = v6;

  v4[2](v4);
  pthread_setspecific(v5, 0);
  if (!self->_targetContentItemID)
  {
    if (-[NSMutableArray count](self->_potentialCurrentItemEdits, "count"))
    {
      -[MPCQueueControllerBehaviorImplementation contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self->_behaviorImpl, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", 0, 2, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nextObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[MPCQueueController _setTargetContentItemID:source:](self, "_setTargetContentItemID:source:", v9, 0);
    }
  }
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  int64_t targetContentItemSource;
  const __CFString *targetContentItemID;
  const __CFString *loadingContentItemID;
  __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];
  _QWORD v20[8];

  v3 = a3;
  v20[7] = *MEMORY[0x24BDAC8D0];
  v19[0] = CFSTR("__obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  targetContentItemID = (const __CFString *)self->_targetContentItemID;
  targetContentItemSource = self->_targetContentItemSource;
  if (!targetContentItemID)
    targetContentItemID = CFSTR("@");
  v20[0] = v5;
  v20[1] = targetContentItemID;
  v19[1] = CFSTR("_targetContentItemID");
  v19[2] = CFSTR("_loadingContentItemID");
  loadingContentItemID = (const __CFString *)self->_loadingContentItemID;
  if (!loadingContentItemID)
    loadingContentItemID = CFSTR("@");
  v20[2] = loadingContentItemID;
  v19[3] = CFSTR("_targetContentItemSource");
  v10 = CFSTR("Unknown");
  switch(targetContentItemSource)
  {
    case 0:
      break;
    case 1:
      v10 = CFSTR("StartItem");
      break;
    case 2:
      v10 = CFSTR("UserSelected");
      break;
    case 3:
      v10 = CFSTR("NaturalTransition");
      break;
    case 4:
      v10 = CFSTR("ExternalSync");
      break;
    case 5:
      v10 = CFSTR("Redirect");
      break;
    case 6:
      v10 = CFSTR("QueueBoundary");
      break;
    case 7:
      v10 = CFSTR("Restored");
      break;
    default:
      if (targetContentItemSource == 100)
      {
        v10 = CFSTR("Loading");
      }
      else
      {
        objc_msgSend((id)0x7C8, "stringWithFormat:", CFSTR("Unknown/%ld"), targetContentItemSource);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  if (v10)
    v11 = v10;
  else
    v11 = CFSTR("@");
  v20[3] = v11;
  v19[4] = CFSTR("_currentItem");
  -[MPAVItem description](self->_currentItem, "description");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = CFSTR("@");
  v20[4] = v14;
  v19[5] = CFSTR("_loadingAdditionalItems");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_loadingAdditionalItems);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v15;
  v19[6] = CFSTR("behaviorImpl");
  -[MPCQueueControllerBehaviorImplementation _stateDictionaryIncludingQueue:](self->_behaviorImpl, "_stateDictionaryIncludingQueue:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)preferredFirstContentItemID
{
  return self->_preferredFirstContentItemID;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (NSMutableDictionary)coderVersions
{
  return self->_coderVersions;
}

- (void)setCoderVersions:(id)a3
{
  objc_storeStrong((id *)&self->_coderVersions, a3);
}

- (NSString)loadingContentItemID
{
  return self->_loadingContentItemID;
}

- (void)setLoadingContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSMapTable)activeEdits
{
  return self->_activeEdits;
}

- (void)setActiveEdits:(id)a3
{
  objc_storeStrong((id *)&self->_activeEdits, a3);
}

- (NSMutableArray)potentialCurrentItemEdits
{
  return self->_potentialCurrentItemEdits;
}

- (void)setPotentialCurrentItemEdits:(id)a3
{
  objc_storeStrong((id *)&self->_potentialCurrentItemEdits, a3);
}

- (NSString)restoreLastStartTimePositionToContentItemID
{
  return self->_restoreLastStartTimePositionToContentItemID;
}

- (void)setRestoreLastStartTimePositionToContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (double)lastSavedTime
{
  return self->_lastSavedTime;
}

- (void)setBehaviorImpl:(id)a3
{
  objc_storeStrong((id *)&self->_behaviorImpl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorImpl, 0);
  objc_storeStrong((id *)&self->_restoreLastStartTimePositionToContentItemID, 0);
  objc_storeStrong((id *)&self->_potentialCurrentItemEdits, 0);
  objc_storeStrong((id *)&self->_activeEdits, 0);
  objc_storeStrong((id *)&self->_loadingContentItemID, 0);
  objc_storeStrong((id *)&self->_coderVersions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_targetContentItemID, 0);
  objc_storeStrong((id *)&self->_preferredFirstContentItemID, 0);
  objc_storeStrong((id *)&self->_lastECATSStack, 0);
  objc_storeStrong(&self->_postEditContinuation, 0);
}

void __69__MPCQueueController__emitEventsForItemChangeFromItem_toCurrentItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "title");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "genericObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (v6 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "genericObjectRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playlist");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "cloudVersionHash");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v13, "isCollaborative");
    v8 = a1 + 88;
  }
  else
  {
    if (v6 != 13)
      return;
    objc_msgSend(*(id *)(a1 + 32), "genericObjectRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "radioStation");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v13, "type");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v13, "subtype");
    v8 = a1 + 64;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v8 + 8) + 24) = 1;

}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  uint64_t v61;
  _QWORD v62[4];
  _QWORD v63[4];
  void *v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "preferredUpcomingItemCount");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 32);
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (!v8)
      {
LABEL_26:

        goto LABEL_27;
      }
      objc_msgSend(*(id *)(a1 + 40), "engineID");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v66 = v9;
      v67 = 2114;
      v68 = v10;
      v69 = 2114;
      v70 = v11;
      v71 = 2048;
      v72 = v5;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | skipping [already loading] preferredUpcomingItemCount=%ld", buf, 0x2Au);
LABEL_25:

      goto LABEL_26;
    }
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "engineID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v66 = v12;
      v67 = 2114;
      v68 = v13;
      v69 = 2114;
      v70 = v14;
      v71 = 2048;
      v72 = v5;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | checking [] preferredUpcomingItemCount=%ld", buf, 0x2Au);

    }
    objc_msgSend(v3, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), 1, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = 0;
    while (1)
    {
      v16 = v10;
      -[NSObject nextObject](v7, "nextObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        break;
      ++v15;
      objc_msgSend(v9, "addObject:", v10);
      if (v5 == v15)
      {
        v15 = v5;
        break;
      }
    }
    v17 = __OFSUB__(v5, v15);
    v18 = v5 - v15;
    if ((v18 < 0) ^ v17 | (v18 == 0))
    {
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138544130;
        v66 = v38;
        v67 = 2114;
        v68 = v39;
        v69 = 2114;
        v70 = v40;
        v71 = 2048;
        v72 = v5;
        _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | satisfied [] preferredUpcomingItemCount=%ld", buf, 0x2Au);

      }
    }
    else
    {
      if (!objc_msgSend(v9, "count"))
      {
LABEL_15:
        v22 = objc_msgSend(v9, "copy");
        v23 = *(_QWORD *)(a1 + 32);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
        v25 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "engineID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "sessionID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138544130;
          v66 = v26;
          v67 = 2114;
          v68 = v27;
          v69 = 2114;
          v70 = v28;
          v71 = 2048;
          v72 = v18;
          _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | requesting %ld items", buf, 0x2Au);

        }
        v29 = objc_alloc(MEMORY[0x24BE65C40]);
        v30 = MEMORY[0x24BDAC760];
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_346;
        v59[3] = &unk_24CABA558;
        v31 = *(_QWORD *)(a1 + 32);
        v61 = *(_QWORD *)(a1 + 56);
        v59[4] = v31;
        v32 = v3;
        v60 = v32;
        v33 = (void *)objc_msgSend(v29, "initWithDeallocHandler:", v59);
        v54[0] = v30;
        v54[1] = 3221225472;
        v54[2] = __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_2;
        v54[3] = &unk_24CAB6740;
        v34 = *(id *)(a1 + 40);
        v35 = *(_QWORD *)(a1 + 32);
        v55 = v34;
        v56 = v35;
        v57 = *(id *)(a1 + 48);
        v58 = v33;
        v36 = v33;
        objc_msgSend(v32, "loadAdditionalUpcomingItems:completion:", v18, v54);

        goto LABEL_25;
      }
      v19 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
      if (v19 == v9)
      {

      }
      else
      {
        v20 = v19;
        v21 = objc_msgSend(v19, "isEqual:", v9);

        if (!v21)
          goto LABEL_15;
      }
      v41 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "msv_compactDescription");
        v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v66 = v42;
        v67 = 2114;
        v68 = v43;
        v69 = 2114;
        v70 = v53;
        v71 = 2048;
        v72 = v5;
        v73 = 2114;
        v74 = v44;
        v45 = (void *)v44;
        _os_log_impl(&dword_210BD8000, v41, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | skipping [matching ecats stack] preferredUpcomingItemCount=%ld ecatsStack=[%{public}@]", buf, 0x34u);

      }
      v46 = (void *)MEMORY[0x24BE65C38];
      v47 = *MEMORY[0x24BE65AB0];
      v48 = *(_QWORD *)(a1 + 48);
      v62[0] = CFSTR("reason");
      v62[1] = CFSTR("lastECATSStack");
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v63[0] = v48;
      v63[1] = v49;
      v62[2] = CFSTR("preferredUpcomingItemCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v37 = objc_claimAutoreleasedReturnValue();
      v63[2] = v37;
      v62[3] = CFSTR("queueController");
      objc_msgSend(*(id *)(a1 + 32), "_stateDictionaryIncludingQueue:", 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v63[3] = v50;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 4);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v51;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v47, CFSTR("Bug"), CFSTR("Rogue-ECATS"), CFSTR("MatchingECATSStack"), &stru_24CABB5D0, v52, 0);

    }
    goto LABEL_25;
  }
LABEL_27:

}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_346(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("MPCQueueController.m"), 1373, CFSTR("Behavior did not call completion for loadAdditionalUpcomingItems: %@"), a1[5]);

}

void __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "msv_description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | finished error=%{public}@", buf, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] _evaluateContextAwareTriggersWithReason:'%{public}@' | finished", buf, 0x20u);

  }
  v13 = *(id *)(a1 + 56);
  msv_dispatch_on_main_queue();

}

uint64_t __62__MPCQueueController__evaluateContextAwareTriggersWithReason___block_invoke_349(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "disarm");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 0;
    return objc_msgSend(*(id *)(a1 + 40), "_evaluateContextAwareTriggersWithReason:", CFSTR("Finished loading additional"));
  }
  return result;
}

void __36__MPCQueueController__rollbackEdit___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "engineID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v20 = 138543874;
    v21 = v4;
    v22 = 2114;
    v23 = v5;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] rollbackEdit:… | rolling back edit [] edit=%{public}@", (uint8_t *)&v20, 0x20u);

  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v9 + 8))
  {
    if (objc_msgSend(*(id *)(v9 + 120), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectEnumerator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "msv_map:", &__block_literal_global_329);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "engineID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
        v20 = 138544130;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        v24 = 2048;
        v25 = v15;
        v26 = 2114;
        v27 = v11;
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | waiting for continuation [%ld edits remain] activeEdits=%{public}@", (uint8_t *)&v20, 0x2Au);

      }
    }
    else
    {
      v16 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "engineID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v17;
        v22 = 2114;
        v23 = v18;
        _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", (uint8_t *)&v20, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
      v19 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v19 + 8);
      *(_QWORD *)(v19 + 8) = 0;
    }

  }
}

uint64_t __36__MPCQueueController__rollbackEdit___block_invoke_328(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

void __34__MPCQueueController__commitEdit___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "engineID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v22 = 138543874;
    v23 = v4;
    v24 = 2114;
    v25 = v5;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[QUCON:%{public}@:%{public}@] commitEdit:… | committing edit [] edit=%{public}@", (uint8_t *)&v22, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_evaluateCurrentItemWithEdit:", *(_QWORD *)(a1 + 40));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "currentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_updateQueueIndexForItemIfNeeded:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_evaluateContextAwareTriggersWithReason:", CFSTR("commit edit"));
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v10);

  objc_msgSend(*(id *)(a1 + 32), "incrementVersionForSegment:", CFSTR("behavior"));
  v11 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v11 + 8))
  {
    if (objc_msgSend(*(id *)(v11 + 120), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectEnumerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "msv_map:", &__block_literal_global_327);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "engineID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
        v22 = 138544130;
        v23 = v15;
        v24 = 2114;
        v25 = v16;
        v26 = 2048;
        v27 = v17;
        v28 = 2114;
        v29 = v13;
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | waiting for continuation [%ld edits remain] activeEdits=%{public}@", (uint8_t *)&v22, 0x2Au);

      }
    }
    else
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v2, "engineID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2114;
        v25 = v20;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performAfterEdits:… | calling continuation [no edits]", (uint8_t *)&v22, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
      v21 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v21 + 8);
      *(_QWORD *)(v21 + 8) = 0;
    }

  }
}

uint64_t __34__MPCQueueController__commitEdit___block_invoke_326(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

uint64_t __58__MPCQueueController_engine_didReachEndOfQueueWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReachEndOfQueueWithReason:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__MPCQueueController_jumpToFirstContentItemWithSource___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didJumpToTargetContentItemID:", *(_QWORD *)(a1 + 32));
}

uint64_t __42__MPCQueueController_jumpToContentItemID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didJumpToTargetContentItemID:", *(_QWORD *)(a1 + 32));
}

uint64_t __52__MPCQueueController_jumpToContentItemID_direction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didJumpToTargetContentItemID:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__MPCQueueController_performAfterEdits___block_invoke_86(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __40__MPCQueueController_performAfterEdits___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "label");
}

void __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke_2;
  block[3] = &unk_24CAB75D0;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__MPCQueueController_performSetQueue_loadingItemReady_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "engineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "commandID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[PSYNC:%{public}@:%{public}@] performSetQueue:%{public}@ … | clearing loading content item", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queueController:didChangeTargetContentItemID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __36__MPCQueueController_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
  v4 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 1;

}

uint64_t __36__MPCQueueController_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "connectToExternalSyncHost:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__MPCQueueController_willDisconnectFromPlaybackEngine___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disconnectFromExternalSyncHost:", *(_QWORD *)(a1 + 32));
}

uint64_t __50__MPCQueueController_willConnectToPlaybackEngine___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "connectToExternalSyncHost:", *(_QWORD *)(a1 + 32));
}

uint64_t __47__MPCQueueController_containsRestorableContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "containsRestorableContent");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __26__MPCQueueController_init__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t (**v5)(id, void *);
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDictionaryIncludingQueue:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5[2](v5, v9);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (Class)testBehaviorClass
{
  return (Class)(id)__testBehaviorClass;
}

+ (void)setTestBehaviorClass:(Class)a3
{
  __testBehaviorClass = (uint64_t)a3;
}

+ (int64_t)behaviorForQueue:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "isSystemPodcasts") & 1) == 0)
  {
    if (+[_MPCQueueControllerBehaviorMusic canLoadQueue:reason:](_MPCQueueControllerBehaviorMusic, "canLoadQueue:reason:", v3, 0))
    {
      v4 = 2;
      goto LABEL_12;
    }
    if (+[_MPCQueueControllerBehaviorMusicSharePlay canLoadQueue:reason:](_MPCQueueControllerBehaviorMusicSharePlay, "canLoadQueue:reason:", v3, 0))
    {
      v4 = 3;
      goto LABEL_12;
    }
  }
  v4 = 0;
  if (!+[_MPCQueueControllerBehaviorEmpty canLoadQueue:reason:](_MPCQueueControllerBehaviorEmpty, "canLoadQueue:reason:", v3, 0))
  {
    if (+[_MPCQueueControllerBehaviorPodcasts canLoadQueue:reason:](_MPCQueueControllerBehaviorPodcasts, "canLoadQueue:reason:", v3, 0))
    {
      v4 = 4;
    }
    else if (objc_msgSend((id)__testBehaviorClass, "canLoadQueue:reason:", v3, 0))
    {
      v4 = 5;
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_12:

  return v4;
}

+ (void)unregisterPublisher:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  +[_MPCQueueControllerRegistry shared](_MPCQueueControllerRegistry, "shared");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publisherProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v3);

}

@end
