@implementation _SerializableCVPixelBuffer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SerializableCVPixelBuffer)initWithCVPixelBufferRef:(__CVBuffer *)a3
{
  _SerializableCVPixelBuffer *v4;
  _SerializableCVPixelBuffer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SerializableCVPixelBuffer;
  v4 = -[_SerializableCVPixelBuffer init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pixelBuffer = a3;
    CVBufferRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  __CVBuffer *pixelBuffer;
  objc_super v4;

  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SerializableCVPixelBuffer;
  -[_SerializableCVPixelBuffer dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t PlaneCount;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  size_t v14;
  int64_t v15;
  void *v16;
  size_t HeightOfPlane;
  id v18;
  size_t BytesPerRowOfPlane;
  void *v20;
  void *v21;
  size_t v22;
  id v23;
  void *BaseAddressOfPlane;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *BaseAddress;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
  PlaneCount = CVPixelBufferGetPlaneCount(self->_pixelBuffer);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", CVPixelBufferGetPixelFormatType(self->_pixelBuffer));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PixelFormat"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", PlaneCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PlaneCount"));

  if (PlaneCount)
  {
    v37 = v4;
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetWidth(self->_pixelBuffer));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetHeight(self->_pixelBuffer));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(v9, "addObject:", v12);

    if (PlaneCount >= 1)
    {
      v14 = 0;
      do
      {
        v15 = PlaneCount;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        HeightOfPlane = CVPixelBufferGetHeightOfPlane(self->_pixelBuffer, v14);
        v18 = v8;
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(self->_pixelBuffer, v14);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", HeightOfPlane);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v20);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", BytesPerRowOfPlane);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v21);

        v22 = BytesPerRowOfPlane * HeightOfPlane;
        v8 = v18;
        v23 = objc_alloc(MEMORY[0x24BDBCE50]);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(self->_pixelBuffer, v14);
        v25 = v23;
        PlaneCount = v15;
        v26 = (void *)objc_msgSend(v25, "initWithBytes:length:", BaseAddressOfPlane, v22);
        objc_msgSend(v10, "addObject:", v26);

        ++v14;
      }
      while (v15 != v14);
    }
    v4 = v37;
    objc_msgSend(v37, "encodeObject:forKey:", v8, CFSTR("Width"));
    objc_msgSend(v37, "encodeObject:forKey:", v13, CFSTR("Height"));
    objc_msgSend(v37, "encodeObject:forKey:", v38, CFSTR("BytesPerRow"));
    objc_msgSend(v37, "encodeObject:forKey:", v10, CFSTR("PixelData"));

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetWidth(self->_pixelBuffer));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("Width"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetHeight(self->_pixelBuffer));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("Height"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CVPixelBufferGetBytesPerRow(self->_pixelBuffer));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("BytesPerRow"));

    v33 = objc_alloc(MEMORY[0x24BDBCE50]);
    BaseAddress = CVPixelBufferGetBaseAddress(self->_pixelBuffer);
    v35 = (void *)objc_msgSend(v33, "initWithBytes:length:", BaseAddress, CVPixelBufferGetDataSize(self->_pixelBuffer));
    v39 = v35;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v36, CFSTR("PixelData"));

  }
  CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);

}

- (_SerializableCVPixelBuffer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  size_t *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void **v21;
  size_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  void *v28;
  void *v29;
  void *v30;
  size_t *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  OSType v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _SerializableCVPixelBuffer *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  _SerializableCVPixelBuffer *v59;
  size_t *v60;
  void *v61;
  const __CFAllocator *v62;
  void *v63;
  size_t v64;
  void *v65;
  size_t v66;
  void *v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _SerializableCVPixelBuffer *v76;
  _SerializableCVPixelBuffer *v77;
  size_t v78;
  size_t v79;
  size_t *v80;
  _SerializableCVPixelBuffer *v81;
  id v82;
  void *v83;
  void *v84;
  size_t *planeBytesPerRow;
  size_t *planeHeight;
  size_t *planeWidth;
  void *i;
  objc_super v89;
  objc_super v90;
  CVPixelBufferRef pixelBufferOut;
  _QWORD v92[2];
  _QWORD v93[4];

  v93[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("PlaneCount"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("PixelFormat"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Width"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("Height"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("BytesPerRow"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("PixelData")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PlaneCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    v7 = (void *)MEMORY[0x24BDBCF20];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCF20];
    v92[0] = objc_opt_class();
    v92[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v83 = (void *)v12;
    v84 = (void *)v9;
    if (v6)
    {
      v13 = v6;
      v81 = self;
      v82 = v5;
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Width"));
      v14 = (size_t *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Height"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("BytesPerRow"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("PixelData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[size_t objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v18, "integerValue");

      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v19, "integerValue");

      v80 = &v78;
      v20 = (8 * v13 + 15) & 0xFFFFFFFFFFFFFFF0;
      v21 = (void **)((char *)&v78 - v20);
      if ((unint64_t)(8 * v13) >= 0x200)
        v22 = 512;
      else
        v22 = 8 * v13;
      bzero((char *)&v78 - v20, v22);
      planeWidth = (size_t *)((char *)&v78 - v20);
      planeHeight = (size_t *)((char *)&v78 - v20);
      planeBytesPerRow = (size_t *)((char *)&v78 - v20);
      if (v13 >= 1)
      {
        v23 = 0;
        for (i = (void *)v13; i != v23; v13 = (int64_t)i)
        {
          objc_msgSend(v17, "objectAtIndexedSubscript:", v23, v78);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = malloc_type_malloc(objc_msgSend(v24, "length"), 0xF231FE04uLL);
          v21[(_QWORD)v23] = v25;

          objc_msgSend(v17, "objectAtIndexedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", v23);
          v27 = v21;
          v28 = v17;
          v29 = v16;
          v30 = v15;
          v31 = v14;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "getBytes:length:", v25, objc_msgSend(v32, "length"));

          v14 = v31;
          v15 = v30;
          v16 = v29;
          v17 = v28;
          v21 = v27;

          -[size_t objectAtIndexedSubscript:](v14, "objectAtIndexedSubscript:", (char *)v23 + 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "integerValue");
          planeWidth[(_QWORD)v23] = v34;

          objc_msgSend(v15, "objectAtIndexedSubscript:", (char *)v23 + 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "integerValue");
          planeHeight[(_QWORD)v23] = v36;

          objc_msgSend(v16, "objectAtIndexedSubscript:", v23);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "integerValue");
          planeBytesPerRow[(_QWORD)v23] = v38;

          v23 = (char *)v23 + 1;
        }
      }
      pixelBufferOut = 0;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PixelFormat"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_msgSend(v39, "integerValue");
      v41 = CVPixelBufferCreateWithPlanarBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v79, v78, v40, 0, 0, v13, v21, planeWidth, planeHeight, planeBytesPerRow, (CVPixelBufferReleasePlanarBytesCallback)__planarDeallocateHelper, 0, 0, &pixelBufferOut);
      if ((_DWORD)v41)
      {
        v42 = v41;
        i = v39;
        v43 = v16;
        v44 = HRTFEnrollmentLog;
        v45 = os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR);
        self = v81;
        if (v45)
          -[_SerializableCVPixelBuffer initWithCoder:].cold.2(v42, v44, v46, v47, v48, v49, v50, v51);
        v52 = 0;
        v53 = v83;
        v54 = v84;
        v16 = v43;
        v39 = i;
      }
      else
      {
        v89.receiver = v81;
        v89.super_class = (Class)_SerializableCVPixelBuffer;
        v76 = -[_SerializableCVPixelBuffer init](&v89, sel_init);
        if (v76)
          v76->_pixelBuffer = pixelBufferOut;
        self = v76;
        v52 = self;
        v53 = v83;
        v54 = v84;
      }

    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("PixelData"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      planeWidth = (size_t *)malloc_type_malloc(objc_msgSend(v57, "length"), 0x7227F3ADuLL);
      planeBytesPerRow = objc_retainAutorelease(v57);
      memcpy(planeWidth, (const void *)-[size_t bytes](planeBytesPerRow, "bytes"), -[size_t length](planeBytesPerRow, "length"));
      pixelBufferOut = 0;
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Width"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("Height"));
      v59 = (_SerializableCVPixelBuffer *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("BytesPerRow"));
      v60 = (size_t *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PixelFormat"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      i = v61;
      planeHeight = (size_t *)objc_msgSend(v61, "integerValue");
      v62 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v82 = v58;
      objc_msgSend(v58, "objectAtIndexedSubscript:", 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "integerValue");
      v81 = v59;
      -[_SerializableCVPixelBuffer objectAtIndexedSubscript:](v59, "objectAtIndexedSubscript:", 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "integerValue");
      v80 = v60;
      -[size_t objectAtIndexedSubscript:](v60, "objectAtIndexedSubscript:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CVPixelBufferCreateWithBytes(v62, v64, v66, (OSType)planeHeight, planeWidth, objc_msgSend(v67, "integerValue"), (CVPixelBufferReleaseBytesCallback)__deallocateHelper, 0, 0, &pixelBufferOut);

      if ((_DWORD)v68)
      {
        v69 = HRTFEnrollmentLog;
        if (os_log_type_enabled((os_log_t)HRTFEnrollmentLog, OS_LOG_TYPE_ERROR))
          -[_SerializableCVPixelBuffer initWithCoder:].cold.1(v68, v69, v70, v71, v72, v73, v74, v75);
        v52 = 0;
      }
      else
      {
        v90.receiver = self;
        v90.super_class = (Class)_SerializableCVPixelBuffer;
        v77 = -[_SerializableCVPixelBuffer init](&v90, sel_init);
        if (v77)
          v77->_pixelBuffer = pixelBufferOut;
        self = v77;
        v52 = self;
      }
      v53 = v83;
      v54 = v84;
      v14 = planeBytesPerRow;
      v39 = i;

    }
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22153F000, a2, a3, "failed to create CVPixelBuffer: %d", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22153F000, a2, a3, "failed to create planar CVPixelBuffer: %d", a5, a6, a7, a8, 0);
}

@end
