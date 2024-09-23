@implementation CAMVideoLocalPersistenceResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMVideoLocalPersistenceResult)initWithURL:(id)a3 filteredLocalDestinationURL:(id)a4 linkedURL:(id)a5 filteredLinkedURL:(id)a6 videoThumbnailPath:(id)a7 UUID:(id)a8 duration:(id *)a9 dimensions:(id)a10 stillPersistenceUUID:(id)a11 stillDisplayTime:(id *)a12 metadataItems:(id)a13 creationDate:(id)a14 adjustmentsData:(id)a15 coordinationInfo:(id)a16 localPrivateMetadataFileURL:(id)a17 error:(id)a18
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  char *v48;
  id v51;
  id v52;
  id v54;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v52 = a3;
  v51 = a4;
  v57 = a5;
  v56 = a6;
  v55 = a7;
  v54 = a8;
  v22 = a11;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v58.receiver = self;
  v58.super_class = (Class)CAMVideoLocalPersistenceResult;
  v29 = -[CAMVideoLocalPersistenceResult init](&v58, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v52, "copy");
    v31 = (void *)*((_QWORD *)v29 + 1);
    *((_QWORD *)v29 + 1) = v30;

    v32 = objc_msgSend(v51, "copy");
    v33 = (void *)*((_QWORD *)v29 + 2);
    *((_QWORD *)v29 + 2) = v32;

    v34 = objc_msgSend(v57, "copy");
    v35 = (void *)*((_QWORD *)v29 + 3);
    *((_QWORD *)v29 + 3) = v34;

    v36 = objc_msgSend(v56, "copy");
    v37 = (void *)*((_QWORD *)v29 + 4);
    *((_QWORD *)v29 + 4) = v36;

    v38 = objc_msgSend(v55, "copy");
    v39 = (void *)*((_QWORD *)v29 + 5);
    *((_QWORD *)v29 + 5) = v38;

    v40 = objc_msgSend(v54, "copy");
    v41 = (void *)*((_QWORD *)v29 + 6);
    *((_QWORD *)v29 + 6) = v40;

    v42 = *(_OWORD *)&a9->var0;
    *((_QWORD *)v29 + 17) = a9->var3;
    *(_OWORD *)(v29 + 120) = v42;
    *(($2825F4736939C4A6D3AD43837233062D *)v29 + 7) = a10;
    v43 = objc_msgSend(v22, "copy");
    v44 = (void *)*((_QWORD *)v29 + 8);
    *((_QWORD *)v29 + 8) = v43;

    v45 = *(_OWORD *)&a12->var0;
    *((_QWORD *)v29 + 20) = a12->var3;
    *((_OWORD *)v29 + 9) = v45;
    objc_storeStrong((id *)v29 + 9, a13);
    objc_storeStrong((id *)v29 + 10, a14);
    objc_storeStrong((id *)v29 + 11, a15);
    objc_storeStrong((id *)v29 + 12, a16);
    v46 = objc_msgSend(v27, "copy");
    v47 = (void *)*((_QWORD *)v29 + 13);
    *((_QWORD *)v29 + 13) = v46;

    objc_storeStrong((id *)v29 + 14, a18);
    v48 = v29;
  }

  return (CAMVideoLocalPersistenceResult *)v29;
}

- (CAMVideoLocalPersistenceResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  CAMVideoLocalPersistenceResult *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultLocalDestinationURL"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultFilteredLocalDestinationURL"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultLinkedDestinationURL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultFilteredLinkedDestinationURL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultVideoThumbnailDestinationPath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultLocalPersistenceUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultDimensions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultStillPersistenceUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultStillDisplayTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultCreationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultAdjustmentsData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultLocalPrivateMetadataFileURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMVideoLocalPersistenceResultError"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0CA2E18];
  v32 = *MEMORY[0x1E0CA2E18];
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v33 = v14;
  if (v5)
  {
    v17 = v13;
    objc_msgSend(v5, "CMTimeValue");
    v13 = v17;
  }
  v30 = v13;
  v31 = v14;
  if (v8)
    objc_msgSend(v8, "CMTimeValue");
  v29 = 0;
  if (v6)
  {
    objc_msgSend(v6, "getValue:", &v29);
    v15 = v29;
  }
  else
  {
    v15 = 0;
  }
  v27 = v32;
  v28 = v33;
  v25 = v30;
  v26 = v31;
  v18 = -[CAMVideoLocalPersistenceResult initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:](self, "initWithURL:filteredLocalDestinationURL:linkedURL:filteredLinkedURL:videoThumbnailPath:UUID:duration:dimensions:stillPersistenceUUID:stillDisplayTime:metadataItems:creationDate:adjustmentsData:coordinationInfo:localPrivateMetadataFileURL:error:", v24, v23, v22, v21, v20, v19, &v27, v15, v7, &v25, 0, v9, v10, 0, v11,
          v12);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  duration = self->_duration;
  v5 = a3;
  objc_msgSend(v4, "valueWithCMTime:", &duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  duration = self->_stillDisplayTime;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &self->_dimensions, "{?=ii}");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMVideoLocalPersistenceResult localDestinationURL](self, "localDestinationURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("CAMVideoLocalPersistenceResultLocalDestinationURL"));

  -[CAMVideoLocalPersistenceResult filteredLocalDestinationURL](self, "filteredLocalDestinationURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("CAMVideoLocalPersistenceResultFilteredLocalDestinationURL"));

  -[CAMVideoLocalPersistenceResult linkedDestinationURL](self, "linkedDestinationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("CAMVideoLocalPersistenceResultLinkedDestinationURL"));

  -[CAMVideoLocalPersistenceResult filteredLinkedDestinationURL](self, "filteredLinkedDestinationURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v12, CFSTR("CAMVideoLocalPersistenceResultFilteredLinkedDestinationURL"));

  -[CAMVideoLocalPersistenceResult filteredVideoPreviewPath](self, "filteredVideoPreviewPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v13, CFSTR("CAMVideoLocalPersistenceResultVideoThumbnailDestinationPath"));

  -[CAMVideoLocalPersistenceResult localPersistenceUUID](self, "localPersistenceUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v14, CFSTR("CAMVideoLocalPersistenceResultLocalPersistenceUUID"));

  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("CAMVideoLocalPersistenceResultDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("CAMVideoLocalPersistenceResultDimensions"));
  -[CAMVideoLocalPersistenceResult stillPersistenceUUID](self, "stillPersistenceUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, CFSTR("CAMVideoLocalPersistenceResultStillPersistenceUUID"));

  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("CAMVideoLocalPersistenceResultStillDisplayTime"));
  -[CAMVideoLocalPersistenceResult creationDate](self, "creationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v16, CFSTR("CAMVideoLocalPersistenceResultCreationDate"));

  -[CAMVideoLocalPersistenceResult adjustmentsData](self, "adjustmentsData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, CFSTR("CAMVideoLocalPersistenceResultAdjustmentsData"));

  -[CAMVideoLocalPersistenceResult localPrivateMetadataFileURL](self, "localPrivateMetadataFileURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v18, CFSTR("CAMVideoLocalPersistenceResultLocalPrivateMetadataFileURL"));

  -[CAMVideoLocalPersistenceResult error](self, "error");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, CFSTR("CAMVideoLocalPersistenceResultError"));

}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSURL)filteredLocalDestinationURL
{
  return self->_filteredLocalDestinationURL;
}

- (NSURL)linkedDestinationURL
{
  return self->_linkedDestinationURL;
}

- (NSURL)filteredLinkedDestinationURL
{
  return self->_filteredLinkedDestinationURL;
}

- (NSString)filteredVideoPreviewPath
{
  return self->_filteredVideoPreviewPath;
}

- (NSString)localPersistenceUUID
{
  return self->_localPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_dimensions;
}

- (NSString)stillPersistenceUUID
{
  return self->_stillPersistenceUUID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (NSArray)metadataItems
{
  return self->_metadataItems;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSData)adjustmentsData
{
  return self->_adjustmentsData;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_adjustmentsData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_metadataItems, 0);
  objc_storeStrong((id *)&self->_stillPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_filteredVideoPreviewPath, 0);
  objc_storeStrong((id *)&self->_filteredLinkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_linkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_filteredLocalDestinationURL, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
}

@end
