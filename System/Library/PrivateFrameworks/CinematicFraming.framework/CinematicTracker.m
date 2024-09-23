@implementation CinematicTracker

- (CinematicTracker)init
{
  CinematicTracker *v2;
  CinematicTracker *v3;
  uint64_t v4;
  NSMutableArray **allTracks;
  NSMutableArray **tracksOidMappings;
  char v7;
  char v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *oidToTrackMap;
  CinematicTracker *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CinematicTracker;
  v2 = -[CinematicTracker init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 0;
    allTracks = v2->_allTracks;
    tracksOidMappings = v2->_tracksOidMappings;
    v7 = 1;
    do
    {
      v8 = v7;
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = allTracks[v4];
      allTracks[v4] = v9;

      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = tracksOidMappings[v4];
      tracksOidMappings[v4] = v11;

      v7 = 0;
      v4 = 1;
    }
    while ((v8 & 1) != 0);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    oidToTrackMap = v3->_oidToTrackMap;
    v3->_oidToTrackMap = v13;

    v3->_trackIndexCounter = 0;
    v15 = v3;
  }

  return v3;
}

- (void)removeTrackOfType:(int64_t)a3 atIndex:(int)a4 atTime:(id *)a5
{
  NSMutableArray **allTracks;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *oidToTrackMap;
  id *v12;
  void *v13;
  id v14;

  allTracks = self->_allTracks;
  v8 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->_allTracks[a3], "objectAtIndexedSubscript:", a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pairTrack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v14, "pairTrack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPairTrack:", 0);

    objc_msgSend(v14, "setPairTrack:", 0);
  }
  oidToTrackMap = self->_oidToTrackMap;
  v12 = (id *)(&self->super.isa + a3);
  objc_msgSend(v12[3], "objectAtIndexedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](oidToTrackMap, "removeObjectForKey:", v13);

  -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](allTracks[a3], "exchangeObjectAtIndex:withObjectAtIndex:", v8, -[NSMutableArray count](allTracks[a3], "count") - 1);
  -[NSMutableArray removeLastObject](allTracks[a3], "removeLastObject");
  objc_msgSend(v12[3], "exchangeObjectAtIndex:withObjectAtIndex:", v8, objc_msgSend(v12[3], "count") - 1);
  objc_msgSend(v12[3], "removeLastObject");

}

- (void)processFaceDetections:(id)a3 bodyDetections:(id)a4 atTime:(id *)a5 inView:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  char v14;
  uint64_t v15;
  NSMutableArray **allTracks;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime rhs;
  CMTime time;
  CMTime lhs;
  _BYTE v39[128];
  uint64_t v40;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  lhs = *(CMTime *)a5;
  -[CinematicTracker processDetections:ofType:atTime:](self, "processDetections:ofType:atTime:", a4, 0, &lhs);
  lhs = *(CMTime *)a5;
  v14 = 1;
  -[CinematicTracker processDetections:ofType:atTime:](self, "processDetections:ofType:atTime:", v13, 1, &lhs);
  v15 = 0;
  allTracks = self->_allTracks;
  do
  {
    v17 = v14;
    if (-[NSMutableArray count](allTracks[v15], "count"))
    {
      v18 = 0;
      v19 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](allTracks[v15], "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          objc_msgSend(v20, "lastTimestamp");
        else
          memset(&rhs, 0, sizeof(rhs));
        lhs = (CMTime)*a5;
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > 1.0)
        {
          lhs = (CMTime)*a5;
          -[CinematicTracker removeTrackOfType:atIndex:atTime:](self, "removeTrackOfType:atIndex:atTime:", v15, v19, &lhs);
          LODWORD(v19) = v19 - 1;
        }

        v19 = (v19 + 1);
        v18 = (int)v19;
      }
      while (-[NSMutableArray count](allTracks[v15], "count") > (unint64_t)(int)v19);
    }
    v14 = 0;
    v15 = 1;
  }
  while ((v17 & 1) != 0);
  lhs = (CMTime)*a5;
  -[CinematicTracker updateBodyFacePairsAtTime:](self, "updateBodyFacePairsAtTime:", &lhs);
  if (-[NSMutableArray count](self->_allTracks[0], "count"))
  {
    v22 = 0;
    v23 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](*allTracks, "objectAtIndexedSubscript:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "identifier") < 0)
      {
        objc_msgSend(v24, "pairTrack");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          lhs = (CMTime)*a5;
          -[CinematicTracker removeTrackOfType:atIndex:atTime:](self, "removeTrackOfType:atIndex:atTime:", 0, v23, &lhs);
          LODWORD(v23) = v23 - 1;
        }
      }

      v23 = (v23 + 1);
      v22 = (int)v23;
    }
    while (-[NSMutableArray count](*allTracks, "count") > (unint64_t)(int)v23);
  }
  -[CinematicTracker tracks](self, "tracks");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        lhs = (CMTime)*a5;
        objc_msgSend(v31, "updatePropertiesWithTimestamp:inView:", &lhs, x, y, width, height);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v28);
  }

}

- (void)resetTracksFramingProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[CinematicTracker tracks](self, "tracks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "resetProperties");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)tracks
{
  return (NSArray *)self->_allTracks[0];
}

- (void)processDetections:(id)a3 ofType:(int64_t)a4 atTime:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *oidToTrackMap;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableArray **allTracks;
  uint64_t v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double MidX;
  float v48;
  CGFloat v49;
  double MidY;
  float v51;
  double Width;
  CGFloat v53;
  double v54;
  double v55;
  NSMutableDictionary *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  NSMutableDictionary *v61;
  void *v62;
  NSMutableDictionary *v63;
  void *v64;
  void *v65;
  BaseTrack *v66;
  unint64_t trackIndexCounter;
  uint64_t v68;
  CinematicTrack *v69;
  unint64_t v70;
  CinematicFramingSessionOptions *options;
  NSMutableDictionary *v72;
  void *v73;
  NSMutableArray *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  NSMutableArray **tracksOidMappings;
  id obj;
  CinematicTracker *v80;
  CGFloat v81;
  float v82;
  float v83;
  double v84;
  CMTime time1;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  CMTime time2;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v97 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v92;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v92 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
        oidToTrackMap = self->_oidToTrackMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v13, "oid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](oidToTrackMap, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          time2 = (CMTime)*a5;
          objc_msgSend(v16, "addObservation:atTime:", v13, &time2);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
    }
    while (v10);
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v8;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v87;
    allTracks = self->_allTracks;
    tracksOidMappings = self->_tracksOidMappings;
    v80 = self;
    v76 = *(_QWORD *)v87;
    do
    {
      v21 = 0;
      v77 = v18;
      do
      {
        if (*(_QWORD *)v87 != v19)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v21);
        v23 = self->_oidToTrackMap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v22, "oid"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v26 = objc_msgSend(v22, "oid");
          if (!-[NSMutableArray count](allTracks[a4], "count"))
            goto LABEL_28;
          v27 = 0;
          v28 = -1;
          v84 = INFINITY;
          do
          {
            -[NSMutableArray objectAtIndexedSubscript:](allTracks[a4], "objectAtIndexedSubscript:", v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
              objc_msgSend(v29, "lastTimestamp");
            else
              memset(&time1, 0, sizeof(time1));
            time2 = (CMTime)*a5;
            if (CMTimeCompare(&time1, &time2))
            {
              objc_msgSend(v30, "lastObservationBounds");
              v32 = v31;
              v34 = v33;
              v36 = v35;
              v81 = v35;
              v38 = v37;
              objc_msgSend(v22, "bounds");
              v40 = v39;
              v42 = v41;
              v44 = v43;
              v46 = v45;
              v98.origin.x = v32;
              v98.origin.y = v34;
              v98.size.width = v36;
              v98.size.height = v38;
              MidX = CGRectGetMidX(v98);
              v99.origin.x = v40;
              v99.origin.y = v42;
              v99.size.width = v44;
              v99.size.height = v46;
              v48 = MidX - CGRectGetMidX(v99);
              v83 = v48;
              v100.origin.x = v32;
              v49 = v32;
              v100.origin.y = v34;
              v100.size.width = v81;
              v100.size.height = v38;
              MidY = CGRectGetMidY(v100);
              v101.origin.x = v40;
              v101.origin.y = v42;
              v101.size.width = v44;
              v101.size.height = v46;
              v51 = MidY - CGRectGetMidY(v101);
              v82 = v51;
              v102.origin.x = v49;
              v102.origin.y = v34;
              v102.size.width = v81;
              v102.size.height = v38;
              Width = CGRectGetWidth(v102);
              v103.origin.x = v40;
              v103.origin.y = v42;
              v103.size.width = v44;
              v103.size.height = v46;
              v53 = CGRectGetWidth(v103);
              v54 = v84;
              *(float *)&v53 = Width - v53;
              v55 = (float)((float)((float)(v82 * v82) + (float)(v83 * v83)) + (float)(*(float *)&v53 * *(float *)&v53));
              if (v84 > v55)
              {
                v28 = v27;
                v54 = v55;
              }
              v84 = v54;
            }

            ++v27;
          }
          while (-[NSMutableArray count](allTracks[a4], "count") > v27);
          self = v80;
          if (v28 == -1)
          {
LABEL_28:
            ++self->_trackIndexCounter;
            if (a4)
            {
              v66 = [BaseTrack alloc];
              trackIndexCounter = self->_trackIndexCounter;
              time2 = (CMTime)*a5;
              v68 = -[BaseTrack initWithObservation:identifier:type:atTime:](v66, "initWithObservation:identifier:type:atTime:", v22, trackIndexCounter, a4, &time2);
            }
            else
            {
              v69 = [CinematicTrack alloc];
              v70 = self->_trackIndexCounter;
              options = self->_options;
              time2 = (CMTime)*a5;
              v68 = -[CinematicTrack initWithObservation:identifier:options:atTime:](v69, "initWithObservation:identifier:options:atTime:", v22, v70, options, &time2);
            }
            v65 = (void *)v68;
            v72 = self->_oidToTrackMap;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v26);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v72, "setObject:forKeyedSubscript:", v65, v73);

            -[NSMutableArray addObject:](allTracks[a4], "addObject:", v65);
            v74 = tracksOidMappings[a4];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v26);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v74, "addObject:", v75);

          }
          else
          {
            v56 = v80->_oidToTrackMap;
            v57 = v28;
            -[NSMutableArray objectAtIndexedSubscript:](tracksOidMappings[a4], "objectAtIndexedSubscript:", v28);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](v56, "removeObjectForKey:", v58);

            -[NSMutableArray objectAtIndexedSubscript:](allTracks[a4], "objectAtIndexedSubscript:", v57);
            v59 = v26;
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v80->_oidToTrackMap;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v59);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v61;
            self = v80;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v60, v62);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v59);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray setObject:atIndexedSubscript:](tracksOidMappings[a4], "setObject:atIndexedSubscript:", v64, v57);

            -[NSMutableArray objectAtIndexedSubscript:](allTracks[a4], "objectAtIndexedSubscript:", v57);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            time2 = (CMTime)*a5;
            objc_msgSend(v65, "addObservation:atTime:", v22, &time2);
          }

          v19 = v76;
          v18 = v77;
          v25 = 0;
        }

        ++v21;
      }
      while (v21 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
    }
    while (v18);
  }

}

- (void)updateBodyFacePairsAtTime:(id *)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  float v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSMutableArray *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  float v44;
  uint64_t v45;
  void *v46;
  void *v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  float v60;
  id v61;
  uint64_t v62;
  double v63;
  double v64;
  float v65;
  CinematicFramingSessionOptions *options;
  CGFloat Width;
  float v69;
  float v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  Detection *v75;
  void *v76;
  CinematicTrack *v77;
  void *v78;
  void *v79;
  CinematicTrack *v80;
  CinematicFramingSessionOptions *v81;
  unint64_t v82;
  NSMutableDictionary *oidToTrackMap;
  void *v84;
  NSMutableArray *v85;
  void *v86;
  uint64_t v87;
  NSMutableArray *obj;
  __int128 v91;
  int64_t var3;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v108 = *MEMORY[0x1E0C80C00];
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v3 = self->_allTracks[0];
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v102;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v102 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
        objc_msgSend(v8, "pairTrack");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          v11 = objc_msgSend(v8, "identifier");

          if ((v11 & 0x8000000000000000) == 0)
          {
            objc_msgSend(v8, "lastObservationBounds");
            v13 = v12;
            v15 = v14;
            v17 = v16;
            v19 = v18;
            objc_msgSend(v8, "pairTrack");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "lastObservationBounds");
            v117.origin.x = v21;
            v117.origin.y = v22;
            v117.size.width = v23;
            v117.size.height = v24;
            v109.origin.x = v13;
            v109.origin.y = v15;
            v109.size.width = v17;
            v109.size.height = v19;
            v110 = CGRectIntersection(v109, v117);
            *(float *)&v13 = v110.size.width * v110.size.height;
            objc_msgSend(v8, "pairTrack");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastObservationBounds");
            v28 = v26 * v27;
            *(float *)&v15 = v28 * 0.3;

            if (*(float *)&v15 > *(float *)&v13)
            {
              objc_msgSend(v8, "pairTrack");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setPairTrack:", 0);

              objc_msgSend(v8, "setPairTrack:", 0);
            }
          }
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v101, v107, 16);
    }
    while (v5);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = self->_allTracks[1];
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v98 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
        objc_msgSend(v34, "pairTrack", v87);
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          v36 = (void *)v35;
          objc_msgSend(v34, "pairTrack");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "identifier");

          if (v38 > 0)
            continue;
        }
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v39 = self->_allTracks[0];
        v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        if (v40)
        {
          v41 = v40;
          v42 = 0;
          v43 = *(_QWORD *)v94;
          v44 = 0.0;
          while (1)
          {
            v45 = 0;
            do
            {
              if (*(_QWORD *)v94 != v43)
                objc_enumerationMutation(v39);
              v46 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v45);
              objc_msgSend(v46, "pairTrack");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
                goto LABEL_25;
              if (objc_msgSend(v46, "identifier") >= 1)
              {
                objc_msgSend(v34, "lastObservationBounds");
                v49 = v48;
                v51 = v50;
                v53 = v52;
                v55 = v54;
                objc_msgSend(v46, "lastObservationBounds");
                v118.origin.x = v56;
                v118.origin.y = v57;
                v118.size.width = v58;
                v118.size.height = v59;
                v111.origin.x = v49;
                v111.origin.y = v51;
                v111.size.width = v53;
                v111.size.height = v55;
                v112 = CGRectIntersection(v111, v118);
                v60 = v112.size.width * v112.size.height;
                if (v44 < v60)
                {
                  v61 = v46;
                  v47 = v42;
                  v42 = v61;
                  v44 = v60;
LABEL_25:

                }
              }
              ++v45;
            }
            while (v41 != v45);
            v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
            v41 = v62;
            if (!v62)
              goto LABEL_34;
          }
        }
        v42 = 0;
        v44 = 0.0;
LABEL_34:

        objc_msgSend(v34, "lastObservationBounds");
        v65 = v63 * v64;
        if ((float)(v44 / v65) <= 0.3 || v42 == 0)
        {
          options = self->_options;
          if (options
            && -[CinematicFramingSessionOptions inferSubjectBodyFromFaceLocation](options, "inferSubjectBodyFromFaceLocation"))
          {
            objc_msgSend(v34, "lastObservationBounds");
            Width = CGRectGetWidth(v113);
            v69 = Width + Width;
            objc_msgSend(v34, "lastObservationBounds");
            v70 = CGRectGetHeight(v114) * 3.0;
            objc_msgSend(v34, "lastObservationBounds");
            v71 = v69;
            v72 = CGRectGetMidX(v115) + v71 * -0.5;
            objc_msgSend(v34, "lastObservationBounds");
            v73 = v70;
            v74 = CGRectGetMinY(v116) + v73 / -10.0;
            v75 = objc_alloc_init(Detection);
            -[Detection setOid:](v75, "setOid:", -objc_msgSend(v34, "identifier"));
            -[Detection setBounds:](v75, "setBounds:", v72, v74, v71, v73);
            objc_msgSend(v34, "pairTrack");
            v76 = (void *)objc_claimAutoreleasedReturnValue();

            if (v76)
            {
              objc_msgSend(v34, "pairTrack");
              v77 = (CinematicTrack *)objc_claimAutoreleasedReturnValue();
              v91 = *(_OWORD *)&a3->var0;
              var3 = a3->var3;
              -[BaseTrack addObservation:atTime:](v77, "addObservation:atTime:", v75, &v91);
            }
            else
            {
              v87 = -[Detection oid](v75, "oid");
              ++self->_trackIndexCounter;
              v80 = [CinematicTrack alloc];
              v81 = self->_options;
              v82 = -self->_trackIndexCounter;
              v91 = *(_OWORD *)&a3->var0;
              var3 = a3->var3;
              v77 = -[CinematicTrack initWithObservation:identifier:options:atTime:](v80, "initWithObservation:identifier:options:atTime:", v75, v82, v81, &v91);
              oidToTrackMap = self->_oidToTrackMap;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v87);
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](oidToTrackMap, "setObject:forKeyedSubscript:", v77, v84);

              -[NSMutableArray addObject:](self->_allTracks[0], "addObject:", v77);
              v85 = self->_tracksOidMappings[0];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v87);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v85, "addObject:", v86);

              -[BaseTrack setPairTrack:](v77, "setPairTrack:", v34);
              objc_msgSend(v34, "setPairTrack:", v77);
            }

          }
        }
        else
        {
          objc_msgSend(v34, "pairTrack");
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            objc_msgSend(v34, "pairTrack");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "setPairTrack:", 0);

          }
          objc_msgSend(v34, "setPairTrack:", v42);
          objc_msgSend(v42, "setPairTrack:", v34);
        }

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v97, v106, 16);
    }
    while (v31);
  }

}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_oidToTrackMap, 0);
  for (i = 32; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end
