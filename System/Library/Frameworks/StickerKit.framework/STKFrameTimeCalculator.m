@implementation STKFrameTimeCalculator

- (STKFrameTimeCalculator)initWithImages:(id)a3 durations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  STKFrameTimeCalculator *v9;
  uint64_t v10;
  NSArray *frames;
  void *v12;
  double v13;
  STKFrameTimeCalculator *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8 == objc_msgSend(v7, "count"))
  {
    v16.receiver = self;
    v16.super_class = (Class)STKFrameTimeCalculator;
    v9 = -[STKFrameTimeCalculator init](&v16, sel_init);
    if (v9)
    {
      objc_msgSend((id)objc_opt_class(), "createFramesFromImages:durations:", v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      frames = v9->_frames;
      v9->_frames = (NSArray *)v10;

      -[NSArray lastObject](v9->_frames, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "end");
      v9->_duration = v13;

      v9->_lastFrameIndex = -1;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[STKFrameTimeCalculator initWithImages:durations:]", 0, 0, CFSTR("frame count and duration count do not match, returning nil"));
    v14 = 0;
  }

  return v14;
}

+ (id)createFramesFromImages:(id)a3 durations:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[4];

  v5 = a3;
  v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__STKFrameTimeCalculator_createFramesFromImages_durations___block_invoke;
  v10[3] = &unk_2505BD5B8;
  v7 = v6;
  v11 = v7;
  v12 = v13;
  objc_msgSend(v5, "itk_map:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v13, 8);
  return v8;
}

SKIFrame *__59__STKFrameTimeCalculator_createFramesFromImages_durations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  SKIFrame *v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(double *)(v10 + 24);
  *(double *)(v10 + 24) = v9 + v11;
  v12 = -[SKIFrame initWithStart:duration:image:]([SKIFrame alloc], "initWithStart:duration:image:", v6, v11, v9);

  return v12;
}

- (id)imageForDate:(id)a3 playbackStartDate:(id)a4
{
  double v5;
  long double v6;
  long double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  v6 = v5;
  -[STKFrameTimeCalculator duration](self, "duration");
  v8 = fmod(v6, v7);
  -[STKFrameTimeCalculator frames](self, "frames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STKFrameTimeCalculator lastFrameIndex](self, "lastFrameIndex") < 0)
    goto LABEL_9;
  objc_msgSend(v9, "objectAtIndexedSubscript:", -[STKFrameTimeCalculator lastFrameIndex](self, "lastFrameIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "comparisonForTimeInterval:", v8))
  {
    v11 = -[STKFrameTimeCalculator lastFrameIndex](self, "lastFrameIndex") + 1;
    v12 = v11 % objc_msgSend(v9, "count");
    objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "comparisonForTimeInterval:", v8))
    {
      v14 = 0;
    }
    else
    {
      -[STKFrameTimeCalculator setLastFrameIndex:](self, "setLastFrameIndex:", v12);
      objc_msgSend(v13, "image");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v10, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v14)
  {
LABEL_9:
    v15 = 0;
    v16 = objc_msgSend(v9, "count") - 1;
    while (1)
    {
      v17 = v16 - v15;
      if (v16 < v15)
        ++v17;
      v18 = v15 + (v17 >> 1);
      if (v18 < 0 || v18 >= (unint64_t)objc_msgSend(v9, "count"))
        break;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "comparisonForTimeInterval:", v8);
      if (v20 == -1)
      {
        v14 = 0;
        v15 = v18 + 1;
      }
      else if (v20 == 1)
      {
        v14 = 0;
        v16 = v18 - 1;
      }
      else if (v20)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v19, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[STKFrameTimeCalculator setLastFrameIndex:](self, "setLastFrameIndex:", v18);
      }

      if (v14)
        goto LABEL_24;
    }
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_frameCount = a3;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_storeStrong((id *)&self->_frames, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)lastFrameIndex
{
  return self->_lastFrameIndex;
}

- (void)setLastFrameIndex:(int64_t)a3
{
  self->_lastFrameIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
}

@end
