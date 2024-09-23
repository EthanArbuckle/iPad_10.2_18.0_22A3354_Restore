@implementation CKAnimatedImage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKAnimatedImage;
  -[CKAnimatedImage description](&v14, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAnimatedImage image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAnimatedImage image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "images");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  -[CKAnimatedImage image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duration");
  v10 = v9;
  -[CKAnimatedImage durations](self, "durations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (image:%@ #images:%ld duration:%f #durations:%ld)"), v4, v7, v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CKAnimatedImage)initWithImages:(id)a3 durations:(id)a4
{
  id v6;
  id v7;
  CKMultiFrameImage *v8;
  CKAnimatedImage *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a4;
  v7 = a3;
  v8 = -[CKMultiFrameImage initWithFrameImages:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameImages:frameDurations:", v7, v6);

  if (v8)
  {
    self = -[CKAnimatedImage initWithMultiFrameImage:](self, "initWithMultiFrameImage:", v8);
    v9 = self;
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKAnimatedImage initWithImages:durations:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }

  return v9;
}

- (CKAnimatedImage)initWithMultiFrameImage:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CKAnimatedImage *v9;
  CKAnimatedImage *v10;
  CKAnimatedImage *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v28;

  v5 = a3;
  if (!objc_msgSend(v5, "frameCount"))
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CKAnimatedImage initWithMultiFrameImage:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_10;
  }
  v6 = objc_msgSend(v5, "frameCount");
  objc_msgSend(v5, "frameDurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 != v8)
  {
    IMLogHandleForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CKAnimatedImage initWithMultiFrameImage:].cold.2(v12, v20, v21, v22, v23, v24, v25, v26);
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)CKAnimatedImage;
  v9 = -[CKAnimatedImage init](&v28, sel_init);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_multiFrameImage, a3);
  self = v10;
  v11 = self;
LABEL_11:

  return v11;
}

- (UIImage)image
{
  UIImage *cachedMultiFrameUIImage;
  void *v4;
  void *v5;
  UIImage *v6;
  UIImage *v7;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  cachedMultiFrameUIImage = self->_cachedMultiFrameUIImage;
  if (!cachedMultiFrameUIImage)
  {
    v10 = 0;
    v11 = (double *)&v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[CKMultiFrameImage frameDurations](self->_multiFrameImage, "frameDurations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __24__CKAnimatedImage_image__block_invoke;
    v9[3] = &unk_1E2758318;
    v9[4] = &v10;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

    -[CKMultiFrameImage loadAllFrameImages](self->_multiFrameImage, "loadAllFrameImages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "animatedImageWithImages:duration:", v5, v11[3]);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cachedMultiFrameUIImage;
    self->_cachedMultiFrameUIImage = v6;

    _Block_object_dispose(&v10, 8);
    cachedMultiFrameUIImage = self->_cachedMultiFrameUIImage;
  }
  return cachedMultiFrameUIImage;
}

double __24__CKAnimatedImage_image__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "doubleValue");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

- (NSArray)frames
{
  void *v2;
  void *v3;

  -[CKAnimatedImage image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "images");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)durations
{
  return -[CKMultiFrameImage frameDurations](self->_multiFrameImage, "frameDurations");
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CKAnimatedImage image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)scale
{
  void *v2;
  double v3;
  double v4;

  -[CKAnimatedImage image](self, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (BOOL)writeAsOptimizedBitmapToFileURL:(id)a3 error:(id *)a4
{
  return -[CKMultiFrameImage writeAsOptimizedBitmapToFileURL:error:](self->_multiFrameImage, "writeAsOptimizedBitmapToFileURL:error:", a3, a4);
}

+ (id)animatedImageFromOptimizedBitmapAtFileURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  CKAnimatedImage *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v16 = 0;
  +[CKMultiFrameImage multiFrameImageFromOptimizedBitmapAtFileURL:error:](CKMultiFrameImage, "multiFrameImageFromOptimizedBitmapAtFileURL:error:", a3, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v5)
  {
    v7 = -[CKAnimatedImage initWithMultiFrameImage:]([CKAnimatedImage alloc], "initWithMultiFrameImage:", v5);
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:error:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v7;
}

- (NSArray)frameStartTimestamps
{
  NSArray *frameStartTimestamps;

  frameStartTimestamps = self->_frameStartTimestamps;
  if (!frameStartTimestamps)
  {
    -[CKAnimatedImage _calculateFrameTimestamps](self, "_calculateFrameTimestamps");
    frameStartTimestamps = self->_frameStartTimestamps;
  }
  return frameStartTimestamps;
}

- (NSArray)frameEndTimestamps
{
  NSArray *frameEndTimestamps;

  frameEndTimestamps = self->_frameEndTimestamps;
  if (!frameEndTimestamps)
  {
    -[CKAnimatedImage _calculateFrameTimestamps](self, "_calculateFrameTimestamps");
    frameEndTimestamps = self->_frameEndTimestamps;
  }
  return frameEndTimestamps;
}

- (void)_calculateFrameTimestamps
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSArray *v16;
  NSArray *frameStartTimestamps;
  NSArray *v18;
  NSArray *frameEndTimestamps;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CKAnimatedImage durations](self, "durations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = 0.0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10, (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        objc_msgSend(v12, "doubleValue");
        v10 = v10 + v14;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v15);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  v16 = (NSArray *)objc_msgSend(v4, "copy");
  frameStartTimestamps = self->_frameStartTimestamps;
  self->_frameStartTimestamps = v16;

  v18 = (NSArray *)objc_msgSend(v5, "copy");
  frameEndTimestamps = self->_frameEndTimestamps;
  self->_frameEndTimestamps = v18;

}

- (double)timeInLoopForTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  long double v8;
  double v9;
  long double v10;

  -[CKAnimatedImage frameEndTimestamps](self, "frameEndTimestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[CKAnimatedImage animationStartTimeOffset](self, "animationStartTimeOffset");
  v10 = a3 - fmax(fmin(v9, a3), 0.0);

  return fmod(v10, v8);
}

- (double)endTimestampForFrameIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  -[CKAnimatedImage frameEndTimestamps](self, "frameEndTimestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
    return 0.0;
  -[CKAnimatedImage frameEndTimestamps](self, "frameEndTimestamps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (int64_t)frameIndexForAnimationTime:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  int64_t previouslyReturnedFrameIndexHint;
  double v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CKAnimatedImage frameStartTimestamps](self, "frameStartTimestamps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAnimatedImage frameEndTimestamps](self, "frameEndTimestamps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "count");
  -[CKAnimatedImage timeInLoopForTime:](self, "timeInLoopForTime:", a3);
  if (v8 == 0.0)
  {
LABEL_2:
    previouslyReturnedFrameIndexHint = 0;
    self->_previouslyReturnedFrameIndexHint = 0;
    goto LABEL_3;
  }
  v11 = v8;
  v12 = v7 - 1;
  previouslyReturnedFrameIndexHint = self->_previouslyReturnedFrameIndexHint;
  v13 = previouslyReturnedFrameIndexHint + 5;
  if (previouslyReturnedFrameIndexHint + 5 >= v12)
    v13 = v12;
  if (previouslyReturnedFrameIndexHint > v13)
  {
LABEL_13:
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      objc_msgSend(v6, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      if (v11 >= v24 && v11 < v27)
        goto LABEL_2;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v28, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_202);

    if (v29 <= 0)
      goto LABEL_2;
    if (v29 <= (unint64_t)objc_msgSend(v5, "count"))
    {
      previouslyReturnedFrameIndexHint = v29 - 1;
      self->_previouslyReturnedFrameIndexHint = v29 - 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = 134217984;
          v32 = v29 - 1;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Fell back to a binary search to determine frame index: %ld", (uint8_t *)&v31, 0xCu);
        }

      }
    }
    else
    {
      self->_previouslyReturnedFrameIndexHint = v12;
      previouslyReturnedFrameIndexHint = v12;
    }
  }
  else
  {
    v14 = v13 + 1;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", previouslyReturnedFrameIndexHint);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      objc_msgSend(v6, "objectAtIndexedSubscript:", previouslyReturnedFrameIndexHint);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      if (v11 >= v17 && v11 < v20)
        break;
      if (v14 == ++previouslyReturnedFrameIndexHint)
        goto LABEL_13;
    }
    self->_previouslyReturnedFrameIndexHint = previouslyReturnedFrameIndexHint;
  }
LABEL_3:

  return previouslyReturnedFrameIndexHint;
}

uint64_t __46__CKAnimatedImage_frameIndexForAnimationTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)frameForAnimationTime:(double)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = -[CKAnimatedImage frameIndexForAnimationTime:](self, "frameIndexForAnimationTime:", a3);
  -[CKAnimatedImage frames](self, "frames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 0x8000000000000000) != 0 || v4 >= objc_msgSend(v5, "count"))
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKAnimatedImage frameForAnimationTime:].cold.1(v4, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v7;

  return v15;
}

- (double)animationStartTimeOffset
{
  return self->_animationStartTimeOffset;
}

- (void)setAnimationStartTimeOffset:(double)a3
{
  self->_animationStartTimeOffset = a3;
}

- (CKMultiFrameImage)multiFrameImage
{
  return self->_multiFrameImage;
}

- (void)setMultiFrameImage:(id)a3
{
  objc_storeStrong((id *)&self->_multiFrameImage, a3);
}

- (UIImage)cachedMultiFrameUIImage
{
  return self->_cachedMultiFrameUIImage;
}

- (void)setCachedMultiFrameUIImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMultiFrameUIImage, a3);
}

- (int64_t)previouslyReturnedFrameIndexHint
{
  return self->_previouslyReturnedFrameIndexHint;
}

- (void)setPreviouslyReturnedFrameIndexHint:(int64_t)a3
{
  self->_previouslyReturnedFrameIndexHint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedMultiFrameUIImage, 0);
  objc_storeStrong((id *)&self->_multiFrameImage, 0);
  objc_storeStrong((id *)&self->_frameEndTimestamps, 0);
  objc_storeStrong((id *)&self->_frameStartTimestamps, 0);
}

- (void)initWithImages:(uint64_t)a3 durations:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Failed to intialize backing multi frame image for animated image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMultiFrameImage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Attempted to initialize an animated image with no frames", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMultiFrameImage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Attempted to initialize an animated image with a multi frame image with no or inconsistent frame durations.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

+ (void)animatedImageFromOptimizedBitmapAtFileURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to create multi frame image from optimized bitmap file URL. Error: %@", a5, a6, a7, a8, 2u);
}

- (void)frameForAnimationTime:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Attempted to play an invalid frame index: %ld", a5, a6, a7, a8, 0);
}

@end
