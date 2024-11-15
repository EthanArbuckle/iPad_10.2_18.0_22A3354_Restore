@implementation GLKTextureTXR

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKTextureTXR;
  -[GLKTextureTXR dealloc](&v3, sel_dealloc);
}

- (GLKTextureTXR)initWithTexture:(id)a3 API:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  GLKTextureTXR *v9;
  GLKTextureTXR *v10;
  id v11;
  int v12;
  int32x4_t v13;
  int32x2_t v14;
  unsigned int arrayLength;
  unsigned int v16;
  int v17;
  int target;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  int32x4_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)GLKTextureTXR;
  v9 = -[GLKTextureTXR init](&v24, sel_init, a3, a4, a5);
  v10 = v9;
  if (!v9)
    return v10;
  v9->_texture = (TXRTexture *)a3;
  v11 = a3;
  v10->_arrayLength = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mipmapLevels"), "objectAtIndexedSubscript:", 0), "elements"), "count");
  if (-[TXRTexture cubemap](v10->_texture, "cubemap"))
  {
    if (v10->_arrayLength >= 2)
    {
      if (a6)
        *a6 = (id)_GLKTextureErrorWithCodeAndErrorString(19, (uint64_t)CFSTR("OpenGL ES does not support cubemap arrays"));
      v10->_arrayLength = 1;
    }
    v10->_target = 34067;
    objc_msgSend(a3, "dimensions");
    if (v12 != 1)
      -[GLKTextureTXR initWithTexture:API:options:error:].cold.2();
    objc_msgSend(a3, "dimensions");
    v23 = v13;
    objc_msgSend(a3, "dimensions");
    if ((vmovn_s32(vceqq_s32(v23, vdupq_lane_s32(v14, 1))).u8[0] & 1) == 0)
      -[GLKTextureTXR initWithTexture:API:options:error:].cold.1();
  }
  else
  {
    -[TXRTexture dimensions](v10->_texture, "dimensions");
    arrayLength = v10->_arrayLength;
    if (v16 < 2)
    {
      if (arrayLength < 2)
        v17 = 3553;
      else
        v17 = 35866;
    }
    else
    {
      if (arrayLength >= 2)
      {
        if (a6)
          *a6 = (id)_GLKTextureErrorWithCodeAndErrorString(19, (uint64_t)CFSTR("OpenGL does not support 3D texture arrays"));
        goto LABEL_19;
      }
      v17 = 32879;
    }
    v10->_target = v17;
  }
LABEL_19:
  if ((-[TXRTexture cubemap](v10->_texture, "cubemap") & 1) != 0)
    target = 34069;
  else
    target = v10->_target;
  v10->_loadTarget = target;
  v10->_mipmapLevelCount = objc_msgSend((id)-[TXRTexture mipmapLevels](v10->_texture, "mipmapLevels"), "count");
  -[TXRTexture dimensions](v10->_texture, "dimensions");
  v10->_width = v19;
  -[TXRTexture dimensions](v10->_texture, "dimensions");
  v10->_height = v20;
  -[TXRTexture dimensions](v10->_texture, "dimensions");
  v10->_depth = v21;
  v10->_hasAlpha = objc_msgSend(MEMORY[0x24BEB6DC8], "hasAlpha:", -[TXRTexture pixelFormat](v10->_texture, "pixelFormat"));
  v10->_API = a4;
  return v10;
}

- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4
{
  GLKTextureTXR *v6;
  uint64_t v7;
  unint64_t API;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  int v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  unint64_t v31;
  int v32;
  GLint v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  int32x2_t v37;
  GLKTextureTXR *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int target;
  const GLvoid *pixels;
  GLsizei v48;
  GLsizei v49;
  uint64_t v50;
  uint32x2_t v51;
  int8x8_t v52;
  int8x8_t v53;
  unsigned int v54;
  GLenum Error;
  unsigned int v56;
  const __CFString *v57;
  BOOL result;
  unsigned int v59;
  unsigned int v60;
  void *v61;
  id *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  GLenum v67;
  GLint v68;
  GLint v69;
  GLint params;

  v6 = self;
  self->_lossyCompressedSource = objc_msgSend(MEMORY[0x24BEB6DC8], "isCompressed:", -[TXRTexture pixelFormat](self->_texture, "pixelFormat"));
  v7 = -[TXRTexture pixelFormat](v6->_texture, "pixelFormat");
  API = v6->_API;
  if (v7 > 79)
  {
    if (v7 <= 551)
    {
      switch(v7)
      {
        case 80:
          v65 = 0x1401000080E1;
          v9 = 37793;
          goto LABEL_127;
        case 81:
          v65 = 0x1401000080E1;
          v9 = 35907;
          goto LABEL_127;
        case 90:
          v65 = 0x836800001908;
          v9 = 32857;
          goto LABEL_127;
        case 92:
          v65 = 0x8C3B00001907;
          v9 = 35898;
          goto LABEL_127;
        case 93:
          v65 = 0x8C3E00001907;
          v9 = 35901;
          goto LABEL_127;
        case 105:
          v65 = 0x140600008227;
          v9 = 33328;
          goto LABEL_127;
        case 110:
          v67 = 32856;
          v65 = 0x140100001908;
          v10 = 70;
          goto LABEL_140;
        case 112:
          v67 = 36759;
          v65 = 0x140000001908;
          v10 = 72;
          goto LABEL_140;
        case 115:
          v15 = API == 3;
          if (API == 3)
            v16 = 34842;
          else
            v16 = 6408;
          v67 = v16;
          if (v15)
            v17 = 5131;
          else
            v17 = 36193;
          LODWORD(v65) = 6408;
          HIDWORD(v65) = v17;
          goto LABEL_128;
        case 125:
          v65 = 0x140600001908;
          v9 = 34836;
          goto LABEL_127;
        case 160:
          v65 = 0;
          v9 = 35841;
          goto LABEL_127;
        case 161:
          v65 = 0;
          v9 = 35412;
          goto LABEL_127;
        case 162:
          v65 = 0;
          v9 = 35840;
          goto LABEL_127;
        case 163:
          v65 = 0;
          v9 = 35413;
          goto LABEL_127;
        case 164:
          v65 = 0;
          v9 = 35843;
          goto LABEL_127;
        case 165:
          v65 = 0;
          v9 = 35414;
          goto LABEL_127;
        case 166:
          v65 = 0;
          v9 = 35842;
          goto LABEL_127;
        case 167:
          v65 = 0;
          v9 = 35415;
          goto LABEL_127;
        case 170:
          v65 = 0;
          v9 = 37488;
          goto LABEL_127;
        case 172:
          v65 = 0;
          v9 = 37489;
          goto LABEL_127;
        case 174:
          v65 = 0;
          v9 = 37490;
          goto LABEL_127;
        case 176:
          v65 = 0;
          v9 = 37491;
          goto LABEL_127;
        case 178:
          v65 = 0;
          v9 = 37496;
          goto LABEL_127;
        case 179:
          v65 = 0;
          v9 = 37497;
          goto LABEL_127;
        case 180:
          v65 = 0;
          v9 = 37492;
          goto LABEL_127;
        case 181:
          v65 = 0;
          v9 = 37493;
          goto LABEL_127;
        case 182:
          v65 = 0;
          v9 = 37494;
          goto LABEL_127;
        case 183:
          v65 = 0;
          v9 = 37495;
          goto LABEL_127;
        case 186:
          v65 = 0;
          v9 = 37840;
          goto LABEL_127;
        case 187:
          v65 = 0;
          v9 = 37841;
          goto LABEL_127;
        case 188:
          v65 = 0;
          v9 = 37842;
          goto LABEL_127;
        case 189:
          v65 = 0;
          v9 = 37843;
          goto LABEL_127;
        case 190:
          v65 = 0;
          v9 = 37844;
          goto LABEL_127;
        case 192:
          v65 = 0;
          v9 = 37845;
          goto LABEL_127;
        case 193:
          v65 = 0;
          v9 = 37846;
          goto LABEL_127;
        case 194:
          v65 = 0;
          v9 = 37847;
          goto LABEL_127;
        case 195:
          v65 = 0;
          v9 = 37848;
          goto LABEL_127;
        case 196:
          v65 = 0;
          v9 = 37849;
          goto LABEL_127;
        case 197:
          v65 = 0;
          v9 = 37850;
          goto LABEL_127;
        case 198:
          v65 = 0;
          v9 = 37851;
          goto LABEL_127;
        case 199:
          v65 = 0;
          v9 = 37852;
          goto LABEL_127;
        case 200:
          v65 = 0;
          v9 = 37853;
          goto LABEL_127;
        case 204:
          v65 = 0;
          v9 = 37808;
          goto LABEL_127;
        case 205:
          v65 = 0;
          v9 = 37809;
          goto LABEL_127;
        case 206:
          v65 = 0;
          v9 = 37810;
          goto LABEL_127;
        case 207:
          v65 = 0;
          v9 = 37811;
          goto LABEL_127;
        case 208:
          v65 = 0;
          v9 = 37812;
          goto LABEL_127;
        case 210:
          v65 = 0;
          v9 = 37813;
          goto LABEL_127;
        case 211:
          v65 = 0;
          v9 = 37814;
          goto LABEL_127;
        case 212:
          v65 = 0;
          v9 = 37815;
          goto LABEL_127;
        case 213:
          v65 = 0;
          v9 = 37816;
          goto LABEL_127;
        case 214:
          v65 = 0;
          v9 = 37817;
          goto LABEL_127;
        case 215:
          v65 = 0;
          v9 = 37818;
          goto LABEL_127;
        case 216:
          v65 = 0;
          v9 = 37819;
          goto LABEL_127;
        case 217:
          v65 = 0;
          v9 = 37820;
          goto LABEL_127;
        case 218:
          v65 = 0;
          v9 = 37821;
          goto LABEL_127;
        default:
          goto LABEL_119;
      }
    }
    switch(v7)
    {
      case 552:
      case 554:
        v67 = 32856;
        v65 = 0x1401000080E1;
        v10 = 80;
        goto LABEL_140;
      case 553:
      case 555:
        v67 = 35907;
        v65 = 0x1401000080E1;
        v10 = 81;
        goto LABEL_140;
      default:
        if (v7 == 2147483649)
        {
          LODWORD(v65) = 6407;
          v11 = 32819;
        }
        else
        {
          if (v7 != 2147483650)
            goto LABEL_119;
          LODWORD(v65) = 6407;
          v11 = 5121;
        }
        HIDWORD(v65) = v11;
        v9 = 32849;
        break;
    }
    goto LABEL_127;
  }
  if (v7 > 40)
  {
    if (v7 > 59)
    {
      switch(v7)
      {
        case '<':
          v67 = 33323;
          v65 = 0x140100008227;
          v10 = 30;
          goto LABEL_140;
        case '>':
          v67 = 36756;
          v65 = 0x140000008227;
          v10 = 32;
          goto LABEL_140;
        case 'A':
          v65 = 0x140B00008227;
          v9 = 33327;
          goto LABEL_127;
        case 'F':
          v65 = 0x140100001908;
          v9 = 32856;
          goto LABEL_127;
        case 'G':
          if (API == 2)
            v12 = 35906;
          else
            v12 = 35907;
          v67 = v12;
          if (API == 2)
            v13 = 35906;
          else
            v13 = 6408;
          v65 = v13 | 0x140100000000;
          goto LABEL_128;
        case 'H':
          if (API == 2)
          {
            HIDWORD(v65) = 0;
            v14 = 35906;
            goto LABEL_117;
          }
          v65 = 0x140000001908;
          v9 = 36759;
          break;
        default:
          goto LABEL_119;
      }
      goto LABEL_127;
    }
    switch(v7)
    {
      case ')':
        v65 = 0x803400001908;
        v9 = 32855;
        goto LABEL_127;
      case '*':
        v65 = 0x803300001908;
        v9 = 32854;
        goto LABEL_127;
      case '7':
        v65 = 0x140600001903;
        v9 = 33326;
        goto LABEL_127;
    }
    goto LABEL_119;
  }
  if (v7 > 21)
  {
    if (v7 <= 29)
    {
      if (v7 == 22)
      {
        v67 = 36756;
        v65 = 0x140000001903;
        v10 = 12;
        goto LABEL_140;
      }
      if (v7 == 25)
      {
        v65 = 0x140B00001903;
        v9 = 33325;
        goto LABEL_127;
      }
    }
    else
    {
      switch(v7)
      {
        case 30:
          v65 = 0x140100008227;
          v9 = 33323;
          goto LABEL_127;
        case 32:
          v65 = 0x140000008227;
          v9 = 36757;
          goto LABEL_127;
        case 40:
          v65 = 0x836300001907;
          v9 = 36194;
          goto LABEL_127;
      }
    }
LABEL_119:
    v18 = objc_msgSend(MEMORY[0x24BEB6DC8], "isGammaEncoded:", v7);
    if (v18)
      v19 = 35906;
    else
      v19 = 6408;
    if (v18)
      v10 = 71;
    else
      v10 = 70;
    v65 = v19 | 0x140100000000;
    v67 = v19;
    goto LABEL_140;
  }
  HIDWORD(v65) = 5121;
  if (v7 > 10)
  {
    v67 = 33321;
    LODWORD(v65) = 6403;
    v10 = 10;
    if (v7 == 11)
      goto LABEL_140;
    if (v7 != 12)
    {
      if (v7 != 20)
        goto LABEL_119;
LABEL_140:
      -[TXRTexture reformat:gammaDegamma:bufferAllocator:error:](v6->_texture, "reformat:gammaDegamma:bufferAllocator:error:", v10, 0, 0, a4);
      goto LABEL_141;
    }
    v65 = 0x140000001903;
    v9 = 36756;
LABEL_127:
    v67 = v9;
    goto LABEL_128;
  }
  if (v7 != 1)
  {
    if (v7 == 10)
    {
      v65 = 0x140100001903;
      v9 = 33321;
      goto LABEL_127;
    }
    goto LABEL_119;
  }
  v14 = 6406;
LABEL_117:
  v67 = v14;
  LODWORD(v65) = v14;
LABEL_128:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", glGetString(0x1F03u));
  v21 = (void *)objc_msgSend(v20, "componentsSeparatedByString:", CFSTR(" "));
  if (objc_msgSend(MEMORY[0x24BEB6DC8], "isASTC:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"))&& !objc_msgSend(v21, "containsObject:", CFSTR("GL_KHR_texture_compression_astc_ldr"))|| objc_msgSend(MEMORY[0x24BEB6DC8], "isETC2:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"))&& v6->_API != 3)
  {
    v22 = -[TXRTexture pixelFormat](v6->_texture, "pixelFormat");
    v23 = objc_msgSend(MEMORY[0x24BEB6DC8], "isGammaEncoded:", v22);
    if (v23)
      v24 = 35906;
    else
      v24 = 6408;
    if (v23)
      v10 = 71;
    else
      v10 = 70;

    v65 = v24 | 0x140100000000;
    v67 = v24;
    goto LABEL_140;
  }

LABEL_141:
  -[TXRTexture dimensions](v6->_texture, "dimensions");
  v26 = v25;
  -[TXRTexture dimensions](v6->_texture, "dimensions");
  if (((v27 - 1) & v26) == 0)
  {
    -[TXRTexture dimensions](v6->_texture, "dimensions");
    v29 = v28;
    -[TXRTexture dimensions](v6->_texture, "dimensions");
    if (((v30 - 1) & v29) == 0)
      goto LABEL_146;
  }
  v31 = v6->_API;
  if (v31 != 1)
  {
    if (v31 == 2)
      v6->_mipmapLevelCount = 1;
LABEL_146:
    v62 = a4;
    glBindTexture(v6->_target, a3);
    glTexParameteri(v6->_target, 0x2802u, 33071);
    glTexParameteri(v6->_target, 0x2803u, 33071);
    glTexParameteri(v6->_target, 0x2800u, 9729);
    glTexParameteri(v6->_target, 0x813Du, v6->_mipmapLevelCount);
    v32 = objc_msgSend(MEMORY[0x24BEB6DC8], "isCompressed:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"));
    if ((v32 & 1) == 0)
      objc_msgSend(MEMORY[0x24BEB6DC8], "pixelBytes:", -[TXRTexture pixelFormat](v6->_texture, "pixelFormat"));
    if (v6->_mipmapLevelCount <= 1)
      v33 = 9729;
    else
      v33 = 9987;
    glTexParameteri(v6->_target, 0x2801u, v33);
    -[TXRTexture dimensions](v6->_texture, "dimensions");
    if (v6->_mipmapLevelCount)
    {
      v35 = 0;
      while (1)
      {
        v66 = v34;
        v63 = (void *)objc_msgSend((id)-[TXRTexture mipmapLevels](v6->_texture, "mipmapLevels"), "objectAtIndexedSubscript:", v35);
        if (v6->_arrayLength)
          break;
        v50 = *((_QWORD *)&v66 + 1);
        v37 = vrev64_s32(*(int32x2_t *)&v66);
LABEL_176:
        v51 = (uint32x2_t)vrev64_s32(v37);
        v52 = (int8x8_t)vshr_n_u32(v51, 1uLL);
        v53 = (int8x8_t)vcgt_u32(v51, (uint32x2_t)0x100000001);
        *(int32x2_t *)&v34 = vsub_s32((int32x2_t)vand_s8(v52, v53), (int32x2_t)vmvn_s8(v53));
        if (v50 <= 1)
          v54 = 1;
        else
          v54 = v50 >> 1;
        *((_QWORD *)&v34 + 1) = __PAIR64__(HIDWORD(v50), v54);
        if (++v35 >= (unint64_t)v6->_mipmapLevelCount)
          goto LABEL_180;
      }
      v36 = 0;
      v37 = vrev64_s32(*(int32x2_t *)&v66);
      while (1)
      {
        v38 = v6;
        v64 = v36;
        v39 = (void *)objc_msgSend((id)objc_msgSend(v63, "elements"), "objectAtIndexedSubscript:", v36);
        if (objc_msgSend((id)objc_msgSend(v39, "faces"), "count"))
          break;
LABEL_173:
        v36 = v64 + 1;
        v6 = v38;
        if (v64 + 1 >= (unint64_t)v38->_arrayLength)
        {
          v50 = *((_QWORD *)&v66 + 1);
          goto LABEL_176;
        }
      }
      v40 = 0;
      while (1)
      {
        v41 = (void *)objc_msgSend((id)objc_msgSend(v39, "faces"), "objectAtIndexedSubscript:", v40);
        v42 = (void *)objc_msgSend((id)objc_msgSend(v41, "buffer"), "map");
        v43 = objc_msgSend(v41, "bytesPerRow");
        if (!v43)
          v43 = objc_msgSend(MEMORY[0x24BEB6DC8], "packedMemoryLayoutForFormat:dimensions:", -[TXRTexture pixelFormat](v38->_texture, "pixelFormat"), *(double *)&v66);
        v44 = objc_msgSend(v42, "bytes");
        v45 = objc_msgSend(v41, "offset");
        target = v38->_target;
        if (target > 34066)
          break;
        if (target == 3553)
          goto LABEL_164;
        if (target == 32879)
          -[GLKTextureTXR uploadToGLTexture:error:].cold.3();
LABEL_172:
        if (++v40 >= (unint64_t)objc_msgSend((id)objc_msgSend(v39, "faces"), "count"))
          goto LABEL_173;
      }
      if (target != 34067)
      {
        if (target == 35866)
          -[GLKTextureTXR uploadToGLTexture:error:].cold.2();
        goto LABEL_172;
      }
LABEL_164:
      pixels = (const GLvoid *)(v44 + v45);
      if (v32)
      {
        v48 = objc_msgSend(v41, "bytesPerImage");
        if (v48)
          v49 = v48;
        else
          v49 = v43 * DWORD1(v66);
        glCompressedTexImage2D(v40 + v38->_loadTarget, v35, v67, v66, SDWORD1(v66), 0, v49, pixels);
      }
      else
      {
        params = 0;
        glGetIntegerv(0xCF5u, &params);
        glPixelStorei(0xCF5u, 1);
        if (v43 != (_DWORD)v66
                  * objc_msgSend(MEMORY[0x24BEB6DC8], "pixelBytes:", -[TXRTexture pixelFormat](v38->_texture, "pixelFormat")))-[GLKTextureTXR uploadToGLTexture:error:].cold.1();
        glTexImage2D(v40 + v38->_loadTarget, v35, v67, v66, SDWORD1(v66), 0, v65, HIDWORD(v65), pixels);
        glPixelStorei(0xCF5u, params);
      }
      goto LABEL_172;
    }
LABEL_180:
    Error = glGetError();
    if (!Error)
      return 1;
    if (Error == 1281)
    {
      v68 = 0;
      v69 = 0;
      glGetIntegerv(0xD33u, &v69);
      glGetIntegerv(0x851Cu, &v68);
      a4 = v62;
      if ((-[TXRTexture cubemap](v6->_texture, "cubemap") & 1) != 0
        || (-[TXRTexture dimensions](v6->_texture, "dimensions"), v56 <= v69))
      {
        if ((-[TXRTexture cubemap](v6->_texture, "cubemap") & 1) != 0
          || (-[TXRTexture dimensions](v6->_texture, "dimensions"), v59 <= v69))
        {
          if (-[TXRTexture cubemap](v6->_texture, "cubemap"))
          {
            -[TXRTexture dimensions](v6->_texture, "dimensions");
            if (v60 <= v68)
              v57 = 0;
            else
              v57 = CFSTR("Cube Map width / height are greater than GL_MAX_CUBE_MAP_TEXTURE_SIZE");
          }
          else
          {
            v57 = 0;
          }
        }
        else
        {
          v57 = CFSTR("Texture height is greater than GL_MAX_TEXTURE_SIZE");
        }
      }
      else
      {
        v57 = CFSTR("Texture width is greater than GL_MAX_TEXTURE_SIZE");
      }
    }
    else
    {
      v57 = CFSTR("OpenGL Error");
      a4 = v62;
    }
    if (a4)
      goto LABEL_199;
    return 0;
  }
  if (a4)
  {
    v57 = CFSTR("OpenGL ES 1 does not support non-power-of-two-textures");
LABEL_199:
    v61 = (void *)_GLKTextureErrorWithCodeAndErrorString(0, (uint64_t)v57);
    result = 0;
    *a4 = v61;
    return result;
  }
  return 0;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)GLTextureName
{
  return self->_GLTextureName;
}

- (void)setGLTextureName:(unsigned int)a3
{
  self->_GLTextureName = a3;
}

- (unsigned)target
{
  return self->_target;
}

- (void)setTarget:(unsigned int)a3
{
  self->_target = a3;
}

- (unsigned)mipmapLevelCount
{
  return self->_mipmapLevelCount;
}

- (void)setMipmapLevelCount:(unsigned int)a3
{
  self->_mipmapLevelCount = a3;
}

- (unsigned)arrayLength
{
  return self->_arrayLength;
}

- (void)setArrayLength:(unsigned int)a3
{
  self->_arrayLength = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)depth
{
  return self->_depth;
}

- (void)setDepth:(unsigned int)a3
{
  self->_depth = a3;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (BOOL)lossyCompressedSource
{
  return self->_lossyCompressedSource;
}

- (void)setLossyCompressedSource:(BOOL)a3
{
  self->_lossyCompressedSource = a3;
}

- (void)initWithTexture:API:options:error:.cold.1()
{
  __assert_rtn("-[GLKTextureTXR initWithTexture:API:options:error:]", "GLKTextureTXR.m", 607, "txrTexture.dimensions.x == txrTexture.dimensions.y");
}

- (void)initWithTexture:API:options:error:.cold.2()
{
  __assert_rtn("-[GLKTextureTXR initWithTexture:API:options:error:]", "GLKTextureTXR.m", 606, "1 == txrTexture.dimensions.z");
}

- (void)uploadToGLTexture:error:.cold.1()
{
  __assert_rtn("-[GLKTextureTXR uploadToGLTexture:error:]", "GLKTextureTXR.m", 788, "bytesPerRow == ([TXRPixelFormatInfo pixelBytes:_texture.pixelFormat] * sourceSize.x)");
}

- (void)uploadToGLTexture:error:.cold.2()
{
  __assert_rtn("-[GLKTextureTXR uploadToGLTexture:error:]", "GLKTextureTXR.m", 821, "!\"TODO: Must implement GL_TEXTURE_2D_ARRAY\");
}

- (void)uploadToGLTexture:error:.cold.3()
{
  __assert_rtn("-[GLKTextureTXR uploadToGLTexture:error:]", "GLKTextureTXR.m", 824, "!\"TODO: Must implement GL_TEXTURE_3D\");
}

@end
