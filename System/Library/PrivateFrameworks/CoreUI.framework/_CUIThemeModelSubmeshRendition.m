@implementation _CUIThemeModelSubmeshRendition

- (id)initForArchiving:(id)a3
{
  _CUIThemeModelSubmeshRendition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CUIThemeModelSubmeshRendition;
  v4 = -[_CUIThemeModelSubmeshRendition init](&v6, sel_init);
  if (v4)
    v4->_submesh = (MDLSubmesh *)a3;
  return v4;
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v6;
  char *v7;
  unsigned int *v8;
  int v9;
  uint64_t v10;
  id v11;
  unsigned int *v12;
  NSString *v13;
  Class v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  double *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  CGFloat *v27;
  CGColorSpace *SRGB;
  CGColor *v29;
  id v30;
  double v31;
  double v32;
  CUIMeshBuffer *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)_CUIThemeModelSubmeshRendition;
  v6 = -[CUIThemeRendition _initWithCSIHeader:version:](&v39, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  if (v6)
  {
    v7 = (char *)&a3->var0 + 4 * a3->var11.var0 + a3->var10;
    v9 = *((_DWORD *)v7 + 45);
    v8 = (unsigned int *)(v7 + 180);
    if (v9 != 1297040467)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("_CUIThemeModelSubmeshRendition.m"), 84, CFSTR("CoreUI: Expecting a kCSIModelMeshSignature but didn't find it"));
    v38 = v8[2];
    v37 = v8[4];
    v36 = v8[6];
    v35 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", (char *)v8 + 45, v8[8], 4);
    v34 = -[CUIMeshBuffer initWithBytes:andLength:ofType:]([CUIMeshBuffer alloc], "initWithBytes:andLength:ofType:", (char *)v8 + v8[8] + 45, v8[9], 2);
    v10 = (uint64_t)v8 + v8[8] + *(_QWORD *)(v8 + 9) + 45;
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v10 + 20, *(unsigned int *)(v10 + 8), 4);
    v12 = (unsigned int *)(v10 + 20 + *(unsigned int *)(v10 + 8));
    v13 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v12 + 2, *v12, 4);
    v14 = NSClassFromString(v13);
    v15 = (void *)objc_opt_new(v14);

    v16 = objc_msgSend(objc_alloc((Class)getMDLMaterialClass[0]()), "initWithName:scatteringFunction:", v11, v15);
    if (*(_QWORD *)(v10 + 12))
    {
      v17 = 0;
      v18 = (_QWORD *)((char *)v12 + *(_QWORD *)v12 + 8);
      while (2)
      {
        v19 = v18[1];
        v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v18 + 4, *((unsigned int *)v18 + 4), 4);
        v21 = (double *)((char *)v18 + v18[2] + 32);
        switch(v19)
        {
          case 1:
            v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v21, *((unsigned int *)v18 + 6), 4);
            v23 = objc_msgSend((Class)getMDLTextureClass[0](), "textureNamed:", v22);

            if (!v23)
            {
              v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:string:", v20, *v18, v22);
              goto LABEL_17;
            }
            v24 = objc_alloc_init((Class)getMDLTextureSamplerClass[0]());
            objc_msgSend(v24, "setTexture:", v23);
            v25 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:textureSampler:", v20, *v18, v24);

            goto LABEL_18;
          case 4:
            v27 = (CGFloat *)malloc_type_malloc(8 * *((unsigned int *)v21 + 3), 0x100004000313F17uLL);
            SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
            v29 = CGColorCreate(SRGB, v27);
            v25 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:color:", v20, *v18, v29);
            CGColorRelease(v29);
            free(v27);
            goto LABEL_18;
          case 5:
            v30 = objc_alloc((Class)getMDLMaterialPropertyClass[0]());
            LODWORD(v31) = *(_DWORD *)v21;
            v26 = objc_msgSend(v30, "initWithName:semantic:float:", v20, *v18, v31);
            goto LABEL_17;
          case 6:
            v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:float2:", v20, *v18, *v21);
            goto LABEL_17;
          case 7:
            v32 = *v21;
            v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:float3:", v20, *v18, v32);
            goto LABEL_17;
          case 8:
            v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:float4:", v20, *v18, *v21);
            goto LABEL_17;
          case 9:
            v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:matrix4x4:", v20, *v18, *(double *)((char *)v21 + 4), *(double *)((char *)v21 + 20), *(double *)((char *)v21 + 36), *(double *)((char *)v21 + 52));
            goto LABEL_17;
          default:
            v26 = objc_msgSend(objc_alloc((Class)getMDLMaterialPropertyClass[0]()), "initWithName:semantic:", v20, *v18);
LABEL_17:
            v25 = v26;
LABEL_18:

            objc_msgSend(v16, "setProperty:", v25);
            v18 = (_QWORD *)((char *)v21 + v18[3]);
            if ((unint64_t)++v17 >= *(_QWORD *)(v10 + 12))
              break;
            continue;
        }
        break;
      }
    }
    v6[27] = objc_msgSend(objc_alloc((Class)getMDLSubmeshClass[0]()), "initWithName:indexBuffer:indexCount:indexType:geometryType:material:topology:", v35, v34, v38, v37, v36, v16, 0);

  }
  return v6;
}

- (id)modelSubmesh
{
  return self->_submesh;
}

- (unint64_t)writeToData:(id)a3
{
  id v3;
  _BYTE *v5;
  const char *v6;
  id v7;
  MDLMaterial *v8;
  MDLScatteringFunction *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  const CGFloat *Components;
  uint64_t v21;
  CGColor *v22;
  int v23;
  const CGFloat *v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  id v51;
  id v52;
  const char *v53;
  MDLScatteringFunction *v54;
  uint64_t v55;
  objc_class *v56;
  const char *v57;
  id v59;
  _BYTE *v60;
  void *v61;
  MDLMaterial *obj;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  NSUInteger v74;
  _QWORD v75[3];
  _QWORD v76[4];
  unsigned int v77;
  id v78;
  char v79;
  _BYTE v80[128];

  v3 = a3;
  v79 = 0;
  v5 = objc_msgSend(a3, "length");
  v76[0] = 0x14D4F4453;
  v77 = -[NSString length](-[MDLSubmesh name](self->_submesh, "name"), "length");
  v76[1] = -[MDLSubmesh indexCount](self->_submesh, "indexCount");
  v76[2] = -[MDLSubmesh indexType](self->_submesh, "indexType");
  v76[3] = -[MDLSubmesh geometryType](self->_submesh, "geometryType");
  v78 = objc_msgSend(-[MDLSubmesh indexBuffer](self->_submesh, "indexBuffer"), "length");
  objc_msgSend(v3, "appendBytes:length:", v76, 45);
  v6 = -[NSString UTF8String](-[MDLSubmesh name](self->_submesh, "name"), "UTF8String");
  objc_msgSend(v3, "appendBytes:length:", v6, v77);
  v7 = objc_msgSend(objc_msgSend(-[MDLSubmesh indexBuffer](self->_submesh, "indexBuffer"), "map"), "bytes");
  objc_msgSend(v3, "appendBytes:length:", v7, v78);
  if (-[MDLSubmesh material](self->_submesh, "material"))
  {
    v60 = v5;
    v61 = v3;
    v59 = +[NSMutableData data](NSMutableData, "data");
    memset(&v75[1], 0, 12);
    v8 = -[MDLSubmesh material](self->_submesh, "material");
    v79 = 1;
    v75[0] = -[MDLMaterial materialFace](v8, "materialFace");
    v75[1] = -[NSString length](-[MDLMaterial name](v8, "name"), "length");
    v9 = -[MDLMaterial scatteringFunction](v8, "scatteringFunction");
    v11 = (objc_class *)objc_opt_class(v9, v10);
    v74 = -[NSString length](NSStringFromClass(v11), "length");
    v12 = +[NSMutableData data](NSMutableData, "data");
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v8;
    v13 = -[MDLMaterial countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
          v68 = 0u;
          v69 = 0u;
          *(_QWORD *)&v68 = objc_msgSend(v18, "semantic");
          *((_QWORD *)&v68 + 1) = objc_msgSend(v18, "type");
          *(_QWORD *)&v69 = objc_msgSend(objc_msgSend(v18, "name"), "length");
          v19 = +[NSMutableData data](NSMutableData, "data");
          switch((unint64_t)objc_msgSend(v18, "type"))
          {
            case 1uLL:
              Components = (const CGFloat *)objc_msgSend(objc_msgSend(v18, "stringValue"), "UTF8String");
              v21 = (uint64_t)objc_msgSend(objc_msgSend(v18, "stringValue"), "length");
              goto LABEL_21;
            case 3uLL:
              NSLog(CFSTR("Do something for textures"));
              break;
            case 4uLL:
              v63 = 0uLL;
              v22 = (CGColor *)objc_msgSend(v18, "color");
              DWORD2(v63) &= 0xFFFFFF00;
              HIDWORD(v63) = CGColorGetNumberOfComponents(v22);
              if (HIDWORD(v63))
                Components = CGColorGetComponents(v22);
              else
                Components = 0;
              objc_msgSend(v19, "appendBytes:length:", &v63, 16);
              v21 = 8 * HIDWORD(v63);
LABEL_21:
              v25 = v19;
              v24 = Components;
              goto LABEL_22;
            case 5uLL:
              v63 = 0uLL;
              objc_msgSend(v18, "floatValue");
              LODWORD(v63) = v23;
              v24 = (const CGFloat *)&v63;
              v25 = v19;
              v21 = 4;
              goto LABEL_22;
            case 6uLL:
              v63 = 0uLL;
              objc_msgSend(v18, "float2Value");
              LODWORD(v63) = v33;
              objc_msgSend(v18, "float2Value");
              DWORD1(v63) = v34;
              v24 = (const CGFloat *)&v63;
              v25 = v19;
              v21 = 8;
              goto LABEL_22;
            case 7uLL:
              v63 = 0uLL;
              objc_msgSend(v18, "float3Value");
              LODWORD(v63) = v26;
              objc_msgSend(v18, "float3Value");
              DWORD1(v63) = v27;
              objc_msgSend(v18, "float3Value");
              DWORD2(v63) = v28;
              v24 = (const CGFloat *)&v63;
              v25 = v19;
              v21 = 12;
              goto LABEL_22;
            case 8uLL:
              v63 = 0uLL;
              objc_msgSend(v18, "float4Value");
              LODWORD(v63) = v29;
              objc_msgSend(v18, "float4Value");
              DWORD1(v63) = v30;
              objc_msgSend(v18, "float4Value");
              DWORD2(v63) = v31;
              objc_msgSend(v18, "float4Value");
              HIDWORD(v63) = v32;
              v24 = (const CGFloat *)&v63;
              v25 = v19;
              v21 = 16;
LABEL_22:
              objc_msgSend(v25, "appendBytes:length:", v24, v21);
              break;
            case 9uLL:
              v67 = 0;
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              objc_msgSend(v18, "matrix4x4");
              DWORD1(v63) = v35;
              objc_msgSend(v18, "matrix4x4");
              DWORD2(v63) = v36;
              objc_msgSend(v18, "matrix4x4");
              *(_DWORD *)((unint64_t)&v63 | 0xC) = v37;
              objc_msgSend(v18, "matrix4x4");
              LODWORD(v64) = v38;
              objc_msgSend(v18, "matrix4x4");
              DWORD1(v64) = v39;
              objc_msgSend(v18, "matrix4x4");
              DWORD2(v64) = v40;
              objc_msgSend(v18, "matrix4x4");
              HIDWORD(v64) = v41;
              objc_msgSend(v18, "matrix4x4");
              LODWORD(v65) = v42;
              objc_msgSend(v18, "matrix4x4");
              DWORD1(v65) = v43;
              objc_msgSend(v18, "matrix4x4");
              DWORD2(v65) = v44;
              objc_msgSend(v18, "matrix4x4");
              HIDWORD(v65) = v45;
              objc_msgSend(v18, "matrix4x4");
              LODWORD(v66) = v46;
              objc_msgSend(v18, "matrix4x4");
              DWORD1(v66) = v47;
              objc_msgSend(v18, "matrix4x4");
              DWORD2(v66) = v48;
              objc_msgSend(v18, "matrix4x4");
              HIDWORD(v66) = v49;
              objc_msgSend(v18, "matrix4x4");
              v67 = v50;
              objc_msgSend(v19, "appendBytes:length:", &v63, 68);
              goto LABEL_17;
            case 0xAuLL:
LABEL_17:
              NSLog(CFSTR("Do something for buffers"));
              break;
            default:
              break;
          }
          *((_QWORD *)&v69 + 1) = objc_msgSend(v19, "length");
          objc_msgSend(v12, "appendBytes:length:", &v68, 32);
          v51 = objc_msgSend(objc_msgSend(v18, "name"), "UTF8String");
          objc_msgSend(v12, "appendBytes:length:", v51, v69);
          v52 = objc_msgSend(v19, "bytes");
          objc_msgSend(v12, "appendBytes:length:", v52, DWORD2(v69));
        }
        v15 += (uint64_t)v14;
        v14 = -[MDLMaterial countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }
    *(_QWORD *)((char *)&v75[1] + 4) = v15;
    objc_msgSend(v59, "appendBytes:length:", v75, 20);
    v53 = -[NSString UTF8String](-[MDLMaterial name](obj, "name"), "UTF8String");
    objc_msgSend(v59, "appendBytes:length:", v53, LODWORD(v75[1]));
    objc_msgSend(v59, "appendBytes:length:", &v74, 8);
    v54 = -[MDLMaterial scatteringFunction](obj, "scatteringFunction");
    v56 = (objc_class *)objc_opt_class(v54, v55);
    v57 = -[NSString UTF8String](NSStringFromClass(v56), "UTF8String");
    objc_msgSend(v59, "appendBytes:length:", v57, v74);
    objc_msgSend(v59, "appendData:", v12);
    v3 = v61;
    objc_msgSend(v61, "appendData:", v59);
    v5 = v60;
  }
  return (_BYTE *)objc_msgSend(v3, "length") - v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeModelSubmeshRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

@end
