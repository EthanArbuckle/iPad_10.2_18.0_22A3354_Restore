@implementation LPYouTubeURLComponents

+ (BOOL)parseYouTubeTimeFormat:(id)a3 outTime:(double *)a4
{
  id v5;
  void *v6;
  char v7;
  unint64_t v9;

  v5 = a3;
  *a4 = 0.0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v5);
  v9 = 0;
  if ((objc_msgSend(v6, "scanUnsignedLongLong:", &v9) & 1) == 0)
    goto LABEL_10;
  if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("h"), 0))
  {
LABEL_5:
    if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("m"), 0))
      goto LABEL_9;
    *a4 = *a4 + (double)(60 * v9);
    if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
      goto LABEL_7;
    if (objc_msgSend(v6, "scanUnsignedLongLong:", &v9))
    {
LABEL_9:
      objc_msgSend(v6, "scanString:intoString:", CFSTR("s"), 0);
      *a4 = *a4 + (double)v9;
      v7 = objc_msgSend(v6, "isAtEnd");
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  *a4 = *a4 + (double)(3600 * v9);
  if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
  {
    if (!objc_msgSend(v6, "scanUnsignedLongLong:", &v9))
      goto LABEL_10;
    goto LABEL_5;
  }
LABEL_7:
  v7 = 1;
LABEL_11:

  return v7;
}

+ (id)formatAsYouTubeTime:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ds"), a3);
}

- (NSString)videoID
{
  return self->_videoID;
}

- (void)setVideoID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoID, 0);
}

@end
