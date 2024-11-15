@implementation ADNormals

+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6 withHelperBuffer:(id)a7
{
  double y;
  double x;
  _QWORD *v11;
  int64_t v12;
  size_t Width;
  size_t Height;
  size_t v15;
  size_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  _BYTE *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  unint64_t v26;
  char *v27;
  char *v28;
  size_t v29;
  char *v30;
  __int128 v31;
  char *v32;
  size_t BytesPerRow;
  size_t v34;
  float *BaseAddress;
  char *v36;
  size_t DataSize;
  __int128 v38;
  unint64_t v39;
  uint64_t v40;
  float32x2_t v41;
  unint64_t v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  size_t v57;
  uint64_t v58;
  float32x4_t *v59;
  float32x4_t *v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t *v65;
  float32x4_t v66;
  float32x4_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  float32x4_t v72;
  char *v73;
  unint64_t v75;
  char *v76;
  int32x2_t v77;

  y = a5.y;
  x = a5.x;
  v77 = *(int32x2_t *)&a4;
  v11 = a7;
  v12 = -22953;
  if (a3 && a6)
  {
    if (CVPixelBufferGetPixelFormatType(a6) != 1380410945)
    {
      v12 = -22956;
      goto LABEL_46;
    }
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v15 = CVPixelBufferGetWidth(a6);
    v16 = CVPixelBufferGetHeight(a6);
    if (Width == v15 && Height == v16)
    {
      if (v11)
      {
        v17 = (uint64_t)(v11 + 1);
        v18 = (char *)v11[1];
      }
      else
      {
        v17 = operator new();
        v18 = 0;
        *(_QWORD *)v17 = 0;
        *(_QWORD *)(v17 + 8) = 0;
        *(_QWORD *)(v17 + 16) = 0;
      }
      v19 = Height * Width;
      v20 = *(_BYTE **)(v17 + 8);
      v21 = (v20 - v18) >> 4;
      v22 = Height * Width - v21;
      if (Height * Width <= v21)
      {
        if (Height * Width >= v21)
          goto LABEL_27;
        v32 = &v18[16 * v19];
      }
      else
      {
        v23 = *(_QWORD *)(v17 + 16);
        if (v22 > (v23 - (uint64_t)v20) >> 4)
        {
          if (v19 >> 60)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v24 = v23 - (_QWORD)v18;
          if (v24 >> 3 > v19)
            v19 = v24 >> 3;
          v25 = (unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0;
          v26 = 0xFFFFFFFFFFFFFFFLL;
          if (!v25)
            v26 = v19;
          if (v26 >> 60)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v75 = v26;
          v27 = (char *)operator new(16 * v26);
          v28 = &v27[16 * v21];
          v29 = 16 * v22;
          v76 = &v27[16 * v75];
          bzero(v28, v29);
          v30 = &v28[v29];
          if (v20 != v18)
          {
            do
            {
              v31 = *((_OWORD *)v20 - 1);
              v20 -= 16;
              *((_OWORD *)v28 - 1) = v31;
              v28 -= 16;
            }
            while (v20 != v18);
            v18 = *(char **)v17;
          }
          *(_QWORD *)v17 = v28;
          *(_QWORD *)(v17 + 8) = v30;
          *(_QWORD *)(v17 + 16) = v76;
          if (v18)
            operator delete(v18);
LABEL_27:
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a6, 0);
          BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
          v34 = CVPixelBufferGetBytesPerRow(a6);
          BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
          v36 = (char *)CVPixelBufferGetBaseAddress(a6);
          DataSize = CVPixelBufferGetDataSize(a6);
          bzero(v36, DataSize);
          if (Height)
          {
            if (Width)
            {
              v39 = 0;
              LODWORD(v40) = 0;
              v41 = (float32x2_t)vdup_lane_s32(v77, 0);
              do
              {
                v42 = 0;
                v40 = (int)v40;
                do
                {
                  *(float *)&v38 = (double)v42 - x;
                  v43 = (double)v39 - y;
                  *((float *)&v38 + 1) = v43;
                  *(float32x2_t *)&v38 = vdiv_f32(vmul_n_f32(*(float32x2_t *)&v38, BaseAddress[v42]), v41);
                  *((float *)&v38 + 2) = BaseAddress[v42];
                  *(_OWORD *)(*(_QWORD *)v17 + 16 * v40) = v38;
                  ++v42;
                  ++v40;
                }
                while (Width != v42);
                ++v39;
                BaseAddress += BytesPerRow >> 2;
              }
              while (v39 != Height);
            }
            v44 = Height - 1;
            if (Height - 1 < 2)
              goto LABEL_41;
          }
          else
          {
            v44 = -1;
          }
          if (Width - 1 >= 2)
          {
            v45 = 16 * (v34 >> 4);
            v46 = Width;
            v47 = Width - 2;
            v48 = 0xFFFFFFFFFFFFFFFLL * Width;
            v49 = Width - 3;
            v50 = 1;
            v51.i64[0] = 0xC0000000C0000000;
            v51.i64[1] = 0xC0000000C0000000;
            v52.i64[0] = 0x4000000040000000;
            v52.i64[1] = 0x4000000040000000;
            v53.i64[0] = 0x3E0000003E000000;
            v53.i64[1] = 0x3E0000003E000000;
            do
            {
              v54 = (int)Width + 1;
              v55 = 16 * v54 + 16;
              v56 = v49 + v54;
              v57 = v47;
              v58 = v45 + 16;
              do
              {
                v59 = (float32x4_t *)(*(_QWORD *)v17 + v55);
                v60 = &v59[v48];
                v62 = v59[v48 - 1];
                v61 = v59[v48];
                v63 = v59[-2];
                v64 = *v59;
                v65 = &v59[v46];
                v66 = v65[-2];
                v67 = v60[-2];
                v68 = (int32x4_t)vmulq_f32(vaddq_f32(vsubq_f32(vmlaq_f32(vmlaq_f32(vsubq_f32(v61, v67), v51, v63), v52, v64), v66), *v65), v53);
                v69 = (int32x4_t)vmulq_f32(vaddq_f32(*v65, vsubq_f32(vmlaq_f32(vmlaq_f32(vsubq_f32(v66, v67), v51, v62), v52, v65[-1]), v61)), v53);
                v70 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v69, v69), (int8x16_t)v69, 0xCuLL), vnegq_f32((float32x4_t)v68)), (float32x4_t)v69, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v68, v68), (int8x16_t)v68, 0xCuLL));
                v71 = (int32x4_t)vmulq_f32((float32x4_t)v70, (float32x4_t)v70);
                v71.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v71.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v71, 2), *(float32x2_t *)v71.i8)).u32[0];
                *(float32x2_t *)v66.f32 = vrsqrte_f32((float32x2_t)v71.u32[0]);
                *(float32x2_t *)v66.f32 = vmul_f32(*(float32x2_t *)v66.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v66.f32, *(float32x2_t *)v66.f32)));
                v72 = vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v70, v70), (int8x16_t)v70, 0xCuLL), vmul_f32(*(float32x2_t *)v66.f32, vrsqrts_f32((float32x2_t)v71.u32[0], vmul_f32(*(float32x2_t *)v66.f32, *(float32x2_t *)v66.f32))).f32[0]);
                v72.i32[3] = 1.0;
                *(float32x4_t *)&v36[v58] = v72;
                v58 += 16;
                v55 += 16;
                --v57;
              }
              while (v57);
              LODWORD(Width) = v56 + 2;
              ++v50;
              v36 += v45;
            }
            while (v50 != v44);
          }
LABEL_41:
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          CVPixelBufferUnlockBaseAddress(a6, 0);
          if (!v11)
          {
            v73 = *(char **)v17;
            if (*(_QWORD *)v17)
            {
              *(_QWORD *)(v17 + 8) = v73;
              operator delete(v73);
            }
            MEMORY[0x20BD36498](v17, 0x80C40D6874129);
          }
          v12 = 0;
          goto LABEL_46;
        }
        bzero(*(void **)(v17 + 8), 16 * v22);
        v32 = &v20[16 * v22];
      }
      *(_QWORD *)(v17 + 8) = v32;
      goto LABEL_27;
    }
  }
LABEL_46:

  return v12;
}

+ (int64_t)normalsFromDepth:(__CVBuffer *)a3 focalLength:(float)a4 principalPoint:(CGPoint)a5 normalsOutput:(__CVBuffer *)a6
{
  return +[ADNormals normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:](ADNormals, "normalsFromDepth:focalLength:principalPoint:normalsOutput:withHelperBuffer:", a3, a6, 0);
}

@end
