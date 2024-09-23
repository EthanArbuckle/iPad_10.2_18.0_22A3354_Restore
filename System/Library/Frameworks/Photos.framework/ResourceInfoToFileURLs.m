@implementation ResourceInfoToFileURLs

void ___ResourceInfoToFileURLs_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentDataURLKey");
  v2[1] = CFSTR("PHResourceLocalAvailabilityRequestOriginalAdjustmentDataURLKey");
  v3[0] = CFSTR("PHAssetExportRequestAdjustmentDataFileURLKey");
  v3[1] = CFSTR("PHAssetExportRequestOriginalAdjustmentDataFileURLKey");
  v2[2] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentSecondaryDataURLKey");
  v2[3] = CFSTR("PHResourceLocalAvailabilityRequestPhotoURLKey");
  v3[2] = CFSTR("PHAssetExportRequestAdjustmentSecondaryDataFileURLKey");
  v3[3] = CFSTR("PHAssetExportRequestPhotoFileURLKey");
  v2[4] = CFSTR("PHResourceLocalAvailabilityRequestAlternatePhotoURLKey");
  v2[5] = CFSTR("PHResourceLocalAvailabilityRequestFullSizePhotoURLKey");
  v3[4] = CFSTR("PHAssetExportRequestAlternatePhotoURLKey");
  v3[5] = CFSTR("PHAssetExportRequestFullSizePhotoURLKey");
  v2[6] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoURLKey");
  v2[7] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoURLKey");
  v3[6] = CFSTR("PHAssetExportRequestAdjustmentBaseFullSizePhotoURLKey");
  v3[7] = CFSTR("PHAssetExportRequestSpatialOvercapturePhotoURLKey");
  v2[8] = CFSTR("PHResourceLocalAvailabilityRequestVideoURLKey");
  v2[9] = CFSTR("PHResourceLocalAvailabilityRequestFullSizeVideoURLKey");
  v3[8] = CFSTR("PHAssetExportRequestVideoFileURLKey");
  v3[9] = CFSTR("PHAssetExportRequestFullSizeVideoURLKey");
  v2[10] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBaseVideoURLKey");
  v2[11] = CFSTR("PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoURLKey");
  v3[10] = CFSTR("PHAssetExportRequestAdjustmentBaseVideoURLKey");
  v3[11] = CFSTR("PHAssetExportRequestAdjustmentBasePairedVideoURLKey");
  v2[12] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoURLKey");
  v2[13] = CFSTR("PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoURLKey");
  v3[12] = CFSTR("PHAssetExportRequestSpatialOvercapturePairedVideoURLKey");
  v3[13] = CFSTR("PHAssetExportRequestSpatialOvercaptureVideoURLKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ResourceInfoToFileURLs_fileURLKeysFromResourceInfoKeys;
  _ResourceInfoToFileURLs_fileURLKeysFromResourceInfoKeys = v0;

}

@end
