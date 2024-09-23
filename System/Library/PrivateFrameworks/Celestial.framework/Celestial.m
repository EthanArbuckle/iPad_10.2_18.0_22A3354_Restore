uint64_t ProgressCallback(uint64_t result, float a2)
{
  if (a2 >= 1.0 || vabds_f32(*(float *)(result + 8), a2) >= 0.01)
  {
    *(float *)(result + 8) = fminf(a2, 1.0);
    result = *(_QWORD *)(result + 16);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t vt_Copy_yuvs_420v_avg_rotate_arm(const char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int8x16_t *v11;
  int8x16_t *v12;
  int8x16_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  int8x16x2_t v21;
  int8x16x2_t v22;

  v6 = a2[1];
  v7 = *a2;
  if ((a3 & 0x1F) != 0)
    return 1;
  v8 = a6[1];
  v9 = *a6;
  if ((a5 & 0x1F) != 0 || (v9 & 0x1F) != 0 || (v8 & 0x1F) != 0)
    return 1;
  v10 = &a1[a5];
  v11 = (int8x16_t *)(v7 + v9 * a4 - v9 + a3 - 16);
  v12 = (int8x16_t *)((char *)v11 - v9);
  v13 = (int8x16_t *)(v6 + v8 * (a4 >> 1) - v8 + a3 - 16);
  v14 = a5 - 2 * a3;
  v15 = a3 - v9;
  v16 = a3 - v8;
  v17 = a3 >> 4;
  do
  {
    do
    {
      v21 = vld2q_s8(a1);
      a1 += 32;
      v22 = vld2q_s8(v10);
      v10 += 32;
      v21.val[0] = vrev64q_s8(v21.val[0]);
      v22.val[0] = vrev64q_s8(v22.val[0]);
      *v11-- = vextq_s8(v21.val[0], v21.val[0], 8uLL);
      *v12-- = vextq_s8(v22.val[0], v22.val[0], 8uLL);
      v21.val[1] = (int8x16_t)vrev64q_s16((int16x8_t)vhaddq_u8((uint8x16_t)v21.val[1], (uint8x16_t)v22.val[1]));
      *v13-- = vextq_s8(v21.val[1], v21.val[1], 8uLL);
      --v17;
    }
    while (v17);
    v18 = v10 - a1;
    a1 = &v10[v14];
    v10 += v14 + v18;
    v19 = (char *)v11 - (char *)v12;
    v11 = (int8x16_t *)((char *)v12 + v15);
    v12 = (int8x16_t *)((char *)v12 + v15 - v19);
    v13 = (int8x16_t *)((char *)v13 + v16);
    v17 = a3 >> 4;
    a4 -= 2;
  }
  while (a4);
  return 0;
}

uint64_t CMPhotoCascadingDownscale()
{
  return MEMORY[0x1E0D08B60]();
}

uint64_t CMPhotoCascadingDownscaleCreate()
{
  return MEMORY[0x1E0D08B68]();
}

uint64_t CMPhotoCascadingDownscaleDestroy()
{
  return MEMORY[0x1E0D08B70]();
}

uint64_t FigCreateModelSpecificPropertyList()
{
  return MEMORY[0x1E0CA0280]();
}

uint64_t FigPhotoJPEGAddMPDataToJPEG()
{
  return MEMORY[0x1E0CC2C70]();
}

uint64_t FigPhotoJPEGCalculateOutputDimensions()
{
  return MEMORY[0x1E0CC2C78]();
}

uint64_t FigPhotoJPEGCopyMPDataFromJPEG()
{
  return MEMORY[0x1E0CC2C80]();
}

uint64_t FigPhotoJPEGCreateCGImageFromIOSurface()
{
  return MEMORY[0x1E0CC2C88]();
}

uint64_t FigPhotoJPEGCreateCGImageFromJPEG()
{
  return MEMORY[0x1E0CC2C90]();
}

uint64_t FigPhotoJPEGCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x1E0CC2C98]();
}

uint64_t FigPhotoJPEGCreateJPEGFromCVPixelBuffer()
{
  return MEMORY[0x1E0CC2CA0]();
}

uint64_t FigPhotoJPEGCreateJPEGFromIOSurface()
{
  return MEMORY[0x1E0CC2CA8]();
}

uint64_t FigPhotoJPEGCreateJPEGFromSbuf()
{
  return MEMORY[0x1E0CC2CB0]();
}

uint64_t FigPhotoJPEGCreateJPEGNativePixelFormatArray()
{
  return MEMORY[0x1E0CC2CB8]();
}

uint64_t FigPhotoJPEGCreateJPEGNativeSubsamplingArray()
{
  return MEMORY[0x1E0CC2CC0]();
}

uint64_t FigPhotoJPEGCreateJPEGOutputIOSurface()
{
  return MEMORY[0x1E0CC2CC8]();
}

uint64_t FigPhotoJPEGCreateNativeDecodePixelFormatArray()
{
  return MEMORY[0x1E0CC2CD0]();
}

uint64_t FigPhotoJPEGDecodeJPEGIntoSurface()
{
  return MEMORY[0x1E0CC2CD8]();
}

uint64_t FigPhotoJPEGDecodeSessionCancelRequest()
{
  return MEMORY[0x1E0CC2CE0]();
}

uint64_t FigPhotoJPEGDecodeSessionCopyPoolDebugInfo()
{
  return MEMORY[0x1E0CC2CE8]();
}

uint64_t FigPhotoJPEGDecodeSessionCreate()
{
  return MEMORY[0x1E0CC2CF0]();
}

uint64_t FigPhotoJPEGDecodeSessionCreateCGImageFromData()
{
  return MEMORY[0x1E0CC2CF8]();
}

uint64_t FigPhotoJPEGDecodeSessionCreateCVPixelBufferFromData()
{
  return MEMORY[0x1E0CC2D00]();
}

uint64_t FigPhotoJPEGDecodeSessionDecodeDataToCGImageAsynchronously()
{
  return MEMORY[0x1E0CC2D08]();
}

uint64_t FigPhotoJPEGDecodeSessionDecodeDataToCVPixelBufferAsynchronously()
{
  return MEMORY[0x1E0CC2D10]();
}

uint64_t FigPhotoJPEGDecodeSessionDiscardCachedBuffers()
{
  return MEMORY[0x1E0CC2D18]();
}

uint64_t FigPhotoJPEGDecodeSessionGetTypeID()
{
  return MEMORY[0x1E0CC2D20]();
}

uint64_t FigPhotoJPEGDecodeSessionLogCGImageBackingConversion()
{
  return MEMORY[0x1E0CC2D28]();
}

uint64_t FigPhotoJPEGGetDecodeTiming()
{
  return MEMORY[0x1E0CC2D30]();
}

uint64_t FigPhotoJPEGGetEncodeTiming()
{
  return MEMORY[0x1E0CC2D38]();
}

uint64_t FigPhotoJPEGGetMPDataCountFromJPEG()
{
  return MEMORY[0x1E0CC2D40]();
}

uint64_t FigPhotoJPEGGetMaximumHardwareOutputDimensions()
{
  return MEMORY[0x1E0CC2D48]();
}

uint64_t FigPhotoJPEGPreload()
{
  return MEMORY[0x1E0CC2D50]();
}

uint64_t FigPhotoJPEGShouldUseHardwareDecode()
{
  return MEMORY[0x1E0CC2D58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t ObtainCFDataSinfsFromMedia()
{
  return MEMORY[0x1E0CC3260]();
}

uint64_t ObtainSinfInfoFromMedia()
{
  return MEMORY[0x1E0CC3268]();
}

uint64_t PostProcessGetRentalInfo()
{
  return MEMORY[0x1E0CC32B0]();
}

uint64_t PostProcessPurchasedItem()
{
  return MEMORY[0x1E0CC32B8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

