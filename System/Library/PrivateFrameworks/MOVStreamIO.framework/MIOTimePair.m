@implementation MIOTimePair

+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAssetURL:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a3;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDB2378], "assetWithURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    +[MIOTimePair timePairsForStream:mediaType:inAsset:error:](MIOTimePair, "timePairsForStream:mediaType:inAsset:error:", v9, a4, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create asset from URL '%@'."), v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v13, 5);

    v12 = 0;
  }

  return v12;
}

+ (id)timePairsForStream:(id)a3 mediaType:(int64_t)a4 inAsset:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *j;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  void *v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  CMTime v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  CMTime v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v39 = a5;
  +[MIOMediaTypeUtility matchingAVMediaTypeFromMIOMediaType:](MIOMediaTypeUtility, "matchingAVMediaTypeFromMIOMediaType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v39, "tracksWithMediaType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (!v11)
  {

LABEL_31:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track for stream '%@'."), v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6);
    v12 = 0;
    v27 = 0;
    goto LABEL_42;
  }
  v12 = 0;
  v13 = *(_QWORD *)v52;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v52 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      if (+[MIOMovieMetadataUtility isTrack:forStreamId:mediaType:](MIOMovieMetadataUtility, "isTrack:forStreamId:mediaType:", v15, v8, v9))
      {
        v16 = v15;

        v12 = v16;
      }
    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  }
  while (v11);

  if (!v12)
    goto LABEL_31;
  +[MIOMovieMetadataUtility attachmentsTrackInAsset:forTrack:](MIOMovieMetadataUtility, "attachmentsTrackInAsset:forTrack:", v39, v12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v38, 0);
    objc_msgSend(MEMORY[0x24BDB23B8], "assetReaderWithAsset:error:", v39, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v17;
    if (v17)
    {
      if (objc_msgSend(v17, "canAddOutput:", v36))
      {
        objc_msgSend(v34, "addOutput:", v36);
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23C8]), "initWithAssetReaderTrackOutput:", v36);
        if ((objc_msgSend(v34, "startReading") & 1) != 0)
        {
          v31 = (void *)objc_opt_new();
          for (j = 0; ; j = v33)
          {
            objc_msgSend(v29, "nextTimedMetadataGroup");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              break;
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(v33, "items");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v19)
            {
              v20 = *(_QWORD *)v48;
              while (2)
              {
                for (k = 0; k != v19; ++k)
                {
                  if (*(_QWORD *)v48 != v20)
                    objc_enumerationMutation(obj);
                  objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "value");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:", v22, a6);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v23)
                  {

                    v27 = 0;
                    goto LABEL_37;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v23, "valueForKey:", CFSTR("OriginalTimestampWhenWrittenToFile"));
                    v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
                    v25 = v24;
                    if (v24)
                    {
                      memset(&v46, 0, sizeof(v46));
                      CMTimeMakeFromDictionary(&v46, v24);
                      objc_msgSend(v33, "timeRange");
                      v44 = v42;
                      v45 = v43;
                      v41 = v46;
                      +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", &v44, &v41);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "addObject:", v26);

                    }
                  }

                }
                v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
                if (v19)
                  continue;
                break;
              }
            }

          }
          v27 = v31;
LABEL_37:

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot start reading data for stream '%@'."), v8);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6);
          v27 = 0;

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot add output to associated metadata track for stream '%@'."), v8);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6);
        v27 = 0;

      }
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find attachments track for stream '%@'."), v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6);
    v27 = 0;

  }
LABEL_42:

  return v27;
}

+ (id)alignedPTSTimeStamps:(id)a3 withSampleTimes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  CMTime v25;
  __int128 v26;
  uint64_t v27;
  CMTime v28;
  __int128 v29;
  uint64_t v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime time2;
  CMTime time1;
  CMTime v38;
  CMTime v39;
  __int128 v40;
  uint64_t v41;
  CMTime v42[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v6, "times");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = 0;
  while (objc_msgSend(v6, "count") > v10)
  {
    memset(&v42[1], 0, sizeof(CMTime));
    if (v6)
      objc_msgSend(v6, "timeAtIndex:", v10);
    if (v11 >= objc_msgSend(v5, "count"))
    {
      v42[0] = v42[1];
      v40 = *MEMORY[0x24BDC0D38];
      v41 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
      +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", v42, &v40);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v12);

    }
    objc_msgSend(v5, "objectAtIndex:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v42[1];
    if (objc_msgSend(v13, "isPTSEqualOrCloseToTime:", &v39))
    {
      v38 = v42[1];
      v14 = (void *)objc_msgSend(v13, "copyWithNewPts:", &v38);
      objc_msgSend(v9, "addObject:", v14);

      v15 = v11 + 1;
    }
    else
    {
      if (v13)
        objc_msgSend(v13, "pts");
      else
        memset(&time1, 0, sizeof(time1));
      time2 = v42[1];
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v15 = v11 + 1;
        v17 = v11 + 1;
        while (1)
        {
          if (v17 >= objc_msgSend(v5, "count"))
          {
            v28 = v42[1];
            v26 = *MEMORY[0x24BDC0D38];
            v27 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
            +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", &v28, &v26);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v20);

            goto LABEL_25;
          }
          objc_msgSend(v5, "objectAtIndex:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v42[1];
          if (objc_msgSend(v18, "isPTSEqualOrCloseToTime:", &v35))
            break;
          if (v18)
            objc_msgSend(v18, "pts");
          else
            memset(&v33, 0, sizeof(v33));
          v32 = v42[1];
          ++v17;
          v13 = v18;
          if (CMTimeCompare(&v33, &v32) >= 1)
          {
            v31 = v42[1];
            v29 = *MEMORY[0x24BDC0D38];
            v30 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
            +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", &v31, &v29);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v19);

            goto LABEL_24;
          }
        }
        v34 = v42[1];
        v21 = (void *)objc_msgSend(v18, "copyWithNewPts:", &v34);
        objc_msgSend(v9, "addObject:", v21);

        v15 = v11 + 2;
LABEL_24:
        v13 = v18;
      }
      else
      {
        v25 = v42[1];
        v23 = *MEMORY[0x24BDC0D38];
        v24 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
        +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", &v25, &v23);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v16);

        v15 = v11;
      }
    }
LABEL_25:

    ++v10;
    v11 = v15;
  }

  return v9;
}

+ (id)timePairWithPts:(id *)a3 originalTime:(id *)a4
{
  MIOTimePair *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  v6 = [MIOTimePair alloc];
  v9 = *a3;
  v8 = *a4;
  return -[MIOTimePair initWithPts:originalTime:](v6, "initWithPts:originalTime:", &v9, &v8);
}

- (MIOTimePair)init
{
  MIOTimePair *v2;
  MIOTimePair *v3;
  __int128 *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MIOTimePair;
  v2 = -[MIOTimePair init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (__int128 *)MEMORY[0x24BDC0D38];
    v8 = *MEMORY[0x24BDC0D38];
    v9 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    -[MIOTimePair setPts:](v2, "setPts:", &v8);
    v6 = *v4;
    v7 = *((_QWORD *)v4 + 2);
    -[MIOTimePair setOriginalTime:](v3, "setOriginalTime:", &v6);
  }
  return v3;
}

- (MIOTimePair)initWithPts:(id *)a3 originalTime:(id *)a4
{
  MIOTimePair *v6;
  MIOTimePair *v7;
  __int128 v9;
  int64_t v10;
  __int128 v11;
  int64_t var3;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MIOTimePair;
  v6 = -[MIOTimePair init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v11 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[MIOTimePair setPts:](v6, "setPts:", &v11);
    v9 = *(_OWORD *)&a4->var0;
    v10 = a4->var3;
    -[MIOTimePair setOriginalTime:](v7, "setOriginalTime:", &v9);
  }
  return v7;
}

- (BOOL)isPTSEqualOrCloseToTime:(id *)a3
{
  CMTime v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  CMTimeMakeWithSeconds(&v5, 0.000003, 100000000);
  return -[MIOTimePair isPTSEqualOrCloseToTime:tolerance:](self, "isPTSEqualOrCloseToTime:tolerance:", &v6, &v5);
}

- (BOOL)isPTSEqualOrCloseToTime:(id *)a3 tolerance:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v13;

  if ((a3->var2 & 1) == 0)
    return 0;
  -[MIOTimePair pts](self, "pts");
  if ((v13.flags & 1) == 0)
    return 0;
  memset(&v13, 0, sizeof(v13));
  lhs = (CMTime)*a3;
  -[MIOTimePair pts](self, "pts");
  CMTimeSubtract(&time, &lhs, &rhs);
  CMTimeAbsoluteValue(&v13, &time);
  time1 = v13;
  v8 = *a4;
  return CMTimeCompare(&time1, (CMTime *)&v8) < 1;
}

- (id)description
{
  void *v3;
  Float64 Seconds;
  CMTime v6;
  CMTime time;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MIOTimePair pts](self, "pts");
  Seconds = CMTimeGetSeconds(&time);
  -[MIOTimePair originalTime](self, "originalTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f [Orig: %f]"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithNewPts:(id *)a3
{
  _BYTE v4[24];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  -[MIOTimePair originalTime](self, "originalTime");
  +[MIOTimePair timePairWithPts:originalTime:](MIOTimePair, "timePairWithPts:originalTime:", &v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)pts
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_pts, 24, 1, 0);
  return result;
}

- (void)setPts:(id *)a3
{
  objc_copyStruct(&self->_pts, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_originalTime, 24, 1, 0);
  return result;
}

- (void)setOriginalTime:(id *)a3
{
  objc_copyStruct(&self->_originalTime, a3, 24, 1, 0);
}

@end
