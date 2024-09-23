@implementation MOVStreamReaderStreamOutput

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  CMTime *p_var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  CMTime v11;

  p_var1 = (CMTime *)&self->var1;
  if ((self->var3 & 0x100000000) == 0)
  {
    v5 = self;
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE assetTrack](self, "assetTrack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "minFrameDuration");

      if ((v11.flags & 1) != 0)
      {
        -[$3CC8671D27C23BF42ADDB32F2B5E48AE assetTrack](v5, "assetTrack");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          objc_msgSend(v8, "minFrameDuration");
        else
          memset(&v11, 0, sizeof(v11));
        goto LABEL_8;
      }
    }
    else
    {

    }
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE assetTrack](v5, "assetTrack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nominalFrameRate");
    CMTimeMakeWithSeconds(&v11, 1.0 / v10, 16800);
LABEL_8:
    *p_var1 = v11;

  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_var1->value;
  retstr->var3 = p_var1->epoch;
  return self;
}

- (BOOL)timeCodeIsSynthesized
{
  void *v3;
  BOOL v4;

  -[MOVStreamReaderStreamOutput synthesizedTimeCodes](self, "synthesizedTimeCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[MOVStreamReaderStreamOutput timeCodeIsSynthesized](self->_timeCodeOutput, "timeCodeIsSynthesized");

  return v4;
}

- (NSArray)associatedOutputs
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_associatedOutputs, "copy");
}

- (MOVStreamReaderStreamOutput)init
{
  char *v2;
  MOVStreamReaderStreamOutput *v3;
  __int128 v4;
  uint64_t v5;
  NSMutableArray *associatedOutputs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOVStreamReaderStreamOutput;
  v2 = -[MOVStreamReaderStreamOutput init](&v8, sel_init);
  v3 = (MOVStreamReaderStreamOutput *)v2;
  if (v2)
  {
    v4 = *MEMORY[0x24BDC0D38];
    *((_QWORD *)v2 + 3) = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    *(_OWORD *)(v2 + 8) = v4;
    objc_msgSend(v2, "setFirstVideoFrameRead:", 0);
    v5 = objc_opt_new();
    associatedOutputs = v3->_associatedOutputs;
    v3->_associatedOutputs = (NSMutableArray *)v5;

  }
  return v3;
}

- (void)parseTrackMetadata:(id)a3 version:(id)a4 unknownStreamId:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v36 = a4;
  v37 = a5;
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.track_kind"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_format"), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_encoded_sample_format"), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_type_info"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments"), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  v39 = 0;
  if (!v10)
  {

    v47 = 0;
    v44 = 0;
    v42 = 0;
    v40 = 0;
    goto LABEL_28;
  }
  v11 = 0;
  v40 = 0;
  v42 = 0;
  v44 = 0;
  v47 = 0;
  v12 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v50 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v9, "isEqualToString:", v15);

      if (v16)
      {
        objc_msgSend(v14, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
        {
          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v54 = (uint64_t)v17;
            _os_log_impl(&dword_210675000, v18, OS_LOG_TYPE_DEBUG, "Detected %{public}@ stream", buf, 0xCu);
          }

        }
        -[MOVStreamReaderStreamOutput streamIdFromTrackStreamTypeIdentifier:](self, "streamIdFromTrackStreamTypeIdentifier:", v17);
        v19 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v19;
      }
      else
      {
        objc_msgSend(v14, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(CFSTR("mdta/com.apple.trackStreamEncoding"), "isEqualToString:", v20);

        if (v21)
        {
          objc_msgSend(v14, "value");
          v17 = v47;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v46, "isEqualToString:", v22);

          if (v23)
          {
            objc_msgSend(v14, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v17, "intValue");
          }
          else
          {
            objc_msgSend(v14, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v45, "isEqualToString:", v24);

            if (v25)
            {
              objc_msgSend(v14, "value");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v17, "intValue");
            }
            else
            {
              objc_msgSend(v14, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v43, "isEqualToString:", v26);

              if (v27)
              {
                objc_msgSend(v14, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v17, "intValue");
              }
              else
              {
                objc_msgSend(v14, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v41, "isEqualToString:", v28);

                if (!v29)
                  continue;
                objc_msgSend(v14, "value");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v17, "longValue");
              }
            }
          }
        }
      }

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  }
  while (v10);

  if (v11)
  {
    -[MOVStreamReaderStreamOutput setStreamId:](self, "setStreamId:", v11);
    -[MOVStreamReaderStreamOutput setIsMIOStream:](self, "setIsMIOStream:", 1);
    goto LABEL_34;
  }
LABEL_28:
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:](MIOMovieMetadataUtility, "findStreamIdFromQTTagsOfTrack:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
      *(_DWORD *)buf = 136315138;
      v54 = v33;
      _os_log_impl(&dword_210675000, v32, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
    }

    -[MOVStreamReaderStreamOutput setStreamId:](self, "setStreamId:", v31);
  }
  else
  {
    -[MOVStreamReaderStreamOutput setStreamId:](self, "setStreamId:", v37);
  }

  v11 = 0;
LABEL_34:
  -[MOVStreamReaderStreamOutput streamId](self, "streamId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput verifyStreamId:ofType:](self, "verifyStreamId:ofType:", v34, -[MOVStreamReaderStreamOutput mediaType](self, "mediaType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput setStreamId:](self, "setStreamId:", v35);

  -[MOVStreamReaderStreamOutput setOriginalPixelFormat:](self, "setOriginalPixelFormat:", v44);
  -[MOVStreamReaderStreamOutput setDeterminedPixelFormat:](self, "setDeterminedPixelFormat:", v42);
  -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](self, "setAttachmentSerializationMode:", v40);
  -[MOVStreamReaderStreamOutput setRelatedStreamId:](self, "setRelatedStreamId:", 0);
  -[MOVStreamReaderStreamOutput setRelationSpecifier:](self, "setRelationSpecifier:", 0);
  -[MOVStreamReaderStreamOutput setTrackTypeInfo:](self, "setTrackTypeInfo:", v39);
  -[MOVStreamReaderStreamOutput setAttachmentsIdentifier:](self, "setAttachmentsIdentifier:", v38);
  -[MOVStreamReaderStreamOutput setTrackKindIdentifier:](self, "setTrackKindIdentifier:", v9);

}

- (MOVStreamReaderStreamOutput)initWithAudioTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MOVStreamReaderStreamOutput *v21;
  MOVStreamReaderStreamOutput *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  MOVStreamReaderStreamOutput *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  id v37;
  id v38;
  id v39;

  v16 = a3;
  v17 = a4;
  v38 = a5;
  v18 = a6;
  v39 = a7;
  v19 = a8;
  v20 = a9;
  v21 = -[MOVStreamReaderStreamOutput init](self, "init");
  v22 = v21;
  if (!v21)
    goto LABEL_7;
  v21->_mediaType = 1;
  -[MOVStreamReaderStreamOutput setVersion:](v21, "setVersion:", v18);
  -[MOVStreamReaderStreamOutput setDelegate:](v22, "setDelegate:", v20);
  -[MOVStreamReaderStreamOutput setReader:](v22, "setReader:", v19);
  -[MOVStreamReaderStreamOutput setAssetReader:](v22, "setAssetReader:", v17);
  -[MOVStreamReaderStreamOutput setAssetTrack:](v22, "setAssetTrack:", v16);
  objc_msgSend(v16, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput parseTrackMetadata:version:unknownStreamId:](v22, "parseTrackMetadata:version:unknownStreamId:", v23, v18, v39);
  -[MOVStreamReaderStreamOutput streamId](v22, "streamId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput assetTrack](v22, "assetTrack");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MOVStreamReaderStreamOutput shouldDiscardStream:mediaType:track:](v22, "shouldDiscardStream:mediaType:track:", v24, 1, v25);

  if (!v26)
  {
    v37 = v17;
    objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v16, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput assetReader](v22, "assetReader");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "canAddOutput:", v28);

    if (!v30)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add audio track (%@) to the AVAssetReader."), v16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v35, 1);

      v27 = 0;
      v17 = v37;
      goto LABEL_9;
    }
    -[MOVStreamReaderStreamOutput assetReader](v22, "assetReader");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addOutput:", v28);

    -[MOVStreamReaderStreamOutput setStreamOutput:](v22, "setStreamOutput:", v28);
    -[MOVStreamReaderStreamOutput setPostProcessor:](v22, "setPostProcessor:", 0);
    -[MOVStreamReaderStreamOutput attachmentsIdentifier](v22, "attachmentsIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput trackKindIdentifier](v22, "trackKindIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MOVStreamReaderStreamOutput addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:](v22, "addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:", v38, v32, v33, v18, a10);

    v17 = v37;
    if (!v34)
      goto LABEL_4;
LABEL_7:
    v27 = v22;
    goto LABEL_9;
  }

LABEL_4:
  v27 = 0;
LABEL_9:

  return v27;
}

- (MOVStreamReaderStreamOutput)initWithSceneTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MOVStreamReaderStreamOutput *v21;
  MOVStreamReaderStreamOutput *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  MOVStreamReaderStreamOutput *v34;
  void *v36;
  id v37;
  id v38;
  _OWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;

  v16 = a3;
  v38 = a4;
  v37 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = -[MOVStreamReaderStreamOutput init](self, "init");
  v22 = v21;
  if (!v21)
    goto LABEL_10;
  v21->_mediaType = 3;
  -[MOVStreamReaderStreamOutput setVersion:](v21, "setVersion:", v17);
  -[MOVStreamReaderStreamOutput setDelegate:](v22, "setDelegate:", v20);
  -[MOVStreamReaderStreamOutput setReader:](v22, "setReader:", v19);
  -[MOVStreamReaderStreamOutput setAssetReader:](v22, "setAssetReader:", v38);
  -[MOVStreamReaderStreamOutput setAssetTrack:](v22, "setAssetTrack:", v16);
  objc_msgSend(v16, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput parseTrackMetadata:version:unknownStreamId:](v22, "parseTrackMetadata:version:unknownStreamId:", v23, v17, v18);
  -[MOVStreamReaderStreamOutput streamId](v22, "streamId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput assetTrack](v22, "assetTrack");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[MOVStreamReaderStreamOutput shouldDiscardStream:mediaType:track:](v22, "shouldDiscardStream:mediaType:track:", v24, 3, v25);

  if (v26)
  {
LABEL_12:

    v34 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v16, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput assetReader](v22, "assetReader");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "canAddOutput:", v36);

  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add output for scene track (%@) to the AVAssetReader."), v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v30, 1);

LABEL_11:
    goto LABEL_12;
  }
  -[MOVStreamReaderStreamOutput assetReader](v22, "assetReader");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addOutput:", v36);

  -[MOVStreamReaderStreamOutput setStreamOutput:](v22, "setStreamOutput:", v36);
  if (v16)
  {
    objc_msgSend(v16, "preferredTransform");
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
  }
  v39[0] = v40;
  v39[1] = v41;
  v39[2] = v42;
  -[MOVStreamReaderStreamOutput setTransform:](v22, "setTransform:", v39);
  -[MOVStreamReaderStreamOutput attachmentsIdentifier](v22, "attachmentsIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput trackKindIdentifier](v22, "trackKindIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[MOVStreamReaderStreamOutput addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:](v22, "addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:", v37, v31, v32, v17, a10);

  if (!v33)
    goto LABEL_11;

LABEL_10:
  v34 = v22;
LABEL_13:

  return v34;
}

- (MOVStreamReaderStreamOutput)initWithMetadataTrack:(id)a3 assetReader:(id)a4 version:(id)a5 unknownStreamId:(id)a6 reader:(id)a7 delegate:(id)a8 error:(id *)a9
{
  MOVStreamReaderStreamOutput *v15;
  MOVStreamReaderStreamOutput *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  int v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  int v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  MOVStreamReaderStreamOutput *v60;
  unsigned int v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id obj;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  uint8_t v82[128];
  uint8_t buf[4];
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v72 = a3;
  v66 = a4;
  v69 = a5;
  v65 = a6;
  v67 = a7;
  v68 = a8;
  v15 = -[MOVStreamReaderStreamOutput init](self, "init");
  v16 = v15;
  if (!v15)
    goto LABEL_66;
  v15->_mediaType = 2;
  -[MOVStreamReaderStreamOutput setVersion:](v15, "setVersion:", v69);
  -[MOVStreamReaderStreamOutput setDelegate:](v16, "setDelegate:", v68);
  -[MOVStreamReaderStreamOutput setReader:](v16, "setReader:", v67);
  -[MOVStreamReaderStreamOutput setAssetReader:](v16, "setAssetReader:", v66);
  -[MOVStreamReaderStreamOutput setAssetTrack:](v16, "setAssetTrack:", v72);
  objc_msgSend(v69, "versionedKey:modifier:", CFSTR("mdta/com.apple.track_kind"), CFSTR("metadata"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_time_range_metadata"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v18;
  objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("/"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v19;
  if (objc_msgSend(v19, "count") != 2)
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v84 = (uint64_t)v18;
      _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_ERROR, "Invalid 'kRawSampleBufferAttachmentsIdentifier': %@", buf, 0xCu);
    }

LABEL_9:
    objc_msgSend(v72, "metadata");
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v78;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v78 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(CFSTR("mdta/com.apple.imuTrackType"), "isEqualToString:", v26);

          if (v27)
          {
            objc_msgSend(v25, "value");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
            {
              +[MIOLog defaultLog](MIOLog, "defaultLog");
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v84 = (uint64_t)v28;
                _os_log_impl(&dword_210675000, v29, OS_LOG_TYPE_DEBUG, "Detected %{public}@ IMU data type", buf, 0xCu);
              }

            }
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("DeviceMotion")) & 1) != 0)
            {
              v34 = CFSTR("DeviceMotion");
LABEL_33:

              v62 = 1;
              goto LABEL_34;
            }
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RawGyro")) & 1) != 0)
            {
              v34 = CFSTR("RawGyro");
              goto LABEL_33;
            }
            if ((objc_msgSend(v28, "isEqualToString:", CFSTR("RawAccel")) & 1) != 0)
            {
              v34 = CFSTR("RawAccel");
              goto LABEL_33;
            }
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown IMU data type, ignoring: '%@'"), v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", v30, 0);

          }
          else
          {
            objc_msgSend(v25, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v70, "isEqualToString:", v32);

            if (v33)
            {
              objc_msgSend(v25, "value");
              v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
              goto LABEL_29;
            }
          }
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
        v34 = 0;
        v62 = 0;
        if (v22)
          continue;
        break;
      }
    }
    else
    {
      v34 = 0;
LABEL_29:
      v62 = 0;
    }
LABEL_34:

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v20 = obj;
    v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    if (v35)
    {
      v36 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v74 != v36)
            objc_enumerationMutation(v20);
          v38 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v38, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v17, "isEqualToString:", v39);

          if (v40)
          {
            objc_msgSend(v38, "numberValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v16->_timeRangeMetadataStream = objc_msgSend(v41, "BOOLValue");

          }
        }
        v35 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      }
      while (v35);
    }

    +[MIOVersion versionZero](MIOVersion, "versionZero");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "versionedKey:modifier:", CFSTR("mdta/com.apple.metadata_stream_item"), 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[MOVStreamReaderStreamOutput formatDescriptionOfTrack:containsKeyFromIndentifier:](v16, "formatDescriptionOfTrack:containsKeyFromIndentifier:", v72, CFSTR("mdta/com.apple.metadata_stream_item"))&& !-[MOVStreamReaderStreamOutput formatDescriptionOfTrack:containsKeyFromIndentifier:](v16, "formatDescriptionOfTrack:containsKeyFromIndentifier:", v72, v43))
    {
      v44 = v16->_timeRangeMetadataStream ? 1 : v62;
      if ((v44 & 1) == 0)
        -[MOVStreamReaderStreamOutput setCustomMetadataFormat:](v16, "setCustomMetadataFormat:", 1);
    }
    if (!v34)
    {
      -[MOVStreamReaderStreamOutput assetTrack](v16, "assetTrack");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:](MIOMovieMetadataUtility, "findStreamIdFromQTTagsOfTrack:", v45);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          v47 = -[__CFString UTF8String](objc_retainAutorelease(v34), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v84 = v47;
          _os_log_impl(&dword_210675000, v46, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
        }

      }
      else
      {
        if (!v65)
        {
          v34 = 0;
          goto LABEL_58;
        }
        v34 = (__CFString *)v65;
      }
    }
    -[MOVStreamReaderStreamOutput assetTrack](v16, "assetTrack");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[MOVStreamReaderStreamOutput shouldDiscardStream:mediaType:track:](v16, "shouldDiscardStream:mediaType:track:", v34, 2, v48);

    if (!v49)
    {
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v72, 0);
      -[MOVStreamReaderStreamOutput assetReader](v16, "assetReader");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "canAddOutput:", v51);

      if (v53)
      {
        -[MOVStreamReaderStreamOutput assetReader](v16, "assetReader");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addOutput:", v51);

        -[MOVStreamReaderStreamOutput setStreamOutput:](v16, "setStreamOutput:", v51);
        -[MOVStreamReaderStreamOutput setIsLegacyIMUTrack:](v16, "setIsLegacyIMUTrack:", v62);
        v55 = objc_alloc(MEMORY[0x24BDB23C8]);
        -[MOVStreamReaderStreamOutput streamOutput](v16, "streamOutput");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)objc_msgSend(v55, "initWithAssetReaderTrackOutput:", v56);
        -[MOVStreamReaderStreamOutput setMetadataTrackMetadataAdaptor:](v16, "setMetadataTrackMetadataAdaptor:", v57);

        -[MOVStreamReaderStreamOutput verifyStreamId:ofType:](v16, "verifyStreamId:ofType:", v34, 2);
        v58 = objc_claimAutoreleasedReturnValue();

        -[MOVStreamReaderStreamOutput setStreamId:](v16, "setStreamId:", v58);
        v50 = 0;
        v34 = (__CFString *)v58;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add metadata track (%@) to the AVAssetReader."), v72);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a9, v59, 1);

        v50 = 1;
      }

      goto LABEL_63;
    }
LABEL_58:
    v50 = 1;
LABEL_63:

    goto LABEL_64;
  }
  objc_msgSend(v19, "lastObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[MOVStreamReaderStreamOutput formatDescriptionOfTrack:containsKey:](v16, "formatDescriptionOfTrack:containsKey:", v72, v20)|| objc_msgSend(v72, "totalSampleDataLength"))
  {

    goto LABEL_9;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v50 = 1;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = objc_msgSend(v72, "trackID");
    _os_log_impl(&dword_210675000, (os_log_t)v34, OS_LOG_TYPE_INFO, "Found empty abandoned associated metadata track (Track id: %d), > ignoring.", buf, 8u);
  }
LABEL_64:

  if (!v50)
  {
LABEL_66:
    v60 = v16;
    goto LABEL_67;
  }
  v60 = 0;
LABEL_67:

  return v60;
}

- (MOVStreamReaderStreamOutput)initWithTimeCodeTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 unknownStreamId:(id)a7 reader:(id)a8 delegate:(id)a9 error:(id *)a10
{
  MOVStreamReaderStreamOutput *v16;
  MOVStreamReaderStreamOutput *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  int v22;
  void *v23;
  MOVStreamReaderStreamOutput *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  MOVStreamReaderStreamOutput *v30;
  void *v31;
  char v32;
  void *v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  opaqueCMSampleBuffer *i;
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
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  MOVStreamReaderStreamOutput *v67;
  id v68;
  unsigned __int8 v69;
  id v70;
  CMTime time2;
  CMTime time1;
  _OWORD v73[3];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v68 = a3;
  v65 = a4;
  v61 = a5;
  v66 = a6;
  v62 = a7;
  v63 = a8;
  v64 = a9;
  v16 = -[MOVStreamReaderStreamOutput init](self, "init");
  v17 = v16;
  v67 = v16;
  if (!v16)
    goto LABEL_21;
  v16->_mediaType = 4;
  -[MOVStreamReaderStreamOutput setVersion:](v16, "setVersion:", v66);
  -[MOVStreamReaderStreamOutput setDelegate:](v17, "setDelegate:", v64);
  -[MOVStreamReaderStreamOutput setReader:](v17, "setReader:", v63);
  -[MOVStreamReaderStreamOutput setAssetReader:](v17, "setAssetReader:", v65);
  -[MOVStreamReaderStreamOutput setAssetTrack:](v17, "setAssetTrack:", v68);
  objc_msgSend(v68, "metadata");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput parseTrackMetadata:version:unknownStreamId:](v67, "parseTrackMetadata:version:unknownStreamId:");
  -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput assetTrack](v67, "assetTrack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MOVStreamReaderStreamOutput shouldDiscardStream:mediaType:track:](v67, "shouldDiscardStream:mediaType:track:", v18, 4, v19);

  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v68, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput assetReader](v67, "assetReader");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "canAddOutput:", v59);

    if (v22)
    {
      -[MOVStreamReaderStreamOutput assetReader](v67, "assetReader");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addOutput:", v59);

      -[MOVStreamReaderStreamOutput setStreamOutput:](v67, "setStreamOutput:", v59);
      if (v68)
      {
        v24 = v67;
        objc_msgSend(v68, "preferredTransform");
      }
      else
      {
        v75 = 0u;
        v76 = 0u;
        v74 = 0u;
        v24 = v67;
      }
      v73[0] = v74;
      v73[1] = v75;
      v73[2] = v76;
      -[MOVStreamReaderStreamOutput setTransform:](v24, "setTransform:", v73);
      -[MOVStreamReaderStreamOutput setPostProcessor:](v24, "setPostProcessor:", 0);
      -[MOVStreamReaderStreamOutput attachmentsIdentifier](v24, "attachmentsIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVStreamReaderStreamOutput trackKindIdentifier](v24, "trackKindIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[MOVStreamReaderStreamOutput addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:](v24, "addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:", v61, v26, v27, v66, a10);

      if (v28)
      {
        -[MOVStreamReaderStreamOutput setHasTimeCode:](v67, "setHasTimeCode:", 1);
        objc_msgSend(v68, "makeSampleCursorAtFirstSampleInDecodeOrder");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "makeSampleCursorAtLastSampleInDecodeOrder");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          objc_msgSend(v58, "presentationTimeStamp");
          if (v29)
          {
LABEL_12:
            objc_msgSend(v29, "presentationTimeStamp");
LABEL_17:
            if (CMTimeCompare(&time1, &time2)
              || (-[MOVStreamReaderStreamOutput reader](v67, "reader"),
                  v31 = (void *)objc_claimAutoreleasedReturnValue(),
                  v32 = objc_msgSend(v31, "skipSynthesizedTimeCode"),
                  v31,
                  (v32 & 1) != 0))
            {
              objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v68, 0);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v65, "canAddOutput:", v33))
              {
                objc_msgSend(v65, "addOutput:", v33);
                -[MOVStreamReaderStreamOutput setStreamOutput:](v67, "setStreamOutput:", v33);

                v17 = v67;
LABEL_21:
                v30 = v17;
                goto LABEL_22;
              }
              v57 = v33;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add timecode track output (%@) to the AVAssetReader."), v68);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v35, 1);
            }
            else
            {
              v36 = objc_alloc(MEMORY[0x24BDB23B8]);
              -[MOVStreamReaderStreamOutput assetReader](v67, "assetReader");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "asset");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = 0;
              v56 = (void *)objc_msgSend(v36, "initWithAsset:error:", v38, &v70);
              v57 = v70;

              if (!v57)
              {
                objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v68, 0);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v56, "canAddOutput:", v42))
                {
                  objc_msgSend(v56, "addOutput:", v42);
                  if ((objc_msgSend(v56, "startReading") & 1) != 0)
                  {
                    for (i = (opaqueCMSampleBuffer *)objc_msgSend(v42, "copyNextSampleBuffer");
                          ;
                          i = (opaqueCMSampleBuffer *)objc_msgSend(v42, "copyNextSampleBuffer"))
                    {
                      if (!i)
                      {
                        v50 = (void *)MEMORY[0x24BDD17C8];
                        -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v50, "stringWithFormat:", CFSTR("Can't read timecode sample for creating synthesized timecode for stream %@.  Error: %@"), v51, 0);
                        v52 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v52, 1);
                        goto LABEL_37;
                      }
                      if (CMSampleBufferGetNumSamples(i))
                        break;
                      CFRelease(i);
                    }
                    v69 = 0;
                    +[MOVStreamIOUtility timecode32ForSampleBuffer:dropFrame:](MOVStreamIOUtility, "timecode32ForSampleBuffer:dropFrame:", i, &v69);
                    -[MOVStreamReaderStreamOutput setSynthesizedTimeCodeIsDropFrame:](v67, "setSynthesizedTimeCodeIsDropFrame:", v69);
                    v53 = (void *)MEMORY[0x24BDD17C8];
                    -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "stringWithFormat:", CFSTR("Timecode sample is not valid for creating synthesized timecode for stream %@.  Error: %@"), v54, 0);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v55, 1);
                  }
                  else
                  {
                    v47 = (void *)MEMORY[0x24BDD17C8];
                    -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "stringWithFormat:", CFSTR("Can't start reader for creating synthesized timecode for stream %@.  Error: %@"), v48, 0);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v49, 1);
                  }
                }
                else
                {
                  v44 = (void *)MEMORY[0x24BDD17C8];
                  -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "stringWithFormat:", CFSTR("Can't add input for creating synthesized timecode for stream %@.  Error: %@"), v45, 0);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v46, 1);
                }
LABEL_37:

                goto LABEL_27;
              }
              v39 = (void *)MEMORY[0x24BDD17C8];
              -[MOVStreamReaderStreamOutput streamId](v67, "streamId");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "stringWithFormat:", CFSTR("Can't create reader for making synthesized timecode for stream %@.  Error: %@"), v40, v57);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v41, 1);
              v35 = v56;
            }

LABEL_27:
            goto LABEL_14;
          }
        }
        else
        {
          memset(&time1, 0, sizeof(time1));
          if (v29)
            goto LABEL_12;
        }
        memset(&time2, 0, sizeof(time2));
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add output for time code track (%@) to the AVAssetReader."), v68);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a10, v25, 1);

    }
    goto LABEL_14;
  }

LABEL_14:
  v30 = 0;
LABEL_22:

  return v30;
}

- (MOVStreamReaderStreamOutput)initWithVideoTrack:(id)a3 assetReader:(id)a4 associatedMetadataTracks:(id)a5 version:(id)a6 bufferCacheMode:(int)a7 unknownStreamId:(id)a8 reader:(id)a9 delegate:(id)a10 error:(id *)a11
{
  id v17;
  MOVStreamReaderStreamOutput *v18;
  MOVStreamReaderStreamOutput *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  NSDictionary *v53;
  NSDictionary *v54;
  void *additionalCompressionProperties;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t i;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  uint64_t MediaSubType;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  BOOL v82;
  id *p_isa;
  void *v84;
  id v85;
  NSObject *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id WeakRetained;
  id *v91;
  id v92;
  id v93;
  char v94;
  id v95;
  void *v96;
  BOOL v97;
  MOVStreamReaderStreamOutput *v98;
  id v99;
  id v100;
  char v101;
  id v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id v107;
  NSObject *v108;
  int v109;
  MOVStreamReaderStreamOutput *v110;
  id v112;
  id v113;
  char v114;
  uint64_t v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  _BOOL4 v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t j;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  _BOOL4 v143;
  id *p_delegate;
  id v145;
  id v146;
  char v147;
  id v148;
  void *v149;
  void *v150;
  char v151;
  MIOSEITrackReader *v152;
  void *v153;
  void *v154;
  MIOSEITrackReader *v155;
  uint64_t v156;
  unsigned int v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  NSDictionary *v166;
  void *v167;
  id v168;
  id v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  unsigned int v176;
  void *v177;
  void *v178;
  void *v179;
  unsigned int v180;
  void *v181;
  unsigned int v182;
  void *v183;
  unsigned int v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  MOVStreamReaderStreamOutput *v189;
  id obj;
  void *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  _OWORD v196[3];
  id v197;
  id v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _BYTE v203[128];
  const __CFString *v204;
  NSArray *videoLayerIds;
  uint64_t v206;
  void *v207;
  _QWORD v208[2];
  _QWORD v209[2];
  uint8_t buf[16];
  __int128 v211;
  __int128 v212;
  _BYTE v213[128];
  uint64_t v214;

  v214 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v171 = a4;
  v164 = a5;
  v173 = a6;
  v168 = a8;
  v170 = a9;
  v169 = a10;
  v181 = v17;
  v18 = -[MOVStreamReaderStreamOutput init](self, "init");
  v19 = v18;
  v189 = v18;
  if (!v18)
  {
LABEL_96:
    v110 = v19;
    goto LABEL_97;
  }
  v18->_mediaType = 0;
  -[MOVStreamReaderStreamOutput setVersion:](v18, "setVersion:", v173);
  -[MOVStreamReaderStreamOutput setDelegate:](v19, "setDelegate:", v169);
  -[MOVStreamReaderStreamOutput setReader:](v19, "setReader:", v170);
  -[MOVStreamReaderStreamOutput setAssetReader:](v19, "setAssetReader:", v171);
  -[MOVStreamReaderStreamOutput setAssetTrack:](v19, "setAssetTrack:", v17);
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.track_kind"), 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_format"), 0);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_encoded_sample_format"), 0);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"), 0);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_type_info"), 0);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_related_to_stream"), 0);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_relation_specifier"), 0);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row"), 0);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_attachments"), 0);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row_multiplanar"), 0);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_output_pixel_format_override"), 0);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_stereo_video"), 0);
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "versionedKey:modifier:", CFSTR("mdta/com.apple.stream_additional_compression_properties"), 0);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = a7;
  v163 = (void *)v20;
  objc_msgSend(v17, "metadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v168;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v202 = 0u;
  obj = v21;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v213, 16);
  v161 = 0;
  if (v23)
  {
    v176 = 0;
    v165 = 0;
    v166 = 0;
    v175 = 0;
    v178 = 0;
    v184 = 0;
    v180 = 0;
    v182 = 0;
    v188 = 0;
    v24 = *(_QWORD *)v200;
    v25 = 1;
    while (1)
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v200 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v199 + 1) + 8 * v26);
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v191, "isEqualToString:", v28);

        if (v29)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (+[MIOLog debugEnabled](MIOLog, "debugEnabled"))
          {
            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v30;
              _os_log_impl(&dword_210675000, v31, OS_LOG_TYPE_DEBUG, "Detected %{public}@ stream", buf, 0xCu);
            }

          }
          -[MOVStreamReaderStreamOutput streamIdFromTrackStreamTypeIdentifier:](v189, "streamIdFromTrackStreamTypeIdentifier:", v30);
          v32 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
          v22 = (id)v32;
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(CFSTR("mdta/com.apple.trackStreamEncoding"), "isEqualToString:", v33);

        if (v34)
        {
          objc_msgSend(v27, "value");
          v30 = v188;
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v187, "isEqualToString:", v35);

        if (v36)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v184 = objc_msgSend(v30, "unsignedIntValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v186, "isEqualToString:", v37);

        if (v38)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v182 = objc_msgSend(v30, "intValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v183, "isEqualToString:", v39);

        if (v40)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v180 = objc_msgSend(v30, "intValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v179, "isEqualToString:", v41);

        if (v42)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v30, "intValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v177, "isEqualToString:", v43);

        if (v44)
        {
          objc_msgSend(v27, "value");
          v30 = v178;
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v174, "isEqualToString:", v45);

        if (v46)
        {
          objc_msgSend(v27, "value");
          v30 = v175;
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v172, "isEqualToString:", v47);

        if (v48)
        {
          objc_msgSend(v27, "value");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v161 = objc_msgSend(v30, "longValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v163, "isEqualToString:", v49);

        if (v50)
        {
          objc_msgSend(v27, "numberValue");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          v189->_stereoVideoStream = objc_msgSend(v30, "BOOLValue");
          goto LABEL_31;
        }
        objc_msgSend(v27, "identifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v162, "isEqualToString:", v51);

        if (v52)
        {
          objc_msgSend(v27, "value");
          v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v198 = 0;
            +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:", v53, &v198);
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v198;

            if (v30 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid Additional Compression Properties value type for stream '%@': %@."), v22, v30);
              additionalCompressionProperties = (void *)objc_claimAutoreleasedReturnValue();
              v63 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", additionalCompressionProperties, 0);

              v166 = 0;
            }
            else
            {
              v54 = v167;
              additionalCompressionProperties = v189->_additionalCompressionProperties;
              v166 = v54;
              v189->_additionalCompressionProperties = v54;
            }

            goto LABEL_31;
          }
          v166 = v53;
        }
        else
        {
          objc_msgSend(v27, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v160, "isEqualToString:", v56);

          if (v57)
          {
            objc_msgSend(v27, "value");
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_49;
            v165 = v58;
          }
          else
          {
            objc_msgSend(v27, "identifier");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v159, "isEqualToString:", v59);

            if (v60)
            {
              objc_msgSend(v27, "value");
              v58 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v197 = 0;
                +[MOVStreamIOUtility plistDeserializedObject:error:](MOVStreamIOUtility, "plistDeserializedObject:error:", v58, &v197);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v197;

                if (v30)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid ExactBytesPerRow value type for stream '%@': %@."), v22, v30);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", v61, 0);

                  goto LABEL_50;
                }
              }
              else
              {
LABEL_49:
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid ExactBytesPerRow value type for stream '%@': %@."), v22, v58);
                v30 = (id)objc_claimAutoreleasedReturnValue();
                v64 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", v30, 0);

LABEL_50:
                v165 = 0;
              }
LABEL_31:

            }
          }
        }
        ++v26;
      }
      while (v23 != v26);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v199, v213, 16);
      v23 = v65;
      if (!v65)
        goto LABEL_54;
    }
  }
  v176 = 0;
  v165 = 0;
  v166 = 0;
  v175 = 0;
  v178 = 0;
  v184 = 0;
  v180 = 0;
  v182 = 0;
  v188 = 0;
  v25 = 1;
LABEL_54:

  for (i = 0; ; ++i)
  {
    objc_msgSend(v181, "formatDescriptions");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "count") > i;

    if (!v68)
      break;
    objc_msgSend(v181, "formatDescriptions");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectAtIndexedSubscript:", i);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v70);
    if ((_DWORD)MediaSubType == 1936484717
      && !+[MOVStreamEncoderConfig isEncoderAvailableOfType:withId:](MOVStreamEncoderConfig, "isEncoderAvailableOfType:withId:", 1936484717, 0)|| +[MOVStreamEncoderConfig isProResCodec:](MOVStreamEncoderConfig, "isProResCodec:", MediaSubType)&& !+[MOVStreamEncoderConfig isEncoderAvailableOfType:withId:](MOVStreamEncoderConfig, "isEncoderAvailableOfType:withId:", MediaSubType, 0))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Decoder required for '%@' is not available."), v22);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a11, v89, 1);

LABEL_93:
      v109 = 1;
      goto LABEL_94;
    }
  }
  if ((v25 & 1) != 0)
  {
    objc_msgSend(v181, "formatDescriptions");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "count") == 0;

    if (!v73)
    {
      objc_msgSend(v181, "formatDescriptions");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectAtIndexedSubscript:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "objectForKey:", CFSTR("HasLeftStereoEyeView"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "BOOLValue");

      if (v78)
        v189->_stereoVideoStream = 1;
      objc_msgSend(v76, "objectForKey:", CFSTR("SampleDescriptionExtensionAtoms"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "objectForKey:", CFSTR("hvcC"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(v79, "objectForKey:", CFSTR("lhvC"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v81 == 0;

        if (!v82)
          v189->_stereoVideoStream = 1;
      }

    }
  }
  p_isa = (id *)&v189->super.isa;
  if (v180)
  {
    if ((v25 & 1) != 0)
    {
LABEL_71:
      objc_msgSend(p_isa, "assetTrack");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOMovieMetadataUtility findStreamIdFromQTTagsOfTrack:](MIOMovieMetadataUtility, "findStreamIdFromQTTagsOfTrack:", v84);
      v85 = (id)objc_claimAutoreleasedReturnValue();

      if (!v85)
      {
        v95 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", CFSTR("Unknown stream detected."), 0);
        goto LABEL_83;
      }
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
      {
        v87 = objc_msgSend(objc_retainAutorelease(v85), "UTF8String");
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v87;
        _os_log_impl(&dword_210675000, v86, OS_LOG_TYPE_INFO, "QT track name detected: %s", buf, 0xCu);
      }

      v85 = v85;
      v88 = v22;
      v22 = v85;
LABEL_81:

LABEL_83:
      goto LABEL_84;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&v189->_delegate);
    v180 = -[MOVStreamReaderStreamOutput playbackPixelFormatForTrack:ofStream:streamEncodingType:inputPixelFormat:delegate:](v189, "playbackPixelFormatForTrack:ofStream:streamEncodingType:inputPixelFormat:delegate:", v181, v22, v188, v182, WeakRetained);

    p_isa = (id *)&v189->super.isa;
    if ((v25 & 1) != 0)
      goto LABEL_71;
  }
  v91 = p_isa + 17;
  v92 = objc_loadWeakRetained(p_isa + 17);
  if (v92)
  {
    v93 = objc_loadWeakRetained(v91);
    v94 = objc_opt_respondsToSelector();

    if ((v94 & 1) != 0)
    {
      v85 = objc_loadWeakRetained(v91);
      -[MOVStreamReaderStreamOutput reader](v189, "reader");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = objc_msgSend(v85, "reader:pixelFormatForStream:suggestedFormat:", v88, v22, v180);
      goto LABEL_81;
    }
  }
LABEL_84:
  -[MOVStreamReaderStreamOutput assetTrack](v189, "assetTrack");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = -[MOVStreamReaderStreamOutput shouldDiscardStream:mediaType:track:](v189, "shouldDiscardStream:mediaType:track:", v22, 0, v96);

  if (v97)
    goto LABEL_93;
  v98 = v189;
  if (v180 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Undefined pixel format for stream '%@'. Ignoring stream."), v22);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (id)objc_msgSend(MEMORY[0x24BDD1540], "readerWarningWithMessage:code:", v106, 0);
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v106;
      _os_log_impl(&dword_210675000, v108, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    goto LABEL_93;
  }
  if ((v25 & 1) != 0)
    goto LABEL_107;
  v99 = objc_loadWeakRetained((id *)&v189->_delegate);
  if (v99
    && (v100 = objc_loadWeakRetained((id *)&v189->_delegate),
        v101 = objc_opt_respondsToSelector(),
        v100,
        v99,
        (v101 & 1) != 0))
  {
    v102 = objc_loadWeakRetained((id *)&v189->_delegate);
    -[MOVStreamReaderStreamOutput reader](v189, "reader");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput customTrackMetadata](v189, "customTrackMetadata");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "reader:overrideBytesPerRowForStream:storedValue:customTrackMetadata:originalPixelFormat:encodedPixelFormat:", v103, v22, v165, v104, v182, v180);
    v105 = objc_claimAutoreleasedReturnValue();

    v165 = (void *)v105;
  }
  else
  {
    v112 = objc_loadWeakRetained((id *)&v189->_delegate);
    if (!v112)
      goto LABEL_106;
    v113 = objc_loadWeakRetained((id *)&v189->_delegate);
    v114 = objc_opt_respondsToSelector();

    if ((v114 & 1) == 0)
      goto LABEL_106;
    objc_opt_class();
    v115 = (objc_opt_isKindOfClass() & 1) != 0 ? objc_msgSend(v165, "intValue") : 0;
    v116 = objc_loadWeakRetained((id *)&v189->_delegate);
    -[MOVStreamReaderStreamOutput reader](v189, "reader");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v116, "reader:bytesPerRowForStream:storedValue:", v117, v22, v115);

    if (!(_DWORD)v118)
      goto LABEL_106;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v118);
    v102 = v165;
    v165 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_106:
  v98 = v189;
LABEL_107:
  v211 = 0u;
  v212 = 0u;
  *(_OWORD *)buf = 0u;
  v119 = v181;
  if (v181)
    objc_msgSend(v181, "preferredTransform");
  if (v180)
  {
    if (v165)
    {
      v208[0] = *MEMORY[0x24BDC56B8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v180);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v208[1] = *MEMORY[0x24BDC5600];
      v209[0] = v120;
      v209[1] = v165;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v209, v208, 2);
    }
    else
    {
      v206 = *MEMORY[0x24BDC56B8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v180);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = v120;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v207, &v206, 1);
    }
    v121 = (void *)objc_claimAutoreleasedReturnValue();

    v119 = v181;
    v98 = v189;
  }
  else
  {
    v121 = 0;
  }
  if (v98->_stereoVideoStream)
  {
    if (!-[MOVStreamReaderStreamOutput determineStereoLayerIDs:](v98, "determineStereoLayerIDs:", v119))
      -[MOVStreamReaderStreamOutput useDefaultMIOLayerIds](v98, "useDefaultMIOLayerIds");
    v122 = (void *)objc_msgSend(v121, "mutableCopy");
    v204 = CFSTR("RequestedMVHEVCVideoLayerIDs");
    videoLayerIds = v98->_videoLayerIds;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &videoLayerIds, &v204, 1);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setObject:forKey:", v123, *MEMORY[0x24BDB22D0]);

    v124 = (void *)objc_msgSend(v122, "copy");
    v119 = v181;
    v98 = v189;
  }
  else
  {
    v124 = v121;
  }
  objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v119, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v125, "setAlwaysCopiesSampleData:", -[MOVStreamReaderStreamOutput alwaysCopiesSampleDataForStream](v98, "alwaysCopiesSampleDataForStream"));
  if (!objc_msgSend(v171, "canAddOutput:", v125))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add video track (%@) to the AVAssetReader."), v119);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 1;
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a11, v134, 1);
    v130 = (uint64_t)v22;
    goto LABEL_152;
  }
  objc_msgSend(v171, "addOutput:", v125);
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("RawBayer")) & 1) != 0
    || +[MIOPixelBufferUtility isPixelFormatRawBayer:](MIOPixelBufferUtility, "isPixelFormatRawBayer:", v182))
  {
    v176 = 1;
  }
  if (v184)
    v126 = v184;
  else
    v126 = v182;
  -[MOVStreamReaderStreamOutput setStreamOutput:](v189, "setStreamOutput:", v125);
  v196[0] = *(_OWORD *)buf;
  v196[1] = v211;
  v196[2] = v212;
  -[MOVStreamReaderStreamOutput setTransform:](v189, "setTransform:", v196);
  -[MOVStreamReaderStreamOutput setOriginalPixelFormat:](v189, "setOriginalPixelFormat:", v126);
  -[MOVStreamReaderStreamOutput setDeterminedPixelFormat:](v189, "setDeterminedPixelFormat:", v180);
  -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](v189, "setAttachmentSerializationMode:", v176);
  -[MOVStreamReaderStreamOutput setRelatedStreamId:](v189, "setRelatedStreamId:", v178);
  -[MOVStreamReaderStreamOutput setRelationSpecifier:](v189, "setRelationSpecifier:", v175);
  -[MOVStreamReaderStreamOutput setTrackTypeInfo:](v189, "setTrackTypeInfo:", v161);
  +[MOVStreamPostProcessorFactory defaultFactory](MOVStreamPostProcessorFactory, "defaultFactory");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "postProcessorFromReader:originalPixelFormat:encodedFormat:encoderType:streamId:bufferCacheMode:", v170, v126, v180, v188, v22, v157);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput setPostProcessor:](v189, "setPostProcessor:", v128);

  -[MOVStreamReaderStreamOutput postProcessor](v189, "postProcessor");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "setExactBytesPerRow:", v165);

  -[MOVStreamReaderStreamOutput verifyStreamId:ofType:](v189, "verifyStreamId:ofType:", v22, 0);
  v130 = objc_claimAutoreleasedReturnValue();

  -[MOVStreamReaderStreamOutput setStreamId:](v189, "setStreamId:", v130);
  if (!-[MOVStreamReaderStreamOutput addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:](v189, "addAssociatedMetadataTracks:rawSampleAttachmentsIdentifier:trackKindIdentifier:movVersion:error:", v164, v158, v191, v173, a11))
  {
    v109 = 1;
    goto LABEL_153;
  }
  -[MOVStreamReaderStreamOutput attachmentsAdaptor](v189, "attachmentsAdaptor");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131 == 0;

  if (v132)
  {
    p_delegate = (id *)&v189->_delegate;
    v145 = objc_loadWeakRetained((id *)&v189->_delegate);
    if (v145)
    {
      v146 = objc_loadWeakRetained(p_delegate);
      v147 = objc_opt_respondsToSelector();

      if ((v147 & 1) != 0)
      {
        v148 = objc_loadWeakRetained(p_delegate);
        -[MOVStreamReaderStreamOutput reader](v189, "reader");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamReaderStreamOutput streamId](v189, "streamId");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = objc_msgSend(v148, "reader:readSEIIfAvailableForStream:", v149, v150);

        if ((v151 & 1) != 0)
        {
          -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](v189, "setAttachmentSerializationMode:", 1);
          v152 = [MIOSEITrackReader alloc];
          -[MOVStreamReaderStreamOutput assetTrack](v189, "assetTrack");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          -[MOVStreamReaderStreamOutput assetReader](v189, "assetReader");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          v155 = -[MIOSEITrackReader initWithVideoTrack:assetReader:](v152, "initWithVideoTrack:assetReader:", v153, v154);
          -[MOVStreamReaderStreamOutput setSeiTrackReader:](v189, "setSeiTrackReader:", v155);

        }
      }
    }
  }
  -[MOVStreamReaderStreamOutput assetTrack](v189, "assetTrack");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput findTimeCodeTrackAssociatedWithTrack:](v189, "findTimeCodeTrackAssociatedWithTrack:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v134)
  {
    v109 = 0;
    goto LABEL_152;
  }
  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  -[MOVStreamReaderStreamOutput reader](v189, "reader");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "getAllTimeCodeStreams");
  v185 = (id)objc_claimAutoreleasedReturnValue();

  v136 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
  if (!v136)
  {
    v109 = 0;
    goto LABEL_151;
  }
  v137 = *(_QWORD *)v193;
  while (2)
  {
    for (j = 0; j != v136; ++j)
    {
      if (*(_QWORD *)v193 != v137)
        objc_enumerationMutation(v185);
      v139 = *(_QWORD *)(*((_QWORD *)&v192 + 1) + 8 * j);
      -[MOVStreamReaderStreamOutput reader](v189, "reader");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "outputForTimeCodeStream:error:", v139, a11);
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v141)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't find time code track (%@)"), v181);
        v156 = objc_claimAutoreleasedReturnValue();
        v109 = 1;
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a11, v156, 1);
        v141 = (void *)v156;
LABEL_150:

        goto LABEL_151;
      }
      objc_msgSend(v141, "assetTrack");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = v142 == v134;

      if (v143)
      {
        objc_storeStrong((id *)&v189->_timeCodeOutput, v141);
        -[MOVStreamReaderStreamOutput setHasTimeCode:](v189, "setHasTimeCode:", objc_msgSend(v141, "hasTimeCode"));
        v109 = 0;
        goto LABEL_150;
      }

    }
    v136 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v192, v203, 16);
    v109 = 0;
    if (v136)
      continue;
    break;
  }
LABEL_151:

LABEL_152:
LABEL_153:

  v22 = (id)v130;
LABEL_94:

  v19 = v189;
  if (!v109)
    goto LABEL_96;
  v110 = 0;
LABEL_97:

  return v110;
}

- (void)registerForAssociating:(id)a3 trackRelation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](self->_associatedOutputs, "addObject:", v9);
}

- (id)verifyStreamId:(id)a3 ofType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  int v10;
  uint64_t v11;

  v6 = a3;
  v7 = 1;
  for (i = v6; ; i = (void *)v11)
  {
    -[MOVStreamReaderStreamOutput reader](self, "reader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsStream:withMediaType:", i, a4);

    if (!v10)
      break;
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("-%zu"), v7);
    v11 = objc_claimAutoreleasedReturnValue();

    ++v7;
  }

  return i;
}

- (void)removePixelBufferPadding:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemovePadding:", v3);

}

- (BOOL)alwaysCopiesSampleDataForStream
{
  MOVStreamReaderDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    return 0;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 0;
  v8 = objc_loadWeakRetained((id *)p_delegate);
  -[MOVStreamReaderStreamOutput reader](self, "reader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOVStreamReaderStreamOutput streamId](self, "streamId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "reader:alwaysCopiesSampleDataForStream:", v9, v10);

  return v11;
}

- (id)timestamps
{
  MOVStreamTimestamps *v3;
  void *v4;
  MOVStreamTimestamps *v5;

  v3 = [MOVStreamTimestamps alloc];
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MOVStreamTimestamps initWithAssetTrack:](v3, "initWithAssetTrack:", v4);

  -[MOVStreamTimestamps setShouldStartTimestampsAtZero:](v5, "setShouldStartTimestampsAtZero:", -[MOVStreamReaderStreamOutput mediaType](self, "mediaType") == 2);
  return v5;
}

- (opaqueCMFormatDescription)timeCodeFormatDescription
{
  MOVStreamReaderStreamOutput *timeCodeOutput;
  void *v3;
  void *v4;
  opaqueCMFormatDescription *v5;

  timeCodeOutput = self->_timeCodeOutput;
  if (!timeCodeOutput)
    return 0;
  -[MOVStreamReaderStreamOutput assetTrack](timeCodeOutput, "assetTrack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (opaqueCMFormatDescription *)objc_msgSend(v4, "firstObject");

  return v5;
}

- (id)customTrackMetadata
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v14;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "rangeOfString:", CFSTR("mdta/custom.")))
        {
          objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("mdta/custom."), &stru_24CA45E28);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "stringByRemovingPercentEncoding");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v12, v11);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)customTrackMetadataItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (id)objc_opt_new();
  v4 = (void *)*MEMORY[0x24BDB1E50];
  objc_msgSend((id)*MEMORY[0x24BDB1E50], "stringByAppendingPathComponent:", *MEMORY[0x24BDB1EF0], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", *MEMORY[0x24BDB1EF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if ((v16 & 1) == 0)
          {
            if (objc_msgSend(v12, "rangeOfString:", CFSTR("mdta/custom.")))
            {
              +[MOVStreamIOUtility reservedMIOTrackMetadataKeys](MOVStreamIOUtility, "reservedMIOTrackMetadataKeys");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "containsObject:", v12);

              if ((v18 & 1) == 0)
                objc_msgSend(v20, "addObject:", v11);
            }
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v20;
}

- (id)getAssociatedMetadataStreams
{
  void *v2;
  void *v3;
  void *v4;

  -[MOVStreamReaderStreamOutput associatedMetadataOutputs](self, "associatedMetadataOutputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)getAssociatedMetadataStreamOutputs
{
  void *v2;
  void *v3;

  -[MOVStreamReaderStreamOutput associatedMetadataOutputs](self, "associatedMetadataOutputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAssociatedMetadataStreamOutputForMetadataStreamId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MOVStreamReaderStreamOutput associatedMetadataOutputs](self, "associatedMetadataOutputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)pixelFormatForStream
{
  unsigned int result;

  result = -[MOVStreamReaderStreamOutput originalPixelFormat](self, "originalPixelFormat");
  if (!result)
    return -[MOVStreamReaderStreamOutput determinedPixelFormat](self, "determinedPixelFormat");
  return result;
}

- (unsigned)getOutputPixelFormatForStream
{
  void *v3;
  int v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;

  -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "processedPixelFormat");

  if (v4)
  {
    -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "processedPixelFormat");
  }
  else
  {
    -[MOVStreamReaderStreamOutput streamOutput](self, "streamOutput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDC56B8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "intValue");

    if (v7)
      goto LABEL_5;
    v6 = -[MOVStreamReaderStreamOutput determinedPixelFormat](self, "determinedPixelFormat");
  }
  v7 = v6;
LABEL_5:

  return v7;
}

- (BOOL)getOutputPixelFormatWasGuessedForStream
{
  return self->_pixelFormatWasGuessed;
}

- (void)useDefaultMIOLayerIds
{
  NSArray *v3;
  NSArray *videoLayerIds;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24CA5BC70, &unk_24CA5BC88, 0);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  videoLayerIds = self->_videoLayerIds;
  self->_videoLayerIds = v3;

}

- (BOOL)determineStereoLayerIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFDictionary *Extensions;
  const __CFDictionary *Value;
  uint64_t v11;
  CFIndex Count;
  void *v13;
  BOOL v14;
  CFIndex v15;
  uint64_t TagsWithCategory;
  void *v17;
  NSArray *v18;
  NSArray *v19;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *videoLayerIds;
  CFDataRef theData;

  v4 = a3;
  objc_msgSend(v4, "formatDescriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    NSLog(CFSTR("No format description found for stereo stream."));
    goto LABEL_18;
  }
  objc_msgSend(v4, "formatDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v8);
  if (Extensions)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(Extensions, CFSTR("SampleDescriptionExtensionAtoms"));
    if (Value)
    {
      if (CFDictionaryGetValue(Value, CFSTR("hvcC")))
      {
        if (!FigHEVCBridge_GetNALUnitHeaderLengthFromHVCC())
        {
          theData = 0;
          FigHEVCBridge_CopyHEVCSEIPayloadData();
          FigHEVCBridge_GetHEVCParameterSetAtIndex();
          CFDataGetBytePtr(0);
          CFDataGetLength(0);
          if (!FigHEVCBridge_Get3DLayerIDs())
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", 255);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v22);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", 255);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v23);

            v24 = (NSArray *)objc_msgSend(v21, "copy");
            videoLayerIds = self->_videoLayerIds;
            self->_videoLayerIds = v24;

            v14 = 1;
            goto LABEL_19;
          }
        }
      }
    }
  }
  theData = 0;
  v11 = CMVideoFormatDescriptionCopyTagCollectionArray((CMVideoFormatDescriptionRef)v8, &theData);
  if ((_DWORD)v11)
  {
    NSLog(CFSTR("Failed getting FigTagCollectionArray (%d)"), v11);
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  if (!theData)
  {
    Count = 0;
    goto LABEL_17;
  }
  Count = CFArrayGetCount(theData);
  if (Count <= 1)
  {
LABEL_17:
    NSLog(CFSTR("Failed getting multiple FigTagCollections (numCollections=%d)"), Count);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  while (1)
  {
    CFArrayGetValueAtIndex(theData, v15);
    TagsWithCategory = FigTagCollectionGetTagsWithCategory();
    if ((_DWORD)TagsWithCategory)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", FigTagGetSInt64Value());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v17);

    v14 = ++v15 >= Count;
    if (Count == v15)
    {
      v18 = (NSArray *)objc_msgSend(v13, "copy");
      v19 = self->_videoLayerIds;
      self->_videoLayerIds = v18;

      goto LABEL_21;
    }
  }
  NSLog(CFSTR("Failed getting tag (%d)"), TagsWithCategory);
LABEL_21:

LABEL_19:
  return v14;
}

- (BOOL)copyNextStereoFrames:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4 timestamp:(id *)a5 error:(id *)a6
{
  void *v11;
  void *v12;
  opaqueCMSampleBuffer *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  void *v18;
  __CVBuffer *v19;
  void *v20;
  const __CFDictionary *v21;
  void *v22;
  __CVBuffer *v23;
  BOOL v24;
  uint64_t v26;
  CMTime v27;

  if (!a3)
    -[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:].cold.1();
  if (!a4)
    -[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:].cold.2();
  v11 = (void *)MEMORY[0x212BC9B10](self, a2);
  -[MOVStreamReaderStreamOutput streamOutput](self, "streamOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (opaqueCMSampleBuffer *)objc_msgSend(v12, "copyNextSampleBuffer");

  if (v13)
  {
    v14 = -[MOVStreamReaderStreamOutput stereoFramesFromSampleBuffer:outLeft:outRight:error:](self, "stereoFramesFromSampleBuffer:outLeft:outRight:error:", v13, a3, a4, a6);
    if (a5)
    {
      CMSampleBufferGetPresentationTimeStamp(&v27, v13);
      *(CMTime *)a5 = v27;
    }
    CVPixelBufferRetain(*a3);
    CVPixelBufferRetain(*a4);
    CFRelease(v13);
    if (v14)
    {
      -[MOVStreamReaderStreamOutput attachmentsDataForStreamPts:duration:](self, "attachmentsDataForStreamPts:duration:", &v27, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v16, a6);
        v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (__CVBuffer *)objc_msgSend(v18, "processedPixelBufferFrom:metadata:error:", *a3, v17, a6);

        CVPixelBufferRelease(*a3);
        if (v17)
          CVBufferSetAttachments(v19, v17, kCVAttachmentMode_ShouldPropagate);
        *a3 = v19;

      }
      if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v20, a6);
        v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (__CVBuffer *)objc_msgSend(v22, "processedPixelBufferFrom:metadata:error:", *a4, v21, a6);

        CVPixelBufferRelease(*a4);
        if (v21)
          CVBufferSetAttachments(v23, v21, kCVAttachmentMode_ShouldPropagate);
        *a4 = v23;

      }
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    -[MOVStreamReaderStreamOutput setEndOfStreamReached:](self, "setEndOfStreamReached:", 1);
    if (a6)
      *a6 = 0;
    v24 = 0;
    *a3 = 0;
    *a4 = 0;
  }
  objc_autoreleasePoolPop(v11);
  return !v13 || v24;
}

- (BOOL)stereoFramesFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outLeft:(__CVBuffer *)a4 outRight:(__CVBuffer *)a5 error:(id *)a6
{
  uint64_t TaggedBufferGroup;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t TagsWithCategory;
  uint64_t SInt64Value;
  __CVBuffer *CVPixelBufferAtIndex;
  void *v21;
  const __CFString *v22;
  void *v23;

  TaggedBufferGroup = FigSampleBufferGetTaggedBufferGroup();
  if (!TaggedBufferGroup)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("No tagged buffer group in sample buffer.");
LABEL_18:
    objc_msgSend(v21, "populateReaderError:message:code:", a6, v22, 29);
    return 0;
  }
  v11 = TaggedBufferGroup;
  if (-[NSArray count](self->_videoLayerIds, "count") <= 1)
    -[MOVStreamReaderStreamOutput stereoFramesFromSampleBuffer:outLeft:outRight:error:].cold.1();
  -[NSArray objectAtIndexedSubscript:](self->_videoLayerIds, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  -[NSArray objectAtIndexedSubscript:](self->_videoLayerIds, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  if (MEMORY[0x212BC9774](v11) >= 1)
  {
    v16 = 0;
    while (1)
    {
      MEMORY[0x212BC9780](v11, v16);
      TagsWithCategory = FigTagCollectionGetTagsWithCategory();
      if ((_DWORD)TagsWithCategory)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed getting video layer tag. Error %d"), TagsWithCategory, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v23, 29);

        return 0;
      }
      SInt64Value = FigTagGetSInt64Value();
      CVPixelBufferAtIndex = (__CVBuffer *)FigTaggedBufferGroupGetCVPixelBufferAtIndex();
      if (!CVPixelBufferAtIndex)
        break;
      if (v13 == (_DWORD)SInt64Value)
      {
        *a4 = CVPixelBufferAtIndex;
      }
      else if (v15 == (_DWORD)SInt64Value)
      {
        *a5 = CVPixelBufferAtIndex;
      }
      else
      {
        NSLog(CFSTR("Unknown videoLayerID: %d"), SInt64Value, 0);
      }
      if (++v16 >= MEMORY[0x212BC9774](v11))
        goto LABEL_13;
    }
    v21 = (void *)MEMORY[0x24BDD1540];
    v22 = CFSTR("No pixel buffer for video layer.");
    goto LABEL_18;
  }
LABEL_13:
  if (*a4)
    return *a5 != 0;
  return 0;
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 error:(id *)a4
{
  return -[MOVStreamReaderStreamOutput copyNextFrameForStreamTimestamp:readTimeCode:timeCode:tcDropFrame:error:](self, "copyNextFrameForStreamTimestamp:readTimeCode:timeCode:tcDropFrame:error:", a3, 0, 0, 0, a4);
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 timeCode:(CVSMPTETime *)a4 tcDropFrame:(BOOL *)a5 error:(id *)a6
{
  return -[MOVStreamReaderStreamOutput copyNextFrameForStreamTimestamp:readTimeCode:timeCode:tcDropFrame:error:](self, "copyNextFrameForStreamTimestamp:readTimeCode:timeCode:tcDropFrame:error:", a3, 1, a4, a5, a6);
}

- (__CVBuffer)copyNextFrameForStreamTimestamp:(id *)a3 readTimeCode:(BOOL)a4 timeCode:(CVSMPTETime *)a5 tcDropFrame:(BOOL *)a6 error:(id *)a7
{
  opaqueCMSampleBuffer *v12;
  id v13;
  __CVBuffer *ImageBuffer;
  const __CFDictionary *v15;
  void *v16;
  __CVBuffer *v17;
  MOVStreamReaderStreamOutput *timeCodeOutput;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  int64_t v27;
  uint64_t v28;

  v26 = *MEMORY[0x24BDC0D38];
  v27 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
  v28 = 0;
  v25 = 0;
  v12 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:", &v25, a4, &v28, &v26);
  v13 = v25;
  if (a3)
  {
    *(_OWORD *)&a3->var0 = v26;
    a3->var3 = v27;
  }
  if (v12)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v12);
    CVPixelBufferRetain(ImageBuffer);
    CFRelease(v12);
    -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v13, a7);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (__CVBuffer *)objc_msgSend(v16, "processedPixelBufferFrom:metadata:error:", ImageBuffer, v15, a7);

    CVPixelBufferRelease(ImageBuffer);
    if (v15)
      CVBufferSetAttachments(v17, v15, kCVAttachmentMode_ShouldPropagate);
    if (a5)
    {
      if (v28)
      {
        +[MOVStreamIOUtility timecode32ForSampleBuffer:dropFrame:](MOVStreamIOUtility, "timecode32ForSampleBuffer:dropFrame:", v28, a6);
        *(_OWORD *)&a5->subframes = v23;
        *(_QWORD *)&a5->hours = v24;
      }
      else
      {
        timeCodeOutput = self->_timeCodeOutput;
        if (timeCodeOutput)
        {
          -[MOVStreamReaderStreamOutput synthesizedTimeCodes](timeCodeOutput, "synthesizedTimeCodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v26, "{?=qiIq}");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "getValue:", a5);
            if (a6)
              *a6 = -[MOVStreamReaderStreamOutput synthesizedTimeCodeIsDropFrame](self->_timeCodeOutput, "synthesizedTimeCodeIsDropFrame");
          }

        }
      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (__CVBuffer)nextPixelBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5
{
  opaqueCMSampleBuffer *v7;
  opaqueCMSampleBuffer *v8;
  __CVBuffer *ImageBuffer;
  void *v10;
  __CVBuffer *v11;

  v7 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:timestamp:error:", a3, a4);
  if (!v7)
    return 0;
  v8 = v7;
  ImageBuffer = CMSampleBufferGetImageBuffer(v7);
  CVPixelBufferRetain(ImageBuffer);
  CFRelease(v8);
  -[MOVStreamReaderStreamOutput postProcessor](self, "postProcessor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (__CVBuffer *)objc_msgSend(v10, "processedPixelBufferFrom:metadata:error:", ImageBuffer, 0, a5);

  CVPixelBufferRelease(ImageBuffer);
  return v11;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 timestamp:(id *)a4 error:(id *)a5
{
  return -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:", a3, 0, 0, a4, a5);
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timestamp:(id *)a5 error:(id *)a6
{
  return -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:readTimeCode:timecodeSampleBuffer:timestamp:error:", a3, a4, 0, a5, a6);
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsData:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  opaqueCMSampleBuffer *v8;
  id v9;
  id v11;

  v11 = 0;
  v8 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsDataArray:readTimeCode:timecodeSampleBuffer:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsDataArray:readTimeCode:timecodeSampleBuffer:timestamp:error:", &v11, a4, a5, a6, a7);
  v9 = v11;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (opaqueCMSampleBuffer)nextSampleBufferForStreamAttachmentsDataArray:(id *)a3 readTimeCode:(BOOL)a4 timecodeSampleBuffer:(opaqueCMSampleBuffer *)a5 timestamp:(id *)a6 error:(id *)a7
{
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  _BOOL4 v12;
  CMTime *v13;
  __int128 v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  uint64_t v21;
  opaqueCMSampleBuffer *i;
  NSObject *v23;
  NSString *streamId;
  void *v25;
  int v26;
  void *v27;
  char v28;
  void *v29;
  float v30;
  float v31;
  double v32;
  CMTime *v33;
  double Seconds;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime v55;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime v64;
  CMTime v65;
  CMTime v66;
  CMTime rhs;
  CMTime lhs;
  CMTime v69;
  CMTime v70;
  CMTime v71;
  CMTime time2;
  CMTime time1;
  CMTime v74;
  CMTime time;
  CMTime v76;
  CMTime v77;
  CMTime v78;
  CMTime v79;
  CMTime v80;
  CMTime v81;
  CMTime v82;
  uint8_t buf[16];
  __int128 v84;
  __int128 v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  if (self->_mediaType != 4)
  {
    v12 = a4;
    v13 = (CMTime *)MEMORY[0x24BDC0D38];
    if (a6)
    {
      v14 = *MEMORY[0x24BDC0D38];
      a6->var3 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
      *(_OWORD *)&a6->var0 = v14;
    }
    -[MOVStreamReaderStreamOutput streamOutput](self, "streamOutput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (opaqueCMSampleBuffer *)objc_msgSend(v15, "copyNextSampleBuffer");

    if (!-[MOVStreamReaderStreamOutput firstVideoFrameRead](self, "firstVideoFrameRead"))
    {
      -[MOVStreamReaderStreamOutput setFirstVideoFrameRead:](self, "setFirstVideoFrameRead:", 1);
      v16 = 0;
      if (self->_mediaType || !v11)
        goto LABEL_15;
      if (-[MOVStreamReaderStreamOutput isEmptySample:](self, "isEmptySample:", v11))
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          streamId = self->_streamId;
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = streamId;
          _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_INFO, "Empty Edit frame detected for stream '%{public}@'.", buf, 0xCu);
        }

        -[MOVStreamReaderStreamOutput reader](self, "reader");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "skipEmptyEditVideoFrame");

        if (!v26)
        {
          v16 = 1;
LABEL_15:
          -[MOVStreamReaderStreamOutput reader](self, "reader");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "restrictVideoFramesToEdits");

          if (v11)
            v19 = v18;
          else
            v19 = 0;
          if (v19 == 1)
          {
            do
            {
              if (-[MOVStreamReaderStreamOutput isSampleInEdit:](self, "isSampleInEdit:", v11))
                break;
              CFRelease(v11);
              -[MOVStreamReaderStreamOutput streamOutput](self, "streamOutput");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (opaqueCMSampleBuffer *)objc_msgSend(v20, "copyNextSampleBuffer");

            }
            while (v11);
          }
          -[MOVStreamReaderStreamOutput attachmentsDataForStreamPts:duration:](self, "attachmentsDataForStreamPts:duration:", &v82, &v81);
          v21 = objc_claimAutoreleasedReturnValue();
          v80 = *v13;
          if (v12)
          {
            for (i = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", &v80);
                  i && !CMSampleBufferGetNumSamples(i);
                  i = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", &v80))
            {
              CFRelease(i);
            }
          }
          else
          {
            i = 0;
          }
          if (v11)
          {
            if (CMSampleBufferGetNumSamples(v11))
              v28 = v16;
            else
              v28 = 1;
            if ((v28 & 1) == 0)
              goto LABEL_42;
          }
          else if (!v16)
          {
            goto LABEL_56;
          }
          -[MOVStreamReaderStreamOutput setFutureAttachmentsData:](self, "setFutureAttachmentsData:", v21);
          v79 = v82;
          -[MOVStreamReaderStreamOutput setFutureAttachmentsPts:](self, "setFutureAttachmentsPts:", &v79);
          v78 = v81;
          -[MOVStreamReaderStreamOutput setFutureAttachmentsDuration:](self, "setFutureAttachmentsDuration:", &v78);
          v77 = v80;
          -[MOVStreamReaderStreamOutput setFutureTimeCodePts:](self, "setFutureTimeCodePts:", &v77);
          -[MOVStreamReaderStreamOutput setFutureTimeCodeBuffer:](self, "setFutureTimeCodeBuffer:", i);

          i = 0;
          v21 = 0;
          if (v11)
          {
LABEL_42:
            memset(&v76, 0, sizeof(v76));
            CMSampleBufferGetPresentationTimeStamp(&v76, v11);
            if (a6)
              *(CMTime *)a6 = v76;
            -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "nominalFrameRate");
            v31 = v30;

            v32 = 1.0 / v31 * 0.25;
            if (v21)
            {
              v33 = (CMTime *)MEMORY[0x24BDC0D90];
              do
              {
                time = v76;
                Seconds = CMTimeGetSeconds(&time);
                v74 = v82;
                if (vabdd_f64(Seconds, CMTimeGetSeconds(&v74)) <= v32)
                  break;
                time1 = v76;
                time2 = v82;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  -[MOVStreamReaderStreamOutput setFutureAttachmentsData:](self, "setFutureAttachmentsData:", v21);
                  v71 = v82;
                  -[MOVStreamReaderStreamOutput setFutureAttachmentsPts:](self, "setFutureAttachmentsPts:", &v71);
                  v70 = v81;
                  -[MOVStreamReaderStreamOutput setFutureAttachmentsDuration:](self, "setFutureAttachmentsDuration:", &v70);

                  v21 = 0;
                  break;
                }
                memset(&v69, 0, sizeof(v69));
                lhs = v82;
                -[MOVStreamReaderStreamOutput frameDuration](self, "frameDuration");
                CMTimeAdd(&v69, &lhs, &rhs);
                v66 = v76;
                v65 = v69;
                if (CMTimeCompare(&v66, &v65) < 0)
                  break;
                -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v35;
                if (v35)
                {
                  objc_msgSend(v35, "timeRange");
                }
                else
                {
                  v84 = 0u;
                  v85 = 0u;
                  *(_OWORD *)buf = 0u;
                }
                *(_OWORD *)&v64.value = *(_OWORD *)buf;
                v64.epoch = v84;
                v63 = *v33;
                v37 = CMTimeCompare(&v64, &v63) == 0;

                if (!v37)
                {
                  v62 = v82;
                  v61 = v81;
                  CMTimeAdd((CMTime *)buf, &v62, &v61);
                  *(_OWORD *)&v69.value = *(_OWORD *)buf;
                  v69.epoch = v84;
                  v60 = v76;
                  *(_OWORD *)&v59.value = *(_OWORD *)buf;
                  v59.epoch = v84;
                  if (CMTimeCompare(&v60, &v59) < 0)
                    break;
                }
                -[MOVStreamReaderStreamOutput attachmentsDataForStreamPts:duration:](self, "attachmentsDataForStreamPts:duration:", &v82, &v81);
                v38 = objc_claimAutoreleasedReturnValue();

                v21 = v38;
              }
              while (v38);
            }
            while (i)
            {
              v58 = v76;
              v46 = CMTimeGetSeconds(&v58);
              v57 = v80;
              if (vabdd_f64(v46, CMTimeGetSeconds(&v57)) <= v32)
                break;
              v56 = v76;
              v55 = v80;
              if (CMTimeCompare(&v56, &v55) < 0)
              {
                -[MOVStreamReaderStreamOutput setFutureTimeCodeBuffer:](self, "setFutureTimeCodeBuffer:", i);
                v54 = v80;
                -[MOVStreamReaderStreamOutput setFutureTimeCodePts:](self, "setFutureTimeCodePts:", &v54);
                i = 0;
                break;
              }
              memset(buf, 0, sizeof(buf));
              *(_QWORD *)&v84 = 0;
              v53 = v80;
              -[MOVStreamReaderStreamOutput frameDuration](self, "frameDuration");
              CMTimeAdd((CMTime *)buf, &v53, &v52);
              v51 = v76;
              *(_OWORD *)&v50.value = *(_OWORD *)buf;
              v50.epoch = v84;
              if (CMTimeCompare(&v51, &v50) < 0)
                break;
              i = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", &v80);
            }
            if (a3)
              *a3 = objc_retainAutorelease((id)v21);
            if (a5)
              *a5 = i;
            goto LABEL_76;
          }
LABEL_56:
          -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "status") == 3;

          if (v40)
          {
            -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "error");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v42)
              __assert_rtn("-[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsDataArray:readTimeCode:timecodeSampleBuffer:timestamp:error:]", "MOVStreamReaderStreamOutput.mm", 1699, "self.assetReader.error != nil");

            if (a7)
            {
              -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "error");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              *a7 = (id)objc_msgSend(v44, "copy");

            }
            v11 = 0;
          }
          else
          {
            -[MOVStreamReaderStreamOutput setEndOfStreamReached:](self, "setEndOfStreamReached:", 1);
            while (v21 | (unint64_t)i)
            {
              -[MOVStreamReaderStreamOutput attachmentsDataForStreamPts:duration:](self, "attachmentsDataForStreamPts:duration:", 0, 0);
              v45 = objc_claimAutoreleasedReturnValue();

              v21 = v45;
              i = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", 0);
            }
            v11 = 0;
            v21 = 0;
          }
LABEL_76:

          return v11;
        }
        CFRelease(v11);
        -[MOVStreamReaderStreamOutput streamOutput](self, "streamOutput");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (opaqueCMSampleBuffer *)objc_msgSend(v27, "copyNextSampleBuffer");

      }
    }
    v16 = 0;
    goto LABEL_15;
  }
  v10 = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", a6, a4);
  if (v10)
  {
    v11 = v10;
    while (!CMSampleBufferGetTotalSampleSize(v11))
    {
      v11 = -[MOVStreamReaderStreamOutput timeCodeBufferForStream:](self, "timeCodeBufferForStream:", a6);
      if (!v11)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    -[MOVStreamReaderStreamOutput setEndOfStreamReached:](self, "setEndOfStreamReached:", 1);
    v11 = 0;
  }
  if (a3)
    *a3 = 0;
  if (a5)
    *a5 = 0;
  return v11;
}

- (opaqueCMSampleBuffer)timeCodeBufferForStream:(id *)a3
{
  MOVStreamReaderStreamOutput *v4;
  __int128 v5;
  opaqueCMSampleBuffer *v6;
  void *v7;
  void *v8;
  opaqueCMSampleBuffer *v9;
  CMTime v11;

  v4 = self;
  if (a3)
  {
    v5 = *MEMORY[0x24BDC0D38];
    a3->var3 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    *(_OWORD *)&a3->var0 = v5;
    if (-[MOVStreamReaderStreamOutput futureTimeCodeBuffer](self, "futureTimeCodeBuffer"))
    {
      -[MOVStreamReaderStreamOutput futureTimeCodePts](v4, "futureTimeCodePts");
      *(CMTime *)a3 = v11;
LABEL_5:
      v6 = -[MOVStreamReaderStreamOutput futureTimeCodeBuffer](v4, "futureTimeCodeBuffer");
      -[MOVStreamReaderStreamOutput setFutureTimeCodeBuffer:](v4, "setFutureTimeCodeBuffer:", 0);
      return v6;
    }
  }
  else if (-[MOVStreamReaderStreamOutput futureTimeCodeBuffer](self, "futureTimeCodeBuffer"))
  {
    goto LABEL_5;
  }
  if (-[MOVStreamReaderStreamOutput mediaType](v4, "mediaType") != 4)
    v4 = v4->_timeCodeOutput;
  -[MOVStreamReaderStreamOutput streamOutput](v4, "streamOutput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (opaqueCMSampleBuffer *)objc_msgSend(v7, "copyNextSampleBuffer");
    v6 = v9;
    if (a3 && v9)
    {
      CMSampleBufferGetPresentationTimeStamp(&v11, v9);
      *(CMTime *)a3 = v11;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)attachmentsDataForStreamPts:(id *)a3 duration:(id *)a4
{
  __int128 v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = *MEMORY[0x24BDC0D38];
    a3->var3 = *(_QWORD *)(MEMORY[0x24BDC0D38] + 16);
    *(_OWORD *)&a3->var0 = v7;
  }
  -[MOVStreamReaderStreamOutput futureAttachmentsData](self, "futureAttachmentsData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (a3)
    {
      -[MOVStreamReaderStreamOutput futureAttachmentsPts](self, "futureAttachmentsPts");
      *(_OWORD *)&a3->var0 = v31;
      a3->var3 = *(_QWORD *)&v32[0];
    }
    if (a4)
    {
      -[MOVStreamReaderStreamOutput futureAttachmentsDuration](self, "futureAttachmentsDuration");
      *(_OWORD *)&a4->var0 = v31;
      a4->var3 = *(_QWORD *)&v32[0];
    }
    -[MOVStreamReaderStreamOutput futureAttachmentsData](self, "futureAttachmentsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOVStreamReaderStreamOutput setFutureAttachmentsData:](self, "setFutureAttachmentsData:", 0);
    return v9;
  }
  else
  {
    -[MOVStreamReaderStreamOutput attachmentsAdaptor](self, "attachmentsAdaptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "nextTimedMetadataGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "items");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        if (a3)
        {
          if (v13)
          {
            objc_msgSend(v13, "timeRange");
          }
          else
          {
            memset(v32, 0, sizeof(v32));
            v31 = 0u;
          }
          *(_OWORD *)&a3->var0 = v31;
          a3->var3 = *(_QWORD *)&v32[0];
        }
        if (a4)
        {
          if (v13)
          {
            objc_msgSend(v13, "timeRange");
          }
          else
          {
            memset(v32, 0, sizeof(v32));
            v31 = 0u;
          }
          *(_OWORD *)&a4->var0 = *(_OWORD *)((char *)v32 + 8);
          a4->var3 = *((_QWORD *)&v32[1] + 1);
        }
        v17 = (void *)objc_opt_new();
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v13, "items");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v28 != v23)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "value");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                objc_msgSend(v17, "addObject:", v25);

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          }
          while (v22);
        }

      }
      else
      {

        v17 = 0;
      }
    }
    else
    {
      -[MOVStreamReaderStreamOutput seiTrackReader](self, "seiTrackReader");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v17 = (void *)objc_msgSend(v16, "copyNextSEIPts:deserialize:error:", &v31, 0, &v26);
      v18 = v26;

      if (v18)
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          -[MOVStreamReaderStreamOutput streamId](self, "streamId");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v20;
          v35 = 2114;
          v36 = v18;
          _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_ERROR, "Error reading SEI for %{public}@: %{public}@", buf, 0x16u);

        }
        v17 = 0;
      }
      else if (a3 && v17)
      {
        *(_OWORD *)&a3->var0 = v31;
        a3->var3 = *(_QWORD *)&v32[0];
      }

    }
    return v17;
  }
}

- (id)nextAttachmentWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MOVStreamReaderStreamOutput attachmentsAdaptor](self, "attachmentsAdaptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "nextTimedMetadataGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v10, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)decodeAttachmentsData:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v6)
  {
    v38 = 0;
    v7 = -[MOVStreamReaderStreamOutput attachmentSerializationMode](self, "attachmentSerializationMode");
    if (v7)
    {
      if (v7 == 1)
      {
        v37 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, &v38, &v37);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v37;
        if (v13)
        {
          v36 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 1, &v36);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v36;
          v20 = (void *)MEMORY[0x24BDD17C8];
          if (!v8)
          {
            objc_msgSend(v13, "localizedDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", CFSTR("Metadata PLIST Read error: %@"), v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a4, v29, 8);
            v30 = (void *)MEMORY[0x24BDD17C8];
            -[MOVStreamReaderStreamOutput streamId](self, "streamId");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "stringWithFormat:", CFSTR("No matching serialization mode for stream '%@' (fallback to RAW)."), v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            +[MIOLog defaultLog](MIOLog, "defaultLog");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v32;
              _os_log_impl(&dword_210675000, v33, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
            }

            -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](self, "setAttachmentSerializationMode:", 2);
            -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v6, 0);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = 0;
            goto LABEL_22;
          }
          -[MOVStreamReaderStreamOutput streamId](self, "streamId");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Wrong attachments serialization mode PLIST for stream '%@' (fallback to JSON)."), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          +[MIOLog defaultLog](MIOLog, "defaultLog");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v22;
            _os_log_impl(&dword_210675000, v23, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
          }

          -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](self, "setAttachmentSerializationMode:", 0);
        }
        else
        {
          v18 = v18;
          v8 = v18;
        }
LABEL_21:
        v26 = v8;
        v9 = v26;
LABEL_22:

        goto LABEL_23;
      }
      if (v7 != 2)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown AttachmentSerializationMode = %d for frame metadata!"), -[MOVStreamReaderStreamOutput attachmentSerializationMode](self, "attachmentSerializationMode"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v24;
          _os_log_impl(&dword_210675000, v25, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }

        v18 = 0;
        v13 = 0;
        v8 = 0;
        goto LABEL_21;
      }
      v39 = CFSTR("RawAttachmentData");
      v40 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 1, &v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v35;
      if (v10)
      {
        v11 = v10;
        v34 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, &v38, &v34);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v34;

        v14 = (void *)MEMORY[0x24BDD17C8];
        -[MOVStreamReaderStreamOutput streamId](self, "streamId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("Wrong attachments serialization mode JSON for stream '%@' (fallback to PLIST)."), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v16;
          _os_log_impl(&dword_210675000, v17, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }

        -[MOVStreamReaderStreamOutput setAttachmentSerializationMode:](self, "setAttachmentSerializationMode:", 1);
        v18 = v12;

        v8 = v18;
        goto LABEL_21;
      }
    }
    v18 = 0;
    v13 = 0;
    goto LABEL_21;
  }
  v9 = 0;
LABEL_23:

  return v9;
}

- (opaqueCMSampleBuffer)grabNextSampleBufferForStreamTimestamp:(id *)a3 error:(id *)a4
{
  opaqueCMSampleBuffer *v6;
  id v7;
  const __CFDictionary *v8;
  id v10;

  v10 = 0;
  v6 = -[MOVStreamReaderStreamOutput nextSampleBufferForStreamAttachmentsData:timestamp:error:](self, "nextSampleBufferForStreamAttachmentsData:timestamp:error:", &v10, a3, a4);
  v7 = v10;
  if (v6)
  {
    -[MOVStreamReaderStreamOutput decodeAttachmentsData:error:](self, "decodeAttachmentsData:error:", v7, a4);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v8)
      CMSetAttachments(v6, v8, 1u);

  }
  return v6;
}

- (id)grabNextMetadataItemsTimeRange:(id *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[MOVStreamReaderStreamOutput grabNextTimedMetadataGroupOfStreamError:](self, "grabNextTimedMetadataGroupOfStreamError:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v6, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    if (a3)
    {
      objc_msgSend(v6, "timeRange");
      *(_OWORD *)&a3->var0.var0 = v15;
      *(_OWORD *)&a3->var0.var3 = v16;
      *(_OWORD *)&a3->var1.var1 = v17;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)grabNextMetadataItemsOfTrackAssociatedWithStreamWithIdentifier:(id)a3 timeRange:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  -[MOVStreamReaderStreamOutput associatedMetadataOutputs](self, "associatedMetadataOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "grabNextMetadataItemsTimeRange:error:", a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No associated metadata stream found with identifier '%@'."), v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v12, 7);

    v11 = 0;
  }

  return v11;
}

- (id)grabNextTimedMetadataGroupOfStreamError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[MOVStreamReaderStreamOutput metadataTrackMetadataAdaptor](self, "metadataTrackMetadataAdaptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "nextTimedMetadataGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v8 = v7;
      v9 = v8;
    }
    else
    {
      -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");

      if (v13 == 3)
      {
        -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "error");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
          __assert_rtn("-[MOVStreamReaderStreamOutput grabNextTimedMetadataGroupOfStreamError:]", "MOVStreamReaderStreamOutput.mm", 2070, "self.assetReader.error != nil");

        if (a3)
        {
          -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *a3 = (id)objc_msgSend(v17, "copy");

        }
        v9 = 0;
      }
      else
      {
        -[MOVStreamReaderStreamOutput setEndOfStreamReached:](self, "setEndOfStreamReached:", 1);
        v9 = 0;
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[MOVStreamReaderStreamOutput streamId](self, "streamId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("No AVAssetReaderOutputMetadataAdaptor found for metadata stream: '%@'"), v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a3, v8, 5);
    v9 = 0;
  }

  return v9;
}

- (id)grabNextMetadataOfStreamTimeRange:(id *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  $69C59A32909E13F94AB58097350E6BB9 *v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (-[MOVStreamReaderStreamOutput mediaType](self, "mediaType") != 2)
    return 0;
  v33 = a3;
  -[MOVStreamReaderStreamOutput version](self, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "versionedKey:modifier:", CFSTR("mdta/com.apple.metadata_stream_item"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MOVStreamReaderStreamOutput metadataTrackMetadataAdaptor](self, "metadataTrackMetadataAdaptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v8;
  if (v8)
  {
    objc_msgSend(v8, "nextTimedMetadataGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v9, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v34, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v41 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v7);

            if (v19
              || (objc_msgSend(v17, "identifier"),
                  v22 = (void *)objc_claimAutoreleasedReturnValue(),
                  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("mdta/com.apple.rawIMUDict")),
                  v22,
                  v23))
            {
              objc_msgSend(v17, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)objc_msgSend(v20, "copy");
              objc_msgSend(v12, "addObject:", v21);
            }
            else
            {
              objc_msgSend(v17, "value");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v17, "value");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "copy");
              }
              else
              {
                +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v20);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v24, 200, 0, a4);
                v25 = objc_claimAutoreleasedReturnValue();
              }
              v21 = (void *)v25;

              if (v21)
                objc_msgSend(v12, "addObject:", v21);
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v14);
      }

      if (v33)
      {
        objc_msgSend(v34, "timeRange");
        *(_OWORD *)&v33->var0.var0 = v37;
        *(_OWORD *)&v33->var0.var3 = v38;
        *(_OWORD *)&v33->var1.var1 = v39;
      }

      goto LABEL_29;
    }
    -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "status");

    if (v28 == 3)
    {
      -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "error");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        __assert_rtn("-[MOVStreamReaderStreamOutput grabNextMetadataOfStreamTimeRange:error:]", "MOVStreamReaderStreamOutput.mm", 2136, "self.assetReader.error != nil");

      if (a4)
      {
        -[MOVStreamReaderStreamOutput assetReader](self, "assetReader");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "error");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *a4 = (id)objc_msgSend(v32, "copy");

      }
    }
    else
    {
      -[MOVStreamReaderStreamOutput setEndOfStreamReached:](self, "setEndOfStreamReached:", 1);
    }
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (BOOL)shouldDiscardStream:(id)a3 mediaType:(int64_t)a4 track:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  void *v13;
  char v14;

  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    -[MOVStreamReaderStreamOutput reader](self, "reader");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "reader:shouldDiscardStream:mediaType:track:", v13, v8, a4, v9);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)findTimeCodeTrackAssociatedWithTrack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x24BDB1D48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "associatedTracksOfType:", *MEMORY[0x24BDB20F0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v6, "containsObject:", v11, (_QWORD)v13) & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)findTracksAssociatedWithTimeCodeTrack:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tracks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v16;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    v9 = *MEMORY[0x24BDB20F0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "associatedTracksOfType:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v3);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (BOOL)addAssociatedMetadataTracks:(id)a3 rawSampleAttachmentsIdentifier:(id)a4 trackKindIdentifier:(id)a5 movVersion:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  void *v29;
  MOVStreamReaderStreamOutput *v30;
  MOVStreamReaderStreamOutput *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  BOOL v45;
  id v47;
  void *v48;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  MOVStreamReaderStreamOutput *v55;
  void *v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v11 = a5;
  v50 = a6;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("/"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)objc_opt_new();
  v55 = self;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v47;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v13)
  {
    v52 = *(_QWORD *)v63;
LABEL_3:
    v53 = v13;
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v52)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v14);
      objc_msgSend(v15, "metadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v59;
LABEL_8:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v59 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v20);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v11);

          if (v23)
            break;
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
            if (v18)
              goto LABEL_8;
            goto LABEL_14;
          }
        }
        objc_msgSend(v21, "value");
        v24 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v24;
        if (v24)
          goto LABEL_17;
      }
      else
      {
LABEL_14:

      }
      +[MOVStreamIOUtility getCustomAssociatedMetadataStreamIdFromTrack:](MOVStreamIOUtility, "getCustomAssociatedMetadataStreamIdFromTrack:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
      v56 = v25;
      if (objc_msgSend(v25, "isEqualToString:", v54))
      {
        v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB23D0]), "initWithTrack:outputSettings:", v15, 0);
        -[MOVStreamReaderStreamOutput assetReader](v55, "assetReader");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "canAddOutput:", v26);

        if (v28)
        {
          -[MOVStreamReaderStreamOutput assetReader](v55, "assetReader");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addOutput:", v26);

          v30 = (MOVStreamReaderStreamOutput *)objc_msgSend(objc_alloc(MEMORY[0x24BDB23C8]), "initWithAssetReaderTrackOutput:", v26);
          -[MOVStreamReaderStreamOutput setAttachmentsAdaptor:](v55, "setAttachmentsAdaptor:", v30);
LABEL_25:
          v43 = 3;
          goto LABEL_29;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't add metadata track (%@) to the AVAssetReader."), v15);
        v30 = (MOVStreamReaderStreamOutput *)objc_claimAutoreleasedReturnValue();
        v43 = 1;
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a7, v30, 1);
      }
      else
      {
        v31 = [MOVStreamReaderStreamOutput alloc];
        -[MOVStreamReaderStreamOutput assetReader](v55, "assetReader");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamReaderStreamOutput reader](v55, "reader");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[MOVStreamReaderStreamOutput reader](v55, "reader");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "delegate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v30 = -[MOVStreamReaderStreamOutput initWithMetadataTrack:assetReader:version:unknownStreamId:reader:delegate:error:](v31, "initWithMetadataTrack:assetReader:version:unknownStreamId:reader:delegate:error:", v15, v32, v50, v56, v33, v35, &v57);
        v26 = v57;

        if (v26)
        {
          -[MOVStreamReaderStreamOutput reader](v55, "reader");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            -[MOVStreamReaderStreamOutput reader](v55, "reader");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "delegate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_opt_respondsToSelector();

            if ((v40 & 1) == 0)
              goto LABEL_25;
            -[MOVStreamReaderStreamOutput reader](v55, "reader");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "delegate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[MOVStreamReaderStreamOutput reader](v55, "reader");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "reader:didReceiveWarning:", v42, v26);

          }
          v43 = 3;
        }
        else
        {
          -[MOVStreamReaderStreamOutput streamId](v30, "streamId");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKey:", v30, v36);
          v43 = 0;
        }

      }
LABEL_29:

      if (v43 != 3 && v43)
      {
        v45 = 0;
        v44 = obj;
        goto LABEL_35;
      }
      if (++v14 == v53)
      {
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

  v44 = (void *)objc_msgSend(v48, "copy");
  -[MOVStreamReaderStreamOutput setAssociatedMetadataOutputs:](v55, "setAssociatedMetadataOutputs:", v44);
  v45 = 1;
LABEL_35:

  return v45;
}

- (BOOL)isEmptySample:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTimeRange v16;
  CMTimeRange range;
  CMTime v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "isEmpty"))
        {
          memset(&v18, 0, sizeof(v18));
          CMSampleBufferGetPresentationTimeStamp(&v18, a3);
          if (v9)
          {
            objc_msgSend(v9, "timeMapping");
          }
          else
          {
            v15 = 0u;
            memset(&v16, 0, sizeof(v16));
            v13 = 0u;
            v14 = 0u;
          }
          range = v16;
          v12 = v18;
          if (CMTimeRangeContainsTime(&range, &v12))
          {
            v10 = 1;
            goto LABEL_15;
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)isSampleInEdit:(opaqueCMSampleBuffer *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CMTimeRange v16;
  CMTimeRange range;
  CMTime v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[MOVStreamReaderStreamOutput assetTrack](self, "assetTrack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        memset(&v18, 0, sizeof(v18));
        CMSampleBufferGetPresentationTimeStamp(&v18, a3);
        if (v9)
        {
          objc_msgSend(v9, "timeMapping");
        }
        else
        {
          v15 = 0u;
          memset(&v16, 0, sizeof(v16));
          v13 = 0u;
          v14 = 0u;
        }
        range = v16;
        v12 = v18;
        if (CMTimeRangeContainsTime(&range, &v12))
        {
          v10 = 1;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)streamIdFromTrackStreamTypeIdentifier:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Depth")) & 1) != 0)
  {
    v4 = CFSTR("FrontDepth");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Color")) & 1) != 0)
  {
    v4 = CFSTR("FrontColor");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IR")) & 1) != 0)
  {
    v4 = CFSTR("FrontIR");
  }
  else
  {
    v4 = (__CFString *)v3;
  }

  return v4;
}

- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 streamEncodingType:(id)a5 inputPixelFormat:(unsigned int)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FourCharCode MediaSubType;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  const __CFDictionary *Extensions;
  const __CFNumber *Value;
  NSObject *v24;
  void *v25;
  void *v26;
  unsigned int valuePtr;
  __int128 v28;
  uint64_t v29;
  uint8_t buf[4];
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!objc_msgSend(v14, "length"))
  {
    MediaSubType = -[MOVStreamReaderStreamOutput playbackPixelFormatForTrack:ofStream:delegate:](self, "playbackPixelFormatForTrack:ofStream:delegate:", v12, v13, v15);
    goto LABEL_8;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("h264")) & 1) != 0
    || objc_msgSend(v14, "isEqualToString:", CFSTR("HEVC")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("RawBayer")))
      a6 = 1278226736;
    else
      a6 = 875704438;
    goto LABEL_9;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("slim")))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v28 = xmmword_2106E4708;
    v19 = objc_msgSend(v18, "isOperatingSystemAtLeastVersion:", &v28);

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v12, "formatDescriptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v21);
      Value = (const __CFNumber *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC0B90]);
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0xA && ((0x381u >> valuePtr) & 1) != 0)
      {
        a6 = dword_2106E4720[valuePtr];
      }
      else
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v31 = valuePtr;
          _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_ERROR, "Got a Depth/IR stream which uses unknown version of SLIM (%d)", buf, 8u);
        }

        a6 = -1;
      }
    }
    else
    {
      a6 = 2037741158;
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("HEVCMonochrome")) & 1) == 0
    && !objc_msgSend(v14, "isEqualToString:", CFSTR("HEVCMonochrom")))
  {
    a6 = 875704438;
    if (!objc_msgSend(v14, "isEqualToString:", CFSTR("none")))
      goto LABEL_9;
    objc_msgSend(v12, "formatDescriptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_9;
    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v26);
LABEL_8:
    a6 = MediaSubType;
    goto LABEL_9;
  }
  if (a6 != 875704422 && a6 != 875704438 && a6 != 1278226488)
    a6 = 1278226736;
LABEL_9:

  return a6;
}

- (BOOL)formatDescriptionOfTrack:(id)a3 containsKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "formatDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFDictionary objectForKeyedSubscript:](CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v7), "objectForKeyedSubscript:", CFSTR("MetadataKeyTable"));
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("MetadataKeyValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v12, 4);
        v14 = objc_msgSend(v13, "isEqualToString:", v5);

        if ((v14 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)formatDescriptionOfTrack:(id)a3 containsKeyFromIndentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MOVStreamReaderStreamOutput formatDescriptionOfTrack:containsKey:](self, "formatDescriptionOfTrack:containsKey:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)playbackPixelFormatForTrack:(id)a3 ofStream:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  const __CFDictionary *Extensions;
  const __CFNumber *Value;
  NSObject *v19;
  void *v20;
  int v21;
  id WeakRetained;
  void *v23;
  id v24;
  char v25;
  id v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  unsigned int valuePtr;
  __int128 v32;
  uint64_t v33;
  uint8_t buf[4];
  unsigned int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FrontColor")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("BackColorWide")) & 1) != 0)
  {
    v11 = 875704438;
    goto LABEL_4;
  }
  v11 = 875704438;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BackColorTele")) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BackIR")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("FrontIR")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("FrontDepth")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("BackDepth")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("RawBayer")))
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v32 = xmmword_2106E4708;
    v14 = objc_msgSend(v13, "isOperatingSystemAtLeastVersion:", &v32);

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v8, "formatDescriptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      Extensions = CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v16);
      Value = (const __CFNumber *)CFDictionaryGetValue(Extensions, (const void *)*MEMORY[0x24BDC0B90]);
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0xA && ((0x381u >> valuePtr) & 1) != 0)
      {
        v11 = dword_2106E4720[valuePtr];
      }
      else
      {
        +[MIOLog defaultLog](MIOLog, "defaultLog");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v35 = valuePtr;
          _os_log_impl(&dword_210675000, v19, OS_LOG_TYPE_ERROR, "Got a Depth/IR stream which uses unknown version of SLIM (%d)", buf, 8u);
        }

        v11 = -1;
      }
    }
    else
    {
      v11 = 2037741158;
    }
    goto LABEL_4;
  }
  self->_pixelFormatWasGuessed = 1;
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MOVStreamReaderStreamOutput reader](self, "reader");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v10, "pixelFormatForUnknownTrackOfReader:streamId:", v20, v9);
    goto LABEL_25;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v23 = WeakRetained;
    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) != 0)
    {
      -[MOVStreamReaderStreamOutput reader](self, "reader");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v10, "pixelFormatForUnknownTrackOfReader:", v20);
LABEL_25:
      v11 = v21;

      if (v11)
        goto LABEL_4;
    }
  }
  v26 = objc_loadWeakRetained((id *)&self->_assetReader);
  objc_msgSend(v26, "asset");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v28 = +[MOVStreamIOUtility detectPixelFormatForAsset:videoTrackId:error:](MOVStreamIOUtility, "detectPixelFormatForAsset:videoTrackId:error:", v27, objc_msgSend(v8, "trackID"), &v30);
  v29 = v30;

  if (!v28)
    v28 = +[MOVStreamIOUtility guessPixelFormatForTrack:](MOVStreamIOUtility, "guessPixelFormatForTrack:", v8);
  if (v28)
    v11 = v28;
  else
    v11 = 875704438;

LABEL_4:
  return v11;
}

- (MOVStreamPostProcessor)postProcessor
{
  return (MOVStreamPostProcessor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPostProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (AVAssetReaderTrackOutput)streamOutput
{
  return (AVAssetReaderTrackOutput *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStreamOutput:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (AVAssetReaderOutputMetadataAdaptor)metadataTrackMetadataAdaptor
{
  return (AVAssetReaderOutputMetadataAdaptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMetadataTrackMetadataAdaptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)associatedMetadataOutputs
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAssociatedMetadataOutputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (AVAssetReaderOutputMetadataAdaptor)attachmentsAdaptor
{
  return (AVAssetReaderOutputMetadataAdaptor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAttachmentsAdaptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unsigned)originalPixelFormat
{
  return self->_originalPixelFormat;
}

- (void)setOriginalPixelFormat:(unsigned int)a3
{
  self->_originalPixelFormat = a3;
}

- (unsigned)determinedPixelFormat
{
  return self->_determinedPixelFormat;
}

- (void)setDeterminedPixelFormat:(unsigned int)a3
{
  self->_determinedPixelFormat = a3;
}

- (BOOL)pixelFormatWasGuessed
{
  return self->_pixelFormatWasGuessed;
}

- (void)setPixelFormatWasGuessed:(BOOL)a3
{
  self->_pixelFormatWasGuessed = a3;
}

- (int)attachmentSerializationMode
{
  return self->_attachmentSerializationMode;
}

- (void)setAttachmentSerializationMode:(int)a3
{
  self->_attachmentSerializationMode = a3;
}

- (BOOL)isLegacyIMUTrack
{
  return self->_isLegacyIMUTrack;
}

- (void)setIsLegacyIMUTrack:(BOOL)a3
{
  self->_isLegacyIMUTrack = a3;
}

- (BOOL)customMetadataFormat
{
  return self->_customMetadataFormat;
}

- (void)setCustomMetadataFormat:(BOOL)a3
{
  self->_customMetadataFormat = a3;
}

- (NSArray)futureAttachmentsData
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setFutureAttachmentsData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsPts
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_futureAttachmentsPts, 24, 1, 0);
  return result;
}

- (void)setFutureAttachmentsPts:(id *)a3
{
  objc_copyStruct(&self->_futureAttachmentsPts, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureAttachmentsDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_futureAttachmentsDuration, 24, 1, 0);
  return result;
}

- (void)setFutureAttachmentsDuration:(id *)a3
{
  objc_copyStruct(&self->_futureAttachmentsDuration, a3, 24, 1, 0);
}

- (opaqueCMSampleBuffer)futureTimeCodeBuffer
{
  return self->_futureTimeCodeBuffer;
}

- (void)setFutureTimeCodeBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_futureTimeCodeBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)futureTimeCodePts
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_futureTimeCodePts, 24, 1, 0);
  return result;
}

- (void)setFutureTimeCodePts:(id *)a3
{
  objc_copyStruct(&self->_futureTimeCodePts, a3, 24, 1, 0);
}

- (MIOVersion)version
{
  return (MIOVersion *)objc_loadWeakRetained((id *)&self->_version);
}

- (void)setVersion:(id)a3
{
  objc_storeWeak((id *)&self->_version, a3);
}

- (MOVStreamReaderDelegate)delegate
{
  return (MOVStreamReaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MOVStreamReader)reader
{
  return (MOVStreamReader *)objc_loadWeakRetained((id *)&self->_reader);
}

- (void)setReader:(id)a3
{
  objc_storeWeak((id *)&self->_reader, a3);
}

- (AVAssetReader)assetReader
{
  return (AVAssetReader *)objc_loadWeakRetained((id *)&self->_assetReader);
}

- (void)setAssetReader:(id)a3
{
  objc_storeWeak((id *)&self->_assetReader, a3);
}

- (NSString)streamId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStreamId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)isMIOStream
{
  return self->_isMIOStream;
}

- (void)setIsMIOStream:(BOOL)a3
{
  self->_isMIOStream = a3;
}

- (NSString)attachmentsIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAttachmentsIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSString)trackKindIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackKindIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (AVAssetTrack)assetTrack
{
  return (AVAssetTrack *)objc_loadWeakRetained((id *)&self->_assetTrack);
}

- (void)setAssetTrack:(id)a3
{
  objc_storeWeak((id *)&self->_assetTrack, a3);
}

- (BOOL)endOfStreamReached
{
  return self->_endOfStreamReached;
}

- (void)setEndOfStreamReached:(BOOL)a3
{
  self->_endOfStreamReached = a3;
}

- (NSString)relatedStreamId
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setRelatedStreamId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)relationSpecifier
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRelationSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  objc_copyStruct(retstr, &self->_transform, 48, 1, 0);
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  objc_copyStruct(&self->_transform, a3, 48, 1, 0);
}

- (unint64_t)trackTypeInfo
{
  return self->_trackTypeInfo;
}

- (void)setTrackTypeInfo:(unint64_t)a3
{
  self->_trackTypeInfo = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (BOOL)firstVideoFrameRead
{
  return self->_firstVideoFrameRead;
}

- (void)setFirstVideoFrameRead:(BOOL)a3
{
  self->_firstVideoFrameRead = a3;
}

- (BOOL)isStereoVideoStream
{
  return self->_stereoVideoStream;
}

- (void)setStereoVideoStream:(BOOL)a3
{
  self->_stereoVideoStream = a3;
}

- (NSDictionary)additionalCompressionProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAdditionalCompressionProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)videoLayerIds
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setVideoLayerIds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (BOOL)hasTimeCode
{
  return self->_hasTimeCode;
}

- (void)setHasTimeCode:(BOOL)a3
{
  self->_hasTimeCode = a3;
}

- (BOOL)isTimeRangeMetadataStream
{
  return self->_timeRangeMetadataStream;
}

- (void)setTimeRangeMetadataStream:(BOOL)a3
{
  self->_timeRangeMetadataStream = a3;
}

- (NSDictionary)synthesizedTimeCodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSynthesizedTimeCodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (BOOL)synthesizedTimeCodeIsDropFrame
{
  return self->_synthesizedTimeCodeIsDropFrame;
}

- (void)setSynthesizedTimeCodeIsDropFrame:(BOOL)a3
{
  self->_synthesizedTimeCodeIsDropFrame = a3;
}

- (MIOSEITrackReader)seiTrackReader
{
  return (MIOSEITrackReader *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSeiTrackReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seiTrackReader, 0);
  objc_storeStrong((id *)&self->_synthesizedTimeCodes, 0);
  objc_storeStrong((id *)&self->_videoLayerIds, 0);
  objc_storeStrong((id *)&self->_additionalCompressionProperties, 0);
  objc_storeStrong((id *)&self->_relationSpecifier, 0);
  objc_storeStrong((id *)&self->_relatedStreamId, 0);
  objc_destroyWeak((id *)&self->_assetTrack);
  objc_storeStrong((id *)&self->_trackKindIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentsIdentifier, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_destroyWeak((id *)&self->_assetReader);
  objc_destroyWeak((id *)&self->_reader);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_version);
  objc_storeStrong((id *)&self->_futureAttachmentsData, 0);
  objc_storeStrong((id *)&self->_attachmentsAdaptor, 0);
  objc_storeStrong((id *)&self->_associatedMetadataOutputs, 0);
  objc_storeStrong((id *)&self->_metadataTrackMetadataAdaptor, 0);
  objc_storeStrong((id *)&self->_streamOutput, 0);
  objc_storeStrong((id *)&self->postProcessor, 0);
  objc_storeStrong((id *)&self->_associatedOutputs, 0);
  objc_storeStrong((id *)&self->_timeCodeOutput, 0);
}

- (void)copyNextStereoFrames:rightBuffer:timestamp:error:.cold.1()
{
  __assert_rtn("-[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:]", "MOVStreamReaderStreamOutput.mm", 1262, "leftBuffer");
}

- (void)copyNextStereoFrames:rightBuffer:timestamp:error:.cold.2()
{
  __assert_rtn("-[MOVStreamReaderStreamOutput copyNextStereoFrames:rightBuffer:timestamp:error:]", "MOVStreamReaderStreamOutput.mm", 1263, "rightBuffer");
}

- (void)stereoFramesFromSampleBuffer:outLeft:outRight:error:.cold.1()
{
  __assert_rtn("-[MOVStreamReaderStreamOutput stereoFramesFromSampleBuffer:outLeft:outRight:error:]", "MOVStreamReaderStreamOutput.mm", 1353, "_videoLayerIds.count > 1");
}

@end
