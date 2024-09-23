@implementation CKImageBackgroundColorUtility

- (CKImageBackgroundColorUtility)initWithImage:(id)a3
{
  id v5;
  CKImageBackgroundColorUtility *v6;
  CKImageBackgroundColorUtility *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKImageBackgroundColorUtility;
  v6 = -[CKImageBackgroundColorUtility init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_image, a3);

  return v7;
}

- (void)analyze
{
  id v3;
  CGImage *CopyWithColorSpace;
  CGDataProvider *DataProvider;
  const UInt8 *BytePtr;
  size_t BitsPerPixel;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  const UInt8 *v14;
  double v15;
  double v16;
  CGColorRef v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  unsigned int v59;
  id v60;
  void *v61;
  const __CFData *cf;
  CGImage *v63;
  CKImageBackgroundColorUtility *v64;
  uint64_t v65;
  uint64_t v66;
  id obj;
  size_t v68;
  CGColorSpace *space;
  size_t Width;
  uint64_t v71;
  size_t Height;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  CGFloat components[5];

  components[3] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v64 = self;
  space = CGColorSpaceCreateDeviceRGB();
  CopyWithColorSpace = CGImageCreateCopyWithColorSpace(-[UIImage CGImage](self->_image, "CGImage"), space);
  DataProvider = CGImageGetDataProvider(CopyWithColorSpace);
  cf = CGDataProviderCopyData(DataProvider);
  BytePtr = CFDataGetBytePtr(cf);
  BitsPerPixel = CGImageGetBitsPerPixel(CopyWithColorSpace);
  BitsPerComponent = CGImageGetBitsPerComponent(CopyWithColorSpace);
  BytesPerRow = CGImageGetBytesPerRow(CopyWithColorSpace);
  v63 = CopyWithColorSpace;
  Width = CGImageGetWidth(CopyWithColorSpace);
  Height = CGImageGetHeight(CopyWithColorSpace);
  if (Width)
  {
    v11 = 0;
    v68 = BitsPerPixel / BitsPerComponent;
    do
    {
      if (Height)
      {
        v12 = 0;
        v13 = Height;
        do
        {
          v14 = &BytePtr[v11 * v68 + v12 * BytesPerRow];
          LOBYTE(v10) = *v14;
          v15 = (double)v10 / 255.0;
          components[0] = v15;
          LOBYTE(v15) = v14[1];
          v16 = (double)*(unint64_t *)&v15 / 255.0;
          components[1] = v16;
          LOBYTE(v16) = v14[2];
          components[2] = (double)*(unint64_t *)&v16 / 255.0;
          v17 = CGColorCreate(space, components);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithCGColor:", v17);
          if (v17)
            CFRelease(v17);
          if ((objc_msgSend(v18, "ck_isVeryDark") & 1) == 0 && (objc_msgSend(v18, "ck_isVeryLight") & 1) == 0)
            objc_msgSend(v3, "addObject:", v18);

          ++v12;
          --v13;
        }
        while (v13);
      }
      if ((unint64_t)objc_msgSend(v3, "count") > 0x20)
        break;
      ++v11;
    }
    while (v11 != Width);
  }
  v73 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v19 = v3;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v87 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
        v25 = objc_msgSend(v19, "countForObject:", v24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v26, v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    }
    while (v21);
  }
  v61 = v19;

  objc_msgSend(v73, "keysSortedByValueUsingSelector:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reverseObjectEnumerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v29;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v83;
    v65 = *(_QWORD *)v83;
    do
    {
      v34 = 0;
      v66 = v32;
      do
      {
        if (*(_QWORD *)v83 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v34);
        if (objc_msgSend(v30, "count"))
        {
          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          objc_msgSend(v30, "keysSortedByValueUsingSelector:", sel_compare_);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "reverseObjectEnumerator");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "allObjects");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
          if (v39)
          {
            v40 = v39;
            v71 = v34;
            v41 = *(_QWORD *)v79;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v79 != v41)
                  objc_enumerationMutation(v38);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "ck_isCloseToColor:", v35))
                {
                  v43 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v30, "objectForKeyedSubscript:", v35);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v44, "unsignedIntValue");
                  objc_msgSend(v73, "objectForKeyedSubscript:", v35);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "numberWithUnsignedInt:", objc_msgSend(v46, "unsignedIntValue") + v45);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v47, v35);

                }
                else
                {
                  objc_msgSend(v73, "objectForKeyedSubscript:", v35);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "setObject:forKeyedSubscript:", v44, v35);
                }

              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
            }
            while (v40);
            v33 = v65;
            v32 = v66;
            v34 = v71;
          }
        }
        else
        {
          objc_msgSend(v73, "objectForKeyedSubscript:", v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, v35);
        }

        ++v34;
      }
      while (v34 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
    }
    while (v32);
  }

  objc_msgSend(v30, "allKeys");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "firstObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  objc_msgSend(v30, "allKeys");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v75;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v75 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
        objc_msgSend(v30, "objectForKeyedSubscript:", v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "unsignedIntValue");

        objc_msgSend(v30, "objectForKeyedSubscript:", v55);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "unsignedIntValue");

        if (v57 <= v59)
        {
          v60 = v55;

          v49 = v60;
        }
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
    }
    while (v52);
  }

  if (cf)
    CFRelease(cf);
  if (v63)
    CFRelease(v63);
  if (space)
    CFRelease(space);
  -[CKImageBackgroundColorUtility setBackgroundColor:](v64, "setBackgroundColor:", v49);

}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
