@implementation PageLoad

- (PageLoad)initWithURL:(id)a3 withProcessSwap:(BOOL)a4
{
  id v7;
  PageLoad *v8;
  PageLoad *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PageLoad;
  v8 = -[PageLoad init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = 0;
    v8->_swapProcess = a4;
    objc_storeStrong((id *)&v8->_URL, a3);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PageLoad;
  -[PageLoad dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSDate *endLoadDate;
  uint64_t v7;
  NSDate *firstVisualLayoutDate;
  uint64_t v9;
  NSDate *domContentLoadedDate;
  uint64_t v11;
  NSDate *firstMeaningfulPaintDate;
  uint64_t v13;
  NSDate *allSubresourcesLoadedDate;
  uint64_t v15;
  double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  NSError *error;
  uint64_t v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PageLoad statusString](self, "statusString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%-7@ |"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_uiProcessStartDate)
  {
    endLoadDate = self->_endLoadDate;
    if (!endLoadDate
      || (-[NSDate timeIntervalSinceDate:](endLoadDate, "timeIntervalSinceDate:"),
          objc_msgSend(v5, "appendFormat:", CFSTR(" load:%7.3f"), v7),
          self->_uiProcessStartDate))
    {
      firstVisualLayoutDate = self->_firstVisualLayoutDate;
      if (!firstVisualLayoutDate
        || (-[NSDate timeIntervalSinceDate:](firstVisualLayoutDate, "timeIntervalSinceDate:"),
            objc_msgSend(v5, "appendFormat:", CFSTR(" layout:%7.3f"), v9),
            self->_uiProcessStartDate))
      {
        domContentLoadedDate = self->_domContentLoadedDate;
        if (!domContentLoadedDate
          || (-[NSDate timeIntervalSinceDate:](domContentLoadedDate, "timeIntervalSinceDate:"),
              objc_msgSend(v5, "appendFormat:", CFSTR(" DOM Content:%7.3f"), v11),
              self->_uiProcessStartDate))
        {
          firstMeaningfulPaintDate = self->_firstMeaningfulPaintDate;
          if (!firstMeaningfulPaintDate
            || (-[NSDate timeIntervalSinceDate:](firstMeaningfulPaintDate, "timeIntervalSinceDate:"),
                objc_msgSend(v5, "appendFormat:", CFSTR(" first meaningful paint:%7.3f"), v13),
                self->_uiProcessStartDate))
          {
            allSubresourcesLoadedDate = self->_allSubresourcesLoadedDate;
            if (allSubresourcesLoadedDate)
            {
              -[NSDate timeIntervalSinceDate:](allSubresourcesLoadedDate, "timeIntervalSinceDate:");
              objc_msgSend(v5, "appendFormat:", CFSTR(" all subresources:%7.3f"), v15);
            }
          }
        }
      }
    }
  }
  -[PageLoad renderDuration](self, "renderDuration");
  if (v16 != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" render:%7.3f"), *(_QWORD *)&v16);
  -[PageLoad framesPerSecond](self, "framesPerSecond");
  if (v17 != 0.0)
    objc_msgSend(v5, "appendFormat:", CFSTR(" fps:%7.3f"), *(_QWORD *)&v17);
  v18 = -[PageLoad memoryBeforeWarning](self, "memoryBeforeWarning");
  if (v18)
    objc_msgSend(v5, "appendFormat:", CFSTR(" memory_before_warning:%llu"), v18);
  v19 = -[PageLoad memoryAfterWarning](self, "memoryAfterWarning");
  if (v19)
    objc_msgSend(v5, "appendFormat:", CFSTR(" memory_after_warning:%llu"), v19);
  objc_msgSend(v5, "appendFormat:", CFSTR(" | %@"), self->_URL);
  if (self->_redirectURL)
    objc_msgSend(v5, "appendFormat:", CFSTR(" -> %@"), self->_redirectURL);
  error = self->_error;
  if (error)
  {
    v21 = -[NSError code](error, "code");
    -[NSError localizedDescription](self->_error, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" | error %ld: %@"), v21, v22);

  }
  return v5;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (int)status
{
  return self->_status;
}

- (id)statusString
{
  uint64_t status;

  status = self->_status;
  if (status > 6)
    return 0;
  else
    return off_1E9CF54F8[status];
}

- (id)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  NSTimer *v4;
  NSTimer *timer;
  NSTimer *v6;

  v4 = (NSTimer *)a3;
  timer = self->_timer;
  if (timer)
    -[NSTimer invalidate](timer, "invalidate");
  v6 = self->_timer;
  self->_timer = v4;

}

- (void)startRenderFps:(id)a3
{
  unsigned int FrameCounter;
  NSDate *endRenderFrameCountDate;
  id v7;

  objc_storeStrong((id *)&self->_startRenderFrameCountDate, a3);
  v7 = a3;
  FrameCounter = CARenderServerGetFrameCounter();
  endRenderFrameCountDate = self->_endRenderFrameCountDate;
  self->_endRenderFrameCountDate = 0;
  self->_startRenderFrameCount = FrameCounter;

}

- (void)finishRenderFps:(id)a3
{
  objc_storeStrong((id *)&self->_endRenderFrameCountDate, a3);
  self->_endRenderFrameCount = CARenderServerGetFrameCounter();
}

- (void)startRenderTime:(id)a3
{
  NSDate *endRenderDate;
  id v6;

  objc_storeStrong((id *)&self->_startRenderDate, a3);
  v6 = a3;
  endRenderDate = self->_endRenderDate;
  self->_endRenderDate = 0;

}

- (void)finishRenderTime:(id)a3
{
  objc_storeStrong((id *)&self->_endRenderDate, a3);
}

- (double)renderDuration
{
  double result;

  if (!self->_startRenderDate)
    return 0.0;
  -[NSDate timeIntervalSinceDate:](self->_endRenderDate, "timeIntervalSinceDate:");
  return result;
}

- (double)framesPerSecond
{
  NSDate *endRenderFrameCountDate;
  double result;
  double v5;

  endRenderFrameCountDate = self->_endRenderFrameCountDate;
  result = 0.0;
  if (endRenderFrameCountDate && self->_startRenderFrameCountDate && self->_startRenderFrameCount)
  {
    if (self->_endRenderFrameCount)
    {
      -[NSDate timeIntervalSinceDate:](endRenderFrameCountDate, "timeIntervalSinceDate:", 0.0);
      return (double)(self->_endRenderFrameCount - self->_startRenderFrameCount) / v5;
    }
  }
  return result;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
  objc_storeStrong((id *)&self->_redirectURL, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)uiProcessStartTime
{
  return self->_uiProcessStartTime;
}

- (void)setUiProcessStartTime:(unint64_t)a3
{
  self->_uiProcessStartTime = a3;
}

- (NSDate)uiProcessStartDate
{
  return self->_uiProcessStartDate;
}

- (void)setUiProcessStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_uiProcessStartDate, a3);
}

- (NSDate)webContentProcessStartLoadDate
{
  return self->_webContentProcessStartLoadDate;
}

- (void)setWebContentProcessStartLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_webContentProcessStartLoadDate, a3);
}

- (NSDate)endLoadDate
{
  return self->_endLoadDate;
}

- (void)setEndLoadDate:(id)a3
{
  objc_storeStrong((id *)&self->_endLoadDate, a3);
}

- (NSDate)firstVisualLayoutDate
{
  return self->_firstVisualLayoutDate;
}

- (void)setFirstVisualLayoutDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, a3);
}

- (NSDate)domContentLoadedDate
{
  return self->_domContentLoadedDate;
}

- (void)setDomContentLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_domContentLoadedDate, a3);
}

- (NSDate)firstMeaningfulPaintDate
{
  return self->_firstMeaningfulPaintDate;
}

- (void)setFirstMeaningfulPaintDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstMeaningfulPaintDate, a3);
}

- (NSDate)allSubresourcesLoadedDate
{
  return self->_allSubresourcesLoadedDate;
}

- (void)setAllSubresourcesLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allSubresourcesLoadedDate, a3);
}

- (NSDate)startRenderDate
{
  return self->_startRenderDate;
}

- (void)setStartRenderDate:(id)a3
{
  objc_storeStrong((id *)&self->_startRenderDate, a3);
}

- ($2825F4736939C4A6D3AD43837233062D)heapBefore
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_heapBefore;
}

- (void)setHeapBefore:(id)a3
{
  self->_heapBefore = ($6139740D1C9D3B05F1AF21CE32BCE674)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)heapAfter
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_heapAfter;
}

- (void)setHeapAfter:(id)a3
{
  self->_heapAfter = ($6139740D1C9D3B05F1AF21CE32BCE674)a3;
}

- (unint64_t)memoryBeforeWarning
{
  return self->_memoryBeforeWarning;
}

- (void)setMemoryBeforeWarning:(unint64_t)a3
{
  self->_memoryBeforeWarning = a3;
}

- (unint64_t)memoryAfterWarning
{
  return self->_memoryAfterWarning;
}

- (void)setMemoryAfterWarning:(unint64_t)a3
{
  self->_memoryAfterWarning = a3;
}

- (BOOL)swapProcess
{
  return self->_swapProcess;
}

- (void)setSwapProcess:(BOOL)a3
{
  self->_swapProcess = a3;
}

- (NSDate)redirectDate
{
  return self->_redirectDate;
}

- (void)setRedirectDate:(id)a3
{
  objc_storeStrong((id *)&self->_redirectDate, a3);
}

- (CGSize)contentSizeAtPageLoad
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeAtPageLoad.width;
  height = self->_contentSizeAtPageLoad.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSizeAtPageLoad:(CGSize)a3
{
  self->_contentSizeAtPageLoad = a3;
}

- (BOOL)isTooShortToScroll
{
  return self->_tooShortToScroll;
}

- (void)setTooShortToScroll:(BOOL)a3
{
  self->_tooShortToScroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allSubresourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_firstMeaningfulPaintDate, 0);
  objc_storeStrong((id *)&self->_domContentLoadedDate, 0);
  objc_storeStrong((id *)&self->_firstVisualLayoutDate, 0);
  objc_storeStrong((id *)&self->_endLoadDate, 0);
  objc_storeStrong((id *)&self->_webContentProcessStartLoadDate, 0);
  objc_storeStrong((id *)&self->_uiProcessStartDate, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_endRenderFrameCountDate, 0);
  objc_storeStrong((id *)&self->_startRenderFrameCountDate, 0);
  objc_storeStrong((id *)&self->_endRenderDate, 0);
  objc_storeStrong((id *)&self->_startRenderDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
