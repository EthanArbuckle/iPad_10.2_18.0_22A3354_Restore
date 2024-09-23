@implementation BMMediaNowPlaying

- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23 isAirPlayActive:(id)a24 parentGroupContainsDiscoverableGroupLeader:(id)a25
{
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  BMMediaNowPlaying *v37;
  double v38;
  unsigned int v39;
  unsigned int v40;
  id v41;
  id v45;
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
  id v60;
  objc_super v61;

  v58 = a3;
  v28 = a4;
  v45 = a6;
  v57 = a6;
  v56 = a7;
  v60 = a8;
  v55 = a9;
  v54 = a10;
  v29 = a11;
  v53 = a12;
  v52 = a13;
  v51 = a14;
  v30 = a15;
  v50 = a16;
  v49 = a17;
  v48 = a18;
  v47 = a19;
  v31 = a20;
  v32 = v28;
  v33 = a21;
  v34 = v29;
  v35 = a24;
  v36 = a25;
  v61.receiver = self;
  v61.super_class = (Class)BMMediaNowPlaying;
  v37 = -[BMEventBase init](&v61, sel_init);
  if (v37)
  {
    v37->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion");
    objc_storeStrong((id *)&v37->_uniqueID, a3);
    if (v32)
    {
      v37->_hasRaw_absoluteTimestamp = 1;
      objc_msgSend(v32, "timeIntervalSinceReferenceDate");
    }
    else
    {
      v37->_hasRaw_absoluteTimestamp = 0;
      v38 = -1.0;
    }
    v37->_raw_absoluteTimestamp = v38;
    v37->_playbackState = a5;
    objc_storeStrong((id *)&v37->_album, v45);
    objc_storeStrong((id *)&v37->_artist, a7);
    if (v60)
    {
      v37->_hasDuration = 1;
      v39 = objc_msgSend(v60, "unsignedIntValue");
    }
    else
    {
      v39 = 0;
      v37->_hasDuration = 0;
    }
    v37->_duration = v39;
    objc_storeStrong((id *)&v37->_genre, a9);
    objc_storeStrong((id *)&v37->_title, a10);
    if (v34)
    {
      v37->_hasElapsed = 1;
      v40 = objc_msgSend(v34, "unsignedIntValue");
    }
    else
    {
      v40 = 0;
      v37->_hasElapsed = 0;
    }
    v37->_elapsed = v40;
    objc_storeStrong((id *)&v37->_mediaType, a12);
    objc_storeStrong((id *)&v37->_iTunesStoreIdentifier, a13);
    objc_storeStrong((id *)&v37->_iTunesSubscriptionIdentifier, a14);
    if (v30)
    {
      v37->_hasIsAirPlayVideo = 1;
      v41 = v30;
      v37->_isAirPlayVideo = objc_msgSend(v30, "BOOLValue");
    }
    else
    {
      v41 = 0;
      v37->_hasIsAirPlayVideo = 0;
      v37->_isAirPlayVideo = 0;
    }
    objc_storeStrong((id *)&v37->_outputDevices, a16);
    objc_storeStrong((id *)&v37->_bundleID, a17);
    objc_storeStrong((id *)&v37->_iTunesArtistIdentifier, a18);
    objc_storeStrong((id *)&v37->_iTunesAlbumIdentifier, a19);
    objc_storeStrong((id *)&v37->_groupIdentifier, a20);
    if (v33)
    {
      v37->_hasIsRemoteControl = 1;
      v37->_isRemoteControl = objc_msgSend(v33, "BOOLValue");
    }
    else
    {
      v37->_hasIsRemoteControl = 0;
      v37->_isRemoteControl = 0;
    }
    v37->_itemMediaType = a22;
    v37->_itemMediaSubtype = a23;
    if (v35)
    {
      v37->_hasIsAirPlayActive = 1;
      v37->_isAirPlayActive = objc_msgSend(v35, "BOOLValue");
    }
    else
    {
      v37->_hasIsAirPlayActive = 0;
      v37->_isAirPlayActive = 0;
    }
    v30 = v41;
    if (v36)
    {
      v37->_hasParentGroupContainsDiscoverableGroupLeader = 1;
      v37->_parentGroupContainsDiscoverableGroupLeader = objc_msgSend(v36, "BOOLValue");
    }
    else
    {
      v37->_hasParentGroupContainsDiscoverableGroupLeader = 0;
      v37->_parentGroupContainsDiscoverableGroupLeader = 0;
    }
  }

  return v37;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
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

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[BMMediaNowPlaying uniqueID](self, "uniqueID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying absoluteTimestamp](self, "absoluteTimestamp");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaNowPlayingPlaybackStateAsString(-[BMMediaNowPlaying playbackState](self, "playbackState"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying album](self, "album");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying artist](self, "artist");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMediaNowPlaying duration](self, "duration"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying genre](self, "genre");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMediaNowPlaying elapsed](self, "elapsed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying mediaType](self, "mediaType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesSubscriptionIdentifier](self, "iTunesSubscriptionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isAirPlayVideo](self, "isAirPlayVideo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying outputDevices](self, "outputDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying bundleID](self, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesArtistIdentifier](self, "iTunesArtistIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesAlbumIdentifier](self, "iTunesAlbumIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isRemoteControl](self, "isRemoteControl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaNowPlayingMediaTypeAsString(-[BMMediaNowPlaying itemMediaType](self, "itemMediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BMMediaNowPlayingMediaSubtypeAsString(-[BMMediaNowPlaying itemMediaSubtype](self, "itemMediaSubtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isAirPlayActive](self, "isAirPlayActive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("BMMediaNowPlaying with uniqueID: %@, absoluteTimestamp: %@, playbackState: %@, album: %@, artist: %@, duration: %@, genre: %@, title: %@, elapsed: %@, mediaType: %@, iTunesStoreIdentifier: %@, iTunesSubscriptionIdentifier: %@, isAirPlayVideo: %@, outputDevices: %@, bundleID: %@, iTunesArtistIdentifier: %@, iTunesAlbumIdentifier: %@, groupIdentifier: %@, isRemoteControl: %@, itemMediaType: %@, itemMediaSubtype: %@, isAirPlayActive: %@, parentGroupContainsDiscoverableGroupLeader: %@"), v28, v27, v25, v26, v23, v24, v22, v16, v21, v15, v14, v20, v19, v12, v11, v13,
                  v10,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v18;
}

- (id)initByReadFrom:(id)a3
{
  _BYTE *v4;
  BMMediaNowPlaying *v5;
  void *v6;
  int *v7;
  int *v8;
  int *v9;
  int *v10;
  int *v11;
  int *v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  BOOL v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  double v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  int *v55;
  int *v56;
  id v57;
  void *v58;
  void *v59;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  char v79;
  unsigned int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  uint64_t v97;
  NSArray *outputDevices;
  int v99;
  BMMediaNowPlaying *v100;
  objc_super v102;
  uint64_t v103;
  uint64_t v104;

  v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)BMMediaNowPlaying;
  v5 = -[BMEventBase init](&v102, sel_init);
  if (!v5)
    goto LABEL_154;
  v6 = (void *)objc_opt_new();
  v7 = (int *)MEMORY[0x1E0D82BF0];
  v8 = (int *)MEMORY[0x1E0D82BD8];
  v9 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
  {
    v10 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v11 = &OBJC_IVAR___BMMLSELabeledDataStoreFeatureFeatureValue__dataVersion;
    v12 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (v4[*v9])
        break;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = *v7;
        v17 = *(_QWORD *)&v4[v16];
        v18 = v17 + 1;
        if (v17 == -1 || v18 > *(_QWORD *)&v4[*v8])
          break;
        v19 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v17);
        *(_QWORD *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0)
          goto LABEL_13;
        v13 += 7;
        v20 = v14++ >= 9;
        if (v20)
        {
          v15 = 0;
          v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      v21 = v4[*v9];
      if (v4[*v9])
        v15 = 0;
LABEL_15:
      if (v21 || (v15 & 7) == 4)
        break;
      switch((v15 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v10[49];
          goto LABEL_68;
        case 2u:
          *((_BYTE *)&v5->super.super.isa + v11[50]) = 1;
          v25 = *v7;
          v26 = *(_QWORD *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)&v4[*v8])
          {
            v27 = *(double *)(*(_QWORD *)&v4[*v12] + v26);
            *(_QWORD *)&v4[v25] = v26 + 8;
          }
          else
          {
            v4[*v9] = 1;
            v27 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v27;
          continue;
        case 3u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          while (2)
          {
            v31 = *v7;
            v32 = *(_QWORD *)&v4[v31];
            v33 = v32 + 1;
            if (v32 == -1 || v33 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v32);
              *(_QWORD *)&v4[v31] = v33;
              v30 |= (unint64_t)(v34 & 0x7F) << v28;
              if (v34 < 0)
              {
                v28 += 7;
                v20 = v29++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v30) = 0;
LABEL_107:
          if (v30 >= 6)
            LODWORD(v30) = 0;
          v93 = 48;
          goto LABEL_139;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_68;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_68;
        case 6u:
          v35 = 0;
          v36 = 0;
          v37 = 0;
          v5->_hasDuration = 1;
          while (2)
          {
            v38 = *v7;
            v39 = *(_QWORD *)&v4[v38];
            v40 = v39 + 1;
            if (v39 == -1 || v40 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v41 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v39);
              *(_QWORD *)&v4[v38] = v40;
              v37 |= (unint64_t)(v41 & 0x7F) << v35;
              if (v41 < 0)
              {
                v35 += 7;
                v20 = v36++ >= 9;
                if (v20)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v37) = 0;
LABEL_113:
          v94 = 52;
          goto LABEL_118;
        case 7u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_68;
        case 8u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_68;
        case 9u:
          v42 = 0;
          v43 = 0;
          v37 = 0;
          v5->_hasElapsed = 1;
          while (2)
          {
            v44 = *v7;
            v45 = *(_QWORD *)&v4[v44];
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v45);
              *(_QWORD *)&v4[v44] = v46;
              v37 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v20 = v43++ >= 9;
                if (v20)
                {
                  LODWORD(v37) = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v37) = 0;
LABEL_117:
          v94 = 56;
LABEL_118:
          *(_DWORD *)((char *)&v5->super.super.isa + v94) = v37;
          continue;
        case 0xAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 112;
          goto LABEL_68;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 120;
          goto LABEL_68;
        case 0xCu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 128;
          goto LABEL_68;
        case 0xDu:
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v5->_hasIsAirPlayVideo = 1;
          while (2)
          {
            v51 = *v7;
            v52 = *(_QWORD *)&v4[v51];
            v53 = v52 + 1;
            if (v52 == -1 || v53 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v52);
              *(_QWORD *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                v20 = v49++ >= 9;
                if (v20)
                {
                  v50 = 0;
                  goto LABEL_122;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v50 = 0;
LABEL_122:
          v95 = v50 != 0;
          v96 = 34;
          goto LABEL_148;
        case 0xEu:
          v103 = 0;
          v104 = 0;
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_156;
          v55 = v11;
          v56 = v10;
          v57 = -[BMMediaNowPlayingOutputDevice initByReadFrom:]([BMMediaNowPlayingOutputDevice alloc], "initByReadFrom:", v4);
          if (!v57)
            goto LABEL_156;
          v58 = v57;
          objc_msgSend(v6, "addObject:", v57);
          PBReaderRecallMark();

          v10 = v56;
          v11 = v55;
          continue;
        case 0xFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 144;
          goto LABEL_68;
        case 0x10u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 152;
          goto LABEL_68;
        case 0x11u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 160;
          goto LABEL_68;
        case 0x12u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 168;
LABEL_68:
          v59 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          continue;
        case 0x13u:
          v60 = 0;
          v61 = 0;
          v62 = 0;
          v5->_hasIsRemoteControl = 1;
          while (2)
          {
            v63 = *v7;
            v64 = *(_QWORD *)&v4[v63];
            v65 = v64 + 1;
            if (v64 == -1 || v65 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v64);
              *(_QWORD *)&v4[v63] = v65;
              v62 |= (unint64_t)(v66 & 0x7F) << v60;
              if (v66 < 0)
              {
                v60 += 7;
                v20 = v61++ >= 9;
                if (v20)
                {
                  v62 = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v62 = 0;
LABEL_126:
          v95 = v62 != 0;
          v96 = 36;
          goto LABEL_148;
        case 0x14u:
          v67 = 0;
          v68 = 0;
          v30 = 0;
          while (2)
          {
            v69 = *v7;
            v70 = *(_QWORD *)&v4[v69];
            v71 = v70 + 1;
            if (v70 == -1 || v71 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v70);
              *(_QWORD *)&v4[v69] = v71;
              v30 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                v20 = v68++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v30) = 0;
LABEL_130:
          if (v30 >= 3)
            LODWORD(v30) = 0;
          v93 = 60;
          goto LABEL_139;
        case 0x15u:
          v73 = 0;
          v74 = 0;
          v30 = 0;
          while (2)
          {
            v75 = *v7;
            v76 = *(_QWORD *)&v4[v75];
            v77 = v76 + 1;
            if (v76 == -1 || v77 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v78 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v76);
              *(_QWORD *)&v4[v75] = v77;
              v30 |= (unint64_t)(v78 & 0x7F) << v73;
              if (v78 < 0)
              {
                v73 += 7;
                v20 = v74++ >= 9;
                if (v20)
                {
                  LODWORD(v30) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            LODWORD(v30) = 0;
LABEL_136:
          if (v30 >= 8)
            LODWORD(v30) = 0;
          v93 = 64;
LABEL_139:
          *(_DWORD *)((char *)&v5->super.super.isa + v93) = v30;
          continue;
        case 0x16u:
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v5->_hasIsAirPlayActive = 1;
          while (2)
          {
            v82 = *v7;
            v83 = *(_QWORD *)&v4[v82];
            v84 = v83 + 1;
            if (v83 == -1 || v84 > *(_QWORD *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              v85 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v83);
              *(_QWORD *)&v4[v82] = v84;
              v81 |= (unint64_t)(v85 & 0x7F) << v79;
              if (v85 < 0)
              {
                v79 += 7;
                v20 = v80++ >= 9;
                if (v20)
                {
                  v81 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9])
            v81 = 0;
LABEL_143:
          v95 = v81 != 0;
          v96 = 38;
          goto LABEL_148;
        case 0x17u:
          v86 = 0;
          v87 = 0;
          v88 = 0;
          v5->_hasParentGroupContainsDiscoverableGroupLeader = 1;
          break;
        default:
          if (PBReaderSkipValueWithTag())
            continue;
LABEL_156:

          goto LABEL_153;
      }
      while (1)
      {
        v89 = *v7;
        v90 = *(_QWORD *)&v4[v89];
        v91 = v90 + 1;
        if (v90 == -1 || v91 > *(_QWORD *)&v4[*v8])
          break;
        v92 = *(_BYTE *)(*(_QWORD *)&v4[*v12] + v90);
        *(_QWORD *)&v4[v89] = v91;
        v88 |= (unint64_t)(v92 & 0x7F) << v86;
        if ((v92 & 0x80) == 0)
          goto LABEL_145;
        v86 += 7;
        v20 = v87++ >= 9;
        if (v20)
        {
          v88 = 0;
          goto LABEL_147;
        }
      }
      v4[*v9] = 1;
LABEL_145:
      if (v4[*v9])
        v88 = 0;
LABEL_147:
      v95 = v88 != 0;
      v96 = 40;
LABEL_148:
      *((_BYTE *)&v5->super.super.isa + v96) = v95;
    }
    while (*(_QWORD *)&v4[*v7] < *(_QWORD *)&v4[*v8]);
  }
  v97 = objc_msgSend(v6, "copy");
  outputDevices = v5->_outputDevices;
  v5->_outputDevices = (NSArray *)v97;

  v99 = v4[*v9];
  if (v99)
LABEL_153:
    v100 = 0;
  else
LABEL_154:
    v100 = v5;

  return v100;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_uniqueID)
    PBDataWriterWriteStringField();
  if (self->_hasRaw_absoluteTimestamp)
    PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  if (self->_album)
    PBDataWriterWriteStringField();
  if (self->_artist)
    PBDataWriterWriteStringField();
  if (self->_hasDuration)
    PBDataWriterWriteUint32Field();
  if (self->_genre)
    PBDataWriterWriteStringField();
  if (self->_title)
    PBDataWriterWriteStringField();
  if (self->_hasElapsed)
    PBDataWriterWriteUint32Field();
  if (self->_mediaType)
    PBDataWriterWriteStringField();
  if (self->_iTunesStoreIdentifier)
    PBDataWriterWriteStringField();
  if (self->_iTunesSubscriptionIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasIsAirPlayVideo)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_outputDevices;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        objc_msgSend(v10, "writeTo:", v4);
        PBDataWriterRecallMark();
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_bundleID)
    PBDataWriterWriteStringField();
  if (self->_iTunesArtistIdentifier)
    PBDataWriterWriteStringField();
  if (self->_iTunesAlbumIdentifier)
    PBDataWriterWriteStringField();
  if (self->_groupIdentifier)
    PBDataWriterWriteStringField();
  if (self->_hasIsRemoteControl)
    PBDataWriterWriteBOOLField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasIsAirPlayActive)
    PBDataWriterWriteBOOLField();
  if (self->_hasParentGroupContainsDiscoverableGroupLeader)
    PBDataWriterWriteBOOLField();

}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[BMMediaNowPlaying writeTo:](self, "writeTo:", v3);
  objc_msgSend(v3, "immutableData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaNowPlaying)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  BMMediaNowPlaying *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  BMMediaNowPlaying *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  id v82;
  BMMediaNowPlayingOutputDevice *v83;
  BMMediaNowPlayingOutputDevice *v84;
  id v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  BMMediaNowPlaying *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  BMMediaNowPlaying *v122;
  id v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  id *v139;
  id v140;
  uint64_t v141;
  void *v142;
  id *v143;
  uint64_t *v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  id v165;
  uint64_t v166;
  id v167;
  void *v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  id v174;
  id v175;
  void *v176;
  id v177;
  id v178;
  uint64_t v179;
  id v180;
  void *v181;
  id v182;
  id v183;
  uint64_t v184;
  void *v185;
  id v186;
  uint64_t v187;
  void *v188;
  uint64_t v189;
  void *v190;
  uint64_t v191;
  unsigned int v192;
  id v194;
  uint64_t v195;
  id v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  id v201;
  uint64_t v202;
  id v203;
  void *v204;
  id v205;
  id v206;
  uint64_t v207;
  id v208;
  void *v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  void *v225;
  void *v226;
  id v227;
  id v228;
  void *v229;
  id v230;
  id v231;
  void *v232;
  void *v233;
  id v234;
  void *v235;
  void *v236;
  id v237;
  id v238;
  id v239;
  void *v240;
  void *v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  id v246;
  id v247;
  id v248;
  id v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  BMMediaNowPlaying *v255;
  id v256;
  void *v257;
  id v258;
  void *v259;
  id v260;
  id obj;
  id v262;
  void *v263;
  id v264;
  void *v265;
  uint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  id *v270;
  id v271;
  void *v272;
  id v273;
  id v274;
  id v275;
  void *v276;
  id v277;
  void *v279;
  id v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  uint64_t v285;
  void *v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  id v290;
  uint64_t v291;
  id v292;
  uint64_t v293;
  id v294;
  uint64_t v295;
  id v296;
  uint64_t v297;
  id v298;
  uint64_t v299;
  id v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  id v304;
  uint64_t v305;
  id v306;
  _BYTE v307[128];
  uint64_t v308;
  void *v309;
  uint64_t v310;
  id v311;
  uint64_t v312;
  id v313;
  uint64_t v314;
  id v315;
  uint64_t v316;
  id v317;
  uint64_t v318;
  id v319;
  uint64_t v320;
  id v321;
  uint64_t v322;
  id v323;
  uint64_t v324;
  id v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  id v329;
  uint64_t v330;
  id v331;
  uint64_t v332;
  void *v333;
  uint64_t v334;
  _QWORD v335[3];

  v335[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uniqueID"));
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v279 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v279;
LABEL_4:
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("absoluteTimestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v275 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      v9 = objc_alloc(MEMORY[0x1E0C99D68]);
      objc_msgSend(v8, "doubleValue");
      v275 = (id)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
      v14 = v7;
      objc_msgSend(v8, "dateFromString:", v14);
      v275 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v275 = v7;
LABEL_16:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("playbackState"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v273 = 0;
        goto LABEL_24;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v273 = v15;
LABEL_23:

LABEL_24:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("album"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v276 = v17;
        v271 = v6;
        if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v274 = 0;
          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v274 = v17;
LABEL_27:
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("artist"));
          v18 = objc_claimAutoreleasedReturnValue();
          v272 = (void *)v18;
          if (!v18 || (v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v20 = 0;
            goto LABEL_30;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v19;
LABEL_30:
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("duration"));
            v21 = objc_claimAutoreleasedReturnValue();
            v269 = (void *)v21;
            if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v270 = 0;
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v270 = v22;
LABEL_33:
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("genre"));
              v23 = objc_claimAutoreleasedReturnValue();
              v268 = (void *)v23;
              if (!v23 || (v24 = (void *)v23, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v264 = 0;
LABEL_36:
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
                v25 = objc_claimAutoreleasedReturnValue();
                v263 = (void *)v25;
                v260 = v20;
                if (!v25)
                {
                  v262 = 0;
                  v27 = v270;
                  goto LABEL_50;
                }
                v26 = (void *)v25;
                objc_opt_class();
                v27 = v270;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v262 = 0;
                  goto LABEL_50;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v262 = v26;
LABEL_50:
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("elapsed"));
                  v28 = objc_claimAutoreleasedReturnValue();
                  v259 = (void *)v28;
                  if (!v28 || (v29 = (void *)v28, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    v258 = 0;
LABEL_53:
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mediaType"));
                    v30 = objc_claimAutoreleasedReturnValue();
                    v255 = self;
                    v257 = (void *)v30;
                    if (v30 && (v31 = (void *)v30, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v270 = v27;
                        if (!a4)
                        {
                          v256 = 0;
                          v13 = 0;
                          v12 = v275;
                          v66 = v273;
LABEL_221:
                          v20 = v260;
                          goto LABEL_222;
                        }
                        v253 = v15;
                        v109 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v110 = *MEMORY[0x1E0D025B8];
                        v316 = *MEMORY[0x1E0CB2D50];
                        v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("mediaType"));
                        v317 = v34;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v317, &v316, 1);
                        v111 = objc_claimAutoreleasedReturnValue();
                        v112 = v109;
                        v15 = v253;
                        v113 = v110;
                        v17 = v276;
                        v254 = (void *)v111;
                        v256 = 0;
                        v13 = 0;
                        *a4 = (id)objc_msgSend(v112, "initWithDomain:code:userInfo:", v113, 2);
                        goto LABEL_149;
                      }
                      v256 = v31;
                    }
                    else
                    {
                      v256 = 0;
                    }
                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iTunesStoreIdentifier"));
                    v32 = objc_claimAutoreleasedReturnValue();
                    v254 = (void *)v32;
                    if (!v32 || (v33 = (void *)v32, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v34 = 0;
LABEL_59:
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iTunesSubscriptionIdentifier"));
                      v35 = objc_claimAutoreleasedReturnValue();
                      v250 = (void *)v35;
                      if (v35 && (v36 = (void *)v35, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          v270 = v27;
                          if (!a4)
                          {
                            v37 = 0;
                            v13 = 0;
                            v12 = v275;
                            v66 = v273;
LABEL_219:

                            goto LABEL_220;
                          }
                          v127 = v15;
                          v128 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v129 = *MEMORY[0x1E0D025B8];
                          v312 = *MEMORY[0x1E0CB2D50];
                          v249 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("iTunesSubscriptionIdentifier"));
                          v313 = v249;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v313, &v312, 1);
                          v130 = objc_claimAutoreleasedReturnValue();
                          v131 = v128;
                          v15 = v127;
                          v38 = (void *)v130;
                          v132 = v129;
                          v17 = v276;
                          v37 = 0;
                          v13 = 0;
                          *a4 = (id)objc_msgSend(v131, "initWithDomain:code:userInfo:", v132, 2, v130);
                          v12 = v275;
                          v66 = v273;
                          goto LABEL_217;
                        }
                        v37 = v36;
                      }
                      else
                      {
                        v37 = 0;
                      }
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAirPlayVideo"));
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      v251 = v15;
                      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (a4)
                          {
                            v133 = objc_alloc(MEMORY[0x1E0CB35C8]);
                            v266 = *MEMORY[0x1E0D025B8];
                            v310 = *MEMORY[0x1E0CB2D50];
                            v134 = v34;
                            v135 = objc_alloc(MEMORY[0x1E0CB3940]);
                            v215 = objc_opt_class();
                            v136 = v135;
                            v34 = v134;
                            obj = (id)objc_msgSend(v136, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v215, CFSTR("isAirPlayVideo"));
                            v311 = obj;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v311, &v310, 1);
                            v137 = objc_claimAutoreleasedReturnValue();
                            v138 = v266;
                            v17 = v276;
                            v267 = (void *)v137;
                            v249 = 0;
                            v13 = 0;
                            *a4 = (id)objc_msgSend(v133, "initWithDomain:code:userInfo:", v138, 2);
                            v12 = v275;
                            v15 = v251;
                            v66 = v273;

                            goto LABEL_216;
                          }
                          v249 = 0;
                          v13 = 0;
                          v12 = v275;
                          v66 = v273;
LABEL_217:

                          goto LABEL_218;
                        }
                        v249 = v38;
                      }
                      else
                      {
                        v249 = 0;
                      }
                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("outputDevices"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E38], "null");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = objc_msgSend(v39, "isEqual:", v40);

                      v248 = v34;
                      if (v41)
                      {
                        v238 = v37;
                        v240 = v38;
                        v242 = v7;

                        v39 = 0;
LABEL_84:
                        v265 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v39, "count"));
                        v281 = 0u;
                        v282 = 0u;
                        v283 = 0u;
                        v284 = 0u;
                        v76 = v39;
                        v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v281, v307, 16);
                        obj = v76;
                        if (!v77)
                          goto LABEL_94;
                        v78 = v77;
                        v79 = *(_QWORD *)v282;
LABEL_86:
                        v80 = 0;
                        while (1)
                        {
                          if (*(_QWORD *)v282 != v79)
                            objc_enumerationMutation(obj);
                          v81 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * v80);
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                            break;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            v139 = a4;
                            if (a4)
                            {
                              v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v141 = *MEMORY[0x1E0D025B8];
                              v303 = *MEMORY[0x1E0CB2D50];
                              v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSDictionary"), objc_opt_class(), CFSTR("outputDevices"));
                              v304 = v82;
                              v142 = (void *)MEMORY[0x1E0C99D80];
                              v143 = &v304;
                              v144 = &v303;
                              goto LABEL_133;
                            }
                            goto LABEL_143;
                          }
                          v82 = v81;
                          v83 = [BMMediaNowPlayingOutputDevice alloc];
                          v280 = 0;
                          v84 = -[BMMediaNowPlayingOutputDevice initWithJSONDictionary:error:](v83, "initWithJSONDictionary:error:", v82, &v280);
                          v85 = v280;
                          if (v85)
                          {
                            v88 = v85;
                            if (a4)
                              *a4 = objc_retainAutorelease(v85);

                            v13 = 0;
                            v237 = obj;
                            v7 = v242;
                            v12 = v275;
                            v17 = v276;
                            goto LABEL_138;
                          }
                          objc_msgSend(v265, "addObject:", v84);

                          ++v80;
                          v17 = v276;
                          if (v78 == v80)
                          {
                            v76 = obj;
                            v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v281, v307, 16);
                            if (v78)
                              goto LABEL_86;
LABEL_94:

                            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
                            v82 = (id)objc_claimAutoreleasedReturnValue();
                            if (!v82 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v237 = 0;
                              goto LABEL_97;
                            }
                            objc_opt_class();
                            v37 = v238;
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v237 = v82;
LABEL_97:
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iTunesArtistIdentifier"));
                              v86 = objc_claimAutoreleasedReturnValue();
                              v235 = (void *)v86;
                              if (!v86)
                              {
                                v88 = 0;
                                v7 = v242;
                                goto LABEL_153;
                              }
                              v87 = (void *)v86;
                              objc_opt_class();
                              v7 = v242;
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v88 = v87;
                                  goto LABEL_153;
                                }
                                if (a4)
                                {
                                  v165 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v166 = *MEMORY[0x1E0D025B8];
                                  v299 = *MEMORY[0x1E0CB2D50];
                                  v167 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v216 = objc_opt_class();
                                  v168 = v167;
                                  v17 = v276;
                                  v234 = (id)objc_msgSend(v168, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v216, CFSTR("iTunesArtistIdentifier"));
                                  v300 = v234;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v300, &v299, 1);
                                  v233 = (void *)objc_claimAutoreleasedReturnValue();
                                  v169 = (id)objc_msgSend(v165, "initWithDomain:code:userInfo:", v166, 2);
                                  v88 = 0;
                                  v13 = 0;
                                  *a4 = v169;
                                  v12 = v275;
                                  v66 = v273;
                                  v37 = v238;
                                  v38 = v240;
                                  goto LABEL_210;
                                }
                                v88 = 0;
                                v13 = 0;
                                v12 = v275;
                                v66 = v273;
                                v37 = v238;
                                v38 = v240;
                                goto LABEL_211;
                              }
                              v88 = 0;
LABEL_153:
                              v37 = v238;
                              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("iTunesAlbumIdentifier"));
                              v153 = objc_claimAutoreleasedReturnValue();
                              v38 = v240;
                              v233 = (void *)v153;
                              if (v153 && (v154 = (void *)v153, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v234 = v154;
                                  goto LABEL_156;
                                }
                                if (!a4)
                                {
                                  v234 = 0;
                                  v13 = 0;
                                  v12 = v275;
                                  v66 = v273;
                                  goto LABEL_210;
                                }
                                v170 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                v243 = *MEMORY[0x1E0D025B8];
                                v297 = *MEMORY[0x1E0CB2D50];
                                v171 = objc_alloc(MEMORY[0x1E0CB3940]);
                                v217 = objc_opt_class();
                                v172 = v171;
                                v17 = v276;
                                v239 = (id)objc_msgSend(v172, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v217, CFSTR("iTunesAlbumIdentifier"));
                                v298 = v239;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v298, &v297, 1);
                                v232 = (void *)objc_claimAutoreleasedReturnValue();
                                v173 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v243, 2);
                                v234 = 0;
                                v13 = 0;
                                *a4 = v173;
                              }
                              else
                              {
                                v234 = 0;
LABEL_156:
                                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("groupIdentifier"));
                                v155 = objc_claimAutoreleasedReturnValue();
                                v232 = (void *)v155;
                                if (!v155
                                  || (v156 = (void *)v155, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  v239 = 0;
LABEL_159:
                                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isRemoteControl"));
                                  v157 = objc_claimAutoreleasedReturnValue();
                                  v229 = (void *)v157;
                                  if (!v157
                                    || (v158 = (void *)v157, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    v231 = 0;
LABEL_162:
                                    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemMediaType"));
                                    v159 = objc_claimAutoreleasedReturnValue();
                                    v226 = (void *)v159;
                                    if (!v159
                                      || (v160 = (void *)v159, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      v230 = 0;
LABEL_189:
                                      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("itemMediaSubtype"));
                                      v184 = objc_claimAutoreleasedReturnValue();
                                      v225 = (void *)v184;
                                      if (!v184
                                        || (v185 = (void *)v184, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        v228 = 0;
LABEL_197:
                                        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAirPlayActive"));
                                        v187 = objc_claimAutoreleasedReturnValue();
                                        v224 = (void *)v187;
                                        if (!v187
                                          || (v188 = (void *)v187, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                        {
                                          v227 = 0;
LABEL_200:
                                          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("parentGroupContainsDiscoverableGroupLeader"));
                                          v189 = objc_claimAutoreleasedReturnValue();
                                          v241 = (void *)v189;
                                          if (!v189
                                            || (v190 = (void *)v189,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            v246 = 0;
                                            v12 = v275;
                                            v66 = v273;
                                            goto LABEL_203;
                                          }
                                          objc_opt_class();
                                          v12 = v275;
                                          v66 = v273;
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v246 = v190;
LABEL_203:
                                            v191 = objc_msgSend(v66, "intValue");
                                            v192 = objc_msgSend(v230, "intValue");
                                            v13 = objc_retain(-[BMMediaNowPlaying initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:](v255, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", v271, v12, v191, v274, v260, v270, v264, v262, v258, v256, v248,
                                                      v37,
                                                      v249,
                                                      v265,
                                                      v237,
                                                      v88,
                                                      v234,
                                                      v239,
                                                      v231,
                                                      __PAIR64__(objc_msgSend(v228, "intValue"), v192),
                                                      v227,
                                                      v246));
                                            v255 = v13;
                                            v17 = v276;
                                          }
                                          else
                                          {
                                            if (a4)
                                            {
                                              v247 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                              v223 = *MEMORY[0x1E0D025B8];
                                              v285 = *MEMORY[0x1E0CB2D50];
                                              v199 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), objc_opt_class(), CFSTR("parentGroupContainsDiscoverableGroupLeader"));
                                              v286 = v199;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v286, &v285, 1);
                                              v200 = (void *)objc_claimAutoreleasedReturnValue();
                                              *a4 = (id)objc_msgSend(v247, "initWithDomain:code:userInfo:", v223, 2, v200);

                                              v17 = v276;
                                            }
                                            v246 = 0;
                                            v13 = 0;
                                          }
LABEL_204:

LABEL_205:
LABEL_206:

LABEL_207:
LABEL_208:

LABEL_209:
LABEL_210:

LABEL_211:
LABEL_212:

                                          v34 = v248;
                                          goto LABEL_213;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) != 0)
                                        {
                                          v227 = v188;
                                          goto LABEL_200;
                                        }
                                        if (a4)
                                        {
                                          v194 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                          v195 = *MEMORY[0x1E0D025B8];
                                          v287 = *MEMORY[0x1E0CB2D50];
                                          v196 = objc_alloc(MEMORY[0x1E0CB3940]);
                                          v220 = objc_opt_class();
                                          v197 = v196;
                                          v17 = v276;
                                          v246 = (id)objc_msgSend(v197, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v220, CFSTR("isAirPlayActive"));
                                          v288 = v246;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v288, &v287, 1);
                                          v241 = (void *)objc_claimAutoreleasedReturnValue();
                                          v198 = (id)objc_msgSend(v194, "initWithDomain:code:userInfo:", v195, 2);
                                          v13 = 0;
                                          v227 = 0;
                                          *a4 = v198;
                                          v12 = v275;
                                          v66 = v273;
                                          goto LABEL_204;
                                        }
                                        v227 = 0;
                                        v13 = 0;
LABEL_253:
                                        v12 = v275;
                                        v66 = v273;
                                        goto LABEL_205;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v228 = v185;
LABEL_196:

                                        goto LABEL_197;
                                      }
                                      v245 = v7;
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) != 0)
                                      {
                                        v186 = v185;
                                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaNowPlayingMediaSubtypeFromString(v186));
                                        v228 = (id)objc_claimAutoreleasedReturnValue();

                                        goto LABEL_196;
                                      }
                                      if (a4)
                                      {
                                        v206 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                        v207 = *MEMORY[0x1E0D025B8];
                                        v289 = *MEMORY[0x1E0CB2D50];
                                        v208 = objc_alloc(MEMORY[0x1E0CB3940]);
                                        v222 = objc_opt_class();
                                        v209 = v208;
                                        v17 = v276;
                                        v227 = (id)objc_msgSend(v209, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v222, CFSTR("itemMediaSubtype"));
                                        v290 = v227;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
                                        v224 = (void *)objc_claimAutoreleasedReturnValue();
                                        v210 = (id)objc_msgSend(v206, "initWithDomain:code:userInfo:", v207, 2);
                                        v228 = 0;
                                        v13 = 0;
                                        *a4 = v210;
                                        v7 = v245;
                                        goto LABEL_253;
                                      }
                                      v228 = 0;
                                      v13 = 0;
LABEL_257:
                                      v38 = v240;
                                      v7 = v245;
                                      v12 = v275;
                                      v66 = v273;
                                      goto LABEL_206;
                                    }
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v230 = v160;
LABEL_188:

                                      goto LABEL_189;
                                    }
                                    v245 = v7;
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v183 = v160;
                                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaNowPlayingMediaTypeFromString(v183));
                                      v230 = (id)objc_claimAutoreleasedReturnValue();

                                      goto LABEL_188;
                                    }
                                    if (a4)
                                    {
                                      v201 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                      v202 = *MEMORY[0x1E0D025B8];
                                      v291 = *MEMORY[0x1E0CB2D50];
                                      v203 = objc_alloc(MEMORY[0x1E0CB3940]);
                                      v221 = objc_opt_class();
                                      v204 = v203;
                                      v17 = v276;
                                      v228 = (id)objc_msgSend(v204, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), v221, CFSTR("itemMediaType"));
                                      v292 = v228;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
                                      v225 = (void *)objc_claimAutoreleasedReturnValue();
                                      v205 = (id)objc_msgSend(v201, "initWithDomain:code:userInfo:", v202, 2);
                                      v230 = 0;
                                      v13 = 0;
                                      *a4 = v205;
                                      goto LABEL_257;
                                    }
                                    v230 = 0;
                                    v13 = 0;
LABEL_255:
                                    v12 = v275;
                                    v66 = v273;
                                    goto LABEL_207;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v231 = v158;
                                    goto LABEL_162;
                                  }
                                  if (a4)
                                  {
                                    v178 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                    v179 = *MEMORY[0x1E0D025B8];
                                    v293 = *MEMORY[0x1E0CB2D50];
                                    v180 = objc_alloc(MEMORY[0x1E0CB3940]);
                                    v219 = objc_opt_class();
                                    v181 = v180;
                                    v17 = v276;
                                    v230 = (id)objc_msgSend(v181, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v219, CFSTR("isRemoteControl"));
                                    v294 = v230;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
                                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                                    v182 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v179, 2);
                                    v231 = 0;
                                    v13 = 0;
                                    *a4 = v182;
                                    goto LABEL_255;
                                  }
                                  v231 = 0;
                                  v13 = 0;
LABEL_251:
                                  v12 = v275;
                                  v66 = v273;
                                  goto LABEL_208;
                                }
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v239 = v156;
                                  goto LABEL_159;
                                }
                                if (a4)
                                {
                                  v174 = objc_alloc(MEMORY[0x1E0CB35C8]);
                                  v244 = *MEMORY[0x1E0D025B8];
                                  v295 = *MEMORY[0x1E0CB2D50];
                                  v175 = objc_alloc(MEMORY[0x1E0CB3940]);
                                  v218 = objc_opt_class();
                                  v176 = v175;
                                  v17 = v276;
                                  v231 = (id)objc_msgSend(v176, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v218, CFSTR("groupIdentifier"));
                                  v296 = v231;
                                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v296, &v295, 1);
                                  v229 = (void *)objc_claimAutoreleasedReturnValue();
                                  v177 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v244, 2);
                                  v239 = 0;
                                  v13 = 0;
                                  *a4 = v177;
                                  goto LABEL_251;
                                }
                                v239 = 0;
                                v13 = 0;
                              }
                              v12 = v275;
                              v66 = v273;
                              goto LABEL_209;
                            }
                            v7 = v242;
                            if (a4)
                            {
                              v161 = objc_alloc(MEMORY[0x1E0CB35C8]);
                              v162 = *MEMORY[0x1E0D025B8];
                              v301 = *MEMORY[0x1E0CB2D50];
                              v88 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("bundleID"));
                              v302 = v88;
                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v302, &v301, 1);
                              v163 = objc_claimAutoreleasedReturnValue();
                              v164 = v162;
                              v17 = v276;
                              v236 = (void *)v163;
                              v237 = 0;
                              v13 = 0;
                              *a4 = (id)objc_msgSend(v161, "initWithDomain:code:userInfo:", v164, 2);
                              v12 = v275;
                              v66 = v273;
                              v38 = v240;

                              goto LABEL_212;
                            }
                            v237 = 0;
                            v13 = 0;
                            v12 = v275;
                            v66 = v273;
                            v38 = v240;
LABEL_213:

                            v151 = v237;
LABEL_214:

                            v15 = v251;
                            goto LABEL_216;
                          }
                        }
                        v139 = a4;
                        if (a4)
                        {
                          v140 = objc_alloc(MEMORY[0x1E0CB35C8]);
                          v141 = *MEMORY[0x1E0D025B8];
                          v305 = *MEMORY[0x1E0CB2D50];
                          v82 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type null for element of %@, must not be null"), CFSTR("outputDevices"));
                          v306 = v82;
                          v142 = (void *)MEMORY[0x1E0C99D80];
                          v143 = &v306;
                          v144 = &v305;
LABEL_133:
                          objc_msgSend(v142, "dictionaryWithObjects:forKeys:count:", v143, v144, 1);
                          v88 = (id)objc_claimAutoreleasedReturnValue();
                          v145 = v141;
                          v17 = v276;
                          v146 = (id)objc_msgSend(v140, "initWithDomain:code:userInfo:", v145, 2, v88);
                          v13 = 0;
                          *v139 = v146;
                          v237 = obj;
                          v7 = v242;
                          v12 = v275;
LABEL_138:
                          v66 = v273;
                          v37 = v238;
                          v38 = v240;
                          goto LABEL_212;
                        }
LABEL_143:
                        v13 = 0;
                        v151 = obj;
                        v7 = v242;
                        v12 = v275;
                        v66 = v273;
                        v37 = v238;
                        v38 = v240;
                        goto LABEL_214;
                      }
                      if (!v39 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        v238 = v37;
                        v240 = v38;
                        v242 = v7;
                        goto LABEL_84;
                      }
                      obj = v39;
                      if (a4)
                      {
                        v147 = objc_alloc(MEMORY[0x1E0CB35C8]);
                        v148 = *MEMORY[0x1E0D025B8];
                        v308 = *MEMORY[0x1E0CB2D50];
                        v265 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expecting %@ as an array"), CFSTR("outputDevices"));
                        v309 = v265;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v309, &v308, 1);
                        v149 = objc_claimAutoreleasedReturnValue();
                        v150 = v148;
                        v151 = (void *)v149;
                        v152 = (id)objc_msgSend(v147, "initWithDomain:code:userInfo:", v150, 2, v149);
                        v13 = 0;
                        *a4 = v152;
                        v12 = v275;
                        v66 = v273;
                        goto LABEL_214;
                      }
                      v13 = 0;
                      v12 = v275;
                      v15 = v251;
                      v66 = v273;
LABEL_216:

                      goto LABEL_217;
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v34 = v33;
                      goto LABEL_59;
                    }
                    v270 = v27;
                    if (a4)
                    {
                      v114 = v15;
                      v115 = objc_alloc(MEMORY[0x1E0CB35C8]);
                      v116 = *MEMORY[0x1E0D025B8];
                      v314 = *MEMORY[0x1E0CB2D50];
                      v37 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("iTunesStoreIdentifier"));
                      v315 = v37;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v315, &v314, 1);
                      v117 = objc_claimAutoreleasedReturnValue();
                      v118 = v115;
                      v15 = v114;
                      v119 = v116;
                      v17 = v276;
                      v250 = (void *)v117;
                      v34 = 0;
                      v13 = 0;
                      *a4 = (id)objc_msgSend(v118, "initWithDomain:code:userInfo:", v119, 2);
                      v12 = v275;
                      v66 = v273;
LABEL_218:
                      v27 = v270;
                      goto LABEL_219;
                    }
                    v34 = 0;
                    v13 = 0;
LABEL_149:
                    v12 = v275;
                    v66 = v273;
                    v27 = v270;
LABEL_220:

                    self = v255;
                    goto LABEL_221;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v258 = v29;
                    goto LABEL_53;
                  }
                  if (a4)
                  {
                    v98 = v15;
                    v99 = objc_alloc(MEMORY[0x1E0CB35C8]);
                    v100 = *MEMORY[0x1E0D025B8];
                    v318 = *MEMORY[0x1E0CB2D50];
                    v101 = self;
                    v102 = v7;
                    v103 = v20;
                    v104 = objc_alloc(MEMORY[0x1E0CB3940]);
                    v213 = objc_opt_class();
                    v105 = v104;
                    v20 = v103;
                    v7 = v102;
                    self = v101;
                    v256 = (id)objc_msgSend(v105, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v213, CFSTR("elapsed"));
                    v319 = v256;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v319, &v318, 1);
                    v106 = objc_claimAutoreleasedReturnValue();
                    v107 = v99;
                    v15 = v98;
                    v108 = v100;
                    v17 = v276;
                    v257 = (void *)v106;
                    v258 = 0;
                    v13 = 0;
                    *a4 = (id)objc_msgSend(v107, "initWithDomain:code:userInfo:", v108, 2);
                    v12 = v275;
                    v66 = v273;
LABEL_222:

                    goto LABEL_223;
                  }
                  v258 = 0;
                  v13 = 0;
                  v12 = v275;
                  v66 = v273;
LABEL_223:

                  goto LABEL_224;
                }
                if (a4)
                {
                  v92 = v15;
                  v93 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v94 = *MEMORY[0x1E0D025B8];
                  v320 = *MEMORY[0x1E0CB2D50];
                  v258 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("title"));
                  v321 = v258;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v321, &v320, 1);
                  v95 = objc_claimAutoreleasedReturnValue();
                  v96 = v93;
                  v15 = v92;
                  v97 = v94;
                  v17 = v276;
                  v259 = (void *)v95;
                  v262 = 0;
                  v13 = 0;
                  *a4 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v97, 2);
                  v12 = v275;
                  v66 = v273;
                  v27 = v270;
                  goto LABEL_223;
                }
                v262 = 0;
                v13 = 0;
                v12 = v275;
                v66 = v273;
                v27 = v270;
LABEL_224:

                goto LABEL_225;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v264 = v24;
                goto LABEL_36;
              }
              if (a4)
              {
                v252 = v15;
                v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
                v68 = *MEMORY[0x1E0D025B8];
                v322 = *MEMORY[0x1E0CB2D50];
                v69 = v7;
                v70 = v20;
                v71 = objc_alloc(MEMORY[0x1E0CB3940]);
                v212 = objc_opt_class();
                v72 = v71;
                v20 = v70;
                v7 = v69;
                v262 = (id)objc_msgSend(v72, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), v212, CFSTR("genre"));
                v323 = v262;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v323, &v322, 1);
                v73 = objc_claimAutoreleasedReturnValue();
                v74 = v67;
                v15 = v252;
                v75 = v68;
                v17 = v276;
                v263 = (void *)v73;
                v264 = 0;
                v13 = 0;
                *a4 = (id)objc_msgSend(v74, "initWithDomain:code:userInfo:", v75, 2);
                v12 = v275;
                v66 = v273;
                v27 = v270;
                goto LABEL_224;
              }
              v264 = 0;
              v13 = 0;
              v12 = v275;
              v66 = v273;
              v27 = v270;
LABEL_225:

              goto LABEL_226;
            }
            v27 = a4;
            if (a4)
            {
              v55 = v15;
              v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v57 = *MEMORY[0x1E0D025B8];
              v324 = *MEMORY[0x1E0CB2D50];
              v58 = self;
              v59 = v7;
              v60 = v20;
              v61 = objc_alloc(MEMORY[0x1E0CB3940]);
              v211 = objc_opt_class();
              v62 = v61;
              v20 = v60;
              v7 = v59;
              self = v58;
              v264 = (id)objc_msgSend(v62, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber"), v211, CFSTR("duration"));
              v325 = v264;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v325, &v324, 1);
              v63 = objc_claimAutoreleasedReturnValue();
              v64 = v56;
              v15 = v55;
              v65 = v57;
              v17 = v276;
              v268 = (void *)v63;
              v13 = 0;
              *a4 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
              v27 = 0;
              v12 = v275;
              v66 = v273;
              goto LABEL_225;
            }
            v13 = 0;
LABEL_123:
            v12 = v275;
            v66 = v273;
LABEL_226:

            goto LABEL_227;
          }
          if (a4)
          {
            v48 = v15;
            v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v50 = *MEMORY[0x1E0D025B8];
            v326 = *MEMORY[0x1E0CB2D50];
            v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("artist"));
            v327 = v51;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v327, &v326, 1);
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = v49;
            v15 = v48;
            v54 = v50;
            v17 = v276;
            v269 = (void *)v52;
            v20 = 0;
            v13 = 0;
            *a4 = (id)objc_msgSend(v53, "initWithDomain:code:userInfo:", v54, 2);
            v27 = (id *)v51;
            goto LABEL_123;
          }
          v20 = 0;
          v13 = 0;
LABEL_117:
          v12 = v275;
          v66 = v273;
LABEL_227:

          v6 = v271;
          goto LABEL_228;
        }
        if (a4)
        {
          v42 = v15;
          v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v44 = *MEMORY[0x1E0D025B8];
          v328 = *MEMORY[0x1E0CB2D50];
          v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("album"));
          v329 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v329, &v328, 1);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v43;
          v15 = v42;
          v47 = v44;
          v17 = v276;
          v272 = (void *)v45;
          v274 = 0;
          v13 = 0;
          *a4 = (id)objc_msgSend(v46, "initWithDomain:code:userInfo:", v47, 2);
          goto LABEL_117;
        }
        v274 = 0;
        v13 = 0;
        v12 = v275;
        v66 = v273;
LABEL_228:

        goto LABEL_229;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BMMediaNowPlayingPlaybackStateFromString(v16));
        v273 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_23;
      }
      if (a4)
      {
        v277 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v89 = *MEMORY[0x1E0D025B8];
        v330 = *MEMORY[0x1E0CB2D50];
        v274 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)"), objc_opt_class(), CFSTR("playbackState"));
        v331 = v274;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v331, &v330, 1);
        v90 = objc_claimAutoreleasedReturnValue();
        v91 = v89;
        v17 = (void *)v90;
        v13 = 0;
        *a4 = (id)objc_msgSend(v277, "initWithDomain:code:userInfo:", v91, 2, v90);
        v66 = 0;
        v12 = v275;
        goto LABEL_228;
      }
      v13 = 0;
      v12 = v275;
      v66 = 0;
LABEL_229:

      goto LABEL_230;
    }
    if (a4)
    {
      v120 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v121 = *MEMORY[0x1E0D025B8];
      v332 = *MEMORY[0x1E0CB2D50];
      v122 = self;
      v123 = objc_alloc(MEMORY[0x1E0CB3940]);
      v214 = objc_opt_class();
      v124 = v123;
      self = v122;
      v66 = (void *)objc_msgSend(v124, "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate"), v214, CFSTR("absoluteTimestamp"));
      v333 = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v333, &v332, 1);
      v125 = objc_claimAutoreleasedReturnValue();
      v126 = v120;
      v15 = (void *)v125;
      v12 = 0;
      v13 = 0;
      *a4 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v121, 2, v125);
      goto LABEL_229;
    }
    v12 = 0;
    v13 = 0;
LABEL_230:

    goto LABEL_231;
  }
  if (a4)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = *MEMORY[0x1E0D025B8];
    v334 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected type %@ for element of %@, expecting NSString"), objc_opt_class(), CFSTR("uniqueID"));
    v335[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v335, &v334, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v13 = 0;
    *a4 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 2, v7);
    goto LABEL_230;
  }
  v6 = 0;
  v13 = 0;
LABEL_231:

  return v13;
}

- (id)_outputDevicesJSONArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[BMMediaNowPlaying outputDevices](self, "outputDevices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "jsonDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
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
  id v54;
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
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  _QWORD v80[23];
  _QWORD v81[25];

  v81[23] = *MEMORY[0x1E0C80C00];
  -[BMMediaNowPlaying uniqueID](self, "uniqueID");
  v3 = objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[BMMediaNowPlaying absoluteTimestamp](self, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaNowPlaying playbackState](self, "playbackState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying album](self, "album");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying artist](self, "artist");
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[BMMediaNowPlaying hasDuration](self, "hasDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMediaNowPlaying duration](self, "duration"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  -[BMMediaNowPlaying genre](self, "genre");
  v12 = objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying title](self, "title");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMediaNowPlaying hasElapsed](self, "hasElapsed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[BMMediaNowPlaying elapsed](self, "elapsed"));
    v78 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  -[BMMediaNowPlaying mediaType](self, "mediaType");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesSubscriptionIdentifier](self, "iTunesSubscriptionIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMediaNowPlaying hasIsAirPlayVideo](self, "hasIsAirPlayVideo"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isAirPlayVideo](self, "isAirPlayVideo"));
    v74 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v74 = 0;
  }
  -[BMMediaNowPlaying _outputDevicesJSONArray](self, "_outputDevicesJSONArray");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying bundleID](self, "bundleID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesArtistIdentifier](self, "iTunesArtistIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying iTunesAlbumIdentifier](self, "iTunesAlbumIdentifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMMediaNowPlaying groupIdentifier](self, "groupIdentifier");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMediaNowPlaying hasIsRemoteControl](self, "hasIsRemoteControl"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isRemoteControl](self, "isRemoteControl"));
    v68 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v68 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaNowPlaying itemMediaType](self, "itemMediaType"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BMMediaNowPlaying itemMediaSubtype](self, "itemMediaSubtype"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BMMediaNowPlaying hasIsAirPlayActive](self, "hasIsAirPlayActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying isAirPlayActive](self, "isAirPlayActive"));
    v65 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v65 = 0;
  }
  if (-[BMMediaNowPlaying hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[BMMediaNowPlaying parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v80[0] = CFSTR("uniqueID");
  v14 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v14;
  v81[0] = v14;
  v80[1] = CFSTR("absoluteTimestamp");
  v15 = (uint64_t)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v15;
  v81[1] = v15;
  v80[2] = CFSTR("playbackState");
  v16 = (uint64_t)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v16;
  v81[2] = v16;
  v80[3] = CFSTR("album");
  v17 = (uint64_t)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v17;
  v81[3] = v17;
  v80[4] = CFSTR("artist");
  v18 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v18;
  v81[4] = v18;
  v80[5] = CFSTR("duration");
  v19 = (uint64_t)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v19;
  v81[5] = v19;
  v80[6] = CFSTR("genre");
  v20 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v20;
  v81[6] = v20;
  v80[7] = CFSTR("title");
  v21 = (uint64_t)v79;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v81[7] = v21;
  v80[8] = CFSTR("elapsed");
  v22 = (uint64_t)v78;
  if (!v78)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v81[8] = v22;
  v80[9] = CFSTR("mediaType");
  v23 = (uint64_t)v77;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v59 = (void *)v23;
  v81[9] = v23;
  v80[10] = CFSTR("iTunesStoreIdentifier");
  v24 = (uint64_t)v76;
  if (!v76)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v58 = (void *)v24;
  v81[10] = v24;
  v80[11] = CFSTR("iTunesSubscriptionIdentifier");
  v25 = (uint64_t)v75;
  if (!v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v57 = (void *)v25;
  v81[11] = v25;
  v80[12] = CFSTR("isAirPlayVideo");
  v26 = (uint64_t)v74;
  if (!v74)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v63 = (void *)v3;
  v81[12] = v26;
  v80[13] = CFSTR("outputDevices");
  v27 = (uint64_t)v73;
  v28 = (void *)v26;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v10;
  v81[13] = v27;
  v80[14] = CFSTR("bundleID");
  v29 = (uint64_t)v72;
  v30 = (void *)v27;
  if (!v72)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v29 = objc_claimAutoreleasedReturnValue();
  }
  v62 = v7;
  v56 = (void *)v29;
  v81[14] = v29;
  v80[15] = CFSTR("iTunesArtistIdentifier");
  v31 = (uint64_t)v71;
  if (!v71)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v64 = v13;
  v81[15] = v31;
  v80[16] = CFSTR("iTunesAlbumIdentifier");
  v32 = (uint64_t)v70;
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v46 = (void *)v21;
  v81[16] = v32;
  v80[17] = CFSTR("groupIdentifier");
  v33 = (uint64_t)v69;
  if (!v69)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v22;
  v42 = v33;
  v81[17] = v33;
  v80[18] = CFSTR("isRemoteControl");
  v34 = v68;
  if (!v68)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v44 = v30;
  v60 = (void *)v12;
  v81[18] = v34;
  v80[19] = CFSTR("itemMediaType");
  v35 = v67;
  if (!v67)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v32;
  v36 = v11;
  v81[19] = v35;
  v80[20] = CFSTR("itemMediaSubtype");
  v37 = v66;
  if (!v66)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v31;
  v81[20] = v37;
  v80[21] = CFSTR("isAirPlayActive");
  v39 = v65;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81[21] = v39;
  v80[22] = CFSTR("parentGroupContainsDiscoverableGroupLeader");
  v40 = v64;
  if (!v64)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v81[22] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 23, v42);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!v64)

  if (!v65)
  if (!v66)

  if (!v67)
  if (!v68)

  if (!v69)
  if (!v70)

  if (!v71)
  if (!v72)

  if (!v73)
  if (!v74)

  if (!v75)
  if (!v76)

  if (!v77)
  if (!v78)

  if (v79)
  {
    if (v60)
      goto LABEL_100;
  }
  else
  {

    if (v60)
    {
LABEL_100:
      if (v36)
        goto LABEL_101;
      goto LABEL_109;
    }
  }

  if (v36)
  {
LABEL_101:
    if (v61)
      goto LABEL_102;
    goto LABEL_110;
  }
LABEL_109:

  if (v61)
  {
LABEL_102:
    if (v9)
      goto LABEL_103;
    goto LABEL_111;
  }
LABEL_110:

  if (v9)
  {
LABEL_103:
    if (v8)
      goto LABEL_104;
    goto LABEL_112;
  }
LABEL_111:

  if (v8)
  {
LABEL_104:
    if (v62)
      goto LABEL_105;
LABEL_113:

    if (v63)
      goto LABEL_106;
LABEL_114:

    goto LABEL_106;
  }
LABEL_112:

  if (!v62)
    goto LABEL_113;
LABEL_105:
  if (!v63)
    goto LABEL_114;
LABEL_106:

  return v54;
}

- (NSDate)absoluteTimestamp
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E0D02620];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_raw_absoluteTimestamp);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "convertValue:toType:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  unsigned int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  _BOOL4 v99;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMMediaNowPlaying uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[BMMediaNowPlaying uniqueID](self, "uniqueID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_92;
    }
    -[BMMediaNowPlaying absoluteTimestamp](self, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[BMMediaNowPlaying absoluteTimestamp](self, "absoluteTimestamp");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_92;
    }
    v19 = -[BMMediaNowPlaying playbackState](self, "playbackState");
    if (v19 == objc_msgSend(v5, "playbackState"))
    {
      -[BMMediaNowPlaying album](self, "album");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "album");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[BMMediaNowPlaying album](self, "album");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "album");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying artist](self, "artist");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "artist");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[BMMediaNowPlaying artist](self, "artist");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "artist");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_92;
      }
      if (-[BMMediaNowPlaying hasDuration](self, "hasDuration") || objc_msgSend(v5, "hasDuration"))
      {
        if (!-[BMMediaNowPlaying hasDuration](self, "hasDuration"))
          goto LABEL_92;
        if (!objc_msgSend(v5, "hasDuration"))
          goto LABEL_92;
        v32 = -[BMMediaNowPlaying duration](self, "duration");
        if (v32 != objc_msgSend(v5, "duration"))
          goto LABEL_92;
      }
      -[BMMediaNowPlaying genre](self, "genre");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "genre");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v33 == (void *)v34)
      {

      }
      else
      {
        v35 = (void *)v34;
        -[BMMediaNowPlaying genre](self, "genre");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "genre");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if (!v38)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying title](self, "title");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v40 = objc_claimAutoreleasedReturnValue();
      if (v39 == (void *)v40)
      {

      }
      else
      {
        v41 = (void *)v40;
        -[BMMediaNowPlaying title](self, "title");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "title");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "isEqual:", v43);

        if (!v44)
          goto LABEL_92;
      }
      if (-[BMMediaNowPlaying hasElapsed](self, "hasElapsed") || objc_msgSend(v5, "hasElapsed"))
      {
        if (!-[BMMediaNowPlaying hasElapsed](self, "hasElapsed"))
          goto LABEL_92;
        if (!objc_msgSend(v5, "hasElapsed"))
          goto LABEL_92;
        v45 = -[BMMediaNowPlaying elapsed](self, "elapsed");
        if (v45 != objc_msgSend(v5, "elapsed"))
          goto LABEL_92;
      }
      -[BMMediaNowPlaying mediaType](self, "mediaType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaType");
      v47 = objc_claimAutoreleasedReturnValue();
      if (v46 == (void *)v47)
      {

      }
      else
      {
        v48 = (void *)v47;
        -[BMMediaNowPlaying mediaType](self, "mediaType");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "mediaType");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v49, "isEqual:", v50);

        if (!v51)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iTunesStoreIdentifier");
      v53 = objc_claimAutoreleasedReturnValue();
      if (v52 == (void *)v53)
      {

      }
      else
      {
        v54 = (void *)v53;
        -[BMMediaNowPlaying iTunesStoreIdentifier](self, "iTunesStoreIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "iTunesStoreIdentifier");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v55, "isEqual:", v56);

        if (!v57)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying iTunesSubscriptionIdentifier](self, "iTunesSubscriptionIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iTunesSubscriptionIdentifier");
      v59 = objc_claimAutoreleasedReturnValue();
      if (v58 == (void *)v59)
      {

      }
      else
      {
        v60 = (void *)v59;
        -[BMMediaNowPlaying iTunesSubscriptionIdentifier](self, "iTunesSubscriptionIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "iTunesSubscriptionIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v61, "isEqual:", v62);

        if (!v63)
          goto LABEL_92;
      }
      if (-[BMMediaNowPlaying hasIsAirPlayVideo](self, "hasIsAirPlayVideo")
        || objc_msgSend(v5, "hasIsAirPlayVideo"))
      {
        if (!-[BMMediaNowPlaying hasIsAirPlayVideo](self, "hasIsAirPlayVideo"))
          goto LABEL_92;
        if (!objc_msgSend(v5, "hasIsAirPlayVideo"))
          goto LABEL_92;
        v64 = -[BMMediaNowPlaying isAirPlayVideo](self, "isAirPlayVideo");
        if (v64 != objc_msgSend(v5, "isAirPlayVideo"))
          goto LABEL_92;
      }
      -[BMMediaNowPlaying outputDevices](self, "outputDevices");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outputDevices");
      v66 = objc_claimAutoreleasedReturnValue();
      if (v65 == (void *)v66)
      {

      }
      else
      {
        v67 = (void *)v66;
        -[BMMediaNowPlaying outputDevices](self, "outputDevices");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "outputDevices");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v68, "isEqual:", v69);

        if (!v70)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying bundleID](self, "bundleID");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleID");
      v72 = objc_claimAutoreleasedReturnValue();
      if (v71 == (void *)v72)
      {

      }
      else
      {
        v73 = (void *)v72;
        -[BMMediaNowPlaying bundleID](self, "bundleID");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v74, "isEqual:", v75);

        if (!v76)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying iTunesArtistIdentifier](self, "iTunesArtistIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iTunesArtistIdentifier");
      v78 = objc_claimAutoreleasedReturnValue();
      if (v77 == (void *)v78)
      {

      }
      else
      {
        v79 = (void *)v78;
        -[BMMediaNowPlaying iTunesArtistIdentifier](self, "iTunesArtistIdentifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "iTunesArtistIdentifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend(v80, "isEqual:", v81);

        if (!v82)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying iTunesAlbumIdentifier](self, "iTunesAlbumIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "iTunesAlbumIdentifier");
      v84 = objc_claimAutoreleasedReturnValue();
      if (v83 == (void *)v84)
      {

      }
      else
      {
        v85 = (void *)v84;
        -[BMMediaNowPlaying iTunesAlbumIdentifier](self, "iTunesAlbumIdentifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "iTunesAlbumIdentifier");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v86, "isEqual:", v87);

        if (!v88)
          goto LABEL_92;
      }
      -[BMMediaNowPlaying groupIdentifier](self, "groupIdentifier");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupIdentifier");
      v90 = objc_claimAutoreleasedReturnValue();
      if (v89 == (void *)v90)
      {

      }
      else
      {
        v91 = (void *)v90;
        -[BMMediaNowPlaying groupIdentifier](self, "groupIdentifier");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "groupIdentifier");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v92, "isEqual:", v93);

        if (!v94)
          goto LABEL_92;
      }
      if (!-[BMMediaNowPlaying hasIsRemoteControl](self, "hasIsRemoteControl")
        && !objc_msgSend(v5, "hasIsRemoteControl")
        || -[BMMediaNowPlaying hasIsRemoteControl](self, "hasIsRemoteControl")
        && objc_msgSend(v5, "hasIsRemoteControl")
        && (v95 = -[BMMediaNowPlaying isRemoteControl](self, "isRemoteControl"),
            v95 == objc_msgSend(v5, "isRemoteControl")))
      {
        v96 = -[BMMediaNowPlaying itemMediaType](self, "itemMediaType");
        if (v96 == objc_msgSend(v5, "itemMediaType"))
        {
          v97 = -[BMMediaNowPlaying itemMediaSubtype](self, "itemMediaSubtype");
          if (v97 == objc_msgSend(v5, "itemMediaSubtype"))
          {
            if (!-[BMMediaNowPlaying hasIsAirPlayActive](self, "hasIsAirPlayActive")
              && !objc_msgSend(v5, "hasIsAirPlayActive")
              || -[BMMediaNowPlaying hasIsAirPlayActive](self, "hasIsAirPlayActive")
              && objc_msgSend(v5, "hasIsAirPlayActive")
              && (v98 = -[BMMediaNowPlaying isAirPlayActive](self, "isAirPlayActive"),
                  v98 == objc_msgSend(v5, "isAirPlayActive")))
            {
              if (!-[BMMediaNowPlaying hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader")&& !objc_msgSend(v5, "hasParentGroupContainsDiscoverableGroupLeader"))
              {
                LOBYTE(v12) = 1;
                goto LABEL_93;
              }
              if (-[BMMediaNowPlaying hasParentGroupContainsDiscoverableGroupLeader](self, "hasParentGroupContainsDiscoverableGroupLeader")&& objc_msgSend(v5, "hasParentGroupContainsDiscoverableGroupLeader"))
              {
                v99 = -[BMMediaNowPlaying parentGroupContainsDiscoverableGroupLeader](self, "parentGroupContainsDiscoverableGroupLeader");
                v12 = v99 ^ objc_msgSend(v5, "parentGroupContainsDiscoverableGroupLeader") ^ 1;
LABEL_93:

                goto LABEL_94;
              }
            }
          }
        }
      }
    }
LABEL_92:
    LOBYTE(v12) = 0;
    goto LABEL_93;
  }
  LOBYTE(v12) = 0;
LABEL_94:

  return v12;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (int)playbackState
{
  return self->_playbackState;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)hasDuration
{
  return self->_hasDuration;
}

- (void)setHasDuration:(BOOL)a3
{
  self->_hasDuration = a3;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)title
{
  return self->_title;
}

- (unsigned)elapsed
{
  return self->_elapsed;
}

- (BOOL)hasElapsed
{
  return self->_hasElapsed;
}

- (void)setHasElapsed:(BOOL)a3
{
  self->_hasElapsed = a3;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (NSString)iTunesSubscriptionIdentifier
{
  return self->_iTunesSubscriptionIdentifier;
}

- (BOOL)isAirPlayVideo
{
  return self->_isAirPlayVideo;
}

- (BOOL)hasIsAirPlayVideo
{
  return self->_hasIsAirPlayVideo;
}

- (void)setHasIsAirPlayVideo:(BOOL)a3
{
  self->_hasIsAirPlayVideo = a3;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)iTunesArtistIdentifier
{
  return self->_iTunesArtistIdentifier;
}

- (NSString)iTunesAlbumIdentifier
{
  return self->_iTunesAlbumIdentifier;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (BOOL)isRemoteControl
{
  return self->_isRemoteControl;
}

- (BOOL)hasIsRemoteControl
{
  return self->_hasIsRemoteControl;
}

- (void)setHasIsRemoteControl:(BOOL)a3
{
  self->_hasIsRemoteControl = a3;
}

- (int)itemMediaType
{
  return self->_itemMediaType;
}

- (int)itemMediaSubtype
{
  return self->_itemMediaSubtype;
}

- (BOOL)isAirPlayActive
{
  return self->_isAirPlayActive;
}

- (BOOL)hasIsAirPlayActive
{
  return self->_hasIsAirPlayActive;
}

- (void)setHasIsAirPlayActive:(BOOL)a3
{
  self->_hasIsAirPlayActive = a3;
}

- (BOOL)parentGroupContainsDiscoverableGroupLeader
{
  return self->_parentGroupContainsDiscoverableGroupLeader;
}

- (BOOL)hasParentGroupContainsDiscoverableGroupLeader
{
  return self->_hasParentGroupContainsDiscoverableGroupLeader;
}

- (void)setHasParentGroupContainsDiscoverableGroupLeader:(BOOL)a3
{
  self->_hasParentGroupContainsDiscoverableGroupLeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesAlbumIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesArtistIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_iTunesSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

+ (unsigned)latestDataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  void *v6;
  _DWORD *v7;

  if (a4 == 1)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B90];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

    v7 = -[BMMediaNowPlaying initByReadFrom:]([BMMediaNowPlaying alloc], "initByReadFrom:", v6);
    v7[11] = 1;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)columns
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
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
  _QWORD v27[25];

  v27[23] = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("uniqueID"), 2, 0, 1, 13, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("absoluteTimestamp"), 3, 0, 2, 0, 1);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("playbackState"), 0, 0, 3, 4, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("album"), 2, 0, 4, 13, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("artist"), 2, 0, 5, 13, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("duration"), 0, 0, 6, 4, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("genre"), 2, 0, 7, 13, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("title"), 2, 0, 8, 13, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("elapsed"), 0, 0, 9, 4, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("mediaType"), 2, 0, 10, 13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iTunesStoreIdentifier"), 2, 0, 11, 13, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iTunesSubscriptionIdentifier"), 2, 0, 12, 13, 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAirPlayVideo"), 0, 0, 13, 12, 0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02710]), "initWithName:dataType:requestOnly:extractBlock:", CFSTR("outputDevices_json"), 5, 1, &__block_literal_global_266);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("bundleID"), 2, 0, 15, 13, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iTunesArtistIdentifier"), 2, 0, 16, 13, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("iTunesAlbumIdentifier"), 2, 0, 17, 13, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("groupIdentifier"), 2, 0, 18, 13, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isRemoteControl"), 0, 0, 19, 12, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemMediaType"), 0, 0, 20, 4, 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("itemMediaSubtype"), 0, 0, 21, 4, 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("isAirPlayActive"), 0, 0, 22, 12, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02720]), "initWithName:dataType:requestOnly:fieldNumber:protoDataType:convertedType:", CFSTR("parentGroupContainsDiscoverableGroupLeader"), 0, 0, 23, 12, 0);
  v27[0] = v26;
  v27[1] = v25;
  v27[2] = v24;
  v27[3] = v23;
  v27[4] = v22;
  v27[5] = v21;
  v27[6] = v20;
  v27[7] = v19;
  v27[8] = v18;
  v27[9] = v17;
  v27[10] = v16;
  v27[11] = v15;
  v27[12] = v14;
  v27[13] = v2;
  v27[14] = v3;
  v27[15] = v4;
  v27[16] = v13;
  v27[17] = v5;
  v27[18] = v12;
  v27[19] = v6;
  v27[20] = v11;
  v27[21] = v7;
  v27[22] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 23);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1E5F1AEF0;
}

+ (id)protoFields
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
  _QWORD v27[25];

  v27[23] = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("uniqueID"), 1, 13, 0);
  v27[0] = v26;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("absoluteTimestamp"), 2, 0, 0);
  v27[1] = v25;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("playbackState"), 3, 4, 0);
  v27[2] = v24;
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("album"), 4, 13, 0);
  v27[3] = v23;
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("artist"), 5, 13, 0);
  v27[4] = v22;
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("duration"), 6, 4, 0);
  v27[5] = v21;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("genre"), 7, 13, 0);
  v27[6] = v20;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("title"), 8, 13, 0);
  v27[7] = v19;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("elapsed"), 9, 4, 0);
  v27[8] = v18;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("mediaType"), 10, 13, 0);
  v27[9] = v17;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iTunesStoreIdentifier"), 11, 13, 0);
  v27[10] = v16;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iTunesSubscriptionIdentifier"), 12, 13, 0);
  v27[11] = v15;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAirPlayVideo"), 13, 12, 0);
  v27[12] = v14;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("outputDevices"), 14, 14, objc_opt_class());
  v27[13] = v13;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("bundleID"), 15, 13, 0);
  v27[14] = v2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iTunesArtistIdentifier"), 16, 13, 0);
  v27[15] = v3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("iTunesAlbumIdentifier"), 17, 13, 0);
  v27[16] = v4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("groupIdentifier"), 18, 13, 0);
  v27[17] = v5;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isRemoteControl"), 19, 12, 0);
  v27[18] = v6;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemMediaType"), 20, 4, 0);
  v27[19] = v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("itemMediaSubtype"), 21, 4, 0);
  v27[20] = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("isAirPlayActive"), 22, 12, 0);
  v27[21] = v9;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026E8]), "initWithName:number:type:subMessageClass:", CFSTR("parentGroupContainsDiscoverableGroupLeader"), 23, 12, 0);
  v27[22] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __28__BMMediaNowPlaying_columns__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "eventBodyKeepingBackingData:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_outputDevicesJSONArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BMConvertObjectToJSONString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BMMediaNowPlaying)initWithUniqueID:(id)a3 absoluteTimestamp:(id)a4 playbackState:(int)a5 album:(id)a6 artist:(id)a7 duration:(id)a8 genre:(id)a9 title:(id)a10 elapsed:(id)a11 mediaType:(id)a12 iTunesStoreIdentifier:(id)a13 iTunesSubscriptionIdentifier:(id)a14 isAirPlayVideo:(id)a15 outputDevices:(id)a16 bundleID:(id)a17 iTunesArtistIdentifier:(id)a18 iTunesAlbumIdentifier:(id)a19 groupIdentifier:(id)a20 isRemoteControl:(id)a21 itemMediaType:(int)a22 itemMediaSubtype:(int)a23
{
  return -[BMMediaNowPlaying initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:](self, "initWithUniqueID:absoluteTimestamp:playbackState:album:artist:duration:genre:title:elapsed:mediaType:iTunesStoreIdentifier:iTunesSubscriptionIdentifier:isAirPlayVideo:outputDevices:bundleID:iTunesArtistIdentifier:iTunesAlbumIdentifier:groupIdentifier:isRemoteControl:itemMediaType:itemMediaSubtype:isAirPlayActive:parentGroupContainsDiscoverableGroupLeader:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           __PAIR64__(a23, a22),
           0,
           0);
}

@end
