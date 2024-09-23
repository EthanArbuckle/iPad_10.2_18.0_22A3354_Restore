@implementation MPSGraphTensorData

- (void)dealloc
{
  __IOSurface *iosurface;
  objc_super v4;

  iosurface = self->_iosurface;
  if (iosurface)
    CFRelease(iosurface);
  v4.receiver = self;
  v4.super_class = (Class)MPSGraphTensorData;
  -[MPSGraphTensorData dealloc](&v4, sel_dealloc);
}

- (__IOSurface)iosurface
{
  __IOSurface *iosurface;
  MPSNDArray *mpsndarray;
  void *v5;
  __IOSurface *v6;

  iosurface = self->_iosurface;
  if (iosurface)
    return iosurface;
  mpsndarray = self->_mpsndarray;
  iosurface = *(Class *)((char *)&mpsndarray->super.isa + (int)*MEMORY[0x1E0CC7270]);
  if (iosurface)
    return iosurface;
  -[MPSNDArray buffer](mpsndarray, "buffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__IOSurface *)objc_msgSend(v5, "_aneIOSurface");

  return v6;
}

- (void)commonInitialize
{
  unint64_t v2;
  unint64_t v3;
  MPSNDArray *mpsndarray;

  self->_numElements = 1;
  if (self->_rank)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v3 *= *(unsigned int *)&self->_shapeValues[4 * (v2 & 0xF)];
      self->_numElements = v3;
      ++v2;
    }
    while (v2 < self->_rank);
  }
  mpsndarray = self->_mpsndarray;
  if (mpsndarray)
    self->_rowBytes = *(unint64_t *)((char *)mpsndarray + (int)*MEMORY[0x1E0CC7288]);
}

- (MPSShape)shape
{
  void *v3;
  unint64_t v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", self->_rank);
  if (self->_rank)
  {
    v4 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&self->_shapeValues[4 * (v4 & 0xF)]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v5);

      ++v4;
    }
    while (self->_rank > v4);
  }
  return (MPSShape *)v3;
}

- (unint64_t)getRank
{
  return self->_rank;
}

- (__n128)getShapeVector
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 48) = v4;
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (MPSGraphTensorData)initWithDevice:(MPSGraphDevice *)device data:(NSData *)data shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  MPSGraphTensorData *v11;
  MPSShape *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  MPSShape *v19;
  NSData *v20;
  MPSGraphDevice *v21;
  objc_super v22;

  v21 = device;
  v20 = data;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphTensorData;
  v19 = shape;
  v11 = -[MPSGraphTensorData init](&v22, sel_init);
  v11->_tensorDataType = 2;
  v12 = v19;
  v13 = -[MPSShape count](v12, "count");
  *(_QWORD *)&v14 = 0x100000001;
  *((_QWORD *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v11->_shapeValues[32] = v14;
  *(_OWORD *)&v11->_shapeValues[48] = v14;
  if (v13 >= 0x10)
    v15 = 16;
  else
    v15 = v13;
  *(_OWORD *)v11->_shapeValues = v14;
  *(_OWORD *)&v11->_shapeValues[16] = v14;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      -[MPSShape objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v11->_shapeValues[4 * i] = objc_msgSend(v17, "unsignedIntValue");

    }
  }

  v11->_rank = v15;
  v11->_dataType = dataType;
  objc_storeStrong((id *)&v11->_device, device);
  objc_storeStrong((id *)&v11->_data, data);
  -[MPSGraphTensorData commonInitialize](v11, "commonInitialize");

  return v11;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType
{
  uint64_t v5;
  id v8;
  MPSShape *v9;
  MPSGraphTensorData *v10;
  MPSGraphTensorData *v11;
  MPSShape *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  MPSGraphDevice *device;
  __IOSurface *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  MPSNDArray *mpsndarray;
  objc_super v28;

  v5 = *(_QWORD *)&dataType;
  v8 = buffer;
  v9 = shape;
  v28.receiver = self;
  v28.super_class = (Class)MPSGraphTensorData;
  v10 = -[MPSGraphTensorData init](&v28, sel_init);
  v11 = v10;
  v10->_tensorDataType = 0;
  v12 = v9;
  v13 = -[MPSShape count](v12, "count");
  *(_QWORD *)&v14 = 0x100000001;
  *((_QWORD *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v10->_shapeValues[32] = v14;
  *(_OWORD *)&v10->_shapeValues[48] = v14;
  if (v13 >= 0x10)
    v15 = 16;
  else
    v15 = v13;
  *(_OWORD *)v10->_shapeValues = v14;
  *(_OWORD *)&v10->_shapeValues[16] = v14;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      -[MPSShape objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v10->_shapeValues[4 * i] = objc_msgSend(v17, "unsignedIntValue");

    }
  }

  v10->_rank = v15;
  v10->_dataType = v5;
  objc_msgSend(v8, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  device = v11->_device;
  v11->_device = (MPSGraphDevice *)v19;

  v21 = (__IOSurface *)objc_msgSend(v8, "iosurface");
  v11->_iosurface = v21;
  if (v21)
    CFRetain(v21);
  v22 = (void *)MEMORY[0x1E0CC6FE0];
  adaptForMPS(v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "descriptorWithDataType:shape:", v5, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setPreferPackedRows:", 1);
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithBuffer:descriptor:", v8, v24);
  mpsndarray = v11->_mpsndarray;
  v11->_mpsndarray = (MPSNDArray *)v25;

  -[MPSGraphTensorData commonInitialize](v11, "commonInitialize");
  return v11;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)buffer shape:(MPSShape *)shape dataType:(MPSDataType)dataType rowBytes:(NSUInteger)rowBytes
{
  uint64_t v7;
  id v10;
  MPSGraphTensorData *v11;
  MPSGraphTensorData *v12;
  MPSShape *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  MPSGraphDevice *device;
  __IOSurface *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSUInteger v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  MPSNDArray *mpsndarray;
  MPSShape *v33;
  objc_super v34;

  v7 = *(_QWORD *)&dataType;
  v10 = buffer;
  v33 = shape;
  v34.receiver = self;
  v34.super_class = (Class)MPSGraphTensorData;
  v11 = -[MPSGraphTensorData init](&v34, sel_init);
  v12 = v11;
  v11->_tensorDataType = 0;
  v13 = v33;
  v14 = -[MPSShape count](v13, "count");
  *(_QWORD *)&v15 = 0x100000001;
  *((_QWORD *)&v15 + 1) = 0x100000001;
  *(_OWORD *)&v11->_shapeValues[32] = v15;
  *(_OWORD *)&v11->_shapeValues[48] = v15;
  if (v14 >= 0x10)
    v16 = 16;
  else
    v16 = v14;
  *(_OWORD *)v11->_shapeValues = v15;
  *(_OWORD *)&v11->_shapeValues[16] = v15;
  if (v16)
  {
    for (i = 0; i != v16; ++i)
    {
      -[MPSShape objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v11->_shapeValues[4 * i] = objc_msgSend(v18, "unsignedIntValue");

    }
  }

  v11->_rank = v16;
  v11->_dataType = v7;
  objc_msgSend(v10, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v19);
  v20 = objc_claimAutoreleasedReturnValue();
  device = v12->_device;
  v12->_device = (MPSGraphDevice *)v20;

  v22 = (__IOSurface *)objc_msgSend(v10, "iosurface");
  v12->_iosurface = v22;
  if (v22)
    CFRetain(v22);
  -[MPSShape objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v12->_rank - 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "longLongValue");

  -[MPSShape objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", v12->_rank - 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (unsigned __int16)v7 >> 3;
  v26 = objc_msgSend(v24, "longLongValue") * v25;

  if (v26 > rowBytes && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  if (rowBytes % v25 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v12->_rowBytes = rowBytes;
  v27 = (void *)MEMORY[0x1E0CC6FE0];
  adaptForMPS(v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "descriptorWithDataType:shape:", v7, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setRowBytes:", v12->_rowBytes);
  v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithBuffer:descriptor:", v10, v29);
  mpsndarray = v12->_mpsndarray;
  v12->_mpsndarray = (MPSNDArray *)v30;

  -[MPSGraphTensorData commonInitialize](v12, "commonInitialize");
  return v12;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 dataType:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t i;
  MPSGraphTensorData *v15;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  for (i = 0; i < objc_msgSend(v11, "count"); ++i)
    objc_msgSend(v13, "addObject:", &unk_1E0E98950);
  v15 = -[MPSGraphTensorData initWithMTLBuffer:shape:strides:interleaves:dataType:](self, "initWithMTLBuffer:shape:strides:interleaves:dataType:", v10, v11, v12, v13, v6);

  return v15;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strides:(id)a5 interleaves:(id)a6 dataType:(unsigned int)a7
{
  id v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  MPSGraphDevice *device;
  __IOSurface *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t rank;
  MPSGraphTensorData *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _BYTE *v39;
  char *v40;
  int64_t v41;
  unint64_t v42;
  char *v43;
  int v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  char *v49;
  uint64_t v50;
  __int128 v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  int *v57;
  int *v58;
  unint64_t v59;
  uint64_t j;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  MPSNDArray *mpsndarray;
  MPSGraphTensorData *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  int v74;
  unint64_t v75;
  BOOL v76;
  int v77;
  uint64_t v78;
  int *v79;
  int *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  int *v84;
  uint64_t v85;
  int *v86;
  uint64_t v87;
  int *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  MPSNDArray *v92;
  uint64_t v93;
  int *v94;
  MPSGraphTensorData *v95;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v109;
  id v110;
  MPSGraphTensorData *v111;
  char *__p;
  char *__pa;
  id v114;
  unint64_t v115;
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  char *v121;
  uint64_t v122;
  char *v123;
  objc_super v124;
  _QWORD v125[16];
  uint64_t v126;
  _QWORD v127[15];
  uint64_t v128;
  _QWORD v129[18];

  v129[15] = *MEMORY[0x1E0C80C00];
  v109 = a3;
  v107 = a4;
  v11 = a5;
  v114 = a6;
  v124.receiver = self;
  v124.super_class = (Class)MPSGraphTensorData;
  v12 = v11;
  v111 = -[MPSGraphTensorData init](&v124, sel_init);
  v111->_tensorDataType = 0;
  v116 = v107;
  v110 = v11;
  v13 = objc_msgSend(v116, "count");
  *(_QWORD *)&v14 = 0x100000001;
  *((_QWORD *)&v14 + 1) = 0x100000001;
  *(_OWORD *)&v111->_shapeValues[32] = v14;
  *(_OWORD *)&v111->_shapeValues[48] = v14;
  if (v13 >= 0x10)
    v15 = 16;
  else
    v15 = v13;
  *(_OWORD *)v111->_shapeValues = v14;
  *(_OWORD *)&v111->_shapeValues[16] = v14;
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v116, "objectAtIndexedSubscript:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v111->_shapeValues[4 * i] = objc_msgSend(v17, "unsignedIntValue");

    }
  }

  v111->_rank = v15;
  v111->_dataType = a7;
  objc_msgSend(v109, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  device = v111->_device;
  v111->_device = (MPSGraphDevice *)v19;

  v21 = (__IOSurface *)objc_msgSend(v109, "iosurface");
  v111->_iosurface = v21;
  if (v21)
    CFRetain(v21);
  objc_msgSend(v116, "count");
  objc_msgSend(v11, "count");
  v22 = objc_msgSend(v116, "count");
  if (v22 != objc_msgSend(v11, "count") && MTLReportFailureTypeEnabled())
  {
    v100 = objc_msgSend(v116, "count");
    v103 = objc_msgSend(v11, "count");
    MTLReportFailure();
  }
  objc_msgSend(v116, "count", v100, v103);
  objc_msgSend(v114, "count");
  v23 = objc_msgSend(v116, "count");
  if (v23 != objc_msgSend(v114, "count") && MTLReportFailureTypeEnabled())
  {
    v101 = (void *)objc_msgSend(v116, "count");
    v104 = (void *)objc_msgSend(v114, "count");
    MTLReportFailure();
  }
  memset(v129, 0, 120);
  v24 = 1;
  v128 = 1;
  memset(v127, 0, sizeof(v127));
  v126 = 1;
  memset(&v125[1], 0, 120);
  v125[0] = 1;
  rank = v111->_rank;
  v26 = v111;
  if (rank >= 0x10)
    rank = 16;
  v121 = 0;
  v122 = 0;
  v123 = 0;
  v115 = rank;
  if (!rank)
  {
    v28 = 0;
    goto LABEL_49;
  }
  v27 = 0;
  __p = 0;
  v28 = 0;
  v29 = 0;
  v24 = 1;
  v30 = rank;
  do
  {
    v32 = v30 + ~v29;
    objc_msgSend(v12, "objectAtIndexedSubscript:", v32, v101, v104);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v129[v29 - 1] = objc_msgSend(v33, "unsignedIntegerValue");

    objc_msgSend(v114, "objectAtIndexedSubscript:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
    v125[v29] = v35;

    v127[v29 - 1] = *(unsigned int *)&v111->_shapeValues[4 * (v32 & 0xF)];
    if (v29 && v35 >= 2)
    {
      if (v28 < __p)
      {
        *(_DWORD *)v28 = v29;
        v31 = (uint64_t)(v28 + 4);
LABEL_16:
        v122 = v31;
        v24 *= v35;
        v28 = (char *)v31;
        goto LABEL_17;
      }
      v36 = (v28 - v27) >> 2;
      v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 62)
        std::vector<int>::__throw_length_error[abi:ne180100]();
      if ((__p - v27) >> 1 > v37)
        v37 = (__p - v27) >> 1;
      if ((unint64_t)(__p - v27) >= 0x7FFFFFFFFFFFFFFCLL)
        v38 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v38 = v37;
      if (v38)
      {
        if (v38 >> 62)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v39 = operator new(4 * v38);
        v40 = &v39[4 * v36];
        *(_DWORD *)v40 = v29;
        v31 = (uint64_t)(v40 + 4);
        v41 = v28 - v27;
        if (v28 != v27)
        {
LABEL_30:
          v42 = v41 - 4;
          if (v42 < 0xBC
            || (v45 = (v28 - 4 - v27) & 0xFFFFFFFFFFFFFFFCLL, &v39[v28 - v27 - 4 - v45] > &v39[v28 - v27 - 4])
            || &v28[-v45 - 4] > v28 - 4
            || (unint64_t)(v27 - v39) < 0x20)
          {
            v43 = v28;
            v12 = v110;
          }
          else
          {
            v46 = (v42 >> 2) + 1;
            v47 = 4 * (v46 & 0x7FFFFFFFFFFFFFF8);
            v43 = &v28[-v47];
            v40 -= v47;
            v48 = &v39[4 * v36 - 16];
            v49 = v28 - 16;
            v50 = v46 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              v51 = *(_OWORD *)v49;
              *(v48 - 1) = *((_OWORD *)v49 - 1);
              *v48 = v51;
              v48 -= 2;
              v49 -= 32;
              v50 -= 8;
            }
            while (v50);
            v12 = v110;
            if (v46 == (v46 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_33:
              v121 = v40;
              v122 = v31;
              __p = &v39[4 * v38];
              v123 = __p;
              if (!v27)
              {
LABEL_35:
                v27 = v40;
                goto LABEL_16;
              }
LABEL_34:
              operator delete(v27);
              goto LABEL_35;
            }
          }
          do
          {
            v44 = *((_DWORD *)v43 - 1);
            v43 -= 4;
            *((_DWORD *)v40 - 1) = v44;
            v40 -= 4;
          }
          while (v43 != v27);
          goto LABEL_33;
        }
      }
      else
      {
        v39 = 0;
        v40 = (char *)(4 * v36);
        *(_DWORD *)(4 * v36) = v29;
        v31 = 4 * v36 + 4;
        v41 = v28 - v27;
        if (v28 != v27)
          goto LABEL_30;
      }
      v12 = v110;
      v121 = v40;
      v122 = v31;
      __p = &v39[4 * v38];
      v123 = __p;
      if (!v27)
        goto LABEL_35;
      goto LABEL_34;
    }
LABEL_17:
    ++v29;
    v30 = v115;
  }
  while (v29 != v115);
  if (v125[0] == 1)
    goto LABEL_47;
  v26 = v111;
  if (MTLReportFailureTypeEnabled())
  {
    objc_msgSend(v114, "lastObject");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    MTLReportFailure();

LABEL_47:
    v26 = v111;
  }
LABEL_49:
  v52 = v115 - 1;
  if (v115 <= 1)
    v53 = 1;
  else
    v53 = v115;
  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:dimensionCount:dimensionSizes:", a7, v53, &v126, v101);
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (char *)v54;
  __pa = v121;
  v56 = (v28 - v121) >> 2;
  if (v56)
  {
    v57 = (int *)MEMORY[0x1E0CC72A8];
    v58 = (int *)MEMORY[0x1E0CC72D0];
    if (v56 == 1 && v127[*(int *)v121 - 1] == v24)
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72D0]) = v24;
      v59 = v128;
      *(_DWORD *)(v54 + *v57) = v128;
      if (v115 >= 2)
      {
        for (j = 1; j != v115; ++j)
        {
          v61 = v129[j - 1];
          v62 = 4 * j;
          *(_DWORD *)(v54 + *v57 + v62) = v61 / v59;
          *(_DWORD *)(v54 + *v58 + v62) = v127[(int)(j - (j <= *(int *)__pa)) - 1];
          v59 = v61;
        }
      }
    }
    else
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72D0]) *= (_DWORD)v24;
      if (v115 >= 2)
      {
        v63 = v129[0];
        *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72A8]) = v129[0];
        v64 = v125[1];
        *(_DWORD *)(v54 + *v58 + 4) = v127[0] / v125[1];
        v65 = v115;
        if (v64 * *(unsigned int *)(v54 + *v58 + 4) != v127[0] && MTLReportFailureTypeEnabled())
        {
          objc_msgSend(v116, "description");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "description");
          v102 = (uint64_t)v106;
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          MTLReportFailure();

          v12 = v110;
          v65 = v115;
        }
        if (v65 != 2)
        {
          v97 = 0;
          do
          {
            v98 = v63;
            v63 = v129[v97 + 1];
            *(_DWORD *)&v55[4 * (v97 + 1) + *MEMORY[0x1E0CC72A8]] = v63 / v98;
            v99 = v125[v97 + 2];
            *(_DWORD *)&v55[4 * (v97 + 2) + *v58] = v127[v97 + 1] / v99;
            if (v99 * *(unsigned int *)&v55[4 * (((int)v97 + 2) & 0xFLL) + *v58] != v127[v97 + 1]
              && MTLReportFailureTypeEnabled())
            {
              objc_msgSend(v116, "description");
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v114, "description");
              v102 = (uint64_t)v105;
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              MTLReportFailure();

            }
            ++v97;
          }
          while (v65 - 2 != v97);
        }
      }
      v57 = (int *)MEMORY[0x1E0CC72A8];
      *(_DWORD *)&v55[4 * v52 + (int)*MEMORY[0x1E0CC72A8]] = v127[v52 - 1];
      v26 = v111;
    }
    v26->_rowBytes = *(unsigned int *)&v55[*v57] * (unint64_t)((unsigned __int16)a7 >> 3);
    objc_msgSend(v55, "setRowBytes:", v102, v104);
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithBuffer:descriptor:", v109, v55);
    mpsndarray = v26->_mpsndarray;
    v26->_mpsndarray = (MPSNDArray *)v66;

    v68 = v111;
    if (v115)
    {
      v69 = 0;
      v71 = *(_OWORD *)&v111->_shapeValues[32];
      v70 = *(_OWORD *)&v111->_shapeValues[48];
      v73 = *(_OWORD *)v111->_shapeValues;
      v72 = *(_OWORD *)&v111->_shapeValues[16];
      do
      {
        v74 = *(_DWORD *)&v55[4 * (v52 & 0xF) + *v58];
        v117 = v73;
        v118 = v72;
        v119 = v71;
        v120 = v70;
        *((_DWORD *)&v117 + (v69 & 0xF)) = v74;
        v71 = v119;
        v70 = v120;
        v73 = v117;
        v72 = v118;
        *(_OWORD *)&v111->_shapeValues[32] = v119;
        *(_OWORD *)&v111->_shapeValues[48] = v70;
        *(_OWORD *)v111->_shapeValues = v73;
        *(_OWORD *)&v111->_shapeValues[16] = v72;
        ++v69;
        --v52;
      }
      while (v52 != -1);
    }
    goto LABEL_87;
  }
  v75 = v128;
  if (v115)
    v76 = v128 == 1;
  else
    v76 = 1;
  v77 = !v76;
  if (v76)
  {
    v86 = (int *)MEMORY[0x1E0CC72D0];
    *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72D0]) = v126;
    if (v115 >= 2)
    {
      v87 = 0;
      v88 = (int *)MEMORY[0x1E0CC72A8];
      do
      {
        v89 = v129[v87];
        *(_DWORD *)(v54 + *v88 + 4 * v87) = v89 / v75;
        v90 = v87 + 1;
        *(_DWORD *)(v54 + *v86 + 4 * v90) = v127[v87++];
        v75 = v89;
      }
      while (v52 != v90);
    }
    *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72A8] + 4 * v52) = v127[v52 - 1];
  }
  else
  {
    if (v115 >= 0x10)
    {
      if (MTLReportFailureTypeEnabled())
      {
        v102 = objc_msgSend(v116, "count");
        MTLReportFailure();
      }
      *(_DWORD *)&v55[*MEMORY[0x1E0CC72A8]] = v75;
      *(_DWORD *)&v55[*MEMORY[0x1E0CC72D0]] = 1;
LABEL_76:
      v78 = 0;
      v79 = (int *)MEMORY[0x1E0CC72A8];
      v80 = (int *)MEMORY[0x1E0CC72D0];
      do
      {
        v81 = v78;
        v82 = v129[v78++];
        v83 = 4 * v78;
        *(_DWORD *)&v55[*v79 + v83] = v82 / v75;
        *(_DWORD *)&v55[*v80 + v83] = v127[v81 - 1];
        v75 = v82;
      }
      while (v52 != v78);
    }
    else
    {
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72A8]) = v128;
      *(_DWORD *)(v54 + (int)*MEMORY[0x1E0CC72D0]) = 1;
      if (v115 > 1)
        goto LABEL_76;
    }
    v84 = (int *)MEMORY[0x1E0CC72D0];
    v85 = 4 * v115;
    *(_DWORD *)&v55[(int)*MEMORY[0x1E0CC72D0] + v85] = v127[v115 - 2];
    *(_DWORD *)&v55[(int)*MEMORY[0x1E0CC72A8] + v85] = *(_DWORD *)&v55[4 * (v115 & 0xF) + *v84];
    ++*(_QWORD *)&v55[*MEMORY[0x1E0CC72B8]];
  }
  v26->_rowBytes = *(unsigned int *)&v55[*MEMORY[0x1E0CC72A8]] * (unint64_t)((unsigned __int16)a7 >> 3);
  objc_msgSend(v55, "setRowBytes:", v102);
  v91 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithBuffer:descriptor:", v109, v55);
  v92 = v26->_mpsndarray;
  v26->_mpsndarray = (MPSNDArray *)v91;

  v68 = v111;
  if (v77)
  {
    v93 = 0;
    v94 = (int *)MEMORY[0x1E0CC7268];
    do
    {
      *((_BYTE *)&v111->_mpsndarray->super.isa + *v94 + v93) = v93 + 1;
      ++v93;
    }
    while (v115 != v93);
    *((_BYTE *)&v111->_mpsndarray->super.isa + *v94 + v115) = 0;
    --*(Class *)((char *)&v111->_mpsndarray->super.isa + (int)*MEMORY[0x1E0CC7280]);
  }
LABEL_87:
  -[MPSGraphTensorData commonInitialize](v68, "commonInitialize");
  v95 = v68;

  if (__pa)
    operator delete(__pa);

  return v95;
}

- (MPSGraphTensorData)initWithMTLBuffer:(id)a3 shape:(id)a4 strideBytes:(id)a5 dataType:(unsigned int)a6
{
  uint64_t v6;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  MPSGraphTensorData *v17;
  void *v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = *(_QWORD *)&a6;
  v28 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v22;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "integerValue");
        if (v15 < 1 || v15 % (unint64_t)((unsigned __int16)v6 >> 3))
        {
          if (MTLReportFailureTypeEnabled())
          {
            objc_msgSend(v11, "description");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            MTLReportFailure();

          }
          v17 = 0;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
        continue;
      break;
    }
  }

  self = -[MPSGraphTensorData initWithMTLBuffer:shape:strides:dataType:](self, "initWithMTLBuffer:shape:strides:dataType:", v20, v21, v10, v6);
  v17 = self;
LABEL_14:

  return v17;
}

- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix rank:(NSUInteger)rank
{
  MPSMatrix *v6;
  MPSGraphTensorData *v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  MPSGraphDevice *device;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  MPSNDArray *mpsndarray;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _QWORD v33[3];
  int64x2_t v34;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = matrix;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphTensorData;
  v7 = -[MPSGraphTensorData init](&v32, sel_init);
  v7->_tensorDataType = 0;
  v33[0] = -[MPSMatrix columns](v6, "columns");
  v33[1] = -[MPSMatrix rows](v6, "rows");
  v33[2] = -[MPSMatrix matrices](v6, "matrices");
  v34 = vdupq_n_s64(1uLL);
  v35 = v34;
  v36 = v34;
  v37 = v34;
  v38 = v34;
  v39 = v34;
  v40 = 1;
  if (rank - 1 >= 0x10 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v8 = 0;
  v9 = 16;
  if (rank < 0x10)
    v9 = rank;
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  *(_QWORD *)&v11 = 0x100000001;
  *((_QWORD *)&v11 + 1) = 0x100000001;
  *(_OWORD *)&v7->_shapeValues[32] = v11;
  *(_OWORD *)&v7->_shapeValues[48] = v11;
  *(_OWORD *)v7->_shapeValues = v11;
  *(_OWORD *)&v7->_shapeValues[16] = v11;
  v7->_rank = v10;
  v13 = *(_OWORD *)&v7->_shapeValues[32];
  v12 = *(_OWORD *)&v7->_shapeValues[48];
  v15 = *(_OWORD *)v7->_shapeValues;
  v14 = *(_OWORD *)&v7->_shapeValues[16];
  v16 = v10 - 1;
  do
  {
    v17 = v33[v16];
    v28 = v15;
    v29 = v14;
    v30 = v13;
    v31 = v12;
    *((_DWORD *)&v28 + (v8 & 0xF)) = v17;
    v13 = v30;
    v12 = v31;
    v15 = v28;
    v14 = v29;
    *(_OWORD *)&v7->_shapeValues[32] = v30;
    *(_OWORD *)&v7->_shapeValues[48] = v12;
    *(_OWORD *)v7->_shapeValues = v15;
    *(_OWORD *)&v7->_shapeValues[16] = v14;
    ++v8;
    --v16;
  }
  while (v16 != -1);
  v7->_dataType = -[MPSMatrix dataType](v6, "dataType");
  -[MPSMatrix device](v6, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  device = v7->_device;
  v7->_device = (MPSGraphDevice *)v19;

  v21 = -[MPSMatrix columns](v6, "columns");
  v7->_rowBytes = v21 * ((unsigned __int16)-[MPSMatrix dataType](v6, "dataType") >> 3);
  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSMatrix dataType](v6, "dataType"), v10, v33);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPSMatrix rowBytes](v6, "rowBytes") == v7->_rowBytes)
    objc_msgSend(v22, "setPreferPackedRows:", 1);
  v23 = objc_alloc(MEMORY[0x1E0CC6F50]);
  -[MPSMatrix data](v6, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "initWithBuffer:descriptor:", v24, v22);
  mpsndarray = v7->_mpsndarray;
  v7->_mpsndarray = (MPSNDArray *)v25;

  -[MPSGraphTensorData commonInitialize](v7, "commonInitialize");
  return v7;
}

- (MPSGraphTensorData)initWithMPSMatrix:(MPSMatrix *)matrix
{
  MPSMatrix *v4;
  MPSGraphTensorData *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  uint64_t v18;
  MPSGraphDevice *device;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  MPSNDArray *mpsndarray;
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v4 = matrix;
  v27.receiver = self;
  v27.super_class = (Class)MPSGraphTensorData;
  v5 = -[MPSGraphTensorData init](&v27, sel_init);
  v5->_tensorDataType = 0;
  v6 = -[MPSMatrix columns](v4, "columns");
  v7 = v6;
  v28[0] = v6;
  v8 = -[MPSMatrix rows](v4, "rows");
  v9 = v8;
  v28[1] = v8;
  v10 = -[MPSMatrix matrices](v4, "matrices");
  v28[2] = v10;
  if (v10 == 1)
    v11 = 2;
  else
    v11 = 3;
  *(_QWORD *)&v12 = 0x100000001;
  *((_QWORD *)&v12 + 1) = 0x100000001;
  *(_OWORD *)&v5->_shapeValues[32] = v12;
  *(_OWORD *)&v5->_shapeValues[48] = v12;
  *(_OWORD *)v5->_shapeValues = v12;
  *(_OWORD *)&v5->_shapeValues[16] = v12;
  v5->_rank = v11;
  v14 = *(_OWORD *)&v5->_shapeValues[32];
  v13 = *(_OWORD *)&v5->_shapeValues[48];
  v15 = *(_OWORD *)v5->_shapeValues;
  v16 = *(_OWORD *)&v5->_shapeValues[16];
  if (v10 == 1)
  {
    *(_QWORD *)&v15 = __PAIR64__(v7, v9);
    *(_DWORD *)v5->_shapeValues = v9;
  }
  else
  {
    *(_QWORD *)&v15 = __PAIR64__(v9, v10);
    *(_OWORD *)&v5->_shapeValues[32] = v14;
    *(_OWORD *)&v5->_shapeValues[48] = v13;
    *(_OWORD *)v5->_shapeValues = v15;
    *(_OWORD *)&v5->_shapeValues[16] = v16;
    DWORD2(v15) = v7;
  }
  *(_OWORD *)v5->_shapeValues = v15;
  *(_OWORD *)&v5->_shapeValues[16] = v16;
  *(_OWORD *)&v5->_shapeValues[32] = v14;
  *(_OWORD *)&v5->_shapeValues[48] = v13;
  v5->_dataType = -[MPSMatrix dataType](v4, "dataType");
  -[MPSMatrix device](v4, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  device = v5->_device;
  v5->_device = (MPSGraphDevice *)v18;

  v20 = -[MPSMatrix columns](v4, "columns");
  v5->_rowBytes = v20 * ((unsigned __int16)-[MPSMatrix dataType](v4, "dataType") >> 3);
  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSMatrix dataType](v4, "dataType"), v11, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MPSMatrix rowBytes](v4, "rowBytes") == v5->_rowBytes)
    objc_msgSend(v21, "setPreferPackedRows:", 1);
  v22 = objc_alloc(MEMORY[0x1E0CC6F50]);
  -[MPSMatrix data](v4, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "initWithBuffer:descriptor:", v23, v21);
  mpsndarray = v5->_mpsndarray;
  v5->_mpsndarray = (MPSNDArray *)v24;

  -[MPSGraphTensorData commonInitialize](v5, "commonInitialize");
  return v5;
}

- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector
{
  MPSVector *v4;
  MPSGraphTensorData *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  MPSGraphDevice *device;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  MPSNDArray *mpsndarray;
  objc_super v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = vector;
  v26.receiver = self;
  v26.super_class = (Class)MPSGraphTensorData;
  v5 = -[MPSGraphTensorData init](&v26, sel_init);
  v5->_tensorDataType = 0;
  v6 = -[MPSVector length](v4, "length");
  v7 = v6;
  v27[0] = v6;
  v8 = -[MPSVector vectors](v4, "vectors");
  v27[1] = v8;
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2;
  *(_QWORD *)&v10 = 0x100000001;
  *((_QWORD *)&v10 + 1) = 0x100000001;
  *(_OWORD *)&v5->_shapeValues[32] = v10;
  *(_OWORD *)&v5->_shapeValues[48] = v10;
  *(_OWORD *)v5->_shapeValues = v10;
  *(_OWORD *)&v5->_shapeValues[16] = v10;
  v5->_rank = v9;
  v12 = *(_OWORD *)&v5->_shapeValues[32];
  v11 = *(_OWORD *)&v5->_shapeValues[48];
  v13 = *(_OWORD *)v5->_shapeValues;
  v14 = *(_OWORD *)&v5->_shapeValues[16];
  if (v8 == 1)
  {
    LODWORD(v13) = v7;
  }
  else
  {
    *(_QWORD *)&v13 = __PAIR64__(v7, v8);
    *(_DWORD *)v5->_shapeValues = v8;
  }
  *(_OWORD *)v5->_shapeValues = v13;
  *(_OWORD *)&v5->_shapeValues[16] = v14;
  *(_OWORD *)&v5->_shapeValues[32] = v12;
  *(_OWORD *)&v5->_shapeValues[48] = v11;
  v5->_dataType = -[MPSVector dataType](v4, "dataType");
  -[MPSVector device](v4, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  device = v5->_device;
  v5->_device = (MPSGraphDevice *)v16;

  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSVector dataType](v4, "dataType"), v9, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MPSVector vectorBytes](v4, "vectorBytes");
  v20 = -[MPSVector length](v4, "length");
  if (v19 == v20 * ((unsigned __int16)-[MPSVector dataType](v4, "dataType") >> 3))
    objc_msgSend(v18, "setPreferPackedRows:", 1);
  v21 = objc_alloc(MEMORY[0x1E0CC6F50]);
  -[MPSVector data](v4, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "initWithBuffer:descriptor:", v22, v18);
  mpsndarray = v5->_mpsndarray;
  v5->_mpsndarray = (MPSNDArray *)v23;

  -[MPSGraphTensorData commonInitialize](v5, "commonInitialize");
  return v5;
}

- (MPSGraphTensorData)initWithMPSVector:(MPSVector *)vector rank:(NSUInteger)rank
{
  MPSVector *v6;
  MPSGraphTensorData *v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  MPSGraphDevice *device;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  MPSNDArray *mpsndarray;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _QWORD v34[2];
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  int64x2_t v38;
  int64x2_t v39;
  int64x2_t v40;
  int64x2_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = vector;
  v33.receiver = self;
  v33.super_class = (Class)MPSGraphTensorData;
  v7 = -[MPSGraphTensorData init](&v33, sel_init);
  v7->_tensorDataType = 0;
  v34[0] = -[MPSVector length](v6, "length");
  v34[1] = -[MPSVector vectors](v6, "vectors");
  v35 = vdupq_n_s64(1uLL);
  v36 = v35;
  v37 = v35;
  v38 = v35;
  v39 = v35;
  v40 = v35;
  v41 = v35;
  if (rank - 1 >= 0x10 && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  v8 = 0;
  v9 = 16;
  if (rank < 0x10)
    v9 = rank;
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  *(_QWORD *)&v11 = 0x100000001;
  *((_QWORD *)&v11 + 1) = 0x100000001;
  *(_OWORD *)&v7->_shapeValues[32] = v11;
  *(_OWORD *)&v7->_shapeValues[48] = v11;
  *(_OWORD *)v7->_shapeValues = v11;
  *(_OWORD *)&v7->_shapeValues[16] = v11;
  v7->_rank = v10;
  v13 = *(_OWORD *)&v7->_shapeValues[32];
  v12 = *(_OWORD *)&v7->_shapeValues[48];
  v15 = *(_OWORD *)v7->_shapeValues;
  v14 = *(_OWORD *)&v7->_shapeValues[16];
  v16 = v10 - 1;
  do
  {
    v17 = v34[v16];
    v29 = v15;
    v30 = v14;
    v31 = v13;
    v32 = v12;
    *((_DWORD *)&v29 + (v8 & 0xF)) = v17;
    v13 = v31;
    v12 = v32;
    v15 = v29;
    v14 = v30;
    *(_OWORD *)&v7->_shapeValues[32] = v31;
    *(_OWORD *)&v7->_shapeValues[48] = v12;
    *(_OWORD *)v7->_shapeValues = v15;
    *(_OWORD *)&v7->_shapeValues[16] = v14;
    ++v8;
    --v16;
  }
  while (v16 != -1);
  v7->_dataType = -[MPSVector dataType](v6, "dataType");
  -[MPSVector device](v6, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v18);
  v19 = objc_claimAutoreleasedReturnValue();
  device = v7->_device;
  v7->_device = (MPSGraphDevice *)v19;

  objc_msgSend(MEMORY[0x1E0CC6FE0], "descriptorWithDataType:dimensionCount:dimensionSizes:", -[MPSVector dataType](v6, "dataType"), v10, v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MPSVector vectorBytes](v6, "vectorBytes");
  v23 = -[MPSVector length](v6, "length");
  if (v22 == v23 * ((unsigned __int16)-[MPSVector dataType](v6, "dataType") >> 3))
    objc_msgSend(v21, "setPreferPackedRows:", 1);
  v24 = objc_alloc(MEMORY[0x1E0CC6F50]);
  -[MPSVector data](v6, "data");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "initWithBuffer:descriptor:", v25, v21);
  mpsndarray = v7->_mpsndarray;
  v7->_mpsndarray = (MPSNDArray *)v26;

  -[MPSGraphTensorData commonInitialize](v7, "commonInitialize");
  return v7;
}

- (MPSGraphTensorData)initWithMPSNDArray:(id)a3 device:(id)a4
{
  char *v7;
  id v8;
  MPSGraphTensorData *v9;
  MPSGraphTensorData *v10;
  MPSGraphTensorData *v11;
  __int128 v12;
  unint64_t rank;
  unint64_t v14;
  uint64_t v15;
  int *v16;
  int *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;

  v7 = (char *)a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MPSGraphTensorData;
  v9 = -[MPSGraphTensorData init](&v28, sel_init);
  v10 = v9;
  v11 = v9;
  v9->_tensorDataType = 0;
  v9->_rank = *(_QWORD *)&v7[*MEMORY[0x1E0CC7280]];
  *(_QWORD *)&v12 = 0x100000001;
  *((_QWORD *)&v12 + 1) = 0x100000001;
  *(_OWORD *)v9->_shapeValues = v12;
  *(_OWORD *)&v9->_shapeValues[16] = v12;
  *(_OWORD *)&v9->_shapeValues[32] = v12;
  *(_OWORD *)&v9->_shapeValues[48] = v12;
  rank = v9->_rank;
  if (rank)
  {
    v14 = 0;
    v15 = -1;
    v16 = (int *)MEMORY[0x1E0CC7290];
    v17 = (int *)MEMORY[0x1E0CC7268];
    *(_QWORD *)&v18 = 0x100000001;
    *((_QWORD *)&v18 + 1) = 0x100000001;
    *(_QWORD *)&v19 = 0x100000001;
    *((_QWORD *)&v19 + 1) = 0x100000001;
    *(_QWORD *)&v20 = 0x100000001;
    *((_QWORD *)&v20 + 1) = 0x100000001;
    do
    {
      v21 = &v7[*v16];
      v23 = *(_OWORD *)&v7[*v17];
      LODWORD(v21) = *(_DWORD *)&v21[4 * (*(_BYTE *)((unint64_t)&v23 | v14 & 0xF) & 0xF)];
      v24 = v12;
      v25 = v18;
      v26 = v19;
      v27 = v20;
      *((_DWORD *)&v24 + (((_BYTE)rank + (_BYTE)v15) & 0xF)) = (_DWORD)v21;
      v19 = v26;
      v20 = v27;
      v12 = v24;
      v18 = v25;
      *(_OWORD *)&v9->_shapeValues[32] = v26;
      *(_OWORD *)&v9->_shapeValues[48] = v20;
      *(_OWORD *)v9->_shapeValues = v12;
      *(_OWORD *)&v9->_shapeValues[16] = v18;
      ++v14;
      rank = v9->_rank;
      --v15;
    }
    while (v14 < rank);
  }
  v9->_dataType = objc_msgSend(v7, "dataType", v23, v24, v25, v26, v27);
  objc_storeStrong((id *)&v10->_device, a4);
  objc_storeStrong((id *)&v10->_mpsndarray, a3);
  -[MPSGraphTensorData commonInitialize](v11, "commonInitialize");

  return v11;
}

- (MPSGraphTensorData)initWithMPSNDArray:(MPSNDArray *)ndarray
{
  MPSNDArray *v4;
  void *v5;
  void *v6;
  MPSGraphTensorData *v7;

  v4 = ndarray;
  -[MPSNDArray device](v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MPSGraphTensorData initWithMPSNDArray:device:](self, "initWithMPSNDArray:device:", v4, v6);

  return v7;
}

- (MPSGraphTensorData)initWithMPSImageBatch:(MPSImageBatch *)imageBatch
{
  MPSImageBatch *v5;
  MPSGraphTensorData *v6;
  __int128 v7;
  void *v8;
  void *v9;
  void *v10;
  MPSImageBatch *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  MPSGraphDevice *device;
  void *v21;
  objc_super v22;

  v5 = imageBatch;
  v22.receiver = self;
  v22.super_class = (Class)MPSGraphTensorData;
  v6 = -[MPSGraphTensorData init](&v22, sel_init);
  v6->_tensorDataType = 1;
  v6->_rank = 4;
  *(_QWORD *)&v7 = 0x100000001;
  *((_QWORD *)&v7 + 1) = 0x100000001;
  *(_OWORD *)&v6->_shapeValues[32] = v7;
  *(_OWORD *)&v6->_shapeValues[48] = v7;
  *(_OWORD *)v6->_shapeValues = v7;
  *(_OWORD *)&v6->_shapeValues[16] = v7;
  *(_DWORD *)v6->_shapeValues = -[MPSImageBatch count](v5, "count");
  -[MPSImageBatch objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v6->_shapeValues[4] = objc_msgSend(v8, "height");

  -[MPSImageBatch objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v6->_shapeValues[8] = objc_msgSend(v9, "width");

  -[MPSImageBatch objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)&v6->_shapeValues[12] = objc_msgSend(v10, "featureChannels");

  v11 = v5;
  -[MPSImageBatch objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "featureChannelFormat");

  if ((unint64_t)(v13 - 1) >= 4)
  {
    if (MTLReportFailureTypeEnabled())
    {
      -[MPSImageBatch objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      MTLReportFailure();

    }
    v14 = 268435488;
  }
  else
  {
    v14 = *(_DWORD *)&asc_18128FD80[4 * v13 - 4];
  }

  v6->_dataType = v14;
  -[MPSImageBatch objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPSGraphDevice deviceWithMTLDevice:](MPSGraphDevice, "deviceWithMTLDevice:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  device = v6->_device;
  v6->_device = (MPSGraphDevice *)v18;

  objc_storeStrong((id *)&v6->_mpsimagebatch, imageBatch);
  -[MPSGraphTensorData commonInitialize](v6, "commonInitialize");

  return v6;
}

- (MPSGraphTensorData)initWithDevice:(id)a3 IOSurface:(__IOSurface *)a4 rowBytesAlignment:(unint64_t)a5 shape:(id)a6 dataType:(unsigned int)a7
{
  uint64_t v7;
  char *v13;
  id v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __IOSurface *v29;
  id v30;
  id v31;
  objc_super v32;

  v7 = *(_QWORD *)&a7;
  v30 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MPSGraphTensorData;
  v31 = a6;
  v13 = -[MPSGraphTensorData init](&v32, sel_init);
  *((_QWORD *)v13 + 17) = 0;
  adaptForMPS(v31);
  v29 = a4;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");
  v16 = v13 + 32;
  *(_QWORD *)&v17 = 0x100000001;
  *((_QWORD *)&v17 + 1) = 0x100000001;
  *((_OWORD *)v13 + 4) = v17;
  *((_OWORD *)v13 + 5) = v17;
  if (v15 >= 0x10)
    v18 = 16;
  else
    v18 = v15;
  *v16 = v17;
  *((_OWORD *)v13 + 3) = v17;
  if (v18)
  {
    for (i = 0; i != v18; ++i)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v13[4 * i + 32] = objc_msgSend(v20, "unsignedIntValue");

    }
  }

  *((_QWORD *)v13 + 12) = v18;
  *((_DWORD *)v13 + 36) = v7;
  objc_storeStrong((id *)v13 + 19, a3);
  *((_QWORD *)v13 + 1) = (a5
                        + *((unsigned int *)v16 + ((*((_DWORD *)v13 + 24) - 1) & 0xF))
                        * (unint64_t)((unsigned __int16)v7 >> 3)
                        - 1)
                       / a5
                       * a5;
  v21 = (void *)MEMORY[0x1E0CC6FE0];
  adaptForMPS(v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "descriptorWithDataType:shape:", v7, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setRowBytes:", *((_QWORD *)v13 + 1));
  *((_QWORD *)v13 + 15) = v29;
  CFRetain(v29);
  objc_msgSend(v30, "metalDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "newBufferWithIOSurface:", v29);

  if (v25)
  {
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6F50]), "initWithBuffer:descriptor:", v25, v23);
    v27 = (void *)*((_QWORD *)v13 + 13);
    *((_QWORD *)v13 + 13) = v26;

  }
  else if (MTLReportFailureTypeEnabled())
  {
    MTLReportFailure();
  }
  objc_msgSend(v13, "commonInitialize");

  return (MPSGraphTensorData *)v13;
}

- (MPSGraphTensorData)initWithDevice:(id)a3 rowBytesAlignment:(unint64_t)a4 shape:(id)a5 dataType:(unsigned int)a6
{
  char *v10;
  MPSGraphTensorData *v11;
  id v12;
  unint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  MPSNDArray *mpsndarray;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFDictionary *Copy;
  IOSurfaceRef v47;
  uint64_t v48;
  id v50;
  id v52;
  _OWORD v53[4];
  _OWORD v54[4];
  objc_super v55;

  v50 = a3;
  v52 = a5;
  v55.receiver = self;
  v55.super_class = (Class)MPSGraphTensorData;
  v10 = -[MPSGraphTensorData init](&v55, sel_init);
  v11 = (MPSGraphTensorData *)v10;
  *((_QWORD *)v10 + 17) = 0;
  adaptForMPS(v52);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  v14 = v10 + 32;
  *(_QWORD *)&v15 = 0x100000001;
  *((_QWORD *)&v15 + 1) = 0x100000001;
  *((_OWORD *)v10 + 4) = v15;
  *((_OWORD *)v10 + 5) = v15;
  if (v13 >= 0x10)
    v16 = 16;
  else
    v16 = v13;
  *v14 = v15;
  *((_OWORD *)v10 + 3) = v15;
  if (v16)
  {
    for (i = 0; i != v16; ++i)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v10[4 * i + 32] = objc_msgSend(v18, "unsignedIntValue");

    }
  }

  *((_QWORD *)v10 + 12) = v16;
  *((_DWORD *)v10 + 36) = a6;
  v19 = (id *)(v10 + 152);
  objc_storeStrong((id *)v10 + 19, a3);
  *((_QWORD *)v10 + 1) = (a4
                        + *((unsigned int *)v14 + ((*((_DWORD *)v10 + 24) - 1) & 0xF))
                        * (unint64_t)((unsigned __int16)a6 >> 3)
                        - 1)
                       / a4
                       * a4;
  if (objc_msgSend(*((id *)v10 + 19), "type") != 1)
  {
    if (objc_msgSend(*v19, "type") != 2)
    {
      v35 = (void *)MEMORY[0x1E0CC6FE0];
      adaptForMPS(v52);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "descriptorWithDataType:shape:", a6, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "setRowBytes:", v11->_rowBytes);
      v38 = objc_alloc(MEMORY[0x1E0CC6F50]);
      objc_msgSend(*v19, "metalDevice");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "initWithDevice:descriptor:", v39, v37);
      mpsndarray = v11->_mpsndarray;
      v11->_mpsndarray = (MPSNDArray *)v40;

LABEL_24:
      goto LABEL_25;
    }
    v27 = *((_QWORD *)v10 + 12) - 1;
    if (*((_QWORD *)v10 + 12) == 1)
    {
      v34 = *((_QWORD *)v10 + 1);
      if (v34)
      {
LABEL_23:
        v37 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v44, *MEMORY[0x1E0CBC1E0]);

        objc_msgSend(v37, "setObject:forKeyedSubscript:", &unk_1E0E98950, *MEMORY[0x1E0CBC008]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v45, *MEMORY[0x1E0CBBF08]);

        Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDictionaryRef)v37);
        v47 = IOSurfaceCreate(Copy);
        CFRelease(Copy);
        v48 = -[MPSGraphTensorData initWithDevice:IOSurface:rowBytesAlignment:shape:dataType:](v11, "initWithDevice:IOSurface:rowBytesAlignment:shape:dataType:", v50, v47, a4, v52, a6);
        CFRelease(v47);
        v11 = (MPSGraphTensorData *)v48;
        goto LABEL_24;
      }
    }
    else
    {
      v28 = 0;
      v30 = *((_OWORD *)v10 + 4);
      v29 = *((_OWORD *)v10 + 5);
      v32 = *((_OWORD *)v10 + 2);
      v31 = *((_OWORD *)v10 + 3);
      v33 = 1;
      do
      {
        v54[0] = v32;
        v54[1] = v31;
        v54[2] = v30;
        v54[3] = v29;
        v33 *= *((unsigned int *)v54 + (v28++ & 0xF));
      }
      while (v27 != v28);
      v34 = *((_QWORD *)v10 + 1) * v33;
      if (v34)
        goto LABEL_23;
    }
    NSLog(CFSTR("invalid PlaneCount (%lu) or PlaneStride (%lu)"), 1, 0);
    goto LABEL_23;
  }
  v20 = *((_QWORD *)v10 + 12) - 1;
  if (*((_QWORD *)v10 + 12) == 1)
  {
    v26 = 1;
  }
  else
  {
    v21 = 0;
    v23 = *((_OWORD *)v10 + 4);
    v22 = *((_OWORD *)v10 + 5);
    v25 = *((_OWORD *)v10 + 2);
    v24 = *((_OWORD *)v10 + 3);
    v26 = 1;
    do
    {
      v53[0] = v25;
      v53[1] = v24;
      v53[2] = v23;
      v53[3] = v22;
      v26 *= *((unsigned int *)v53 + (v21++ & 0xF));
    }
    while (v20 != v21);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(*((_QWORD *)v10 + 1) * v26, 0x4BDB370AuLL), *((_QWORD *)v10 + 1) * v26, 1);
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)*((_QWORD *)v10 + 16);
  *((_QWORD *)v10 + 16) = v42;

  *((_QWORD *)v10 + 17) = 2;
  v11 = (MPSGraphTensorData *)objc_msgSend(v10, "initWithDevice:data:shape:dataType:", v50, *((_QWORD *)v10 + 16), v52, a6);
LABEL_25:
  -[MPSGraphTensorData commonInitialize](v11, "commonInitialize");

  return v11;
}

- (id)initEmptyWithShape:(id)a3 dataType:(unsigned int)a4 device:(id)a5
{
  id v8;
  MPSGraphTensorData *v9;
  id v10;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v17;
  objc_super v18;

  v8 = a3;
  v17 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MPSGraphTensorData;
  v9 = -[MPSGraphTensorData init](&v18, sel_init);
  v9->_tensorDataType = 0;
  v10 = v8;
  v11 = objc_msgSend(v10, "count");
  *(_QWORD *)&v12 = 0x100000001;
  *((_QWORD *)&v12 + 1) = 0x100000001;
  *(_OWORD *)&v9->_shapeValues[32] = v12;
  *(_OWORD *)&v9->_shapeValues[48] = v12;
  if (v11 >= 0x10)
    v13 = 16;
  else
    v13 = v11;
  *(_OWORD *)v9->_shapeValues = v12;
  *(_OWORD *)&v9->_shapeValues[16] = v12;
  if (v13)
  {
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)&v9->_shapeValues[4 * i] = objc_msgSend(v15, "unsignedIntValue");

    }
  }

  v9->_rank = v13;
  v9->_dataType = a4;
  objc_storeStrong((id *)&v9->_device, a5);
  -[MPSGraphTensorData commonInitialize](v9, "commonInitialize");

  return v9;
}

- (id)mpsndarrayWithCommandBuffer:(id)a3
{
  id v4;
  MPSNDArray *mpsndarray;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  MPSNDArray *v15;
  MPSNDArray *v16;
  MPSNDArray *v17;
  MPSNDArray *v18;
  unsigned int dataType;
  void *v21;
  _QWORD v22[3];

  v4 = a3;
  if (self->_tensorDataType == 1)
  {
    mpsndarray = self->_mpsndarray;
    if (!mpsndarray)
    {
      v21 = (void *)MEMORY[0x1E0CC6FE0];
      dataType = self->_dataType;
      -[NSArray objectAtIndexedSubscript:](self->_mpsimagebatch, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "featureChannels");
      -[NSArray objectAtIndexedSubscript:](self->_mpsimagebatch, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "width");
      -[NSArray objectAtIndexedSubscript:](self->_mpsimagebatch, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "descriptorWithDataType:dimensionSizes:", dataType, v7, v9, objc_msgSend(v10, "height"), -[NSArray count](self->_mpsimagebatch, "count"), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x1E0CC6F50]);
      -[NSArray objectAtIndexedSubscript:](self->_mpsimagebatch, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (MPSNDArray *)objc_msgSend(v12, "initWithDevice:descriptor:", v14, v11);
      v16 = self->_mpsndarray;
      self->_mpsndarray = v15;

      mpsndarray = self->_mpsndarray;
    }
    memset(v22, 0, sizeof(v22));
    -[MPSNDArray importDataWithCommandBuffer:fromImages:offset:](mpsndarray, "importDataWithCommandBuffer:fromImages:offset:", v4, self->_mpsimagebatch, v22);
    v17 = self->_mpsndarray;
  }
  else
  {
    -[MPSGraphTensorData mpsndarray](self, "mpsndarray");
    v17 = (MPSNDArray *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (MPSNDArray)mpsndarray
{
  MPSNDArray *mpsndarray;
  MPSNDArray *v3;
  int64_t tensorDataType;
  void *v6;
  uint64_t dataType;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  MPSNDArray *v13;
  MPSNDArray *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  mpsndarray = self->_mpsndarray;
  if (mpsndarray)
  {
    v3 = mpsndarray;
  }
  else
  {
    tensorDataType = self->_tensorDataType;
    if (tensorDataType == 1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_mpsimagebatch, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "newCommandQueue");
      objc_msgSend(v17, "commandBuffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[MPSGraphTensorData mpsndarrayWithCommandBuffer:](self, "mpsndarrayWithCommandBuffer:", v10);
      objc_msgSend(v10, "commit");
      objc_msgSend(v10, "waitUntilCompleted");
    }
    else
    {
      if (tensorDataType != 2)
      {
        v3 = (MPSNDArray *)0;
        return v3;
      }
      v6 = (void *)MEMORY[0x1E0CC6FE0];
      dataType = self->_dataType;
      -[MPSGraphTensorData shape](self, "shape");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      adaptForMPS(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptorWithDataType:shape:", dataType, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_alloc(MEMORY[0x1E0CC6F50]);
      -[MPSGraphDevice metalDevice](self->_device, "metalDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (MPSNDArray *)objc_msgSend(v11, "initWithDevice:descriptor:", v12, v10);
      v14 = self->_mpsndarray;
      self->_mpsndarray = v13;

      -[MPSNDArray writeBytes:strideBytes:](self->_mpsndarray, "writeBytes:strideBytes:", -[NSData bytes](self->_data, "bytes"), 0);
    }

    v3 = self->_mpsndarray;
  }
  return v3;
}

- (void)copyDataFromNDArrayToImageBatchWithCommandBuffer:(id)a3
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  -[MPSNDArray exportDataWithCommandBuffer:toImages:offset:](self->_mpsndarray, "exportDataWithCommandBuffer:toImages:offset:", a3, self->_mpsimagebatch, v3);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MPSGraphTensorData;
  -[MPSGraphTensorData debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSNDArray debugDescription](self->_mpsndarray, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray debugDescription](self->_mpsimagebatch, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nmpsndarray: %@, imageBatch: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)printNDArray
{
  id v2;

  -[MPSGraphTensorData mpsndarray](self, "mpsndarray");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printNDArray");

}

- (void)printIOSurface
{
  int rank;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char *BaseAddress;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int j;
  int i;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[4];
  _OWORD v30[4];
  _OWORD v31[4];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;

  rank = self->_rank;
  v4 = *(_OWORD *)self->_shapeValues;
  v5 = *(_OWORD *)&self->_shapeValues[16];
  v6 = *(_OWORD *)&self->_shapeValues[48];
  v33 = *(_OWORD *)&self->_shapeValues[32];
  v34 = v6;
  v32[0] = v4;
  v32[1] = v5;
  v7 = *((unsigned int *)v32 + (((_BYTE)rank - 1) & 0xF));
  v31[2] = v33;
  v31[3] = v6;
  v31[0] = v4;
  v31[1] = v5;
  v8 = *((unsigned int *)v31 + (((_BYTE)rank - 2) & 0xF));
  v30[2] = v33;
  v30[3] = v6;
  v30[0] = v4;
  v30[1] = v5;
  v9 = *((_DWORD *)v30 + (((_BYTE)rank - 3) & 0xF));
  v10 = (rank - 4) & 0xFLL;
  v29[2] = v33;
  v29[3] = v6;
  v29[0] = v4;
  v29[1] = v5;
  IOSurfaceLock(self->_iosurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(self->_iosurface);
  printf("IOSurface %dx%dx%dx%d\n\n", *((_DWORD *)v29 + v10), v9, v8, v7);
  if (v9)
  {
    if ((_DWORD)v8)
    {
      if ((_DWORD)v7)
      {
        v12 = 0;
        v13 = 0;
        v26 = v9;
        do
        {
          v27 = v13;
          printf("Channel %d:    \n", v13);
          v14 = 0;
          v28 = v12;
          do
          {
            v15 = v7;
            v16 = BaseAddress;
            do
            {
              _H0 = *(_WORD *)&v16[v12 * self->_rowBytes];
              __asm { FCVT            D0, H0 }
              printf("%f ", _D0);
              v16 += 2;
              --v15;
            }
            while (v15);
            putchar(10);
            ++v14;
            ++v12;
          }
          while (v14 != v8);
          putchar(10);
          v13 = v27 + 1;
          v12 = v28 + v8;
        }
        while (v27 + 1 != v26);
      }
      else
      {
        for (i = 0; i != v9; ++i)
        {
          printf("Channel %d:    \n", i);
          v25 = v8;
          do
          {
            putchar(10);
            --v25;
          }
          while (v25);
          putchar(10);
        }
      }
    }
    else
    {
      for (j = 0; j != v9; ++j)
      {
        printf("Channel %d:    \n", j);
        putchar(10);
      }
    }
  }
  puts("\n");
  IOSurfaceUnlock(self->_iosurface, 0, 0);
}

- (void)print
{
  if ((self->_tensorDataType | 2) == 2)
    -[MPSGraphTensorData printNDArray](self, "printNDArray");
}

- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5 PSNR:(float)a6
{
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  -[MPSGraphTensorData mpsndarray](self, "mpsndarray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  objc_msgSend(v10, "checkNDArray:nativeUlps:absoluteErr:PSNR:", a3, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)checkTensorData:(const float *)a3 nativeUlps:(float)a4 absoluteErr:(float)a5
{
  return -[MPSGraphTensorData checkTensorData:nativeUlps:absoluteErr:PSNR:](self, "checkTensorData:nativeUlps:absoluteErr:PSNR:", a3);
}

- (id)checkWithReferenceTensorData:(id)a3 nativeUlps:(float)a4 absoluteError:(float)a5 PSNR:(float)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  int v17;
  float32x4_t *v18;
  int v19;
  id v20;
  char *v21;
  unint64_t v22;
  id v23;
  float32x4_t v24;
  unint64_t v25;
  id v26;
  float v27;
  int8x16_t v28;
  unint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  char *v35;
  id v36;
  unint64_t v37;
  id v38;
  unint64_t v39;
  id v40;
  float32x4_t v41;
  unint64_t v42;
  id v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  __int128 v47;
  char *v48;
  id v49;
  float32x4_t v50;
  unint64_t v51;
  id v52;
  float32x4_t v53;
  unint64_t v54;
  id v55;
  unint64_t v56;
  id v57;
  unint64_t v58;
  id v59;
  uint64_t i;
  char *v61;
  id v62;
  unint64_t v63;
  uint16x4_t *v64;
  float32x4_t *v65;
  unint64_t v66;
  uint16x8_t v67;
  float32x4_t v68;
  uint32x4_t v69;
  uint64x2_t *v70;
  float32x4_t *v71;
  unint64_t v72;
  uint64x2_t v73;
  uint64x2_t v74;
  uint64x2_t v75;
  uint64x2_t v76;
  uint64_t v77;
  unint64_t v78;
  float32x4_t v79;
  float32x4_t *v80;
  uint64_t v81;
  unint64_t v82;
  float32x4_t v83;
  float32x4_t *v84;
  int16x4_t *v85;
  float32x4_t *v86;
  unint64_t v87;
  int16x8_t v88;
  float32x4_t v89;
  int32x4_t v90;
  float16x4_t *v91;
  float32x4_t *v92;
  unint64_t v93;
  float16x8_t v94;
  float32x4_t v95;
  float32x4_t v96;
  int64x2_t *v97;
  float32x4_t *v98;
  unint64_t v99;
  int64x2_t v100;
  int64x2_t v101;
  int64x2_t v102;
  int64x2_t v103;
  float16x4_t *v104;
  float32x4_t *v105;
  unint64_t v106;
  float16x8_t v107;
  float32x4_t v108;
  float32x4_t v109;
  unint64_t v110;
  float32x4_t *v111;
  int8x8_t v112;
  float32x4_t v113;
  unint64_t v114;
  float32x4_t *v115;
  int8x8_t v116;
  float32x4_t v117;
  unint64_t v118;
  float32x4_t *v119;
  uint32x4_t v120;
  uint64_t v121;
  float32x4_t *v122;
  int8x16_t v123;
  int8x8_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  uint64_t v128;
  float32x4_t *v129;
  int8x16_t v130;
  int8x8_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  uint64_t v135;
  float32x4_t *v136;
  int8x16_t v137;
  double v146;
  double v147;
  double v148;
  void *v149;

  v10 = a3;
  objc_msgSend(v10, "mpsndarray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataType");
  objc_msgSend(v10, "shape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  if (v13)
  {
    v14 = 0;
    v15 = 1;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 *= objc_msgSend(v16, "unsignedIntValue");

      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    v15 = 1;
  }
  v17 = objc_msgSend(v10, "dataType");
  if (v17 == 285212736 || v17 == 285212704)
    v15 *= 2;
  v18 = (float32x4_t *)malloc_type_malloc(4 * v15, 0x1435DDE9uLL);
  v19 = objc_msgSend(v10, "dataType");
  if (v19 > 268435487)
  {
    if (v19 <= 536870919)
    {
      switch(v19)
      {
        case 268435488:
          v43 = v11;
          objc_msgSend(v43, "readBytes:strideBytes:", v18, 0);
          v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
          objc_msgSend(v43, "readBytes:strideBytes:", v21, 0);
          if (v15)
          {
            v44 = 0;
            if (v15 < 8 || (unint64_t)((char *)v18 - v21) < 0x20)
              goto LABEL_162;
            v45 = 0;
            v44 = v15 & 0xFFFFFFFFFFFFFFF8;
            v46 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v47 = *(_OWORD *)&v21[v45 * 16 + 16];
              v48 = (char *)&v18[v45];
              *(_OWORD *)v48 = *(_OWORD *)&v21[v45 * 16];
              *((_OWORD *)v48 + 1) = v47;
              v45 += 2;
              v46 -= 8;
            }
            while (v46);
            while (v15 != v44)
            {
LABEL_162:
              v18->i32[v44] = *(_DWORD *)&v21[4 * v44];
              ++v44;
            }
          }
          break;
        case 285212704:
          v62 = v11;
          v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
          objc_msgSend(v62, "readBytes:strideBytes:", v21, 0);
          if (v15)
          {
            if (v15 >= 0x10)
            {
              v63 = v15 & 0xFFFFFFFFFFFFFFF0;
              v104 = (float16x4_t *)(v21 + 16);
              v105 = v18 + 2;
              v106 = v15 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                v107 = *(float16x8_t *)v104[-2].i8;
                v108 = vcvtq_f32_f16(*v104);
                v109 = vcvt_hight_f32_f16(*(float16x8_t *)v104->i8);
                v105[-2] = vcvtq_f32_f16(*(float16x4_t *)v107.i8);
                v105[-1] = vcvt_hight_f32_f16(v107);
                *v105 = v108;
                v105[1] = v109;
                v105 += 4;
                v104 += 4;
                v106 -= 16;
              }
              while (v106);
              goto LABEL_158;
            }
            v63 = 0;
            do
            {
              _H0 = *(_WORD *)&v21[2 * v63];
              __asm { FCVT            S0, H0 }
              v18->i32[v63++] = _S0;
LABEL_158:
              ;
            }
            while (v15 != v63);
          }
          break;
        case 285212736:
          v30 = v11;
          objc_msgSend(v30, "readBytes:strideBytes:", v18, 0);
          v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
          objc_msgSend(v30, "readBytes:strideBytes:", v21, 0);
          if (v15)
          {
            v31 = 0;
            if (v15 < 8 || (unint64_t)((char *)v18 - v21) < 0x20)
              goto LABEL_139;
            v32 = 0;
            v31 = v15 & 0xFFFFFFFFFFFFFFF8;
            v33 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v34 = *(_OWORD *)&v21[v32 * 16 + 16];
              v35 = (char *)&v18[v32];
              *(_OWORD *)v35 = *(_OWORD *)&v21[v32 * 16];
              *((_OWORD *)v35 + 1) = v34;
              v32 += 2;
              v33 -= 8;
            }
            while (v33);
            while (v15 != v31)
            {
LABEL_139:
              v18->i32[v31] = *(_DWORD *)&v21[4 * v31];
              ++v31;
            }
          }
          break;
        default:
          goto LABEL_137;
      }
      goto LABEL_164;
    }
    if (v19 > 536870943)
    {
      if (v19 == 536870944)
      {
        v57 = v11;
        v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
        objc_msgSend(v57, "readBytes:strideBytes:", v21, 0);
        if (v15)
        {
          if (v15 >= 8)
          {
            v77 = 0;
            v58 = v15 & 0xFFFFFFFFFFFFFFF8;
            v78 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v79 = vcvtq_f32_s32(*(int32x4_t *)&v21[v77 * 16 + 16]);
              v80 = &v18[v77];
              *v80 = vcvtq_f32_s32(*(int32x4_t *)&v21[v77 * 16]);
              v80[1] = v79;
              v77 += 2;
              v78 -= 8;
            }
            while (v78);
            goto LABEL_148;
          }
          v58 = 0;
          do
          {
            v18->f32[v58] = (float)*(int *)&v21[4 * v58];
            ++v58;
LABEL_148:
            ;
          }
          while (v15 != v58);
        }
      }
      else
      {
        if (v19 != 536870976)
          goto LABEL_137;
        v38 = v11;
        v21 = (char *)malloc_type_malloc(8 * v15, 0x89876B49uLL);
        objc_msgSend(v38, "readBytes:strideBytes:", v21, 0);
        if (v15)
        {
          if (v15 >= 8)
          {
            v39 = v15 & 0xFFFFFFFFFFFFFFF8;
            v97 = (int64x2_t *)(v21 + 32);
            v98 = v18 + 1;
            v99 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v101 = v97[-2];
              v100 = v97[-1];
              v103 = *v97;
              v102 = v97[1];
              v97 += 4;
              v98[-1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_s64(v101)), vcvtq_f64_s64(v100));
              *v98 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_s64(v103)), vcvtq_f64_s64(v102));
              v98 += 2;
              v99 -= 8;
            }
            while (v99);
            goto LABEL_156;
          }
          v39 = 0;
          do
          {
            v18->f32[v39] = (float)*(uint64_t *)&v21[8 * v39];
            ++v39;
LABEL_156:
            ;
          }
          while (v15 != v39);
        }
      }
      goto LABEL_164;
    }
    if (v19 != 536870920)
    {
      if (v19 != 536870928)
        goto LABEL_137;
      v23 = v11;
      v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
      objc_msgSend(v23, "readBytes:strideBytes:", v21, 0);
      if (v15)
      {
        if (v15 >= 0x10)
        {
          v25 = v15 & 0xFFFFFFFFFFFFFFF0;
          v85 = (int16x4_t *)(v21 + 16);
          v86 = v18 + 2;
          v87 = v15 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v88 = *(int16x8_t *)v85[-2].i8;
            v89 = vcvtq_f32_s32(vmovl_s16(*v85));
            v90 = vmovl_high_s16(*(int16x8_t *)v85->i8);
            v86[-2] = vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v88.i8));
            v86[-1] = vcvtq_f32_s32(vmovl_high_s16(v88));
            v24 = vcvtq_f32_s32(v90);
            *v86 = v89;
            v86[1] = v24;
            v86 += 4;
            v85 += 4;
            v87 -= 16;
          }
          while (v87);
          goto LABEL_152;
        }
        v25 = 0;
        do
        {
          v24.i16[0] = *(_WORD *)&v21[2 * v25];
          v24.i64[0] = vmovl_s16(*(int16x4_t *)v24.f32).u64[0];
          v24.f32[0] = (float)v24.i32[0];
          v18->i32[v25++] = v24.i32[0];
LABEL_152:
          ;
        }
        while (v15 != v25);
      }
      goto LABEL_164;
    }
    v52 = v11;
    v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
    objc_msgSend(v52, "readBytes:strideBytes:", v21, 0);
    if (!v15)
      goto LABEL_164;
    if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
    {
      v54 = 0;
      do
      {
LABEL_145:
        v53.i8[0] = v21[v54];
        v53.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v53.f32)).u64[0];
        v53.f32[0] = (float)v53.i32[0];
        v18->i32[v54++] = v53.i32[0];
LABEL_144:
        ;
      }
      while (v15 != v54);
      goto LABEL_164;
    }
    if (v15 >= 0x10)
    {
      v128 = 0;
      v54 = v15 & 0xFFFFFFFFFFFFFFF0;
      v129 = v18;
      do
      {
        v130 = *(int8x16_t *)&v21[v128];
        v131 = (int8x8_t)vextq_s8(v130, v130, 8uLL).u64[0];
        v132 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v131, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        v133 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v131, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        v134 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v130.i8, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        v53 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v130.i8, *(int8x8_t *)v130.i8), 8uLL), 8uLL)));
        *v129 = v134;
        v129[1] = v53;
        v129[2] = v132;
        v129[3] = v133;
        v128 += 16;
        v129 += 4;
      }
      while (v54 != v128);
      if (v15 == v54)
        goto LABEL_164;
      if ((v15 & 8) == 0)
        goto LABEL_145;
    }
    else
    {
      v54 = 0;
    }
    v114 = v54;
    v54 = v15 & 0xFFFFFFFFFFFFFFF8;
    v115 = (float32x4_t *)((char *)v18 + 4 * v114);
    do
    {
      v116 = *(int8x8_t *)&v21[v114];
      v117 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v116, v116), 8uLL), 8uLL)));
      v53 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v116, v116), 8uLL), 8uLL)));
      *v115 = v117;
      v115[1] = v53;
      v115 += 2;
      v114 += 8;
    }
    while (v54 != v114);
    goto LABEL_144;
  }
  if (v19 <= 15)
  {
    if (v19 != -2147483640)
    {
      if (v19 == -1879048176)
      {
        v59 = v11;
        v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
        objc_msgSend(v59, "readBytes:strideBytes:", v21, 0);
        if (v15)
        {
          for (i = 0; i != v15; ++i)
          {
            v61 = &v18->i8[4 * i];
            *((_WORD *)v61 + 1) = *(_WORD *)&v21[2 * i];
            *(_WORD *)v61 = 0;
          }
        }
        goto LABEL_164;
      }
      if (v19 != 8)
        goto LABEL_137;
      v26 = v11;
      v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
      objc_msgSend(v26, "readBytes:strideBytes:", v21, 0);
      if (!v15)
        goto LABEL_164;
      if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
      {
        v29 = 0;
        do
        {
LABEL_161:
          LOBYTE(v27) = v21[v29];
          v27 = (float)LODWORD(v27);
          v18->f32[v29++] = v27;
LABEL_160:
          ;
        }
        while (v15 != v29);
        goto LABEL_164;
      }
      if (v15 >= 0x10)
      {
        v135 = 0;
        v29 = v15 & 0xFFFFFFFFFFFFFFF0;
        v27 = NAN;
        v28.i64[1] = 0xFFFFFF07FFFFFF06;
        v136 = v18;
        do
        {
          v137 = *(int8x16_t *)&v21[v135];
          v136[2] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_18125D050));
          v136[3] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_18125D060));
          *v136 = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_18125D030));
          v136[1] = vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v137, (int8x16_t)xmmword_18125D040));
          v136 += 4;
          v135 += 16;
        }
        while (v29 != v135);
        if (v15 == v29)
          goto LABEL_164;
        if ((v15 & 8) == 0)
          goto LABEL_161;
      }
      else
      {
        v29 = 0;
      }
      v118 = v29;
      v29 = v15 & 0xFFFFFFFFFFFFFFF8;
      v119 = (float32x4_t *)((char *)v18 + 4 * v118);
      v27 = NAN;
      do
      {
        v28.i64[0] = *(_QWORD *)&v21[v118];
        v120 = (uint32x4_t)vqtbl1q_s8(v28, (int8x16_t)xmmword_18125D040);
        v28 = (int8x16_t)vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v28, (int8x16_t)xmmword_18125D030));
        *v119 = (float32x4_t)v28;
        v119[1] = vcvtq_f32_u32(v120);
        v119 += 2;
        v118 += 8;
      }
      while (v29 != v118);
      goto LABEL_160;
    }
    v40 = v11;
    v21 = (char *)malloc_type_malloc(v15, 0x89876B49uLL);
    objc_msgSend(v40, "readBytes:strideBytes:", v21, 0);
    if (!v15)
      goto LABEL_164;
    if (v15 < 8 || v18 < (float32x4_t *)&v21[v15] && v21 < &v18->i8[4 * v15])
    {
      v42 = 0;
      do
      {
LABEL_141:
        v41.i8[0] = v21[v42];
        v41.i64[0] = vmovl_s16((int16x4_t)*(_OWORD *)&vmovl_s8(*(int8x8_t *)v41.f32)).u64[0];
        v41.f32[0] = (float)v41.i32[0];
        v18->i32[v42++] = v41.i32[0];
LABEL_140:
        ;
      }
      while (v15 != v42);
      goto LABEL_164;
    }
    if (v15 >= 0x10)
    {
      v121 = 0;
      v42 = v15 & 0xFFFFFFFFFFFFFFF0;
      v122 = v18;
      do
      {
        v123 = *(int8x16_t *)&v21[v121];
        v124 = (int8x8_t)vextq_s8(v123, v123, 8uLL).u64[0];
        v125 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v124, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        v126 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v124, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        v127 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v123.i8, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        v41 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v123.i8, *(int8x8_t *)v123.i8), 8uLL), 8uLL)));
        *v122 = v127;
        v122[1] = v41;
        v122[2] = v125;
        v122[3] = v126;
        v121 += 16;
        v122 += 4;
      }
      while (v42 != v121);
      if (v15 == v42)
        goto LABEL_164;
      if ((v15 & 8) == 0)
        goto LABEL_141;
    }
    else
    {
      v42 = 0;
    }
    v110 = v42;
    v42 = v15 & 0xFFFFFFFFFFFFFFF8;
    v111 = (float32x4_t *)((char *)v18 + 4 * v110);
    do
    {
      v112 = *(int8x8_t *)&v21[v110];
      v113 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v112, v112), 8uLL), 8uLL)));
      v41 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v112, v112), 8uLL), 8uLL)));
      *v111 = v113;
      v111[1] = v41;
      v111 += 2;
      v110 += 8;
    }
    while (v42 != v110);
    goto LABEL_140;
  }
  if (v19 > 63)
  {
    if (v19 == 64)
    {
      v55 = v11;
      v21 = (char *)malloc_type_malloc(8 * v15, 0x89876B49uLL);
      objc_msgSend(v55, "readBytes:strideBytes:", v21, 0);
      if (v15)
      {
        if (v15 >= 8)
        {
          v56 = v15 & 0xFFFFFFFFFFFFFFF8;
          v70 = (uint64x2_t *)(v21 + 32);
          v71 = v18 + 1;
          v72 = v15 & 0xFFFFFFFFFFFFFFF8;
          do
          {
            v74 = v70[-2];
            v73 = v70[-1];
            v76 = *v70;
            v75 = v70[1];
            v70 += 4;
            v71[-1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v74)), vcvtq_f64_u64(v73));
            *v71 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v76)), vcvtq_f64_u64(v75));
            v71 += 2;
            v72 -= 8;
          }
          while (v72);
          goto LABEL_146;
        }
        v56 = 0;
        do
        {
          v18->f32[v56] = (float)*(unint64_t *)&v21[8 * v56];
          ++v56;
LABEL_146:
          ;
        }
        while (v15 != v56);
      }
    }
    else
    {
      if (v19 != 268435472)
        goto LABEL_137;
      v36 = v11;
      v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
      objc_msgSend(v36, "readBytes:strideBytes:", v21, 0);
      if (v15)
      {
        if (v15 >= 0x10)
        {
          v37 = v15 & 0xFFFFFFFFFFFFFFF0;
          v91 = (float16x4_t *)(v21 + 16);
          v92 = v18 + 2;
          v93 = v15 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v94 = *(float16x8_t *)v91[-2].i8;
            v95 = vcvtq_f32_f16(*v91);
            v96 = vcvt_hight_f32_f16(*(float16x8_t *)v91->i8);
            v92[-2] = vcvtq_f32_f16(*(float16x4_t *)v94.i8);
            v92[-1] = vcvt_hight_f32_f16(v94);
            *v92 = v95;
            v92[1] = v96;
            v92 += 4;
            v91 += 4;
            v93 -= 16;
          }
          while (v93);
          goto LABEL_154;
        }
        v37 = 0;
        do
        {
          _H0 = *(_WORD *)&v21[2 * v37];
          __asm { FCVT            S0, H0 }
          v18->i32[v37++] = _S0;
LABEL_154:
          ;
        }
        while (v15 != v37);
      }
    }
  }
  else
  {
    if (v19 != 16)
    {
      if (v19 == 32)
      {
        v20 = v11;
        v21 = (char *)malloc_type_malloc(4 * v15, 0x89876B49uLL);
        objc_msgSend(v20, "readBytes:strideBytes:", v21, 0);
        if (v15)
        {
          if (v15 >= 8)
          {
            v81 = 0;
            v22 = v15 & 0xFFFFFFFFFFFFFFF8;
            v82 = v15 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v83 = vcvtq_f32_u32(*(uint32x4_t *)&v21[v81 * 16 + 16]);
              v84 = &v18[v81];
              *v84 = vcvtq_f32_u32(*(uint32x4_t *)&v21[v81 * 16]);
              v84[1] = v83;
              v81 += 2;
              v82 -= 8;
            }
            while (v82);
            goto LABEL_150;
          }
          v22 = 0;
          do
          {
            v18->f32[v22] = (float)*(unsigned int *)&v21[4 * v22];
            ++v22;
LABEL_150:
            ;
          }
          while (v15 != v22);
        }
        goto LABEL_164;
      }
LABEL_137:
      __assert_rtn("-[MPSGraphTensorData checkWithReferenceTensorData:nativeUlps:absoluteError:PSNR:]", "MPSGraphTensorData.mm", 882, "0 && \"unsupported datatype\");
    }
    v49 = v11;
    v21 = (char *)malloc_type_malloc(2 * v15, 0x89876B49uLL);
    objc_msgSend(v49, "readBytes:strideBytes:", v21, 0);
    if (v15)
    {
      if (v15 >= 0x10)
      {
        v51 = v15 & 0xFFFFFFFFFFFFFFF0;
        v64 = (uint16x4_t *)(v21 + 16);
        v65 = v18 + 2;
        v66 = v15 & 0xFFFFFFFFFFFFFFF0;
        do
        {
          v67 = *(uint16x8_t *)v64[-2].i8;
          v68 = vcvtq_f32_u32(vmovl_u16(*v64));
          v69 = vmovl_high_u16(*(uint16x8_t *)v64->i8);
          v65[-2] = vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v67.i8));
          v65[-1] = vcvtq_f32_u32(vmovl_high_u16(v67));
          v50 = vcvtq_f32_u32(v69);
          *v65 = v68;
          v65[1] = v50;
          v65 += 4;
          v64 += 4;
          v66 -= 16;
        }
        while (v66);
        goto LABEL_142;
      }
      v51 = 0;
      do
      {
        v50.i16[0] = *(_WORD *)&v21[2 * v51];
        v50.f32[0] = (float)v50.u32[0];
        v18->i32[v51++] = v50.i32[0];
LABEL_142:
        ;
      }
      while (v15 != v51);
    }
  }
LABEL_164:
  free(v21);

  *(float *)&v146 = a4;
  *(float *)&v147 = a5;
  *(float *)&v148 = a6;
  -[MPSGraphTensorData checkTensorData:nativeUlps:absoluteErr:PSNR:](self, "checkTensorData:nativeUlps:absoluteErr:PSNR:", v18, v146, v147, v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  free(v18);

  return v149;
}

- (int64_t)tensorDataType
{
  return self->_tensorDataType;
}

- (MPSDataType)dataType
{
  return self->_dataType;
}

- (MPSGraphDevice)device
{
  return self->_device;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mpsimagebatch, 0);
  objc_storeStrong((id *)&self->_mpsndarray, 0);
}

@end
