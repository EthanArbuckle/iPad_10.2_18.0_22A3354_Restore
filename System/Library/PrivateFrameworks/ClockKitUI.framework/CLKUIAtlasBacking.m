@implementation CLKUIAtlasBacking

+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4
{
  return (id)objc_msgSend(a1, "atlasBackingWithImage:uuid:mipmap:", a3, a4, 0);
}

+ (id)atlasBackingWithImage:(id)a3 uuid:(id)a4 mipmap:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  id v9;
  CGImage *v10;
  unsigned int Width;
  int Height;
  unsigned int v13;
  CLKUIAtlasBacking *v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  signed int v25;
  int v26;
  BOOL v27;
  BOOL v28;
  int v29;
  unint64_t v30;
  unsigned int v31;
  int v32;
  CGColorSpace *v33;
  id v34;
  void *v35;
  CGContext *v36;
  CLKUIAtlasBacking *v37;
  unsigned int v39;
  _BOOL4 v40;
  CGAffineTransform transform;
  CGRect v42;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_retainAutorelease(v7);
    v10 = (CGImage *)objc_msgSend(v9, "CGImage");
    Width = CGImageGetWidth(v10);
    Height = CGImageGetHeight(v10);
    v13 = Height;
    v14 = 0;
    v15 = Width - 8193 < 0xFFFFE000 || Height < 1;
    if (!v15 && Height <= 0x2000)
    {
      v16 = 1.0;
      v17 = 0.0;
      v18 = 0.0;
      v19 = 0.0;
      v20 = 1.0;
      v21 = 0.0;
      switch(objc_msgSend(v9, "imageOrientation"))
      {
        case 0:
          break;
        case 1:
          v18 = (double)Width;
          v19 = (double)v13;
          v20 = -1.0;
          goto LABEL_15;
        case 2:
          v18 = (double)v13;
          v21 = 1.0;
          v17 = -1.0;
          goto LABEL_13;
        case 3:
          v19 = (double)Width;
          v21 = -1.0;
          v17 = 1.0;
LABEL_13:
          v20 = 0.0;
          goto LABEL_19;
        case 4:
          v18 = (double)Width;
LABEL_15:
          v16 = -1.0;
          break;
        case 5:
          v19 = (double)v13;
          v20 = -1.0;
          break;
        case 6:
          v18 = (double)v13;
          v19 = (double)Width;
          v17 = -1.0;
          v20 = 0.0;
          v21 = -1.0;
          goto LABEL_19;
        case 7:
          v17 = 1.0;
          v20 = 0.0;
          v21 = 1.0;
LABEL_19:
          v16 = 0.0;
          break;
        default:
          v16 = *MEMORY[0x1E0C9BAA8];
          v21 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
          v17 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
          v20 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
          v18 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
          v19 = *(double *)(MEMORY[0x1E0C9BAA8] + 40);
          break;
      }
      v22 = (double)(int)Width;
      v23 = (double)(int)v13;
      v24 = v20 * (double)(int)v13 + v21 * (double)(int)Width;
      v25 = vcvtad_u64_f64(fabs(v17 * (double)(int)v13 + v16 * (double)(int)Width));
      v26 = vcvtad_u64_f64(fabs(v24));
      v40 = v5;
      if (v5)
      {
        v27 = v26 < 1 || v25 < 1;
        if (v27 || (v26 == 1 ? (v28 = v25 == 1) : (v28 = 0), v28))
        {
          v30 = __PAIR64__(v26, v25);
        }
        else
        {
          if (v25 <= v26)
            v29 = v26;
          else
            v29 = v25;
          v30 = (unint64_t)vdup_n_s32(1 << -(char)__clz(v29 - 1));
        }
        v25 = v30;
        v26 = HIDWORD(v30);
        v39 = 4 * HIDWORD(v30) * v30;
        v31 = 0;
        if ((int)v30 >= 1)
        {
          v32 = 1;
          do
          {
            v31 += 4 * v32 * v32;
            v32 *= 2;
          }
          while (v32 <= (int)v30);
        }
      }
      else
      {
        v31 = 4 * v26 * v25;
        v39 = v31;
      }
      v33 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
      v34 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v31));
      v35 = (void *)objc_msgSend(v34, "mutableBytes");
      v36 = CGBitmapContextCreate(v35, v25, v26, 8uLL, 4 * v25, v33, 0x4001u);
      CGColorSpaceRelease(v33);
      CGContextTranslateCTM(v36, 0.0, (double)v26);
      CGContextScaleCTM(v36, 1.0, -1.0);
      transform.a = v16;
      transform.b = v21;
      transform.c = v17;
      transform.d = v20;
      transform.tx = v18;
      transform.ty = v19;
      CGContextConcatCTM(v36, &transform);
      v42.origin.x = 0.0;
      v42.origin.y = 0.0;
      v42.size.width = v22;
      v42.size.height = v23;
      CGContextDrawImage(v36, v42, v10);
      CGContextRelease(v36);
      if (v40)
        _CLKUIRawImageGenerateMipmapsSRGB8((uint64_t)v35, v25);
      v37 = [CLKUIAtlasBacking alloc];
      *(_QWORD *)&transform.a = v35;
      *(_QWORD *)&transform.b = __PAIR64__(v25, v31);
      *(_QWORD *)&transform.c = v26 | 0x100000000;
      LODWORD(transform.d) = v39;
      *(_QWORD *)((char *)&transform.d + 4) = 4;
      WORD2(transform.tx) = 2;
      BYTE6(transform.tx) = 0;
      HIBYTE(transform.tx) = v40;
      v14 = -[CLKUIAtlasBacking initWithUuid:structure:data:](v37, "initWithUuid:structure:data:", v8, &transform, v34);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)atlasBackingWithArt:(id)a3 uuid:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = a4;
  if (a3)
  {
    +[CLKUIMmapFile mmapFileWithPath:](CLKUIMmapFile, "mmapFileWithPath:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_retainAutorelease(v6);
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:](CLKUIAtlasBacking, "atlasBackingWithBytes:length:mmapFile:uuid:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)atlasBackingWithBytes:(const void *)a3 length:(unint64_t)a4 mmapFile:(id)a5 uuid:(id)a6
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  int v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  CLKUIAtlasBacking *v28;
  int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  unsigned int v34;
  void *v35;
  compression_status v36;
  int v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  id v41;
  CLKUIAtlasBacking *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  uint64_t v47;
  id v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  id v53;
  compression_stream stream;
  _BYTE v55[12];
  unint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  char v61;
  char v62;
  char v63;
  char v64;
  _BYTE buf[12];
  unint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  char v71;
  char v72;
  char v73;
  BOOL v74;
  uint64_t v75;

  MEMORY[0x1E0C80A78](a1, a2, a3, a4, a5, a6);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v75 = *MEMORY[0x1E0C80C00];
  v13 = v12;
  v53 = v7;
  if (v9 <= 7)
  {
    CLKLoggingObjectForDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.10();

  }
  v15 = *v11;
  v52 = v11[1];
  v16 = *((unsigned __int16 *)v11 + 1);
  v17 = *((unsigned __int16 *)v11 + 2);
  v18 = *((unsigned __int16 *)v11 + 3);
  v19 = (v17 - 8193) < 0xFFFFE000;
  if ((v17 - 8193) <= 0xFFFFDFFF)
  {
    CLKLoggingObjectForDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.9();

  }
  if ((v18 - 8193) <= 0xFFFFDFFF)
  {
    CLKLoggingObjectForDomain();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.8();

    v19 = 1;
  }
  v22 = v16 & 7;
  if (v22 != 1 && v22 != 6)
  {
    CLKLoggingObjectForDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.7();

    v19 = 1;
  }
  if (v15 >= 0x43)
  {
    CLKLoggingObjectForDomain();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.6();

    v19 = 1;
  }
  if (v16 >> 14 == 3)
  {
    CLKLoggingObjectForDomain();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.2();

    if (v52 < 4)
      goto LABEL_33;
    goto LABEL_30;
  }
  if (v52 > 3)
  {
LABEL_30:
    CLKLoggingObjectForDomain();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.1(v52, (uint64_t)v53, v27);
LABEL_32:

LABEL_33:
    v28 = 0;
    goto LABEL_34;
  }
  if (v19)
    goto LABEL_33;
  v48 = v13;
  v49 = (v16 >> 3) & 1;
  v51 = s_artFormatsBpp[v15];
  v30 = _CLKUIDeterminePlaneLength(v15, v17, v18, v51);
  v50 = v30;
  if (v17 && v49 && v18 && (v17 != 1 || v18 != 1))
  {
    v31 = v18;
    v32 = v17;
    do
    {
      if (v32 <= 1)
        v32 = 1;
      else
        v32 >>= 1;
      if (v31 <= 1)
        v31 = 1;
      else
        v31 >>= 1;
      v30 += _CLKUIDeterminePlaneLength(v15, v32, v31, v51);
    }
    while (v31 != 1 || v32 != 1);
  }
  v33 = v30 * v22;
  v34 = (v16 >> 4) & 3;
  if (!v34)
  {
    v13 = v48;
    if (v33 == (_DWORD)v9 - 8)
    {
      *(_QWORD *)buf = v11 + 8;
      *(_DWORD *)&buf[8] = v33;
      v66 = __PAIR64__(v18, v17);
      v67 = v16 & 7;
      v68 = v50;
      v69 = v51;
      v70 = (v16 >> 8) & 0x3F;
      v71 = v15;
      v72 = v52;
      v73 = v16 >> 14;
      v74 = (v16 & 8) != 0;
      v28 = -[CLKUIAtlasBacking initWithUuid:structure:mmapFile:]([CLKUIAtlasBacking alloc], "initWithUuid:structure:mmapFile:", v53, buf, v48);
      goto LABEL_34;
    }
    CLKLoggingObjectForDomain();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v53;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v33;
      HIWORD(v66) = 1024;
      v67 = v9 - 8;
      _os_log_error_impl(&dword_1CB9A4000, v43, OS_LOG_TYPE_ERROR, "%@: Unexpected length %d != %d", buf, 0x18u);
    }

    goto LABEL_33;
  }
  v47 = (v30 * v22);
  memset(&stream, 0, sizeof(stream));
  v13 = v48;
  if (compression_stream_init(&stream, COMPRESSION_STREAM_DECODE, atlasBackingWithBytes_length_mmapFile_uuid__algorithms[v34]) == COMPRESSION_STATUS_ERROR)
  {
    CLKLoggingObjectForDomain();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.3();
    goto LABEL_32;
  }
  v46 = (v16 >> 8) & 0x3F;
  stream.src_ptr = v11 + 8;
  stream.src_size = (v9 - 8);
  stream.dst_ptr = buf;
  stream.dst_size = 4096;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v47);
  while (1)
  {
    v36 = compression_stream_process(&stream, 0);
    if (v36)
      break;
    if (stream.dst_size)
    {
      CLKLoggingObjectForDomain();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_75;
      goto LABEL_76;
    }
    objc_msgSend(v35, "appendBytes:length:", buf, 4096);
    stream.dst_ptr = buf;
    stream.dst_size = 4096;
  }
  if (v36 == COMPRESSION_STATUS_ERROR)
  {
    CLKLoggingObjectForDomain();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
LABEL_75:
      +[CLKUIAtlasBacking atlasBackingWithBytes:length:mmapFile:uuid:].cold.3();
LABEL_76:

    goto LABEL_77;
  }
  if (v36 == COMPRESSION_STATUS_END && stream.dst_ptr > buf)
    objc_msgSend(v35, "appendBytes:length:", buf, stream.dst_ptr - buf);
  compression_stream_destroy(&stream);
  v37 = objc_msgSend(v35, "length");
  if ((_DWORD)v47 == v37)
  {
    v38 = v16 >> 14;
    v39 = objc_retainAutorelease(v35);
    v40 = objc_msgSend(v39, "mutableBytes");
    v41 = v39;
    v42 = [CLKUIAtlasBacking alloc];
    *(_QWORD *)v55 = v40;
    *(_DWORD *)&v55[8] = v47;
    v56 = __PAIR64__(v18, v17);
    v57 = v22;
    v58 = v50;
    v59 = v51;
    v60 = v46;
    v61 = v15;
    v62 = v52;
    v63 = v38;
    v64 = v49;
    v28 = -[CLKUIAtlasBacking initWithUuid:structure:data:](v42, "initWithUuid:structure:data:", v53, v55, v41);

    goto LABEL_78;
  }
  CLKLoggingObjectForDomain();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v55 = 138412802;
    *(_QWORD *)&v55[4] = v53;
    LOWORD(v56) = 1024;
    *(_DWORD *)((char *)&v56 + 2) = v47;
    HIWORD(v56) = 1024;
    v57 = v37;
    _os_log_error_impl(&dword_1CB9A4000, v45, OS_LOG_TYPE_ERROR, "%@: Unexpected length %d != %d", v55, 0x18u);
  }

LABEL_77:
  v28 = 0;
LABEL_78:

LABEL_34:
  return v28;
}

+ (id)atlasBackingWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5
{
  id v7;
  id v8;
  unsigned int v9;
  BOOL v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int planes;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int bytesPerPixel;
  NSObject *v23;
  __int128 v24;
  id v25;
  CLKUIAtlasBacking *v26;
  NSObject *v27;
  unsigned int width;
  unsigned int height;
  unsigned int planeLength;
  unsigned int v32;
  _OWORD v33[2];
  uint64_t v34;
  _BYTE buf[32];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4->width - 8193;
  v10 = v9 < 0xFFFFE000;
  if (v9 <= 0xFFFFDFFF)
  {
    CLKLoggingObjectForDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.8();

  }
  if (a4->height - 8193 <= 0xFFFFDFFF)
  {
    CLKLoggingObjectForDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.7();

    v10 = 1;
  }
  planes = a4->planes;
  if (planes != 1 && planes != 6)
  {
    CLKLoggingObjectForDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.6();

    v10 = 1;
  }
  if (a4->format >= 0x43u)
  {
    CLKLoggingObjectForDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.5();

    v10 = 1;
  }
  if (a4->wrap >= 3u)
  {
    CLKLoggingObjectForDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.4();

    v10 = 1;
  }
  if (a4->filter >= 4u)
  {
    CLKLoggingObjectForDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.1();

    v10 = 1;
  }
  if (v8)
  {
    v18 = objc_retainAutorelease(v8);
    v19 = (char *)objc_msgSend(v18, "bytes");
    v20 = objc_msgSend(v18, "length");
    if (a4->bytes < v19 || (char *)a4->bytes + a4->bytesLength > &v19[v20])
    {
      CLKLoggingObjectForDomain();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.2();

      v10 = 1;
    }
  }
  bytesPerPixel = a4->bytesPerPixel;
  if (bytesPerPixel != s_artFormatsBpp[a4->format])
  {
    CLKLoggingObjectForDomain();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[CLKUIAtlasBacking atlasBackingWithUuid:structure:data:].cold.1();

    bytesPerPixel = a4->bytesPerPixel;
    v10 = 1;
  }
  if (bytesPerPixel && a4->planeLength != a4->width * bytesPerPixel * a4->height)
  {
    CLKLoggingObjectForDomain();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      width = a4->width;
      height = a4->height;
      planeLength = a4->planeLength;
      v32 = a4->bytesPerPixel;
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = planeLength;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = width;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = height;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v36) = v32;
      _os_log_error_impl(&dword_1CB9A4000, v27, OS_LOG_TYPE_ERROR, "%@: Invalid art plane length (%d) [width = %d, height = %d, bytesPerPixel = %d]", buf, 0x24u);
    }

    goto LABEL_43;
  }
  if (v10)
  {
LABEL_43:
    v26 = 0;
    goto LABEL_44;
  }
  v24 = *(_OWORD *)&a4->height;
  *(_OWORD *)buf = *(_OWORD *)&a4->bytes;
  *(_OWORD *)&buf[16] = v24;
  v36 = *(_QWORD *)&a4->mipCount;
  v25 = v8;
  v33[0] = *(_OWORD *)buf;
  v33[1] = *(_OWORD *)&buf[16];
  v34 = v36;
  v26 = -[CLKUIAtlasBacking initWithUuid:structure:data:]([CLKUIAtlasBacking alloc], "initWithUuid:structure:data:", v7, v33, v25);

LABEL_44:
  return v26;
}

- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 data:(id)a5
{
  id v9;
  id v10;
  CLKUIAtlasBacking *v11;
  CLKUIAtlasBacking *v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAtlasBacking;
  v11 = -[CLKUIAtlasBacking init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v13 = *(_OWORD *)&a4->bytes;
    v14 = *(_OWORD *)&a4->height;
    *(_QWORD *)&v12->_structure.mipCount = *(_QWORD *)&a4->mipCount;
    *(_OWORD *)&v12->_structure.bytes = v13;
    *(_OWORD *)&v12->_structure.height = v14;
    objc_storeStrong((id *)&v12->_data, a5);
  }

  return v12;
}

- (CLKUIAtlasBacking)initWithUuid:(id)a3 structure:(CLKUIAtlasBackingStructure *)a4 mmapFile:(id)a5
{
  id v9;
  id v10;
  CLKUIAtlasBacking *v11;
  CLKUIAtlasBacking *v12;
  __int128 v13;
  __int128 v14;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKUIAtlasBacking;
  v11 = -[CLKUIAtlasBacking init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v13 = *(_OWORD *)&a4->bytes;
    v14 = *(_OWORD *)&a4->height;
    *(_QWORD *)&v12->_structure.mipCount = *(_QWORD *)&a4->mipCount;
    *(_OWORD *)&v12->_structure.bytes = v13;
    *(_OWORD *)&v12->_structure.height = v14;
    objc_storeStrong((id *)&v12->_mmapFile, a5);
  }

  return v12;
}

- (BOOL)writeToFile:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  __int16 v10;
  CLKUIAtlasBacking *v11;
  char v12;

  v6 = (objc_class *)MEMORY[0x1E0C99DF0];
  v7 = a3;
  v8 = objc_retainAutorelease((id)objc_msgSend([v6 alloc], "initWithLength:", -[CLKUIAtlasBacking bytesLength](self, "bytesLength") + 8));
  v9 = objc_msgSend(v8, "mutableBytes");
  *(_BYTE *)v9 = -[CLKUIAtlasBacking format](self, "format");
  *(_BYTE *)(v9 + 1) = -[CLKUIAtlasBacking filter](self, "filter");
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0xFFF8 | -[CLKUIAtlasBacking planes](self, "planes") & 7;
  if (-[CLKUIAtlasBacking mipmaps](self, "mipmaps"))
    v10 = 8;
  else
    v10 = 0;
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0xFF07 | v10;
  *(_WORD *)(v9 + 2) = ((-[CLKUIAtlasBacking mipCount](self, "mipCount") & 0x3F) << 8) | *(_WORD *)(v9 + 2) & 0xC0FF;
  *(_WORD *)(v9 + 2) = *(_WORD *)(v9 + 2) & 0x3FFF | (-[CLKUIAtlasBacking wrap](self, "wrap") << 14);
  *(_WORD *)(v9 + 4) = -[CLKUIAtlasBacking width](self, "width");
  *(_WORD *)(v9 + 6) = -[CLKUIAtlasBacking height](self, "height");
  v11 = objc_retainAutorelease(self);
  memcpy((void *)(v9 + 8), -[CLKUIAtlasBacking bytes](v11, "bytes"), -[CLKUIAtlasBacking bytesLength](v11, "bytesLength"));
  v12 = objc_msgSend(v8, "writeToFile:options:error:", v7, 1, a4);

  return v12;
}

- (const)bytes
{
  return self->_structure.bytes;
}

- (unint64_t)bytesLength
{
  return self->_structure.bytesLength;
}

- (unint64_t)width
{
  return self->_structure.width;
}

- (unint64_t)height
{
  return self->_structure.height;
}

- (unint64_t)planes
{
  return self->_structure.planes;
}

- (unint64_t)planeLength
{
  return self->_structure.planeLength;
}

- (unint64_t)bytesPerPixel
{
  return self->_structure.bytesPerPixel;
}

- (unint64_t)mipCount
{
  return self->_structure.mipCount;
}

- (unsigned)format
{
  return self->_structure.format;
}

- (unsigned)filter
{
  return self->_structure.filter;
}

- (unsigned)wrap
{
  return self->_structure.wrap;
}

- (BOOL)mipmaps
{
  return self->_structure.mipmaps;
}

- (void)setWrap:(unsigned __int8)a3
{
  self->_structure.wrap = a3;
}

- (void)setFilter:(unsigned __int8)a3
{
  self->_structure.filter = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (CLKUIAtlasBackingStructure)structure
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].bytesLength;
  *(_OWORD *)&retstr->bytes = *(_OWORD *)&self->mipCount;
  *(_OWORD *)&retstr->height = v3;
  *(_QWORD *)&retstr->mipCount = *(_QWORD *)&self[1].planeLength;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_mmapFile, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

+ (void)atlasBackingWithBytes:(NSObject *)a3 length:mmapFile:uuid:.cold.1(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a2;
  WORD6(v3) = 1024;
  HIWORD(v3) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, a2, a3, "%@: Invalid art header filter %d", v3, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.2()
{
  os_log_t v0;
  uint8_t v1[14];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = 3;
  _os_log_error_impl(&dword_1CB9A4000, v0, OS_LOG_TYPE_ERROR, "%@: Invalid art header wrap %d", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1CB9A4000, v0, v1, "%@: Compression error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art header format %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art header planes %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art header height %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art header width %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithBytes:length:mmapFile:uuid:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid length %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure filter %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure bytes/bytesLength", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure wrap %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure format %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure planes %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure height %d");
  OUTLINED_FUNCTION_2();
}

+ (void)atlasBackingWithUuid:structure:data:.cold.8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1CB9A4000, v0, v1, "%@: Invalid art structure width %d");
  OUTLINED_FUNCTION_2();
}

@end
