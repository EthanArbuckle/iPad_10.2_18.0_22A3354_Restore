@implementation AVChapter

- (AVChapter)initWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7
{
  id v13;
  id v14;
  AVChapter *v15;
  AVChapter *v16;
  uint64_t v17;
  id imageBlock;
  NSObject *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVChapter;
  v15 = -[AVChapter init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_startTime = a3;
    v15->_duration = a4;
    v15->_number = a5;
    objc_storeStrong((id *)&v15->_title, a6);
    v17 = MEMORY[0x1AF43E9B8](v14);
    imageBlock = v16->_imageBlock;
    v16->_imageBlock = (id)v17;

    if (v16->_imageBlock)
    {
      objc_initWeak(&location, v16);
      v19 = _imageQueue;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke;
      v21[3] = &unk_1E5BB4A40;
      objc_copyWeak(&v22, &location);
      dispatch_async(v19, v21);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[AVChapter setCGImage:](self, "setCGImage:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AVChapter;
  -[AVChapter dealloc](&v3, sel_dealloc);
}

- (CGImage)cgImage
{
  return self->_cgImage;
}

- (void)setCGImage:(CGImage *)a3
{
  CGImage *cgImage;

  cgImage = self->_cgImage;
  if (cgImage != a3)
  {
    if (cgImage)
      CGImageRelease(cgImage);
    self->_cgImage = a3;
    if (a3)
      CGImageRetain(a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AVChapter startTime](self, "startTime");
  v6 = v5;
  -[AVChapter duration](self, "duration");
  v8 = v7;
  v9 = -[AVChapter number](self, "number");
  -[AVChapter title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(self->_imageBlock, "copy");
  v12 = (void *)objc_msgSend(v4, "initWithStartTime:duration:number:title:imageFaultBlock:", v9, v10, v11, v6, v8);

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AVChapter title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AVChapter *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  void *v12;
  void *v13;
  CGImage *v14;
  BOOL v15;

  v4 = (AVChapter *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[AVChapter startTime](self, "startTime"), v6 = v5, -[AVChapter startTime](v4, "startTime"), v6 == v7)
      && (-[AVChapter duration](self, "duration"), v9 = v8, -[AVChapter duration](v4, "duration"), v9 == v10)
      && (v11 = -[AVChapter number](self, "number"), v11 == -[AVChapter number](v4, "number")))
    {
      -[AVChapter title](self, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVChapter title](v4, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {
        v14 = -[AVChapter cgImage](self, "cgImage");
        v15 = v14 == -[AVChapter cgImage](v4, "cgImage");
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("cgImage")))
  {
    -[AVChapter setCGImage:](self, "setCGImage:", v7);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVChapter;
    -[AVChapter setValue:forUndefinedKey:](&v8, sel_setValue_forUndefinedKey_, v7, v6);
  }

}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cgImage")))
  {
    -[AVChapter cgImage](self, "cgImage");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVChapter;
    -[AVChapter valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)number
{
  return self->_number;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCgImage:(CGImage *)a3
{
  self->_cgImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_imageBlock, 0);
}

void __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7[2];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (*(uint64_t (**)(void))(*((_QWORD *)WeakRetained + 1) + 16))();
    if (v4)
    {
      v5 = (void *)v4;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke_2;
      v6[3] = &unk_1E5BB4638;
      objc_copyWeak(v7, v1);
      v7[1] = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v6);
      objc_destroyWeak(v7);
    }
  }

}

void __69__AVChapter_initWithStartTime_duration_number_title_imageFaultBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCGImage:", *(_QWORD *)(a1 + 40));

  CGImageRelease(*(CGImageRef *)(a1 + 40));
}

+ (void)initialize
{
  dispatch_queue_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.AVKit.ChapterImageQueue", 0);
    v3 = (void *)_imageQueue;
    _imageQueue = (uint64_t)v2;

  }
}

+ (id)playbackChapterWithStartTime:(double)a3 duration:(double)a4 number:(unint64_t)a5 title:(id)a6 imageFaultBlock:(id)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartTime:duration:number:title:imageFaultBlock:", a5, v13, v12, a3, a4);

  return v14;
}

+ (id)chapterAtTime:(double)a3 inChapters:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      while (2)
      {
        v11 = 0;
        v12 = v9 + v8;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "startTime", (_QWORD)v17);
          if (v13 > a3)
          {
            v12 = v9 + v11;
            goto LABEL_14;
          }
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v12;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_14:

    v14 = 0;
    if (v12)
      v15 = v12 - 1;
    else
      v15 = 0;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (UIImage)image
{
  return (UIImage *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", -[AVChapter cgImage](self, "cgImage"));
}

@end
