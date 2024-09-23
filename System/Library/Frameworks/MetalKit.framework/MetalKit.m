void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_20AE3AE84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20AE3B344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_20AE3B590(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL reflectImage(void *a1, void *a2, vImagePixelCount a3, vImagePixelCount a4, size_t a5, uint64_t a6, uint64_t a7)
{
  vImage_Error v7;
  vImage_Buffer v9;
  vImage_Buffer src;

  src.data = a1;
  src.height = a4;
  src.width = a3;
  src.rowBytes = a5;
  v9.data = a2;
  v9.height = a4;
  v9.width = a3;
  v9.rowBytes = a5;
  if (a7 == 4)
  {
    switch(a6)
    {
      case 128:
        v7 = vImageVerticalReflect_ARGBFFFF(&src, &v9, 0);
        return v7 == 0;
      case 64:
        v7 = vImageVerticalReflect_ARGB16U(&src, &v9, 0);
        return v7 == 0;
      case 32:
        v7 = vImageVerticalReflect_ARGB8888(&src, &v9, 0);
        return v7 == 0;
    }
LABEL_11:
    v7 = 0;
    return v7 == 0;
  }
  if (a7 != 1)
    goto LABEL_11;
  if (a6 == 32)
  {
    v7 = vImageVerticalReflect_PlanarF(&src, &v9, 0);
    return v7 == 0;
  }
  if (a6 == 16)
  {
    v7 = vImageVerticalReflect_Planar16U(&src, &v9, 0);
    return v7 == 0;
  }
  if (a6 != 8)
    goto LABEL_11;
  v7 = vImageVerticalReflect_Planar8(&src, &v9, 0);
  return v7 == 0;
}

uint64_t _mtkLinkedOnOrAfter(unint64_t a1)
{
  if (a1 > 1)
    _mtkLinkedOnOrAfter_cold_1();
  return dyld_program_sdk_at_least();
}

uint64_t selectRGBPixelFormat(uint64_t result)
{
  if (result <= 132)
  {
    if (result <= 70)
    {
      if (result == 11)
      {
        return 10;
      }
      else if (result == 31)
      {
        return 30;
      }
    }
    else
    {
      switch(result)
      {
        case 71:
          return 70;
        case 81:
          return 80;
        case 131:
          return 130;
      }
    }
  }
  else
  {
    switch(result)
    {
      case 153:
        result = 152;
        break;
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 162:
      case 164:
      case 166:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 180:
      case 182:
      case 184:
        return result;
      case 161:
        result = 160;
        break;
      case 163:
        result = 162;
        break;
      case 165:
        result = 164;
        break;
      case 167:
        result = 166;
        break;
      case 179:
        result = 178;
        break;
      case 181:
        result = 180;
        break;
      case 183:
        result = 182;
        break;
      case 185:
        result = 203;
        break;
      case 186:
        result = 204;
        break;
      case 187:
        result = 205;
        break;
      case 188:
        result = 206;
        break;
      case 189:
        result = 207;
        break;
      case 190:
        result = 208;
        break;
      case 191:
        result = 209;
        break;
      case 192:
        result = 210;
        break;
      case 193:
        result = 211;
        break;
      case 194:
        result = 212;
        break;
      case 195:
        result = 213;
        break;
      case 196:
        result = 214;
        break;
      case 197:
        result = 215;
        break;
      case 198:
        result = 216;
        break;
      case 199:
        result = 217;
        break;
      case 200:
        result = 218;
        break;
      default:
        if (result == 133)
        {
          result = 132;
        }
        else if (result == 135)
        {
          result = 134;
        }
        break;
    }
  }
  return result;
}

uint64_t _mtkLinkedBefore(unint64_t a1)
{
  return _mtkLinkedOnOrAfter(a1) ^ 1;
}

void sub_20AE3E5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AE3E864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AE3EB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AE42FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AE43140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20AE449D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20AE44B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t selectSRGBFormat(uint64_t result)
{
  if (result <= 177)
  {
    if (result > 133)
    {
      switch(result)
      {
        case 160:
          result = 161;
          break;
        case 161:
        case 163:
        case 165:
          return result;
        case 162:
          result = 163;
          break;
        case 164:
          result = 165;
          break;
        case 166:
          result = 167;
          break;
        default:
          if (result == 134)
          {
            result = 135;
          }
          else if (result == 152)
          {
            result = 153;
          }
          break;
      }
    }
    else if (result > 79)
    {
      switch(result)
      {
        case 80:
          return 81;
        case 130:
          return 131;
        case 132:
          return 133;
      }
    }
    else
    {
      switch(result)
      {
        case 10:
          return 11;
        case 30:
          return 31;
        case 70:
          return 71;
      }
    }
  }
  else
  {
    switch(result)
    {
      case 178:
        result = 179;
        break;
      case 180:
        result = 181;
        break;
      case 182:
        result = 183;
        break;
      case 203:
        result = 185;
        break;
      case 204:
        result = 186;
        break;
      case 205:
        result = 187;
        break;
      case 206:
        result = 188;
        break;
      case 207:
        result = 189;
        break;
      case 208:
        result = 190;
        break;
      case 209:
        result = 191;
        break;
      case 210:
        result = 192;
        break;
      case 211:
        result = 193;
        break;
      case 212:
        result = 194;
        break;
      case 213:
        result = 195;
        break;
      case 214:
        result = 196;
        break;
      case 215:
        result = 197;
        break;
      case 216:
        result = 198;
        break;
      case 217:
        result = 199;
        break;
      case 218:
        result = 200;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t _newMTKTextureErrorWithCodeAndErrorString(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v6[0] = CFSTR("MTKTextureLoaderErrorKey");
  v6[1] = v3;
  v7[0] = a2;
  v7[1] = a2;
  v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  return objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MTKTextureLoaderErrorDomain"), a1, v4);
}

uint64_t _newMTKTextureErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MTKTextureLoaderErrorDomain"), a1, a2);
}

uint64_t _newMTKTextureErrorWithCode(uint64_t a1)
{
  return objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MTKTextureLoaderErrorDomain"), a1, 0);
}

uint64_t expandRGBToRGBA(char *__src, char *__dst, uint64_t a3, unint64_t a4, uint64_t a5, size_t __n, size_t a7, int a8)
{
  char *v8;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *i;
  char *v18;
  int __srca;

  __srca = a8;
  if (!__src)
    expandRGBToRGBA_cold_1();
  v8 = __dst;
  if (!__dst)
    expandRGBToRGBA_cold_2();
  if (a4)
  {
    v12 = __src;
    LODWORD(v13) = 0;
    v14 = 4 * a3 * a7;
    do
    {
      v15 = a3;
      v16 = v8;
      for (i = v12; v15; --v15)
      {
        memcpy(v16, i, __n);
        v18 = &v16[__n];
        i += __n;
        memcpy(v18, &__srca, a7);
        v16 = &v18[a7];
      }
      v12 += a5;
      v8 += v14;
      v13 = (v13 + 1);
    }
    while (v13 < a4);
  }
  return 1;
}

uint64_t arrayTextureTypeFromTextureType(unint64_t a1)
{
  if (a1 >= 0xA)
    arrayTextureTypeFromTextureType_cold_1();
  return qword_20AE4BFB0[a1];
}

MDLVertexFormat MTKModelIOVertexFormatFromMetal(MTLVertexFormat vertexFormat)
{
  if (vertexFormat - 1 > 0x34)
    return 0;
  else
    return qword_20AE4C038[vertexFormat - 1];
}

MTLVertexFormat MTKMetalVertexFormatFromModelIO(MDLVertexFormat vertexFormat)
{
  MTLVertexFormat result;
  BOOL v3;
  MTLVertexFormat v4;

  result = MTLVertexFormatInvalid;
  if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatUShortNormalizedBits)
  {
    if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatCharNormalizedBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatCharNormalized:
          result = MTLVertexFormatCharNormalized;
          break;
        case MDLVertexFormatChar2Normalized:
          result = MTLVertexFormatChar2Normalized;
          break;
        case MDLVertexFormatChar3Normalized:
          result = MTLVertexFormatChar3Normalized;
          break;
        case MDLVertexFormatChar4Normalized:
          result = MTLVertexFormatChar4Normalized;
          break;
        default:
          switch(vertexFormat)
          {
            case MDLVertexFormatUShort:
              result = MTLVertexFormatUShort;
              break;
            case MDLVertexFormatUShort2:
              result = MTLVertexFormatUShort2;
              break;
            case MDLVertexFormatUShort3:
              result = MTLVertexFormatUShort3;
              break;
            case MDLVertexFormatUShort4:
              result = MTLVertexFormatUShort4;
              break;
            default:
              switch(vertexFormat)
              {
                case MDLVertexFormatShort:
                  result = MTLVertexFormatShort;
                  break;
                case MDLVertexFormatShort2:
                  result = MTLVertexFormatShort2;
                  break;
                case MDLVertexFormatShort3:
                  result = MTLVertexFormatShort3;
                  break;
                case MDLVertexFormatShort4:
                  result = MTLVertexFormatShort4;
                  break;
                default:
                  return result;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatUChar:
          result = MTLVertexFormatUChar;
          break;
        case MDLVertexFormatUChar2:
          result = MTLVertexFormatUChar2;
          break;
        case MDLVertexFormatUChar3:
          result = MTLVertexFormatUChar3;
          break;
        case MDLVertexFormatUChar4:
          result = MTLVertexFormatUChar4;
          break;
        default:
          switch(vertexFormat)
          {
            case MDLVertexFormatChar:
              result = MTLVertexFormatChar;
              break;
            case MDLVertexFormatChar2:
              result = MTLVertexFormatChar2;
              break;
            case MDLVertexFormatChar3:
              result = MTLVertexFormatChar3;
              break;
            case MDLVertexFormatChar4:
              result = MTLVertexFormatChar4;
              break;
            default:
              switch(vertexFormat)
              {
                case MDLVertexFormatUCharNormalized:
                  result = MTLVertexFormatUCharNormalized;
                  break;
                case MDLVertexFormatUChar2Normalized:
                  result = MTLVertexFormatUChar2Normalized;
                  break;
                case MDLVertexFormatUChar3Normalized:
                  result = MTLVertexFormatUChar3Normalized;
                  break;
                case MDLVertexFormatUChar4Normalized:
                  result = MTLVertexFormatUChar4Normalized;
                  break;
                default:
                  return result;
              }
              break;
          }
          break;
      }
    }
  }
  else if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatIntBits)
  {
    if ((uint64_t)vertexFormat <= (uint64_t)MDLVertexFormatHalfBits)
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatInt:
          result = MTLVertexFormatInt;
          break;
        case MDLVertexFormatInt2:
          result = MTLVertexFormatInt2;
          break;
        case MDLVertexFormatInt3:
          result = MTLVertexFormatInt3;
          break;
        case MDLVertexFormatInt4:
          result = MTLVertexFormatInt4;
          break;
        default:
          v3 = vertexFormat == MDLVertexFormatInt1010102Normalized;
          v4 = MTLVertexFormatInt1010102Normalized;
LABEL_51:
          if (v3)
            result = v4;
          else
            result = MTLVertexFormatInvalid;
          break;
      }
    }
    else
    {
      switch(vertexFormat)
      {
        case MDLVertexFormatHalf:
          result = MTLVertexFormatHalf;
          break;
        case MDLVertexFormatHalf2:
          result = MTLVertexFormatHalf2;
          break;
        case MDLVertexFormatHalf3:
          result = MTLVertexFormatHalf3;
          break;
        case MDLVertexFormatHalf4:
          result = MTLVertexFormatHalf4;
          break;
        default:
          switch(vertexFormat)
          {
            case MDLVertexFormatFloat:
              result = MTLVertexFormatFloat;
              break;
            case MDLVertexFormatFloat2:
              result = MTLVertexFormatFloat2;
              break;
            case MDLVertexFormatFloat3:
              result = MTLVertexFormatFloat3;
              break;
            case MDLVertexFormatFloat4:
              result = MTLVertexFormatFloat4;
              break;
            default:
              return result;
          }
          break;
      }
    }
  }
  else if ((uint64_t)vertexFormat > (uint64_t)MDLVertexFormatUIntBits)
  {
    switch(vertexFormat)
    {
      case MDLVertexFormatUInt:
        result = MTLVertexFormatUInt;
        break;
      case MDLVertexFormatUInt2:
        result = MTLVertexFormatUInt2;
        break;
      case MDLVertexFormatUInt3:
        result = MTLVertexFormatUInt3;
        break;
      case MDLVertexFormatUInt4:
        result = MTLVertexFormatUInt4;
        break;
      default:
        v3 = vertexFormat == MDLVertexFormatUInt1010102Normalized;
        v4 = MTLVertexFormatUInt1010102Normalized;
        goto LABEL_51;
    }
  }
  else
  {
    switch(vertexFormat)
    {
      case MDLVertexFormatUShortNormalized:
        result = MTLVertexFormatUShortNormalized;
        break;
      case MDLVertexFormatUShort2Normalized:
        result = MTLVertexFormatUShort2Normalized;
        break;
      case MDLVertexFormatUShort3Normalized:
        result = MTLVertexFormatUShort3Normalized;
        break;
      case MDLVertexFormatUShort4Normalized:
        result = MTLVertexFormatUShort4Normalized;
        break;
      default:
        switch(vertexFormat)
        {
          case MDLVertexFormatShortNormalized:
            result = MTLVertexFormatShortNormalized;
            break;
          case MDLVertexFormatShort2Normalized:
            result = MTLVertexFormatShort2Normalized;
            break;
          case MDLVertexFormatShort3Normalized:
            result = MTLVertexFormatShort3Normalized;
            break;
          case MDLVertexFormatShort4Normalized:
            result = MTLVertexFormatShort4Normalized;
            break;
          default:
            return result;
        }
        break;
    }
  }
  return result;
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetalWithError(MTLVertexDescriptor *metalDescriptor, NSError **error)
{
  MTLVertexDescriptor *v3;
  id v4;
  unint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  MDLVertexFormat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v3 = metalDescriptor;
  v4 = objc_alloc_init(getMDLVertexDescriptorClass());
  for (i = 0; i != 31; ++i)
  {
    -[MTLVertexDescriptor attributes](v3, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "format");

    if (v8)
    {
      objc_msgSend(v4, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (i >= v10)
        MTKModelIOVertexDescriptorFromMetalWithError_cold_2(error);
      -[MTLVertexDescriptor attributes](v3, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MTKModelIOVertexFormatFromMetal((MTLVertexFormat)objc_msgSend(v12, "format"));

      if (v13 == MDLVertexFormatInvalid)
      {
        if (error)
        {
          _MTKModelErrorWithCodeAndErrorString(0, CFSTR("No compatible MDLVertexFormat format for MTLVertexAttribute format"));
          v37 = 0;
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }
        goto LABEL_16;
      }
      objc_msgSend(v4, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFormat:", v13);

      -[MTLVertexDescriptor attributes](v3, "attributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "bufferIndex");
      objc_msgSend(v4, "attributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBufferIndex:", v18);

      -[MTLVertexDescriptor attributes](v3, "attributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "offset");
      objc_msgSend(v4, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setOffset:", v23);

    }
  }
  for (j = 0; j != 31; ++j)
  {
    -[MTLVertexDescriptor layouts](v3, "layouts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", j);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "stride");

    if (v29)
    {
      objc_msgSend(v4, "layouts");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (j >= v31)
        MTKModelIOVertexDescriptorFromMetalWithError_cold_1(error);
      -[MTLVertexDescriptor layouts](v3, "layouts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", j);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "stride");
      objc_msgSend(v4, "layouts");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", j);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setStride:", v34);

    }
  }
  v37 = v4;
LABEL_16:

  return (MDLVertexDescriptor *)v37;
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetal(MTLVertexDescriptor *metalDescriptor)
{
  return MTKModelIOVertexDescriptorFromMetalWithError(metalDescriptor, 0);
}

MTLVertexDescriptor *__cdecl MTKMetalVertexDescriptorFromModelIOWithError(MDLVertexDescriptor *modelIODescriptor, NSError **error)
{
  MDLVertexDescriptor *v3;
  id v4;
  unint64_t i;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MTLVertexFormat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t j;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;

  v3 = modelIODescriptor;
  v4 = objc_alloc_init(MEMORY[0x24BDDD770]);
  for (i = 0; i != 31; ++i)
  {
    -[MDLVertexDescriptor attributes](v3, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (i >= v7)
      break;
    -[MDLVertexDescriptor attributes](v3, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "format");

    if (v10)
    {
      -[MDLVertexDescriptor attributes](v3, "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MTKMetalVertexFormatFromModelIO((MDLVertexFormat)objc_msgSend(v12, "format"));

      if (v13 == MTLVertexFormatInvalid)
      {
        if (error)
        {
          _MTKModelErrorWithCodeAndErrorString(0, CFSTR("No compatible MTLVertexFormat format for MDLVertexAttribute format"));
          v37 = 0;
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v37 = 0;
        }
        goto LABEL_13;
      }
      objc_msgSend(v4, "attributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFormat:", v13);

      -[MDLVertexDescriptor attributes](v3, "attributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "bufferIndex");
      objc_msgSend(v4, "attributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBufferIndex:", v18);

      -[MDLVertexDescriptor attributes](v3, "attributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "offset");
      objc_msgSend(v4, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setOffset:", v23);

    }
  }
  for (j = 0; j != 31; ++j)
  {
    -[MDLVertexDescriptor layouts](v3, "layouts");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (j >= v28)
      break;
    -[MDLVertexDescriptor layouts](v3, "layouts");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", j);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "stride");

    if (v31)
    {
      -[MDLVertexDescriptor layouts](v3, "layouts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", j);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "stride");
      objc_msgSend(v4, "layouts");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", j);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setStride:", v34);

    }
  }
  v37 = v4;
LABEL_13:

  return (MTLVertexDescriptor *)v37;
}

MTLVertexDescriptor *__cdecl MTKMetalVertexDescriptorFromModelIO(MDLVertexDescriptor *modelIODescriptor)
{
  return MTKMetalVertexDescriptorFromModelIOWithError(modelIODescriptor, 0);
}

Class initMDLSubmesh()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("MDLSubmesh");
  classMDLSubmesh = (uint64_t)result;
  getMDLSubmeshClass = (uint64_t (*)())MDLSubmeshFunction;
  return result;
}

id MDLSubmeshFunction()
{
  return (id)classMDLSubmesh;
}

Class initMDLMesh()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("MDLMesh");
  classMDLMesh = (uint64_t)result;
  getMDLMeshClass = (uint64_t (*)())MDLMeshFunction;
  return result;
}

id MDLMeshFunction()
{
  return (id)classMDLMesh;
}

Class initMDLVertexDescriptor()
{
  Class result;

  if (ModelIOLibrary_sOnce != -1)
    dispatch_once(&ModelIOLibrary_sOnce, &__block_literal_global_0);
  result = objc_getClass("MDLVertexDescriptor");
  classMDLVertexDescriptor = (uint64_t)result;
  getMDLVertexDescriptorClass = (uint64_t (*)())MDLVertexDescriptorFunction;
  return result;
}

id MDLVertexDescriptorFunction()
{
  return (id)classMDLVertexDescriptor;
}

void sub_20AE478F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t ComputeSequenceLengthInBits(unint64_t result, int a2)
{
  unsigned int v2;
  int v3;
  int v4;

  switch(a2)
  {
    case 0:
      return result;
    case 1:
      return ((8 * (_DWORD)result) | 4u) / 5uLL;
    case 2:
      return (2 * result);
    case 3:
      v2 = 7 * result + 2;
      goto LABEL_12;
    case 4:
      v3 = 13;
      goto LABEL_14;
    case 5:
      return (3 * result);
    case 6:
      v4 = 10;
      goto LABEL_11;
    case 7:
      v3 = 18;
      goto LABEL_14;
    case 8:
      return (4 * result);
    case 9:
      v4 = 13;
LABEL_11:
      v2 = result * v4 + 2;
LABEL_12:
      result = v2 / 3uLL;
      break;
    case 10:
      v3 = 23;
LABEL_14:
      result = (result * v3 + 4) / 5uLL;
      break;
    case 11:
      result = (5 * result);
      break;
    default:
      result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

Class initMDLMeshBufferMap()
{
  Class result;

  if (ModelIOLibrary_sOnce_0 != -1)
    dispatch_once(&ModelIOLibrary_sOnce_0, &__block_literal_global_1);
  result = objc_getClass("MDLMeshBufferMap");
  classMDLMeshBufferMap = (uint64_t)result;
  getMDLMeshBufferMapClass = MDLMeshBufferMapFunction;
  return result;
}

uint64_t MDLMeshBufferMapFunction()
{
  return classMDLMeshBufferMap;
}

id _MTKModelErrorWithCodeAndErrorString(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v9 = CFSTR("MTKModelErrorKey");
  v10[0] = a2;
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("MTKModelErrorDomain"), a1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t _MTKModelErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MTKModelErrorDomain"), a1, a2);
}

uint64_t _MTKModelErrorWithCode(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MTKModelErrorDomain"), a1, 0);
}

uint64_t printIndices16(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  puts("16Bit idnices:");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      printf("%d ", *(unsigned __int16 *)(a1 + 2 * v4));
      if (v5 && 100 * (v5 / 0x64) == v5)
        putchar(10);
      v4 = ++v5;
    }
    while (v5 < a2);
  }
  return putchar(10);
}

uint64_t printIndices32(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  puts("32Bit idnices:");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      printf("%d ", *(_DWORD *)(a1 + 4 * v4));
      if (v5 && 100 * (v5 / 0x64) == v5)
        putchar(10);
      v4 = ++v5;
    }
    while (v5 < a2);
  }
  return putchar(10);
}

uint64_t _mtkLinkedOSVersion()
{
  if (_mtkLinkedOSVersion_once != -1)
    dispatch_once(&_mtkLinkedOSVersion_once, &__block_literal_global_2);
  return _mtkLinkedOSVersion_version;
}

uint64_t ___mtkLinkedOSVersion_block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  _mtkLinkedOSVersion_version = result;
  return result;
}

void expandRGBToRGBA_cold_1()
{
  __assert_rtn("expandRGBToRGBA", "MTKTextureLoader_Internal.m", 89, "source != nil");
}

void expandRGBToRGBA_cold_2()
{
  __assert_rtn("expandRGBToRGBA", "MTKTextureLoader_Internal.m", 90, "destination != nil");
}

void arrayTextureTypeFromTextureType_cold_1()
{
  __assert_rtn("arrayTextureTypeFromTextureType", "MTKTextureLoader_Internal.m", 142, "0 && \"Unhandled texture type\"");
}

void MTKModelIOVertexDescriptorFromMetalWithError_cold_1(_QWORD *a1)
{
  if (a1)
  {
    _MTKModelErrorWithCodeAndErrorString(0, CFSTR("Too many vertex layouts in MTLVertexDescriptor to create a MDLVertexDescriptor"));
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  __assert_rtn("MTKModelIOVertexDescriptorFromMetalWithError", "MTKModel.m", 634, "!\"Model I/O vertex descriptor layouts count should be at least MTL_MAX_VERTEX_BUFFERS\"");
}

void MTKModelIOVertexDescriptorFromMetalWithError_cold_2(_QWORD *a1)
{
  if (a1)
  {
    _MTKModelErrorWithCodeAndErrorString(0, CFSTR("Too many vertex attributes in MTLVertexDescriptor to create a MDLVertexDescriptor"));
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  __assert_rtn("MTKModelIOVertexDescriptorFromMetalWithError", "MTKModel.m", 612, "!\"Model I/O vertex descriptor attribute count should be at least MTL_MAX_VERTEX_ATTRIBUTES\"");
}

void _mtkLinkedOnOrAfter_cold_1()
{
  __assert_rtn("_mtkLinkedOnOrAfter", "MetalKit_Internal.m", 37, "false && \"Unsupported MTKOSVersion\"");
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

uint64_t CGImageBlockGetBytesPerRow()
{
  return MEMORY[0x24BDBE578]();
}

uint64_t CGImageBlockGetData()
{
  return MEMORY[0x24BDBE580]();
}

uint64_t CGImageBlockGetRect()
{
  return MEMORY[0x24BDBE588]();
}

uint64_t CGImageBlockSetGetComponentType()
{
  return MEMORY[0x24BDBE5B0]();
}

uint64_t CGImageBlockSetGetCount()
{
  return MEMORY[0x24BDBE5B8]();
}

uint64_t CGImageBlockSetGetImageBlock()
{
  return MEMORY[0x24BDBE5C0]();
}

uint64_t CGImageBlockSetGetPixelSize()
{
  return MEMORY[0x24BDBE5C8]();
}

uint64_t CGImageBlockSetRelease()
{
  return MEMORY[0x24BDBE5D8]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CGImageProviderCopyImageBlockSetWithOptions()
{
  return MEMORY[0x24BDBE710]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x24BDBE738]();
}

uint64_t CGImageProviderGetSize()
{
  return MEMORY[0x24BDBE758]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x24BDDD390]();
}

uint64_t MTLTextureTypeString()
{
  return MEMORY[0x24BDDD448]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x24BDADF58](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x24BDAE0E0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

vImage_Error vImageVerticalReflect_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AB0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AB8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AC0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AC8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AD0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3AD8](src, dest, *(_QWORD *)&flags);
}

