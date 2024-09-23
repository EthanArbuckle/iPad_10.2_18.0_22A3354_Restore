@implementation CAMTransientPairedVideo

- (CAMTransientPairedVideo)initWithURL:(id)a3 stillDisplayTime:(id *)a4 filterType:(int64_t)a5
{
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  char *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMTransientPairedVideo;
  v9 = -[CAMTransientPairedVideo init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v10;

    v12 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v9 + 5) = a4->var3;
    *(_OWORD *)(v9 + 24) = v12;
    *((_QWORD *)v9 + 2) = a5;
    v13 = v9;
  }

  return (CAMTransientPairedVideo *)v9;
}

- (NSURL)url
{
  return self->_url;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
