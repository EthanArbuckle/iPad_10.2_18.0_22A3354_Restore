@implementation AGXA10FamilyTexture

- (void)dealloc
{
  objc_super v3;

  if (self->super._bytesPerRow)
  {
    if (-[AGXA10FamilyTexture isSparse](self, "isSparse"))
      objc_msgSend(0, "removeTexture:", self);
    (**(void (***)(unint64_t))self->super._bytesPerRow)(self->super._bytesPerRow);
    free((void *)self->super._bytesPerRow);
    self->super._bytesPerRow = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)AGXA10FamilyTexture;
  -[AGXTexture dealloc](&v3, sel_dealloc);
}

- (BOOL)initImplWithDevice:(id)a3 Descriptor:(id)a4 iosurface:(__IOSurface *)a5 plane:(unint64_t)a6 slice:(unint64_t)a7 buffer:(id)a8 bytesPerRow:(unint64_t)a9 allowNPOT:(BOOL)a10 sparsePageSize:(unint64_t)a11 isCompressedIOSurface:(BOOL)a12 isHeapBacked:(BOOL)a13
{
  unsigned int v14;
  unsigned int v15;
  uint64_t v20;
  uint64_t v21;
  MTLPixelFormat v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char v26;
  char v27;
  unsigned __int8 v28;
  unsigned int CompressionFootprintOfPlane;
  unsigned __int8 v30;
  _QWORD *v31;
  NSObject *v32;
  const char *v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32x2_t v45;
  uint64_t bytesPerRow;
  uint64_t v47;
  void *v48;
  __IOSurface *v49;
  _QWORD *v50;
  BOOL v51;
  uint64_t v52;
  BOOL v53;
  _QWORD *v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  int v61;
  BOOL v62;
  int v63;
  uint64_t v64;
  BOOL v66;
  BOOL v68;
  unint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t *v88;
  unint64_t v89;
  unint64_t *v90;
  uint64_t v91;
  unint64_t *v92;
  unint64_t v93;
  unint64_t *v94;
  unint64_t v95;
  uint64_t v97;
  unsigned __int8 v98;
  unsigned __int8 v99;
  _QWORD *v100;
  int v101;
  int v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  AGX::G9::TextureFormatTable *v106;
  uint64_t v107;
  int v108[2];
  AGXA10FamilyTexture *v109;
  __IOSurface *v110;
  id v111;
  uint64_t v112;
  unsigned int v113;
  unsigned int v114;
  uint8_t buf[4];
  uint64_t v116;

  v14 = a7;
  v15 = a6;
  v116 = *MEMORY[0x24BDAC8D0];
  v20 = objc_msgSend(a4, "descriptorPrivate");
  v21 = objc_msgSend(a8, "iosurface");
  v23 = *(_QWORD *)(v20 + 96);
  v114 = v14;
  if (v23 == 2)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_12;
  }
  if (v23 == 1)
    LOBYTE(v23) = 9;
  else
    LOBYTE(v23) = 0;
  v24 = *(_QWORD *)(v20 + 152);
  switch(v24)
  {
    case 3:
      v25 = 3;
      break;
    case 2:
      v25 = 2;
      break;
    case 1:
      v25 = 1;
      break;
    default:
      goto LABEL_9;
  }
LABEL_12:
  if (*(_BYTE *)(v20 + 128))
    v26 = v23;
  else
    v26 = 2;
  if (a12)
    v27 = 4;
  else
    v27 = 0;
  v28 = v26 & 0xFB | v27;
  if (!a5)
  {
    v112 = v21;
    v113 = v15;
    v28 |= (*((_BYTE *)AGX::G9::TextureFormatTable::chooseTextureFormatOBJC(*(AGX::G9::TextureFormatTable **)(v20 + 8), v22)+ 60) & 0xC) != 0;
    goto LABEL_38;
  }
  if ((v26 & 3) != 0)
  {
    if (!a12)
    {
      v112 = v21;
      v113 = v15;
LABEL_38:
      v30 = v25;
      goto LABEL_39;
    }
  }
  else
  {
    if (!a12)
    {
      v112 = v21;
      v113 = v15;
      v28 |= 2u;
      goto LABEL_38;
    }
    v28 |= 1u;
  }
  if ((v28 & 2) != 0)
  {
LABEL_104:
    LOBYTE(v31) = 0;
    return (char)v31;
  }
  v112 = v21;
  v113 = v15;
  CompressionFootprintOfPlane = IOSurfaceGetCompressionFootprintOfPlane();
  if (CompressionFootprintOfPlane <= 3)
    v30 = CompressionFootprintOfPlane;
  else
    v30 = 0;
  if (v25)
  {
    if (v25 == 3)
    {
      if (CompressionFootprintOfPlane > 3 || (CompressionFootprintOfPlane & 0xF) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: Texture creation failed: Requesting lossy compression on lossless compressed IOSurface.", buf, 2u);
        }
        LODWORD(v31) = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
        if (!(_DWORD)v31)
          return (char)v31;
        *(_WORD *)buf = 0;
        v32 = MEMORY[0x24BDACB70];
        v33 = "AGX: Texture creation failed: Requesting lossy compression on lossless compressed IOSurface.";
        goto LABEL_117;
      }
    }
    else if (v25 != v30)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: Texture creation failed: Mismatched IOSurface compression footprint.", buf, 2u);
      }
      LODWORD(v31) = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)v31)
        return (char)v31;
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x24BDACB70];
      v33 = "AGX: Texture creation failed: Mismatched IOSurface compression footprint.";
LABEL_117:
      _os_log_impl(&dword_232C19000, v32, OS_LOG_TYPE_INFO, v33, buf, 2u);
      LOBYTE(v31) = 0;
      return (char)v31;
    }
  }
  v52 = *(_QWORD *)(v20 + 104);
  v53 = (v52 & 0x4000) != 0 || *(_QWORD *)(v20 + 96) == 1;
  if (*(_BYTE *)(*((_QWORD *)a3 + 101) + 6732))
  {
    if ((v52 & 2) != 0 && !v53)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_232C19000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "AGX: Texture creation failed: Compression unsupported with usage flags.", buf, 2u);
      }
      LODWORD(v31) = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
      if (!(_DWORD)v31)
        return (char)v31;
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x24BDACB70];
      v33 = "AGX: Texture creation failed: Compression unsupported with usage flags.";
      goto LABEL_117;
    }
  }
LABEL_39:
  v31 = malloc_type_calloc(0x1C0uLL, 1uLL, 0xBBBEA729uLL);
  self->super._bytesPerRow = (unint64_t)v31;
  if (v31)
  {
    v34 = v31;
    v99 = v28;
    v35 = v28 & 0xEF | ((unint64_t)v30 << 8);
    *(_QWORD *)v108 = *((_QWORD *)a3 + 101);
    v107 = *(_QWORD *)v20;
    v105 = *(_QWORD *)(v20 + 104);
    v106 = *(AGX::G9::TextureFormatTable **)(v20 + 8);
    v104 = *(_QWORD *)(v20 + 192);
    v36 = *(_QWORD *)(v20 + 168) - 1;
    v109 = self;
    v111 = a4;
    v98 = v30;
    v100 = a3;
    v110 = a5;
    if (v36 > 9)
      v103 = 0;
    else
      v103 = dword_232D77F80[v36];
    if ((unint64_t)(*(_QWORD *)(v20 + 72) - 1) < 4)
      v37 = *(_DWORD *)(v20 + 72);
    else
      v37 = 0;
    v101 = *(_DWORD *)(v20 + 84);
    v102 = v37;
    v38 = *(_QWORD *)(v20 + 16);
    v39 = *(_QWORD *)(v20 + 24);
    v40 = *(_QWORD *)(v20 + 32);
    v41 = *(_DWORD *)(v20 + 40);
    v43 = *(_QWORD *)(v20 + 48);
    v42 = *(_QWORD *)(v20 + 56);
    v44 = *(_QWORD *)(v20 + 112) & 0xFLL;
    objc_msgSend(v111, "resourceIndex");
    LODWORD(v97) = a11;
    AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)v34, *(MTLPixelFormat *)v108, v107, v106, v105, v104, v35, v103, v102, v101, v45, v38, v39, v40, v41, __SPAIR64__(v42, v43), a9, v97, v44,
      (int)v110,
      SHIDWORD(v110),
      __SPAIR64__(v114, v113),
      v112,
      SHIDWORD(v112),
      0,
      0,
      0);
    *v34 = off_250402690;
    bytesPerRow = v109->super._bytesPerRow;
    if (!*(_BYTE *)(bytesPerRow + 200))
      goto LABEL_104;
    *(Class *)((char *)&v109->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51698]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (*(_BYTE *)(bytesPerRow + 16))
    {
      v47 = 0;
      v49 = v110;
      v48 = v111;
      v50 = v100;
      v51 = a12;
    }
    else
    {
      v49 = v110;
      v48 = v111;
      v50 = v100;
      v51 = a12;
      if (*(_BYTE *)(bytesPerRow + 232))
      {
        v47 = *(_QWORD *)(bytesPerRow + 320);
      }
      else
      {
        v47 = *(unsigned int *)(bytesPerRow + 236);
        if (!(_DWORD)v47)
        {
          v55 = (_QWORD *)(bytesPerRow + 380);
          v56 = *(unsigned __int8 *)(bytesPerRow + 380);
          v57 = *(unsigned __int8 *)(bytesPerRow + 381);
          v58 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>(bytesPerRow, 0);
          v59 = (*v55 >> 16) & 1;
          if (v57 == 1)
            v60 = WORD1(*v55) & 1;
          else
            v60 = 0;
          if (v57 != 2)
            LODWORD(v59) = 0;
          if ((v60 & 1) != 0)
            LODWORD(v59) = 1;
          if ((v57 - 3) >= 2)
            v61 = v59;
          else
            v61 = 1;
          v62 = (v58 & 0xFFFFFFFFFFFFC000) != 0 && v56 == 1;
          v63 = v62;
          v62 = (v63 & v61) == 0;
          v64 = 64;
          if (!v62)
            v64 = 0x4000;
          if (v56)
            v47 = v64;
          else
            v47 = 16;
        }
      }
    }
    -[AGXTexture set_alignment:](v109, "set_alignment:", v47);
    -[AGXTexture set_cpuSizeBytes:](v109, "set_cpuSizeBytes:", *(_QWORD *)(v109->super._bytesPerRow + 352));
    -[AGXTexture set_bytesPerRow:](v109, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Op)0>(v109->super._bytesPerRow, 0));
    if (a11)
      objc_msgSend(v48, "sparseSurfaceDefaultValue");
    *(&v109->super.super._allowGPUOptimizedContents + 1) = objc_msgSend(v48, "protectionOptions") == 0;
    v66 = (objc_msgSend(v48, "resourceOptions") & 0x80000) == 0 && *(&v109->super.super._allowGPUOptimizedContents + 1);
    *(&v109->super.super._allowGPUOptimizedContents + 1) = v66;
    if (*(_BYTE *)(v50[101] + 6724))
    {
      v68 = objc_msgSend(v48, "storageMode") != 2 && *(&v109->super.super._allowGPUOptimizedContents + 1);
      *(&v109->super.super._allowGPUOptimizedContents + 1) = v68;
    }
    if (v49 && v51)
      goto LABEL_104;
    v69 = v50 + 102;
    if (*((_BYTE *)v50 + 936))
    {
      v70 = objc_msgSend(v48, "pixelFormat");
      if ((unint64_t)(v70 - 250) > 0xB)
      {
        LOBYTE(v73) = 0;
        v72 = 13;
      }
      else
      {
        v71 = 8 * (v70 - 250);
        v72 = *(_QWORD *)((char *)&unk_232D77EA0 + v71);
        v73 = *(_QWORD *)((char *)&unk_232D77F00 + v71);
      }
      v74 = 1 << v73;
      v75 = objc_msgSend(v48, "resourceOptions");
      v76 = 0x100000000000000;
      if ((v75 & 0x100) == 0)
        v76 = 1;
      v77 = v76 | v74;
      switch(objc_msgSend(v48, "textureType"))
      {
        case 0:
          v77 |= 0x40000uLL;
          break;
        case 1:
          v77 |= 0x80000uLL;
          break;
        case 2:
          v77 |= 0x100000uLL;
          break;
        case 3:
          v77 |= 0x200000uLL;
          break;
        case 4:
          v77 |= 0x400000uLL;
          break;
        case 5:
          v77 |= 0x800000uLL;
          break;
        case 6:
          v77 |= 0x1000000uLL;
          break;
        case 7:
          v77 |= 0x2000000uLL;
          break;
        default:
          break;
      }
      v78 = objc_msgSend(v48, "storageMode");
      switch(v78)
      {
        case 3:
          v77 |= 0x20000000000000uLL;
          break;
        case 2:
          v77 |= 0x10000000000000uLL;
          break;
        case 0:
          v77 |= 0x8000000000000uLL;
          break;
      }
      if (objc_msgSend(v48, "usage"))
        v79 = v77 | (objc_msgSend(v48, "usage") << 28);
      else
        v79 = v77 | 0x8000000;
      if (*(_BYTE *)(v109->super._bytesPerRow + 316))
      {
        v80 = objc_msgSend(v48, "pixelFormat");
        v81 = v80 == 227 || v80 == 221;
        v82 = 0x800000;
        if (!v81)
          v82 = 0;
      }
      else
      {
        v82 = 0;
      }
      do
        v83 = __ldaxr(v69);
      while (__stlxr(v83 | v79, v69));
      v84 = v69 + 1;
      do
        v85 = __ldaxr(v84);
      while (__stlxr(v85 | v82, v84));
      v86 = objc_msgSend(v48, "pixelFormat");
      v87 = 0;
      switch(v86)
      {
        case 1:
        case 10:
        case 11:
          goto LABEL_213;
        case 12:
          v87 = 4;
          goto LABEL_213;
        case 13:
          v87 = 8;
          goto LABEL_213;
        case 14:
          v87 = 12;
          goto LABEL_213;
        case 20:
          v87 = 20;
          goto LABEL_213;
        case 22:
          v87 = 24;
          goto LABEL_213;
        case 23:
          v87 = 28;
          goto LABEL_213;
        case 24:
          v87 = 32;
          goto LABEL_213;
        case 25:
          v87 = 16;
          goto LABEL_213;
        case 30:
        case 31:
          v87 = 1;
          goto LABEL_213;
        case 32:
          v87 = 5;
          goto LABEL_213;
        case 33:
          v87 = 9;
          goto LABEL_213;
        case 34:
          v87 = 13;
          goto LABEL_213;
        case 40:
        case 41:
        case 42:
        case 43:
          v87 = 48;
          goto LABEL_213;
        case 53:
          v87 = 40;
          goto LABEL_213;
        case 54:
          v87 = 44;
          goto LABEL_213;
        case 55:
          v87 = 36;
          goto LABEL_213;
        case 60:
          v87 = 21;
          goto LABEL_213;
        case 62:
          v87 = 25;
          goto LABEL_213;
        case 63:
          v87 = 29;
          goto LABEL_213;
        case 64:
          v87 = 33;
          goto LABEL_213;
        case 65:
          v87 = 17;
          goto LABEL_213;
        case 70:
        case 71:
        case 80:
        case 81:
          v87 = 3;
          goto LABEL_213;
        case 72:
          v87 = 7;
          goto LABEL_213;
        case 73:
          v87 = 11;
          goto LABEL_213;
        case 74:
          v87 = 15;
          goto LABEL_213;
        case 90:
        case 91:
          v87 = 49;
          goto LABEL_213;
        case 92:
          v87 = 52;
          goto LABEL_213;
        case 93:
          v87 = 51;
          goto LABEL_213;
        case 103:
          v87 = 41;
          goto LABEL_213;
        case 104:
          v87 = 45;
          goto LABEL_213;
        case 105:
          v87 = 37;
          goto LABEL_213;
        case 110:
          v87 = 23;
          goto LABEL_213;
        case 112:
          v87 = 27;
          goto LABEL_213;
        case 113:
          v87 = 31;
          goto LABEL_213;
        case 114:
          v87 = 35;
          goto LABEL_213;
        case 115:
          v87 = 19;
          goto LABEL_213;
        case 123:
          v87 = 43;
          goto LABEL_213;
        case 124:
          v87 = 47;
          goto LABEL_213;
        case 125:
          v87 = 39;
          goto LABEL_213;
        case 160:
        case 161:
        case 164:
        case 165:
          v87 = 57;
          goto LABEL_213;
        case 162:
        case 163:
        case 166:
        case 167:
          v87 = 58;
          goto LABEL_213;
        case 170:
        case 172:
        case 174:
        case 176:
        case 178:
        case 179:
          v87 = 60;
          goto LABEL_213;
        case 180:
        case 181:
        case 182:
        case 183:
          v87 = 59;
          goto LABEL_213;
        case 186:
        case 204:
          v87 = 61;
          goto LABEL_213;
        case 187:
        case 205:
          v87 = 62;
          goto LABEL_213;
        case 188:
        case 206:
          v87 = 63;
          goto LABEL_213;
        case 189:
        case 207:
          v87 = 64;
          goto LABEL_213;
        case 190:
        case 208:
          v87 = 65;
          goto LABEL_213;
        case 192:
        case 210:
          v87 = 66;
          goto LABEL_213;
        case 193:
        case 211:
          v87 = 67;
          goto LABEL_213;
        case 194:
        case 212:
          v87 = 68;
          goto LABEL_213;
        case 195:
        case 213:
          v87 = 69;
          goto LABEL_213;
        case 196:
        case 214:
          v87 = 70;
          goto LABEL_213;
        case 197:
        case 215:
          v87 = 71;
          goto LABEL_213;
        case 198:
        case 216:
          v87 = 72;
          goto LABEL_213;
        case 199:
        case 217:
          v87 = 73;
          goto LABEL_213;
        case 200:
        case 218:
          v87 = 74;
          goto LABEL_213;
        case 240:
        case 241:
          v87 = 75;
          goto LABEL_213;
        case 250:
          v87 = 54;
          goto LABEL_213;
        case 252:
          v87 = 53;
          goto LABEL_213;
        case 253:
        case 261:
          v87 = 56;
          goto LABEL_213;
        case 260:
          v87 = 55;
          goto LABEL_213;
        case 552:
        case 553:
        case 554:
        case 555:
        case 631:
        case 632:
          v87 = 76;
          goto LABEL_213;
        case 642:
          v87 = 79;
          goto LABEL_213;
        case 643:
          v87 = 77;
          goto LABEL_213;
        case 644:
          v87 = 80;
          goto LABEL_213;
        case 645:
          v87 = 78;
LABEL_213:
          v88 = &v69[v87 + 37];
          do
            v89 = __ldaxr(v88);
          while (__stlxr(v89 + 1, v88));
          break;
        default:
          break;
      }
      v90 = v69 + 16;
      if ((v99 & 2) != 0)
        v91 = 12;
      else
        v91 = qword_232D77F60[v98];
      v92 = &v90[v91];
      do
        v93 = __ldaxr(v92);
      while (__stlxr(v93 + 1, v92));
      if (*(_DWORD *)(v109->super._bytesPerRow + 236))
      {
        v94 = &v90[v72];
        do
          v95 = __ldaxr(v94);
        while (__stlxr(v95 + 1, v94));
      }
    }
    *(_QWORD *)((char *)&v109->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x24BE51650]) = *(_QWORD *)((_BYTE *)&v109->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x24BE51650]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v31) = 1;
  }
  return (char)v31;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4
{
  return -[AGXA10FamilyTexture initImplWithTexture:pixelFormat:resourceIndex:](self, "initImplWithTexture:pixelFormat:resourceIndex:", a3, a4, 0);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  return -[AGXA10FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, 0);
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6
{
  return -[AGXA10FamilyTexture initImplWithCompressedTexture:pixelFormat:textureType:level:resourceIndex:](self, "initImplWithCompressedTexture:pixelFormat:textureType:level:resourceIndex:", a3, a4, a5, a6, 0);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[AGXA10FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5, a6.location, a6.length, a7.location, a7.length, v9, 0);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  return -[AGXA10FamilyTexture initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:](self, "initImplWithTexture:pixelFormat:textureType:levels:slices:resourceIndex:", 0, *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE51658]) * *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE51680]), a5);
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 resourceIndex:(unint64_t)a8
{
  uint64_t v8;
  void *v9;
  int location;
  unsigned int v15;
  uint32x2_t v16;
  int v17;
  unint64_t bytesPerRow;
  uint64_t v19;
  _QWORD *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  uint64_t v37;

  v8 = *((_QWORD *)a3 + 67);
  if (*(_QWORD *)(v8 + 48) == 3)
  {
LABEL_2:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  location = a6.location;
  if (a5 - 5 >= 2)
    v15 = 1;
  else
    v15 = 6;
  v9 = malloc_type_calloc(0x1C0uLL, 1uLL, 0x5CAE185BuLL);
  self->super._bytesPerRow = (unint64_t)v9;
  if (v9)
  {
    if (*(_BYTE *)(v8 + 240))
      v17 = 0;
    else
      v17 = *(_DWORD *)(v8 + 236);
    LODWORD(v37) = v17;
    *(_QWORD *)AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)v9, *(MTLPixelFormat *)(v8 + 8), a5, (AGX::G9::TextureFormatTable *)a4, *(_QWORD *)(v8 + 40), *(_QWORD *)(v8 + 48), *(_QWORD *)(v8 + 56), *(_DWORD *)(v8 + 308), *(_DWORD *)(v8 + 192), *(_DWORD *)(v8 + 196), v16, *(_DWORD *)(v8 + 128), *(_DWORD *)(v8 + 132), *(_DWORD *)(v8 + 136), *(_DWORD *)(v8 + 140), __SPAIR64__(LODWORD(a7.length) / v15, *(_DWORD *)(v8 + 112)), *(_QWORD *)(v8 + 152), v37, *(_QWORD *)(v8 + 160),
                 *(_QWORD *)(v8 + 168),
                 HIDWORD(*(_QWORD *)(v8 + 168)),
                 *(_QWORD *)(v8 + 176),
                 *(_QWORD *)(v8 + 184),
                 HIDWORD(*(_QWORD *)(v8 + 184)),
                 *(_BYTE *)(v8 + 144) + location,
                 (unsigned __int16)(*(_WORD *)(v8 + 144) + location) >> 8,
                 (*(_DWORD *)(v8 + 144) + location) >> 16) = off_250402690;
    bytesPerRow = self->super._bytesPerRow;
    if (!*(_BYTE *)(bytesPerRow + 200))
      goto LABEL_2;
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51698]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (*(_BYTE *)(bytesPerRow + 16))
    {
      v19 = 0;
    }
    else if (*(_BYTE *)(bytesPerRow + 232))
    {
      v19 = *(_QWORD *)(bytesPerRow + 320);
    }
    else
    {
      v19 = *(unsigned int *)(bytesPerRow + 236);
      if (!(_DWORD)v19)
      {
        v20 = (_QWORD *)(bytesPerRow + 380);
        v21 = *(unsigned __int8 *)(bytesPerRow + 380);
        v22 = *(unsigned __int8 *)(bytesPerRow + 381);
        v23 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>(bytesPerRow, 0);
        v24 = (*v20 >> 16) & 1;
        if (v22 == 1)
          v25 = WORD1(*v20) & 1;
        else
          v25 = 0;
        if (v22 != 2)
          LODWORD(v24) = 0;
        if ((v25 & 1) != 0)
          LODWORD(v24) = 1;
        if ((v22 - 3) >= 2)
          v26 = v24;
        else
          v26 = 1;
        v27 = (v23 & 0xFFFFFFFFFFFFC000) != 0 && v21 == 1;
        v28 = v27;
        v27 = (v28 & v26) == 0;
        v29 = 64;
        if (!v27)
          v29 = 0x4000;
        if (v21)
          v19 = v29;
        else
          v19 = 16;
      }
    }
    -[AGXTexture set_alignment:](self, "set_alignment:", v19);
    -[AGXTexture set_cpuSizeBytes:](self, "set_cpuSizeBytes:", *(_QWORD *)(self->super._bytesPerRow + 352));
    -[AGXTexture set_bytesPerRow:](self, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Op)0>(self->super._bytesPerRow, 0));
    if (*(_DWORD *)(*(_QWORD *)(v8 + 208) + 28) == *(_DWORD *)(*(_QWORD *)(self->super._bytesPerRow + 208) + 28))
      v30 = 0x4000000000000001;
    else
      v30 = 0xC000000000000000;
    v31 = objc_msgSend(a3, "device");
    v32 = (unint64_t *)(v31 + 816);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 | v30, v32));
    v34 = (unint64_t *)(v31 + 824);
    do
      v35 = __ldaxr(v34);
    while (__stlxr(v35, v34));
    *(_QWORD *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x24BE51650]) = *(_QWORD *)((_BYTE *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x24BE51650]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (BOOL)initImplWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 resourceIndex:(unint64_t)a7
{
  AGXA10FamilyTexture *v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v13;
  BOOL v14;
  int v17;
  unsigned int v18;
  unsigned int v19;
  objc_class *v20;
  uint64_t v21;
  unsigned int v23;
  int v27;
  unsigned int v28;
  objc_class *v29;
  uint32x2_t v30;
  int v31;
  uint64_t bytesPerRow;
  int v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  int v39;
  uint64_t v40;
  char v41;
  int v42;
  _BOOL4 v44;
  uint64_t v46;

  v7 = self;
  LOBYTE(self) = 0;
  if (a5 != 2)
    return (char)self;
  if (a4 != 123)
    return (char)self;
  v8 = *((_QWORD *)a3 + 67);
  if (!*(_BYTE *)(v8 + 316))
    return (char)self;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51690]) = (Class)123;
  v9 = *(_DWORD *)(v8 + 144) + a6;
  v10 = *(_DWORD *)(v8 + 64);
  v11 = *(_QWORD *)(v8 + 32) - 250;
  if (v11 > 0xB || ((1 << (*(_BYTE *)(v8 + 32) + 6)) & 0xC0D) == 0)
  {
    v13 = *(_DWORD *)(v8 + 128);
LABEL_20:
    v18 = v13;
    goto LABEL_21;
  }
  v13 = *(_DWORD *)(v8 + 128);
  v14 = v13 >= 0x20 && *(_DWORD *)(v8 + 132) > 0x1Fu;
  if (v14 || (*(_QWORD *)(v8 + 40) & 5) != 4 || v10 > 1)
    goto LABEL_20;
  v17 = -1 << *(_BYTE *)(*(_QWORD *)(v8 + 208) + 48);
  v18 = (v13 + ~v17) & v17;
LABEL_21:
  v19 = v18 >> v9;
  if (v19 <= 1)
    v19 = 1;
  v20 = (objc_class *)((*(_DWORD *)(v8 + 216) + v19 - 1) / *(_DWORD *)(v8 + 216));
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE516A8]) = v20;
  v14 = v11 > 0xB;
  v21 = (1 << v11) & 0xC0D;
  if (v14 || v21 == 0)
  {
    v23 = *(_DWORD *)(v8 + 132);
  }
  else
  {
    v23 = *(_DWORD *)(v8 + 132);
    if ((v13 < 0x20 || v23 <= 0x1F) && (*(_QWORD *)(v8 + 40) & 5) == 4 && v10 <= 1)
    {
      v27 = -1 << *(_BYTE *)(*(_QWORD *)(v8 + 208) + 48);
      v23 = (v23 + ~v27) & v27;
    }
  }
  v28 = v23 >> v9;
  if (v28 <= 1)
    v28 = 1;
  v29 = (objc_class *)((*(_DWORD *)(v8 + 220) + v28 - 1) / *(_DWORD *)(v8 + 220));
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51668]) = v29;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51678]) = (Class)1;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51660]) = (Class)1;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51658]) = (Class)1;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51698]) = (Class)1;
  *(Class *)((char *)&v7->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE516A0]) = (Class)2;
  self = (AGXA10FamilyTexture *)malloc_type_calloc(0x1C0uLL, 1uLL, 0xD6571D39uLL);
  v7->super._bytesPerRow = (unint64_t)self;
  if (self)
  {
    if (*(_BYTE *)(v8 + 240))
      v31 = 0;
    else
      v31 = *(_DWORD *)(v8 + 236);
    LODWORD(v46) = v31;
    *(_QWORD *)AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)self, *(MTLPixelFormat *)(v8 + 8), 2, (AGX::G9::TextureFormatTable *)0x7B, *(_QWORD *)(v8 + 40), *(_QWORD *)(v8 + 48), 2, *(_DWORD *)(v8 + 308), *(_DWORD *)(v8 + 192), *(_DWORD *)(v8 + 196), v30, v20, v29, 1u, 1, 0x100000001, *(_QWORD *)(v8 + 152), v46, *(_QWORD *)(v8 + 160),
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0) = off_250402690;
    bytesPerRow = v7->super._bytesPerRow;
    if (*(_BYTE *)(bytesPerRow + 200))
    {
      v33 = *(unsigned __int8 *)(v8 + 232);
      *(_BYTE *)(bytesPerRow + 232) = v33;
      if (v33)
      {
        v34 = *(_OWORD *)(v8 + 242);
        *(_QWORD *)(bytesPerRow + 258) = *(_QWORD *)(v8 + 258);
        *(_OWORD *)(bytesPerRow + 242) = v34;
        v35 = *(_OWORD *)(v8 + 266);
        *(_QWORD *)(bytesPerRow + 282) = *(_QWORD *)(v8 + 282);
        *(_OWORD *)(bytesPerRow + 266) = v35;
        bytesPerRow = v7->super._bytesPerRow;
      }
      if (*(_BYTE *)(bytesPerRow + 16))
      {
        v36 = 0;
      }
      else if (*(_BYTE *)(bytesPerRow + 232))
      {
        v36 = *(_QWORD *)(bytesPerRow + 320);
      }
      else
      {
        v36 = *(unsigned int *)(bytesPerRow + 236);
        if (!(_DWORD)v36)
        {
          v37 = (_QWORD *)(bytesPerRow + 380);
          v38 = *(unsigned __int8 *)(bytesPerRow + 380);
          v39 = *(unsigned __int8 *)(bytesPerRow + 381);
          v40 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>(bytesPerRow, 0);
          if (v39 == 1)
            v41 = WORD1(*v37) & 1;
          else
            v41 = 0;
          v42 = 1;
          if ((v39 - 3) >= 2 && (v41 & 1) == 0)
          {
            if (v39 == 2)
              v42 = (*v37 >> 16) & 1;
            else
              v42 = 0;
          }
          if (v38)
          {
            v44 = (v40 & 0xFFFFFFFFFFFFC000) != 0 && v38 == 1;
            if ((v44 & v42) != 0)
              v36 = 0x4000;
            else
              v36 = 64;
          }
          else
          {
            v36 = 16;
          }
        }
      }
      -[AGXTexture set_alignment:](v7, "set_alignment:", v36);
      -[AGXTexture set_cpuSizeBytes:](v7, "set_cpuSizeBytes:", *(_QWORD *)(v7->super._bytesPerRow + 352));
      -[AGXTexture set_bytesPerRow:](v7, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Op)0>(v7->super._bytesPerRow, 0));
      *(_QWORD *)((char *)&v7->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                + (int)*MEMORY[0x24BE51650]) = *(_QWORD *)((_BYTE *)&v7->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                         + (int)*MEMORY[0x24BE51650]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
      LOBYTE(self) = 1;
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (BOOL)initImplWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7 swizzle:(unsigned int)a8 resourceIndex:(unint64_t)a9
{
  uint64_t v9;
  void *v10;
  int location;
  unsigned int v15;
  uint32x2_t v16;
  int v17;
  unint64_t bytesPerRow;
  uint64_t v19;
  _QWORD *v20;
  int v21;
  int v22;
  uint64_t v23;
  char v24;
  int v25;
  _BOOL4 v27;
  uint64_t v29;

  v9 = *((_QWORD *)a3 + 67);
  if (*(_QWORD *)(v9 + 48) == 3)
  {
LABEL_2:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  location = a6.location;
  if (a5 - 5 >= 2)
    v15 = 1;
  else
    v15 = 6;
  v10 = malloc_type_calloc(0x1C0uLL, 1uLL, 0x2041FA06uLL);
  self->super._bytesPerRow = (unint64_t)v10;
  if (v10)
  {
    if (*(_BYTE *)(v9 + 240))
      v17 = 0;
    else
      v17 = *(_DWORD *)(v9 + 236);
    LODWORD(v29) = v17;
    *(_QWORD *)AGX::TextureGen2<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::TextureGen2((uint64_t)v10, *(MTLPixelFormat *)(v9 + 8), a5, (AGX::G9::TextureFormatTable *)a4, *(_QWORD *)(v9 + 40), *(_QWORD *)(v9 + 48), *(_QWORD *)(v9 + 56), *(_DWORD *)(v9 + 308), *(_DWORD *)(v9 + 192), a8, v16, *(_DWORD *)(v9 + 128), *(_DWORD *)(v9 + 132), *(_DWORD *)(v9 + 136), *(_DWORD *)(v9 + 140), __SPAIR64__(LODWORD(a7.length) / v15, *(_DWORD *)(v9 + 112)), *(_QWORD *)(v9 + 152), v29, *(_QWORD *)(v9 + 160),
                 *(_QWORD *)(v9 + 168),
                 HIDWORD(*(_QWORD *)(v9 + 168)),
                 *(_QWORD *)(v9 + 176),
                 *(_QWORD *)(v9 + 184),
                 HIDWORD(*(_QWORD *)(v9 + 184)),
                 *(_BYTE *)(v9 + 144) + location,
                 (unsigned __int16)(*(_WORD *)(v9 + 144) + location) >> 8,
                 (*(_DWORD *)(v9 + 144) + location) >> 16) = off_250402690;
    bytesPerRow = self->super._bytesPerRow;
    if (!*(_BYTE *)(bytesPerRow + 200))
      goto LABEL_2;
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51698]) = (Class)*(unsigned int *)(bytesPerRow + 112);
    if (*(_BYTE *)(bytesPerRow + 16))
    {
      v19 = 0;
    }
    else if (*(_BYTE *)(bytesPerRow + 232))
    {
      v19 = *(_QWORD *)(bytesPerRow + 320);
    }
    else
    {
      v19 = *(unsigned int *)(bytesPerRow + 236);
      if (!(_DWORD)v19)
      {
        v20 = (_QWORD *)(bytesPerRow + 380);
        v21 = *(unsigned __int8 *)(bytesPerRow + 380);
        v22 = *(unsigned __int8 *)(bytesPerRow + 381);
        v23 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getMipmapSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>(bytesPerRow, 0);
        if (v22 == 1)
          v24 = WORD1(*v20) & 1;
        else
          v24 = 0;
        v25 = 1;
        if ((v22 - 3) >= 2 && (v24 & 1) == 0)
        {
          if (v22 == 2)
            v25 = (*v20 >> 16) & 1;
          else
            v25 = 0;
        }
        if (v21)
        {
          v27 = (v23 & 0xFFFFFFFFFFFFC000) != 0 && v21 == 1;
          if ((v27 & v25) != 0)
            v19 = 0x4000;
          else
            v19 = 64;
        }
        else
        {
          v19 = 16;
        }
      }
    }
    -[AGXTexture set_alignment:](self, "set_alignment:", v19);
    -[AGXTexture set_cpuSizeBytes:](self, "set_cpuSizeBytes:", *(_QWORD *)(self->super._bytesPerRow + 352));
    -[AGXTexture set_bytesPerRow:](self, "set_bytesPerRow:", AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getStride<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)1,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Units)0,(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::Op)0>(self->super._bytesPerRow, 0));
    *(_QWORD *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
              + (int)*MEMORY[0x24BE51650]) = *(_QWORD *)((_BYTE *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque
                                                       + (int)*MEMORY[0x24BE51650]) & 0x1FFFFFFFFFFFFFFFLL | 0x4000000000000000;
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (void)getBytes:(void *)a3 bytesPerRow:(unint64_t)a4 bytesPerImage:(unint64_t)a5 fromRegion:(id *)a6 mipmapLevel:(unint64_t)a7 slice:(unint64_t)a8
{
  AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::readRegion(self->super._bytesPerRow, a6->var0.var0, a6->var0.var1, a6->var0.var2, a6->var1.var0, a6->var1.var1, a6->var1.var2, a8, a7, (unsigned __int8 *)a3, a4, a5);
}

- (void)replaceRegion:(id *)a3 mipmapLevel:(unint64_t)a4 slice:(unint64_t)a5 withBytes:(const void *)a6 bytesPerRow:(unint64_t)a7 bytesPerImage:(unint64_t)a8
{
  AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::writeRegion(self->super._bytesPerRow, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var1.var0, a3->var1.var1, a3->var1.var2, a5, a4, (unsigned __int8 *)a6, a7, a8);
}

- (void)updateBindDataWithAddresses:(void *)a3 cpuMetadataAddress:(void *)a4 gpuVirtualAddress:(unint64_t)a5 isCompressible:(BOOL)a6 shouldInitMetadata:(BOOL)a7
{
  unint64_t bytesPerRow;
  _QWORD *v11;

  if (a6)
  {
    bytesPerRow = self->super._bytesPerRow;
    if (*(_QWORD *)(bytesPerRow + 168) && (IOSurfaceGetSliceCount() & 0xFFFFFFFELL) != 0)
    {
      IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane();
      IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane();
    }
    else
    {
      AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getPlaneSize<(AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::View)0>(bytesPerRow, 0);
    }
  }
  v11 = (_QWORD *)self->super._bytesPerRow;
  v11[37] = a3;
  v11[9] = a5;
  (*(void (**)(_QWORD *))(*v11 + 16))(v11);
}

- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4 shouldInitMetadata:(BOOL)a5
{
  -[AGXA10FamilyTexture updateBindDataWithAddresses:cpuMetadataAddress:gpuVirtualAddress:isCompressible:shouldInitMetadata:](self, "updateBindDataWithAddresses:cpuMetadataAddress:gpuVirtualAddress:isCompressible:shouldInitMetadata:", a3, 0, a4, 0, a5);
}

- (void)updateBindDataWithAddresses:(void *)a3 gpuVirtualAddress:(unint64_t)a4
{
  -[AGXA10FamilyTexture updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:](self, "updateBindDataWithAddresses:gpuVirtualAddress:shouldInitMetadata:", a3, a4, 1);
}

- (void)updateBindDataWithTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 levels:(_NSRange)a6 slices:(_NSRange)a7
{
  uint64_t v7;
  uint64_t v8;
  unint64_t bytesPerRow;
  AGXA10FamilyTexture *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  AGXA10FamilyTexture *v14;
  int64_t CPUPtr;
  int64_t v16;
  int64_t GPUVirtualAddress;
  int64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  unsigned int v25;
  int64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;

  v7 = *((_QWORD *)a3 + 67);
  v8 = *(_QWORD *)(v7 + 32);
  bytesPerRow = self->super._bytesPerRow;
  if (*(_DWORD *)(*(_QWORD *)(bytesPerRow + 208) + 24) >= 2u
    && *(_DWORD *)(bytesPerRow + 376) * *(_DWORD *)(bytesPerRow + 368) != *(_DWORD *)(v7 + 376) * *(_DWORD *)(v7 + 368))
  {
    v10 = self;
    v28 = *(_QWORD *)(v7 + 32);
    v29 = a4;
    v11 = 0;
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = v10;
      CPUPtr = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(v7, a7.location, 0, v13);
      v16 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(v7, a7.location, 0, v13 - 1);
      GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v7, a7.location, 0, 0, v13);
      v18 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v7, a7.location, 0, 0, v13 - 1);
      v19 = CPUPtr - v16;
      v10 = v14;
      v11 += v19;
      v12 += GPUVirtualAddress - v18;
      v20 = (_QWORD *)v14->super._bytesPerRow;
      v21 = *(unsigned int *)(v20[26] + 24);
      ++v13;
    }
    while (v13 < v21);
    if (v21 >= 2)
    {
      v22 = v21 - 1;
      v23 = v20 + 43;
      do
      {
        *(v23 - 1) = v12;
        *v23++ = v11;
        --v22;
      }
      while (v22);
    }
    (*(void (**)(_QWORD *))(*v20 + 16))(v20);
    bytesPerRow = v14->super._bytesPerRow;
    v8 = v28;
    a4 = v29;
  }
  v25 = a4 == 261 && v8 != 261;
  v26 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(v7, a7.location, 0, v25);
  v27 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v7, a7.location, 0, 0, v25);
  *(_QWORD *)(bytesPerRow + 296) = v26;
  *(_QWORD *)(bytesPerRow + 72) = v27;
  (*(void (**)(unint64_t))(*(_QWORD *)bytesPerRow + 16))(bytesPerRow);
}

- (BOOL)updateBindDataWithCompressedTexture:(id)a3 pixelFormat:(unint64_t)a4 textureType:(unint64_t)a5 level:(unint64_t)a6 slice:(unint64_t)a7
{
  unsigned int v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int64_t GPUVirtualAddress;
  unint64_t v13;
  _QWORD *bytesPerRow;

  v7 = a7;
  v9 = *((_QWORD *)a3 + 67);
  v10 = *(_DWORD *)(v9 + 144);
  v11 = (v10 + a6);
  GPUVirtualAddress = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getGPUVirtualAddress(v9, a7, v10 + (int)a6, 0, 0);
  v13 = (GPUVirtualAddress + 63) & 0xFFFFFFFFFFFFFFC0;
  if (GPUVirtualAddress == v13)
  {
    bytesPerRow = (_QWORD *)self->super._bytesPerRow;
    bytesPerRow[37] = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(v9, v7, v11, 0);
    bytesPerRow[9] = GPUVirtualAddress;
    (*(void (**)(_QWORD *))(*bytesPerRow + 16))(bytesPerRow);
  }
  return GPUVirtualAddress == v13;
}

- (void)initNewTextureData:(AGXNewTextureDataStruc *)a3
{
  unint64_t bytesPerRow;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  bytesPerRow = self->super._bytesPerRow;
  v4 = a3->var1.var1 & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(bytesPerRow + 232);
  a3->var1.var1 = v4;
  v5 = v4 & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)*(unsigned __int8 *)(bytesPerRow + 316) << 12);
  a3->var1.var1 = v5;
  v6 = v5 & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)((unint64_t)*(unsigned __int8 *)(bytesPerRow + 381) << 8 == 1024) << 13);
  a3->var1.var1 = v6;
  v7 = v6 & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)((unint64_t)*(unsigned __int8 *)(bytesPerRow + 381) << 8 == 768) << 14);
  a3->var1.var1 = v7;
  v8 = v7 & 0xFFFFFFFFFFFFFF8FLL | (16 * (*(_BYTE *)(*(_QWORD *)(bytesPerRow + 208) + 48) & 7));
  a3->var1.var1 = v8;
  if ((*(_BYTE *)(bytesPerRow + 382) & 2) != 0)
  {
    v10 = *(_DWORD *)(bytesPerRow + 112);
    v11 = (-2 * __clz(v10 - 1)) & 0xE;
    if (v10 >= 2)
      v9 = v11;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v12 = v9 | v8 & 0xFFFFFFFFFFFFFFF1;
  a3->var1.var1 = v12;
  v13 = *(_QWORD *)(bytesPerRow + 208);
  if (*(_DWORD *)(v13 + 24) < 2u)
    v14 = 0;
  else
    v14 = (unint64_t)(*(_DWORD *)(v13 + 80) != 0) << 7;
  v15 = v14 | v12 & 0xFFFFFFFFFFFFFF7FLL;
  a3->var1.var1 = v15;
  v16 = v15 & 0xFFFFFFFFFFFFFCFFLL | ((((unint64_t)((*(unsigned __int8 *)(*(_QWORD *)(bytesPerRow + 208) + 88) << 8)
                                                         + 768) >> 8) & 3) << 8);
  a3->var1.var1 = v16;
  v17 = v16 & 0xFFFFFFFFFFFFF3FFLL | ((((unint64_t)((*(unsigned __int8 *)(*(_QWORD *)(bytesPerRow + 208) + 89) << 10)
                                                         + 3072) >> 10) & 3) << 10);
  a3->var1.var1 = v17;
  v18 = v17 & 0xFFFFFFFFFFF87FFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 216) & 0xF) << 15);
  a3->var1.var1 = v18;
  v19 = v18 & 0xFFFFFFFFFF87FFFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 220) & 0xF) << 19);
  a3->var1.var1 = v19;
  a3->var1.var1 = v19 & 0xFFFFFFFC787FFFFFLL | ((unint64_t)(*(_DWORD *)(bytesPerRow + 64) & 0xF) << 23) | 0x80000000;
}

- (BOOL)canGenerateMipmapLevels
{
  BOOL result;
  unint64_t bytesPerRow;
  uint64_t v5;

  result = 0;
  bytesPerRow = self->super._bytesPerRow;
  v5 = *(_QWORD *)(bytesPerRow + 380);
  if ((_BYTE)v5 && (v5 & 0xFF00) != 0x300)
    return !*(_BYTE *)(bytesPerRow + 232)
        && !*(_DWORD *)(bytesPerRow + 236)
        && *(_DWORD *)(*(_QWORD *)(bytesPerRow + 208) + 24) == 1
        && AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getDownsampleFunc(*(_QWORD *)(bytesPerRow + 32)) != 0;
  return result;
}

- (void)generateMipmapLevel:(unint64_t)a3 slice:(unint64_t)a4
{
  unsigned int v4;
  unint64_t bytesPerRow;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int64_t CPUPtr;
  int64_t v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  int v33;
  int i;
  int v35;
  int v36;
  int v37;
  char v38;
  void *DownsampleFunc;

  v4 = a4;
  bytesPerRow = self->super._bytesPerRow;
  v6 = *(_DWORD *)(bytesPerRow + 144);
  v7 = (v6 + a3);
  v8 = *(_DWORD *)(bytesPerRow + 128);
  v9 = *(_DWORD *)(bytesPerRow + 132);
  v10 = v8 >> (v6 + a3 - 1);
  v11 = v9 >> (v6 + a3 - 1);
  DownsampleFunc = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getDownsampleFunc(*(_QWORD *)(bytesPerRow + 32));
  CPUPtr = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(bytesPerRow, v4, v7, 0);
  v13 = AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::getCPUPtr(bytesPerRow, v4, (v7 - 1), 0);
  if (AGX::Texture<(AGXTextureMemoryLayout)1,AGX::G9::Encoders,AGX::G9::Classes>::isLevelTiled(bytesPerRow, v7 - 1))
  {
    v16 = 0;
    if (v11 <= 1)
      v17 = 1;
    else
      v17 = v11;
    if (v10 <= 1)
      v18 = 1;
    else
      v18 = v10;
    v19 = 128;
    v20 = 128;
    v21 = 0;
    v22 = 0;
    switch(*(_BYTE *)(*(_QWORD *)(bytesPerRow + 208) + 88))
    {
      case 1:
        goto LABEL_27;
      case 2:
        v19 = 64;
        goto LABEL_27;
      case 3:
      case 5:
      case 6:
      case 7:
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xE:
      case 0xF:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x16:
      case 0x17:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
      case 0x1C:
      case 0x1D:
      case 0x1E:
      case 0x1F:
        goto LABEL_29;
      case 4:
        v19 = 64;
        v20 = 64;
        goto LABEL_27;
      case 8:
        v20 = 64;
        v19 = 32;
        goto LABEL_27;
      case 0x10:
        v19 = 32;
        v20 = 32;
        goto LABEL_27;
      case 0x20:
        v20 = 32;
        v19 = 16;
LABEL_27:
        v16 = v19 < v20;
        if (v20 > v17)
          return;
        v14 = v18 / v19;
        v21 = v20;
        v22 = v19;
        v15 = v17 / v20;
LABEL_29:
        v27 = 33 - __clz(v14 - 1);
        if (v14 <= 1)
          LOBYTE(v27) = 1;
        v38 = v27;
        if (v22 <= v18)
        {
          v28 = v22 >> 1;
          v29 = v21 >> 1;
          if (v14 <= 1)
            v30 = 1;
          else
            v30 = v14;
          if (v15 <= 1)
            v31 = 1;
          else
            v31 = v15;
          v37 = v31;
          v32 = 0;
          if (v16)
          {
            do
            {
              v33 = 0;
              for (i = 0; i != v30; ++i)
              {
                ((void (*)(unint64_t, int64_t, uint64_t, uint64_t, _QWORD, _QWORD))DownsampleFunc)(CPUPtr + ((unint64_t)(v33 & 0xFFFFFFFC | (v32 >> 1 << v38) | i & 1 | (2 * (v32 & 1))) << 12), v13, v28, v29, 0, 0);
                v13 += 0x4000;
                v33 += 2;
              }
              ++v32;
            }
            while (v32 != v37);
          }
          else
          {
            do
            {
              v35 = 0;
              v36 = v30;
              do
              {
                ((void (*)(unint64_t, int64_t, uint64_t, uint64_t, _QWORD, _QWORD))DownsampleFunc)(CPUPtr + ((unint64_t)(v35 & 0xFFFFFFFC | (v32 >> 1 << v38) | v35 & 2 | v32 & 1) << 12), v13, v28, v29, 0, 0);
                v13 += 0x4000;
                v35 += 2;
                --v36;
              }
              while (v36);
              ++v32;
            }
            while (v32 != v37);
          }
        }
        break;
      default:
        v21 = 0;
        v22 = 0;
        goto LABEL_29;
    }
  }
  else
  {
    if (v9 >> v7 <= 1)
      v23 = 1;
    else
      v23 = v9 >> v7;
    if (v8 >> v7 <= 1)
      v24 = 1;
    else
      v24 = v8 >> v7;
    v26 = v10 < 2 || v11 < 2;
    ((void (*)(int64_t, int64_t, uint64_t, uint64_t, _BOOL8, _QWORD))DownsampleFunc)(CPUPtr, v13, v24, v23, v26, 0);
  }
}

- (unint64_t)colorSpaceConversionMatrix
{
  unint64_t result;

  result = 0;
  switch(*(_DWORD *)(self->super._bytesPerRow + 308))
  {
    case 1:
      result = 5;
      break;
    case 2:
      result = 7;
      break;
    case 3:
      result = 6;
      break;
    case 4:
      result = 8;
      break;
    case 5:
      result = 9;
      break;
    case 6:
      result = 10;
      break;
    case 0x1C:
      result = 1;
      break;
    case 0x1D:
      result = 2;
      break;
    case 0x1E:
      result = 3;
      break;
    case 0x1F:
      result = 4;
      break;
    default:
      return result;
  }
  return result;
}

- (unint64_t)sparseSurfaceDefaultValue
{
  return 0;
}

- (unint64_t)tailSize
{
  return 0;
}

- (unint64_t)tailSizeInBytes
{
  return 0;
}

- (unint64_t)firstMipmapInTail
{
  return 0;
}

- (BOOL)isSparse
{
  return *(_DWORD *)(self->super._bytesPerRow + 236) != 0;
}

- (BOOL)isMemoryless
{
  return *(_QWORD *)(self->super._bytesPerRow + 48) == 3;
}

- (BOOL)validateBufferTextureWithSize:(unint64_t)a3
{
  unint64_t bytesPerRow;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  bytesPerRow = self->super._bytesPerRow;
  if (!*(_BYTE *)(bytesPerRow + 392))
    return 1;
  v4 = *(_QWORD *)(bytesPerRow + 352);
  if (v4 + 16 > a3)
    return 0;
  v6 = *(_QWORD *)(bytesPerRow + 296);
  if (v6
    && ((v7 = (uint64_t *)(v6 + v4), v9 = *v7, v8 = v7[1], v9 == 0xF4AA93D1F315E8AELL)
      ? (v10 = v8 == 0x6B4DC612A90E09F1)
      : (v10 = 0),
        !v10))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

- (unint64_t)uniqueIdentifier
{
  return self->super._bytesPerRow;
}

- (int64_t)compressionFeedback
{
  return 4;
}

- (unint64_t)compressionFootprint
{
  if (*(unsigned __int8 *)(self->super._bytesPerRow + 57) - 1 < 3)
    return (*(_BYTE *)(self->super._bytesPerRow + 57) - 1) + 1;
  else
    return 0;
}

- (void)finalizeTextureCreation
{
  unint64_t bytesPerRow;
  uint64_t v4;
  char *v5;
  AGXA10FamilyTexture *v6;
  uint64_t v7;
  char *v8;

  bytesPerRow = self->super._bytesPerRow;
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE51670]) = 0;
  v4 = (int)*MEMORY[0x24BE51650];
  v5 = (char *)self + v4;
  if (*(_DWORD *)*MEMORY[0x24BE516B0])
  {
    IOGPUDeviceTraceEvent();
    bytesPerRow = self->super._bytesPerRow;
  }
  *(_DWORD *)(bytesPerRow + 124) = *((_DWORD *)v5 + 12);
  v6 = -[AGXTexture backingResource](self, "backingResource");
  v7 = *((_QWORD *)v5 + 2);
  if (v6 == self)
  {
    v8 = 0;
  }
  else
  {
    v7 |= 0x1000000000000000uLL;
    *((_QWORD *)v5 + 2) = v7;
    v8 = (char *)v6 + v4;
  }
  *(_QWORD *)v5 = v8;
  *((_QWORD *)v5 + 1) = *(_QWORD *)(self->super._bytesPerRow + 72);
  *((_QWORD *)v5 + 2) = v7 & 0xFF00000000000000 | *(_QWORD *)(self->super._bytesPerRow + 352) & 0xFFFFFFFFFFFFFFLL;
}

- (void)finalizeCompressedTextureViewCreation
{
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v3 = -[AGXTexture backingResource](self, "backingResource");
  v4 = (int)*MEMORY[0x24BE51650];
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  v6 = *(_QWORD *)((char *)&self->super.super.super.super.super.super._labelLock._os_unfair_lock_opaque + v4) | 0x1000000000000000;
  v5[2] = v6;
  *v5 = &v3[v4];
  v5[1] = *(_QWORD *)(self->super._bytesPerRow + 72);
  v5[2] = v6 & 0xFF00000000000000 | *(_QWORD *)(self->super._bytesPerRow + 352) & 0xFFFFFFFFFFFFFFLL;
  *(_DWORD *)(self->super._bytesPerRow + 124) = *(_DWORD *)((char *)&self->super.super.super._res.vendor.reserved[2] + v4);
}

- (unint64_t)resourceIndex
{
  return *MEMORY[0x24BDDD9D8];
}

@end
