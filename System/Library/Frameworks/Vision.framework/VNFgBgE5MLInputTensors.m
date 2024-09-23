@implementation VNFgBgE5MLInputTensors

- (VNFgBgE5MLInputTensors)initWithTargetPoint:(CGPoint)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8
{
  double height;
  double width;
  double y;
  double x;
  VNFgBgE5MLInputTensors *v16;
  int v17;
  int v18;
  id *v19;
  int v20;
  int v21;
  char *v22;
  uint64_t v23;
  BOOL v24;
  id *v25;
  int v26;
  char *v27;
  int v28;
  unint64_t v29;
  double v30;
  int v31;
  double v32;
  double v33;
  int v34;
  int v35;
  double v36;
  double v37;
  float *v38;
  float *v39;
  int v40;
  float v41;
  int v42;
  int v43;
  int v44;
  double v45;
  float v46;
  int v47;
  IOSurfaceRef v48;
  VNFgBgE5MLInputElement *v49;
  IOSurfaceRef IOSurfaceWithInput;
  VNFgBgE5MLInputElement *v51;
  IOSurfaceRef v52;
  VNFgBgE5MLInputElement *v53;
  VNFgBgE5MLInputTensors *v54;
  VNFgBgE5MLInputElement *v55;
  uint64_t v56;
  NSArray *inputTensors;
  unint64_t v59;
  void *v60[3];
  void *v61[3];
  void *v62[3];
  void *__p;
  void *v64;
  uint64_t v65;
  int v66;
  void *v67;
  _BYTE *v68;
  void *v69;
  _BYTE *v70;
  void *v71;
  _BYTE *v72;
  void *v73;
  _BYTE *v74;
  objc_super v75;
  _QWORD v76[6];

  height = a6.height;
  width = a6.width;
  y = a3.y;
  x = a3.x;
  v76[4] = *MEMORY[0x1E0C80C00];
  v75.receiver = self;
  v75.super_class = (Class)VNFgBgE5MLInputTensors;
  v16 = -[VNFgBgE5MLInputTensors init](&v75, sel_init);
  if (v16)
  {
    if (a5 >= 0)
      v17 = a5;
    else
      v17 = a5 + 1;
    LODWORD(v71) = -1082130432;
    std::vector<float>::vector(&v73, (int)(v17 & 0xFFFFFFFE), &v71);
    LODWORD(v69) = -1082130432;
    std::vector<float>::vector(&v71, 2 * a5, &v69);
    v18 = v17 >> 1;
    LODWORD(v67) = 1065353216;
    v59 = v17 >> 1;
    std::vector<float>::vector(&v69, v59, &v67);
    v19 = a8;
    v20 = a5 + a4;
    v66 = -971227136;
    std::vector<float>::vector(&v67, (v20 * v20), &v66);
    if (a4 >= 1)
    {
      v21 = 0;
      v22 = (char *)v67;
      v23 = a4;
      do
      {
        bzero(&v22[4 * v21], 4 * a4);
        v21 += v20;
        --v23;
      }
      while (v23);
    }
    v24 = x == -1.0 || y == -1.0;
    v25 = v19;
    if (!v24)
    {
      if (a5 >= 2)
      {
        v26 = v18 + a4;
        v27 = (char *)v67;
        v28 = a4 * v20;
        do
        {
          if (v26 >= 1)
            bzero(&v27[4 * v28], 4 * (v26 - 1) + 4);
          ++a4;
          v28 += v20;
        }
        while (a4 < v26);
      }
      if (v70 != v69)
      {
        v29 = (v70 - (_BYTE *)v69) >> 2;
        if (v29 <= 1)
          v29 = 1;
        bzero(v69, 4 * v29);
      }
      v30 = (double)a7;
      v31 = (int)fmax(x - (double)a7, 0.0);
      v32 = fmin(width + -2.0, x + (double)a7);
      v33 = (double)v31;
      if (v32 > (double)v31)
      {
        v34 = 0;
        v35 = (int)fmax(y - v30, 0.0);
        v36 = fmin(height + -2.0, y + v30);
        v37 = (double)v35;
        v38 = (float *)v73;
        v39 = (float *)v71;
        v40 = v35 + 1;
        do
        {
          if (v36 > v37)
          {
            v41 = v33 / width;
            v42 = v34;
            v43 = 2 * v34;
            v44 = v40;
            v45 = v37;
            do
            {
              v38[v43] = v41;
              v46 = v45 / height;
              v47 = v43 + 1;
              v38[v47] = v46;
              v39[v43] = v41;
              v39[v47] = v46;
              ++v42;
              v45 = (double)v44;
              v43 += 2;
              ++v44;
            }
            while (v36 > v45);
            v34 = v42;
          }
          v33 = (double)++v31;
        }
        while (v32 > (double)v31);
      }
    }
    __p = 0;
    v64 = 0;
    v65 = 0;
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v73, (uint64_t)v74, (v74 - (_BYTE *)v73) >> 2);
    v48 = createIOSurfaceWithInput(2, v59, 4, &__p, v19);
    if (__p)
    {
      v64 = __p;
      operator delete(__p);
    }
    if (v48)
    {
      v49 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v48, CFSTR("query_points_pos"));
      CFRelease(v48);
      memset(v62, 0, sizeof(v62));
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v62, v71, (uint64_t)v72, (v72 - (_BYTE *)v71) >> 2);
      IOSurfaceWithInput = createIOSurfaceWithInput(2, a5, 4, v62, v19);
      if (v62[0])
        operator delete(v62[0]);
      if (IOSurfaceWithInput)
      {
        v51 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", IOSurfaceWithInput, CFSTR("query_points"));
        CFRelease(IOSurfaceWithInput);
        memset(v61, 0, sizeof(v61));
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v61, v69, (uint64_t)v70, (v70 - (_BYTE *)v69) >> 2);
        v52 = createIOSurfaceWithInput(1, v59, 2, v61, v19);
        if (v61[0])
          operator delete(v61[0]);
        if (v52)
        {
          v53 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v52, CFSTR("query_mask_pos"));
          CFRelease(v52);
          memset(v60, 0, sizeof(v60));
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v60, v67, (uint64_t)v68, (v68 - (_BYTE *)v67) >> 2);
          v54 = (VNFgBgE5MLInputTensors *)createIOSurfaceWithInput(v20, v20, 2 * v20, v60, v25);
          if (v60[0])
            operator delete(v60[0]);
          if (v54)
          {
            v55 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v54, CFSTR("attn_mask"));
            CFRelease(v54);
            v76[0] = v49;
            v76[1] = v51;
            v76[2] = v53;
            v76[3] = v55;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 4);
            v56 = objc_claimAutoreleasedReturnValue();
            inputTensors = v16->_inputTensors;
            v16->_inputTensors = (NSArray *)v56;

            v54 = v16;
          }

        }
        else
        {
          v54 = 0;
        }

      }
      else
      {
        v54 = 0;
      }

    }
    else
    {
      v54 = 0;
    }
    if (v67)
    {
      v68 = v67;
      operator delete(v67);
    }
    if (v69)
    {
      v70 = v69;
      operator delete(v69);
    }
    if (v71)
    {
      v72 = v71;
      operator delete(v71);
    }
    if (v73)
    {
      v74 = v73;
      operator delete(v73);
    }
  }
  else
  {
    v54 = 0;
  }

  return v54;
}

- (VNFgBgE5MLInputTensors)initWithTargetPointList:(const void *)a3 queryNumber:(int)a4 maxSpatialLength:(int)a5 inputSize:(CGSize)a6 radius:(int)a7 error:(id *)a8
{
  int v10;
  VNFgBgE5MLInputTensors *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  _DWORD *v18;
  float *v19;
  float *v20;
  float *v21;
  float v22;
  float v23;
  int v25;
  char *v26;
  uint64_t v27;
  int v28;
  char *v29;
  int v30;
  IOSurfaceRef IOSurfaceWithInput;
  VNFgBgE5MLInputElement *v32;
  IOSurfaceRef v33;
  VNFgBgE5MLInputElement *v34;
  IOSurfaceRef v35;
  VNFgBgE5MLInputElement *v36;
  IOSurfaceRef v37;
  VNFgBgE5MLInputElement *v38;
  uint64_t v39;
  NSArray *inputTensors;
  VNFgBgE5MLInputTensors *v41;
  VNFgBgE5MLInputTensors *v43;
  void *v44[3];
  void *v45[3];
  void *v46[3];
  void *__p[3];
  int v48;
  void *v49;
  _BYTE *v50;
  void *v51;
  _BYTE *v52;
  void *v53;
  _BYTE *v54;
  float *v55;
  float *v56;
  objc_super v57;
  _QWORD v58[6];

  v10 = a4;
  v58[4] = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)VNFgBgE5MLInputTensors;
  v12 = -[VNFgBgE5MLInputTensors init](&v57, sel_init, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a7, a6.width, a6.height);
  if (v12)
  {
    if (a5 >= 0)
      v13 = a5;
    else
      v13 = a5 + 1;
    LODWORD(v53) = -1082130432;
    std::vector<float>::vector(&v55, (int)(v13 & 0xFFFFFFFE), &v53);
    LODWORD(v51) = -1082130432;
    std::vector<float>::vector(&v53, 2 * a5, &v51);
    v14 = (v13 >> 1);
    v15 = (int)v14;
    LODWORD(v49) = 1065353216;
    std::vector<float>::vector(&v51, (int)v14, &v49);
    v16 = a5 + v10;
    v48 = -971227136;
    std::vector<float>::vector(&v49, (v16 * v16), &v48);
    if ((_DWORD)v14 != ((*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3))
      __assert_rtn("-[VNFgBgE5MLInputTensors initWithTargetPointList:queryNumber:maxSpatialLength:inputSize:radius:error:]", "VNFgBgE5MLProcess.mm", 197, "targetPointNum == positiveMaxSpatialLength");
    if (a5 <= 1)
    {
      v17 = 0;
    }
    else
    {
      v17 = 0;
      v18 = v51;
      v19 = (float *)(*(_QWORD *)a3 + 4);
      v20 = v55 + 1;
      v21 = (float *)((char *)v53 + 4);
      do
      {
        v22 = *(v19 - 1);
        v23 = *v19;
        if (v22 != -1.0 && v23 != -1.0)
        {
          ++v17;
          *(v20 - 1) = v22;
          *v20 = v23;
          *(v21 - 1) = v22;
          *v21 = v23;
          *v18 = 0;
        }
        ++v18;
        v19 += 2;
        v20 += 2;
        v21 += 2;
        --v14;
      }
      while (v14);
    }
    v43 = v12;
    if (v10 >= 1)
    {
      v25 = 0;
      v26 = (char *)v49;
      v27 = v10;
      do
      {
        bzero(&v26[4 * v25], 4 * v10);
        v25 += v16;
        --v27;
      }
      while (v27);
    }
    if (v17 >= 1)
    {
      v28 = v17 + v10;
      v29 = (char *)v49;
      v30 = v10 * v16;
      do
      {
        if (v28 >= 1)
          bzero(&v29[4 * v30], 4 * (v28 - 1) + 4);
        ++v10;
        v30 += v16;
      }
      while (v10 < v28);
    }
    memset(__p, 0, sizeof(__p));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, v55, (uint64_t)v56, v56 - v55);
    IOSurfaceWithInput = createIOSurfaceWithInput(2, v15, 4, __p, a8);
    v12 = v43;
    if (__p[0])
      operator delete(__p[0]);
    v32 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", IOSurfaceWithInput, CFSTR("query_points_pos"));
    memset(v46, 0, sizeof(v46));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v46, v53, (uint64_t)v54, (v54 - (_BYTE *)v53) >> 2);
    v33 = createIOSurfaceWithInput(2, a5, 4, v46, a8);
    if (v46[0])
      operator delete(v46[0]);
    v34 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v33, CFSTR("query_points"));
    memset(v45, 0, sizeof(v45));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v45, v51, (uint64_t)v52, (v52 - (_BYTE *)v51) >> 2);
    v35 = createIOSurfaceWithInput(1, v15, 2, v45, a8);
    if (v45[0])
      operator delete(v45[0]);
    v36 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v35, CFSTR("query_mask_pos"));
    memset(v44, 0, sizeof(v44));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v44, v49, (uint64_t)v50, (v50 - (_BYTE *)v49) >> 2);
    v37 = createIOSurfaceWithInput(v16, v16, 2 * v16, v44, a8);
    if (v44[0])
      operator delete(v44[0]);
    v38 = -[VNFgBgE5MLInputElement initWithValueRef:name:]([VNFgBgE5MLInputElement alloc], "initWithValueRef:name:", v37, CFSTR("attn_mask"));
    v58[0] = v32;
    v58[1] = v34;
    v58[2] = v36;
    v58[3] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
    v39 = objc_claimAutoreleasedReturnValue();
    inputTensors = v43->_inputTensors;
    v43->_inputTensors = (NSArray *)v39;

    v41 = v43;
    if (v49)
    {
      v50 = v49;
      operator delete(v49);
    }
    if (v51)
    {
      v52 = v51;
      operator delete(v51);
    }
    if (v53)
    {
      v54 = v53;
      operator delete(v53);
    }
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
  }

  return v12;
}

- (NSArray)inputTensors
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputTensors, 0);
}

@end
