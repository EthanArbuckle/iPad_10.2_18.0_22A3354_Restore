@implementation HMDVideoAttributes

+ (BOOL)translateImageResolution:(id)a3 imageWidth:(id *)a4 imageHeight:(id *)a5
{
  unint64_t v7;
  void *v8;

  v7 = objc_msgSend(a3, "resolutionType") - 1;
  if (v7 <= 0x1C)
  {
    v8 = (void *)qword_1E89A3768[v7];
    *a4 = (id)qword_1E89A3680[v7];
    *a5 = v8;
  }
  return v7 < 0x1D;
}

- (HMDVideoAttributes)initWithResolution:(id)a3 framerate:(id)a4
{
  id v7;
  id v8;
  HMDVideoAttributes *v9;
  HMDVideoAttributes *v10;
  _BOOL4 v11;
  NSNumber *v12;
  NSNumber *v13;
  NSNumber *v14;
  NSNumber *imageWidth;
  NSNumber *v16;
  NSNumber *imageHeight;
  NSNumber *v18;
  HMDVideoAttributes *v19;
  id v21;
  id v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDVideoAttributes;
  v9 = -[HMDVideoAttributes init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoResolution, a3);
    v21 = 0;
    v22 = 0;
    v11 = +[HMDVideoAttributes translateImageResolution:imageWidth:imageHeight:](HMDVideoAttributes, "translateImageResolution:imageWidth:imageHeight:", v7, &v22, &v21);
    v12 = (NSNumber *)v22;
    v13 = (NSNumber *)v21;
    v14 = v13;
    if (!v11)
    {

      v19 = 0;
      goto LABEL_6;
    }
    imageWidth = v10->_imageWidth;
    v10->_imageWidth = v12;
    v16 = v12;

    imageHeight = v10->_imageHeight;
    v10->_imageHeight = v14;
    v18 = v14;

    objc_storeStrong((id *)&v10->_framerate, a4);
  }
  v19 = v10;
LABEL_6:

  return v19;
}

- (id)translateImageWidth:(id)a3 imageHeight:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  HMDVideoResolution *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32460)
    && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32478) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32490)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324A8) & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324C0)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32490) & 1) != 0)
  {
    v7 = 3;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324D8)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324F0) & 1) != 0)
  {
    v7 = 4;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32508)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32520) & 1) != 0)
  {
    v7 = 5;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32460)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32538) & 1) != 0)
  {
    v7 = 6;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32490)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32550) & 1) != 0)
  {
    v7 = 7;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324C0)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324A8) & 1) != 0)
  {
    v7 = 8;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32508)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32568) & 1) != 0)
  {
    v7 = 9;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32580)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32598) & 1) != 0)
  {
    v7 = 10;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32550)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32490) & 1) != 0)
  {
    v7 = 11;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324A8)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324C0) & 1) != 0)
  {
    v7 = 12;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32568)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32508) & 1) != 0)
  {
    v7 = 13;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32598)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32580) & 1) != 0)
  {
    v7 = 14;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B325B0)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B325C8) & 1) != 0)
  {
    v7 = 15;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B325E0)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32598) & 1) != 0)
  {
    v7 = 16;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B325C8)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B325B0) & 1) != 0)
  {
    v7 = 17;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32598)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B325E0) & 1) != 0)
  {
    v7 = 18;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32520)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32508) & 1) != 0)
  {
    v7 = 19;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324F0)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324D8) & 1) != 0)
  {
    v7 = 20;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32490)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B324C0) & 1) != 0)
  {
    v7 = 21;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B324A8)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32490) & 1) != 0)
  {
    v7 = 22;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32478)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32460) & 1) != 0)
  {
    v7 = 23;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B325F8)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B325F8) & 1) != 0)
  {
    v7 = 24;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32598)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32598) & 1) != 0)
  {
    v7 = 25;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32568)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32568) & 1) != 0)
  {
    v7 = 26;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32460)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32460) & 1) != 0)
  {
    v7 = 27;
  }
  else if (objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32610)
         && (objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32628) & 1) != 0)
  {
    v7 = 28;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToNumber:", &unk_1E8B32628)
      || !objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B32610))
    {
      v8 = 0;
      goto LABEL_89;
    }
    v7 = 29;
  }
  v8 = -[HMDVideoResolution initWithResolution:]([HMDVideoResolution alloc], "initWithResolution:", v7);
LABEL_89:

  return v8;
}

- (BOOL)_parseFromTLVData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  NSNumber *v8;
  NSNumber *imageWidth;
  NSNumber *v10;
  NSNumber *imageHeight;
  HMDVideoResolution *v12;
  HMDVideoResolution *videoResolution;
  NSNumber *v14;
  NSNumber *framerate;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 1, CFSTR("kVideoAttributes__ImageWidth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 2, CFSTR("kVideoAttributes__ImageHeight"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D16590], "wrappertlv:name:", 3, CFSTR("kVideoAttributes__FrameRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v17[1] = v4;
  v17[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAPTLVBase _parse:](self, "_parse:", v6);
  if (v7)
  {
    objc_msgSend(v3, "field");
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageWidth = self->_imageWidth;
    self->_imageWidth = v8;

    objc_msgSend(v4, "field");
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    imageHeight = self->_imageHeight;
    self->_imageHeight = v10;

    -[HMDVideoAttributes translateImageWidth:imageHeight:](self, "translateImageWidth:imageHeight:", self->_imageWidth, self->_imageHeight);
    v12 = (HMDVideoResolution *)objc_claimAutoreleasedReturnValue();
    videoResolution = self->_videoResolution;
    self->_videoResolution = v12;

    objc_msgSend(v5, "field");
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    framerate = self->_framerate;
    self->_framerate = v14;

  }
  return v7;
}

- (NSData)tlvData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D165F8], "creator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDVideoAttributes imageWidth](self, "imageWidth");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 1, 2, v4);

  -[HMDVideoAttributes imageHeight](self, "imageHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:length:number:", 2, 2, v5);

  -[HMDVideoAttributes framerate](self, "framerate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTLV:number:", 3, v6);

  objc_msgSend(v3, "serialize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[HAPTLVBase tlvDatablob](self, "tlvDatablob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ tlvDatablob = %@ "), v6, v8);

  -[HMDVideoAttributes imageWidth](self, "imageWidth");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ imageWidth = %@ "), v6, v9);

  -[HMDVideoAttributes imageHeight](self, "imageHeight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ imageHeight = %@ "), v6, v10);

  -[HMDVideoAttributes videoResolution](self, "videoResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionWithIndent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ resolution = %@ "), v6, v12);

  -[HMDVideoAttributes framerate](self, "framerate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n %@ framerate = %@ "), v6, v13);

}

- (HMDVideoAttributes)initWithCoder:(id)a3
{
  id v4;
  HMDVideoAttributes *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *imageWidth;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSNumber *imageHeight;
  uint64_t v16;
  HMDVideoResolution *videoResolution;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSNumber *framerate;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDVideoAttributes;
  v5 = -[HMDVideoAttributes init](&v24, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kVideoAttributes__ImageWidth"));
    v9 = objc_claimAutoreleasedReturnValue();
    imageWidth = v5->_imageWidth;
    v5->_imageWidth = (NSNumber *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kVideoAttributes__ImageHeight"));
    v14 = objc_claimAutoreleasedReturnValue();
    imageHeight = v5->_imageHeight;
    v5->_imageHeight = (NSNumber *)v14;

    -[HMDVideoAttributes translateImageWidth:imageHeight:](v5, "translateImageWidth:imageHeight:", v5->_imageWidth, v5->_imageHeight);
    v16 = objc_claimAutoreleasedReturnValue();
    videoResolution = v5->_videoResolution;
    v5->_videoResolution = (HMDVideoResolution *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("kVideoAttributes__FrameRate"));
    v21 = objc_claimAutoreleasedReturnValue();
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDVideoAttributes imageWidth](self, "imageWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kVideoAttributes__ImageWidth"));

  -[HMDVideoAttributes imageHeight](self, "imageHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kVideoAttributes__ImageHeight"));

  -[HMDVideoAttributes framerate](self, "framerate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kVideoAttributes__FrameRate"));

}

- (NSNumber)imageWidth
{
  return self->_imageWidth;
}

- (NSNumber)imageHeight
{
  return self->_imageHeight;
}

- (HMDVideoResolution)videoResolution
{
  return self->_videoResolution;
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_videoResolution, 0);
  objc_storeStrong((id *)&self->_imageHeight, 0);
  objc_storeStrong((id *)&self->_imageWidth, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
