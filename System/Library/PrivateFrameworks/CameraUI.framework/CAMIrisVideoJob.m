@implementation CAMIrisVideoJob

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMIrisVideoJob)initWithVideoURL:(id)a3 stillImagePersistenceUUID:(id)a4 videoPersistenceUUID:(id)a5 irisIdentifier:(id)a6 captureDevice:(int64_t)a7 captureOrientation:(int64_t)a8 duration:(id *)a9 stillImageDisplayTime:(id *)a10 captureTime:(double)a11 captureError:(id)a12 filterName:(id)a13 filteredVideoURL:(id)a14 persistenceOptions:(int64_t)a15 temporaryPersistenceOptions:(int64_t)a16 bundleIdentifier:(id)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  CAMIrisVideoJob *v29;
  CAMIrisVideoJob *v30;
  __int128 v31;
  int64_t var3;
  uint64_t v33;
  NSString *bundleIdentifier;
  CAMIrisVideoJob *v35;
  id obj;
  id v38;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  obj = a4;
  v23 = a4;
  v24 = a5;
  v38 = a6;
  v25 = a6;
  v26 = a12;
  v27 = a13;
  v41 = a14;
  v28 = a17;
  v43.receiver = self;
  v43.super_class = (Class)CAMIrisVideoJob;
  v29 = -[CAMIrisVideoJob init](&v43, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_videoURL, a3);
    objc_storeStrong((id *)&v30->_stillImagePersistenceUUID, obj);
    objc_storeStrong((id *)&v30->_videoPersistenceUUID, a5);
    objc_storeStrong((id *)&v30->_irisIdentifier, v38);
    v30->_captureDevice = a7;
    v30->_captureOrientation = a8;
    v31 = *(_OWORD *)&a9->var0;
    v30->_duration.epoch = a9->var3;
    *(_OWORD *)&v30->_duration.value = v31;
    var3 = a10->var3;
    *(_OWORD *)&v30->_stillImageDisplayTime.value = *(_OWORD *)&a10->var0;
    v30->_stillImageDisplayTime.epoch = var3;
    v30->_captureTime = a11;
    objc_storeStrong((id *)&v30->_captureError, a12);
    objc_storeStrong((id *)&v30->_filterName, a13);
    objc_storeStrong((id *)&v30->_filteredVideoURL, a14);
    v30->_persistenceOptions = a15;
    v30->_temporaryPersistenceOptions = a16;
    v33 = objc_msgSend(v28, "copy");
    bundleIdentifier = v30->_bundleIdentifier;
    v30->_bundleIdentifier = (NSString *)v33;

    v35 = v30;
  }

  return v30;
}

- (CAMIrisVideoJob)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  char *v33;
  __int128 v35;
  uint64_t v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CAMIrisVideoJob;
  v5 = -[CAMIrisVideoJob init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobVideoURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobStillImagePersistenceUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobVideoPersistenceUUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobIrisIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    *((_QWORD *)v5 + 5) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMIrisVideoJobCaptureDevice"));
    *((_QWORD *)v5 + 6) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMIrisVideoJobCaptureOrientation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobDuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = v5 + 112;
    if (v14)
    {
      objc_msgSend(v14, "CMTimeValue");
      *v16 = v35;
      v17 = v36;
    }
    else
    {
      v18 = MEMORY[0x1E0CA2E18];
      *v16 = *MEMORY[0x1E0CA2E18];
      v17 = *(_QWORD *)(v18 + 16);
    }
    *((_QWORD *)v5 + 16) = v17;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobStillImageDisplayTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = v5 + 136;
    if (v19)
    {
      objc_msgSend(v19, "CMTimeValue");
      *v21 = v35;
      v22 = v36;
    }
    else
    {
      v23 = MEMORY[0x1E0CA2E18];
      *v21 = *MEMORY[0x1E0CA2E18];
      v22 = *(_QWORD *)(v23 + 16);
    }
    *((_QWORD *)v5 + 19) = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("CAMIrisVideoJobCaptureTime"));
    *((_QWORD *)v5 + 7) = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobCaptureError"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobFilterName"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobFilteredVideoURL"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v29;

    *((_QWORD *)v5 + 11) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMIrisVideoJobPersistenceOptions"));
    *((_QWORD *)v5 + 12) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("CAMIrisVideoJobTemporaryPersistenceOptions"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CAMIrisVideoJobBundleIdentifier"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v31;

    v33 = v5;
  }

  return (CAMIrisVideoJob *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  duration = self->_duration;
  v5 = a3;
  objc_msgSend(v4, "valueWithCMTime:", &duration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  duration = self->_stillImageDisplayTime;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &duration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoURL, CFSTR("CAMIrisVideoJobVideoURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stillImagePersistenceUUID, CFSTR("CAMIrisVideoJobStillImagePersistenceUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoPersistenceUUID, CFSTR("CAMIrisVideoJobVideoPersistenceUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_irisIdentifier, CFSTR("CAMIrisVideoJobIrisIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_captureDevice, CFSTR("CAMIrisVideoJobCaptureDevice"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_captureOrientation, CFSTR("CAMIrisVideoJobCaptureOrientation"));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("CAMIrisVideoJobDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("CAMIrisVideoJobStillImageDisplayTime"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("CAMIrisVideoJobCaptureTime"), self->_captureTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_captureError, CFSTR("CAMIrisVideoJobCaptureError"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterName, CFSTR("CAMIrisVideoJobFilterName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteredVideoURL, CFSTR("CAMIrisVideoJobFilteredVideoURL"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_persistenceOptions, CFSTR("CAMIrisVideoJobPersistenceOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_temporaryPersistenceOptions, CFSTR("CAMIrisVideoJobTemporaryPersistenceOptions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("CAMIrisVideoJobBundleIdentifier"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  objc_super v10;
  objc_super v11;

  -[CAMIrisVideoJob videoURL](self, "videoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMIrisVideoJob filterName](self, "filterName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)CAMIrisVideoJob;
    -[CAMIrisVideoJob description](&v11, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: videoURL=%@ (%@)"), v6, v3, v4);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CAMIrisVideoJob;
    -[CAMIrisVideoJob description](&v10, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: videoURL=%@"), v6, v3, v9);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCTMVideo
{
  void *v3;
  void *v4;
  char v5;

  -[CAMIrisVideoJob stillImagePersistenceUUID](self, "stillImagePersistenceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMIrisVideoJob videoPersistenceUUID](self, "videoPersistenceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)stillImagePersistenceUUID
{
  return self->_stillImagePersistenceUUID;
}

- (NSString)videoPersistenceUUID
{
  return self->_videoPersistenceUUID;
}

- (NSString)irisIdentifier
{
  return self->_irisIdentifier;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)captureOrientation
{
  return self->_captureOrientation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (double)captureTime
{
  return self->_captureTime;
}

- (NSError)captureError
{
  return self->_captureError;
}

- (NSString)filterName
{
  return self->_filterName;
}

- (NSURL)filteredVideoURL
{
  return self->_filteredVideoURL;
}

- (int64_t)persistenceOptions
{
  return self->_persistenceOptions;
}

- (void)setPersistenceOptions:(int64_t)a3
{
  self->_persistenceOptions = a3;
}

- (int64_t)temporaryPersistenceOptions
{
  return self->_temporaryPersistenceOptions;
}

- (void)setTemporaryPersistenceOptions:(int64_t)a3
{
  self->_temporaryPersistenceOptions = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_filteredVideoURL, 0);
  objc_storeStrong((id *)&self->_filterName, 0);
  objc_storeStrong((id *)&self->_captureError, 0);
  objc_storeStrong((id *)&self->_irisIdentifier, 0);
  objc_storeStrong((id *)&self->_videoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_stillImagePersistenceUUID, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
}

@end
