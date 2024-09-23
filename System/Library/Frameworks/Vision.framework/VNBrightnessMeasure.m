@implementation VNBrightnessMeasure

+ (BOOL)computeBrightnessScore:(float *)a3 onImage:(__CVBuffer *)a4 error:(id *)a5
{
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  __CVBuffer *v8;
  unint64_t v9;
  float v10;
  float v11;
  unsigned int v12;
  unsigned int v13;
  float v14;
  uint64_t v15;
  char *v16;
  float v17;
  float v18;
  unsigned int v19;
  char *v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  float *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  __CVBuffer *v41;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  float v44;
  int v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  CVPixelBufferLockBaseAddress(a4, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, 0);
  v41 = a4;
  v8 = a4;
  v9 = HeightOfPlane;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v8, 0);
  v10 = (float)(WidthOfPlane >> 8);
  if (WidthOfPlane < 0x100)
    v10 = 1.0;
  v48 = v10;
  v11 = (float)(v9 >> 8);
  if (v9 < 0x100)
    v11 = 1.0;
  v46 = v11;
  if ((_DWORD)v9)
  {
    v12 = 0;
    v13 = 0;
    v44 = (float)v9;
    v14 = 0.0;
    v45 = v9;
    do
    {
      v15 = (float)(v14 + 0.5);
      if (v15 >= v9)
        break;
      v47 = v14;
      if ((_DWORD)WidthOfPlane)
      {
        v16 = &BaseAddressOfPlane[BytesPerRowOfPlane * v15];
        v17 = 0.0;
        do
        {
          v18 = v17 + 0.5;
          v19 = (float)(v17 + 0.5);
          if (v19 >= WidthOfPlane)
            break;
          v20 = &v16[4 * v19];
          LOBYTE(v18) = v20[2];
          v21 = (float)LODWORD(v18) / 255.0;
          if (v21 <= 0.04045)
          {
            v22 = v21 / 12.92;
          }
          else
          {
            v21 = powf((float)(v21 + 0.055) / 1.055, 2.4);
            v22 = v21;
          }
          LOBYTE(v21) = v20[1];
          v23 = (float)LODWORD(v21) / 255.0;
          if (v23 <= 0.04045)
          {
            v24 = v23 / 12.92;
          }
          else
          {
            v23 = powf((float)(v23 + 0.055) / 1.055, 2.4);
            v24 = v23;
          }
          LOBYTE(v23) = *v20;
          v25 = (float)LODWORD(v23) / 255.0;
          if (v25 <= 0.04045)
            v26 = v25 / 12.92;
          else
            v26 = powf((float)(v25 + 0.055) / 1.055, 2.4);
          v27 = 0;
          v28 = (float *)&dword_1A15FAE90;
          do
          {
            v29 = (float)(v24 * *(v28 - 1)) + (float)(v22 * *(v28 - 2));
            v30 = *v28;
            v28 += 3;
            *(float *)((char *)&v49 + v27) = v29 + (float)(v26 * v30);
            v27 += 4;
          }
          while (v27 != 12);
          v31 = v51;
          v32 = v49 / 0.95047;
          if ((float)(v49 / 0.95047) <= 0.008856)
            v33 = (float)(v32 * 7.787) + 0.13793;
          else
            v33 = powf(v32, 0.33333);
          if (v50 <= 0.008856)
            v34 = (float)(v50 * 7.787) + 0.13793;
          else
            v34 = powf(v50, 0.33333);
          v35 = v31 / 1.0888;
          if ((float)(v31 / 1.0888) <= 0.008856)
            v36 = (float)(v35 * 7.787) + 0.13793;
          else
            v36 = powf(v35, 0.33333);
          v37 = (float)(v34 * 116.0) + -16.0;
          v38 = sqrtf((float)((float)((float)(v34 - v36) * 200.0) * (float)((float)(v34 - v36) * 200.0))+ (float)((float)((float)(v33 - v34) * 500.0) * (float)((float)(v33 - v34) * 500.0)));
          if (tanhf((float)((float)(v37 + -128.0) - v38) + 40.0) > 0.0)
            ++v13;
          if (tanhf((float)((float)((float)(255.0 - v37) + -240.0) - v38) + 10.0) > 0.0)
            ++v12;
          v17 = v48 + v17;
        }
        while (v17 < (float)WidthOfPlane);
      }
      v14 = v46 + v47;
      LODWORD(v9) = v45;
    }
    while ((float)(v46 + v47) < v44);
  }
  else
  {
    v13 = 0;
    v12 = 0;
  }
  *a3 = (float)((float)(1.0 - (float)((float)v13 / (float)(v9 * WidthOfPlane)))
              + (float)(1.0 - (float)((float)v12 / (float)(v9 * WidthOfPlane))))
      * 0.5;
  CVPixelBufferUnlockBaseAddress(v41, 1uLL);
  return 1;
}

@end
