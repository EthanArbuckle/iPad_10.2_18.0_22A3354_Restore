void sub_100004910(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t Metadata;
  _QWORD *TexturePlane;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  const __CFData *v12;
  _QWORD *v13;
  uint64_t v14;
  size_t v15;
  CGDataProvider *v16;
  uint64_t v17;
  size_t v18;
  size_t v19;
  CGColorSpace *DeviceRGB;
  CGColorSpace *v21;
  CGBitmapInfo v22;
  CGImage *v23;
  UIImage *v24;
  NSData *v25;
  void *v26;
  __int128 v27;
  id v28;

  v28 = a2;
  v3 = objc_retainAutorelease(a1);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");

  Metadata = GTHarvesterGetMetadata(v4, v5);
  if (GTHarvesterGetTexturePlaneCount() == 1)
  {
    TexturePlane = (_QWORD *)GTHarvesterGetTexturePlane(Metadata, 0);
    v8 = *TexturePlane - 30;
    v9 = v8 > 0x3E;
    v10 = (1 << v8) & 0x5000000840800001;
    if (v9 || v10 == 0)
    {
      v13 = TexturePlane;
      v12 = (const __CFData *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", GTHarvesterGetData(v4, v5), TexturePlane[5], 0);
      v14 = *v13;
      v27 = *(_OWORD *)(v13 + 1);
      v15 = v13[4];
      v16 = CGDataProviderCreateWithCFData(v12);
      v17 = 5;
      v18 = 4;
      switch(v14)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 21:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 56:
        case 57:
        case 58:
        case 59:
        case 61:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 106:
        case 107:
        case 108:
        case 109:
        case 111:
        case 116:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 122:
          goto LABEL_10;
        case 20:
        case 22:
        case 23:
        case 24:
        case 25:
        case 60:
        case 62:
        case 63:
        case 64:
        case 65:
        case 110:
        case 112:
        case 113:
        case 114:
        case 115:
          v17 = 16;
          goto LABEL_15;
        case 40:
        case 41:
        case 43:
          goto LABEL_15;
        case 42:
LABEL_18:
          v19 = 16;
          goto LABEL_24;
        case 53:
        case 54:
        case 55:
        case 103:
        case 104:
        case 105:
        case 123:
        case 124:
        case 125:
          goto LABEL_14;
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
          v17 = 10;
          goto LABEL_15;
        default:
          if (v14 == 252)
LABEL_14:
            v17 = 32;
          else
LABEL_10:
            v17 = 8;
LABEL_15:
          v18 = v17;
          v19 = 8;
          if (v14 > 251)
          {
            if ((unint64_t)(v14 - 552) < 2)
            {
LABEL_22:
              v19 = 64;
            }
            else if (v14 != 253)
            {
LABEL_17:
              v19 = 32;
            }
          }
          else
          {
            switch(v14)
            {
              case 1:
              case 10:
              case 11:
              case 12:
              case 13:
              case 14:
                break;
              case 20:
              case 22:
              case 23:
              case 24:
              case 25:
              case 30:
              case 31:
              case 32:
              case 33:
              case 34:
              case 40:
              case 41:
              case 42:
              case 43:
                goto LABEL_18;
              case 103:
              case 104:
              case 105:
              case 110:
              case 112:
              case 113:
              case 114:
              case 115:
                goto LABEL_22;
              case 123:
              case 124:
              case 125:
                v19 = 128;
                break;
              default:
                goto LABEL_17;
            }
          }
LABEL_24:
          if ((unint64_t)(v14 - 10) > 0x3D)
            goto LABEL_27;
          if (((1 << (v14 - 10)) & 0x200000008009) != 0)
            goto LABEL_28;
          if (v14 == 71)
            goto LABEL_30;
LABEL_27:
          if ((unint64_t)(v14 - 252) >= 2)
          {
            if (v14 == 81)
LABEL_30:
              DeviceRGB = CGColorSpaceCreateWithName(kCGColorSpaceSRGB);
            else
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
          }
          else
          {
LABEL_28:
            DeviceRGB = CGColorSpaceCreateDeviceGray();
          }
          v21 = DeviceRGB;
          v22 = 7;
          switch(v14)
          {
            case 1:
              goto LABEL_47;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 21:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            case 51:
            case 52:
            case 56:
            case 57:
            case 58:
            case 59:
            case 61:
            case 66:
            case 67:
            case 68:
            case 69:
            case 75:
            case 76:
            case 77:
            case 78:
            case 79:
            case 82:
            case 83:
            case 84:
            case 85:
            case 86:
            case 87:
            case 88:
            case 89:
            case 95:
            case 96:
            case 97:
            case 98:
            case 99:
            case 100:
            case 101:
            case 102:
            case 106:
            case 107:
            case 108:
            case 109:
            case 111:
            case 116:
            case 117:
            case 118:
            case 119:
            case 120:
            case 121:
            case 122:
              goto LABEL_33;
            case 20:
            case 22:
            case 23:
            case 24:
            case 40:
            case 60:
            case 62:
            case 63:
            case 64:
              v22 = 4096;
              goto LABEL_47;
            case 25:
            case 65:
              v22 = 4352;
              goto LABEL_47;
            case 41:
            case 42:
              v22 = 4100;
              goto LABEL_47;
            case 43:
            case 110:
            case 112:
            case 113:
            case 114:
              v22 = 4099;
              goto LABEL_47;
            case 53:
            case 54:
            case 103:
            case 104:
              goto LABEL_39;
            case 55:
            case 92:
            case 93:
            case 105:
            case 123:
            case 124:
              v22 = 8448;
              goto LABEL_47;
            case 70:
            case 71:
            case 72:
            case 73:
            case 74:
              v22 = 3;
              goto LABEL_47;
            case 80:
            case 81:
              v22 = 8196;
              goto LABEL_47;
            case 90:
            case 91:
              v22 = 204803;
              goto LABEL_47;
            case 94:
              v22 = 16387;
              goto LABEL_47;
            case 115:
              v22 = 4355;
              goto LABEL_47;
            case 125:
              v22 = 8451;
              goto LABEL_47;
            default:
              if (v14 == 252)
LABEL_39:
                v22 = 0x2000;
              else
LABEL_33:
                v22 = 0;
LABEL_47:
              v23 = CGImageCreate(v27, *((size_t *)&v27 + 1), v18, v19, v15, DeviceRGB, v22, v16, 0, 1, kCGRenderingIntentDefault);
              CGColorSpaceRelease(v21);
              CGDataProviderRelease(v16);
              v24 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v23));
              v25 = UIImagePNGRepresentation(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

              objc_msgSend(v26, "writeToURL:atomically:", v28, 0);
              CGImageRelease(v23);

              break;
          }
          break;
      }
    }
    else
    {
      v12 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));
      NSLog(CFSTR("SaveTexture Can't handle floating point textures: url:%@"), v12);
    }

  }
}

uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  os_log_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  os_log_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;
  void *v22;
  FILE *v23;
  const char *v24;
  id v25;
  id v26;
  vm_address_t v27;
  uint64_t v28;
  vm_address_t v29;
  vm_address_t v30;
  vm_address_t v31;
  vm_address_t *v32;
  vm_address_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  const char **v39;
  void *v40;
  FILE *v41;
  const char *v42;
  id v43;
  id v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  const char *v50;
  int v51;
  int v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  _OWORD v59[12];
  __int128 buf;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;

  v4 = objc_autoreleasePoolPush();
  if (off_100012240 == &_os_log_default)
  {
    v7 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A94B);
    v8 = off_100012240;
    off_100012240 = v7;

    qword_100012278 = (uint64_t)malloc_type_calloc(0, 0x20uLL, 0x8004018A671A6uLL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("GPUToolsPerfLogging"));

    if (v10)
    {
      v11 = os_log_create("com.apple.gputools.MTLReplayer", (const char *)&unk_10000A94B);
      v12 = off_100012238;
      off_100012238 = v11;

    }
  }
  else
  {
    v5 = sub_100006EBC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "Log already initialized, did you call GTCoreLogInit twice?";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "warning: %s", (uint8_t *)&buf, 0xCu);
    }

  }
  v13 = off_100012238;
  if (os_signpost_enabled((os_log_t)off_100012238))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Replayer-1-serial", "MTLReplayer main() inited!", (uint8_t *)&buf, 2u);
  }
  if (dword_100012268++)
    goto LABEL_10;
  if (byte_100012250++)
  {
LABEL_15:
    *(_QWORD *)&buf = 0;
    if (!sub_100006BA4((uint64_t **)&buf, 0))
      *(_QWORD *)(buf + 80) = "apr_initialize";
    goto LABEL_10;
  }
  qword_100012258 = 0;
  v27 = sub_100006858(0xC8uLL);
  if (!v27)
  {
LABEL_29:
    byte_100012250 = 0;
    goto LABEL_10;
  }
  *(_OWORD *)v27 = 0u;
  *(_OWORD *)(v27 + 16) = 0u;
  *(_QWORD *)(v27 + 192) = 0;
  *(_OWORD *)(v27 + 160) = 0u;
  *(_OWORD *)(v27 + 176) = 0u;
  *(_OWORD *)(v27 + 128) = 0u;
  *(_OWORD *)(v27 + 144) = 0u;
  *(_OWORD *)(v27 + 96) = 0u;
  *(_OWORD *)(v27 + 112) = 0u;
  *(_OWORD *)(v27 + 64) = 0u;
  *(_OWORD *)(v27 + 80) = 0u;
  *(_OWORD *)(v27 + 32) = 0u;
  *(_OWORD *)(v27 + 48) = 0u;
  qword_100012258 = v27;
  *(int64x2_t *)(v27 + 8) = vdupq_n_s64(0x8000uLL);
  if (sub_100006BA4((uint64_t **)&qword_100012260, (unint64_t *)v27))
  {
    v28 = 0;
    v29 = qword_100012258;
    do
    {
      v30 = v29 + 8 * v28;
      v33 = *(_QWORD *)(v30 + 40);
      v32 = (vm_address_t *)(v30 + 40);
      v31 = v33;
      if (v33)
      {
        do
        {
          *v32 = *(_QWORD *)v31;
          vm_deallocate(mach_task_self_, v31, ((*(_DWORD *)(v31 + 16) << 12) + 4096));
          v31 = *v32;
        }
        while (*v32);
      }
      ++v28;
    }
    while (v28 != 20);
    vm_deallocate(mach_task_self_, v29, 0xC8uLL);
    qword_100012258 = 0;
    goto LABEL_29;
  }
  v53 = (_QWORD *)qword_100012260;
  *(_QWORD *)(qword_100012260 + 80) = "apr_global_pool";
  if (qword_100012248)
  {
LABEL_115:
    *(_QWORD *)&buf = 0;
    if (sub_100006E34(&buf, (uint64_t)v53))
      goto LABEL_10;
    v55 = qword_100012258;
    v56 = qword_100012260;
    *(_QWORD *)(qword_100012258 + 24) = buf;
    *(_QWORD *)(v55 + 32) = v56;
    goto LABEL_15;
  }
  qword_100012248 = sub_100006CA0((uint64_t)v53, 0x38uLL);
  sub_100006DC4(v53, qword_100012248, (uint64_t)sub_1000069EC);
  v54 = 0;
  while (!sub_100006E34((_QWORD *)(qword_100012248 + v54), (uint64_t)v53))
  {
    v54 += 8;
    if (v54 == 56)
    {
      v53 = (_QWORD *)qword_100012260;
      goto LABEL_115;
    }
  }
LABEL_10:
  v58 = 0;
  sub_100006BA4(&v58, 0);
  GTMTLReplayController_init(v58);
  if (a1 >= 2 && (v15 = a2 + 8, !strcmp("-CLI", *(const char **)(a2 + 8))))
  {
    *(_QWORD *)(a2 + 8) = *(_QWORD *)a2;
    if (a1 > 2)
    {
      v34 = a1 - 1;
      v57 = *(_QWORD *)(a2 + 16);
      v68 = xmmword_10000C3C8;
      v69 = unk_10000C3D8;
      v70 = xmmword_10000C3E8;
      v71 = unk_10000C3F8;
      v64 = xmmword_10000C388;
      v65 = unk_10000C398;
      v66 = xmmword_10000C3A8;
      v67 = unk_10000C3B8;
      buf = xmmword_10000C348;
      v61 = *(_OWORD *)algn_10000C358;
      v62 = xmmword_10000C368;
      v63 = *(_OWORD *)&off_10000C378;
      if (v34 != 2)
      {
        v35 = 2;
        while (1)
        {
          v36 = 0;
          v37 = v35;
          v38 = *(const char **)(v15 + 8 * v35);
          v39 = (const char **)&off_10000C408;
          while (strcmp(v38, *v39))
          {
            ++v36;
            v39 += 2;
            if (v36 == 61)
            {
LABEL_36:
              v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown token: %s"), v38));
              v41 = __stdoutp;
              if (g_runningInCI)
                v42 = "#CI_ERROR# ";
              else
                v42 = (const char *)&unk_10000A94B;
              v43 = objc_retainAutorelease(v40);
              fprintf(v41, "%s%s %u: %s\n", v42, "void ParseArguments(GTMTLReplayCLIOptions *, int, const char **)", 451, (const char *)objc_msgSend(v43, "UTF8String"));
              v44 = objc_retainAutorelease(v43);
              GTMTLReplay_handleError(101, objc_msgSend(v44, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/GTMTLReplay_mainCLI.m", "ParseArguments", 451, 1);

              goto LABEL_99;
            }
          }
          switch(LODWORD((&off_10000C408)[2 * v36 + 1]))
          {
            case 1:
              v45 = DWORD2(v71) | 0x8000;
              goto LABEL_98;
            case 2:
            case 0x17:
              goto LABEL_99;
            case 3:
            case 0x1F:
              v45 = DWORD2(v71) | 0x200;
              goto LABEL_98;
            case 4:
              ++v35;
              *((_QWORD *)&buf + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 5:
              ++v35;
              *(_QWORD *)&buf = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 6:
              ++v35;
              v46 = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              if (v46 <= 1)
                v47 = 1;
              else
                v47 = v46;
              DWORD2(v61) = v47;
              goto LABEL_99;
            case 7:
              BYTE4(v62) = 1;
              goto LABEL_99;
            case 8:
              v45 = DWORD2(v71) | 0x100;
              goto LABEL_98;
            case 9:
              ++v35;
              *(_QWORD *)&v61 = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xA:
              ++v35;
              HIDWORD(v61) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xB:
              ++v35;
              LODWORD(v62) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0xC:
              BYTE5(v62) = 1;
              goto LABEL_99;
            case 0xD:
              ++v35;
              *((_QWORD *)&v62 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0xE:
              ++v35;
              *(_QWORD *)&v63 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0xF:
              ++v35;
              sscanf(*(const char **)(v15 + 8 * (v37 + 1)), "%llu:%llu", (char *)&v70 + 8, &v71);
              goto LABEL_99;
            case 0x10:
              v45 = DWORD2(v71) | 1;
              goto LABEL_98;
            case 0x11:
              v45 = DWORD2(v71) | 2;
              goto LABEL_98;
            case 0x12:
              v45 = DWORD2(v71) | 4;
              goto LABEL_98;
            case 0x13:
              ++v35;
              HIDWORD(v69) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0x14:
              ++v35;
              LODWORD(v70) = atoi(*(const char **)(v15 + 8 * (v37 + 1)));
              goto LABEL_99;
            case 0x15:
              v45 = DWORD2(v71) | 8;
              goto LABEL_98;
            case 0x16:
              v45 = DWORD2(v71) | 0x40;
              goto LABEL_98;
            case 0x18:
              ++v35;
              *((_QWORD *)&v64 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x19:
              v48 = DWORD2(v71) | 0x800;
              goto LABEL_69;
            case 0x1A:
              v45 = DWORD2(v71) | 0x80;
              goto LABEL_98;
            case 0x1B:
              v48 = DWORD2(v71) | 0x100;
LABEL_69:
              DWORD2(v71) = v48;
              ++v35;
              *(_QWORD *)&v66 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1C:
              DWORD2(v71) |= 0x2000u;
              ++v35;
              *((_QWORD *)&v66 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1D:
              ++v35;
              *(_QWORD *)&v67 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x1E:
              ++v35;
              *((_QWORD *)&v67 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x20:
              ++v35;
              *((_QWORD *)&v63 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x21:
              ++v35;
              *(_QWORD *)&v64 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x22:
              v45 = DWORD2(v71) | 0x1000;
              goto LABEL_98;
            case 0x23:
              DWORD2(v71) |= 0x80u;
              ++v35;
              *(_QWORD *)&v65 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x24:
              DWORD2(v71) |= 0x4000u;
              ++v35;
              *(_QWORD *)&v68 = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x25:
              v45 = DWORD2(v71) | 0x10000;
              goto LABEL_98;
            case 0x26:
              v45 = DWORD2(v71) | 0x20000;
              goto LABEL_98;
            case 0x27:
              g_runningInCI = 1;
              goto LABEL_99;
            case 0x28:
              g_runningValidationCI = 1;
              goto LABEL_99;
            case 0x29:
              ++v35;
              goto LABEL_99;
            case 0x2A:
              v45 = DWORD2(v71) | 0x40000;
              goto LABEL_98;
            case 0x2B:
              v45 = DWORD2(v71) | 0x10;
              goto LABEL_98;
            case 0x2C:
              v45 = DWORD2(v71) | 0x80000;
              goto LABEL_98;
            case 0x2D:
              v45 = DWORD2(v71) | 0x100000;
              goto LABEL_98;
            case 0x2E:
              v45 = DWORD2(v71) | 0x200000;
              goto LABEL_98;
            case 0x30:
              DWORD2(v71) |= 0x400000u;
              v49 = v35 + 1;
              v50 = *(const char **)(v15 + 8 * v49);
              if (!v50 || *v50 == 45)
              {
                DWORD1(v70) = -1;
                goto LABEL_99;
              }
              if (!strcmp(*(const char **)(v15 + 8 * v49), "max"))
              {
                v52 = 2;
LABEL_107:
                DWORD1(v70) = v52;
                goto LABEL_108;
              }
              if (!strcmp(v50, "med"))
              {
                v52 = 1;
                goto LABEL_107;
              }
              if (!strcmp(v50, "min"))
                DWORD1(v70) = 0;
              else
                DWORD1(v70) = atoi(v50);
LABEL_108:
              ++v35;
LABEL_99:
              if (++v35 >= v34)
                goto LABEL_31;
              break;
            case 0x31:
              DWORD2(v71) |= 0x1000000u;
              ++v35;
              *((_QWORD *)&v68 + 1) = *(_QWORD *)(v15 + 8 * (v37 + 1));
              goto LABEL_99;
            case 0x32:
              v51 = DWORD2(v71) | 0x2000000;
              goto LABEL_94;
            case 0x33:
              v51 = DWORD2(v71) | 0x4000000;
LABEL_94:
              DWORD2(v71) = v51;
              DWORD2(v69) = atoi(*(const char **)(v15 + 8 * v35 + 8));
              v35 += 2;
              *(_QWORD *)&v69 = *(_QWORD *)(v15 + 8 * (v37 + 2));
              goto LABEL_99;
            case 0x34:
              v45 = DWORD2(v71) | 0x800000;
              goto LABEL_98;
            case 0x35:
              v45 = DWORD2(v71) | 0x20;
LABEL_98:
              DWORD2(v71) = v45;
              goto LABEL_99;
            default:
              goto LABEL_36;
          }
        }
      }
LABEL_31:
      v59[8] = v68;
      v59[9] = v69;
      v59[10] = v70;
      v59[11] = v71;
      v59[4] = v64;
      v59[5] = v65;
      v59[6] = v66;
      v59[7] = v67;
      v59[0] = buf;
      v59[1] = v61;
      v59[2] = v62;
      v59[3] = v63;
      v19 = GTMTLReplay_CLI(v57, v59, sub_100004910);
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid command-line arguments (usage: MTLReplayer archivePath [options])")));
      v23 = __stdoutp;
      if (g_runningInCI)
        v24 = "#CI_ERROR# ";
      else
        v24 = (const char *)&unk_10000A94B;
      v25 = objc_retainAutorelease(v22);
      fprintf(v23, "%s%s %u: %s\n", v24, "int GTMTLReplayCLI_main(int, const char **)", 462, (const char *)objc_msgSend(v25, "UTF8String"));
      v26 = objc_retainAutorelease(v25);
      v19 = 1;
      GTMTLReplay_handleError(101, objc_msgSend(v26, "UTF8String"), "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/replayer/GTMTLReplay_mainCLI.m", "GTMTLReplayCLI_main", 462, 1);

    }
  }
  else
  {
    v16 = (objc_class *)objc_opt_class(ReplayerAppDelegate);
    v17 = NSStringFromClass(v16);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(v17);
    v19 = UIApplicationMain(a1, (char **)a2, 0, v18);

  }
  objc_autoreleasePoolPop(v4);
  return v19;
}

id sub_100006838(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 40));
}

id sub_100006844(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateOfSupportedInterfaceOrientations");
}

id sub_10000684C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDevice:", *(_QWORD *)(a1 + 40));
}

vm_address_t sub_100006858(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  const char *v6;
  kern_return_t v7;
  mach_error_t v8;
  char *v10;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v15;
  __int16 v16;
  char *v17;

  address = 0;
  object_handle = 0;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v3 = memory_entry_64;
    v4 = sub_100006EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = mach_error_string(v3);
      *(_DWORD *)buf = 67109378;
      v15 = v3;
      v16 = 2080;
      v17 = v5;
      v6 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v6, buf, 0x12u);
    }
  }
  else
  {
    v7 = vm_map(mach_task_self_, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v7)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }
    v8 = v7;
    v4 = sub_100006EBC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = mach_error_string(v8);
      *(_DWORD *)buf = 67109378;
      v15 = v8;
      v16 = 2080;
      v17 = v10;
      v6 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t sub_1000069EC(uint64_t a1)
{
  if (qword_100012248 == a1)
    qword_100012248 = 0;
  return 0;
}

_QWORD *sub_100006A08(unint64_t *a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  memory_object_size_t v5;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  _QWORD *v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  vm_address_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;

  v2 = 0;
  v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  v4 = 0x2000;
  if (v3 > 0x2000)
    v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  if (v3 >= a2)
    v5 = v4;
  else
    v5 = 0;
  if (v3 < a2)
    return v2;
  v7 = *a1;
  if (*a1)
  {
    v8 = a1[3];
    if (v8)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      v7 = *a1;
    }
    v9 = a1 + 6;
    v2 = (_QWORD *)a1[6];
    v10 = v2 == 0;
    v11 = v7 > 1;
    if (!v2 && v7 >= 2)
    {
      v12 = 2;
      do
      {
        v13 = (_QWORD *)v9[1];
        ++v9;
        v2 = v13;
        v10 = v13 == 0;
        v11 = v12 < v7;
        if (v13)
          v14 = 1;
        else
          v14 = v12 >= v7;
        ++v12;
      }
      while (!v14);
    }
    if (!v10)
    {
      v21 = *v2;
      *v9 = *v2;
      if (v21)
        v11 = 1;
      if (!v11)
      {
        v22 = v9 - 1;
        do
        {
          if (*v22--)
            v24 = 1;
          else
            v24 = v7 == 1;
          --v7;
        }
        while (!v24);
        *a1 = v7;
      }
      v19 = (*((_DWORD *)v2 + 4) + 1);
LABEL_40:
      v25 = a1[2] + v19;
      if (v25 >= a1[1])
        v25 = a1[1];
      a1[2] = v25;
      v26 = a1[3];
      if (v26)
        pthread_mutex_unlock((pthread_mutex_t *)(v26 + 8));
      goto LABEL_44;
    }
  }
  else
  {
    v2 = a1 + 5;
    if (!a1[5])
      goto LABEL_27;
    v16 = a1[3];
    if (v16)
      pthread_mutex_lock((pthread_mutex_t *)(v16 + 8));
    while (1)
    {
      v17 = v2;
      v2 = (_QWORD *)*v2;
      if (!v2)
        break;
      v18 = *((_DWORD *)v2 + 4);
      if (v18)
      {
        *v17 = *v2;
        v19 = (v18 + 1);
        goto LABEL_40;
      }
    }
  }
  v15 = a1[3];
  if (v15)
    pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
LABEL_27:
  v20 = sub_100006858(v5);
  v2 = (_QWORD *)v20;
  if (v20)
  {
    *(_DWORD *)(v20 + 16) = 1;
    *(_QWORD *)(v20 + 32) = v20 + v5;
LABEL_44:
    *v2 = 0;
    v2[3] = v2 + 5;
  }
  return v2;
}

uint64_t sub_100006BA4(uint64_t **a1, unint64_t *a2)
{
  unint64_t *v2;
  uint64_t v4;
  void (*v5)(uint64_t);
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t v12;

  v2 = a2;
  *a1 = 0;
  v4 = qword_100012260;
  if (qword_100012260)
  {
    v5 = *(void (**)(uint64_t))(qword_100012260 + 64);
    if (a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if (!a2)
LABEL_3:
    v2 = *(unint64_t **)(qword_100012260 + 48);
LABEL_4:
  v6 = sub_100006A08(v2, 0x1FD8uLL);
  if (v6)
  {
    *v6 = v6;
    v6[1] = v6;
    v7 = (uint64_t *)v6[3];
    v6[3] = v7 + 15;
    v7[12] = (uint64_t)v6;
    v7[13] = (uint64_t)(v7 + 15);
    v7[14] = 0;
    v7[6] = (uint64_t)v2;
    v7[7] = 0;
    v7[4] = 0;
    v7[5] = 0;
    v7[10] = 0;
    v7[11] = (uint64_t)v6;
    v7[8] = (uint64_t)v5;
    v7[9] = 0;
    *v7 = v4;
    v7[1] = 0;
    if (v4)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 24);
      if (v8)
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 8));
      v11 = *(_QWORD *)(v4 + 8);
      v10 = (uint64_t **)(v4 + 8);
      v9 = v11;
      v7[2] = v11;
      if (v11)
        *(_QWORD *)(v9 + 24) = v7 + 2;
      *v10 = v7;
      v7[3] = (uint64_t)v10;
      if (v8)
        pthread_mutex_unlock((pthread_mutex_t *)(v8 + 8));
    }
    else
    {
      v7[2] = 0;
      v7[3] = 0;
    }
    v12 = 0;
    *a1 = v7;
  }
  else
  {
    v12 = 12;
    if (v5)
      v5(12);
  }
  return v12;
}

uint64_t sub_100006CA0(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  void (*v4)(uint64_t);
  uint64_t result;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;

  v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < a2)
  {
LABEL_2:
    v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4)
      v4(12);
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 88);
  result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }
  v7 = (_QWORD *)*v6;
  if (v3 <= *(_QWORD *)(*v6 + 32) - *(_QWORD *)(*v6 + 24))
  {
    *(_QWORD *)v7[1] = *v7;
    *(_QWORD *)(*v7 + 8) = v7[1];
  }
  else
  {
    v7 = sub_100006A08(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7)
      goto LABEL_2;
  }
  *((_DWORD *)v7 + 5) = 0;
  result = v7[3];
  v7[3] = result + v3;
  v8 = (_QWORD *)v6[1];
  v7[1] = v8;
  *v8 = v7;
  *v7 = v6;
  v6[1] = v7;
  *(_QWORD *)(a1 + 88) = v7;
  v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    v10 = (uint64_t *)*v6;
    do
      v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    *v7 = *v6;
    *(_QWORD *)(*v6 + 8) = v6[1];
    v11 = (_QWORD *)v10[1];
    v6[1] = v11;
    *v11 = v6;
    *v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

_QWORD *sub_100006DC4(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = (uint64_t)result;
    result = (_QWORD *)result[5];
    if (result)
      *(_QWORD *)(v5 + 40) = *result;
    else
      result = (_QWORD *)sub_100006CA0(v5, 0x20uLL);
    result[2] = a3;
    result[3] = sub_100006E2C;
    *result = *(_QWORD *)(v5 + 32);
    result[1] = a2;
    *(_QWORD *)(v5 + 32) = result;
  }
  return result;
}

uint64_t sub_100006E2C()
{
  return 0;
}

uint64_t sub_100006E34(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD **v5;
  uint64_t result;

  v4 = sub_100006CA0(a2, 0x48uLL);
  v5 = (_QWORD **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }
  *(_QWORD *)v4 = a2;
  result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0);
  if (!(_DWORD)result)
  {
    sub_100006DC4(*v5, (uint64_t)v5, (uint64_t)sub_100006EB4);
    result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t sub_100006EB4(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

id sub_100006EBC()
{
  void *v0;

  v0 = off_100012240;
  if (off_100012240 == &_os_log_default)
  {
    if (qword_100012270 != -1)
      dispatch_once(&qword_100012270, &stru_10000C870);
    v0 = off_100012240;
  }
  return v0;
}

void sub_100006F18(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__applicationDidFinishLaunching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applicationDidFinishLaunching");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorPixelFormat");
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commandBuffer");
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commands");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commit");
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsScale");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDrawable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDrawable");
}

id objc_msgSend_currentRenderPassDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRenderPassDescriptor");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_draw(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "draw");
}

id objc_msgSend_drawableSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawableSize");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEncoding");
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithMetalKitView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMetalKitView:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadView");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_mtkView_drawableSizeWillChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mtkView:drawableSizeWillChange:");
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newCommandQueue");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_presentDrawable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentDrawable:");
}

id objc_msgSend_render_withEncoder_withFormat_renderTargetSize_viewContentsScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "render:withEncoder:withFormat:renderTargetSize:viewContentsScale:");
}

id objc_msgSend_renderCommandEncoderWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderCommandEncoderWithDescriptor:");
}

id objc_msgSend_renderEncodedCommands_toCommandBuffer_withView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderEncodedCommands:toCommandBuffer:withView:");
}

id objc_msgSend_setAutoResizeDrawable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoResizeDrawable:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setColorPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorPixelFormat:");
}

id objc_msgSend_setColorspace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setColorspace:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDisplayTextureEncoder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayTextureEncoder:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}
