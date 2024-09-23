@implementation _PHAssetCreationRequestValidator

- (_PHAssetCreationRequestValidator)initWithAssetCreationRequest:(id)a3
{
  id v4;
  _PHAssetCreationRequestValidator *v5;
  _PHAssetCreationRequestValidator *v6;

  v4 = a3;
  v5 = -[_PHAssetCreationRequestValidator init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_assetCreationRequest, v4);

  return v6;
}

- (BOOL)getLivePhotoVideoMetadataFromURL:(id)a3 videoComplementMetadata:(id)a4 pairingIdentifier:(id *)a5 videoDuration:(id *)a6 imageDisplayTime:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v19;
  id *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id *v28;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v29;
  BOOL v30;
  objc_super v31;
  id v32;
  id v33;
  __int128 v34;
  int64_t v35;
  __int128 v36;
  int64_t v37;
  __int128 v38;
  int64_t v39;
  __int128 v40;
  int64_t v41;

  v14 = a3;
  v15 = a4;
  -[_PHAssetCreationRequestValidator assetCreationRequest](self, "assetCreationRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pairingIdentifier");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  v40 = 0uLL;
  v41 = 0;
  if (v16)
  {
    objc_msgSend(v16, "videoDuration");
    v38 = 0uLL;
    v39 = 0;
    objc_msgSend(v16, "imageDisplayTime");
    if (!v18)
      goto LABEL_7;
  }
  else
  {
    v38 = 0uLL;
    v39 = 0;
    if (!v17)
      goto LABEL_7;
  }
  if ((BYTE12(v38) & 1) != 0 && (BYTE12(v40) & 1) != 0)
  {
    v24 = 0;
    v30 = 1;
    goto LABEL_15;
  }
LABEL_7:
  v28 = a5;
  v29 = a6;
  v19 = a7;
  v20 = a8;
  v36 = *MEMORY[0x1E0CA2E18];
  v37 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v34 = v36;
  v35 = v37;
  v32 = 0;
  v33 = 0;
  v31.receiver = self;
  v31.super_class = (Class)_PHAssetCreationRequestValidator;
  v21 = v14;
  v22 = v15;
  v30 = -[PHValidator getLivePhotoVideoMetadataFromURL:videoComplementMetadata:pairingIdentifier:videoDuration:imageDisplayTime:error:](&v31, sel_getLivePhotoVideoMetadataFromURL_videoComplementMetadata_pairingIdentifier_videoDuration_imageDisplayTime_error_, v14, v15, &v33, &v36, &v34, &v32);
  v23 = v33;
  v24 = v32;
  if (v18)
    v25 = v18;
  else
    v25 = v23;
  v26 = v25;

  if ((BYTE12(v38) & 1) == 0)
  {
    v38 = v34;
    v39 = v35;
  }
  if ((BYTE12(v40) & 1) == 0)
  {
    v40 = v36;
    v41 = v37;
  }

  v18 = v26;
  v14 = v21;
  a8 = v20;
  v15 = v22;
  a7 = v19;
  a5 = v28;
  a6 = v29;
LABEL_15:
  objc_storeStrong((id *)&self->_validatedPairingIdentifier, v18);
  *(_OWORD *)&self->_validatedVideoDuration.value = v40;
  self->_validatedVideoDuration.epoch = v41;
  *(_OWORD *)&self->_validatedImageDisplayTime.value = v38;
  self->_validatedImageDisplayTime.epoch = v39;
  if (a5)
    *a5 = objc_retainAutorelease(v18);
  if (a6)
  {
    *(_OWORD *)&a6->var0 = v40;
    a6->var3 = v41;
  }
  if (a7)
  {
    *(_OWORD *)&a7->var0 = v38;
    a7->var3 = v39;
  }
  if (a8)
    *a8 = objc_retainAutorelease(v24);

  return v30;
}

- (PHAssetCreationRequest)assetCreationRequest
{
  return (PHAssetCreationRequest *)objc_loadWeakRetained((id *)&self->_assetCreationRequest);
}

- (NSString)validatedPairingIdentifier
{
  return self->_validatedPairingIdentifier;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)validatedImageDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatedPairingIdentifier, 0);
  objc_destroyWeak((id *)&self->_assetCreationRequest);
}

@end
