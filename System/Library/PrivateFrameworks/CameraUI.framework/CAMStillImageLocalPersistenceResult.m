@implementation CAMStillImageLocalPersistenceResult

- (NSError)error
{
  return self->_error;
}

- (NSString)localPersistenceUUID
{
  return self->_localPersistenceUUID;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSURL)localAdjustmentsURL
{
  return self->_localAdjustmentsURL;
}

- (CAMStillImageCaptureResult)captureResult
{
  return self->_captureResult;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSString)localFilteredPreviewPath
{
  return self->_localFilteredPreviewPath;
}

- (NSString)localDiagnosticsPath
{
  return self->_localDiagnosticsPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_adjustmentsData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localFilteredPreviewPath, 0);
  objc_storeStrong((id *)&self->_localDiagnosticsPath, 0);
  objc_storeStrong((id *)&self->_localAdjustmentsURL, 0);
  objc_storeStrong((id *)&self->_linkedDestinationURL, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
  objc_storeStrong((id *)&self->_captureResult, 0);
}

- (CAMStillImageLocalPersistenceResult)initWithCaptureResult:(id)a3 atURL:(id)a4 linkedURL:(id)a5 localAdjustmentsURL:(id)a6 diagnosticsPath:(id)a7 filteredPreviewPath:(id)a8 withUUID:(id)a9 creationDate:(id)a10 uniformTypeIdentifier:(id)a11 orientation:(int64_t)a12 metadata:(id)a13 adjustmentsData:(id)a14 localPrivateMetadataFileURL:(id)a15 error:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  CAMStillImageLocalPersistenceResult *v31;
  CAMStillImageLocalPersistenceResult *v32;
  uint64_t v33;
  NSURL *localDestinationURL;
  uint64_t v35;
  NSURL *linkedDestinationURL;
  uint64_t v37;
  NSURL *localAdjustmentsURL;
  uint64_t v39;
  NSString *localDiagnosticsPath;
  uint64_t v41;
  NSString *localFilteredPreviewPath;
  uint64_t v43;
  NSString *localPersistenceUUID;
  uint64_t v45;
  NSString *uniformTypeIdentifier;
  uint64_t v47;
  NSDictionary *metadata;
  uint64_t v49;
  NSURL *localPrivateMetadataFileURL;
  CAMStillImageLocalPersistenceResult *v51;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  objc_super v60;

  v57 = a3;
  v58 = a4;
  v21 = a5;
  v22 = a6;
  v59 = a7;
  v23 = a8;
  v24 = a9;
  v56 = a10;
  v25 = a11;
  v26 = a13;
  v55 = a14;
  v27 = v21;
  v28 = a15;
  v29 = v24;
  v30 = a16;
  v60.receiver = self;
  v60.super_class = (Class)CAMStillImageLocalPersistenceResult;
  v31 = -[CAMStillImageLocalPersistenceResult init](&v60, sel_init);
  v32 = v31;
  if (v31)
  {
    objc_storeStrong((id *)&v31->_captureResult, a3);
    objc_storeStrong((id *)&v32->_creationDate, a10);
    v33 = objc_msgSend(v58, "copy");
    localDestinationURL = v32->_localDestinationURL;
    v32->_localDestinationURL = (NSURL *)v33;

    v35 = objc_msgSend(v27, "copy");
    linkedDestinationURL = v32->_linkedDestinationURL;
    v32->_linkedDestinationURL = (NSURL *)v35;

    v37 = objc_msgSend(v22, "copy");
    localAdjustmentsURL = v32->_localAdjustmentsURL;
    v32->_localAdjustmentsURL = (NSURL *)v37;

    v39 = objc_msgSend(v59, "copy");
    localDiagnosticsPath = v32->_localDiagnosticsPath;
    v32->_localDiagnosticsPath = (NSString *)v39;

    v41 = objc_msgSend(v23, "copy");
    localFilteredPreviewPath = v32->_localFilteredPreviewPath;
    v32->_localFilteredPreviewPath = (NSString *)v41;

    v43 = objc_msgSend(v29, "copy");
    localPersistenceUUID = v32->_localPersistenceUUID;
    v32->_localPersistenceUUID = (NSString *)v43;

    v45 = objc_msgSend(v25, "copy");
    uniformTypeIdentifier = v32->_uniformTypeIdentifier;
    v32->_uniformTypeIdentifier = (NSString *)v45;

    v32->_imageOrientation = a12;
    v47 = objc_msgSend(v26, "copy");
    metadata = v32->_metadata;
    v32->_metadata = (NSDictionary *)v47;

    objc_storeStrong((id *)&v32->_adjustmentsData, a14);
    v49 = objc_msgSend(v28, "copy");
    localPrivateMetadataFileURL = v32->_localPrivateMetadataFileURL;
    v32->_localPrivateMetadataFileURL = (NSURL *)v49;

    objc_storeStrong((id *)&v32->_error, a16);
    v51 = v32;
  }

  return v32;
}

- (NSURL)linkedDestinationURL
{
  return self->_linkedDestinationURL;
}

- (NSData)adjustmentsData
{
  return self->_adjustmentsData;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

@end
