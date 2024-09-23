@implementation CAMVideoCaptureResult

- (CAMVideoCaptureResult)initWithURL:(id)a3 filteredLocalDestinationURL:(id)a4 duration:(id *)a5 stillDisplayTime:(id *)a6 dimensions:(id)a7 metadata:(id)a8 videoZoomFactor:(double)a9 reason:(int64_t)a10 videoPreviewPixelBuffer:(__CVBuffer *)a11 coordinationInfo:(id)a12 error:(id)a13 slowWriterFrameDrops:(BOOL)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  CAMVideoCaptureResult *v24;
  CAMVideoCaptureResult *v25;
  __int128 v26;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v27;
  __int128 v28;
  uint64_t v29;
  NSArray *metadata;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSDate *captureDate;
  CAMVideoCaptureResult *v39;
  id v41;
  id v44;
  objc_super v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a8;
  v23 = a12;
  v44 = a13;
  v45.receiver = self;
  v45.super_class = (Class)CAMVideoCaptureResult;
  v24 = -[CAMVideoCaptureResult init](&v45, sel_init);
  v25 = v24;
  if (v24)
  {
    v41 = v21;
    objc_storeStrong((id *)&v24->_localDestinationURL, a3);
    objc_storeStrong((id *)&v25->_filteredLocalDestinationURL, a4);
    v26 = *(_OWORD *)&a5->var0;
    v25->_duration.epoch = a5->var3;
    *(_OWORD *)&v25->_duration.value = v26;
    v27 = a6;
    v28 = *(_OWORD *)&a6->var0;
    v25->_stillDisplayTime.epoch = a6->var3;
    *(_OWORD *)&v25->_stillDisplayTime.value = v28;
    v25->_dimensions = ($470D365275581EF16070F5A11344F73E)a7;
    v29 = objc_msgSend(v22, "copy");
    metadata = v25->_metadata;
    v25->_metadata = (NSArray *)v29;

    v25->_videoZoomFactor = a9;
    v25->_reason = a10;
    objc_storeStrong((id *)&v25->_coordinationInfo, a12);
    objc_storeStrong((id *)&v25->_error, a13);
    v25->_slowWriterFrameDrops = a14;
    v25->_videoPreviewPixelBuffer = CVPixelBufferRetain(a11);
    v31 = -[NSArray indexOfObjectPassingTest:](v25->_metadata, "indexOfObjectPassingTest:", &__block_literal_global_42);
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_3:
      if ((v27->var2 & 1) == 0)
      {
        v32 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v47 = v20;
          _os_log_impl(&dword_1DB760000, v32, OS_LOG_TYPE_DEFAULT, "Unable to extract captureDate, using currentTime instead for %{public}@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v22, "objectAtIndex:", v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dateValue");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v33 = v35;

    }
    else
    {
      objc_msgSend(v34, "stringValue");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMPersistenceController videoMetadataDateFormatter](CAMPersistenceController, "videoMetadataDateFormatter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "dateFromString:", v36);
      v33 = objc_claimAutoreleasedReturnValue();

      v27 = a6;
      if (!v33)
        goto LABEL_3;
    }
LABEL_11:
    captureDate = v25->_captureDate;
    v25->_captureDate = (NSDate *)v33;

    v39 = v25;
    v21 = v41;
  }

  return v25;
}

uint64_t __202__CAMVideoCaptureResult_initWithURL_filteredLocalDestinationURL_duration_stillDisplayTime_dimensions_metadata_videoZoomFactor_reason_videoPreviewPixelBuffer_coordinationInfo_error_slowWriterFrameDrops___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "keySpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C8A9D0]))
  {
    objc_msgSend(v2, "key");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0C8A890]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)stoppedUnexpectedly
{
  return -[CAMVideoCaptureResult reason](self, "reason") != 0;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_videoPreviewPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CAMVideoCaptureResult;
  -[CAMVideoCaptureResult dealloc](&v3, sel_dealloc);
}

- (NSURL)localDestinationURL
{
  return self->_localDestinationURL;
}

- (NSURL)filteredLocalDestinationURL
{
  return self->_filteredLocalDestinationURL;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_dimensions;
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (double)videoZoomFactor
{
  return self->_videoZoomFactor;
}

- (int64_t)reason
{
  return self->_reason;
}

- (BOOL)slowWriterFrameDrops
{
  return self->_slowWriterFrameDrops;
}

- (__CVBuffer)videoPreviewPixelBuffer
{
  return self->_videoPreviewPixelBuffer;
}

- (NSDate)captureDate
{
  return self->_captureDate;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_coordinationInfo, 0);
  objc_storeStrong((id *)&self->_captureDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_filteredLocalDestinationURL, 0);
  objc_storeStrong((id *)&self->_localDestinationURL, 0);
}

@end
